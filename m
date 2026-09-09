Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DBB4AF9EC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994324; cv=none; b=aJAZ5185d18DCS/bFZXuAcIgdqe/He9G18f1971HUmJFBX1fNoIocem5p4ZB1EMFvwdJVM5SYzRzlUUAsIY0gXCYymxau5pnDfFK7WfveGjOfox9ccGfs5hm+JgMunFrN+ebZeE5MNB3HaRSvh+45wP4vfKKp1e7ABlGBwe1uZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994324; c=relaxed/simple;
	bh=aZ9zAg2uTuv7/FU+ETarYrAHc8sT3sPRPWW8umE51eE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diH8vTZtoQqKnLT5AtchZ6gO93+DWzY3XuR3czroLZlp/pQZ/8ZNCa6QvENwjQQ2qYCV8v1x6AfqXJX+f1BL+1G7K/wHa+Kg9ctUQmQASA3/bP7bClMKj3tOAtdYy6B7NA2HP7akojMWSj4MRolWG73bhjpvEb1mfiyy7OyHlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=uqy8A0Db; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="uqy8A0Db"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90ccbed6edcso93190696d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788994314; x=1789599114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2wLUzaidHv+rgjS9Vme7RZj9pjhzoFdoBFIa4TcM6o=;
        b=uqy8A0DbftwZBrWJiYGzrATABjjiIKlS6aSJD9aiT6NbesX+TXF8ZujUA8vpxNqPio
         kMyg7Yr1NjXJNAIgYl+6aq0Zz0GtX28fdYt0hTpNnBekb7scQyXYMdrfEmWUd5nmbSpt
         9kO2oR1F+L9522L+zOMwWrVBM4QFbYehSXuLXGPu5gZhlCzUwjzrIj69j66hhvtHXAF9
         a+JZtcCPv639D6YMDqwjAK556wd+/f0l0nR//J8Q/QeLJrxnFj8urFuGRqJaZQoVW2T7
         B5J5Ra3RcIgcbAGoJwZ6UoyJU+H5cbFDIllh8JGhU/bPjf3JWqwoVVl3P6A3bGNydXRT
         VM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994314; x=1789599114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2wLUzaidHv+rgjS9Vme7RZj9pjhzoFdoBFIa4TcM6o=;
        b=rb1ozCI1eR1bmYa73hnYcpAQrqWovPLYj3Li92LVFIivpyqj8zRCzuLjdgo7hDeokW
         cPNo+FJjI/5w/k9FyZZBjXEqfkE1uTq6C0SjkET8kBeLs26AUBGIOhsG5ODZqVUAaNFv
         20lND/8GMvohPPleyzN/6AlhCPxgBd9gCGE70Nmy4gOHGu7jZJIkpCAapJj+3Gxk7ZIe
         NH7bCsoOsV1LvvfYUFp9xx/wBWMRmvFU0cEoYp/P9udbP2p9Rby/wJQWAailgtpUcEn4
         zEpp/6KTsVjYn7a1VECRUqrBeYzWM8Q+q7nyVUnnUlEzNKoS5Z1YhkzH+vLEIQhDiDFZ
         iW5A==
X-Gm-Message-State: AFuF++nXahyHC4OYpKDKSUkljJBre6Zel5irkYD3YtFwXymFUtrUoklR
	Yt0aUsOzn6hzBDC+FGMPdUkVt2M5vM2oMOCz3KdJY2mpeddx3zH0lFbUneReMZtz0Pg=
X-Gm-Gg: AYBFou3otcjC0FCyp/fhMpN/EEllE8IsUetHISkM7WfBwchM9215yNWr6+kVtY8H13f
	QwI6acwHT0VrvZsmLsYw7MIUvjEz85wLx6Uv5cKmeicw3Uc/gR7yB6npTuDkYBrlHFtDZZDQ7ph
	57ejmaoKkUsAsFze5MvNrPIl/t0ie30IlN/oMKMYwkecVsM02ykAKecHZjj3VQxm4ERmSC3sObs
	MFwQE/7oEAbWUWa7xBhu0CAm0TmGeUnsDWKC6tT6lJ4S8eXl3500E1/NJZdaT+5VOmAdb3xZgMP
	wPU9/+3srFoFECvNadmCLf9k9k0lDwCsvDLWa654LggXtBfU2uE2PYQ5qd0/RKhSF2CLtGEWcHo
	nHe1q9nlo2w2rfcNaqHJ11tbqBICQwtpv/TFhDGYuIVH3LG820nUuKOp4e29N5CZrEUBDF207ht
	ZJSjyUsH6XKE0YJh8cYQVZTd0XhhGntVjOz7GOfyZAVYVBtIuceA/0fGQ3GHwKJlUIx3hOgZmef
	jCCUCSzvygVP/FyKpCww0A5Hpze34kqsEH8l4a09UciACYT3INapk8UfJUr
X-Received: by 2002:a05:6214:daa:b0:910:4b24:a936 with SMTP id 6a1803df08f44-9104b24aa14mr352805826d6.6.1788994313808;
        Wed, 09 Sep 2026 15:51:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm59976696d6.20.2026.09.09.15.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:51:52 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	alexandre.belloni@bootlin.com,
	rui.zhang@intel.com,
	stable@vger.kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 2/2] rtc: cmos: Honor explicit use_acpi_alarm parameter value
Date: Wed,  9 Sep 2026 18:51:32 -0400
Message-ID: <20260909225132.1392883-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909225132.1392883-1-gourry@gourry.net>
References: <20260909225132.1392883-1-gourry@gourry.net>
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
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/rtc/rtc-cmos.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index 462799667aa18..536bdcb79ea1c 100644
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
2.53.0-Meta

