Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764507;
	b=uRyxOEwwkESQFgxGsjS38Tfmd2Kn07vI4PfNGT5Q2UrEAOt3RNFUZ629KLDsH1ESzkZG
	 vog090yrV1n8j0mrYssQ/oNSErqX6AIzMRtbEAlQLfkTHkBzkARvZQIHc2S61KnCTJpuw
	 Byvzd9p/RNqv9/TqcTJYAziRM1fuiENii9u94xb8DC4k8pSfJGB7f5yXaS2HJcag650NS
	 f9bCyboFSJUOAuJRJB/hVy8mCHJUuZVPIN78ELMQrEb/KOKKSFkHP0maJwPapL7HtJ8fs
	 Muu8iUaR/xaR/B4cozwahlIsiFEW5zLuPKs1NIVU+eExCw9yD9+fkq025eW6UmTifiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tv8jBDwPfWPUczVVh5JF7DB2eeI41qRyApK4ect9U6E=;
	b=aky/pPwuC1cNlERad7xRgtdCIy1eWUAbOoENomNBgFs0Poi/KppGfybOILCS5OMLBGgH
	 N5pAlTLAh6lIYJ+HMB+EDOp83UTpFWEKlQdyHYLOO/xeuqvjKN8iUwZb7GGc1JXFRyFDZ
	 +RiW3is0Mbtk9CgSNOVk7hy8GBMlXGuQJKeCYOMJYKvVCxZUpEbaxFP/x57br1h14Bufe
	 ePaQ/FD7gdtZJqSl/UbhfpO31o8chODXCNDckZbLCYA+ktCy3en8MSQMmmUs1/jKYFtMp
	 1UAFX2eZ7B0uokRTSKio3+z1D/SQjFRz8pHhWpCYNjvHzlfVjakaNpx745uvpkGyKiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BavTgEbc;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E07606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E07606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BavTgEbc
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-881269371acso888889b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764507; x=1793369307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tv8jBDwPfWPUczVVh5JF7DB2eeI41qRyApK4ect9U6E=;
        b=BavTgEbcw5Ftd4vmcFPPbbrH36zuOVeC+iDr8FEDLdCuhuOeRGtlO0oXKg4liq59Cr
         WTfSaNh3D3Fo5dAdwLjUp1PkBkqphJCETgzA0NBYTZ/IVVVZz1pHtH3UkiqJqwnlzWi5
         gTjVLp/iGkpWJArOs3jp0phr5FM5FyoqbwflJgWgljFKVRxseeDNNGFgOpRw7NB9xn9w
         BHUSyri8TRWcEn2+Z+gH7hIRhfZBCDr82hpRWxl7v6kx/2FG84Pb6HhjGsPkBydZtg3z
         EiRPVoJDkFD01jj/UimXzWCJrVEKAPVdLODLOe4jRoe/JQqcdeMPfCbMgCbOfwfe/n42
         z6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764507; x=1793369307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tv8jBDwPfWPUczVVh5JF7DB2eeI41qRyApK4ect9U6E=;
        b=vrjLv4swx5bV+6btqfCxuQN9I8SEi46wtMgg36ekcUkYQFX3wxj7X38c/CQfA1WWfB
         Bp96kyT7h54dzIW/S0bkNEMTVey7kAkqOikJ6RvXS58t2Oj/T8qFF27Y9AuGnvrnAvgL
         TGWNBRf23ch5wJzrd93O6s1LNZRJYU0O+fIyxJFGT4tGNCARQInQQtIGxyUbcWgXFG98
         n8snhKXJr9aBUJNx46e4RRi5g18aztC1jAGFjw7dVL1KA5dPWyjsf+fJV9Sscx0vS5g1
         2eEstmpmq316YcckesZmjs05FMJjJjosGmLWc869WkhTKL/NoNgImgPxtUNXrkTiQfLO
         pbCQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1sJlasJjt+9leK2gE6YoSajNUFy48pM3iFLDr5XNwPqE9AKaqVZwEp+VK5WroxcsahFuFflE4LNW3O/E=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9ykryLy+XIAuklhDr8Ovxyxi8qvY0CljcI6YQQw6DQMWSyIxr
	jU80bD1jG/Ky9HOH1k9cOXeODEAeMJheVHbwGkh96co62f9LIp+WCG0r
X-Gm-Gg: AYBFou2l57o1pNS8JPNC4SVP9BmIBZXaSYm2Em/OIXbLKrRk06AEqdvnj6sz+bbHuKM
	pxHy9C+N/dXpubfFRkUzgNMfXEPKMe8IZ86Z5YoEcpcTIvGNO/hPHiSc/toqwMyahhivh5q74MO
	hFtqF/poiY1g+stl7NQGevW5cigpuwbhRWXKyfClou3OO4PvnapmpiSBqW/ZobqDNER9Mzcpu5+
	IcH26Y3pB9Nru8cczr5hoM0E3ITbyQQ6t10NQ0e3jP2kND6jBjOjx3t0lHaIafaBuMvt+5JEq7G
	E2DrmcDbtmGEy3wNZYuoYp76FDx742gTox2kKa9P4sfn9fBv52Yued9ZPSERoZ1S1+RAjbEb8Z+
	H8V6MSoXdPlMOb7+LY3cRCXreeZ0lcHT1J84nGinWUlDJNXu6EOzXDyMVqxfQkP0tY0mQ42vuZA
	MtJAdF6S4mN0753+B9sS3m1LyGi/vkBLEHisec26rU1X6wJfS7XhzHXOEwYziO4K3SG61ypfhqF
	G+purBYFXjePneekSR2BiQMgOMwD1ydBVp1tCsjo+No9JDZ573KLV1/J7gL
X-Received: by 2002:a05:6300:86:b0:3de:3f4d:f2bd with SMTP id adf61e73a8af0-3e359a4186fmr1313009637.6.1792764506480;
        Fri, 23 Oct 2026 07:08:26 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a338ef8352sm6443b3a.28.2026.10.23.07.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:08:25 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Yury Norov <ynorov@nvidia.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] csky: bitops: Use the compiler builtin for __fls()
Date: Fri, 23 Oct 2026 22:08:06 +0800
Message-Id: <20261023140806.1367050-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <atpm00m6KYhXo6Wi@yury>
References: <20261022115922.1210342-1-shingekinocore@gmail.com> <atpm00m6KYhXo6Wi@yury>
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

On Thu, Oct 22, 2026 at 03:41:07PM -0400, Yury Norov wrote:
> So I didn't understand if you have an access to the hardware or not. I
> don't know the story behind using the non-generic version of ffl(),
> but it may be for performance reasons. Can you / someone else please
> run the lib/find_bit_benchmark.c on real hardware before we move this?

No, I have no csky hardware; all run-time tests were under XuanTie's
QEMU.

The ff1 asm is in fls(), which the patch keeps. __fls() has been a C
wrapper around it, fls(x) - 1, since the 2018 port (735ee005c371), with
no reason recorded. The builtin compiles to the same ff1: 4
instructions before and after with every GCC 9 to 16 and CPU tested,
so __fls() itself is neither faster nor slower. The gain is elsewhere:
the builtin folds constant arguments and merges repeated calls, which
saves 128 to 320 bytes of text. It is the csky part of the conversions
Arnd suggested in the ffs()/fls() thread (the Link: in the patch).

In lib/find_bit_benchmark.c only find_last_bit() reaches __fls(); the
other six tests use the unchanged __ffs() asm. _find_last_bit() is 27
instructions with one ff1 before and after with GCC 10 to 16 (28 -> 27
with GCC 9), and under QEMU with -icount it executes the same number of
instructions per call before and after with GCC 12 and 16, one fewer
with GCC 9. QEMU has no pipeline model, so a real core could still
differ.

Guo Ren, or anyone with a CK8xx board: could you run the benchmark
(CONFIG_FIND_BIT_BENCHMARK=y) before and after? I'm happy to wait.

Thanks,
Tzu-Ching
