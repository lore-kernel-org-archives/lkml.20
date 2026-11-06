Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939429;
	b=Ml2uVoLNN3qMbGm1khFPp/6wdv+YPo6iIufMufK9rtr8+GsTkojpmDNUGVfAXJ53o6bD
	 iMFmKqTlArVe3mVMR0Ix993/62LO9w3aLNupcme0UBTZxlARsJUk+GqUiwHO1qrmb7L4V
	 2BeazLmHYUVo5Hhf3i3QKIUsZAS+hfLSDVpqgywN6ftLSl+PQVAB9O2rKgbXRTj7eTVTz
	 72LhxyDMjlfK+rZbEvUKlGudoQkP6AySZ1FKmCV40ow6hOBSNgUrsIcoGcE3gVsLr5RNf
	 Emol4wCXq90H2ueEC3jMxsklZbM2jxD8p+68UpWwAYvmBQAprlvVMrY5aqIJ4dtCE4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7G6ubWNxEJnm/5usRwRUK4RV0GJVedj8s47HCFOXdQA=;
	b=ESHIZixQYEn+ktDt/BObdkyhW7pPXQqA9+roJkkjfQQNkS/xZoeEBtTGmaTtu+7d0qkG
	 iCLwJX/It68MclcrdEHvr0fuOtHJeg6FAC4iQAzd5Qcru4QXjYC/l9jII/Btwvj9aQqvJ
	 9OEitECBdTRcdh3ZZarNwtySJNcDu0UumxW+tuWesSgI+arS0abez0hwJQJOugFhVSb3L
	 EihTFCK7ZW3M902KN+Jciw/IyiReRXz/Ipra7efNgjpS5pY0SwO7kp6Dviz2GScNTyCE2
	 XAs9m6a8SoUDztXbqFxZ6L72bkfKAdLe1TvHgCC5tEB2HNBoC7K9DxodTUhLCjnJP3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxBReIVM;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640A606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1640A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxBReIVM
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67bf3c6654fso224040d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939428; x=1794544228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7G6ubWNxEJnm/5usRwRUK4RV0GJVedj8s47HCFOXdQA=;
        b=LxBReIVMNpmlU/klkL+H0PKfZ/be2sJv4OxjMB6EfEEZjCNETRMsb28aLoX1Ve4FIQ
         DgYlQStQ0k6zWe/2wWO4rpWIq85UcsMJ+Smo2KG41zbeN3pewgdqs4dOXBKkjAVwuTlx
         cxrBUZDXT5EA3FnOi8SmU6vLED1numPmREWy5Hwr0l8rfegQWdkrZ7fHWf0c5VEPucT5
         s/yWWUdMKGkPlvFx66eKxnZIXcaUTKIgYlipbKlrOmhWRbvxWlcODf7nG/MHBPYgfC9T
         s4rq5SHvp5YonkkUh3N2sFOcj8QklxYIlJnLhMQj/0eAmkqZRo4TOaB1iyK6b3kStICn
         8B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939428; x=1794544228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7G6ubWNxEJnm/5usRwRUK4RV0GJVedj8s47HCFOXdQA=;
        b=bD9ikeHNDHz+1FJKO8F48FcXZ2k7LTx0jsbMJmHE9hPJLhQkERlpGlBCFe8ei7Ahd8
         WGvEZVlNkWfd6M5g4kySBlBb1nq0QQkwv/sdbTYOgOdOjvUhhotYlqRQnZOyPeY/b3u6
         lUlM668joQWiortC+r2INxHmE4fhPxJzbk7zDCiecHMA9MOoPHilqmVlMAhuZ+dltbxy
         MK/9YoFTWkjDTu6Xq9pydymdGaiaZMwwAiLIKinC6ZxTiGKDDiaZ1nYjvcr3qw+mBwYz
         1eTSc3gN/X5NCE/2suq77ZHQ30DO6rlLRbKY+yPrrZlo/X0y5z1MH1ISn/T9QvrRCp2J
         ix5Q==
X-Forwarded-Encrypted: i=1; AL+hErEPapZ5mf/+cVHpj/9q6UObnWC1DzW3U23EF3pdNs8Q9QXfRCl0QNV9lZYOL7RNDyJ0TDcfQOPTlZ0o41A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2cG0q0NvAZ5Y7MvQsQuiO4L87PC9faXha9aKlTQBXuqgJgkSz
	3ixBS6oHifRby8nZM2HdhUrplbSymn0GKE8XwVbRocfEoIULmMp6RBKF
X-Gm-Gg: AYBFou3dgyP5etPM6r+YZFc5hnGYyaN3eFQsvCUCwg7l9w8QU4VWNQWDujP3Y6eSVD/
	J4O24kL/Hlqbc9dT5hm8JEQgl2i9IaUB/+340sicCmkkkI1gqjThnbpvDhO9MLO/6Yf+mLJUIAG
	lurC6aiZSaakS86vbFe+mJzzcmjeQ20wTLW+D+Hsyz3gGnf4fNdGRjL3MXv5KOm5L6hn5yxOblV
	2y7UQbC39sQTRWJ0hPkhXNJG6jJj4aAuq5RHqv+QV+3eWkr1BvgKC4V+Zj5CFng04w71fLSQMaj
	bqtyYnbtsnDT+DK+iGLZJaX2nNs+sUPARRBkWPZlNurW6d7B8w9e6WAzKqwuxeHaqC3RXu0rZVc
	dnVbAvBSZdavSaCorTXHp92LdM0xXvHgEr3FoEIcR+7rRy4GONPFEiQlwwxDLKaNpKw3VPtnfkn
	weeMgzhg98LQ3qmbpvxecdc+Yj1FIVJK3oE9BM+dFqy2K4RnpcdPwhvcXJNHDWk+NkKI9oH2fAT
	/ZvoV33COVxNo4zy0LhfdWAtW6WITe9bGl1w0paqfiAqIesvTQwaT/dDA/BqaNS9f+SVtDT3Ika
	gu69wX1rkkLJ7UUxpPJlVWNP2wcy0IAx+JZMf5Q2QkQl8KRC78cDMn9p6FD+DSL6oaqhcChpNSZ
	WmATzoPNwEg==
X-Received: by 2002:a53:d9ca:0:b0:679:f885:cc16 with SMTP id 956f58d0204a3-67c14442d1emr555370d50.83.1793939427978;
        Thu, 05 Nov 2026 20:30:27 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c135de73csm1164634d50.18.2026.11.05.20.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:27 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:21 -0500
Subject: [PATCH v7 02/14] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
 logging options call
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-alpha-profileme-v7-2-c474e892abb0@gmail.com>
References: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
In-Reply-To: <20261105-alpha-profileme-v7-0-c474e892abb0@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=55HbKGU8JmFCdaXO+TdbP25wCaTvQMNhrLfu9ImNY30=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht+JfOuxdt/+L2WP56SUS2kkXjR7yvL9xPXbNutPN
 TUtb3pzuuMjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCusZNjZJj6+V2twO
 yji+6ZPzkWfCYpT9LRM8NpxcvrIS2B1ikZTVMYGe789OB9ZLDPJ7IqcGO4UvHZiV+fX/4cULmi7
 K1qTFXaWhYA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
logging options call takes a flag in bit 0 where 0 means "count all
processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
0.

Table E-18 of the Alpha Architecture Reference Manual gives bit 0 the
opposite sense, but the PALcode in the ES40 and ES47 firmware agrees
with the above: it sets I_CTL[SPCE], which enables counting for all
processes, unless bit 0 is set. Linux never sets the PME bit in the
PCB, so if 0 meant "selected processes only", nothing would be counted.

Add a name for that argument and pass it instead. No functional change.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 2 ++
 arch/alpha/kernel/perf_event.c     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index c97b82a1f7db..1fa9bc813263 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -23,6 +23,8 @@
 #define PERFMON_CMD_I_STAT 8
 #define PERFMON_CMD_PMPC 9
 
+/* PERFMON_CMD_LOGGING_OPTIONS arguments */
+#define PERFMON_CMD_LOGGING_ALL 0
 
 /* EV5/EV56/PCA56 Counters */
 #define EV5_PCTR_0 (1UL<<0)
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index f77abeeb25b8..bb0692e93748 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -734,7 +734,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
 		maybe_change_configuration(cpuc);
 
 		/* Start counting the desired events. */
-		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGGREGATE);
+		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGING_ALL);
 		wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 	}

-- 
2.55.0

