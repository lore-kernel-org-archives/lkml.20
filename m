Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BB1F78E6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085454; cv=none; b=kFtTVNLXaAt2Zi1iU20qMEPZyKelelgAtU/oMWSAKFP+WMAKtL+fTwHcnMaEcj2LqMAVh71MmE1lK7rIImTVLhcUrUsEz6oDkMG24QUUwGigH6OQr8mZe5w9JArQKcIeylD8qjXzELr4E4KZaY3Mm7oMVxcesNP4/V/hom3UHUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085454; c=relaxed/simple;
	bh=4LJFjA1BbnAQrC34EURZJd+Rh0nemOno61F9nSicagM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kcjKKNSEi5h3jHeThn+/78ikv+lw5j27m6X5BmOgD/X5PT0Q8zsRAi4B9FOlvSP3YV5pMTy2C/oXZGIbf2akgC3K2GIkJqNodDJg43E81scQ2/1Tb515869yjGpxKY9iLcsvjz4cP1QxKSpoL9lAhns3wwc/j8LCSZuHHcXR3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YEL7JdKV; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YEL7JdKV"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93cb1c0e851so429745785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792085444; x=1792690244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQWRSNzl3c6XGCf8hZ27RUtWfEekL1YzIzLAzfAd3e8=;
        b=YEL7JdKVFOqMlVOdIOCDTD/SwLRLMEhODxhYZ6ISLH6FwwfpACjoFBCYtURafi5opx
         /8VLpXad5NM621og17pwgC6UIoyw9uNZDtVp3gCFsMoTvznioxjGC+PXNfVAabbxiW3G
         UPZxqz7GjhBcSqH7Xi4jXB2JdgbKYqxWLlAr34eQbhI6e82wHv5US/RWovgaKw/wkrqt
         AxMu004hZMEtLshj2xVH4abN4bB8pOr9hPbVzNJB+uSr6uUP1KqUkIVGLxPQTDL9i00m
         NepTdtlZc3/2f+6hv1Nhm6ZelZC2upTlXZa3V83JOyySoK1hzqutLg6cAllyaUhwelCe
         J/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085444; x=1792690244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQWRSNzl3c6XGCf8hZ27RUtWfEekL1YzIzLAzfAd3e8=;
        b=ppAOdLu37qaro9Z7Y2o2U/CXyvwyCko3oBdG6sG6dpYDYLukAQeoKiBriDvmRYBkfQ
         ZLYm2T/vEy6xBKhW0zAZ8AgIu2eUNutO2qdZAOs5IjqOQFSJ7NAL2d5uwwWt1nyAAUwE
         BdNJW4tbe/y3CTfIPThoXYxIOqygQzTvCHpOEp7vb4U3pavnw/9huCq7gomQAkUom92E
         vwd7AHcyEHAu1aq16erVL83FkiMx2PWvw7c8iJNo+7C9uXvMWvWzNmneQwhiX37n79GM
         TT0SRHQ9R6Ki06JjIF6BoFlSdvl+3GrxLm/vZfP8ia3tcySZbf4row0tJEO4W9F7XRVy
         8new==
X-Forwarded-Encrypted: i=1; AKwUvBxGwcTQHby6vlshZ5bPmITTngmhvFFY7IhnKJCoRWlgol/9ueV1dC8sdzWne5vmia0DhoQ9jppQFgODfKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/QTf0QS07BbjILpyiJAojj1lrtUtScE1DzkEgfDjax28oddp7
	wKd3hpyVbeb4AWCytgt6mQnHHcNuRhsu//Di6ghYJVVhOfVnEvtSiiQWK6lFzfWRBss=
X-Gm-Gg: AYBFou252oMfuDuOtXHhriTA2Yz23L8c8zvNNHUpnUpxYWM8tTjnxSrO/dzYsOCN1J+
	GixMx6jeXks2zYLQlO9xW57EkaVuTc97CWB08LrSdRseT4v5zyjSOs2SRSSu5NoWa0L3gxkNrwi
	iKsE5XN5FSlNpyCHYtbyprzM1aIYf8F/zqJLMpG3YYBdKVO+J/hpdojcYXVHQTIyjuisgC1HrAR
	yCe1D2ryXOK6dd4zMdT+yXkH2hfDD1Y2yg3wEdAICvJDtcKrqROiuvwjnveWhaVdIiaqToTQssb
	kRrtPQYUcaRDLfMngPgNybQ78qYxjK/t0oIbQXOW+RamxpfseMYO8milltFYH9o5sWTTozebGXR
	IBWfILkrw8F7n6fJcOLCgqoGehmiygGKvKkgHbpGYOB5SozGA4oZHmpAXKxMUdfix4j6/rJ2fyh
	2r1B0tdNv8mcsuPbCF16FVv3bITTp2m05ptNnnv5BOs0DfZyfnFIejhkVB0ptMuq21oJ2OUl9zN
	TNIEt5yr+WBp4GHegfZW9/KXJLYlgw78jo6uBPVYRTp/ba5hCfiJt7wC02g
X-Received: by 2002:a05:620a:a410:10b0:93e:c35b:2332 with SMTP id af79cd13be357-93ec35b26f9mr2150400585a.73.1792085443397;
        Thu, 15 Oct 2026 10:30:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50095bbsm825062485a.9.2026.10.15.10.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:30:43 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-rtc@vger.kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	alexandre.belloni@bootlin.com,
	rui.zhang@intel.com,
	stable@vger.kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [RESEND PATCH 2/2] rtc: cmos: Honor explicit use_acpi_alarm parameter value
Date: Thu, 15 Oct 2026 13:30:29 -0400
Message-ID: <20261015173029.3091872-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015173029.3091872-1-gourry@gourry.net>
References: <20261015173029.3091872-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An explicit rtc_cmos.use_acpi_alarm=0 command-line argument is ignored
on systems where use_acpi_alarm_quirks() enables ACPI RTC alarms. The
argument appears in /proc/cmdline, but the read-only parameter reports Y.

The boolean parameter defaults to false, so the driver cannot distinguish
an omitted argument from an explicit false value. Use a custom setter to
record whether parsing occurred and skip automatic selection when it did.
Preserve the bool parameter type metadata. Automatic selection remains
unchanged when the parameter is omitted.

On the affected system, the explicit false value reports N after this
change. The HPET-emulated path completed 100 test runs without a failure
while the ACPI RTC event counter remained at zero.

Fixes: 36d91a4d401c ("rtc: cmos: introduce quirks to enable use_acpi_alarm mode")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/rtc/rtc-cmos.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index fe514b1aa343..209aa4ec732c 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -57,7 +57,28 @@
  */
 
 static bool use_acpi_alarm;
-module_param(use_acpi_alarm, bool, 0444);
+static bool use_acpi_alarm_explicit;
+
+static int set_use_acpi_alarm(const char *val, const struct kernel_param *kp)
+{
+	int ret;
+
+	ret = param_set_bool(val, kp);
+	if (!ret)
+		use_acpi_alarm_explicit = true;
+
+	return ret;
+}
+
+static const struct kernel_param_ops use_acpi_alarm_ops = {
+	.flags = KERNEL_PARAM_OPS_FL_NOARG,
+	.set = set_use_acpi_alarm,
+	.get = param_get_bool,
+};
+
+param_check_bool(use_acpi_alarm, &use_acpi_alarm);
+module_param_cb(use_acpi_alarm, &use_acpi_alarm_ops, &use_acpi_alarm, 0444);
+__MODULE_PARM_TYPE(use_acpi_alarm, "bool");
 
 static inline int cmos_use_acpi_alarm(void)
 {
@@ -822,6 +843,9 @@ static void rtc_wake_off(struct device *dev)
 #ifdef CONFIG_X86
 static void use_acpi_alarm_quirks(void)
 {
+	if (use_acpi_alarm_explicit)
+		return;
+
 	if (acpi_gbl_FADT.flags & ACPI_FADT_FIXED_RTC)
 		return;
 
-- 
2.56.0

