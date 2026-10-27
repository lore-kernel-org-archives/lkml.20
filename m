Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118154;
	b=HN7gw0lMDgjjhk5mXF4hjgdGL4T6UZ1YW9I2R3ZBAm949NeNeOgoWlfvq2wm+YKH+KC+
	 JlcFUE9hzvOhLWLpLgsWEp4cxCXhBukijSq3yHeLpdgb7B4Fts7AlcsE7b/QjNyf26QMr
	 0zPIkTLz8hLvF2rWCCHWs+xA1m9JyldcSEvxJ4GRdJZKjE7/Ygxmmr5MQKjLUQ1d2UEC1
	 jAlxzFaw36D7EJICfnn1j7Av1kt675ElgPu9LhnXplrku4tz5ycWECeC+FJn9Up6+oYXl
	 tF7+z1Fj8q8zgnWX6EqvByeYPSUN3cm8/j9U1mGDWMlS1ZUkjO17mBsxeQ51dro5qtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
	b=MNhzjLbpc+/GC3leKHJdg4zOkk6h0S2VQqxPnf185qOtHHcTqRkvMvGyruIeZUyJquyJ
	 ApoCH0PBgwT6kHkcdkKQSanVUXCv8Uzszju1NKH3SlIXiH6M4TN3UKhMAGVfg5ge9UzKz
	 Rf1z5DoLMraW2uVxy1+x6Ivtg7ZHfVrO+YWqWNuqI+bQkB7WxoaPpwJlrntT9XpUJ8rGE
	 N1ijcowFJU3ZF75zz4jXDxONYDGsrfuGetkMz6ZFE1OaxQrD1A+F597FSATsjfuEhJtMf
	 uppzmH2T9VbpfakgfWq2ruHmTn/hUOPvVcPJ4OYVghXq23WAar36gkx5kJOjj0rE3hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1iQHa5S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E09606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E09606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W1iQHa5S
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0f59a5fdaso38503017b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118153; cv=none;
        d=google.com; s=arc-20260327;
        b=iyJp52jIc4deEZ/HFEKeb5p+8Y7sgrxNwvEJnOsHnQR36tYFQi20xml+0YYXzOUdaE
         7EH/jG7vtihVKdC59KZGeqvMaSvPkQ66A6Qac6cyyBlI4FJlM+GKEp+tZW9L4SxAor8q
         kqWYrMWRQT+VwqXRu7Qwg0r+gKgpelh+WNbh/+kML6myt7IvhEWxZW2P+WCwRLAFfD+4
         Jpii6L4AJPvoaMCSy3c7sLG03l12LTAYl1j3TcIEZKWBhhoHP6h/pOY2zVIrdxGb9SNQ
         GcGiIu8OQG96mAETq0yUyxmRKTNlftunnmsareGVNkRRtMvNEiEAOSNifdCnpyehOC9D
         i4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        fh=hkp40rUJNvc2y33J+JZgubOd2riW1+tzOE0v7EnreWg=;
        b=DJHZLnQ+uz9go1TB+12sjWv3/liGH8XIqdR4lECLtwsilfEL6/FSOfNWiAIzfeHTl4
         HgGCmFeWSP6IHTWyaQOZUdN2UHkxXliIaBxsdm5yiLHUyFgtcx709gntKZRaDT11YojZ
         rkHond50LmltZAJjkGZE3AEhWnRlPiIQigvCO6KT9VO0a/fETI/9ZTmbzE9rc95KRWhO
         /DQ0Qk7DniWIzkMm+EIdxvYhO7eyVx0aUbYzRM/pzGDh3hFc+jBJG9JNVqInfXVYrX3u
         67JjmiwMlPohYX05dGkgqVWeXLATuGMGJqpJMk+/2dEV22Y1tHzCe0fdld8CPFL6KNL3
         A9Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118153; x=1793722953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        b=W1iQHa5SX/Qc+pJyHgnzeP49i7n4MyoEA1Sg3k4vdH/8WuPlX0on9nVDrySw3Zna8i
         VmAyaK3ohLRAwCwDkIuGUhl6lFASHb9v/c6ua/hWP4ZnWIS4Pg/QPxL+h/j2+M/ph6tF
         1vS3HMQklRX7SsooBGhCqQgqAsP87LL1H8P0aiSVUl4bKJTDy8l9YqnJ0x5Ec1X5CdbS
         J+/smu1iGC4WhXJMXPInRtuGzDFJObu3iEpaPAiN+VC9nv1zNGfLCEZH1FiQpKqwIiPf
         VWeWPMWfSjW129zws8g4m5xGzmWq5KHVcVk+cQtM/DXfJbdUlA+dhI85l6M9pPu5/00F
         GlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118153; x=1793722953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Je9f2sBUTCO/EZacvnUN8CZNhT1Vz5vHYja71Ddfujk=;
        b=a/Fzq/wHcxCLPrucwWsoW2tXnnYN71mtLcfoeRayjmJxqIcLfscIGaT3Wftnmsg2D+
         tmKwb4/JZARW7iWmnpK9Y4phUO6Jc6orpzFmmbthdqkvE0eiUC2EgBfXvR3nr2LzoSWs
         1rrGQ76Oim8DDPfRGKEnTNPs2or8FlHRFVYtn0mOJ6rzIEgkaheKGOx8WPATrBhzgFC7
         7v24+Au4MFh8XKOqxkEGClHtWJydKvz+HIAjYmgDra/JAOgb/AecNPSZ6T/0EFAst3jz
         2BW3wHa3WpMgmorhrB3WWCCL/uhmmv63JXLhIHnU/8WH8Cik0fl4fHGl4VJomvNlhgRi
         Wnuw==
X-Forwarded-Encrypted: i=1; AKwUvBz13ayUGWiFkaOKs+WgfSzsBr5H0KZSYGXy2ZFuLQb9ULbMnfhB9jHZy5K2Hv1MJ3AfYo++9S+HH+AnY24=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqaHcnZGMKAedkZ7KVPqohfvSbodk1s5FvSuw/2DmgBLpFoWt4
	DPxf0Dp2hKWJBGb/KBiaqITlAjSobrfRxDIsPvHsUaJPcU2asAnrY94+iwpHS+n1EZYZX6RFUJI
	zPVv9x04cJEh0KVoVjODfvGYPrjn6NVs=
X-Gm-Gg: AYBFou296OwoBvdb3sgI8zk8X+vZm2u2D8iS57C1JgSzVxeOgLltw4JknJbXthf6gBG
	O4JrZsW80du0/xJI9+EhveB7mZLMY7w0ZclA4jKJaToMxDT7tFk0HNn1VN7Vb9l3T0W5hzF7gyP
	G0NBD8FNcCa3TYBg2J9utUawbWJg7t5lNPFlDKaPiI0wPwWJB9aM1/DYrlUd/IFM4oZ0rpqRAIt
	NfU3eyeJqb8sDTJUwUjC/Mc1nvKieKTnofLQ8YYq4RDMhNB4SbjcipB9Pu4iBLVXo6wb0MfqlHx
	Y22bUuhzfizTo1PD4sRVOWLzvNpNqvHZp2M+dC7ztzQdtwZ5PopM/F1uoBVeAzI29l89mkfvo65
	c34aAtLhnko3ZLnN1c8hajjIFKMl7eCAu3gNw
X-Received: by 2002:a05:690c:dd6:b0:8b0:cee8:53cf with SMTP id
 00721157ae682-8b1669cb374mr84387667b3.3.1793118152555; Tue, 27 Oct 2026
 09:22:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027145313.136305-1-lgs201920130244@gmail.com> <f7d242b6-a401-4ea0-bfac-e988f1497bc0@kernel.org>
In-Reply-To: <f7d242b6-a401-4ea0-bfac-e988f1497bc0@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:22:22 +0800
X-Gm-Features: AclHuK9WhSZ_5Xj4ee9jEQ2X-wRviwNJD5dHM2yTu5byUlkX8Eudsa4g1RS5X-w
Message-ID: <CANUHTR_RYcMEOTevXWRF2iS83oNDc4pXqsbBZKLV7QbSUeYh=A@mail.gmail.com>
Subject: Re: [PATCH] media: exynos4-is: fix DMA memory double free
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 15:53, Guangshuo Li wrote:
> > fimc_is_alloc_cpu_memory() frees the coherent DMA buffer when its
> > DMA address does not satisfy the firmware alignment requirement,
> > but leaves is->memory.vaddr non-NULL.
> >
> > Because firmware loading is asynchronous, this error path may run
> > after probe has returned successfully. A later remove can then
> > attempt to free the same DMA allocation again.
> >
> > Set is->memory.vaddr to NULL after freeing the buffer so the
> > existing NULL check in fimc_is_free_cpu_memory() skips the
> > already-freed allocation.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: db47622c13ae ("media: platform: exynos4-is: remove all references to physical addresses")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> More of postings by bot ignoring any feedback.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
