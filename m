Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527458;
	b=t24K5MJ86ky2J0JX4u/jnOfWIgs1iFxReXxs1pYTTnSfnbE1TQNof7y3Ysd7vWEYo4Pe
	 rpHzWaxwXdcax1+bauoLTqMPTQHzp1TBSxhmwJdRSg4mZtBD6R6RCwXnO1Z/sCN5gxeRz
	 5cX/nro4WsT8TNsHVdPFB2XPO/2RiUyXVCdMM9LKhRMAgR4WCL0lz96KvwNREg7XEbaDo
	 seaUZgmgggCDWmtxD5mvfDodg9Wa/kY4I+8+viLdUxvJczkS3VTm/Kt+K0aQgUEEpwWIW
	 3HGfrU94++K+ZZ+zxc8KmR4QHlWDEo6ABp0USap8GAtiAoOvVh4ogwvIE0YvObDs7rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LvepHSVm0SGzHPl7b9HwW8l9L6MPRh+0kyrUQ1IwKVw=;
	b=37M9cYAGPONr67OebPbLOaKsIV52iaY33S3VIYLzfOTLfL/s1EVcJXGYnzpx45bg512P
	 fSaYfqN1CtxSGdm7oo0b+PWy2Oaq28uZhomoS0Ebfp3YpeTDP46vqjn8A1Kr+YytFictN
	 GQ3fJ+coyuZ5UAVmAvGGKGkRTE7v8YoCrC5XsWh0AHk4iA0lf7pO0StBMeUBO7OeGoShO
	 HpkEuR1XmVjfA7z7Y4KtV5rqMFiWlmyDAFZWfCYpNlo1cGeL3b8VNztD5aTgC6VNjWm4S
	 sdQ32iEpZq9CALORZ0qbikcSSs/MFgjiVGCvguBs37iKMEHsMG11uym4xRX1cTd7xCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bc3JcbXr;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D55606A890
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D55606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bc3JcbXr
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3704d30b84fso536133eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794527457; x=1795132257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvepHSVm0SGzHPl7b9HwW8l9L6MPRh+0kyrUQ1IwKVw=;
        b=bc3JcbXrCtsd/CYNg3OyEyTObw7+Lw4KvXjAmBkqZqZKWXOLlqjwK2cN69iqji+YBX
         LPAiMcMc7sdpprYXx3nk01ukkrxV6s4HBa8O8BSKFgUdT3UDL6DKvDR15GYTlWwuCeTu
         QwBBS/lrzGZicmkUOi983llt6L0LeJQsx5cuApqFTnrdRfZEtLLeCCoBnIn7hXnP2x6Q
         eeYE3kzLJWHMTMpR+RnW0asDzka2GV/tr2wQ2YS5r6yE3hsO23m2gRvUi1UgHKRnPYHe
         lblOp4YBIr0ycDNOXMRKpqCAx80ia5YbsRa3NGEidLgJvek7CQwtxI5Gif7i97fE6xyh
         bp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794527457; x=1795132257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LvepHSVm0SGzHPl7b9HwW8l9L6MPRh+0kyrUQ1IwKVw=;
        b=icWcVQPdFsdBYOXzHOulJ7mNH6yyl1IqlmSOxMrqpNH7iunDPQAY/cgWNOEo07jMiM
         5EdopVhfPqkn+CwIGcaKfB+vXzFUIqzd8mplRfow2g4vkktmOTbuoc8aRx17mvPsYpgy
         VmnzV1esC+H5dkrAZYTU7oTzySVd1aIbPdekzoXpbORXEVAa6qqaCGQBctwfF48O1W9N
         ofY4MEfuet3itquSme9FIbnj+UPImArBkVX6EoVHGi45+ldF1jqVgngiXDRK8uSfcwCv
         xx0K+jGQI4VY29VF7TDFAOG2q88r7jx1aveVO9AyJrti/olRPS6CKHlShXNDl+vtHhPf
         9kZQ==
X-Forwarded-Encrypted: i=1; AL+hErHtY9o6KSnu8AYq1L32XBWmgnqpfH3x3eKXAYG3P4gwU/ygL6RGI0dNomzlwUGXWGN32qscCbwVoUmQud4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yz3wHf1Jy+TIlp1f/fZnm3YVC82QlQm3XULRwOX0v+JpyXni7
	9kNNPLWgsraTYRmQhuaWuSTKdgCWngr43HAQXPmaz0WtFZRXzWujBE9z
X-Gm-Gg: AYBFou0fB+9Exi4IIuKIkFx+ESP65mX463uXV3Kn1JpQl8vi8sqGzJs4uyQ8/SSB9pL
	gccXwQDfxjmqxnr5MZ/BmDMLvx7jOtA0rjn1PBDw77kOgf+mxDDZ/6tuLdt30RRyUaPn8F07pNU
	lifh+AzRook+QeuaIjsmjbHPUncZTN9izDEK/FJvIl4AxtmDzn+Ome5y8T+vPGnkG/Wk6ZHuswE
	LJA2T2EXG5MCBly66awDSZVPpfubjt7fUI/6kSZSUOB97wcNSSir8p2/ncy/aB/hI9Jecl+uU6I
	vvJYjPSffDUDQsbCNOuE/S4t/t8RnRyU7wvjikWcsLTkJF+63gS0oAJV1boDMMY3hMFaASLp9Oq
	SIXUFlLOY+rJ52XlJRcGDQt3hwY3S4PMYYgavLXTEnaK/ZFEhbUki5UXOD4oQi3lEcH4KTlsnIX
	30AaEWTn3O5v07kYSxZytJHzc8BbNxtrrxNRRosMfT0OQ5fPtG6nhlEfqETpck5eGloaOACeboj
	KjuMk5oIyZ73TCg1F/EesPpO6OHl0RjfucMVHpPhkj4Tc+cul1qw67PUaEJT70sRoqJUFH+teHy
	hwow0DheYqmxKOhJ
X-Received: by 2002:a05:7301:f87:b0:36a:1e0a:accb with SMTP id 5a478bee46e88-379687a6ec3mr638180eec.35.1794527457444;
        Thu, 12 Nov 2026 15:50:57 -0800 (PST)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm3842976eec.8.2026.11.12.15.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:50:57 -0800 (PST)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH 2/2] perf/x86/amd/ibs: Fix missing CPU hotplug cleanup and unchecked init return
Date: Fri, 13 Nov 2026 05:20:03 +0530
Message-ID: <20261112235003.18608-3-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112235003.18608-1-ayush37735@gmail.com>
References: <20261112235003.18608-1-ayush37735@gmail.com>
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

Check the return value of cpuhp_setup_state() and remove the hotplug state
if perf_event_ibs_init() fails. Unregister syscore operations and reset
ibs_caps on initialization failure.

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 arch/x86/events/amd/ibs.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 66e67e27224f..2518cc7a24a6 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -2129,6 +2129,7 @@ static int x86_pmu_amd_ibs_dying_cpu(unsigned int cpu)
 static __init int amd_ibs_init(void)
 {
 	u32 caps;
+	int ret;
 
 	caps = __get_ibs_caps();
 	if (!caps)
@@ -2156,12 +2157,27 @@ static __init int amd_ibs_init(void)
 	 * x86_pmu_amd_ibs_starting_cpu will be called from core on
 	 * all online cpus.
 	 */
-	cpuhp_setup_state(CPUHP_AP_PERF_X86_AMD_IBS_STARTING,
-			  "perf/x86/amd/ibs:starting",
-			  x86_pmu_amd_ibs_starting_cpu,
-			  x86_pmu_amd_ibs_dying_cpu);
+	ret = cpuhp_setup_state(CPUHP_AP_PERF_X86_AMD_IBS_STARTING,
+				"perf/x86/amd/ibs:starting",
+				x86_pmu_amd_ibs_starting_cpu,
+				x86_pmu_amd_ibs_dying_cpu);
+	if (ret)
+		goto err_pm;
+
+	ret = perf_event_ibs_init();
+	if (ret) {
+		cpuhp_remove_state(CPUHP_AP_PERF_X86_AMD_IBS_STARTING);
+		goto err_pm;
+	}
 
-	return perf_event_ibs_init();
+	return 0;
+
+err_pm:
+#ifdef CONFIG_PM
+	unregister_syscore(&perf_ibs_syscore);
+#endif
+	ibs_caps = 0;
+	return ret;
 }
 
 /* Since we need the pci subsystem to init ibs we can't do this earlier: */
-- 
2.53.0

