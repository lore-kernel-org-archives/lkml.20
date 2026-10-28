Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210976;
	b=dMseVuPc2Ho7Fetpk6Xj1JskhQeMZrHnkqn3JVSRSJglJtnvc0zqeeAmicGv9C1AgnW2
	 FlL6bl7s5ciPQnMHzLUTraV10OXqpVvmKW7AsRBeQInzJ9sbhV4f8KlEX02+/hwFrjAz+
	 VFqCFzAQrHULigkAGzf/EE4X6HelJV5rQIAgW9akrvpqMPhEeRoDJ5P4vF3eJXtFm3dqu
	 jmaI7cpeetgi1jc+DmSnp0LM6AdMTVnCyo1GC1sNDd7j3hi8DWzaQyRl7mKpPCb3egM9V
	 DnTwKU9jtnqtegSJSzFT5l37mpsFXmici5jR+1c7exb+5CklpnH1ETsalq8VFYJ3qWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/vqQgHDk1WLosiTLVebj4v51HZsTIvMRFuss6Ev/st4=;
	b=KvY9M1LOjzpR6YRzghunX6rFq7+epOjMCqaSo5nGP9VnYFtGl2q3swyT8pn+y39Jrz9J
	 OHikki7l/01HPRlAv6LquiOgrbq2TknCES2Z3iuXhM0puh/fX0gnAOxFe6qrEMbNASlHw
	 0eQRA+oOoZwBkZLZECiILiSe+4wls8h1yQduCVYhJ6m3rdjXVxbxhpYG4vGZbrhjF7Ger
	 oGIXHPVhrPUOZcScsLhFD+yLNPbcGABpsClpisGsPX+ObgQXe5guUeMv5UfS8xrKcb+fJ
	 g4qMv2DTm+5AuJlW/VAUZN++JElulxXJ1N7jctoYvyqQX7Qj8OjR5KxAltSFCPUoDMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpCZoe94;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB05F606A333
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB05F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xpCZoe94
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679e86015e2so2657603d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793210975; x=1793815775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vqQgHDk1WLosiTLVebj4v51HZsTIvMRFuss6Ev/st4=;
        b=xpCZoe94lmDysxUBokHkiyKcQh2wKEvfn4+foE/vgzfqcoP2trAGV63Kv6LOl8IchU
         jobWNTXZV1Y08ds9aDV38IcfSJAPV1E0h6M1o9DiyMDAAEbBTZkp+QFHVXFmliz1or4r
         396bDIzKij14nMA/0NbdjsclxxiygMBHunXEXLwxTSU6sBSWAVw23+GKOAITzsoFUFCC
         Al2QechxMkdfmep+giR1zsw/fhwsphyuOLYEx/+vxoUHzmoV8n3QqcKxyPXpfsAnbvf3
         77QxAqG5QiJBtQHH/vkR+BT9+3cryFVrqAJ+sGhtfPF47AMlKjewEO5txq20ITOmhtDh
         XIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210975; x=1793815775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vqQgHDk1WLosiTLVebj4v51HZsTIvMRFuss6Ev/st4=;
        b=dln5QYOC5cv/G3kzCpCyB50tGhb3W6G9D2Qj95py5n71Es2jI9Gic8ntQGZIq6TFrq
         kMXjHHyVBTo7g5fAiI4bgOulUbdRJyyiAVrvcRR7A4AyuuAslTVqBXgG0uGrjfyz0G28
         vF4paIkAU50wJB96KszHcMmtz8JjHF5fQ3x0Law/au9zpMRV4w5vNNR6p8FEv/4MD5sP
         BZFxIkHEt0CidbUWeFaKlTxDA83fWvVxopVfDIUepA8Y8P4QO3uBfoaNcz4cjoSZXWDv
         Bskxe4Ll7sF9/qjsrJQgOtKBQoUY+4m15vrFpNy+Odt8nx8cjJBPpclgTO6qg67jiNW+
         ryIw==
X-Forwarded-Encrypted: i=1; AKwUvByhbvC4mbf1p8pFfYq4c6iPkOtlho9jlExq2hQfcogIBt/V7kipwMfO7LIAL09CBgZ4HbUDMd0Nd/8/IuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDq0WJSiWglyTLniF1ObdxJHNdk+VdkFKxUEjMgysRHsndamlR
	9kE6ABtSWG5Ob0PM4L9Pj7NfF2O4ao321huusb21ZExSm2tpp4r98XmE
X-Gm-Gg: AYBFou38AA7lAh1faO+8yGODVShkM5XhC71J8Tkb85zAFKDtyQtSmCrpR4qEMfIDNsv
	R+cLEKx29mclLniBO8jsnP7rXAl3URYHf6AJsavPPmjG+YF6nL8eyN3SdPdRO9sraz5VM0Iwksr
	2yIY6vtTx31BllwrgiCVga8BL6Pg/6lgQYdcfL9y1cXDTX/v8n1BT3kh+67C7k5KwRJphEtV5MV
	L4acPZDOK3uOpKQZiwdRPmrQPuxoLi+/EeQ5pWR0bDJI5XrfPFDElVsUbM14WCn5bTKNDX24FM0
	bElv+f29n1+a/dVHlMtQMPSX0EK7HXY9yqYUcG0QdPQUDh9UeOG5U0pgnEPtr1rVYVN/IiTS1r0
	J+LVJrqjuV31VNkNwQc1yXYU4pUMdCjNuGUaS6Tj3kFgl0MIqw8n+Fq1ZVsi1GseVA2KPBOIzLX
	paGNm4co5qdzkjxhFYl8xed/NeHgd813KA0lVjuuPxSonClbxWtfhuA5UnQP5nbSYW0s4Txrfj9
	erIWikky6/mnhQhdNoX+1Fmi2rvKdaYRNIgFeJQ++wkg85ACF0ZJoitxRbb7PyWbKgO+rHC10dK
	9aOdqcWQfAVCdb32R8vz/+QxCtW1FJxNOtpBjrTpZQ+GaEIM1g6BWjW5t8ikHNhgVJIa4uHRQl5
	gcSGc8MEePw==
X-Received: by 2002:a53:e951:0:b0:679:98b1:cba4 with SMTP id 956f58d0204a3-67a8d67b3a1mr149956d50.53.1793210974596;
        Wed, 28 Oct 2026 11:09:34 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e53a239sm33011257b3.15.2026.10.28.11.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:09:33 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 28 Oct 2026 14:09:30 -0400
Subject: [PATCH 1/5] alpha/perf: pass PERFMON_CMD_LOGGING_ALL to the
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
Message-Id: <20261028-alpha-profileme-v1-1-d44b52bf2500@gmail.com>
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
In-Reply-To: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=3obaEks2ChZv/Pid8H3lX3f3kn9UevG608orOAig+Uc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIeWUVlmYjNFV0x/T3/HX7viR9OTBZkXNo6Vbep2dWvw
 KjxstnVjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnm9ExGhoYwtVk/zI
 /+spNjiZn6NFqHwer3E1OubzxJK2fe7DOu02H4n6ek+sVHNjLsi9DkW8+jzA508ef8nsN6vU6H8
 amNz8vlPAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

alpha_pmu_enable() passes EV67_PCTR_MODE_AGGREGATE to
PERFMON_CMD_LOGGING_OPTIONS. That constant is the counting mode bit for
PCTR_CTL, which belongs in the PERFMON_CMD_DESIRED_EVENTS argument. The
logging options call takes a flag in bit 0 where 0 means "count all
processes". It works only because EV67_PCTR_MODE_AGGREGATE happens to be
0.

Add a name for that argument and pass it instead. No functional change.

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
index a3eaab094ece..2d9383425357 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -728,7 +728,7 @@ static void alpha_pmu_enable(struct pmu *pmu)
 		maybe_change_configuration(cpuc);
 
 		/* Start counting the desired events. */
-		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, EV67_PCTR_MODE_AGGREGATE);
+		wrperfmon(PERFMON_CMD_LOGGING_OPTIONS, PERFMON_CMD_LOGGING_ALL);
 		wrperfmon(PERFMON_CMD_DESIRED_EVENTS, cpuc->config);
 		wrperfmon(PERFMON_CMD_ENABLE, cpuc->idx_mask);
 	}

-- 
2.55.0

