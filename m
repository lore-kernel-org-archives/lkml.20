Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527447;
	b=AOLJtdyfW0mU1jnZlzAcmNwrK/l4QejOaj+4eFybKEsIQpnzTf0qTJGyMsLiiDUYLaYR
	 +Mf4fpAwtVDn9ktu2322tz+AkmboSSGDMvDTeqXyF2dCd/8cpBoJrMDeDibuDZSdUuAqQ
	 O/bj6MMQWRg1IZUcv8ltb856ck57UHlx5eK8TTxm4EdTFkH4jw+3yHvyHXpUJUZuzXtix
	 0kHlUnvZcZnBB8X4N1+CinpRFnYYq4wj1ZvYnN0kv4qBKNOS4tC3sejWDZoW2hxfm9+z6
	 4+icJd6ma75UFPMii3aAlSC5eZjtmGsK9uHAe9k9NI1NYx/PIhSRyDX8vsJYLhLXxfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mczvvyy/drg/WCTWwSqRdjrsqzKouaYUkQ4KLSPDcJ8=;
	b=K+P4ze5RXsuXOdISoYn5QfIpNwtQy2uksWH00NtilNTGdp6JLwSpcAr7BW/8mzUrUm7V
	 H6A27VB/DvD3gJ1xBDhiZPmPmRjBBqQ7TGbxkNQ4HnMhSvY4DGBpoJ0eUso2NtFjG0vPT
	 Zw8vvvB6GnNSIV7swANfKt0RZbBwUkvc1OrTgLESvtyHRVSaGIprk5fSkMAnMbYYORapB
	 OB2Xo3z50/QMSWGjI6pCVUxVN1dx1LyKSdHN8ndJc0WFTdXOOlr8G0YAuadmcRaUG4/wm
	 3SFkEX2qnzxAWeWxIBLo4hHmugaSEObnwX6Vd+TLK4T60/B3vEbiEd6/y1PNd6wXE9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tuxAfrML;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F73606A884
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F73606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tuxAfrML
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so417627c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794527446; x=1795132246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mczvvyy/drg/WCTWwSqRdjrsqzKouaYUkQ4KLSPDcJ8=;
        b=tuxAfrML9xkjSgwauup5PxfpJAUyQdFvUkU/EHEQwlJ0dc3/Nu7Q+oiFiyxQCqg5L0
         9+d/WinTTlqBz/eQQ4x8vPKHalMgmqW5U6E2vhLaldlbyf88rGqnHjyIjEKvHSl9jfkg
         R1MbpsXGDlQH3eynh6MnBtvIYNFCDkuqm2aBRUqk1DZ9NyY96Z8sgvBD4gerWYAe8S5I
         IVSuJhY0jMMRQYJ2Yre65/8du32bI9yfK+PUoTmCpSoAMZ+tpV0FG14IcDqTUHvxAccl
         C+QVs1FY3A1ais+xxU8A1ajhblP3Bewt2d9Stfpy/7KVcxfRMuyPJUBWFtv+OfUKDQM4
         FVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794527446; x=1795132246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mczvvyy/drg/WCTWwSqRdjrsqzKouaYUkQ4KLSPDcJ8=;
        b=t+KcqLB2VyhZItzppSLkR6Aksd0VlhfHk7dlZbJDoTQgrH/65UgBOr4kZhvvmm/dfM
         SgmKPTnNMdk68TneaNkANfCPy0H2hAs2kvlMpPfnwr4Bje4WCTyxfxj/NUnHQ2ERTRVJ
         kUhgFjeBMI35PHXNnMdvUBCowfeRZoj26LeXIjPU5mtC7HwMrijFmqsDNDtKYgTOtOQW
         /LVMrbL8Tf8T+wYzro02fDc7wph7AjjRaCqY4/MLMkHma+wV6DaqwGFatc6Wv4YW5hF3
         7V0jaPXi9oWAg2hn2NPzjJoXCydVCiEaD2ptKMJyzEAOg5CSDro6fxgZy93YBOzT2u71
         zsuw==
X-Forwarded-Encrypted: i=1; AL+hErHFKWRysT+IVxTw0PXvJskXH/Iu7pzq611szDGu6BkhPpv9z0r0fhVEFFO+F0iXdhkDmyiPEbNvojbyQr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QUnCgBkr7znwaLokz8OM8TqPT6iHvq6doypin06GrBDRxw1Gu
	XTLlgVJ1u0X/vlbf6dVs+LzC0xqJIYHk0NYvgytBnMsVuLqWzaPQYrR5
X-Gm-Gg: AYBFou0WqwY2MHBNe2VxLKes9t3Dfry2Ece3lSRTR6nSGkANsfKdDHRK01zWN4Pw2XV
	XNqMBs+JAbOG4+TAkoQ6sMFyI5sVO2O4uABzQ3DbvAq+GOcKKI3d9saCZhKtH2vLclZfeueaYIE
	pSpOgZCSgsvftnsolODfKznrIKfcYVTc3Ovo1d240/S4aO73u002MO9WADD8V8VtGgtaB4zkxlT
	X8qz9zaZLSJtPmpWHnjagq+pV6phyavPenHUcNjA1DWXmRjHN5F3KsOfgqYZ9BRdokeniSRxb0j
	6ZHkoc1jDRzmFVqPSCB2/P4IBMip0J+Yiis9fxVoJtrkHQC7bBxMSTl8NrozJo5Bki7NdXmzYEr
	aYgn8AdL3hJ5hQiDitE3vaVn/GmfewJpC+44jyVk8sSkYnTAYtHG7T+PZwYVgbk294cMLEED+ju
	2GJDQmuYDNa4UxUGDgNPwyGUMFKy5mZ0OHTohvw3RiZ0xOPCWIZFJQCsGxnsnKHMFci7b0v+wmC
	HVYMiqvmQhSoJB18KrQ6RzD+7yQe2PV/J2tlCLR9A2Zpd8gsM5lu0UCvxcBcVByERu528yAQK51
	MZYq0KRGT6bIxpC5
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr628008eec.0.1794527445599;
        Thu, 12 Nov 2026 15:50:45 -0800 (PST)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm3842976eec.8.2026.11.12.15.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:50:45 -0800 (PST)
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
Subject: [PATCH 1/2] perf/x86/amd/power: Fix missing CPU hotplug setup check and cleanup
Date: Fri, 13 Nov 2026 05:20:02 +0530
Message-ID: <20261112235003.18608-2-ayush37735@gmail.com>
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

Check the return value of cpuhp_setup_state() and remove the hotplug
state if perf_pmu_register() fails.

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 arch/x86/events/amd/power.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/events/amd/power.c b/arch/x86/events/amd/power.c
index 66197214b010..2627d5269b52 100644
--- a/arch/x86/events/amd/power.c
+++ b/arch/x86/events/amd/power.c
@@ -282,13 +282,16 @@ static int __init amd_power_pmu_init(void)
 	}
 
 
-	cpuhp_setup_state(CPUHP_AP_PERF_X86_AMD_POWER_ONLINE,
-			  "perf/x86/amd/power:online",
-			  power_cpu_init, power_cpu_exit);
+	ret = cpuhp_setup_state(CPUHP_AP_PERF_X86_AMD_POWER_ONLINE,
+				"perf/x86/amd/power:online",
+				power_cpu_init, power_cpu_exit);
+	if (ret)
+		return ret;
 
 	ret = perf_pmu_register(&pmu_class, "power", -1);
 	if (WARN_ON(ret)) {
 		pr_warn("AMD Power PMU registration failed\n");
+		cpuhp_remove_state(CPUHP_AP_PERF_X86_AMD_POWER_ONLINE);
 		return ret;
 	}
 
-- 
2.53.0

