Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571508;
	b=XtBGNwoHoaEnpZQqhT4NRNyK80LVsggDewPJXYeMEuZaw25oz8BTxmogA0ntuhaQ3c7c
	 vVRIwkOzz8/opt/zmksuqmcBT3BUf5+33JOqQfHZly/kja/y4XGmi5jQOg5D9lpYKm1J2
	 cYvxxC+VRdmrLxgB4azAZo1IoiPy5nRWcVe5SETyAr9OuQQEz5RFfWQccw6cBUL9KxMaD
	 rhr5j9OwY5h+8cEZypy9eH1kwnaP5xhCO8r4ozaoewnb9/JD4qw8+B3SFIF6A+j5j03a4
	 1f+EfBDdaCATIS8BqNj2/i2nb0aG6Znwol8wYgKAUcAAYUK8ltbkP+3uQ3bvyuU5/JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SVSumMJf41m2t1kfH4cBo93/dZv3LW/Up6VpBs7ax7k=;
	b=g/vHSF8u0da+uysMNQ/G5rRUVPAk/F2FIeI6Glfa2np9T4R/g0Q3tozajFafD9JlJdyv
	 X5eoXe6sKcwBz9q8PbdQ6IXvz1aq9VmrFBK6+KYWWz7gI75WOUmccyrWOYIRorhQmdWjm
	 vRNxvQbZRzpzb5gEkDhVnrFUEcfjpvyg/dXGlIEmpb2CccXztoeWhRqciWos8bnpRx3cL
	 R82FnliPT7GUQczPJfFxPro9L/foqggqofGRMSlsjO9Xec82UWE3hsq2Eevs49NEzQHw7
	 wrCAsx0hwD3X6iWwwCeI/9khZjZ4a+KJHFMZ8eQxYLJhdB8i7ShW1Zz0L1mhVfSrWxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKM4Kj6k;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003C606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6003C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LKM4Kj6k
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1438d9363fbso461249c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794571507; x=1795176307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVSumMJf41m2t1kfH4cBo93/dZv3LW/Up6VpBs7ax7k=;
        b=LKM4Kj6k+92jKdvI5GTxqjdQpsk7TFvgGgJoS/rmOaYB06loopKAmN9v+BgMBL33H7
         EsWKdONaY86Al7F/Xh0qUIh0CjPM5BbM2prskdcvJOuKuY/VzfCrF0shfVgUbEGRaA9e
         EciXOOcm4DZTvlp02zYZlJIDbsgO0d68TREEy30dZKeiKFoPlr4L4ULfAOJk1fcibY9h
         oM+jEM62FuHmW0WcGwRopgw4yHB2HdZo2dxTPCoKqeJagFplIok2ojp2J9zaRAkl+WV6
         MJXEBAxb4XwIz6gdFxIPpbYhhNfLLkZnMKyjV4krx4Ohod1indS4xHnerHjHfbLDE06a
         6s9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571507; x=1795176307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SVSumMJf41m2t1kfH4cBo93/dZv3LW/Up6VpBs7ax7k=;
        b=ID6xp6l52z2EmQTCQzlrjrqj6SLUThDJDiEwjFEMOIfnvnHAjuBKti3Tjr97Cu1Pbm
         c0uZUj9lHRf/RlUFeS4EVsDPZpsJ4xmGIso2Qs2+4dwTEo+hwlYWBNk+l7EhzpQVvdTX
         CxhmKrxzTZgQ542f0pZCgc0gTObqsSTA+1HmwRtYHv61eF3x4tl5lySry26qTHozwRx/
         HvF2Ite3mQ19NKDHQWt7hTPacjkVTC68tPqf6W3cXROCucl63HZg6LWD8/UVWSAaCGvX
         bKVUYBREUU0PtQB+0wzzXWH2vY+eY1l9uy/qUcFzYO4CDS9mp3APTYaJlQ6r/GoZeEb0
         MtaA==
X-Forwarded-Encrypted: i=1; AL+hErGgbJnJvr/PxpnUTYX0FH/pzrhw6N/uvwazLny7wI0/FLZsYqFgpHsvqms01lAxIo5GJUGzYJjCmChuEas=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sqzX0eUId0GQiHlbCuhrLCSG991ZQkS/Pqr+ZD0tm9gk0G40l
	6E49jBO4XF+/HmJsHSTt2r2WblCIS0fkA87DdMtCcam2CU/eHE6D0vs=
X-Gm-Gg: AYBFou3NRDpTDhEXZNXxmpVQw4yA742TPdFrvgSzee9xxXrUxBYn74QiKncSt+j+Wpr
	GXfzTVfDy48bf7EMhFOABqR3ZIP/hqzslrfI0Vw3IWYodn58M+OUq054x0haU1abxsXCPBg0w06
	teyFnVo+6Nvat214hqAzwHcjpW+5ONzjub0GYYlevc6NZ/RlWKiAXdwDA4c1TA7kKoS8nSLkjJL
	TvRVCU/epWJjoe/kVfNJR17XClW/GIA5IdJroiOnPRgRAia4n0/lUwbVrVg/81HIcJkPfIPlKm3
	Vek8Kft7x0RLSIXbMB/Si1Q3aBLRlLAafgebT3sheS8R0ns9Kqryf8oQ996+6ueIy74m1hQ8qpA
	gMBvAY9hVrqwNeM9YAQgBwn7Jov9OePlOVgWk+uPSgQghcsdkDjxZJG0xlgEvDZP5VIJKe9sYXr
	RpL//2n7zzpfJOGMyYvv1XM1leWgI9clTKD/yn+ZhgFsq1tcmURli5xsms2MtViLdH9foYZsSKE
	7VLZtYnKYygClVT1twxw5vakRXio66poKGlaNzFOUyctXIvwo6ShFs9d5wbj4onUZWWHHaBjXvQ
	57UdzV6E27OZc/rWTkZA5tR8+JECJvBLmsGPW+Q6D95s5/nLx4yjirND5f8tVAQaXg==
X-Received: by 2002:a05:7022:285:20b0:1b2:3e1d:17ee with SMTP id a92af1059eb24-1b4f5f1f212mr4239072c88.9.1794571505635;
        Fri, 13 Nov 2026 04:05:05 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.205.242.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm8146246c88.8.2026.11.13.04.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:05:04 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: rafael@kernel.org
Cc: atharvatiwarilinuxdev@gmail.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ACPI: processor: Use Apple-specific methods for P/C-states
Date: Fri, 13 Nov 2026 07:04:58 -0500
Message-ID: <20261113120458.1170-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAJZ5v0hHOKFYS4D+CLRiCF0hiRK6SOY=VKJ619rTNauipnHsrA@mail.gmail.com>
References: <CAJZ5v0hHOKFYS4D+CLRiCF0hiRK6SOY=VKJ619rTNauipnHsrA@mail.gmail.com>
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

> Which one is used in older Macs, ACST?

Both, APSS and ACST, i think they were discontinued from T1 macs onwards (so 2016+).
