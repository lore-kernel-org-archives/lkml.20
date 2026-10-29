Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793302849;
	b=HK9oggyLArmgti1AViI6E2Jl2jRif326sMXkZ+a2zsPKXWL/4NtnANRd85gpdOpnzDuQ
	 0RQW6wbN4YigrujFaCjqFsFdrWmDsOs4EBJ9kkrOHIi5vrQaeHYgNGfflMJWVSPZJXPuG
	 oOebpmDrz0dZxhm3d7D/R4Z4nex8pf/HeLUwYv+Rh0uKSnVHgefuWx8UGXvNhg0VOdsU1
	 S7Z9qc/snuIQmYttWop8ab6WYaEdSmjJFxHRwDLRMg+QtNqTLKWegERPJvTaddts96MMI
	 wz33FiA1t6B6O+Z3D+IbDge30B1tfMMT52/tqWrz5c914B9luHBVakxCSaGqEysVYjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BI99PD+ATh1Y5+RSlEwKFF3tajPLYbWsXiWu2yRi084=;
	b=vcgz4cuJ3XDnbCJqbH0Lk6cjA7tpR8449kT0Y4lO0Lo6KnBTV+UpsM37myTGtcSC25Zz
	 0/LZpOJhaOa06nq2Ybx0zb0oGKEpsAonFBlxZtNH+ChqJfZM3Uro6NA0mOmn9BN673HpC
	 8/R64URS8jd0Y5vz7okRS75VjOJmYKNiDN5WC854ggJbuQfsSsw5C/e51iOgNUEtPZ2dS
	 thcySNC4I7sw+idVlmwyNVNZZ/GggeNiGYh3CW79evp5GDUNOyvhhbbSAdpa+kh+wTI7X
	 4jyoNQFwpRFrCzfSqjWYHRTeIr322s9x5xns+X7ZnE1yOwJXujj0WLYxvD6cb1Hj9HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oy04HEx4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C193606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C193606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oy04HEx4
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-843a4ca671eso19595a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793302848; cv=none;
        d=google.com; s=arc-20260327;
        b=OkV2mWdXsmGBUKLslLKVfDiI4h6VHiQNoPj41m2QuJkEhsdKWtFCvwopfpHv7dT8Zr
         ecvEbGLEPLTkyIlbpzJorIJNvV4tDEPnJLWsKhHkq52UcVB3dXpBmLq/YNXtv3YgCmc/
         ZYJx+zg1DNBXBzLOs3whx02ewe9s7nnWS83xjNWXWFQx+F5Pu4uUCxYKjrbHEyREafcC
         FErsdhywvondZNloPajW9N9tETXhPH/0l0ivGECyHtdMTcM/BaWx9oi6y5hxk83tXEZu
         1kI52xolJDeoL4+h7MeShsCwRQ43Oxna2wGj3SVKSw16txAbCHQPnhJtwyx0hS8spLHK
         vJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BI99PD+ATh1Y5+RSlEwKFF3tajPLYbWsXiWu2yRi084=;
        fh=bBNmS5u164lok2wQmMnEm13Aboo2MdKY3VRHvpBSUHc=;
        b=MoOhTLH/HGwZlbsOEgc0M5ePx13faj3xQkirsgpOFuQBdzhcNmDjBCgkA1iRAsUzgU
         DBUX7R0BieLrvuD36okTpxBfEENqUzUmqLbemPmZljkcCRx45GcPuEpks08ke6MPXqd6
         qqhntQoSl0iVMK7oFk+IwBMvbGxGPeKpVc5jUMeAGXF3aNa9/faNc/mYskGhbUa5BEi5
         3uIWpltGAjACNMkfOytazmCM2362+dcPKGMn18mRqdrnlYzIJ0LB9D9guAfSCpSwox9z
         JWsCY4eZZMHrO1vmLH02L6whFAxXd97e/gsbHHRbQ0iuGz2bA68sPWRbXqi+HmXrU4bs
         2+OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793302848; x=1793907648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BI99PD+ATh1Y5+RSlEwKFF3tajPLYbWsXiWu2yRi084=;
        b=Oy04HEx4VXsy7bnK+jxK7wLwJKJgZjMD+ok02/ElUmFMcCdqOEpl4CNxdWoxJzIhzn
         U9RRGRt6Otan88a2NMxx9hAn+vJiyjDSutvbDnQ4fcfybjPlhxmIxNbVjs5s10zwcK92
         qYY1ODXDGpBmd69+yoWLRWbNxPvInfpeDY8XkeJeCFG0nCIscbu6LhWZlJFfvgNakjJP
         ggb9DU+L4K0N5slxw86nSUklX444AEIO8JnQXaH1vGuPc4coVKJTwqNt10udSvszwDnM
         Mh0X5ZLVObaRXY/xgb7VXOmvBk9Hv7hm3jm15v6zxqOE4mkNYW3VpvNXXZHhE1kT1t1/
         7jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793302848; x=1793907648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BI99PD+ATh1Y5+RSlEwKFF3tajPLYbWsXiWu2yRi084=;
        b=ViTNsSfEyyY+46vXExdd1w0qvTT/7x/ow53/owbWCjA+uZ3GvFAkZgNvIrIIIF4zjh
         6szJF0UW6+QEav4UNRJucoRCq//y+TqW+BqOOCHJZM/bBmd1wtYEOuG1P1U1ywETOaZT
         B46tSjMOGy93VJIbLAfBjYl2NiaE46Tc+hXI4oEEJTymizx8mtzEGwrzxLfxu96mjNJB
         zaN4H1bXwC2sCq7Sj+JBwK8HrCgWkeXzpv1PuD0kkadlaRM/HGU9+LN4/WjYFLfswt4e
         fS7GJDPNzp7h0nMuPmFbjLZVUYjN1bevaLfmJVUoAqdGm1zFpugjDmfy8b/3iChJrfF3
         Am4g==
X-Forwarded-Encrypted: i=1; AKwUvBwhCl/9o2ZBhUbmGUjxVQqH73eoxsh+8ZdmJHY06JrQAM2C9zDoNtZxNotgQBANutIU1F9clmoAmPdoP1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGetpFd7JeUcdzrpns2g+P/Ly5k9q8MrOU9ZoRT4A8bZGXJXIN
	fIB2SUBuedjFEYLegUpuTqNqYglJnlWKVcn9mwqdX1kFcRyMJtb37KaT/vTB+m1CFQxJr7SkVHw
	hHU9ZrncL7xeAEWOVxWlHutLLlFwCVm8=
X-Gm-Gg: AYBFou0x3u9N0oH1bpdxv3JTgkhTOqxCJg+6yjdH4p4XY3u27TUviU8nz/4+gPYha9V
	x3UAgJklx6pcB3AFpOttDLu6eWyRLtP4pAQC6cIDDseLKA9YEkSMKZpRD3bWkTeaxrI4cY9q7a1
	STQO//Iw+Ty7XoUTCQoe+j4IyaEtWSL4hM7z+dzBb9Ro+r8Ix4R5HHIFIFT5JuruLo3GqBwuqx1
	URVTEa0mluBPEtWMXztlsbmOm/L/k6jVFE9iTfqwAgmL3tnYsnxNIm3bvhYtI3GNEe3Pl0qgtyl
	nUw1HLcbmcjyybV42gyjUTjfJXhfVUTl5zC+wcvDrAV6+N+UIbNZoO/woDasLWkpTvHbFCxWuDV
	3ZESD9/OFw/DBXvLqlLesUurf4qz3WxjtyXdjng==
X-Received: by 2002:a05:6830:4391:b0:822:95ff:43f3 with SMTP id
 46e09a7af769-85d3664ca3dmr142180a34.24.1793302848352; Thu, 29 Oct 2026
 12:40:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022163639.2566945-1-andrey.misyrov@gmail.com>
 <179303675173.3134.11217955296529787762@kernel.org> <CADvbK_dTUCUFn+sLY+zuN5_9+YC-axzM9FVr-yBKJ4jxwebkkg@mail.gmail.com>
In-Reply-To: <CADvbK_dTUCUFn+sLY+zuN5_9+YC-axzM9FVr-yBKJ4jxwebkkg@mail.gmail.com>
From: =?UTF-8?B?0JDQvdC00YDQtdC5INCc0LjRgdGO0YDQvtCy?= <andrey.misyrov@gmail.com>
Date: Thu, 29 Oct 2026 22:40:37 +0300
X-Gm-Features: AclHuK9ZvCDg2n35I76iYH83HI7jntHSzE-MkCUSpArWzEKyyvJVxDkcplmhCjw
Message-ID: <CAC=piAqJCtKEn=jLaoaBCr5yAgF5dibhPYcrZGWPytYN=Ct8cQ@mail.gmail.com>
Subject: Re: [PATCH net] sctp: fix ASCONF address change on single-homed hosts
To: Xin Long <lucien.xin@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, marcelo.leitner@gmail.com, 
	junvyyang@tencent.com, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 27, 2026 at 01:38, Xin Long <lucien.xin@gmail.com> wrote:
> This looks like a legit issue. Either way above works for me.
>
> Thanks.

Thanks, Xin. I've prepared v2 and posted it as a separate thread:

  https://lore.kernel.org/all/20261029193454.1028626-1-andrey.misyrov@gmail.com/

pw-bot: cr
