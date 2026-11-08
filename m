Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136754;
	b=mpyWbVUla38sxtGnMNdnWwE3gsI0t06GPPEfoESTKTyokTOqr4jt52nFc+101xTJ2KBL
	 EwIKucI3z4FwWhVh9uVjUMQg1/ftJgGnhaBrLpLgrLatRBfeu1meQ5y18GSM6jtqR/lrq
	 M1VqePBBLGSu8C5ycSDZXcqb5YoR7233uc+4bniZNGfBCo82RHqrMAMHLIsh3suTtFchV
	 MVAU0N/FyZZHCnBSY80AKAnLEuodKqK3QQB28ZZHDHIMUh1CWsSh+Cl6FpTeznC2rtLt+
	 xRD3Bo9ONQqDUvA5OJNQDuzjlXZxaPjdbb2z6oXrUG/TfzFttJs3/GQzymk7RciCDUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6Pdrh1oaI14+dH+vJtp79HYnl1GpETWGqzE+jRd7uSg=;
	b=hSxwv21i+5PEBPA/EA1TQMbgn7Ybbxv7QA2GhTk4e671Zr3dsU7xhaZd1UTAOXSVEA7W
	 fsKZTBX63rL1GVhpthdJtOWPZBNgrM2LEfhovHTxTTw0RLwrFPKiCepkDRwUGVehP3HgB
	 yexzz+gAfXZCZLFuibGZJ7oKaIEQdNsDZQBHlWxjZhCSNzyjOHmQjRi/S8Z4gTChrJegf
	 b9/DUrqC8NnK4hfCYxw7snbRaGtxtMn8sINx0ydpdnPwtVmszawbbrf40Qfgyb5MHVIfB
	 bkKUgIroKOneXzFnRPk/NX+79bkXjZi2Wnt5ycvrQ18IlAqs05IQLT4ZHyazzhxWaMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9ixjZKI;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36386606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36386606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9ixjZKI
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso134425c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794136753; x=1794741553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Pdrh1oaI14+dH+vJtp79HYnl1GpETWGqzE+jRd7uSg=;
        b=e9ixjZKIUKAH8X/WIUau5U9aCcamURDNcm4h1WmK48Kchm1E0c6DHhDaneX2BdQx1v
         u9rPJmJ/J7s/vvodQZ7ArGv5a68CDuka0KxXmAW8lHYLkwYvxnU9sSigga3ozfixwa4W
         yOrQYkedX9WiMlUGz7Hd35F7UY2JEh4/pTSarNFzwjBzEW6wMEnXA7fpnC8AbxKv9CmC
         1/QvUU5spOjiMiQagbJMaKEASkaHHlbMVQbnF8JuOQJLSpKosKOxXpQiu5MzsQAh+GDi
         XXVYYyXgMLwkpkLjrKs2lkGAHuN2d4YHlqhn+onyeWXwoEqX1hD90zYL5OGwgZbOi4ee
         1bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794136753; x=1794741553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Pdrh1oaI14+dH+vJtp79HYnl1GpETWGqzE+jRd7uSg=;
        b=TGy86udX9YHOF+EvVD0w96/AliF2smYqo6432QWVyFemIyGTnuUK40LxfCDC8eHaoG
         ftt0YohjVy68UKmSlYzPcxOgCWQz4NEE2bKgxGFDbJl2sJp031n0ZwIurzhFh7SyNNlA
         htn7BzbbppdSq+TgnUl9KoSaazeIwN2NjNAFCX2ThIUU2n2JKZSNNA+vZExu6px5Jic6
         3td5b1cbBol8X+vwlsshzeQ4p3b521POHnWElzU5xl3ogD39R7LQ+NGaqXXFEU3gCfai
         RDCHUkjiuZNiZ3FEL044LJY7FCBJp3VbNJr+cPKabjmiQ9j4cedxvYrlyPHa2uo7QOEt
         hnnA==
X-Gm-Message-State: APuU4Z/ZUoidGxXAcKR7iUIXoXryjbmr19y+OoyMWMo3Z4ICQG1GD4mx
	F22bMnMap6G6B4rjTh8iLKM16aW3A+cXtvfvFzDmmn/LtFfwbuM1KBGB
X-Gm-Gg: AYBFou27Kum1fwSLbjMTp6D/QejuWMFh3Ox7YSyB6/G966ohCg7ueveGhfYxLbskMNA
	wDjvOy9NTplkYuQCeTU+ntO+gCyEaIpfGS3SoHF5Mpt1ZNgXjb9P4w30t4LRkg3SvcLq2eo40bb
	o1U0dBUZvjNBO7knRVfy/3vX3v5xBTcSBjiYCAcMkACCrQp5NrNWK8EDMdMvbRi959aa/hi7OuK
	DXHFYUr145gn3LJUWcI0ydd4MNouHFHOelyx7jgfOwKMlQAj4TIGeRK8LVsnlgcbyBTDxU6dQDs
	tuEUag7ILYud7yKxmoeuO2TaW/WoHJHRq6czWFa2KW6AFHyhILFO6eJuYft2UzCXebHLVN65xI9
	0I9fsg07tSvrWY7xqlwaiiJRdcIEtGbfQBLy1Y2I//2Vwh730DYrrIxQcNT2mdc4in2+i04sKK/
	/JF4L/iBAhNBBbzwMQgQMaSER7Sc0xc3hO0o6Il8H0sKPjn1xY/ky6cWjmX9/AR51tHzpclW25P
	FVEWjM+lctXBNH/CQNLY3uG9qn5jWdTOxuZuZjjJLedE8ZzjBlSfxZRzejEA2GYwtoxuuiUPBpl
	Ry0Mv/1krh0nT6NorkYMmOAhFmKu3+qM6m3eRkV+5h0u+OCGetc=
X-Received: by 2002:a05:701b:42c6:10b0:174:cf1b:235c with SMTP id a92af1059eb24-1b39fed16edmr1861447c88.43.1794136752221;
        Sun, 08 Nov 2026 03:19:12 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375726fd1sm4942616c88.14.2026.11.08.03.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:19:11 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Fix parsing of numeric fields
Date: Sun,  8 Nov 2026 11:18:48 +0000
Message-ID: <20261108111848.2493-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87a4njy53s.wl-tiwai@suse.de>
References: <87a4njy53s.wl-tiwai@suse.de>
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

Hi Takashi,

I compared the approaches.

Using simple_strtoul() would provide an end pointer, but it is deprecated.

Another option is to retain kstrtoull() from the original implementation 
and apply the delimiter-first approach. This would minimize changes to the 
existing conversion logic.

However, since the destination is an unsigned int, kstrtouint() better matches 
the destination type and also detects values outside the unsigned int range.

I currently prefer the v2 approach, but wanted to point out this difference in 
overflow handling.

Thanks,
Sreeraj
