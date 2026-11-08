Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131718;
	b=LjSV+LIRsFaa1PK6ARZ9fXfJolMYLSA4fV9C01G/UtHi4dqrINbJmwHb6rMS/QVw6oxK
	 jL+OMyLZV/PJQ2mp2IUCrbmYYjTk/A+8DENdFjobd5oPQfaermuag9gzSazFkFeXSvZEg
	 kP0nSZPKX+hsg0NFDqrjTS1HjhyUiHebO60GwBv3S4R7Xo6S/X6W+/vlT2ZlN0a3BgVKy
	 sSqsOHtEyPUml03Ooyr/Pz3uYMOxujp7xkUcpBxq2sZVxq7bcABxFrlWRehfuxv6LQOh5
	 MiVXg1mAkX/lyJrwVFWzd7yV7zS2LcLxTpY2hvn/luvPxsKKMd6U5K9ewDXJ/4g2Gvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
	b=41vUFTGBJ6HOeIc5hAPnnSixHF/hIqMd3IEJZy90JZW65Ej73FxOKIorDdCwQBeotSie
	 Ess7roe2kEMA/KSu3J1igk9nk7n/nQELxN4Njx+95z9t2mAdOAIsGDziLM0+l7bxf9Yu0
	 Q5WrWSXiGAJTCnMaqoVITsbRq/COMnUNibdFv65LQ3peDxXkQ3Qqzo96KcfZo34AO1U67
	 BhYJAhRBWAdafPt+SOOKghOEe9nTGx6T7NAHo46vEA0pwTp34nC9H2Z/s7ggj8fYFkG+7
	 Rmd310lqlPrueiIErloYGsMegfiV+IBp/r6ZAiWstAblTnIirO2ssPF8C8sLvk2kTLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JkIeu8tB;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3468606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3468606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JkIeu8tB
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36ff9c9da34so25030eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131717; x=1794736517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
        b=JkIeu8tBbHiZgQwmyx2ybj3vfbRQAr2mZSXi7O0JQz78COxN6x2rM41N2IyZ4fUDQD
         wgQKWj0R/Xw6oKMKYw54uFMKQv+aNeKxVBiAjBA+AQFt/X6YIlZDuyhndWWuLSxazreU
         zDI9fXIFTm/YOGhc4ANdhwp/EvMaW9phzy2Bm2RsYet4UAPMkpFboui+Kml3lANnjOiE
         kDVwnNuMO/6v8D2sahigBz4ML8W/POalLD9zi6992asnrhHtJriy6Qp7idOebgHrjmVr
         /m2uVw8eEDXPOsUQNG6dJQKSFayCHZ/149q7IOTDsTWFvdQ04FqPOrKjp2UYOLnbftwh
         nq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131717; x=1794736517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
        b=RKy6dR3YlwT936U9OjZ1iTwBShOLIpP6HIaOOuwnOZH7FL/ktCttZ9Rzi7jMYQ+6Bx
         uyrVYH30qu2NaQQ+hE9bAaweWvumEKPz7LN7ltu8AmVnkj0NRjLKqYi3zCOsVOa9sypl
         +vMIFyibb7I1sMbiBpRIYLFBVhrZGjHD+/czreaaSAfW6gKusWwvBTq/an6LW/ycijLq
         Y7Gjo0e+Kh3nhu3rrnsdnhuuNkN/perY1Mlt0W1eDwAVO8OraWBSowWPgrLFa8fU1ttK
         C9YczE51ic7v55hmrmGw3sIw3cGUwEp57DUZTarVmbN83qh17kyb40KaTmyXj4FatEf2
         qciw==
X-Gm-Message-State: APuU4Z+pNC6K5I46VazdX6BCteDTIAQbFLwms/3L95DOYD2CPo66wsr7
	5FcJNIIx3aO8AbZsgE5YfTVuVRuGhnJPO+lfkomubDh9qKuekXvOMJn7
X-Gm-Gg: AYBFou18W22oUeIma0JZG1N/AVH4RVY1W/hZ9IddcbY/etu5DUZVIXXAx6fXVg192YW
	QVIIK/4zKZCO2zopfZx9vKqjXquaGVRNapFRhKphs7mX1IyIwG4rznoZ+1aKpYURtxVuwlqaCPG
	m1LfwW9D2fpOvPW+I5XC89r9ckdyQTVMx2dADTJ76Oa2n8ZHAkyoTbN9qF+NX8FKY4rCxHDPtEO
	yPo+alKd9+DBz3VEZX+6WUMSt2H6eBtYw7BadRcMSgRyDIZ/y99ijmAta4RqqhKbKWBybATXvhN
	QnI/9pspVAUwA8yt02QT5thck7VTcROmMXnaRJ+5XK3ZFPhTGkLrHuv6CrJj0R2DuYwsBHvCpeo
	UeDetL50w60WPswiVvuMfwa4zVm0HtFiGYj6XY2ct8b9/7gUSfRaBAgI1QK8aS6k//1YY1ghQub
	4zGWDKHiW87r8EIJdtZMLaAXAeeDUfjeAsDuj5CImlPYcgBWDQmy6aqkAsJMQTi7bR7nrMCzjYe
	8BnwuHBbR6q4AVj8xGZcWlxnEP85tCHPu3KWQ8pzsdgLmkcybj05dAfaU9gOzjzinI12OQ71ety
	z7sS8G8nlGfr7bKVHpPXJIo0s1z4Pepae1hXbplT5rgaEqbfB4U=
X-Received: by 2002:a05:7301:fc81:b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-372570dae47mr2109524eec.30.1794131716767;
        Sun, 08 Nov 2026 01:55:16 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c0701csm4351128eec.13.2026.11.08.01.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:55:16 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: control: Fix parsing of numeric fields
Date: Sun,  8 Nov 2026 09:54:30 +0000
Message-ID: <20261108095430.3300-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106162357.3616-1-sreekuttan2156239@gmail.com>
References: <20261106162357.3616-1-sreekuttan2156239@gmail.com>
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

I looked into using simple_strtoul(), but noticed that it is deprecated. 
kstrtoul() does not provide an end pointer either.

Would it be reasonable to retain the delimiter-first approach with 
kstrtouint(), as in v2?

Thanks,
Sreeraj
