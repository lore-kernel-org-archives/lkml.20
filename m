Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F66274B39
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789308620; cv=none; b=eS+IxjikE0z95wYrvwxmayedkxv+/8koBnVcvcQb5efsUeF5mLGUcibDxLlQhVYsgkdqUMireycRM1fHLsQVjKtsBBLiCvlQH6csGDTPn4m7FcpTIHr9vlT3wTqgFzGShTqWBwgkeupf44h93uAzpX4Tclbt+nIX3auu3htTfHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789308620; c=relaxed/simple;
	bh=Kb3/g4LT6MAUmW+CxG6LzjSrSC29LS7/vliWJBavRh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spGkT2I5bBpCaJ6GH+bgNkY0n8Mp8CG6X5zuJSdqt67r4ZIpohqBFbywmYuHB2GLJmvEa/CzvuRtsT5oosbCCeJLcChWZgwiJrm+Zwsh2jDTxB0Ns+tF+1WNMcqd50UXf2VHUYSg4xeYdh9qkNFLGNQYDRLWr4d6MbNOdBNHXck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=i+J11+5M; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="i+J11+5M"
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 6F60F14C2D6;
	Sun, 13 Sep 2026 16:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1789308616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sziN5kHesZK0cgNCgNhSjvXI89zJwF9PE0JKRZ7sM1Q=;
	b=i+J11+5MhbjV4KmDSPlzNi5XgiR+yvHrShtsh/Absxe+FxkEqXTNB/C0NlXjOsW8w9YntZ
	V8njFfCRO+8yTs1Zaj7O9l/SiFJnAwB7ORL5U1D7WlJdJ5xj5DNAPQ3VEmSe9fpI6JxzPI
	PqHu+pg8XEGYXaWokzoC9pjicqpwwSohYaHBbla2GgGBpP6R2PhCtdZKORReFqs5p9q1Gs
	oEiioqbrecO6PWIOl8t+GoMP3sQvKm3llU382P3w1IdSt4a1fm1WcAHrhZcLqUvwwsEcCx
	tlVEZBg3Gcu2XZLAd2j2D9VEt3NlzxMS0qkjPkAGmidecxVSnDd1hAJf62MsNA==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id a8ed9073;
	Sun, 13 Sep 2026 14:10:12 +0000 (UTC)
Date: Sun, 13 Sep 2026 23:09:57 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: skvarlamatus@gmail.com
Cc: ericvh@kernel.org, lucho@ionkov.net, linux_oss@crudebyte.com,
	stefanha@redhat.com, v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org, sgarzare@redhat.com
Subject: Re: [PATCH v3] net/9p: add vsock transport
Message-ID: <aqautUJPkTMvmIGU@codewreck.org>
References: <20260709161741.15138-1-skvarlamatus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709161741.15138-1-skvarlamatus@gmail.com>

skvarlamatus@gmail.com wrote on Thu, Jul 09, 2026 at 06:17:41PM +0200:
> From: Matus Skvarla <skvarlamatus@gmail.com>
> 
> Add vsock as a transport option for 9P client connections. This
> allows mounting 9P filesystems over VM sockets without requiring TCP/IP
> networking or additional userspace tools.
> 
> The implementation extends trans_fd.c with vsock support, reusing the
> existing socket infrastructure. A new p9_fd_create_vsock() function
> handles vsock connection setup by parsing the CID from the mount source,
> creating an AF_VSOCK socket, and connecting to the specified endpoint.
> All other transport operations (close, request, cancel) use the shared
> fd transport implementation.
> 
> The privport mount option is not currently implemented for vsock and
> returns -EOPNOTSUPP if specified.
> 
> Add CONFIG_NET_9P_VSOCK option that conditionally compiles vsock support
> into 9pnet_fd.ko. This follows the pattern where socket-based transports
> (TCP, Unix, vsock) share trans_fd.c, while specialized hardware transports
> (virtio, xen, rdma) have dedicated files.
> 
> Usage:
>   mount -t 9p -o trans=vsock[,port=<port>] <CID> /mnt/point
> 
> Signed-off-by: Matus Skvarla <skvarlamatus@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks for the v3

I'm mostly happy with the code, but I have a few high level questions
before sending this to Linus (I'll probably take the patch for -next
next week anyway):
- I've looked at v1/v2 threads and I don't actually see any rationale
explained: what's the benefit of this over e.g. virito or xen
transports?
Do you have/use an hypervisor that cannot do virito 9p (or virtfs) but
has vsock or something like that?
- On a similar topic, do you have an actual server that works with
vsock?
I've seen I can test with diod+socat[1], but I expect to see a real user
ready if this is merged, not just "this can work"
[1] https://github.com/chaos/diod/issues/148


Thanks,
-- 
Dominique Martinet | Asmadeus
