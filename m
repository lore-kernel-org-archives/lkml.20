Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE83A4F3B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211371; cv=none; b=Cjl3zLrX6PcNz8sGVhODG2XiGbOu+fiPjHBcwoR3NLWzKy02cVyWdPO2zhac1sXr3aZQDzgP28vxlWCTgTHDKv86bCnposM/Ie8vX0BKkpry1j3hlCSSkJOrCBnrtZjipFtswrsd5uN4q7jQVr+5ifUs8S2bp2U5jA567Jaiiv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211371; c=relaxed/simple;
	bh=QK8aNSzL7ND4hoq7Mvy7TvP92pxHrFlqyV4BOQPaCNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQUjADRghXxxlmzpwO8L0Upsh8j3Z/bAq5w3RRdV8/e8yy5gF7WgnYWMYaPH1I/BJs6+HW97iOiuYMqnEGqF/6TyPuO2j7poM94taC9lyhTM/7iGivYCRH/wbibmdSSYy8kdBVORv1yyEWlOQNuIUTBeNbKzUCkvgPUMuhT+jek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO0GHDn7; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO0GHDn7"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso378753a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211368; x=1788816168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEYLADmFkDVF9LXmlc95J2Vic5BUF75td03Fx2o+E0U=;
        b=XO0GHDn7GpzT5k+cdUnSrhHqYKwLHiNcEqjlQDZawpG0UHdJN1hXwK+WnSQqBq6uSn
         h/5HwOwKQmXQ1AJ+8ZIFFJ4dTeFrDo9nWn6p1Wb21nvKi2yVDV0ir8/YA4iiebpb2uz2
         BlbUzIxADY/qBd/CqvwaKtpyDqO3U77kPDh5N2acL5SPiG3Kg9zI55251DuuyIb7BRvE
         8WNr7znVi8FxO9BzVlmBnmd4zgfzB6VwCeqg5baRUybeWuvSn2TEQOslMTVNWf2Lpo1Y
         pL8RL2/hRHzanvMdNqypzpLIrsKgzI6z923F0/ycWocH0gSGvAlaa3M8zUSLlg7VwdtA
         EFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211368; x=1788816168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEYLADmFkDVF9LXmlc95J2Vic5BUF75td03Fx2o+E0U=;
        b=E1O9yN00E/WBxJFPyuntIQYtb9Z5176EL/plMY1u/4DziWHxgsRY7x63p15I5lzrfi
         98d3nsyslqGMQ+h1FN1ng78lzpDrjJ8t8WS1ybE/xQRuNF+lrXRCo6BTinAPFBGgilV3
         RFoIkkTq6Oqmze/0jdWWJpvRTJglAwIJU2su6o9Y/unLElqyD92xW0JUDskUt/qaHFHX
         oCCVOYuN9G30buWXOrZQCFaPMzvZ+PVvtQxlNlzmPaf2n1YlHlduowKXaK2/f4oEBWR1
         oV6ail3VEnNVvh/0GlUDQo7z4kuNw8pTCpfMaC0Ao5By54jt04IlFS/rh92baitsAvzu
         mzuA==
X-Forwarded-Encrypted: i=1; AKwUvByUL201mFY5iaZLq1OM6juT/R3jf92jPwx+8iRkX/P2+jCdUbZ/Z61wYd6ITsQEZXqlxLxrnbbKQdZ8LLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m7o+kcm0ODlLuTu9/Al3qDtFXrrjpHQ8uDv9XM0b5lUwoIjUy0
	j9cXjpw9+nVM6HTwYGQJj4010AC60yvzzG1n+rj27uP6+PlYW1KoXD20
X-Gm-Gg: AYBFou2Ape+gECdmaBatwX3HvxHAnLX3TG0K4BZxT7sV4N6Hoa8Irh2U4b7X+9xyptH
	uFmQoPrQvE6WVQFCPtxhV8+lUVzbjv4trdGGcV0Vj8kyBOiLuWZ/g3HcsqbTPE2ci5/+C2xXRvy
	E8fIbbKJ+L9Asa/nAibONiRMW/JXgHFyi1G3UctYS6bd6Nev+DBklp2au64jpCVmqYv+dE/GSM7
	LFIxtQ4xQl7dGoISIkkdzLpy2RMsTXU2XUfzio6sZodkdtgBkjUFebz+bUYmp6MLYOkB/SAR44W
	bJLVWR88pWMOa+E4cFvVzefNtmFE4T8RHCwPSfzgG8aIpK1DN+JeTy103BoIk+fI+dyEKtYFi+E
	IViAxv5WoGeSB0X3/+VNi1ggklUJ5Y2RiQVyuSWE1lSrCcWY2snIKOygUzvjtUne9r+7/oGUCMM
	iiJIsy64iPf+vr4/tQmXQj7PHKwagXgONHeofzPU0g5txNqtzzyCHdKl9PrDmhO72ql/Q=
X-Received: by 2002:a17:90a:e7cb:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-398bbe97548mr18505107a91.7.1788211368378;
        Mon, 31 Aug 2026 14:22:48 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:bac7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm47179945c88.4.2026.08.31.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:22:48 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v2 5/6] eth: fbnic: report temperature and voltage alarms via hwmon
Date: Mon, 31 Aug 2026 14:22:33 -0700
Message-ID: <20260831212234.1212971-6-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831212234.1212971-1-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building on the temperature and voltage thresholds stored in
fbnic_fw_cap, expose alarm attributes through the hwmon interface:
temp1_{min,max,crit}_alarm and in0_{min,max}_alarm.

Each alarm is computed by taking a live sensor reading and comparing it
against the corresponding stored threshold. The static thresholds
(min/max/crit) are returned first straight from fbnic_fw_cap without a
firmware round-trip, and unsupported attributes are rejected up front, so
only attributes that actually need a live value fall through to a single
sensor read that then feeds input and every alarm.

A threshold the firmware did not populate reports -ENODATA for both the
threshold attribute and its alarm.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 68 +++++++++++++++++--
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 4938f7b39140..c5cddd9cef12 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -87,34 +87,84 @@ static int fbnic_hwmon_read_threshold(long thr, long *val)
 	return 0;
 }
 
+static int fbnic_hwmon_read_alarm(long a, long b, long *val)
+{
+	if (a == FBNIC_SENSOR_NO_DATA || b == FBNIC_SENSOR_NO_DATA)
+		return -ENODATA;
+
+	*val = a >= b;
+	return 0;
+}
+
 static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
 {
+	int err;
+
 	switch (attr) {
-	case hwmon_temp_input:
-		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
 	case hwmon_temp_min:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);
 	case hwmon_temp_max:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);
 	case hwmon_temp_crit:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.crit, val);
+	case hwmon_temp_input:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_crit_alarm:
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	err = fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
+	if (err)
+		return err;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0;
+	case hwmon_temp_min_alarm:
+		return fbnic_hwmon_read_alarm(fbd->fw_cap.temp.min, *val, val);
+	case hwmon_temp_max_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.max, val);
+	case hwmon_temp_crit_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.crit, val);
+	}
+
+	return -EOPNOTSUPP;
 }
 
 static int fbnic_hwmon_in_read(struct fbnic_dev *fbd, u32 attr, long *val)
 {
+	int err;
+
 	switch (attr) {
-	case hwmon_in_input:
-		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
 	case hwmon_in_min:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.min, val);
 	case hwmon_in_max:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.max, val);
+	case hwmon_in_input:
+	case hwmon_in_min_alarm:
+	case hwmon_in_max_alarm:
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	err = fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
+	if (err)
+		return err;
+
+	switch (attr) {
+	case hwmon_in_input:
+		return 0;
+	case hwmon_in_min_alarm:
+		return fbnic_hwmon_read_alarm(fbd->fw_cap.volt.min, *val, val);
+	case hwmon_in_max_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.volt.max, val);
+	}
+
+	return -EOPNOTSUPP;
 }
 
 static int fbnic_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
@@ -139,10 +189,14 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
 
 static const struct hwmon_channel_info *fbnic_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT),
+			   HWMON_T_INPUT |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM),
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
+			   HWMON_I_INPUT |
+			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX | HWMON_I_MAX_ALARM),
 	NULL
 };
 
-- 
2.53.0-Meta

