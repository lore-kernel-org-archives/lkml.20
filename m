Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD6143FD0B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788602761; cv=none; b=S8wrxJ+P/TLTZxzHmEBAlzJhPtC3X1N0oc/rPxqAmPDXksDMQvb0BMilMhfFcoUzWcyN5K/19qZIcyUjJgCELGjkwkuZjyeQauEKi8qHeQ762uWkhLIAvABD4eIvXwHdXbBTCdSNgcDannvRg3PVfKLgeVbEeu/ek7vxxhYTLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788602761; c=relaxed/simple;
	bh=Whe7LKSU7peul1T6lvFdN+CuWYm1rV468che/7NJ/GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OS1M5PE3Vxp+fiVfjGxSxmiTMplCTBv6sGjtMTb9YRqDRgNOKpWXQu4hk02FdS/8tSGYH4DnU9bEUaEws+TF5mg61zMxSCrdSjA9l+Gjf5QFBGV1Vylnx8RhyJtlKBarhTAzBaoORxkgw2HaJ3hdA/GkxxUwjQrW0+8IJcxh0Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAfw8dIh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAfw8dIh"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39f20d19895so15055141fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788602757; x=1789207557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVZO7xqLMmMI/VAYMXFHUsaCZa1hDMcAPBs6DtMLFLo=;
        b=eAfw8dIhGw8bftvcNa8mnM8sc2anksqW3+rs1HfRs47Y78SJ6TKB8AEc3Rb7fUr2s2
         ooAwRGbxwe4CeAvDJkfAFlzehcu9S09MJGoEWChm/GpB/aUIKlUZLgvCvQFOV5FbZPHu
         s3LWdgSXYSlu/GQCsjYtu/p2fOn+KDYI59iTcbPAbc7UuC/5d627VB7ddYx4ycHIY5d3
         V7jZ0smtBGa1frq6wdSQ+hccynRPWZWfK/S2eB83cIFEpdgF0xzUlH9R+gzLPF/UFuIt
         0qqUfV0eSo8vXm8/U6lIQZGedFAhBFMYPsnxvW1tm9b76Lqmd58xAtmfuL/pjXoWrEPb
         MICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788602757; x=1789207557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVZO7xqLMmMI/VAYMXFHUsaCZa1hDMcAPBs6DtMLFLo=;
        b=QP1FK8/sNnG8SscQEkFQpbkQhKMTV5CpafDSJW7PJxg1Mfj4Y+wh28j6bNXYagOvCj
         05nkeG7lfAyavOh1rMcrLmgoT/itCnOideapai+gL4fMwBeZaqcENwGQBzcjs99zIzyz
         Bb9JPxn0TCsme4pZMBNlaEeKM7UtwkA9qxp/zzuhp/jDCMjWIqQRq0VN3gKFTxBKaSrH
         6QqgJwWFmNWrye1Ubx2vNULASGMPz3r8bpznY9raWely3Ih86MxmnsGK3SR6z8HhZFt9
         Waru9TANajp4pyiI5loowc7emg3xVR6aJ3SLu3lD5UBO4ZqLxeF8JWKtnFqZe1JAfYdk
         Jzig==
X-Forwarded-Encrypted: i=1; AKwUvByG8Bg1r2gMr37n8v21XGODe3cH42V8Lq9GHWa5VQnznd0vd/9rleQKsVnP4hwsqP+K19AIZ73zKoLIDx8=@vger.kernel.org
X-Gm-Message-State: AFuF++k9EgTGo48MtulLIXSfr2uybqlBuUNN7bdaMIqHZH/TD6VTxzYG
	hcAKumfuALoFtQ4Wtvxz0WseaUonk9LfPVgbMhrJz169f425MtayeIpY
X-Gm-Gg: AYBFou01225sigerA53UFKQ/QUnEMghMuWZUTkv8slj0tSa8aimGXeR/72xpFahbsu/
	B9AgdfDqovRAVtc29xKwWJ7jnyBujLHEMqHfSJeh0nHp1TrYa4jlpHS5NcfAydEiLvLPegBNz0G
	1h3zfcr/VWKK+2ajiOQ8BvxsYoQHiOFSdU5XWBVXwmSiEmf+tn56GIf+xR8bBDu/en1kIxLMnxi
	eAzFf2SgxURb5Gja+ZlVPMF8LmnqdGYn8QKAv9EGQ4vdbcJEllGwHQAr0kkpI/TFF7wjGDl7BhY
	+ATjN0FizwFjwo0OFbe7M8UnrA+kv3uI+3j0Ax82nthXnj6WG9FDs168pGXmGuljUXc5trwi4cr
	jvXLRJBI7WtIEaNcwY/PtgeUj0EF9hHp90HCbH9X0D6xSjI5n22nXJPRI4m/kmlmcDyU3h2uS9m
	h5l4YFMkfiGe0dU9XPgrwUWA1ABu2kAVqf1/drac0GY6ZXVemcNgI2fqGECcrkFSrUczbMERtt9
	3AjYiunbRpYkW7sp04/iYie+XFZ5zNd4QolApSzD/7T6J/2nSC97K4Y7GgGzg==
X-Received: by 2002:a05:651c:1543:b0:3a3:4997:ec3c with SMTP id 38308e7fff4ca-3a375b328cbmr9829791fa.2.1788602756438;
        Sat, 05 Sep 2026 03:05:56 -0700 (PDT)
Received: from archlinux ([94.180.80.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705868a0sm13107741fa.19.2026.09.05.03.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 03:05:56 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arsenii Pashchenko <ulijg308@gmail.com>
Subject: [PATCH rtw-next v8 2/3] wifi: rtw88: rtw8822c: Convert DAC IQ calibration path to signed math
Date: Sat,  5 Sep 2026 17:05:47 +0700
Message-ID: <afafa518cf4f34ff906927eeae488fb25d9aa7bb.1788601784.git.ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788601784.git.ulijg308@gmail.com>
References: <cover.1788601784.git.ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the temporary stack arrays 'iv' and 'qv' from u32 to s32.
Update all internal function signatures to accept s32 pointers and
handle signed values natively.

Use sign_extend32() combined with FIELD_GET_SIGNED() to properly interpret
the 10-bit hardware values as signed integers. This allows flattening
the complex nested unsigned boundary conditions in
rtw8822c_dac_iq_check() into a simple amplitude boundary check. Ensure
rtw8822c_dac_iq_offset() properly maps the signed average back to a
10-bit unsigned format expected by the hardware registers via GENMASK().

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 141 ++++++------------
 1 file changed, 46 insertions(+), 95 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 137544649..4b8a7e777 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -153,49 +153,14 @@ static void rtw8822c_dac_restore_reg(struct rtw_dev *rtwdev,
 	}
 }
 
-static void rtw8822c_rf_minmax_cmp(struct rtw_dev *rtwdev, u32 value,
-				   u32 *min, u32 *max)
+static void __rtw8822c_dac_iq_sort(struct rtw_dev *rtwdev, s32 *v1, s32 *v2)
 {
-	if (value >= 0x200) {
-		if (*min >= 0x200) {
-			if (*min > value)
-				*min = value;
-		} else {
-			*min = value;
-		}
-		if (*max >= 0x200) {
-			if (*max < value)
-				*max = value;
-		}
-	} else {
-		if (*min < 0x200) {
-			if (*min > value)
-				*min = value;
-		}
-
-		if (*max  >= 0x200) {
-			*max = value;
-		} else {
-			if (*max < value)
-				*max = value;
-		}
-	}
-}
-
-static void __rtw8822c_dac_iq_sort(struct rtw_dev *rtwdev, u32 *v1, u32 *v2)
-{
-	if (*v1 >= 0x200 && *v2 >= 0x200) {
-		if (*v1 > *v2)
-			swap(*v1, *v2);
-	} else if (*v1 < 0x200 && *v2 < 0x200) {
-		if (*v1 > *v2)
-			swap(*v1, *v2);
-	} else if (*v1 < 0x200 && *v2 >= 0x200) {
+	if (*v1 > *v2)
 		swap(*v1, *v2);
-	}
+
 }
 
-static void rtw8822c_dac_iq_sort(struct rtw_dev *rtwdev, u32 *iv, u32 *qv)
+static void rtw8822c_dac_iq_sort(struct rtw_dev *rtwdev, s32 *iv, s32 *qv)
 {
 	u32 i, j;
 
@@ -207,30 +172,22 @@ static void rtw8822c_dac_iq_sort(struct rtw_dev *rtwdev, u32 *iv, u32 *qv)
 	}
 }
 
-static void rtw8822c_dac_iq_offset(struct rtw_dev *rtwdev, u32 *vec, u32 *val)
+static u32 rtw8822c_dac_iq_offset(struct rtw_dev *rtwdev, s32 *vec)
 {
-	u32 p, m, t, i;
+	s32 sum = 0;
+	s32 avg;
+	u32 i;
 
-	m = 0;
-	p = 0;
-	for (i = 10; i < DACK_SN_8822C - 10; i++) {
-		if (vec[i] > 0x200)
-			m = (0x400 - vec[i]) + m;
-		else
-			p = vec[i] + p;
-	}
+	for (i = 10; i < DACK_SN_8822C - 10; i++)
+		sum += vec[i];
 
-	if (p > m) {
-		t = p - m;
-		t = t / (DACK_SN_8822C - 20);
-	} else {
-		t = m - p;
-		t = t / (DACK_SN_8822C - 20);
-		if (t != 0x0)
-			t = 0x400 - t;
-	}
+	avg = sum / (DACK_SN_8822C - 20);
 
-	*val = t;
+	/*
+	 * Map the signed average back to a 10-bit hardware format.
+	 * Example: avg = -1, returns 0x3FF (signed 10-bit value)
+	 */
+	return avg & GENMASK(9, 0);
 }
 
 static u32 rtw8822c_get_path_write_addr(u8 path)
@@ -271,20 +228,18 @@ static u32 rtw8822c_get_path_read_addr(u8 path)
 	return base_addr;
 }
 
-static bool rtw8822c_dac_iq_check(struct rtw_dev *rtwdev, u32 value)
+static bool rtw8822c_dac_iq_check(struct rtw_dev *rtwdev, s32 value)
 {
-	bool ret = true;
 
-	if ((value >= 0x200 && (0x400 - value) > 0x64) ||
-	    (value < 0x200 && value > 0x64)) {
-		ret = false;
+	if (value > 100 || value < -100) {
 		rtw_dbg(rtwdev, RTW_DBG_RFK, "[DACK] Error overflow\n");
+		return false;
 	}
 
-	return ret;
+	return true;
 }
 
-static void rtw8822c_dac_cal_iq_sample(struct rtw_dev *rtwdev, u32 *iv, u32 *qv)
+static void rtw8822c_dac_cal_iq_sample(struct rtw_dev *rtwdev, s32 *iv, s32 *qv)
 {
 	u32 temp;
 	int i = 0, cnt = 0;
@@ -292,8 +247,8 @@ static void rtw8822c_dac_cal_iq_sample(struct rtw_dev *rtwdev, u32 *iv, u32 *qv)
 	while (i < DACK_SN_8822C && cnt < 10000) {
 		cnt++;
 		temp = rtw_read32(rtwdev, 0x2dbc);
-		iv[i] = FIELD_GET(RTW8822C_DAC_IV_MASK, temp);
-		qv[i] = FIELD_GET(RTW8822C_DAC_QV_MASK, temp);
+		iv[i] = FIELD_GET_SIGNED(RTW8822C_DAC_IV_MASK, temp);
+		qv[i] = FIELD_GET_SIGNED(RTW8822C_DAC_QV_MASK, temp);
 
 		if (rtw8822c_dac_iq_check(rtwdev, iv[i]) &&
 		    rtw8822c_dac_iq_check(rtwdev, qv[i]))
@@ -302,67 +257,63 @@ static void rtw8822c_dac_cal_iq_sample(struct rtw_dev *rtwdev, u32 *iv, u32 *qv)
 }
 
 static void rtw8822c_dac_cal_iq_search(struct rtw_dev *rtwdev,
-				       u32 *iv, u32 *qv,
+				       s32 *iv, s32 *qv,
 				       u32 *i_value, u32 *q_value)
 {
-	u32 i_max = 0, q_max = 0, i_min = 0, q_min = 0;
+	s32 i_max = 0, q_max = 0, i_min = 0, q_min = 0;
 	u32 i_delta, q_delta;
 	u32 temp;
-	int i, cnt = 0;
+	u32 i, cnt = 0;
 
 	do {
 		i_min = iv[0];
 		i_max = iv[0];
 		q_min = qv[0];
 		q_max = qv[0];
-		for (i = 0; i < DACK_SN_8822C; i++) {
-			rtw8822c_rf_minmax_cmp(rtwdev, iv[i], &i_min, &i_max);
-			rtw8822c_rf_minmax_cmp(rtwdev, qv[i], &q_min, &q_max);
+		for (i = 1; i < DACK_SN_8822C; i++) {
+			if (iv[i] < i_min)
+				i_min = iv[i];
+			if (iv[i] > i_max)
+				i_max = iv[i];
+			if (qv[i] < q_min)
+				q_min = qv[i];
+			if (qv[i] > q_max)
+				q_max = qv[i];
 		}
 
-		if (i_max < 0x200 && i_min < 0x200)
-			i_delta = i_max - i_min;
-		else if (i_max >= 0x200 && i_min >= 0x200)
-			i_delta = i_max - i_min;
-		else
-			i_delta = i_max + (0x400 - i_min);
+		i_delta = i_max - i_min;
+		q_delta = q_max - q_min;
 
-		if (q_max < 0x200 && q_min < 0x200)
-			q_delta = q_max - q_min;
-		else if (q_max >= 0x200 && q_min >= 0x200)
-			q_delta = q_max - q_min;
-		else
-			q_delta = q_max + (0x400 - q_min);
 
 		rtw_dbg(rtwdev, RTW_DBG_RFK,
-			"[DACK] i: min=0x%08x, max=0x%08x, delta=0x%08x\n",
+			"[DACK] i: min=%d, max=%d, delta=%d\n",
 			i_min, i_max, i_delta);
 		rtw_dbg(rtwdev, RTW_DBG_RFK,
-			"[DACK] q: min=0x%08x, max=0x%08x, delta=0x%08x\n",
+			"[DACK] q: min=%d, max=%d, delta=%d",
 			q_min, q_max, q_delta);
 
 		rtw8822c_dac_iq_sort(rtwdev, iv, qv);
 
 		if (i_delta > 5 || q_delta > 5) {
 			temp = rtw_read32(rtwdev, 0x2dbc);
-			iv[0] = FIELD_GET(RTW8822C_DAC_IV_MASK, temp);
-			qv[0] = FIELD_GET(RTW8822C_DAC_QV_MASK, temp);
+			iv[0] = FIELD_GET_SIGNED(RTW8822C_DAC_IV_MASK, temp);
+			qv[0] = FIELD_GET_SIGNED(RTW8822C_DAC_QV_MASK, temp);
 			temp = rtw_read32(rtwdev, 0x2dbc);
-			iv[DACK_SN_8822C - 1] = FIELD_GET(RTW8822C_DAC_IV_MASK, temp);
-			qv[DACK_SN_8822C - 1] = FIELD_GET(RTW8822C_DAC_QV_MASK, temp);
+			iv[DACK_SN_8822C - 1] = FIELD_GET_SIGNED(RTW8822C_DAC_IV_MASK, temp);
+			qv[DACK_SN_8822C - 1] = FIELD_GET_SIGNED(RTW8822C_DAC_QV_MASK, temp);
 		} else {
 			break;
 		}
 	} while (cnt++ < 100);
 
-	rtw8822c_dac_iq_offset(rtwdev, iv, i_value);
-	rtw8822c_dac_iq_offset(rtwdev, qv, q_value);
+	*i_value = rtw8822c_dac_iq_offset(rtwdev, iv);
+	*q_value = rtw8822c_dac_iq_offset(rtwdev, qv);
 }
 
 static void rtw8822c_dac_cal_rf_mode(struct rtw_dev *rtwdev,
 				     u32 *i_value, u32 *q_value)
 {
-	u32 iv[DACK_SN_8822C], qv[DACK_SN_8822C];
+	s32 iv[DACK_SN_8822C], qv[DACK_SN_8822C];
 	u32 rf_a, rf_b;
 
 	rf_a = rtw_read_rf(rtwdev, RF_PATH_A, 0x0, RFREG_MASK);
-- 
2.55.0

