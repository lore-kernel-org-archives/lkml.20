Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939455;
	b=G13YUQqIfPpQsYkmw3H0/9Ey5oTVaUk+rjbpa/auD5d6ZdSCZPVCim9vx2q/NA1inFyK
	 af78613PfbKFs+rS6Vbro3revBbhX2uN7hr1s1qidHm6QcOXaaeagXvDlsf5+60IbbMm/
	 Zq634hcnSHpbAumoT9htfAOP7/dF/9fj9CFgD+sGU9yWKHQFHi9sn2tLwVjHgFTa2RAy2
	 vz58a4jKvs5t40JtAv0s6h9WqnAO54Ryi6Vv35VLdW/8fMYHy/rxDafBOyeWbTCUqmV75
	 18AmdBu72AAMbhbiAKUk2AbEv3ISLdYJ4uijPSodrQI58CrSlGquJuC71GX03Rr9ewA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6pY9oYrBmZ0/EKuaAKL4Y9cNMnWHHJFhPtzKsqAxM1g=;
	b=HefRo/sDPbjMdU3jS6lc51bAcwCWnCNh7ajIlbDYEherDvUkJeFCBgSMZM9X0KcfBaOZ
	 yh2SW0uZMzfmuseadU6VcqlDhTMvySYvRx5nrpByf8Y7oeJAIvuCz9Z1fjQeiLTMXgKVM
	 cu53Yge4KKhzdyyOt3z6byENx4TXOhjb6PW84awzEFNAbozSPMIrwUI4Eo24XX7xImzxz
	 MR6R/K+di9BkgB9F595EkIE5BqjJGdHT2tWt/mLjzpTgMdLQzc5cq3d7Uuk3l++zKCkF4
	 tsFDOC4lnxpH7v/i6ezcXz2O0VkLrTGKfD6n2hqmrvlktYaXlG5T1RuSydSvfgINmmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v56mdQ4q;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4312606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4312606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v56mdQ4q
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b305d38bafso1186887b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939454; x=1794544254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pY9oYrBmZ0/EKuaAKL4Y9cNMnWHHJFhPtzKsqAxM1g=;
        b=v56mdQ4qOkfjzA9lBcHkXhWtCEjEkODiJZp7zn8qRnVfpezmFM9ggr9bm/XkOhSFHs
         egQOsAp8ifwG3BqQulSDBha8H3pC/tvQM/0cxgpGnl+0gupizNhM8nJs+vyxvXUgYmf0
         dPVkteV3Yx5RNlJH3FJgDW1+lr+yodXMSy1iLqISTqIpxcBL9fm61CyPCaiioWtoa45x
         epUsFRLRnVBNmGfCV5h/dbPevPGASB9lLeF6RyDJaEgCLXuegqZrVJYemUVzp+d4ww0I
         7njVwOKHrcgjztHjdW3CX6lZzHhW/ceBns784uaRFGxcj5dGMdOvJ4XRkPTdMjKxnA/x
         wzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939454; x=1794544254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pY9oYrBmZ0/EKuaAKL4Y9cNMnWHHJFhPtzKsqAxM1g=;
        b=tAlHG8BQQQsXK7CSm5078pAitz1Ta7E6822JM6P2EM5VcoHfQBeVhizYdTNpmnAyda
         ylyKjmvUavvs+5mRSOLrO0AOOBp3CtGr4eKaEi/IER24OyJx0+oSrWQHq64zFEv5ovrQ
         AVAY8plpa4cjyzLK58EdlMPo4w3KD1KNFg+K6IWy17dMoFQW83zlHX/nAEoXbxT1C24X
         B/3cTyEZpcgK9/eA8+47zyoQz8AszIdlhz3Rmo5nGVMF1V7l22g5RqmNJYBg9TbtuFLB
         ulLuwy8pAdX5jqmZv/YZbjzsxnA74UNbVQQ0BcFnPE2tkCV9FWoxWUwt3XmhJdTEQNKC
         qzzQ==
X-Forwarded-Encrypted: i=1; AL+hErGzoIKhVXeCBnIOm1v0oNVt92mBOPdbT/hkI9TLhZ20Cse3t0E9SeF70HUZsYo7MUn84rPjpp6gqG/u5sU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fLpEl34wdWFHkPKz8+LkmMER4JMCISWGxLkykuhoiGAfO1Kn9
	kMJA3unrayWenZJCzj6ljUPNZuZdv4U6RMAqtKCbqbqYm4OlKzWolCYc
X-Gm-Gg: AYBFou087v5umihmDodTBZx57RlVsjhVvVTG94Vby/4lB/QWIjXZiROpIUSKYevXpdS
	vsJHCjjrViH8LFFBHcsFDDobZyYco14xNG/D2lDzGoPoBx4f8wwZ1iFCM65MeQM0ogablxQ1UbP
	hAzanTbF/7jH/1QonWprwmYqa+fJD2XQKEkzhsE9mUJDt1XbViOjWUFY+LjZ5Wo82UkTb7NpOZv
	HcggOk5Q5OgBnWzlLZk9RwW1wIrcQ5rQID2dKpTiU1MI5a6TeOTvlmAEINSEi5B2vj7a7Q/kG0r
	RGX04UarCC55PefQCGbg3G4lxj9CcgF0WDZHPdUzRjDrBEK4BTB5sFv+T6kQr5S+uPdseXOUh5o
	FuSPChRV4i4YyV9eYZ38DvUOID8K3zonZBbrjQd4bZn6Pemu+KHxZ1F/OuFNFwdW+0FaIMmVYJF
	J9FGriq2/AQmOXRUdJH1D0DMV1ABT7NWxwt4nN6odWCq2mwQzymIeBqTRJZgy4W3Q659bLhOFQr
	mHTDgJsJBhZ8O9pzwUFzIy39gf5KBnW9bO6sjkWWFBxx4VC2l/QZxbiDnlocvPF6IN9mcubNION
	cJoKGx6Lu0Xtibzk9LNA45oVI50mgUhiHOjkz4wC0xkGDZmaIgo+FCM9i+zOOWHdxDR6I5F5P7Q
	coDFOX6avug==
X-Received: by 2002:a05:690c:c0d6:b0:887:f4fc:ed49 with SMTP id 00721157ae682-8b341afce3amr6938077b3.50.1793939453498;
        Thu, 05 Nov 2026 20:30:53 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f865b4esm11357757b3.39.2026.11.05.20.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:30:52 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 05 Nov 2026 23:30:31 -0500
Subject: [PATCH v7 12/14] alpha/perf: add ProfileMe sample filters
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
Message-Id: <20261105-alpha-profileme-v7-12-c474e892abb0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6520; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=guz9PdCEHj/OWYcfh9fKRX97INdfiWY3upKk0j4FFCY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLeht9du/79gdvTY7nN7YtZLmm5CJb9yFnUFP+s1e0Tw
 6P0H4uUOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa6a8ZGY53eD7l+i
 VZuD/PR5qpsKzu/bSKTo03E8Xlyz0Wpvyacojhn8mWnH0Kx1rCC4/8cP764cONWydWGLEzd+2Y2
 mYl719zjRMA
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
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/wrperfmon.h | 10 +++++
 arch/alpha/kernel/perf_event.c     | 83 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/alpha/include/asm/wrperfmon.h b/arch/alpha/include/asm/wrperfmon.h
index dc24c7cb45db..6526438e73ee 100644
--- a/arch/alpha/include/asm/wrperfmon.h
+++ b/arch/alpha/include/asm/wrperfmon.h
@@ -106,9 +106,14 @@
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
 
 #define EV67_PCTR_VAL (1UL<<1)
 #define EV67_PCTR_PM_KILLED_BM (1UL<<26)
@@ -116,5 +121,10 @@
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
index 803ec99cb9ae..332ff19ffd95 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -42,6 +42,13 @@
 #define ALPHA_PERF_CONFIG_EVENT		0xffULL
 #define ALPHA_PERF_CONFIG_PROFILEME	BIT_ULL(8)
 #define ALPHA_PERF_CONFIG_RANDOMIZE	BIT_ULL(9)
+/* attr.config1 of a ProfileMe event: which instructions to keep samples of. */
+#define ALPHA_PERF_CONFIG1_RETIRED	BIT_ULL(0)
+#define ALPHA_PERF_CONFIG1_MISPREDICT	BIT_ULL(1)
+#define ALPHA_PERF_CONFIG1_TRAPPED	BIT_ULL(2)
+#define ALPHA_PERF_CONFIG1_FILTERS	(ALPHA_PERF_CONFIG1_RETIRED | \
+					 ALPHA_PERF_CONFIG1_MISPREDICT | \
+					 ALPHA_PERF_CONFIG1_TRAPPED)
 
 /* hw_perf_event.flags */
 #define ALPHA_PERF_FLAG_WRAPPED		0x1
@@ -261,11 +268,17 @@ static int ev67_raw_event_valid(u64 config)
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
 
@@ -831,6 +844,12 @@ static int __hw_perf_event_init(struct perf_event *event)
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
@@ -1071,6 +1090,62 @@ static bool alpha_profileme_trp(unsigned long i_stat, unsigned long pctr_ctl)
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
 /* What the memory instruction at pc does, or PERF_MEM_OP_NA. */
 static u64 alpha_profileme_mem_op(unsigned long pc)
 {
@@ -1181,6 +1256,14 @@ static void alpha_perf_event_profileme(struct perf_event *event,
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

