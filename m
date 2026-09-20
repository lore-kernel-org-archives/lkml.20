Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658771A0BF1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789888933; cv=none; b=oHnm7Z+dVO/6Qc8+KqfNxsVrhQA/DAuDfP3ShX/MOIl6kU3mUJdbhusDzXfwfcvMiGDKQrNyz1In3lPYkXdibsH0ntGA+1Q9/jESNaW7t6QvSJP5zJyvcCFp2H7RQF8m/QnsTnODNFefRlAWI5jlwHmA9UOED2M7hgHPbNVI9pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789888933; c=relaxed/simple;
	bh=NQZ55Av7uOIVkEe9pkkqbAUxYqldX882pKzQmMx2B3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NR9U5xT7Cr2TLQYYI2Fd6R9Hp2eBRENLc4WcbHoVabJkP3JDhbC8g/1xpEKMxtY2UBcBr7s/4pvUT9VhuVl/550MV+SMw91m6iRcOEt0iMqZm3PHOvtraq0SpZ4KWkTWrPKuTPuWHrmOfmNYJByKuZDCpkNF/m1uaoVT9SrbpJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=edquodk4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VsJHO5vU; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="edquodk4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VsJHO5vU"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8C8AF7A00AD;
	Sun, 20 Sep 2026 03:22:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 20 Sep 2026 03:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789888931; x=
	1789975331; bh=GiQRYVi0D6vLpe09AlGwCAsR6C+/4EeK2bUVdrMlrlg=; b=e
	dquodk40Hk5DVqGBSeK8pu692OSlr3jHTOEJeD+MyMcds2+nVuIrihys2vtFmAQ0
	dZqhhMIApIYLpvS7+rQjDNU6BwSYvt3+UQqO0K1sKNCqNsBBPJz3pkvZ1D64jwrC
	MAF4TcYZ+4Zuu8ob53iN5JmppeiB072oOk36wlxQkAqnNzBzPjk2/bO+ndUl6OfK
	mjepjgs7Qfdns6KkzOp9ygDCp7yysDdtQAzNUt9tBHyx+hVD243AT9qOAuJeEElS
	ac7i7Rg9z6brh+7Uw3hKxCpDAc0npm6BDHJtzNjcPbVjBn0kq0XgyxQctts2vxuJ
	Uo92ZtyFEE8bGyfZti+ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789888931; x=1789975331; bh=GiQRYVi0D6vLpe09AlGwCAsR6C+/4EeK2bU
	VdrMlrlg=; b=VsJHO5vU0OvWt59MHrhvNDagqrAsYvq1GlRt3/LNfe44PNcGseu
	G1Pccryfyy/YLs2i0/qUj2nE2hxHCei/g/qtRqDv+RWy8zekGYJUqIKm/jPin6wI
	BL2P0v59lzB13N/o+SX5dP8TsMT6pCW78d2eVSus9Tq3dL7sK342gA+Nt0ZBDUsZ
	4HatoplIED3/P1Iobfaa4q3aOSD+VYKOSyFge22TzDn8rf+BaQdLKOI00NHaT/B8
	gc9Mz4a2XXfpsV7qahhC+bXq+n4adjJhk/NKCyuNwq0whMRu2Sm7hjhcEhSG0LNe
	dcF0xM1MyaP4sTRbb+YZCPFrv+3At/1pvSw==
X-ME-Sender: <xms:o4mvalz_k8N8sbfrCjZPXYg4XCZCzftEdzEFdXB1Nu6VXLkozBpatg>
    <xme:o4mvajOrGpYhHjpfeP9BysGH8jNrbPxhmQbb1ETarrr1ry6mclYwIWY8aQ5IeRTfF
    OQW0uqcOnC0ebs_vqjINjlQ0G49MFAdFeKSPAFBY18l2pTvKhNVegU>
X-ME-Received: <xmr:o4mvam409dXyFNlUdfGJGeXBT5rQ4mdIHRJ6a1YU8XOhO1teHUgV2a1U-vhktATQgUl7d6OaNilGIiY0XgOkYgi202UqLw>
X-ME-Proxy-Cause: dmFkZTGvtZPE60XpRVIZYSrJOS3G8mDCPDFrWaqmkxXLCypMtM7GndduMvxXKJ8GXilgVp
    xEqwVtMpHXyfqtnJlrDu/4vGcRZbvVVRprfzNYjVL/srsHZV8Vc0UgCmmTlRlACoIcZsFC
    ImUtSPXGBES/AfeKKsrxzEsWjaRW9YEDcnr9e/A0tbd/0jVoACg/XBi6fJWEx+d3FHuKYy
    MEWs4MGC3o630q6Enj8K1CNv5H4H/IHNvjxiRk531Up+7IUmhorjGnu1PpMvXM9nOTpkt9
    H6QUKMD/Kh7Id+3FBgfwJTvC2e9gn8Cwtz457paOlATgAhT0zyfHsdKnRGXBSWzbCDNkUc
    txlLSkIOPP/CL6FIVj5XRVUf4B5RiXQKEMeV3HfK///cgTPzDW0pMt8bTTX/BhkkaTmbNQ
    9IkV6Ix4B/jAlSXmTftpnqQR7D9hykv6835816BF+9pR6Ajx4qBFhAZpOKOF4gpMy6/Lww
    H7TEfkelngszKfBMHxr+y5Rwmcy3Yi7759nIzLI7tThGU+O9+v7AP8pkmaREbInnL2HCXG
    HF7HEIt/M9HoyVavLvyOGjbLL2sem2HSNuXAD5zXHim6KWdCPVh0U609+eZwxOw50in49K
    RRxvEX6t2f6HDmeaDQFEtUUkoowwdOAdzga/qlfi3435WePEZrMBj38vGU5A
X-ME-Proxy: <xmx:o4mvakMSgr085bS5DJOIRQfODupUj3uKu9uEX_YvoLWotu1wrCzA1g>
    <xmx:o4mvakmrIlgWeVzuFw9Pv3go-MhJKwukcm9bHcM3jesqSwHFoYbcQw>
    <xmx:o4mvarR7xJOKAMLU3w2PQNwgQEEOZu8mePnSVJWMI1-yhwGHK_0vlg>
    <xmx:o4mvagBsOsiY26NgCNNeg8IvfRKbTxa4hHw-xAi-WnS4qt1LbFc2VQ>
    <xmx:o4mvatkvkxhXJ1UArx9AYXR1cb7xh6E-HKHhiMNyTKK4a_Ok92KcHKBI>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 03:22:10 -0400 (EDT)
Date: Sun, 20 Sep 2026 16:22:08 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] firewire: ohci: invoke all AT packet callbacks from
 a workqueue
Message-ID: <20260920072208.GA78337@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919115017.859169-1-o-takashi@sakamocchi.jp>

On Sat, Sep 19, 2026 at 08:50:12PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> For local-to-local asynchronous transactions, a shortcut is implemented to
> handle the relevant packets in the request initiator's context instead of
> queueing them to the hardware. This may seem beneficial since the
> transaction completes immediately within the software stack.
> 
> However, this has the drawback that the context in which the callback
> handler is invoked is unspecified, as it runs in the initiator's context.
> This makes it difficult to implement the callback handlers, especially
> address handlers.
> 
> This patchset addresses this issue by using a workqueue. All packet
> callbacks are now invoked in process context.
> 
> Takashi Sakamoto (5):
>   firewire: ohci: use workqueue to handle error case of AT
>     request/response packet queueing
>   firewire: ohci: use workqueue to handle local AT request/response
>     packets
>   firewire: ohci: refactor branches in at_context_transmit()
>   firewire: core: use spinlock without irqsave for card split_timeout
>     member
>   firewire: core: use spinlock without irqsave for card topology_map
>     member
> 
>  drivers/firewire/core-card.c        |   7 +-
>  drivers/firewire/core-transaction.c |  22 ++---
>  drivers/firewire/ohci.c             | 119 ++++++++++++++++++++++------
>  include/linux/firewire.h            |   5 +-
>  4 files changed, 107 insertions(+), 46 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
