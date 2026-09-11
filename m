Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173472DF156
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789170392; cv=none; b=fBvk3A1HZbdHxMppFgXWgZBHPvbEI95KNnqm2Bg5WugB1qAFrBqhsBPtquwkwCsWn7X1hJnmrihx+jXUArrzTsPHhqeFGKCKmzNg25rgweJS8RDBOr1RrSXdBq0tXmjsNTEZP3j9qYALNJZ6IMic/YX1xfhnwFGAPrHUwBfzuqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789170392; c=relaxed/simple;
	bh=BKOH5o806sKSJPcMQfho7ORjGwjZ5BvUs9Y6AWt8H6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3gSgCrsUJ8VcVJ4mzK0Qzp+MaRDnn9g7wl3la6rfTUyiiPZ7NMC4SVYeHSpR8eQy1fKgJ3cHLMNJgXAvM/YyYSC8oJWFO8nEVVuWiAWleiVLG6BE/eNwPJU7WoQnkS5syggZmK82ewFS/RZzPJ13u3zw9zMuuX7ulIpkUEjhfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=kk8CVfPF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fR04JJCl; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="kk8CVfPF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fR04JJCl"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BAE1F7A00A3;
	Fri, 11 Sep 2026 19:46:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 11 Sep 2026 19:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789170386; x=
	1789256786; bh=BCJXa8eRe2kxxTEnbv/AAYByeYsD0qX2EMIdfwE5rhE=; b=k
	k8CVfPFvAISUWydqGq4vPOIIDU0aEDwUXpT9eRsMhUTT++FqzyqICYpbwgkeJfGw
	RxF+aTSm6UAeaL6uxEqffe2CozMlQMErgf9fSsKYoyXCbEND5acWdEz2PP9wc7En
	/Xw8WWoZvjVQHaWpLonxPmDO/SVy5bSQL3eo6k/iDfhKj5+nKoJ63eaUx0/qJAn+
	tyvlrgBMEldndYm2Dq5MbOnm5t3O5d90/+fwbBwXQHTZKwpepbopyN2AunmN5xln
	+7wNGtXxKMKbsem3fdmI8JvJ7ElcfnObqnxru+VPOZszV7BCPfE6L+/yWAx5H4qh
	AqoU2m/U7xKi0oUcxSzrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789170386; x=1789256786; bh=BCJXa8eRe2kxxTEnbv/AAYByeYsD0qX2EMI
	dfwE5rhE=; b=fR04JJClfdxHxiYHYL5QNEVjG1H+368i0RuunIP1zyXC5ZJCU3f
	mmFRyC6IhidMXs0URNs0ljYq40oESw7Zll+8uWDazOz9Byw9Q4B2S2hdJKKDqwu/
	koZBNv4DqmZGMIV9zJfq1xZ0q0ZcM4q3o0+YZ1mo+oWo378m1o9OBbXrmH2j3cSU
	vVnn+AvLVA9Pnx69iDhOJqjV5r8L3kjbzrleCVwUmJOTqQ4DEVbtC9fTpxARdBdH
	D/o1c/JRoOq/FMYRnAQSapuR+Wb4XSmUq/PpvxAEwmbeN7+uu4Yf5PEt+gGZOcbU
	3cmXUQKYdK88cwpGQ7PJ6IFS6xCVvqk7wBQ==
X-ME-Sender: <xms:0pKkavgX-Aw1fsWMXShaXPIe_S4B5KBt7foTr1rxlwXZpUab6KD61Q>
    <xme:0pKkaoACg3RlS9kRsDoNXd2y1X63p_3cF7-FsO9d-ocHlB7cgtbw700Daw19TBS1m
    MxgZ50_bt1guk2G7Od9x7SucTMqoqwEIkGm6bcYYtqCiAfpzqbdGg>
X-ME-Received: <xmr:0pKkahRhyiB9iXZtPr397RChRdcrytX865nznk6aPMR-0Oe08jgFDmcjGzamLRahW4u41MbHHZRHd8rRUJjlPLyAFMXt>
X-ME-Proxy-Cause: dmFkZTEr0DfHCXKtVr4lw4BMxNsgojiLirVIU/SGEJ7uAcGkG8YvLAyabaB9C37r0i4Jy1
    0eGEdIJZTY/LjreLdGN/ivi1gQo7xP84j9XpmLVSu9IQkKn2P7RsMpmwdc0KEz1iEXpklV
    DftTSgem0CPbaxO4CYExjXEW0SVtNhs+pyUlPadM9LsYti+3vTODNQxcOQaZqzr/RAxrpr
    VMkfgH6N9hlBqP6VT+DKh4hh/cEwrGpQw0WAzddWbMZS5J5XqFE6dq7mbfMJWBO6OtGRd8
    ccfnZGMlKv30yLuh8XFYURZVHrK4YYQr9TR1ZwqAiZPCsV+nlHUxjgGI4Tp9aYFyL8UbaE
    me9G6utKUXh1KegQiAjKzOuXC1GXkxgIRTfy0SP7XjQEjfzrCCGOBlWdaxUppVWAHfkoJH
    oM2U18JyEQVtmfn4i2U9Wha9ntMUj0Y9NZZ8EMFSEy3AVzYVuhxJhau+6AYHq7V3N5OZUc
    kjjhJVpowMsUa7am0eroVo4cLUFGH4ZfqoRPa1BG7CONctwKT+pE8J2gKDgRAIg92gxh0d
    1DU/n5gPi2xFaREPmne3liRXvZ4QVSC/tc2YWTaUUT1lwvb9SjqRnC4UM3dhGchVLLhQOS
    8r27scd4LCyliaI8TtqOAw46UWZjk7WBLiJEYDu056LQKFz3ty9nrU8xSNLw
X-ME-Proxy: <xmx:0pKkatUth9JWDhs8zmY7_uAQlOM17eWg_vijWUKgFa0AxNbaYvY_AA>
    <xmx:0pKkaqe2NZQZynPfroeap_KnYX16FI_rkxeH_FdjzYP4VSzjL-jTcQ>
    <xmx:0pKkapKEeZ590Nd10EFAJMQmM-IN886Updquhxbma3BHE_-vkwWZkA>
    <xmx:0pKkavzN8PrLxxTIIGyP4FgUsJC4QVp8tVXwItlCGjDU06reM84sAA>
    <xmx:0pKkag5itcITN8PSK8Hf12TVUvWpLUxL9JZMl3pVlpTWQnYBYAHZXrx0>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Sep 2026 19:46:24 -0400 (EDT)
Date: Sat, 12 Sep 2026 08:46:21 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Dave Jones <davej@codemonkey.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Michael Kerrisk <mtk@man7.org>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: cdev: Fix FW_CDEV_IOC_CREATE_ISO_CONTEXT
 references in kernel-doc
Message-ID: <20260911234621.GA3306647@sakamocchi.jp>
Mail-Followup-To: Karl Mehltretter <kmehltretter@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Dave Jones <davej@codemonkey.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Michael Kerrisk <mtk@man7.org>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20260911222807.7673-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911222807.7673-1-kmehltretter@gmail.com>

Hi,

On Sat, Sep 12, 2026 at 12:28:07AM +0200, Karl Mehltretter wrote:
> The fw_cdev_event_iso_interrupt and fw_cdev_event_iso_interrupt_mc
> comments refer to FW_CDEV_CREATE_ISO_CONTEXT, but the ioctl is named
> FW_CDEV_IOC_CREATE_ISO_CONTEXT.
> 
> Correct both references. The misspellings were introduced separately
> with the userspace interface documentation and multichannel reception
> support.
> 
> Fixes: 7ada60e36764 ("firewire: Document userspace ioctl interface.")
> Fixes: 872e330e3880 ("firewire: add isochronous multichannel reception")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  include/uapi/linux/firewire-cdev.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to for-next branch.


Thanks

Takashi Sakamoto
