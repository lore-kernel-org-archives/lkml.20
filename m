Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459073FF1B7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465517; cv=none; b=N7yhVKlnP02y3hL0opQ65NDqaLE1sOuvdN4yt80nY3h+OblUEo+5IMsRdLPdM6X5/PNjXigOPCjUkRZ6eXk80iCDtsdL4wvf0V41mdj61RmgQUXwx0VAtbEKIJSRNHszjAOWbKdtJTsGwHggbHP6GDy6fbohdLdXSZfehOUdLbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465517; c=relaxed/simple;
	bh=fSgjqmuUEyPPrSsYbBfKKkIgRc8tfA1ByaC7MNerK1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h5UFyqRiwYyiR7xUKC9sJYpFwYIKYT66q66t49gqUQGVftgVA4pf8edV6gkcfveOOYq2i6SdfCBFcKjIP4MhVS7xKUVhIZvkK11EkfQdcl09jekO84CmJxsL1l6NlQGqo8/K5a1zIREVq2c/pzYDO+QkwRx/lKwbUOxFJ8hbKt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bD2HaIm5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bD2HaIm5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so147827b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788465497; x=1789070297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6j89Y3ln3EcTUJyuQHu9KwyOw32fASDwF7kJPYPSdA=;
        b=bD2HaIm5+OOCL17Cv0iyS0u3AKUSt7948Ez7N8r5xufE5NqBLmkP+fFCSfuPNfgifV
         6z4yZHKwdN47845DxQ/x5YgnU8K72j8VqLtII6pEI9vbJN8Z9MK/zZL6zdLDZshY/Vet
         iHwZb/G4mvn5/b4qILQwhywg7ZEzoolHLdjSnZeloYV3Qg/BT4XjSyJIuBYuE26XHD4/
         ocyI4yQhLSuZCkDCuslWh+BWnzWv1wAGyKATx4dyQHOjDLaRywCSMocuVSUmRLuwyGjf
         jZGqJ+xJYAy5QDLCUOj+2sWjxt09XmVMCAsW8j4RCiHmmh/U2/NhfaxRO1+EzjIlqYI5
         lkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788465497; x=1789070297;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t6j89Y3ln3EcTUJyuQHu9KwyOw32fASDwF7kJPYPSdA=;
        b=ip3cCKU+gVPOJohx0gyeRjLQccxaxKdKml2q9ZJd61scdFxFhj4FfzcJg1Ikp8lNLM
         C3UXH41eStu+jFAuOY20IoD4Buq1mr8k7RslYVQP2tM0Jf6zMggg8yAfD24lPYyTpr9z
         IS4/0AfNIZuMJqyaQiXZhSXc/ZFGoeduWvBqA3JB7s5JRmMjmYbO+9sQyew6syhWrhDV
         HAXxkwjQ4WZ/QglhNrX9xaFf48gc6zFqZwdQqOSa/NvWJX15JKORFfmJPyz3PwanL1nN
         KX9xjy99Dcz/d0pHR6p6C2L69sFCnBObXKqWA//8DwWx86ElzVU90dso55QLWz54KXc4
         aeyw==
X-Forwarded-Encrypted: i=1; AKwUvBxBIB4+BqIOFp40opzc86TDMkpiHqm3iLtZX7/Z58lNb3/aMPRLGpAfD3ej2jschf6jAtxtF6Ali4pRzv4=@vger.kernel.org
X-Gm-Message-State: AFuF++l027VFezI7rTYR5XHc//enE+D4NSgNFKVN7G5Cguidtu5lz/dQ
	/yUvnYG6o7sBwyljxCtqk4YZxXQjPfzT/AVGrB93Fz7jxZdFDoJIpyJB
X-Gm-Gg: AYBFou3rSQlavBg2O0RgkZidsI9LHeAhPLU0Cl5ncrjnCG8ajL23arEW8Igb1O9GEHU
	9Wry7TOVnTjIdwvvPqy28yxejU4xOAWwn+PWqXA8hzG+5kZOPbtLNf7XNUBZayeFVWFkXqcv8qs
	FSBiSsBIjM/1DNliaX5PZ7RcTzydfJG7G4IAetlKSiuMgeP96MGPRW2Ze5wfP5h4/Y/rXOEpTf1
	6QA8n/+p/ROlY1A+33vwmJNYc/mleoz7yX8iNYpXLfruS12oI7ogAZYaqvBL0wNCeXET1gvogXJ
	JICfhQRz3VmrL6gOfz4nGfyS7RI92gz/pe+f7Aj1HxEFvHLCmb184YxkPpqg37c6YqDUxQ4FT4K
	pgXNb2wGNDA9CkyzHkwyjfPrYwL4PvIqHWnA5Fz5mnWMW3AiEvWMf53BJm79xvGi6i8i/q37e54
	O+3NkKJO4l73xJnuNX4imol9J9s2O9NW2lMkQ/+m6HL9XeITHPSifz+tMkcHiEvRUEsGhM
X-Received: by 2002:a05:6a21:6487:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3da3a0b2671mr1173471637.23.1788465496560;
        Thu, 03 Sep 2026 12:58:16 -0700 (PDT)
Received: from Omen-14.Dlink ([43.229.88.51])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432438497csm1451221c88.8.2026.09.03.12.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:58:15 -0700 (PDT)
From: ShaunV334 <shaunvarghese43@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Shaun Varghese <shaunvarghese43@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: add cTGP and PPAB support for Omen
Date: Fri,  4 Sep 2026 01:26:26 +0530
Message-ID: <20260903195626.39391-1-shaunvarghese43@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Shaun Varghese <shaunvarghese43@gmail.com>

On supported Omen systems, the GPU can be limited to a lower power
limit because cTGP and PPAB are not configured when changing the
platform profile.

Configure the GPU cTGP and PPAB settings through the existing WMI 0x22
GPU thermal profile interface. Performance enables both cTGP and PPAB,
Balanced enables PPAB, and Cool disables both.

This allows the NVIDIA GPU to make use of the additional power budget
provided by the platform, improving GPU performance compared to the
lower power limit.

Tested on an HP Omen Transcend 14 (board 8C58) RTX 4060.
The GPU was limited to 35 W before this change. With cTGP/PPAB
enabled, the GPU was able to reach and maintain its boost clocks, with
power draw increasing to 57 W, benchmark performance improving by
approximately 10–15%.

Signed-off-by: Shaun Varghese <shaunvarghese43@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1aca4..54887a476c8e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1771,9 +1771,15 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
 }
 
+static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
+					    bool ppab_enable,
+					    u8 dstate);
+
 static int platform_profile_omen_set_ec(enum platform_profile_option profile)
 {
 	int err, tp, tp_version;
+	bool gpu_ctgp_enable;
+	bool gpu_ppab_enable;
 	enum hp_thermal_profile_omen_flags flags = 0;
 
 	tp_version = omen_get_thermal_policy_version();
@@ -1787,19 +1793,31 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
 			tp = HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE;
 		else
 			tp = HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE;
+
+		gpu_ctgp_enable = true;
+		gpu_ppab_enable = true;
 		break;
+
 	case PLATFORM_PROFILE_BALANCED:
 		if (tp_version == 0)
 			tp = HP_OMEN_V0_THERMAL_PROFILE_DEFAULT;
 		else
 			tp = HP_OMEN_V1_THERMAL_PROFILE_DEFAULT;
+
+		gpu_ctgp_enable = false;
+		gpu_ppab_enable = true;
 		break;
+
 	case PLATFORM_PROFILE_COOL:
 		if (tp_version == 0)
 			tp = HP_OMEN_V0_THERMAL_PROFILE_COOL;
 		else
 			tp = HP_OMEN_V1_THERMAL_PROFILE_COOL;
+
+		gpu_ctgp_enable = false;
+		gpu_ppab_enable = false;
 		break;
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1808,6 +1826,18 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
 	if (err < 0)
 		return err;
 
+	/*
+	 * Configure GPU cTGP / PPAB through WMI 0x22 according to
+	 * the selected platform profile.
+	 */
+	err = victus_s_gpu_thermal_profile_set(gpu_ctgp_enable,
+					       gpu_ppab_enable,
+					       1);
+	if (err < 0) {
+		pr_debug("hp-wmi: GPU cTGP/PPAB set returned %d\n", err);
+		return err;
+	}
+
 	if (has_omen_thermal_profile_ec_timer()) {
 		err = omen_thermal_profile_ec_timer_set(0);
 		if (err < 0)
-- 
2.55.0

