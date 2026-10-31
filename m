Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468356;
	b=q8mHRtAJkJANWpT5Ps0CpukEV/FHJ7RqpyPi2FViv1LEECUKRDp2k+GSwzWG5JVeQh+w
	 BS0yRgBmyi3hGaqtU7/jnnCZviS/gK1xNX/BWsUVECyoq6+gBRm9eAnnpYSYfLsd/HznH
	 d0bX+jYTEGTfv+xsDfVvt6BHrsgVYz7+YC4RLktFb1iu5zYjnRpjzBl/hJMTHRmxf/wvF
	 u/SDMNKUqp37V6ZZdf/xQ8BGiZSs5pLTWrdURs9rx7nLlNbgxVPtXE9rFQ/5Fj0hWwBM7
	 UvsGkjud0C5YMuc5q+lWCGUcKgaioLejyhMJcX1eOHhpS8Ywon+nZfd+0jDxYZ0txxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
	b=JrtiGbXrsdmYzVMApZQCf8GMbbnRM/zCRhktbKMsf2vS+TYZ7LCL17xxpwtxnWTgKmC8
	 FeIhFE8IwaMixnjm/hTmR+O3WbldmYCl09z9R5lL0UaZSr9tYT7BeENVu9snE1EylOlKB
	 brQRNoid9hmIQLqazDdyA20OQSgdyOvTnh6q+LfY1UVOosY4WiGY8ch/jjkjQBaKBy8FB
	 E50aLuw7Z5+vs87XmRJKUuxCJSFuvao3aaksGXybuHJOsQy94JteBhpPCpmlKR3RGp0ix
	 TDoiHNCOgOnxbuiHCvjTyTw9hk007f3b0eTOF6Be1k7ockx6FVAis5GuKNixvqan4Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AylsZbl8;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940B606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0940B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AylsZbl8
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-14e61bbf1e0so20842c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793468355; x=1794073155; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
        b=AylsZbl8rD/zrNKDrvJnSKn0FCOCurNXnYVPihbd2lSu/OdLgTm6IVDAsekTWCxioF
         EAiIMkmxAcbysGVh+GzJK5fPmJaTOlJFVfDkHn42S85LoLvm9PO1VKl21FRIl9n8pRhg
         BrusB0ZG+yGAU+AhRyzbo5FY7gX7DeCM1wZCwUKkHl0Jv3+mifOFQAfzfWd+RbmsJm/e
         Vep/I5DjYulWWM4KCntGv4D9+Wd9X5xEOknPKleKu3jE36AgAyANSbEHOShTPs2xue/5
         CTXEIBUQkP/lcJVne52Pvo4jzz4F0pIvdMK9/yyFME9eSFQ8U2gqcfFhTyPnhQBbH7Sg
         GN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793468355; x=1794073155;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
        b=j2qYI+Al2vSDHvI+YCYuPRAhc9q1M2PPSemooRWECvIobJh1mbhUX8kfPdEky0tAk4
         UcK2+6FfZELOVAjzgiIb0kgyLSX56oLMjSBXLaH/N8gWuOGW9Dc7tNXbLHNT+OwFFYsx
         B8z71Fa1k4gFZpAEAq7wqbQant23COzv+ayZx2rAJ28MYHVrppi/BJnslsgba4KewgML
         HZH1GoXfw//1EQLRJURc3Rm7o+OTE3F61T/utSjYrjmCrTweVCSXr5qiPZCFbcKazzPI
         7QDe6odeNZsb+4OnqQWMj8SswO7/shmgKvA7JASVbl62qBqXlX/bs4COGmX1SSlWNpUP
         /Q/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAO2xfd303nkd+8ittS0rNSP3wP0cWiiTSmChy4TFe88oNyYPNLGih9fjmo8KQxIUVMVNIQfVN13jQd+g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdCgSvjbOecIWkpD7HThgK3p/upCeKg7bZOj0YUyeIIJJptow6
	Bw+srrNBPfDdnM3TV+iXNDRFQxK4YtFeSQfpsnQSiGmn8nNYJbQ4rywGBsrfBNtFnY8Yde2Q
X-Gm-Gg: AYBFou15VozNJlVSrH/ahji47aSwM68/PPIE88yFUXDJgq+Gv+0aTmUyK8t1xVsCHxn
	KDWgYY4/hG7SIw3UXOm6PoSEEdol63Yy8gGjDZuvCEbcGzgRIeS2xCMbprinPFPPzINXxysxVwE
	8ksiJjURy/0+CKs7igro+C5APgiruhIiUlkIUGze2eB0fdCNh2L8zv6tT0TO3cwnxCV4+v4+Xq2
	XR2xWD2ft72DKnwS9NPGMvppJafqR6rhEUjA+Z7eUDX7WABWfxGvsm8pBucUat5DTEaHDbSKzB0
	IfBkpMmdRJVUbhaa5TXG4NZOBUDC73aPNmpSBxwTUW2rvNfdeZxwCLxxSaK46MiOxQb0zUptks4
	1Mu0XnyMaFo8fRdkuoaAFEX5qK7xrVqES0ZpoKfH/fpcwVYAmJOtKaczPd4I368kL9frl//qf2Y
	PQQXnUbU2QPwB1WzQup/eVF9xtFZFuH7K5Y4BTD7glFASuXsg7i7Q3ODjvXm6Y+en6JL+4+VpZv
	WbQhanGfGMdKkI6nEb84Eqmt3ztwmPoyiaTblNmAobIem8QraSGLH0mzHi+BBkhjr16rZVWD7hN
	dalCANM22HjD/HgyP6Hs8vaDNo5z3K6i979LqnLp8jPO+YfnesynSxs1VbvA2/YD+dD87qa6IsH
	vfnTJXPOQZhD0HaZQaqFEIyRLNNLOM7T4zw==
X-Received: by 2002:a05:7022:258f:b0:19e:78fe:9d67 with SMTP id a92af1059eb24-1ac5a680801mr9985603c88.9.1793468354679;
        Sat, 31 Oct 2026 10:39:14 -0700 (PDT)
Received: from [192.168.50.20] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm19811655c88.13.2026.10.31.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:39:14 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 Shuah Khan <shuah@kernel.org>, stable@vger.kernel.org
Date: Sun, 01 Nov 2026 03:34:41 +1100
Message-ID: <179346448183.4.15545164251841296990@gmail.com>
Subject:
 Re: [RFC PATCH] selftests/damon/sysfs_memcg_path_leak: define ksft_skip
In-Reply-To: <20261031153858.84302-1-sj@kernel.org>
References: <179342136087.2.16978105493403840270@gmail.com>
 <20261031153858.84302-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi SJ,

On Sat, 31 Oct 2026 08:38:58 -0700 SJ Park wrote:

> Thank you for reviewing, Aveline.

Oh, looks like I forgot that. Thanks for the reminder.

That also gives me an idea: maybe I could build a modular tool to help
write emails. Building on b4 might be a good starting point.

Tested the non-root skip path on x86-64 Linux with Bash 5.3.20:
the exit status changed from 0 to 4.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
