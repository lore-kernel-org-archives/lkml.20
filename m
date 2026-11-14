Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794691147;
	b=UTejzVCYLOrTRwGOOfOulf13L5oMbp+qLj0nesnwDvld29HUYeI+1EYpfKOpp4yNMJZT
	 F9u6MTAgd1gtXXJ26vKZugPXbaHecZaasH37IL/kd5efDKDL0XtPoSTF+1WKdrqgas37T
	 UXdz6RHyz07HGH30JSETOAJe0mdXy66mNNrZMMDG02bsAStzI1APnGew3y2HDM8MnwA+l
	 E1YYVRJLa/cnkIndgiXVySgKDqdhNpqjAeRsPrXvjHi4XFAHhZQ25273pVEMB7tvu15z7
	 HJ8vfd5mmYqI5zzXJF9tCHONku/Fb111oF46c9otYnWCUvwUfcmjgVVEaSn5w5Trepw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jicOixy8WojTbeyefnlFqHoPsgyXZ7JZdBPs4flDM5E=;
	b=XHkjFB0BG6VXNUDD7Yw4R1r8tRMOfyIxpyaWgZ0S1T2B8MwSFcKDJn89SmBFhYztyefP
	 JtUNyExNzf5GHTKQ+ktitEHqXaD7xgAX3qGlvIfvlFV5MBfEFAJy4z5jTTnu6+smI7gI4
	 YGFXXdqBc8S8lppvXV9BkGzyXeS6ykE071bYwFMlUp6n8XGNEoHMdNBc+rkOzzUbUN9Wh
	 7FAW/kJb54stRU2VIKPdPWnTemo2YDBnhMDS8IKWYgaNmBeqbZb3p3TvaeHmHm8nDFxyw
	 ErTjXeLhDsAvybOu5MRB3ej7zdodlX7UoSVLk3dSIr5oiQo5nQL+SSucKOsYRHUahLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dqXLinqo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A3E606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16A3E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dqXLinqo
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-949589c1495so176090685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:19:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794691146; cv=none;
        d=google.com; s=arc-20260327;
        b=bGjCI+8HNAG2SA3GRKk0UpilIGdyjYTIRcKcxa1/MOhwu8DmLBgke7y/ewnR6te9p3
         u1LkMuKk4kDkUyO1PG/TQBuUrWZ8p9h7PqENxMZgcWrzwRKwpXchwsGjJcLbvMWq9cjb
         8pVG8ihQbqjAessposuQL5PA+3xUqH7iQIKT3OW9wAzWldTNIEoDKcgYly7veuPmPZ9R
         +81QeWFwHMKBZUVJtBfmZ6xoM7cTc5W5r+jqq/CUjCCXu2C8vCqP5EJ0R7NW/7/UlbNJ
         B2+hDhYjKgTkeQH54MhMQCkTI3nQwjsGpCVICU58ff1TLWijTHzs6tHShacU0/sRXzFK
         gLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jicOixy8WojTbeyefnlFqHoPsgyXZ7JZdBPs4flDM5E=;
        fh=JLG9mrBLtXUnuhkkmThkbc919HJ+WEzY0FR4p22psI8=;
        b=dcOXIdbG5ZvrUQ91pMMsWQtDdb6+TqLXi5fY8AN975S8DlRdLJ15zHVpnQBPDrc+L9
         02ewi0GZD1N7JkFGtGCBX/mL+FvdINUNQbvHpzOkKJojx3xD2GBXLzybBy6pvAG+sI55
         wVeOHSpj+regoMU9C7gBWCPmWvOWTH9QG/wriqzbd9NtGtYoZc9K+NI2yuTD/vEGnLpL
         fkzXRc+YcJAZoLmvVyHeaLZRNo00xOiF461T1vpbji3bdTKJ0XZ62ut967RrdyAe4yTJ
         QeP1Bk2LUdUvEfovPa/2u7P5KZ2xOij/bvNNUtU4n2oW6WlZd3ZYTFTwy7rvpkkIhUcF
         sJGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794691146; x=1795295946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jicOixy8WojTbeyefnlFqHoPsgyXZ7JZdBPs4flDM5E=;
        b=dqXLinqoV3D1GaO5v3E1Izd5SIIeqOHvJWw0UCGVwI5D5Xx0016WA4HTzXiAYmecWX
         J8QM6pzAH697qEi00cA0a3Dy7r09qVJ38JTHX4toJFF76+8CFm7BY3ASyYjaEmZR9KXP
         qFw5Le/ShexNgo87GlIcPdU4CAuAte6lCQwksQVLhKKyURThLOYUhjXkHk/cwpZMzOPp
         QKDHaY264eUbzS4J6smSr7ZwR4J3m9GWnYAHf5NA709tc301Qc/DYoLBmgCbE34fLGNU
         D7GFlOny9IoRGt24DORRxPg07xLWlI1Qdemd1dN+uzcv7LfahM3kmFhpvrsK8wQnjjrz
         2IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794691146; x=1795295946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jicOixy8WojTbeyefnlFqHoPsgyXZ7JZdBPs4flDM5E=;
        b=ZUMthh//V/+tFsAjazpdbwq/emTTNW00IH6zU1ip+3NEOBcne4r23ayz67rL4/Nnxb
         csQp0M4Y0ifde5kPGHSp1kGzfgIQnTfd5dvSjp2rzAGkmE7tKiiDYql5JEwpQtUT1HjU
         mSaukqbZersCVJsKVMtYeBtMIpAQCennek+p/6KHOMUcRx/H/uhlA9MzkvMIZbTT7aQw
         F58bbScKVIJDuCdSrkWwDhjuCv53OZ8xcfVeK3r1Te6S9GUJF1WQ62T2q5ge6Lv7lQiC
         4EIljagrCplyF+6WhVSiYZRZWuwqqNLZcP0HIntSSEcxhcQeWKX9N78XZo1vf8vaXpAQ
         MzCA==
X-Forwarded-Encrypted: i=1; AL+hErEE/YQpdPUV+UUAtgYdLQ9mJuPQ/S4nrp3CIr+yMw/knGirZv1Aj89v4AcwsefUUvkRbu7awO4MJegM950=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vtk+Ndq/jCwrtNlZ59oUpBAb3QDjISooxD/ckJEM3GXUca4nR
	lSPKYqk3IJUyN3WyNeXmOgdcsHaYM+HKcMY9qdV1RXE3t0sPc1ZGe6zDo/s+3IJzLM8blRWXig2
	ttQzEqYb4wCqFCBCqycq7U89bPDMTfw+bWR+ZbmHgNQ==
X-Gm-Gg: AYBFou0t9a/1QbYdnQ43nyDEcVlP014In1tQHj5Vuu4/Uxk7/p21F8fGdpWW5nGgpEe
	B0SdcgB+14937fPHoaa+aS21k2jHOWPo64S7ZPuFuQvtOtqZDyQHmS4bxNzD9MkYyAzPUW5lKU6
	z5s3RL1tAMhhE+n9mH5qJs9oUlL5YM64eyQOLixa2l8SnBNPgVzzNvzspXphFCGz4Oz/GJGH/gt
	+ZhqciOD3SOkp/EJTMHYF1+Xta1SocUwtNy7SZKy2jP3lXxpPgobu2AWed/ceNyHfqlNSMZXYAW
	JNnPijC0y3/BrD7lQtgNh2rUANiacikd3P3lvABj4bHhAGouuejM/oncl51xwVb+fR3nQvlqXbk
	/tMECy3jStcX2mvUu6aNBQGix9867RGsYQbp6OpbJdm1AH2z5+rt17fz+wIggMl5V8zWPmAA+Ds
	Cn2+VJjYfGYwxR3N5SkPeRaAVCbdPjMo9KmjNzLfP39EN/NAn0/P9qlNqbdTUfCUxBKEBec8f80
	2ksqDOHlsde6sIf/3BBJefT5h6jSyag12Q50r7SfVhJ7ikMTnOheQ==
X-Received: by 2002:a05:620a:29d4:b0:949:70ec:7e9d with SMTP id
 af79cd13be357-94970ec8db5mr196827985a.14.1794691145881; Sat, 14 Nov 2026
 13:19:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113160153.216027-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261113160153.216027-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sat, 14 Nov 2026 18:18:54 -0300
X-Gm-Features: AclHuK96omU8VBYd6Kei0gbAR-XQC3yfGNQMjfo8eHw_GJ7QcfWCe_a9INHqobE
Message-ID: <CAMAsx6dpp5RGM3FwS2Qx5ojbJoA-rbs1Mh83bqif28LcpTwXAQ@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add researcher guidelines
To: ic.gabrielribeiro@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 01:02 PM, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> wrote:
>
> Translate the kernel researcher guidelines into Brazilian Portuguese and
> link the page from the pt_BR process index.

The Signed-off-by line is missing (checkpatch: "ERROR: Missing
Signed-off-by"). Please add it.

> - Declara=C3=A7=C3=A3o sobre Drivers do Kernel <kernel-driver-statement>
> - A interface de drivers do kernel Linux <stable-api-nonsense>
> - Estilo de gerenciamento do kernel Linux <management-style>
> - Assistentes de c=C3=B3digo <coding-assistants>
> + Declara=C3=A7=C3=A3o sobre Drivers do Kernel <kernel-driver-statement>
> + A interface de drivers do kernel Linux <stable-api-nonsense>
> + Estilo de gerenciamento do kernel Linux <management-style>
> + Diretrizes para pesquisadores <researcher-guidelines>
> + Assistentes de c=C3=B3digo <coding-assistants>

Please keep the original 3 spaces and add only the new line:

+ Diretrizes para pesquisadores <researcher-guidelines>

The diffstat ("index.rst | 1 +") should also match the actual change
once this is fixed.

Thanks,
Daniel
