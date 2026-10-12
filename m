Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01661478E20
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799609; cv=none; b=R/E9K/ZmfTKrDUEkhypx32ExFYJWgTQYKIL0ftqNRX0Pq14NIAVnWqC4sMa7obEuYLjMF8ZVpELE+iYQmTL/FNBpEemk2WWE0ft7l9zDQRcNy+45ksW05IjvPIgOXUhAxR73S6Xd53jHkxdDJm1XJOXnh0kSZpq24pXQrSxg0TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799609; c=relaxed/simple;
	bh=CyBZnoL9cID7mi6579NOEOhskoy3tNCIc6rw4QdlRHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNdrmPgub1+0G6NIRoaagYStcYhxb4e7NBIOSSqGYI4SEp5kp+XqjhZSlBYFl/d5990yuxlrtDh2aqjiDP004MObism1u0k/oUfBkGdkxdt4WNTdEB9w1iZss9mN/1heKxFqpWDR/UmIq0eyX0suWn2UGDmOCX9ckJdEyKB4Uhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAUooeAo; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAUooeAo"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so979119a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799593; x=1792404393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOkAEGZ38cExqY4JKO5ThXkSV4YfBritRUgr2RuPIUk=;
        b=bAUooeAoLsJLofZbCEpsazYVHsoAcUA1bELueSB3NVdib50OvYVe7JuiuAGpsX3uVe
         SvfbghUlkq2IxcVajJTWgMRAkiXHfnH19H0EaJpx1IhO6fDwXtw04gtkxIQrEkxwyL0I
         11QDDnA2s5T0H2gP+hKm8NSn41dhBtwcg7oPdAosXGLVr3T4vvrkE9R6c1IEoWoiFj96
         bhfvL4aZSSYs1WtHOWgsqD1wfL8ee6P2VcscvumD1V9pjZhM0Pr5tE+eNjJT8P147Xrz
         IcGH8OCnAQVzPFUUlBKgzwmBnvsrOC0DlQ+lgDE1TMMQI69Pc8rAkD4FiRakq+QBG3eA
         aOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799593; x=1792404393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOkAEGZ38cExqY4JKO5ThXkSV4YfBritRUgr2RuPIUk=;
        b=V4k7YsC8iIIFbw5yEXPV7qE/CO9aHhahUJnPiUPWsBV6euvWXMDmASmVH/hkEjVnxq
         f0fU7uVXFJjOtWVTr62REkUP3+WfSB5qx1SmWiobkVr3v6l54tunK19liVHiIwlFX4wl
         fyHYlTwgRiEiouw1Tl8tWAwNQDZCYPPU+/s0Bfubo81oB3zdMC4KLi03zVHNR2Xvn8wz
         fd5GWbpgo0XOzwZDzDFzOx5x3zaum/kEFROF0f7kCNP02HDGmCPzUmcb1twpWC4jtCNO
         5y6oPe3O+5AWVr3v2ABhftMdTR+GDEplxlZeHjdAxhWB2YSvT0YwxD7oPinJavqeJi0b
         hCiA==
X-Forwarded-Encrypted: i=1; AKwUvBwbjWwagVtpl99e9bXMm0q8PI6CIacpaDEEXCfLXkNu+EB6O0a+loq8rF5LIX9ZF4eYMFBiqYa8OUFcpbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcHIDqLFeDkZiTI0kdUjtZipIS8rzgNZ22aAKiHcSCVSh4zJ1e
	RgE4WbQ/O3pj4iR8Aakeuytch45DvbHBefMzpfO4Gm97UXGiAfkZEaw0
X-Gm-Gg: AYBFou1W9zgDO9i+uCpepVZinrRLLlrCPNvjb1/N24FLfL+51GKRXy04D/VEm3kRzgJ
	mttRfasNQPV9Ynn8yDlnzrehfK5tnohICJE63i38s4l+ZNsaf7R7bgEnhsWNimn31Uo4lxAU/pE
	y6K5zBoH6mIudQ1EGDKVGtXWXdW5XMM0nSpvwbQsZwLLfMl+gE5XOONeFKcX3bJArwAQdkpG6fn
	YBhb0cSXa5c0lSLXlUn9sHKqvJwK+mw+pdDeQqyo8ArQx47tQPruIZSdzVp3Le6DwwJPv8cq8Vf
	FRTJt+fBKIgw02PqB16QhBjzsDpmpY2AUWgpjWC4QuCnKxQT35H8QFZDY4gGsp5EBs+5Uwblb50
	CB/huEiGA7SC3lpJn3rJhMFqcY2TMCol6HTIdgGQ0sLnbW3xdiCB7UvRPSyYlDgBkQsHJlt56+Z
	0dxL2kk6RwEOz2JginaY/nE4p3QbzO1yWZNhk2uAtU1hQw4qQ0/0VWFqU6zCXnbYij9Y+9rVws
X-Received: by 2002:a05:6a21:46c5:b0:3e1:1689:1eb8 with SMTP id adf61e73a8af0-3e16baddb4amr8423622637.2.1791799593094;
        Mon, 12 Oct 2026 03:06:33 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:06:32 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v11 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Mon, 12 Oct 2026 18:05:32 +0800
Message-ID: <20261012100532.19612-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012100532.19612-1-qby140326@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index d61382ad4a0b..7c950e688988 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.55.0

