Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182110;
	b=ra3+bvFICAU0F2k2cbRpl9fsYAj+Jhker8/ysY88SggTs8qtua4cyyfhCfm+aXSv5z1x
	 1J1e7vI32NhiJqnemXtCRZKGhW/s2VkyDi9iKJepk4Y6IOCNpo/wiMUHA3s2rs8NOi+lv
	 ZaM5JFFM5uZxJYU7iTOo6QR0IBtgArazwgamqOsnfdJAh+x1qKFP1SX3feek7qzH7yyOr
	 3cfB5iB2sg/uvDyYnDldT/EIklj8uTKNGalN9+JZ07c4Sg921gVwyEdkYnd5A08u9EMtH
	 pf7GRWb9kBEEuoNH4MF6Xo+EnTc0hcdZJBB2QlnEdDy2PSwHMXzXG8anrjElAPkqRXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182110;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=BpndL4iTPvg9OMSM6H3UrWIbx/z0vs888T4mTzoWqEc=;
	b=5Fro9cwmZZgSwu84z6x5okZFz4O1vQjULez05oGbIqpHjNI2h2ZL3qRzo6cP8NGJ2bUD
	 8hA/FowSdwvO9HoytFhgxOG0rHWN1V0fA8Wl+Cq8T/0H9iXvYFrMAyE9BwB8aTi4kPJA9
	 GCYDZyfkotfmy7slw67qsav9eofVrV5xhiLCr5x+CfzWeDHOlHcRfazaOVzDVug0F7bwh
	 NrQaKzmjHhBFiWY1+ck3p4gCHTpX/35uBoUYKq0uKTLSeNlyTTRZLGLIPfs6IiYL5Occ7
	 Jp8V1jmLv5UIVxqSc1CaMnodYK0je9qyj1Ot7xafv5/oivNgYqWOBdQjSSDi1QN9fNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b="b+rNV/1u";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Mw9Y7Jby;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1835606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1835606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=b+rNV/1u;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Mw9Y7Jby
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 5284A1D000A8
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:55:04 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 08 Nov 2026 18:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1794182103; x=
	1794268503; bh=BpndL4iTPvg9OMSM6H3UrWIbx/z0vs888T4mTzoWqEc=; b=b
	+rNV/1ui0AOHELpOlZTMNj+ewtUYIjwcvDZm/2sk5kvnTa0rb8UkhAVFdJLrPbiW
	vOWy4+sb6CwLfr+dpTWctz4k0T+AeVmtWv2bPllIZ6+I/s/9oLGf51M1wGRQvP8x
	+FNiS0Y5iUz8S73rmHyH6+QhXovVIamEcQf8JDeFKr0rWTt2AgdDMbYSjlApb45H
	TNhh9uxTDkt/xn4laTEftel30H225tj4NnNnH3ej92jIFjBctm08krRnuHmnr2y3
	Pncm20brCKV7CGSd6vt2gi7RQNVIGEJPrpbI7NHLMqQLSbWmyDArGFA8qHhDrmFk
	2yqYuH4JR46D0/eU5vnfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794182103; x=1794268503; bh=B
	pndL4iTPvg9OMSM6H3UrWIbx/z0vs888T4mTzoWqEc=; b=Mw9Y7JbyFZXyzkBiy
	Y+es4blFSDFO+lK1ag1g4F8m/ZIM7F5JLFQQ98EaN6H64ExuY2n1859z417feJd0
	fP7i1HoJspWM522eoUO0JlhJOuFhj/CN9M5qj8QZY+jxGPMPh+HU56QRIeiC9Syp
	DjpDqv1KgFB2TCK6SHbT1qv+KdCIo71RdmcxeudalondYzuBLj98vyhqKIKF5Lno
	TxIjWnQ/zngqv9p9gQv6xgrrEfA0D4nyc7vgR7IXCfrgHK7v7jX5IOAP+2vgX6CQ
	dJpTHQWKCKPY8Gwmj3tYTAwEPSJ9DjarKhxdxeDcb4bEIpfKEdkfTrjP/72gxQsy
	bMI8g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794182103; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:FDILif3HIzvGRskKe/Dp3Q/8CDLO5nlvxOlBfjNgmMW+HYV
	zfZtzZfTzEFgaIJvuveyYAPE9dBR96koc7pzmozmUYcs4oU19nDZ4JxbdCUVmjdi
	b1u36YjY5mEfv7NNfkgwKt/O06S5FsElrWleCK4GHfnm4HAW3ahksHPpRS+fGaSL
	4j2psZIPoM4j2GNtK262em3TIn1jyuzlHxnB/XPdba3xwKBxLAWBaCOg630OXN2m
	zjkXNsNsmi1HKzTiJGZMIJTlmo48oj4wt76L+3MspY/bC0/WiA0vOBIgx8GVv/4u
	9DPwYT+VnCMIdkZLzQn3UtK9M1fmtOPNBxO841g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:TV0oMHwgxZTxvC9kA6NQUdqRauUlF9WZ3y/3uZ4EOqo=:BpndL4iTPvg9OMSM6H3UrWIbx/z0vs888T4mTzoWqEc=;
X-ME-Sender: <xms:1wvxamVNdlKWVrIHQp-Zbe2rF0JLpGA7oc9Rn9gFkkPV8GV3lPZDYQ>
    <xme:1wvxakHcpNos3us5_OxNGfCBUnppLeHoin1INNbQm4oSitj7fQU6Bu-7PFw6tGgL5
    9S0i5oUSSc1xH5FYbD7dVWwJwUhcxhS34DvW1ZSVFviWxYL-e9zUrSR>
X-ME-Received: <xmr:1wvxaqfqFdXs-gPdw0j5ZU_c26Fp4I0qAyLdD3KtkoJH5QrYiGPjBHaxVlrxQglY>
X-ME-Proxy-Cause: dmFkZTEyDnw7Z7VWzhWex0tucN4MtH8vIB2allEtx2PrS/GGZY0nkqQBJE8oy6qoZ7f2aq
    CxMGjy7leTCHBM59/etU/naH5Lmf784tMvEcmZSGk+XWzl8O3T8RVYLJ4Q0cXcYWfs5xNq
    +YYr8cVmqi54rfAcbGQXaX9Y470AIhLpjC7EebMPrH71J1WpcbbSeX6soGaovm8QPmEc54
    83Ft5en6hEmHAH+Xu+MKtV5r4/yc9mPHzBIhBMS7C+oWKMhFARflilGEQ1nfynlX8qfZnm
    MdeVaSNy6vME6g9V1W35fZDr5FmX8AEfCh8U66eOXBSCiD5lpp0+fslTMZNd9ZBDy28QV3
    rnSrSg2unt/QDUq+bSERe9yo5ryQVfZcXsWe7QDfCX4bSJnVTbShz3Crh96jGw9v6WjjQx
    FpvNB6dmVzrMVNpFaTnf+AjDUE0+jI96hqrnVWzoXvdA+5VXBmP4P0JpusRaRh1wwI5n6I
    ERMaan5c63yMb85uDYQOWd0JaA43zqPEjOrSTz5i7sxJVCsfhmRx3rKFRg1iqNzvakXPLM
    V1BHXC3ozjN0FaG/0QV3QLtVGLe0CcnqpZ0qhY5CR2Lx0p8arEj+5ZRRwMsN/1IhMs4s7W
    1afNnt6PhpVRJZq4B0wVASu/HCgcvYsk5/R/Jb/KW8X/uz01/KNlDbC17B1g
X-ME-Proxy: <xmx:1wvxatJMF5O7XfGAnvjACmNkbH1LY59yidFfZFkEtUbE-J6xA626pw>
    <xmx:1wvxanGpwdMzxDMxtxgy2xrZj2VTzvRlVntH92ONRs8W7fT0gAqrHg>
    <xmx:1wvxaoDsTVFvNd-Bi3bUAeXjhgvXXR8RJk7UI2D0Zoflr-YHwvgcXA>
    <xmx:1wvxai8NbO-DVw1uaL5CGDmCf6IjrtbbHDVyh1dbUCcoDnPRyNqltg>
    <xmx:1wvxakAVX5GTPQa_UqbUnMtuavdKiDRRtR_CD7lhxUAbxFpjuyTXc4mt>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 18:55:03 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: linkinjeon@kernel.org,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH] ksmbd: check sign flag of the current compound command
Date: Sun,  8 Nov 2026 17:54:57 -0600
Message-ID: <20261108235457.1919632-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <IQLTi_rZrPgaD4zlFXgSybFdR3EsaBQVIorCAH3otR3SGOlNjacAL7jt2xb4mhqNNcdBMPel5CrrBxTOsKoRIFuil5wToLwoYXtR8AJ9vF8=@proton.me>
References: <IQLTi_rZrPgaD4zlFXgSybFdR3EsaBQVIorCAH3otR3SGOlNjacAL7jt2xb4mhqNNcdBMPel5CrrBxTOsKoRIFuil5wToLwoYXtR8AJ9vF8=@proton.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 08 Nov 2026 22:34:08 +0000, Noah Weinberger wrote:
> smb2_is_sign_req() decides whether a command must be verified/answered
> signed based on the FIRST command's header, even when dispatching
> commands 2..N of a compound, so the SIGNED flag of the current command
> is ignored and its response goes out unsigned.

The report is right for the request side. __process_request() runs once
per compound member, and each member's own SIGNED flag should decide
whether its signature is checked. I found no bypass either way. A member
of a session that requires signing is still refused when it is unsigned,
and a signed member is still verified with its own session's key.

The suggested change does not fix the response side, though. It moves
the problem there.

__handle_ksmbd_work() calls is_sign_req() a second time to decide
whether to sign the response. That call comes after
is_chained_smb2_message(). For every command except the last,
is_chained_smb2_message() calls init_chained_smb2_rsp(), which has
already moved next_smb2_rcv_hdr_off to the next request. The response
that gets signed is the one just built, because smb2_set_sign_rsp() and
smb3_set_sign_rsp() sign ksmbd_resp_buf_curr(). With the change, whether
response N is signed therefore depends on the SIGNED flag of request
N+1.

If request N is signed and request N+1 is not, response N goes out
unsigned. If request N is unsigned and request N+1 is signed, response N
goes out signed, although a response to an unsigned request must not be
signed.

This only matters when the session does not require signing, because a
session that requires it signs every response anyway. It also needs a
compound that mixes signed and unsigned commands.

I tested both sides on ksmbd-for-next with compounds of two
TREE_CONNECTs, on a session that does not require signing.

Thanks,
Ian
