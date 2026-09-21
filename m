Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A1A2C0303
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789951876; cv=none; b=AA3j6VB4pumIpkl+CBX45Zar4SEaSpTevatWq4SbqtyI+05FEnvl9JFyseDMxSK5Pj2ioIktkNknecyIShDu2POlk3qlMHUz3lWpvNXHYC0Q8mAidz7XKlIgvL/rCVS4LYPoLpNk84GZPuYEAIFQvbiHrqatrEPdnE/T89Lvj7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789951876; c=relaxed/simple;
	bh=kD4NNDfWBxjdHOUMWMPy/ZqiqBpF9OTHDoRWefWFDhw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version; b=CsTUkB1YurvWCHDapaLlX91WbyfnGdSK+xwkAD5p3cJu44SlstwBGHyMVLh3w1/b+01A7JQZXIdQvyXx8A53mdPxdihMr4SmYlhGQ4gGi50NpKM4Wx9MSND8sHoHwB72tUtZ/CBlrVBajzLeWQMFgPzzc2mPaMZjmBwoxXOzhGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl7Bnloo; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl7Bnloo"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f0135fso23263085ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789951874; x=1790556674; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rx47Jcw1toqcZofLN66BMlpuvvnyDfBPiFFok9YKbzc=;
        b=Hl7Bnloo3hTSlp5DKApi6O6/khP0fUto2sGGIfzg6yFIezNhKI/tbcbyg2QSd8TL7U
         B910mR5z68z8VwPDVEdUA1Ku0Pm8fJxE0ZPPCvD6h8OGy+0RAKV4EgeUqFFQlagIVIlk
         awDpo4F1hOJoYNoQTD12pH5uOI+DoC1pYlnm5MJt0KT87c6e+IWx04T5JFxhZauJ/W/Z
         nkgSr+9AURDns1hjZR8aTGgbESqha9HSmKC/a4gcM1G0iVwyzXYKP7LR4eE5+RP35PfS
         Z5WTSmaST5ny2kStpXuGUM8PqiSQq4Qdy0JsH3qjEMoR4sbJT90MykGDVGjS4XDI5CpE
         8v5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789951874; x=1790556674;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rx47Jcw1toqcZofLN66BMlpuvvnyDfBPiFFok9YKbzc=;
        b=0OSH4OCli+WtnPX+lu3FANbmLiAoZsGbRGpVcVC8Ft9PTneekZe0zFwYrhcGG+yQgh
         EW0jA6vc4X5bpTAkwZSs82/GCr9om7idRHG69MpDe+euzxMzqJVx1IbF7Z35F3jIX5uC
         DQMA1VbE310SdHpZc9/e85k0SD/u1jyTpHqyotggHi9pX30JNa+8kzT+z08fBhTbzUQO
         Zza1CW+lDiXY2pkKq9iQoi9SlW8GLX6/Lnc29Pa7Lnr9NXah1z+hK+BzPU8E4Z0hqDw3
         Z3ubp03ZWen0MeyZxemtC2U1H7GvWRo3YRZoMbILzENLxETl2yJW1hBQHMA+y9fVGR+B
         3Vsw==
X-Forwarded-Encrypted: i=1; AKwUvBwUpuBlgZt4dDtIZBkuuIhRXkAZbGB2STka9zNJcNEabWOrukBTgUyneizDjfOr8mQJL1DkYKqYujbNxMA=@vger.kernel.org
X-Gm-Message-State: AFuF++lDI967jr0tIYxTRHKYlRYEX/Rj5onBdq00O9EMlLG6Zj5CEAxQ
	XQAV24Vn4GMYpCei1XE0uOHl2SXmt7BI0NBEAYb3Mqru2DUtxlxP1Rkr
X-Gm-Gg: AYBFou3/NWRo0sIG6xbEejO2P7A7+eQLgOTWK/VC2an5XDdvRaPgyV5rb793fgMLVE4
	jYV1joTIpbDLS71BOq4giCPy1iUo60eSkoDIFae4NjJtmHkBEI3r8jmb9pPmMEIsuJ8LBrUQp/q
	TY2EptfU0U0uqadCFwACpNTtuWuKLGWiDI0gWgWPVc3F3bJPI9I43R1slkjJ6RM6ImoHJyYzikU
	wIPbIguffWTPtKGWcDoZgUp8lJ+L/z6yVOQiBWzf5MIkaXJq3xH166ghsBVjxd87m40T952C9QN
	t3z0I7NRYJdL2cqd3dM/xE62rXN7/HkKNyY0uXSWuhmLrvbx2OTMdyWecCjzaBPf6vtdfE0Ay1C
	nKYH6GQmAq1Mh9H9Gh20FGPNZ074IFpGm4T1Q71Q2sRYYfj/OZeT+bjBFBmrBJkcDEQKa9gJKIM
	NP5ZajCqc1l1LtF/QNYq+EihuE40CvDsT+mCd12Pbi+Dtgo9B55CVLLx8lRugl2i8ws3A/3VyCO
	uSDVhHRLlgP3QhED9zUz6PGjUq+mY2rxXMt5nN6fhIgoswtC42/oP9JzwhFxRqXywVhLZJTnXzd
	XsY=
X-Received: by 2002:a17:90b:134f:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e54d3651cmr14054624a91.22.1789951874205;
        Sun, 20 Sep 2026 17:51:14 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c379c4bsm11558903a91.7.2026.09.20.17.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 17:51:13 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 00:51:12 +0000
Message-Id: <DLKKZEHWGP2Y.2C0DPQW74COKW@gmail.com>
To: "T.J. Mercier" <tjmercier@google.com>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <mykyta.yatsenko5@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v5 1/2] bpf: htab: Split htab_elem_lru and
 htab_elem_pcpu off of htab_elem
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20260921002206.184660-2-tjmercier@google.com>
References: <20260921002206.184660-1-tjmercier@google.com> <20260921002206.184660-2-tjmercier@google.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, Sep 20, 2026 at 05:22 PM T.J. Mercier <tjmercier@google.com> wrote:
> -	if ((u64)attr->key_size + attr->value_size >= KMALLOC_MAX_SIZE -
> -	   sizeof(struct htab_elem))
> +	if (round_up((u64)attr->key_size, 8) + round_up((u64)attr->value_size, 8) >=
> +	    KMALLOC_MAX_SIZE - sizeof(union htab_elem_all))

sizeof(union htab_elem_all) is the same 48 bytes as before.
The round_up() part is an unrelated change in what map_create accepts.
Drop it from this patch.

[...]

> +	if (htab_is_lru(htab))
> +		elem_offset = offsetof(struct htab_elem_lru, elem);
> +	else if (percpu && !prealloc)
> +		elem_offset = offsetof(struct htab_elem_pcpu, elem);
> +
> +	BUILD_BUG_ON(elem_offset + sizeof(struct htab_elem) >
> +		     sizeof(union htab_elem_all));

elem_offset is a run-time value. BUILD_BUG_ON() works here only when
the compiler manages to fold it, and it cannot trigger by construction
of the union. Drop it.
