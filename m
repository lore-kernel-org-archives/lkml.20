Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791347;
	b=M02PcmbiesPKHbdY/ITzc77LP7ZHf9J5VDocaxA08WO6K58NiGNgXhTGMl3z4UPwZrHl
	 N6b3cb7DKcQielOiZvscG6npWIUpMTh2kIjHmvj297ugvQZhfIWRqCrehZqkjjCoijXTz
	 UQockJ16uaeLdtMb44j0kj8411saIRaCZoyb6V9YfRxjFqI2RLhXwh+6a7uUqLHd4Z4Dj
	 2CGhDevxArECzuF/RbTb03X7mbCq5jXLLG/1MIGxREYk9FLcdlgrUpnwg6q4WgvzZwOL5
	 S68rTTNOrCUi92UZ9hWoJtn03dphMwpavkOkakN5i3th/QCOuEB8+hd3GaD3CGlAUpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791347;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x9HL7dkyqYv0V/C1GQhkYAKlcyxmXWhsIbHn/6zULmg=;
	b=VBZ19S1J7NCqwq0Ophn4XBWsMpnrf7hBIchJfPgOeY4Ci98Zlp3/j9USGv8jZ1kenDzC
	 +a5cEbTWVV8IvUyNk/1UOpS+qtIByvyOPzViKOw2nleouXcZGbj0vWw+4o5oQeUMPyARI
	 CXxQ4nxOzhC0dUjjdmhpY7wBS0lEhrBCx2OeR20fFdClfYQrS1V58C0DBIPaxymQ9mQaG
	 QjD3RE9o+WRXHc46dMir1hBIVYfVRf88zJmKfqV2gihlhcm0dJkWYswlEhDAutQt0Rt1E
	 rC4dQcge2lK2uCnl0pU7oxYjsnh2JAveDyHHJUfU3QopKPEJqsNP4d98xGI77DmUFqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=PpFLAbZp;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="mgECulN/";
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D97D606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D97D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=PpFLAbZp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mgECulN/
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 80196EC0213
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:22:25 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Wed, 04 Nov 2026 06:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1793791345; x=1793877745; bh=x9HL7dkyqY
	v0V/C1GQhkYAKlcyxmXWhsIbHn/6zULmg=; b=PpFLAbZpeHa+UoFoZbK7CxHsCx
	2A9ErC8KFbhWiQ+ZxvS82ZpxtkG0tgzKc08rAi7EK34V4eYIjuK5b3KMKNdvR76L
	Up3d7NXP/udY6jrG0RD9ALsFoOEByobFBXPJ7eMViEXvDRqSfjjMxAi5Kt1Tfa3I
	VvwETCcdiBtAifvjvBSX3qRyhyj8B+MNBryrpbH4PppjBg7gZ3s8al+Qd1Zpq9IM
	DCpDIvhAe8LV86FQljkGlZTdfY07ncZgc4dKSZQ/0uH5tnrcYDtkUO5NQYFSZNhq
	DJCBZkx/JKZh0tSJsCWo/GDX2Dxecs25q9RZGBKKKEVKyDVW6F+U7gXlKZTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793791345; x=1793877745; bh=x9HL7dkyqYv0V/C1GQhkYAKlcyxmXWhsIbH
	n/6zULmg=; b=mgECulN/j+EDiSWvv+DvhLo6gmXznJ92NaxuQnwE/PWB1xRBr/7
	PmDk23gXrhRNisOMIgmUQSgZaGCfXuZQqtjEIO33t2AGCuTR3Ml5s4BAfJvlElpn
	Hq0zqkmAKHG1NMam3smkz0vvQDpQ0E1xmWtQfI0dH6Gr+Y7ToZy4rGeEsuJzwtEq
	RKYilfDQMUiLjiFoH6lOOpIIZEiHM6FZg2u40cfYWaObWaLSyKWx0PK5A47ZbGOT
	3C0fDDbWJe7aluhI/n4qAoD9mDkbJBCcKBLYSLA8tnki579/NLcHN/bJg4fwcOnU
	67njloSNomy85YM+wZFMTT1hSv2GV2XXkdw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793791345; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:GrG6uZfMv3iaLV0GihH4n7bkDlFs55RgRCrsnzMZ5CnXvct
	D/Q7O7HUTxeLyZOpTy5unDUJTNRNkAkNDcRTaQx4KEubV2hecsW90848yR00nV0w
	bJk/kb9Bpv+YdDRyMc9TmgW7xya0xf704bYgkdzkegvTDJJwdO64CTVXafWoShIi
	Ma4nejbg2RMzO2pCos4DUGrFpb32bQqPtarlCBvMBElbonVzYhgVHlYkJe+0MNxx
	YaXlg3EsH05xoVcNB4HYKyLGE1HCWvAFF7fLd1qstt1k9XPJ//D0yZGE4xo3X25f
	MzlUei3ZRXGUkIidmW2XSmjPM5EvshPKyuOm12g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:QCN3LiBIlY0NVyBtHrb6+DlspfwV3aoWRiZ6ZtiUwFQ=:rhr6zCOaF/GPqJ/0ERX/NDAgCdBxpZWt8X6dWJrcfsc=;
X-ME-Sender: <xms:bxXrauFt699vxJn_AQM-vF1R2yJ2FAMxi_S6e5EPxy_lYNjNVRkhRw>
    <xme:bxXrat2DwoOsNxGpli9Qsbp35lDN_Z433ETXArraqW4nIIA7DRjVyXE8zlwHlYDA5
    tb9tSnYUe7ga3yD1MnzFrjdG7KrwO-ap13OSRu1Q27RvgDIRQQ>
X-ME-Received: <xmr:bxXrauXr963qSKo-3aK1c-ElHcrmSaXvFS5x_GD0qtdgPKcFy2-1KcAvMgiJ9kVhsgT19U4cQV9m_lBhTKYarbluNw>
X-ME-Proxy-Cause: dmFkZTFbuP8b1pJtkj3zbyiSxoDvfG7DHPtkuM8qpipcJ1ioQ/fJWTXqg2nbcsvVEZyHAN
    gSCqx0616O27lPPnL3RMXC/Y4Wz7JcelGyB9zsoO5+mhB4K8DNRNnQSQSDFeIZefDAooDb
    /9hIAREYPc9xtXY5dNeOw26h472mkf9ZgP7ZgAvw6P2ewJyQRnSqqPPaxvr8EBra7Jd0CY
    U0DIhELUtmePWdEblKK3GalJwJ5H6m9tSrFanDT0b6l7XFf8gOdvZ3CBtjnAMGMJtio61A
    6Ua2D+Wjp/4QfTZVBwRGUKV2XHcyRSFM3RERTIV5Bs7PWkYfPREiL/xkKHZHxMdiMxP/iZ
    FzzSP9uYeaSoWZuiu2ek91I5UFud6Qz2pBNRHUGLY1mPbW5dJBB574ED2/DLO0YNz7sXcH
    jkJqEGLdli0dT9IeHsMtnxhFtx93+P7nhq/GdmW5wv2E59YWp0OTyfYSowgsvMM7LPoBnm
    cVj3YaPIBOYKw58CwvTfGi47UXd4tV3hTHE1nTqVeJOCKGTiEwB8jgZPgg5s7IDgHbMIFW
    syykAIuMT6ZfrmfzdL1u0jBuWZ83Z7rdfGJV50FTlhLquzmbIDTUR7iRW8uVbMwUT3q8nD
    Jw2TJmSc37AXF/RJLU5eWIiRM2KRCzlcnXpY8d1kZt/LxQpJW8LhedDLHxVA
X-ME-Proxy: <xmx:bxXras3a39q1nqnyAZBePR9RcHyuJomab2rkUUPN-BKib-SHPY91_w>
    <xmx:bxXraid2H-mle52yeqM6hPmhLmV2aoEqFascbvRJCcHL_daP6EyefA>
    <xmx:bxXrauReMXFkk7xK0nnUmznoSkjVoyaswz0S4KtTvpepQOyyjW13DQ>
    <xmx:bxXratmG4TIS5HqjNEDqn95kVMO-04OECk-gjWFeT8jOykoiF5inlg>
    <xmx:cRXragUcjpWOjbSsDJ-XyZKc4shrNnIJNzXr1t3w2z25yAoB2p36CNO7>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 06:22:23 -0500 (EST)
Date: Wed, 4 Nov 2026 12:22:22 +0100
From: Greg KH <greg@kroah.com>
To: James Morris <jmorris@namei.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Julia Lawall <julia.lawall@inria.fr>, gmonaco@redhat.com,
	ojeda@kernel.org, aliceryhl@google.com, gary@garyguo.net,
	namcao@linutronix.de, sashal@kernel.org,
	natalie.klaus@runtimeverification.com, willy@infradead.org,
	paulmck@kernel.org, corinnt@google.com, stewart@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	tytso@mit.edu, keisuke.nishimura@inria.fr,
	jean-pierre.lozi@inria.fr
Subject: Re: Kernel formal methods mailing list?
Message-ID: <2026110410-vengeful-imminent-fe3c@gregkh>
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
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
In-Reply-To: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>

On Tue, Nov 03, 2026 at 03:59:52PM -0800, James Morris wrote:
> Hi Folks,
> 
> I've tried to include folk who are known to be working on formal 
> verification for the Linux kernel. Apologies if I've missed anyone and 
> please forward as appropriate.
> 
> Several Linux kernel developers & researchers have been experimenting 
> with formal methods in recent times, I think largely due to the potential 
> of LLMs to lower some of the costs and barriers to entry.
> 
> Examples I'm aware of include a presentation by Corinn Tiffany at LPC on 
> her work with XArray [1], and Christian Brauner's linux-formal repo [2].
> 
> I've been experimenting with formal verification as part of a hypervisor 
> research project [3] (which is admittedly not the kernel).
> 
> I'm interested in learning from what others are doing in this area, and 
> sharing potentially useful findings, especially in terms of identifying 
> _practical_ approaches for verification of low-level systems code.
> 
> I suspect there's a lot that can be done on smaller scale, well-defined 
> projects, by developers who don't necessarily have specific expertise in 
> formal methods, but have deep expertise in the target subsystem.
> 
> Thoughts? Would it be worth setting up a mailing list?

Sure, what's one more list for us to be on :)
