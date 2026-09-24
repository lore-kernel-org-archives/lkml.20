Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9044718F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246620; cv=none; b=sqg3/09sJeooa6K2fD6H6mA0cQYiXTty96q1n4rBAZt0H/rELDu+prGE187g04EI8ehaw5KKV6IMtwhz0nqBy5mI4GryZYBDnOAgRcIUAj8v8qq/qGv9jDxUFXoaUJEY5q3ZjU+JddRmGaWF9LkT2jglz/LgMh30HDPOkRM9cHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246620; c=relaxed/simple;
	bh=Nr8nqalmEamSMmKb7Jq1ykuY/y36aXQM0VF7EA4KLdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uW6hQaLA7d4LGfmMFU1ykfDidU+I7es/iLb0cAMD1Vy5vyj5MBb5H04cupI+GFQW0ulyqNeJKKouAsbzMp9qcwLx+6ss4MheUgHzMCzu8wDfDyfR1TamjpNQqT7/pQPikV89LihVkGrYHQXADj/v94kP2CUQpHZh/JU/zIkh44w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hoAMQZFp; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hoAMQZFp"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso3177885a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790246617; x=1790851417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeW9iU1EGGuslisk6AZkdCsW6SsUHQLL1MyCEgj4UkA=;
        b=hoAMQZFpJYW9OYS6DWjYLlqSTsXu8rZ7QmPvck1ECB5eRr2VV6aaFn5t0OAXhyCOpc
         ItqmA59FxyWiNYrsjBW8GQpuCkFb0t7rk8SEIy1dNxjLyss85hd5nAEO7JNLPKJIa9xd
         Pf1YAyDhrPEML6V3uBd/O+xSjMlpnwHNn6fdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246617; x=1790851417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeW9iU1EGGuslisk6AZkdCsW6SsUHQLL1MyCEgj4UkA=;
        b=zjqeUv8NuEaEqHkcDIgQWUMxKG1+n8wppIv3xskecjp2llcZRouV3tmSQgtDf2KdVx
         1UgQ6/33gEnhdZVdQwtV+HEWiSSixATfmfT2zXRN78gR1pu0mMUSSJdvyCSZlM/kHFE7
         xFuBeeQd9ebmRf1baWDjsNckk28hROsUOcvDrpUGrB+P6VgQurkD1gcrkN8U/04PWbhL
         KQ4XF1aKglJvzbAU/UyKjn+7LJdSwm2Uzq/d3gyag9Ht9scXcb+U/tpouKjbQeJ6YTBO
         JdqCXlnkVFSqmKUwLYdXUml+tnQX0A6kZ4klTbl7Z1oK+u0vOuNx8XPGHdC8OVo4XAk0
         Ge9A==
X-Gm-Message-State: AFuF++lZlyHSR5g5swKlZUU9H4o4ypxsgS8aaAUtqbVoMNAdAUY0S+5N
	iV4+HRQlQ33bkDQlGTaZs3v285jfwrTFElhMdcVllOp+vEX7J6KMXh7A2uzY1KwP+A==
X-Gm-Gg: AYBFou2jAtGHRtd/N22uJE5GCMpZNdwqCozTLRyCxAcVsiHwNlwjHGjmRLXU2UPZd/G
	kH2SsjaUcWVPFW/IxREEOQEtPUcH/80MkQT353JV2mvwUqdwq2PzD0kEL5dJMmAgnz3fvIRxbYC
	d2qP8OKYYFXYuOCdKlbZUA2ijWY1WRq18iOZz11GS5chXMkYd2sbtdDARD8pRt51sLFArT0Wi4a
	jLfErC6NNGw9vupQK7lFlWtsSM3kWiE2rZx9Awj2FVpm7o75PeydbLawOT4RhQJJsB0J9UyCp6C
	+sO1knQm8g5jloDZL34U+Bpgo/h1mGCiTnzGAOeruRZtpho+6C9s/AjjozGMaQdiiUmuqWfdIWz
	dJ+WmvyxMxx8PfCJ1Q0/4WKCR00sIQ0ocXDk7kXfqtVJ02hBZQX17RVxxSMy5IVgBdEqY1CknVr
	kFE59rvQsYuJAy6OXx5Q9YvIhPrPRripCs5grHtBC0+5WIetR32z2LFiz8A+hJz074ETkRFozyN
	Bm442XX3IWLAISDij6w6e2hvSGKLGYXnjW6rYGqugRDP4OUX9TsSZhgmg==
X-Received: by 2002:a05:6402:27d1:b0:6aa:9c38:734b with SMTP id 4fb4d7f45d1cf-6aac8f69364mr1680655a12.30.1790246617215;
        Thu, 24 Sep 2026 03:43:37 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (154.4.34.34.bc.googleusercontent.com. [34.34.4.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37ead71sm3464110a12.3.2026.09.24.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:43:36 -0700 (PDT)
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	dmaluka@chromium.org,
	vineethrp@chromium.org,
	chuanxiao.dong@intel.com,
	jaszczyk@google.com,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Eric Dumazet <edumazet@google.com>,
	Melody Wang <huibo.wang@amd.com>
Subject: [PATCH v2 3/4] x86/apic: Remove redundant check from x2apic_phys_probe()
Date: Thu, 24 Sep 2026 10:40:20 +0000
Message-ID: <20260924104102.3534474-4-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260924104102.3534474-1-jaszczyk@chromium.org>
References: <20260924104102.3534474-1-jaszczyk@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9ebd680bd029 ("x86, apic: Use probe routines to simplify apic
selection") introduced x2apic_phys_probe() with a generic fallback check
for 'apic == &apic_x2apic_phys' to preserve any prior selection of
apic_x2apic_phys by default_acpi_madt_oem_check():

  if (x2apic_mode && x2apic_phys)
          return 1;

  return apic == &apic_x2apic_phys;

At the time, x2apic_acpi_madt_oem_check() only checked
'x2apic_phys && x2apic_enabled()', so that fallback was already
redundant. Commit ea0dcf903e7d ("x86/apic: Use x2apic physical mode
based on FADT setting") later added the ACPI_FADT_APIC_PHYSICAL check
only to x2apic_acpi_madt_oem_check(), temporarily relying on the
'apic == &apic_x2apic_phys' fallback in x2apic_phys_probe() when
x2APIC was pre-enabled by BIOS.

Subsequently, commit cb214ede7657 ("x86/apic: Work around boot failure
on HP ProLiant DL980 G7 Server systems") factored out x2apic_fadt_phys()
and added it directly to x2apic_phys_probe(). Because
default_acpi_madt_oem_check() (via the .acpi_madt_oem_check callback) is
the only path that can install apic_x2apic_phys prior to
x2apic_phys_probe(), and x2apic_acpi_madt_oem_check() checks the exact
same 'x2apic_phys || x2apic_fadt_phys()' condition, the fallback
'apic == &apic_x2apic_phys' check became completely unreachable again.

Remove the redundant check and the associated forward declaration of
apic_x2apic_phys. In addition to cleaning up dead code, this allows
apic_x2apic_phys to be installed as an early boot default driver when
hardware x2APIC is pre-enabled without preventing x2apic_cluster from
being probed and selected later during boot.

Signed-off-by: Grzegorz Jaszczyk <jaszczyk@chromium.org>
---
 arch/x86/kernel/apic/x2apic_phys.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kernel/apic/x2apic_phys.c b/arch/x86/kernel/apic/x2apic_phys.c
index 090647cc5a784..5bf86839e84c3 100644
--- a/arch/x86/kernel/apic/x2apic_phys.c
+++ b/arch/x86/kernel/apic/x2apic_phys.c
@@ -6,8 +6,6 @@
 #include "local.h"
 
 int x2apic_phys;
-
-static struct apic apic_x2apic_phys;
 u32 x2apic_max_apicid __ro_after_init = UINT_MAX;
 
 void __init x2apic_set_max_apicid(u32 apicid)
@@ -110,10 +108,7 @@ static int x2apic_phys_probe(void)
 	if (!x2apic_mode)
 		return 0;
 
-	if (x2apic_phys || x2apic_fadt_phys())
-		return 1;
-
-	return apic == &apic_x2apic_phys;
+	return x2apic_phys || x2apic_fadt_phys();
 }
 
 u32 x2apic_get_apic_id(u32 id)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

