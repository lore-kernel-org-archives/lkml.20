Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F87368D47
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744701; cv=none; b=ZMHXfWXmhpPa/9tm6sIHkdWiWduRRp/ZmEEvO8eZM9X1gE4K0qkRIplD0Q91o3i4EpcQapDTXAfQosTCcVCa7407eR+VWyMXJM+rNiArO9wMqCXvZDBmgZTk60ceL0DnxDsM0pVG5bvxpZDHfqllbTgSGpM5gxPFG734scSwqCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744701; c=relaxed/simple;
	bh=HAl0tw4A2/XGqRCEjWRTCUg/mbwX/UtCTd05d7oPNJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EAbk9IKb3giJv2FrAQ0W+9UARijqfxP3NTR05tpYV2T195mi5DfsU2enGej+X/n3d5874rZoltotK6lJOS3L0jHRE2LysUWHTa7YRdO0wIedbYwbF+gB8sf9TN/IOjlzKIXB9aNK6YXJrlIM+3Y+lIOnkgPCia6oPVJv9ORTqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNfKc8Nd; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNfKc8Nd"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-930c0f9c1b1so116647785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744699; x=1792349499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Jf32+IQ1Xgq4isKE7x6gOmGNb27qgow4H2816v9yaU=;
        b=dNfKc8Nd9SR5ceEL+a9PIShFbAcaj6thz/VA3i8m0alwUY1slyxzlbGm5ODu9hOUWb
         +3LlKIJY1ecPFjbpnBHRDkyyHjSzv0NkweKY14QS72dvkJ+G3Wt1HB2mpRdpr1pzSvPb
         kzZN1MSBTJ+tZ/xOVirgtq3KnXbmUlnIv8tO1pAuVcW0KUQLGd7TpGY3S/7iMrdugLMO
         wCVZravSKxMln9xR1O2hq5ATEOAjhTZOM3NIM7M4BUbssrWT5TUVrc6O0kuOA6KtNe/G
         XxQVCaclcHU4jcUlE7S6QGKYlGRZWPPhmfThyoDHvy3fjB1LsC7DbbbVPfvuLCo5a5wd
         MRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744699; x=1792349499;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Jf32+IQ1Xgq4isKE7x6gOmGNb27qgow4H2816v9yaU=;
        b=ed9UZzyRZDb7541sAK+lmhk6A6hBSvIVO9IDZqYdU7MzHdgSlzYpztE06AOCwx4tOq
         IRFJ39sXcjJmXq6f5PNvxOCuhxZWIFiMOsor2UvdU5Z313u8G54Fv72r1uLwT3FKmoJ7
         cQ4m5HrAKdSpcAi9VnqOnJue/nxDDnJKNfpgfD7L+u8tyeocAeFSbcWActyA/JnrmFBl
         YNColCL27fCT+ovJmKznyaDU7Oiby70AEZB7JqyogFcxn9ELWu4JCXUo12UZVQsrL0j6
         0u2b+QRzUFJzxlw+zCd2+51vzQw5ycvygStRIa24otPJZv8qFeVvuW7S0RGDWKcaSVNy
         inbA==
X-Forwarded-Encrypted: i=1; AKwUvBwzNsqXxSsZ3M7SUV1m3OoSsL9/yAtk9dkF3NJzItrOlitWWcGSbE5xlbokLAWmimSLlMlARKl1/IhM2kI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLooEgE43Wm7oK7e3Fbe+zFcbMq3bNAaoZAzXy4Sxx7ZFnpizR7
	EUDBf2qK9KHnNmSoaruYE/4tQcmt9ZZnnaW8lNOr17tzNWbEfOi/3To=
X-Gm-Gg: AYBFou1P/33kmkRFhiMkFTLwbcV5ykUVDbLSgIiCXkFNjlkB8kXgJAu91+sJymM2zlA
	+joi3wwi6bYHvziRZ68kcQJN5kswKg5ll6Va8JcqHsAOJ147SX3daGf45VtdRp3jO7O7FjsQqBQ
	GyNJlmknTXM6d7NLGmn2Gf5V5iCwvNOiE1oQFra1xbuonH2QrwaLBghKf0X4aaChR2z13iCxDRS
	XCmoDLRTzO1HaziBsHLbUHs21wjavglRn+FCsjTAKtgVvBmLXYDHs8zAUldEZ1CWDsNEsqarSdp
	Zw+fofePg1PpfWmUUZvIpHWd7AAFpHS0SVPT4uNCJEHztkGiQgy/WdeJxbMFmL/xCNQI+dI+pk1
	95vByM5+ueJ1gFpAqXp3AdwmzOELF9bYTfR24KoSe/eDKtU/S/svrVmocBFojXJCUx4uu8txBOi
	PwvueyoJSG++CL97Jk8z4jHw3q8TDZzVomRupY3oT21AJZ3xJTfuSq/QN10wHQTI/FVpAf+X8Nb
	XsEeSkO7FpcdayOJiRjTggIlIlfpzghOB8HiAv4TJyQ+GVX5Cmqir6WDNsT+t3UOoh7Cey+P5OU
	MMkP2QjxbbPYx/wgsu7iPeuzRs1f
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1342671185a.9.1791744699031;
        Sun, 11 Oct 2026 11:51:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98bdb8fsm687707885a.33.2026.10.11.11.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:51:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] bus: mhi: host: Shut down the health check timer on removal
Date: Sun, 11 Oct 2026 14:51:34 -0400
Message-ID: <20261011185134.1759331-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recovery worker rearms health_check_timer after a successful device
recovery. Deleting the timer before cancel_work_sync() does not prevent
an already running recovery worker from adding it again while removal
waits for that worker. The timer can then run after the controller and
the managed mhi_pci_device have been released.

Use timer_shutdown_sync() before cancelling recovery_work. This waits for
the timer callback and rejects subsequent rearming, including rearming
by the worker being cancelled. Keep the reversible timer deletion used
by suspend and reset paths.

This issue was found by static analysis.

Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm). No runtime testing.

 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index b636e2c..f8de889 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1488,7 +1488,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	pci_disable_sriov(pdev);
 
 	if (!pdev->is_virtfn)
-		timer_delete_sync(&mhi_pdev->health_check_timer);
+		timer_shutdown_sync(&mhi_pdev->health_check_timer);
 	cancel_work_sync(&mhi_pdev->recovery_work);
 
 	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
