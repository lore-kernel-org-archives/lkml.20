Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256230;
	b=soOf+hFhxMXfyR518qz+culbYbS3yxGYSY7ZFJihdS+82v3qH+Il6Wc/q0Y7bAnGsPsI
	 6MFlX6Sd4KbiUNPYxVwroZ8I65AWdWrF7LrCzLlrVkdYDaLNmbzhO3pmAAWqXU0tfoSgo
	 3k8NlmidYIA2ml2jIu6iNRihBnRFL/o3oSu2gC+hkUPytaMtdhQmL4y6dbvJgW8E0Dz/B
	 2IhAcspt9SZUYA7GgUrRfPYu1E0BIZHB464zIKBMj06k6Xg3+BBwBwOb4nSIIEIJQyjRr
	 nvvOrqi5gMYyW7Q8xDTr9cf0lv1cQSnkV3f7HrPuqFeYrHlOV2gCJPsZCwVdl+tkx0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256230;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LYSppn+c8e5u6slhU90tGiZOtFKk/+H1GYWinE/YCks=;
	b=OjODCgy0h6DKa6nwzjlLfVn8a6dNW9HfMJ8bYmo6ufNs7lbTQ7gckrgQc1kZ9xyPOBuy
	 r04XNPK1Cb5FshRdbKWoVy3ZVK6H2U8KqBKePW7pMewOuCm/GfI52AEFJrtpryzm4W09P
	 UpzY0QHrQuyL/wVV09yng5x44C+8JhTLXcqCCauZ2BgvWnDClXqtvov9snVid7ac1d6rg
	 xxm5b51O6vBV+qsJ+1c8/zgBTH7nOHRTGdlV14hMZ8CYe0W2u0xoSxvnztTv5SvSt/um4
	 vpb/FThYG+yZVxmu18czW68sgR/T5knx4d98JTTRvTaEGYSfukqtv5VgAK/L5NRaL2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=ZjH5utAS;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Teet5Hsn;
	arc=none smtp.remote-ip=202.12.124.139
Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E5606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 913E5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=ZjH5utAS;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Teet5Hsn
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 14D6F1302126
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:43:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 29 Oct 2026 02:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1793256226; x=1793263426; bh=LYSppn+c8e
	5u6slhU90tGiZOtFKk/+H1GYWinE/YCks=; b=ZjH5utAS2CIm+N6ZzEunmjbfaB
	jhz9ts7I2sgJltgYFHi2Z4jPCcLO8e+W7PqTWTc1dDTuW3LeQHx+X6O183tPvyCF
	ePdueWqG8ujRpAsGJAd6k/zIJJriD64N7UjUM+jElD0KkR6jqX1udS8/xcVb1BUM
	RlawQGpC8Tj0LyZ0qjOBuf7NPS3tZ293ip/Mh2rc5wpG3hfLf3Cy/XQ6hgm4RORT
	HklArEfbuSQdCm/3lKMvETALUqadSmjgIImM/xyGEZm2qhZObg5YlLdEW1OxOYev
	Y9PkeSxvlOZbOVP4LsTBPBFCrMsxhdPiCaT6TLEPf469IHTvWF/7pZ6l+JIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793256226; x=1793263426; bh=LYSppn+c8e5u6slhU90tGiZOtFKk/+H1GYW
	inE/YCks=; b=Teet5Hsnckb6lm1pCbXvX4WOxuD5PtzRB2GetTnYXKxpT84YW73
	+a8bCgiFTwKJsVC7dRhK3t86gjC9h5sW0xz/Xymm5ENa0J5T/vGsI2W3HxbcK7GF
	3yAF+Ux88nN7oRF6S50uyJJnmiwzsJPOZGVY4xHpavmuz/e188QEUpzd+NEknDgz
	8pCWPaJUWWmLt21jXmpKEBhNI9ijcR6YUjAepodg44V2f0ub9qb4+zHCibHCdxNv
	zkLhtKheZTqBPOoOMUKXCJMR9P8SHeAwUmmBIQbN+G9HukGvtbvhzW1G4s8h6T5X
	lNxrV6/IbaJw9jsoMO1kgAUH/ws3LhFmuHg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793256226; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:TyLo0419NF9Wrrq7p9dfDvtdAW13oiJh3lNsOm1UHtsuH7Q
	VdPJuB52z9T4ztD5uLgSqzGZgg1gvNe7Up6NaXNOv8dxPCaIV9n1GdxkDaRl97fN
	Y8HH+aGDlTtCogsdrlr0offYnBBMqavKT1q6Z3Ll3gLBePK53w4+7+GtsQl/xer5
	9KY2KoeJwMr2lsYDbwgCX/UwufWRaY1o/XYjKobjqRRcy00B9BeR8M62z9+LFPl7
	LrdOqR52pnFuwyFVjJ0CUqGpHGOF7AoSQ/kPqxtmleC1UB8CEk4FI9/Ah48IT5W1
	iZKE0mD755IoDWCLBfmxc3Jb52Qemn1dlqQvUOg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:sNXm1VZHPLvxi2/PmVkw4u3FhZW7bm07fmgeKTb4hjY=:LYSppn+c8e5u6slhU90tGiZOtFKk/+H1GYWinE/YCks=;
X-ME-Sender: <xms:IuviaqMBY1oagLgP8jBpJuwzCqNWF2vM1_6SCBTSG2dWL5myPu9iRw>
    <xme:IuviapbrUGenXxyL_9Tlgd5ElNFzEjqnag59RW0zrdC2CAXMto0GK89vUrCt_59Ox
    z0jbX9iCtvQRbXVVcjoOw6h21LP2dgzoj1Cu4Pt_3yoTcS31AM>
X-ME-Received: <xmr:IuviamtWI8iperDNxA78ylItBUQdP0DvQG7tZf7bqz6m79bima_B9NXXM8G0e69URME-7RhzhK9ffrLTqD5x00lOoU-6Vo7yFZzoQNohGIQ>
X-ME-Proxy-Cause: dmFkZTGXI/sv7Q3ryCVVO7Xkbkb5CXjELT7BUMWJ5iydtxBy6d5IEU2kFOL1C3R3qccr0y
    cxFeikHBBYQ4oJ5QDRf88fxh5criWaOgLcLTynDQ3nCU63yAkfupVkGirzLHQOQvJ+pzKZ
    FkTU9agIFQ1vdeeo1rEotZj8YUCRvpbu2QY4zMPVrqwT3boHBPL8tcUvjNQYuQiji8d+lI
    4SRuenta5RYjFCtfRd88OnECiKwyD7WXLC7485injrQvGU4+6hQQpkovBRdYHVTcvLgWK3
    l0FBkn8daNvWgZP/Y43zojH5uPEbHh43NAJBW8KgYymW9ZKgT1yNI3lDm07GSaSohHW2Y5
    VW3G7JmtQPGUNJKMRC2eV/inWDyyheRirRxl+LwqRvh+GRuExXSYIqNYNmIwEEmw6nsA7Y
    FtZrJCnm61HbJC4CXX7daYadxsOFERsDL9OL8MbAXrNCLCv04t4jIttJncLSO2rFYe9GC3
    3RHvogfuY6uYy0eYCDSJZOdoMxZJqtCNWJem4HVA+KD+EyUJ1+HKSYgqWmxbQOKEUDuOau
    S46NyAY9pdt/JorF4bPSQDU6B0s0KCn76BqqOf4uTdWyhwLVxOxnYYlHXjbDlWciacnesZ
    QYrgOobiPctt1OY9D9zpgc7GRjN70m39VrUMTgpfBwgpJRW7B1GpAsu61/Xw
X-ME-Proxy: <xmx:IuviaopEjIGElkTtFCPE2t2DVD7aFg73Q26L5EIFQZP0HAj-BfW6FA>
    <xmx:IuviamSjPAE-z7mnIgpNL33jE6bTLUzZyYKeyEfWVKnn6SoT0c-0QA>
    <xmx:IuviatZwlm8lFD7cn5QqU3MIUf8nwVvNkKqv7G6w8EchDBZ_dHT0GQ>
    <xmx:Iuvian40eKwGlYmYUZWuZM9JeSKHEUZ06D3fLRHRTax6NQaBMNg6Hw>
    <xmx:Iuviaolo3xcF3g1RQw5hN6DBnCOZT28ZIp-v-4L_dHpaboqcWk3TJZeR>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 02:43:45 -0400 (EDT)
Date: Thu, 29 Oct 2026 07:43:43 +0100
From: Greg KH <greg@kroah.com>
To: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, brauner@kernel.org,
	dhowells@redhat.com, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, security@kernel.org,
	edumazet@kernel.org, ncardwell@google.com, lyutoon@gmail.com,
	tpluszz77@gmail.com
Subject: Re: [BUG] watch_queue: RCU/info_id overlap leaks kernel stack
Message-ID: <2026102915-safeness-snazzy-a36d@gregkh>
References: <CALf2hKveij_sHgANY9Aktm1dPa4wfKjKNkHyp9yPbjORWFXagA@mail.gmail.com>
 <auIbEZv5macfZ4aq@kernel.org>
 <CALf2hKty86GatQ01C30j20oa+TeVdJRvbX=a_+0Rga33woJ6Lw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALf2hKty86GatQ01C30j20oa+TeVdJRvbX=a_+0Rga33woJ6Lw@mail.gmail.com>

On Thu, Oct 29, 2026 at 01:06:28AM +0800, Zhiyu Zhang wrote:
> We will send the reproducers (including the complete exp for lpe) to you
> and the relevant maintainers privately. I understand your point that a
> similar reproducer can likely be recreated with a few LLM prompts.
> Nevertheless, Documentation/process/security-bugs.rst says not to
> publish a reproducer for an AI-assisted finding, so we are keeping it off-list.
> The same guidance says that AI-assisted findings must be treated as public,
> which is why the report was posted publicly.

The documentation also says that a patch should be sent which I can't
seem to find here, am I missing it somewhere?

thanks,

greg k-h
