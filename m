Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793298051;
	b=jId2h5Oo1gOYPwr1D+hJpFnO3xBfwsrtgYzXGT2zpNJqkeFVZ5Z53BjwBBDJl7EOqSW5
	 lWCRTJO+eGA9V26nAJBImhjR+16/DrncNgKAhAkOLf9vhb7Kp9LGtJmMmo67pcRqeiWKU
	 llAbYEz8Sm67pTo2HG0pdVxNv4VoxlL4J51jgRrbWnDObgCrfMUFnLlO4mFeZBTTvfhux
	 vWoBctEkloqXaknSAyUhdFihYHAhk5peCgCTlGVoZWXQr8z1shgvQnZr1+aNTnHAAfQwe
	 2z7amWdh5aghetIEvZfjsp1Yy/E6pjTBcNnZmnCYRpQCrhg2vBoS1ikuKd8kxx7RwfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ggNoVNPA2Bii3jze7tCfHt9vsP7G4w8X9UYeBYzIxhU=;
	b=OMuzD4gH8K4/6771wzdTbOGrr5HgY9A8WlhDLJzD1Yfsm6eMkEKjNOZcr8I50ijnTcWF
	 PU0c43EJb8yBw2akdl1GC1f9IbfHwnC2NHma4nVXArgZIvcvB9PYcLeUjaZFmEbZf57Yk
	 7QRDCiYnXHvxSyGz9ZGLwXMaDLoZ16hULVMci4R7zPJWPB57OCCpGS8/dvVjhZozlkj7f
	 aWfeopj+p7ScyvVLz1jx+b1hu6vmPx6p/kGelhA2f9w2+9+yEAV26RKlQviZfTkUpazEv
	 QZCr4Vo+B+XUkMl3hNaIGWZAYG4Zd3wUqJG9YVn1E5JYg4cjzVyAYPGWsFFjNegtBEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ie8aKxgX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FAD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47FAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ie8aKxgX
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8479f46ecd8so1107374a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:20:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793298050; cv=none;
        d=google.com; s=arc-20260327;
        b=C+B1t4jJk6zlhq2jbNrO818jv9qPOOUDVhQVzvrz+khjc3tmkqKe5r6sbHxFvY7XhT
         70lA+V+IbmR3wtxdm2EF/W4LO2dHHMk26bD4xLllV5giubo9rKnUiPMfqcigCO5kCWf0
         RY7cIYGNmubnB2Lp3KQd6OT38/0gVImowa27v1AgC7dQObsJa1ZlGNX2+3toCx+S/bHd
         Z+1lQj777S766x63H6MZ4W53/Quc4NkN19LZFeBR6xo1nRou2HbfciL04Kc4re3X+/SI
         N9yAmb+g+f1ZgaHY36ootnV0yIDXNY21QgngJ7nb7pGYX0uqmHkFdJvwT7E3ucj40EEd
         QD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ggNoVNPA2Bii3jze7tCfHt9vsP7G4w8X9UYeBYzIxhU=;
        fh=kXNxnEKBRfWaOPqwzeLO+aZCqDukm1Y3p6U/lGS2IZ8=;
        b=MBcIpFP5lJGB7wwYXeVKkpstDl+JsiqqQbf7oBr652J9bCMlx5iZ3L7g/5QuTd+HLA
         Eglh700VVREkNAfXREE5pHYiQjwQ5VH/7003lm8GjWHLrfpN3pTpF+sWPXf0iI1GCN0s
         JJ2EKs95Kc/UNFEBLdMAt8tEOeAYKtvhP02C9wWWUlJVcSzNusZB5uBh+PKg/Xbi0eyK
         Y+2IBcIrOldIESBT8vmDSFDKffxnHNJSLsG/sizs52aJ5kc32Wq2jOW6Gw1jQH15a6OW
         qUlcSBEjEBL6SgXbyPfvNXSgyAXa4jEQSK3yu82aeKWerHrDD6AOCYMRpI3gqadudKD9
         aI4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793298050; x=1793902850; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggNoVNPA2Bii3jze7tCfHt9vsP7G4w8X9UYeBYzIxhU=;
        b=Ie8aKxgXYZgZ4zONjSH1zfhtUgHtVC/N0CsbnCfi0La6zmMvQnQsQXxfu/Sg6rxyaI
         bLun0mjxBmY8WO8m3pLkaUF/SAvrOAh9tFOmo4p77f+n/Zv7yZ3jYEuYC1wYg16ZHcIV
         0ttgdSQAYmx54JiEeQ0iW1oC2ZxSyeobAGlTYF9YNO79BcdWt8E7SWocgoXhl97SjlrT
         YBx/Ly6ZkD4GdUlp2dD0k0QF5b6bs5Wzr6ZXhxxTkeESAeSMFFJ8zYad098BZHbTtdhH
         kEBm7Jcy2ewx0mA5JrN7OtVmnZ6FSbbjH5a7JBGfZtg5Nb9rIHWLcmk/xpvUgfLZlq8X
         GbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298050; x=1793902850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ggNoVNPA2Bii3jze7tCfHt9vsP7G4w8X9UYeBYzIxhU=;
        b=lVtV+LGVF+K0SCz7i4AtF2DoBO+xYaedMP7FSGXdJsldB8/jlAoR/dO4TamNQgUDwH
         U9sfOAzRJ0mwWZ/T3++xdxxEz30nQ0x8wwsbsQuG/2f3jKlLd2DE+Dtt7JsRWCHNrmev
         LKyINmcDzAfMNcXkg1gUJ9ML3hNh6vMbGGpTOHuVVfUyYrb4fbCTGX8Tb4nMOUyiYAvX
         7B8hANQlsOfH1DRXfvBkoD0i396omQ8c7tYJZ7AOggl8UwzSUAKWiymuXOekD8iSazzu
         CYGYAaah/Rx5/GAB0VsxTONvsXi8nuJ0D1Jqy2L1GCy0YhpIVrtEaG9dpV9dE/kDj/5M
         kPwg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ9X4wDvnjo3YoNwh2/kVqFcwLLL/cvHGHPyNI8lRfwrTB95cdUhirWmYcaIhrT2uqbTDwGmBUMz+7FQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8N5H4WZoY4Oq/nxEio6SzaW9oz7HP1Yit2XrylyEB89bbTCzo
	KfKX0BB6SYUpGulx8hVd2XZ89M83+baoJsFsImumBjip9czG0e4gIp0VqSG95iAFog9UnfWc8Dv
	g1VwJO6/NwOD34uxJDlVmGaO0nPGu8BE=
X-Gm-Gg: AYBFou0r1GgsNoXAV4Bu2mp1OvCbKMpLHoJew0cYxKdbbQzdkpWkNTAQONQpyQWUXvc
	X+SKKiGOZQcMt+u2kcvr/4gGvWPLrn4T656tC5rcr3/S6EPjyfBhNyrl5Rx05LkHIPMalxhSuMJ
	MdhHnb4N8JWwWoGZSp9zwYCZuJfX971lgvCecPiMzTy5fRmqF0SYp73dc/N06+TjThhNBImFNti
	PoNn1LljABAZeZW/CDFvT1BF4tRf2PbFJJ5EQ9pbElcYfO2/6pheT4RR0r+96pAxqurpvLOHPLV
	MiKc4D+0lA8YiHslTMMehM+0Mdn8nL/BXfLsRDZ7+HLDsF5OoyN8ElwAv6k0pCe8EHhXsyYudWM
	tGrdrLwh6f35OpsmB3NhIV+SPIW4P9J0pTe0y
X-Received: by 2002:a05:6830:2e10:b0:835:63b5:8b7b with SMTP id
 46e09a7af769-85ab9873be4mr5674733a34.10.1793298050197; Thu, 29 Oct 2026
 11:20:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029132339.925021-1-alexandre.belloni@bootlin.com> <20261029132339.925021-2-alexandre.belloni@bootlin.com>
In-Reply-To: <20261029132339.925021-2-alexandre.belloni@bootlin.com>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Thu, 29 Oct 2026 19:20:34 +0100
X-Gm-Features: AclHuK_hxeJmxs8OSnBxPWTgkT9aBV9FYIaOOO8Fd1TAmXsqXcLas4MA2equwKw
Message-ID: <CAH+2xPB-oaN=m5RuG8pkw3W162Px5pRypNJTSHWEpO5yt2RmEg@mail.gmail.com>
Subject: Re: [PATCH 02/12] rtc: pcf2127: use sysfs_emit() instead of sprintf()
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Den tors. 29. okt. 2026 kl. 14.38 skrev <alexandre.belloni@bootlin.com>:
>
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> Use sysfs_emit() instead of sprintf() in the sysfs show callback
> (timestamp_show) to conform to the recommended sysfs attribute
> formatting guidelines in Documentation/filesystems/sysfs.rst.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>

> ---
>  drivers/rtc/rtc-pcf2127.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index ff2023908f5a..49542cc53411 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -972,7 +972,7 @@ static ssize_t timestamp_show(struct device *dev,
>                 if (ret)
>                         return ret;
>         }
> -       return sprintf(buf, "%llu\n", (unsigned long long)ts);
> +       return sysfs_emit(buf, "%llu\n", (unsigned long long)ts);
>  }
>
>  static ssize_t timestamp0_show(struct device *dev,
> --
> 2.56.0
>
>
