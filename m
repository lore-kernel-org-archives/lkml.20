Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D1F499F25
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425145; cv=pass; b=F1c6uiPPRpXHMD5h/2FKBSTXOoW8qg2/CCOm1IJ2CBO2HQi0TMu8JhYyHqfZZaQFRFC2YwGjHznK4p2CU7nMSDge/EUHjQ5KvyUqBs+vq9n02QqgYnFu532qrvGm77UFl61OJf/Wj3sIhen7GCgsVRLWZ5oWJ+w8oJPuJKbpums=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425145; c=relaxed/simple;
	bh=RquOnyx3oonNy5ot8nKZ+MZokFOsGOyqVbKyPQz73Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALHAfxH8uPF5f/MdOeNasgkdqRcWpYrkzwVuNm1rtWzI45zZ+UJYtlaDmd+V5N1OPZ6rkWaJjDjNs6XWPRV7YG+8seCy9YoJyUWxHdxQwuuRvRrE+aC24DuUC957+q8XI3Dug+HeCy6HcHiFEV4MnO6sxFwFsyk+RZOfzFVPGQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhPj5FJm; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhPj5FJm"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c25b661d37dso547721466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789425141; cv=none;
        d=google.com; s=arc-20260327;
        b=Di/e/u0UwXKI5kwQTiwd24OvgjXN/yA41Jco2Kaf2e2arm7YUlZitxknacLVHUZRKD
         UJSKC4CRE3h8hd7+5jsFjp0IObCZNrGNEj6wVNGZTIcEoj1OI3/w9TrPTm5N2qcHJpKk
         SdO//AlkomUbLa5WEPMK+CnsT5jl+lyQwAKcaoqLlwNapsmOg2T0MiTAAEKEqbs4QXDP
         8LMlPIgieRVRjnmhxVk30aZrV94zCSlfsZsxtF4m/+PGkUWkudIh4MfZQRzg7jxeklVj
         fFAMMKohpaGY1ojLBy3DMknGm3apSgIgTP5FmdQQaV1MPD+NiuyoMVO/7xPin5dCnR64
         +Z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RquOnyx3oonNy5ot8nKZ+MZokFOsGOyqVbKyPQz73Oc=;
        fh=j28cPAjm53gupC2Um12fvS692UiTQUuZ2C+I3sShATU=;
        b=FSYDJuS67+1irZnxGOK+E90DZozn1EuwQFIXt7SYPsjsc6PInLGZU0IJQeLJci1/UJ
         mbwdxQ9Ra9ejio6sT1IF9d4Wb6UTqVSPZ6gXoB0FN2EkRO+DWnejtx2g0ATMDz6mjdiO
         DUFixcaYOvYlGBkniowEwi8tCN6SA20/xfJyUlYQCz+CnHQVS0LcssOYoZGn7wPkNguf
         QltL7/1tg8ehqllCLVmckeapecPczqdWmVM3sakZiKvpFv275oC8+xDIhN2eoXORbDFD
         6JS7GLOJbjJ7DhNgxzFL0bvzeN782K6M93CmEsGL5oz/DvXIm25OSanV2BPaLWbAuyLx
         UajQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789425141; x=1790029941; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RquOnyx3oonNy5ot8nKZ+MZokFOsGOyqVbKyPQz73Oc=;
        b=IhPj5FJmufRo3u88fDdRaoH72K7ArrJLOpQdJOy/gGKFAzj5XxIsE1+DnLI62xZ7s2
         uZxS/2/4Jsc8ZKgauCEDmblqng8u1BrhRc8LqMNyKOlffq0wYMKglT0CMC+ffE1C9Brb
         xJ1yoBz02BKSOmvwCKhUGzpVRb6ARPoHoJ9ISwKjUnxI4jgd1V6Te8tgCHwE40DO1Sx1
         3XMTIOBOvLnRt+tF8dOZd86zRfx2I8HJHaXccOazmm1PLj1GhbruuPTYa/n1hse7ZA7r
         pJ24yVdyytXwPeykQx+/b2ozLANwCLzRr9QO+UNitQWn7L8SO02rrXi3p/AtybyOyQMe
         vp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425141; x=1790029941;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RquOnyx3oonNy5ot8nKZ+MZokFOsGOyqVbKyPQz73Oc=;
        b=vBjnJ9oFjMBfpvZGtdqmkHsdwL006DIbd+SlVhDkmPoQaDSAKH4Rj5EPemCl+23nUB
         YmeWuUViYwhHOSsV5Fwl9TZGAFQS5PVcA0LOhCU8diPm+3zDA9J4HxUuDJuWFrBPYv3/
         s/NaWJPghS7kViS/YllFkm1jB/FJCXf772qDudJm8eVvJI1Vh+AdFKSEWCZ8MUQ0iL2T
         MeWfD2pqWeFvBCkGmte3vgMiEa5lSwr8gS8l79br0ZpCBPhtnQxLP6kQlo+CEedTGCxF
         ZlGfuq37KV7MMo/OJSt0vj9xe/3WVFcsT3QksE85h3wgehx30sRM+wbfn4iifiMBsCbn
         I3zg==
X-Forwarded-Encrypted: i=1; AKwUvBzEQJW2UCfChjUO7Ri0NS9Qj7icpEgLjhQeqqzlpmSth7jowv9R0F2ysJV2cvbYtbA/WA1zMWjJ3pvRkhM=@vger.kernel.org
X-Gm-Message-State: AFuF++mgvPOGmQcVU5Xd1dXl2449V4eV8AtxeIEA7nUnfJQ0RIsqbYdQ
	vrF+cpVfs500c6iUeoKq0uxjzShg0+DD9sPyhDxh7cEMHK8p9ppy5METqi/gnjoHZ1RwWtma+M4
	t3BpfJyML1oM5QW/DZ1xh7zgKZ1yOdw==
X-Gm-Gg: AYBFou3XSWnsJ+nrfS7cNzkTxWIAlCvP8r+5CRDwGfyPL9Iu7VuneKcRM3uR1BCwkdb
	12tSaqLF4ndT1KGW8p32I42w/6k34QOmF3NBRwUy7oNmWSMljB9CY+xO3prcY8ILe0QX9otBrxj
	U/unaKGHbt4eg/v3q4QpGL3ze11Ra06Q6zngFnIUTrh6YFLQl/I/DBV/zfZ/+6D+bplsqQcYD7z
	9FpD6r1fyi20Obfgq8r/Cl7ERXqVN4Gcovs4avGB3Mm4q6d6g9hawEzEOmVRdGm3x3FABsJCR1i
	G6Jhom1muh6NYiY8uoeFDOOUw6b8BJy2YlKwrTzA2gUtMetN2fOApxmGqzeK3YYMzIAOR2AQDF+
	8XDdDVX4JlRy1EsEy48vLd7J+hTqYI39rICMS27RLVkaLyX6gsTCRRTuQhxhPF1j4aTi2
X-Received: by 2002:a17:907:8e07:b0:c29:45ad:7afa with SMTP id
 a640c23a62f3a-c29b804bd7dmr277377066b.0.1789425141394; Mon, 14 Sep 2026
 15:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913040606.23272-1-mhun512@gmail.com> <RjVH6lTrT_KugcUQV9puWA@nvidia.com>
In-Reply-To: <RjVH6lTrT_KugcUQV9puWA@nvidia.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 14 Sep 2026 18:32:08 -0400
X-Gm-Features: AcwNN1UpzBAoI25V1FSIL5wEhSS0QLs7PqvCPS_cC5XA-rgMX6mik1qtVrFRyMw
Message-ID: <CAGEsz8GawAJyAXbksWUJRhUWR+c8cXbn-AVWfd+kgLwO7ZQmpQ@mail.gmail.com>
Subject: Re: [PATCH] pwm: tegra: Disable runtime PM on cleanup errors
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pwm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Thanks, Mikko. I'll use devm_pm_runtime_enable() in v2 and retain
cleanup for devices that remain active.

Best regards,
Myeonghun
