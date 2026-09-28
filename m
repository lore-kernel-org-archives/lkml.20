Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1C3C3F75
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636257; cv=none; b=K+RouJsbhmMzO4fZZoqndLxobGIwVZKua1pjnBm22lo7mBonOwv7G/bfaTqtWhrML24KOeVu6J2KyzwkqAj13lMnPdK0uFVEjIvFfJfF74DeIWvuUp69kjYIotaGBilYypyjPnGv27Frap7dukmiHlIW9n/um85xy4yGzGgmCgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636257; c=relaxed/simple;
	bh=KvIECmyGNv+JyhEGbxoQPngo7GKO41e2jdsMoTW3yLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXqM6ZLxd04BjiAHk0IV1AEbyeTo0kAfpEnAUWGecszaVs+wB1kJj7p76Hrcbmhs/MCKqVMSxtcUSZQ013tmfLLPAjGExnUWc4v/eESwyqRgV7EHOnQtznWjjqPVZZT4xehTJDVzh0y93s22dYXngHrMXRugEB676jtcQmX9dCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=HTDlKs4w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EPnDGVJt; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="HTDlKs4w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EPnDGVJt"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 49109EC0079;
	Mon, 28 Sep 2026 18:57:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 28 Sep 2026 18:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790636255; x=
	1790722655; bh=61PkaDlZDJ7P1QuNFfmNjvqRJ9D4dCH5Jq/W/6WY35Q=; b=H
	TDlKs4wtX3RYkQLV3izOG3gsKKqQH+XaWNYl5uReBN2lEX7PXyGVX/IXKLNqa23k
	MHLdHW3fx+ZNMuMdxNuVhrC8GR4xUFj4YGx8mnIxbUDBrLLxgc/cNB8j2O8uVg45
	bbw1KC5SB6e9Pxzc4flvuzLuvuhf0dmNQgYXnCObsidVl+3U4faJwckF+98CIUZ3
	JB4i+4Id09QRD/ngr/LBeIJwxhWkJRUb2LLbRAFwaqBopodqBLuqARt99QHxkq/R
	ajutM0badQ74bhuWdoWosLRF2p5In0wGXHvYbf6tzRSxOf18nZHJwg6peo/8f6uc
	/9+XaiBxT+vT9XUOuxwPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790636255; x=1790722655; bh=61PkaDlZDJ7P1QuNFfmNjvqRJ9D4dCH5Jq/
	W/6WY35Q=; b=EPnDGVJtIgCFv1yAhA45AMr34ILU+t9vexBuqUsiRLSxXUhWry4
	FBuIIkDTylyW3rlqmEtXQSBvp+C1DiHe9zCN72BJ99LjFmSTEmkGZr61n7TP3Fum
	EvFb1dNqKB1hfGWQHHn3X1Y5qEDYz7xpumoweK4J7bgD579pzcuWbfyawURABh6v
	7AHgoRzg3LRj6cN7fCpiDrp5mq3qbcvKOhRh9+4jwowmC21zcf2F0vv+SjQTAvGY
	xGQsAxuP3+iVyXN2B6sgbnZI233i4/WdpA65WkTKyFFNF8fuEShY5Lbp/M2iQLmn
	3I/MJC26Sn6LYFWBZN6/vTUOoxsy+t3D7Ng==
X-ME-Sender: <xms:3_C6aoL79M7949qEVLbb64nICky69WKqL4IW9epMsQvUFeIBACZkcw>
    <xme:3_C6amEr-PfZ0fe_T25wWBfrpl6cEZUjN8z6In4lUTanQxgxGeVK4XdG0qLEYDTBJ
    ksVVNe1MmbYmFIg0NGFUcYwJiGzA4avRZvzRiZtTsUEofnpajr8oZI>
X-ME-Received: <xmr:3_C6agQc1pDIge7bCe14mgsG8shLBb8baFBkZIYoBwHcLE-_BamI9JVIfZ1zk20H-fyAYbp6Zy9nTT9w1285UG2HdXIV2V4>
X-ME-Proxy-Cause: dmFkZTF01flxN13qAheHF3RT0yqegHYRWFPtnv50THhZGirzVA/03FzZAfZZ1Kpnp6j3ip
    JMiyPopZMYa6pYlTMvgDwkyPry0BUf26UJTfZmrecZ6ZWpDIRxId+zjB7fs4e/mw9ftXWw
    6L0/X9ayKdiCywBn6JR58+a40NfOdQF5mADAucp6qSOqxTSGMwa+sSDbp5/kzenkKr1iGz
    1pVAiHiDiPmJiKeOCMDth4IIgUpJwIpIdLo/Zet+71YoAyjZJQK/flZczVyypzr11g66af
    H2ebwPkX9JtldpxD+4Qct9hyvtGMCKZjvOcfyfou+VQFe+twaLk0y1VpDQBOzgBIi+a1cN
    LAPII0JFZY9lQDFOZEVQ3rxcx+6dbOnYXYiKcXdXrSGianp6+ePvbdlQ6d1XQ8HfVZnJqx
    kTw7ktDqWox8Ja6EjQ9pCb7PARz1QRSZHsb8qQiArbvkgH/nf5lIF/JycStmKw/xv/hr3J
    +TdxkLYgQ7qhmWzZOA2lrnGraSWDThflEU1bQ7256rVfv5FRhXIImmFVq4O8DTGIwB0Y7+
    tK2S+6uCrev6n2WSn5TS9ytvdCZSmplDygccu+yUr3rnRGa3srTVrrFsbV+ALAalfPRlXv
    exQSm9onKSNiXHA+s+DlBGwnnme5TlnTcWKX6okYDkNkYoF+HmJXLcUZCcZA
X-ME-Proxy: <xmx:3_C6aiFxnfEpBSaedmkfRw0mV-StvjHok2WCyQBwwqc9hzK0QyvhRA>
    <xmx:3_C6as-DrRdE0p5VUG1B_eohpaB4tFVmhcby4jUjB7N8xW7JlxWm3w>
    <xmx:3_C6asIQ869SJtVaoFi9mo_OWcfAAdBI_vX4H6UX1WDnbPGuxf5Nxg>
    <xmx:3_C6avZ24i5SfbtWHd1lUz14RL68AbplessnvpwzWlfNmkgkfigOOg>
    <xmx:3_C6aq_1lh07HMPMxSq9cXcT54IdjI75GCk8RfBxjgkvQeHY9VLlQYnZ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 18:57:34 -0400 (EDT)
Date: Tue, 29 Sep 2026 07:57:32 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] firewire: core/cdev: use kzalloc_flex() to allocate
 structure with flexible array
Message-ID: <20260928225732.GB25983@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260928125718.50974-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928125718.50974-1-o-takashi@sakamocchi.jp>

On Mon, Sep 28, 2026 at 09:57:14PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> Some structures are defined with a trailing flexible array member to store
> data. kmalloc_flex() and its variants are useful for allocating these
> structures.
> 
> This series replaces kmalloc() with kzalloc_flex() where appropriate.
> 
> Takashi Sakamoto (3):
>   firewire: core: use kzalloc_flex() to allocate structure with quadlet
>     array
>   firewire: cdev: use kzalloc_flex() to allocate structure with quadlet
>     array
>   firewire: cdev: use kzalloc_flex() to allocate structure with byte
>     array
> 
>  drivers/firewire/core-cdev.c        | 11 ++++++-----
>  drivers/firewire/core-transaction.c |  4 ++--
>  2 files changed, 8 insertions(+), 7 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
