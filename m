Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922751;
	b=auKzPcCfwZoNMYZtRhAIaA+8MEorxMf6RNV+8j8nrXHMhnx1crJgV+u35uNoAQBZcI1B
	 C1pcbBhZt6QAj0GHddUldZ5u7FNeWQ2XqfYLBLJxy/6FVh+SiSfBHyb5o8arI3jdLjTUZ
	 JvT7ygvm5cESSLJGhdP4Uzl4C0cixL17VDVCUvVS7lGl2gGB8ePn6wxXnSaMGHNkUtZpF
	 KSogvuKSP1jV9PqLn5qUxq1X765vq3rvxolfXWLkkU/duf+zhTxb3qKq22E56inismhTL
	 L8TVP3YRYh7e4X6EhOkyE6Kz+AdBRD0ruAC6KtnGwK4kZmiefzC6uQPdpL0kBaqxHGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KPHA9VXi6250Y2f3/2jRY7wM7Io1FieoW17lwl35AjE=;
	b=cHwUEKdoIfUhCRtY440ZHi3c4U59/R+alJokNhtLZ5+N8B5vKvW+V3BFbqHKdMtSuFPJ
	 UYXIlFWn9esfSTjPjoryO3PsS+6+KT57eVNtanQ6nFWxwfxYxtg7xxp/0mysYm/WWrEtj
	 sYpCCuxBWoaHxSGMsm+F5yac2hIxfL6RCN7EFNteNzd1c/I6HnrHS5g1F2tCoVV0Ex+DO
	 m8GmztZ+Wibx5NohBwEV64QjjCxZGORMK9jn5eKSMMd6N52Mr+h3X8Yy4pRGTXXktGoo1
	 4XvFvOTXE4eEg8GzXIvHd735SORlWckLe2qoK6K3UWhmXbXRnS1W+G6eLVq64+5naig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aa74ewLM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29B606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A29B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aa74ewLM
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c126fa1e3aso3639104e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:39:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922750; cv=none;
        d=google.com; s=arc-20260327;
        b=KfUXO4fIeT6k86ETCwMXJqDPLHnbqNL7zyn9TfNdH5Q/Gc8zKt2J/5B6p+YoaVY8Gw
         l+QXYt1ntalpqXESx6k43bi6nBy8ZxEQH20LV8442Hmxe5Bbi6EGFHuAk8TbULex5i4x
         TD7NbbmcHsNYuOFvd6g5cll4GhuckJtoyd3FvLcWjbBZzz0pt/U6hPSLw5mcdybIR8Cg
         9OlsdpfpKbYsbruHDRFzRSXLIRzzObyKglzfmqcacB1M9CgH4irI6FTDI7lUQ8Jlb0xp
         lqYlRDmbXFA9I+4czZAkDcwju+ij3Tu1m9CJhEFfutTZNNFI/sqD3Iw0+c8ZeQNghcgt
         UauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KPHA9VXi6250Y2f3/2jRY7wM7Io1FieoW17lwl35AjE=;
        fh=CPzcnsLXR04eLrsQ+i3+BCnQl6zdLTH/GNqFoFITG0w=;
        b=AY0GTfsD7ab2FyuPczMewM6QGaE4hXxHjnqpEvCtpUvFSHvDEJCHtOqQaSa26onjaJ
         RoLOjsUuxdiLnW0voVyqvlAEIgDB4I4aARi+GcbXxlgJ3qAcsd/DcBJm2Ahj/rdK2oob
         ukahXzmGkulYK3q9LnN+srY7cMztx87ojerIw2fxnNU4XZcI667Fop+FBHvJomHxGe4V
         B9tnhXSwTTdW26qmhDbqQ7vRrso+CS0G+J1oSaPe5CjB3ybeLIO0nDu8VdObGBLBWE4B
         nYPf1zijEeblhCgcg7mFra3TxH4P5wuYyxprVeDXE8MqrotfvIWRJoKFY2j6xZwBRZZV
         vuDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922750; x=1795527550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KPHA9VXi6250Y2f3/2jRY7wM7Io1FieoW17lwl35AjE=;
        b=aa74ewLM8u0pFHArMerl/NPIA6QhrkWCQBAmJPBUfpkbuq4xGmBhCjWGQnxy02mRdV
         e1lolqblAUV2BAG+cbrUvFrCxxXtQE4Q06b9mE9HxMofJGUkHFXVn9qCU33RhoXCkPRn
         UlU1I3oi/e7p061U/PQK98sG2jlG36M2h8C8CN1hnb8rfkdR515P3YM5ojFRhPvGB2+v
         oLj9jmgk9rDqlXufA3fMkgCUJ9NSZkGrf/qP+HyssQRJNCT6L0rvjbOULQgGPInYv4Nk
         ZjWtj+wI6BYs9PEyxyxubZdatQhA7ZCs/s2itv3SOJ6liYcC27NRWxzxvTv/3pvXSHVk
         TF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922750; x=1795527550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPHA9VXi6250Y2f3/2jRY7wM7Io1FieoW17lwl35AjE=;
        b=BaIhWEjiSTXaPkBb/LnTHAJZuvz6kQtggD1zhXyyKWb6PU+KUFFKKMw1WblCuDrQ2b
         R23xQrA9jt5TiQKUGj/xfxoxVy4zdcbytwcRpc7MXTd/HuI3zgDs4LgdpyoSTYmrMt3g
         ze49I06MehDTZkdD1hX9tRokCXTYzzodwYyQ0ek/HdzKl10cFPWIG6rwvdjIQJfHDE+K
         AZ2MjyLR/cOloFl1TeRvk2XO2RrazWWoFHbELyNkrqjxawYg0GrTO+YTYIAWOrltMzc4
         yWsK0c+IGwoQaScUjGhtZpGB1wyf612jXoBOtfhfFTNNe/Ug8XH+xKsRoU7MSyPW+63M
         Oohw==
X-Forwarded-Encrypted: i=1; AL+hErF+F2k6+t4JiM/R4XNXdbi4iR80xD+D9Q2gnmFQPjd1+J4Exa6OSGonHaGiryLwDOhtRLq387PL/j79Rq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A5Dq/WMpMxxjx4hOdRXfjy52vfe9/QMZOOKPdBniq8CBPWp9M
	yfG5zc7JoPFwCP9ZjoIesvwHZmFkb4F7XyQc6hKmfYk4UY0DMcAbXS1VC6vxUFCwP/fStXHKw2R
	6O8YHWjGIy9zMy6oApwdEPgSjWKdTq8c=
X-Gm-Gg: AYBFou1JImZJzcyJ0VGjyJNXgMuPlliUeP+/rV2c4xbO9SrrW6rtc2HatRwNDLMbkhS
	WsM39a6hiCVncFAi94PblWnfHhlPJ3V2Cjxk+FrPeOuUpJ8GhSiVGTIO9pKXFJW1l97Xpi7ooF8
	br5jV3NeRk0MzXx7mq8E7apz0FvFEHETJVAU4CWVnkXz5t89gbHCJFXkOPokHB7gJze0gZmNzsG
	cndjMma3z67JTT42grWBr0yifhIJnn+UQrKMUqWp7rjJ1GmRtaGbIKsahhu6WgLmZPKf71YQiXI
	eZvw0lLv0crbCrIiwHfPGaLAVDdaYHFWZL0uhmsccUuTXXmVVjA5rL8AB7WBi4eHv+jJDhOycE2
	cj9EzZLdrkKa+Lu0498zpqtbRpsMDgZOgQBWDfg3ljCcwDBzKC4WNW2f+Fl4e9Bi4BGVHXNWwn1
	gPHdjbGSfYsWcG/PG7Oqt8eZ7gnQ==
X-Received: by 2002:ac2:4bc9:0:b0:5bf:b9e2:f69 with SMTP id
 2adb3069b0e04-5c17079512amr6512588e87.26.1794922749189; Tue, 17 Nov 2026
 05:39:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902125257.9882-1-festevam@gmail.com>
In-Reply-To: <20260902125257.9882-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Nov 2026 10:38:57 -0300
X-Gm-Features: Aa3M54oyAHsbFD8nMq9jaBt1dZLWrjTBp8OiUR1T9eI3IYbqLJKefoRVxzZ6SLk
Message-ID: <CAOMZO5CcPr7EqU1GWoNXS5rkQuiximaH3T_Ek9DeFbnHGNeFew@mail.gmail.com>
Subject: Re: [PATCH RESEND v4] rtc: abx80x: Don't warn about oscillator
 failure after POR
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, seanga2@gmail.com, 
	Sean Anderson <sean.anderson@seco.com>, Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:53=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Sean Anderson <sean.anderson@seco.com>
>
> According to the datasheet, the "oscillator failure" bit is set
>
>   ...on a power on reset, when both the system and battery voltages have
>   dropped below acceptable levels. It is also set if an Oscillator Failur=
e
>   occurs....
>
> From testing, this bit is also set if a software reset is initiated.
>
> This bit has a confusing name; it really tells us whether the time data
> is valid. We clear it when writing the time. If it is still set, that
> means there is a persistent issue, such as an oscillator failure,
> instead of a transient one, such as power loss.
>
> Because there are several other reasons which might cause this bit to be
> set, including booting for the first time or a battery failure, do not
> warn about oscillator failures unconditionally. This may cause system
> integrators to waste time investigating the wrong issue.
>
> Continue printing a message about invalid time data before the time has
> been set. Only report an oscillator failure after the driver has
> successfully written the time and cleared the flag.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v3:
> - Rebase onto current mainline.
> - Fix commit message wording and typos.

Ping?
