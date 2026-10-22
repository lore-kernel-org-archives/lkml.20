Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792687563;
	b=SfCf8Iqyy3HnPGHAEB+NF5GLtNdMb/XRPv5Pt5GcY+NVl6/2oxtoYPT9505wRLUfKtiw
	 UjUiAw/RGTNJNXjhIE7qmTiIXckec2DXuE7+//kQ/ROasYA0D5OHkODjgAZVzd7XmQ6XL
	 KGQNxBw0eJtuOVNm27W1hZFmCRmH0tidSqz4B5ZlhVy9+lZiMkn8GVKUk2srlerU08Jnj
	 /3akbdRjK3+i8ed/Cp1aOp0ndZnA8R7IrV5Jv/nKAyoKWxqGhkOyY0GBUdemYbetoxxD/
	 4oy+XQxFGdMe5i9XHz3Yai1qc77flPzQtTyCqGxuBOa0sPZdZv/Ad1P6zdpGsRkCQrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7QjbmIGCrtIQ6tCBoJIzAI0pejSWTsFGJkAT3QK1DP8=;
	b=Lxcj1VyDk7/1CN6L4chS31yUp/bi2FjFIdr4OSusltaLllVRDcR6sYHLdn3mvetRxD+h
	 bS55on2lsir1uw9f8jO079ypmAiuhySjlOssU3ZagVP7ov2/skVx1TJQ0+mfLjvPe1o95
	 vmt1aK5Y7rhaW/YhyxDgw5Cbm107vSuROxQLwd/s4PLFUhIAe+jpQZGNdCXD4LgZGySJR
	 9W57mukjii6PyKrG1YsUylJQhPP4jK6qNRTgyFKAfje9GcUJ9TEBWsGK6JIgegr01KveW
	 vlXESDhtoM1GNxjuhzsGXPni9tRVIfnrvNRvJ74D6rfTQUUZG4abfpRs4yz0eLr9Kow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M66QCxhz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C0606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8C0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M66QCxhz
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so3291717a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792687561; cv=none;
        d=google.com; s=arc-20260327;
        b=EZ2hwODRrCx7tOHCdGOU7YIuMq/Wqni/Z4DyWe255FCouYfXWnqBADRvow/6yp4sxa
         HhiqR/fMCOpqkSDasW4rRit3KUNtsi9h6RutQzghn7xkm7gNlkAf9/9JrwAB1+3kFpGJ
         yY07s8GY+AGE6Z89OzJTdUkUbo+LiF1F0Tu/dCdFceNtW1OKxmxrdNjW7ZM6xtYf6Lb5
         icF1+kZF/9Rh1CGb8w1r3A+uFDEdIgGPGUn58D1ljJB7/pO5jHgXX0mGb9Mb5QXQQink
         haJ5tsh6e8bp/bngmYg2VVhIrk5BGCWq1fIXq9Krd2OIemv02f5S0g4ls+wFcwU3g0ux
         3rfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7QjbmIGCrtIQ6tCBoJIzAI0pejSWTsFGJkAT3QK1DP8=;
        fh=5A3J+NolkeQHJlFgW+8h+Jj8+ePfPoPxPD8cPlKK8wk=;
        b=cqPa0T+UUhJacbov27740SermkN9KKNAPQcJpdiXZDERLRIPMHXXNCY0P3XEIgzOob
         vl2ENGLREqGD/ZVhE/W9X23UDgMfSCNi/Kg3MJ+xKIJhl16bU6yE+OyBfcKn8n7LVUFp
         iuqgVuiEPovlwXqR+a7uqrr3Rzh9+wHKNNSnj+GMMG5UohLztACHGa4Q+2LLuPAlYPnr
         6UitytZh/UN9jovlQQ5TGTgwnzKil0Uz6cLfMBXTMfuA07urEF66Yh+dV36N5rdl2OAV
         6so80s6ehV8tenBgPtSIj4LQmoVqLZ0ps4JdRAIjMQfu0oEPYDu8WNFXjs4dKM4+WT3f
         qoVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792687561; x=1793292361; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QjbmIGCrtIQ6tCBoJIzAI0pejSWTsFGJkAT3QK1DP8=;
        b=M66QCxhzgfUbzPqiJ9B/b+kTckyRx1hkamMEguvpk2hjSGiKeiJBuX0xS735bq2Dmj
         PhQfeywaq4e08BZYcqy9/KtlscEKHSVAs7ztL1FoZADZKD8w8UQWQRqM2WuWxphtuQbj
         FWO21f5APdGiFbQj3hGiraGvRPquXWeWLb8zlzomRQFsIQ43jmCxVWYOj00RN04iV7jl
         dNhhPJBqRvFoZWtzvVRtxhDd9EL+YJuxQ0N7WXMXBfNmd5FnsN9aVMR9ug+E0XcSeGFz
         1BNnDqLVJTksD8jHtQ2jmJssSFRiaVieF1/m5QofTNMcXEQE1mej6livTmodsAmhYWyq
         ajnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687561; x=1793292361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7QjbmIGCrtIQ6tCBoJIzAI0pejSWTsFGJkAT3QK1DP8=;
        b=rUXVtQB/bc18G1SAxg5X8WJ3v6sETM1FwBdYj0aZ8ftcVfbE9bcZbwnDK+1t3hSRU5
         j8McuM1dDKh0x8pSFdaz5K+abbGy3QC3OAh6dnHerSL1iZ4nMW2NeDpKqaOQLC9RwQ5j
         Y3/qojb8SkTpF2O+6wR/9IEs9zy6e71490OOhFiU6EPlX6QklsRgIW4w+r7IVB0idVF9
         dkqFJHIugENT/l9bpWBCQCHflPgGFSilBgSGFpd9O71drUQpK2hq3yT8cltiOPf8rxl/
         rSE2IHuUy05O5mZYaq9TT3v2hPduNtQgRqboOgI9KNqOFn9uSRM04yMZJZbTjd7vpZeI
         mrnQ==
X-Forwarded-Encrypted: i=1; AKwUvBySBKPVWiU2Qj7HSzjzxfXwFOIG7E4GsIc0K9y5qOwnQcjdgzIreCD8oFZKHeA6h8jtq/BWliQX//eH8CM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBjXsOtGr/lgSh6oElCh3FbtJhdu2ew3XSAKG+JQ6NJdGgtzrz
	k55PA5AhSjOh479Kw9v5qFofoXAe5cNWEmzmxx/TO4QQmYs2Mr2G7/eQteWzJiJtdmR8MXQ4HZ1
	zsRqxcE2IJEBUKA9qs1LhX6akIDdQD056eW1WoGjrrg==
X-Gm-Gg: AYBFou39D4cF/CUS3XlW484P1dBJLk65u42zpZGmF4zmpDNgCVxNpnT307qiS+GH59w
	S1PQ7XSCjlTkjwyhb5TL/CtwiiPL7vECGjT6qYkLwFyYf00WBWUf2XToL8LtbndEgQ/i07Wh/wg
	grOK+EhMJ1iPgm0S4Y7h+EM+X5lnH+VwKYi/tBHNYTeVbWci4JcRR6z/RYlYufU14aTSKEwWQqc
	/aAdUvBBLifxCQasVabHSK0Zk+Bib8p84cXqTpGLHXspKfv7NJk5rxp9RffRuSgVEkmnLJb491i
	Nic20xJccii4BKh+pRaKFbKWrtoOLnPUnp//6GFenxt2/kLz1NGZTciqg2LPW+dcXwpNgOAQ7UR
	g2tdf2cCuLOcFStOshVbFSMbKOcWVm1UJN+eaFuu3nCnQF1pLK6ye269f3WQxVdDGAvBkplU=
X-Received: by 2002:a05:6402:3606:b0:6ac:70f2:9205 with SMTP id
 4fb4d7f45d1cf-6b408ee83c9mr6292700a12.43.1792687561234; Thu, 22 Oct 2026
 09:46:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014103241.3847-1-sid9.karanam@gmail.com>
In-Reply-To: <20261014103241.3847-1-sid9.karanam@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 22 Oct 2026 10:45:49 -0600
X-Gm-Features: AclHuK-ugzsTcBNRw7i6zHWRnWRBooXuVu1JVUz_WJYFo6DEMNRW_AY2qU9QAv4
Message-ID: <CANLsYkzqS=aHojaCefeSyoWHe9cPS9YdMv1331Bm55JF5JmgZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
To: Siddharth Karanam <sid9.karanam@gmail.com>, "Andrew F. Davis" <afd@ti.com>, Beleswar Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I will wait for Andrew and Beleswar to review this set before moving forward.

Thanks,
Mathieu

On Wed, 14 Oct 2026 at 04:32, Siddharth Karanam <sid9.karanam@gmail.com> wrote:
>
> The previous version of the patch had a new header ti_sci_dev.h,
> that mirrors ti_sci_proc.h in terms of the struct decl and
> its helper function structure, with the goal of abstracting
> all ti_sci_handle's members like ti_sci_dev_ops from being
> invoked directly in the driver code.
>
> Lore link to the v1 patch:
> https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.com/
>
> Upon discussing in the original patch thread, it seemed
> better to combine ti_sci_proc.h and ti_sci_dev.h's structs
> and merge all their helpers into a single header. That is
> what ti_sci_ctrl.h aims to do: It has the union of tsd
> (ti_sci_dev) and tsp (ti_sci_proc) and both their helper
> functions are prefixed with ti_sci_ctrl_dev and
> ti_sci_ctrl_proc respectively.
>
> The goal of the patch (v2) is to maintain a single source of origin
> for all ti_sci_dev/proc_ops call sites. Any stray calls
> to dev_ops/proc_ops function pointer members in driver code should
> eventually be abstracted through this header (ti_sci_ctrl.h).
>
> In the future we can try to abstract tsd's dev_ops even further
> through pm_runtime, but there are some roadblocks that
> I am unaware of, so that warranties a different patch.
>
> Siddharth Karanam (2):
>   remoteproc: Add ti_sci_dev_ops abstraction
>   remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
>
>  drivers/remoteproc/ti_k3_common.c         |  21 +--
>  drivers/remoteproc/ti_k3_common.h         |   6 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
>  drivers/remoteproc/ti_sci_ctrl.h          | 177 ++++++++++++++++++++++
>  drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
>  7 files changed, 231 insertions(+), 218 deletions(-)
>  create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
>  delete mode 100644 drivers/remoteproc/ti_sci_proc.h
>
> --
> 2.55.0
>
