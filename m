Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738275;
	b=3/3ZlVEgaPNJI2bdWDzDRoT4ZciP+OSzzRR/cDEadNtXQZmaOdgs7B8aZbWCwkTnb5sD
	 3HUyw2JTYTCDvgZbFS3dOHhvCRyxFqoyVCoifkIqJa6aKDtMUQAqcHg1zwDiLnFC+zq+m
	 jb/jGq3YLjYnd1qh8LzQLT40CAcFqXzKAqU7WphgGVl3QqLMwsZseAL4A+errnjo/cWJp
	 wHjWrryCauA4woyoGNxrfDk9fsVnZxFmkFn0c/yngZxWF8Z5xTqI7KQROr1C4ubAtXto6
	 WHiGYyisbOKCf6pnyFQJczcpJROGCRS/5NVNC6Um3EMJhZ71GHHYFkrfxw9PkvbhBTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9Olsw69/wuZhP7E+YczBJfQwbIlVOj9QN8luA1xOpZE=;
	b=DagyG2O3u4jbtp7E1iBMRAWhVaJZMYfAc5nQn/SwrCjTbPvCX9OK+nPsqfdrN+r4v98M
	 FNINb4v8z26rnml/4A9aBWmBIoesgopqzhyHxm0u0O+S1dsnCiTKhs5VkhD9RGqAiJdUu
	 c5nwKYUrJYkEKfE+3ESUo3kKWOMaZ4NLvy+QAd8oNmREGmar8gxkwE2dzsYWQrhm7kUmN
	 mStopUcKTFiKrDbYyms9khWMew5XCKoQmJCdJLREOdiTxzZPPQGy9F8sbAu5Syi4ItQKI
	 JBzbOB7oDsXCVCVX89K6arBSD8RRa7bRptVElVvXCrZNuYQjgmcy43OXrLVrK2pd1pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gt2mjifi;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A7606EEA8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB7A7606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gt2mjifi
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab432273c5so44380137b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738274; x=1794343074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Olsw69/wuZhP7E+YczBJfQwbIlVOj9QN8luA1xOpZE=;
        b=Gt2mjifisTxqk2rwCboT8wxICptS1bjgtXg2MbmVhZlTp+OqPkXxdeCxpB33r3Yq7H
         g2zUZrDqiNweU9mCaBRJahYS6TNVBzIkauJC3EkhCUBpT66zIVKVQ94CVZVa9tS6Nl+j
         BKHbXdeaemlPnWOY1AbrML8nWxHHp0JzqVgJXhcmX/hUBFb7Ana8pyX8zeHA3uHDWthE
         u7cQgI2rBKAoAxXm+GrdM48fY5AU5ikRlAtMF+n5KElc8XRLxHBaxPIR2q/UVWty6Uta
         UCkmWxbJPm0bTXl0h41YPND1pghJ7Jdb6m1P7bB7tI5z+LviJU4WdarLSx5kKE297nUw
         rtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738274; x=1794343074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Olsw69/wuZhP7E+YczBJfQwbIlVOj9QN8luA1xOpZE=;
        b=kyPFLSUq2MjLx24KxuozQjoPQh7ypUwohczR5jBjsYDmdNfgpaZSJEA2u2toleTqx9
         eOQQUOnMFcrES0KcYb0CbgNzDBcB1bqcj0ztqrQAjOBsU2TnR9flw/JVh9uUNGqieDus
         tanPjbEfd4MXhtWyBsJlA6smtOx2NBdINHsRuww/8ZZORiXbG89dDUNO0ICW2FpnkQBF
         9kmr/ASgiKUfeDaDyeYwwxEyWyDNDS81Tjm1FnR9QJjS4nCm87suk7CFQXXoJdxzKRtq
         xTWUNeUcckaPAeMF+OnkEh6mYUWygB7jgE7nufgC+AT7o0K2EjwWA+EiAoFlmRUfacRY
         4XOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHGvd6jyrvgT7ye0sY/sL+uPG+0L916bmT+kANcb3G/I+XyUommTDpROXL1XidPnUUm1sy3Dk/fNP4l0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BtVjK32cSwvk6of2sOvbO66D7R5wXJPYXAjfXBFnmvsxVyOqF
	I7lrbl79kphQDqsCiL9WyAMJO7qWAXgmN1rIHbyvgXAVGAisggAO5FKg
X-Gm-Gg: AYBFou2bYHnz29jgm7OskQC5XkDKB7QH/0l9gtYo1qy9PhCP0f2Ar62ZSE+0kCtmCS+
	Kt3wTDGShpMHTQByA7lSaaLOsTiUW9Sz6OEouJPbNy5/DdskVe8Bntf6BPvm4Z0UUGx0VvVOHox
	FGTq3VVjeeOgjDCBcne14qBWVCiqxYLO9mDRach9nXN8/7RCQJ9XtVFMEefL6JkkBOWdu+wbZw3
	dJBFhSmguADid/HrzY1m4mh8OcVQ7DUDxcxfcLHMUV3kn8rAt4X0CA7VaZ4EQv9aGqv/fPMoaxM
	wZBop8s/UXOGDoFixfwukVhnJiWj90fHKTLahrXuccY6VHe0ZqppqUYl8Hj0p4G4whW9Gd2DI/q
	/weBtHv7cCUFy8epk4p5sPpVniEw2yFSaaAv4QHIplEDNPILH62MgBIBq7a74gKwA7LQbWYbCYw
	5nAiEjzZgP3dDCGZx9vtFw6/Asc7KeE4+zxg8FF1lDAJb7L3oGRnTzOT4vmnz++oHNvcm4wPQ7I
	9EzzkGw3gydF0UmrJfiAasGYEFbF2XTJbjzJHQw3Dqn+iHZjtQk42ucZrqR1hrx2niryVwXthrS
	RYFZF0lnqNEeaNMrIXackez2pKscYNuGW+533Fgh1emMVSKqhENHMgxQjmJyDmXuSW+5UEkTXxU
	zpuKZ6HwCVw==
X-Received: by 2002:a05:690e:4542:10b0:679:abf5:148b with SMTP id 956f58d0204a3-67ba4f86f76mr7417965d50.52.1793738273837;
        Tue, 03 Nov 2026 12:37:53 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee26513bsm147357d50.13.2026.11.03.12.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:37:53 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 03 Nov 2026 15:37:43 -0500
Subject: [PATCH v5 10/11] alpha/perf: add ProfileMe sample filters
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
Message-Id: <20261103-alpha-profileme-v5-10-bbe3937fbf3a@gmail.com>
References: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
In-Reply-To: <20261103-alpha-profileme-v5-0-bbe3937fbf3a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6346; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=MY5R2t1YGLJwxrxKtO5sZNSIjDr+eLG3CkON2H+sw8Q=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJeufFdq15/sWh15u2ogyfqP/dtar10as3MF+nP47cYu
 z0pN1xS1PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXPE5kZGgX6WB6du
 XTi6k3ms8kbZzHncxj/8jS9eFHX9c7kzV5PT4wMuzsi3TW+jA5R4vpvLbEaSOfOTKpcWwnNvOs6
 Z1h9fzlE2YA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

ProfileMe samples any fetched instruction, including those killed on a
wrong path, and what happened to it is only in the PERF_SAMPLE_RAW data.

Add three config1 bits that keep only the samples of instructions that:

  retired     retired. VAL says so for an instruction that did not trap,
              and the trap type for one that did.
  mispredict  were mispredicted conditional branches.
  trapped     trapped, mispredicts included, or caused an ITB miss,
              Istream access violation or interrupt redirect.

A sample must match every bit that is set, as with Arm SPE's
event_filter. The driver drops the samples that do not, and they still
count as interrupts for throttling and frequency mode.

Suggested-by: Ian Rogers <irogers@google.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 11 +++++
 arch/alpha/kernel/perf_event.c     | 83 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index 489b3e073a32..6526438e73ee 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -106,14 +106,25 @@
 #define EV67_I_STAT_MIS (1UL<<40)
 
 /* I_STAT[TRAP_TYPE] values */
+#define EV67_TRAP_REPLAY 0
 #define EV67_TRAP_DTB_DOUBLE_3 2
 #define EV67_TRAP_DTB_DOUBLE_4 3
+#define EV67_TRAP_FEN 4
+#define EV67_TRAP_UNALIGNED 5
 #define EV67_TRAP_DTB_SINGLE 6
+#define EV67_TRAP_DFAULT 7
+#define EV67_TRAP_OPCDEC 8
 
+#define EV67_PCTR_VAL (1UL<<1)
 #define EV67_PCTR_PM_KILLED_BM (1UL<<26)
 
 /* PMPC bits 63:2 hold the profiled PC. Bit 0 set means a PALmode address. */
 #define EV67_PMPC_PAL (1UL<<0)
 #define EV67_PMPC_PC_MASK (~3UL)
+/* PMPC[14:0] of the redirect traps, which do not set I_STAT[TRP] */
+#define EV67_PMPC_PAL_OFFSET_MASK 0x7fffUL
+#define EV67_PMPC_IACV 0x0481
+#define EV67_PMPC_ITB_MISS 0x0581
+#define EV67_PMPC_INTERRUPT 0x0681
 
 #endif
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index 7f53aea261b0..bed671fe726d 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -39,6 +39,13 @@
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
 #define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
+/* attr.config1 of a ProfileMe event: keep only samples of these insns. */
+#define ALPHA_PERF_CONFIG1_RETIRED	BIT_ULL(0)
+#define ALPHA_PERF_CONFIG1_MISPREDICT	BIT_ULL(1)
+#define ALPHA_PERF_CONFIG1_TRAPPED	BIT_ULL(2)
+#define ALPHA_PERF_CONFIG1_FILTERS	(ALPHA_PERF_CONFIG1_RETIRED | \
+					 ALPHA_PERF_CONFIG1_MISPREDICT | \
+					 ALPHA_PERF_CONFIG1_TRAPPED)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_PROFILEME	0x1
@@ -257,11 +264,17 @@ static int ev67_raw_event_valid(u64 config)
 PMU_FORMAT_ATTR(event, "config:0-7");
 PMU_FORMAT_ATTR(profileme, "config:8");
 PMU_FORMAT_ATTR(randomize, "config:9");
+PMU_FORMAT_ATTR(retired, "config1:0");
+PMU_FORMAT_ATTR(mispredict, "config1:1");
+PMU_FORMAT_ATTR(trapped, "config1:2");
 
 static struct attribute *ev67_format_attrs[] = {
 	&format_attr_event.attr,
 	&format_attr_profileme.attr,
 	&format_attr_randomize.attr,
+	&format_attr_retired.attr,
+	&format_attr_mispredict.attr,
+	&format_attr_trapped.attr,
 	NULL,
 };
 
@@ -807,6 +820,12 @@ static int __hw_perf_event_init(struct perf_event *event)
 		return -EINVAL;
 	hwc->flags = profileme ? ALPHA_PERF_FLAG_PROFILEME : 0;
 
+	if (attr->config1 & ~ALPHA_PERF_CONFIG1_FILTERS)
+		return -EINVAL;
+	if (attr->config1 && !profileme)
+		return -EINVAL;
+	hwc->config = attr->config1;
+
 	if (attr->type == PERF_TYPE_RAW &&
 	    (attr->config & ALPHA_PERF_CONFIG_RANDOMIZE)) {
 		if (!profileme)
@@ -1022,6 +1041,62 @@ static bool alpha_profileme_trp(unsigned long i_stat, unsigned long pctr_ctl)
 	return !(pctr_ctl & EV67_PCTR_PM_KILLED_BM) && (i_stat & EV67_I_STAT_TRP);
 }
 
+/*
+ * VAL says whether an instruction that did not trap retired. For one that
+ * did, the trap type decides: these faults abort it, to be replayed,
+ * refetched after a fill, or emulated. Other traps, mispredicts among
+ * them, are counted as retired.
+ */
+static bool alpha_profileme_retired(unsigned long i_stat,
+				    unsigned long pctr_ctl)
+{
+	if (pctr_ctl & EV67_PCTR_PM_KILLED_BM)
+		return false;
+	if (!(i_stat & EV67_I_STAT_TRP))
+		return pctr_ctl & EV67_PCTR_VAL;
+	if (i_stat & EV67_I_STAT_MIS)
+		return true;
+
+	switch ((i_stat >> EV67_I_STAT_TRAP_TYPE_SHIFT) &
+		EV67_I_STAT_TRAP_TYPE_MASK) {
+	case EV67_TRAP_REPLAY:
+	case EV67_TRAP_DTB_DOUBLE_3:
+	case EV67_TRAP_DTB_DOUBLE_4:
+	case EV67_TRAP_FEN:
+	case EV67_TRAP_UNALIGNED:
+	case EV67_TRAP_DTB_SINGLE:
+	case EV67_TRAP_DFAULT:
+	case EV67_TRAP_OPCDEC:
+		return false;
+	default:
+		return true;
+	}
+}
+
+/* What the profiled instruction did, as config1 filter bits. */
+static u64 alpha_profileme_status(unsigned long i_stat,
+				  unsigned long pctr_ctl, unsigned long pmpc)
+{
+	u64 status = 0;
+
+	if (alpha_profileme_retired(i_stat, pctr_ctl))
+		status |= ALPHA_PERF_CONFIG1_RETIRED;
+	if (alpha_profileme_trp(i_stat, pctr_ctl)) {
+		status |= ALPHA_PERF_CONFIG1_TRAPPED;
+		if (i_stat & EV67_I_STAT_MIS)
+			status |= ALPHA_PERF_CONFIG1_MISPREDICT;
+	} else if (pmpc & EV67_PMPC_PAL) {
+		switch (pmpc & EV67_PMPC_PAL_OFFSET_MASK) {
+		case EV67_PMPC_IACV:
+		case EV67_PMPC_ITB_MISS:
+		case EV67_PMPC_INTERRUPT:
+			status |= ALPHA_PERF_CONFIG1_TRAPPED;
+			break;
+		}
+	}
+	return status;
+}
+
 static u64 alpha_profileme_mem_op(unsigned long pc)
 {
 	u32 insn;
@@ -1083,6 +1158,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
 		local64_add(ovr, &hwc->period_left);
 	}
 
+	/* A dropped sample still counts, for throttling and frequency mode. */
+	if ((alpha_profileme_status(i_stat, pctr_ctl, pmpc) & hwc->config) !=
+	    hwc->config) {
+		if (alpha_perf_event_set_period(event, hwc, 0))
+			perf_event_account_interrupt(event);
+		return;
+	}
+
 	/*
 	 * Attribute the sample to the profiled instruction rather than to
 	 * wherever the interrupt landed. perf takes the sample's mode,

-- 
2.55.0

