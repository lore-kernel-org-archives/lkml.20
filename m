Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001E4A99C6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789150915; cv=none; b=WmAGlS0NGxevGyhEFFaisWiNXsdLF5Zy65Mkoj8CiOZs17IsT9VW98YvqJvfonutufYDz41eQfCPfYJDDLLXDAYBuptxyzU612V3ol84JGizZuvsESE7YSB6yGnrb71lrWIMlJHBtSPrCFTX1m2nc/9ncinRUOmi6VngUa4K2Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789150915; c=relaxed/simple;
	bh=kvFVf3Ybxs86CamvPsLjfp9ad3i/ysaCDWmsGWOSHoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PxDG7IWjoJ4FaCo0XeU7FHVTWV/MRz7AHwEegFOCKXYO/9Ew0ktiwbCbS6xsElRJzrnBQ13GSfjlMn9nxCxMeINH2BpZ6dSh3mqXbOZ++tfhK+LsPJc0RJxgEQJaSCmnlS/qemgtUyN+VMTuj/AFjDDAr4AXl+4A9WhHVacgX3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com; spf=pass smtp.mailfrom=miget.com; dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b=GFqPhqeZ; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b="GFqPhqeZ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591bb18so170312a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1789150912; x=1789755712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vMZxd59EhYB9mHQG4h0mooWgrTvfO7t/x+y7pEl0dQ=;
        b=GFqPhqeZdZeipDHoBja1YcI+VUKj2WKGBeRVQzI3scA6YF4+qg17TySrf5YuPWW7Ew
         5lY1j2INmhWer/nMkET7qxkhBZyY12Jf/KqYgOu/eflY/eEoaiKhJjVfEgMR/KnqGCYg
         8zruIWVqcE5CBqkZxgO2ruYvQepUZF2RWbzlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789150912; x=1789755712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vMZxd59EhYB9mHQG4h0mooWgrTvfO7t/x+y7pEl0dQ=;
        b=AEG6qQmkO6A2zNZqyFSLEI5SdyHbBliJqLv51AA5fhFxq+SkHW98Upzcsbwt+Xd70+
         61n4tOjwqto7r0GHwI1+tSti48rZTtCzz9eD2U8OuiP/7t6BDaakW81jAIw+9wspvpIr
         jKWlKE4xNGkmFTWi8ssKemALnmiBRV4cSG9OFIADdxfGpFh/W7K1jzhACXOrqXP1srZQ
         HcUBsi7N/7UAUfYjJcsW7eGglh6B5QQVhvRiL3PIzD6OZEaqnXW5b6VoS1lBzshPzMMt
         BFJRaI2Ohx9l9sj+wm8Y/DSt9CyvQNMDpGROKovAyDfjJxLioQoCenYdFsfhH4T1Ewyr
         BcDg==
X-Forwarded-Encrypted: i=1; AKwUvBxWpCyeihB1IRhyh31bpkvsoNMBdanBziZESA51ONenL42QZTSHgYbQCHp3dqQ+NgJXwBQbFn6MFxtquNw=@vger.kernel.org
X-Gm-Message-State: AFuF++lDElneOChyjzRc4MT/PhcL2lSQhb5zaFifrIe9KvgXKi3oI9RQ
	peQyhGRMRTlZV2H/qZZMX1c8B7fjywLGTRbWtepBsYuUqB7Z5rLqhTqBq5ZYbxedWK4=
X-Gm-Gg: AYBFou3F8eHPLCLw7ilxcLg0RL4JE93VtLNQLIb3QbGBPr1Fe0VMf5cCmig6lGgREal
	uNUev0GDteMDzf6pVBn5KySCMx/cFtRG2K5xzbJx2M2GauDtvtun71iUSKsX+BRMcmOSqREKI6k
	OgUDv4fx+91ZSZMnJbUI2CSbI2z5biIEuCNNpB3Gy97EGFGGBDwZfUY4GHmFuu8UKDmoHSnuGDO
	6BW3FCvluZz6HyWKdVab9Cr0XhdIfWTfDA5835b9UiVLpq2o0FhWa0JqRE2KfzccdLM7G4mdAPf
	CsVaBrxEBDnwg7XRtuxwhYrSJrGe/v1aT/LNB4IghMjaYKxEdt7AcVMgXlmt+cQbvcZujRU+EAD
	MxlcRt7cXFLW700fwWDquQBb2y00kHX7k6g3wIHolf9r5wBTPZHuCkqSovwt+k3HuBCnOO/OMqi
	M4uPnr6CWBAUnzkmonC4TFRFYzyk/Zz1Gw2ZCzOJMXfrL+x0OUhiKMdekcP17Kk2jYA2c36WMoX
	Do5HgBPz98fKwC1WA==
X-Received: by 2002:a17:907:c308:b0:c08:580e:899a with SMTP id a640c23a62f3a-c2962ae852dmr283346666b.10.1789150911829;
        Fri, 11 Sep 2026 11:21:51 -0700 (PDT)
Received: from xia (user-46-112-84-99.play-internet.pl. [46.112.84.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608aee3sm114233666b.37.2026.09.11.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:21:51 -0700 (PDT)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Chris Taraszka <chris@miget.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Don't abort suspend when platform profile access fails
Date: Fri, 11 Sep 2026 20:21:31 +0200
Message-ID: <20260911182131.461415-1-chris@miget.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a Xiaomi Book Pro 14 (BIOS XMAPT4B0P0909), bitland_mifs_wmi_suspend()
intermittently fails to read the platform profile and returns -EINVAL to
the PM core, which aborts the entire system suspend:

  bitland-mifs-wmi B60BFB48-...-4: PM: dpm_run_callback():
    bitland_mifs_wmi_suspend [bitland_mifs_wmi] returns -22
  bitland-mifs-wmi B60BFB48-...-4: PM: failed to suspend: error -22
  PM: Some devices failed to suspend, or early wake event detected

The WMI method call itself succeeds. The WMI core reports its own
failures as -EIO, -ENOMSG, -ENODATA or -EPROTO, so the -EINVAL comes from
laptop_profile_get() when the SystemPerMode value returned by the
firmware is not one of the four documented modes.

How often this happens depends on firmware state. On a v7.2.2 boot the
query failed persistently on battery: /sys/power/suspend_stats reported
4628 failures against 2 successes, both of those on AC. Because logind
re-issues the suspend while the lid stays closed, the machine looped
awake and drained half the battery over one 8h42m lid-closed period at
~7-8 W. On v7.3-rc2, whose driver, WMI core and platform_profile code are
unchanged from v7.2, the query has so far failed only right after boot,
when power-profiles-daemon first reads the profile.

Commit d3666875c75e ("platform/x86: bitland-mifs-wmi: Fix NULL pointer
dereference during suspend/resume") added a !data->pp_dev guard, but
that only covers the event device. On the control device pp_dev is
valid, so the guard does not apply and the error is returned verbatim.

Saving the platform profile is best-effort. Failing to read it should
not keep the system awake, so warn and continue instead, in line with
that commit skipping profile operations rather than failing the
transition. Do the same on resume: laptop_profile_set() returns
-EOPNOTSUPP for the performance and full-speed modes without DC power
(see Documentation/wmi/devices/bitland-mifs-wmi.rst), so a profile saved
on DC power cannot be restored after unplugging during suspend, which
would otherwise mark the resume as failed.

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Taraszka <chris@miget.com>
---
Tested on the same machine with v7.3-rc2 plus this patch: 11 s2idle
suspend cycles, including lid-closed suspends on battery of 7h42m, 4.9h
and 75.8h, and repeated pm_test=devices cycles on battery all completed
without errors. The failing firmware state could not be reproduced on
demand on v7.3-rc2, so the new warnings have not been observed firing
during a suspend; the failures described above were recorded on v7.2.2
without this patch.

 drivers/platform/x86/bitland-mifs-wmi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3a37318..788ef14 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -305,22 +305,31 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 		return 0;
 
 	ret = laptop_profile_get(data->pp_dev, &profile);
-	if (ret == 0)
-		data->saved_profile = profile;
+	if (ret) {
+		dev_warn(dev, "Failed to save platform profile: %d\n", ret);
+		return 0;
+	}
 
-	return ret;
+	data->saved_profile = profile;
+
+	return 0;
 }
 
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	ret = laptop_profile_set(dev, data->saved_profile);
+	if (ret)
+		dev_warn(dev, "Failed to restore platform profile: %d\n", ret);
+
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.55.0

