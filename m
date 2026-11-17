Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907953;
	b=TXMrLYeGDI+F02wd1w3T1aB3aV+ZVmBaV4Ktv/lJEoTK558aQUqFJgFVcJTh/FFV2OuG
	 UC5deeanpkLE17bWn6NuuBZ+Q2pTh+7iY84dCBJgrRcbibG+ZgTWYgKzLzByAJh3F7bFz
	 nT2CFfJJYGWpZX9uU7bQWkEmvIay7n4QEO3tb2Y2zk2moTCZ86jrrCO6O4fi1OOzvj/t7
	 U9Yw1TrKan+tbsoIW0mMc78dFVXXSK7Xt9tspgtie8Ge2gA2FW7hpAEcwULGYO3WoGqcz
	 3YIJ/Gi8kEqNd3f3d52o3ZbzrM4TLYsIVlym2ZfYXKfaMdjGtmnPsR2M7HDBqJmp6zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zkgm1t7dXdy8TcgUYM4rsV7MD9YhFwG+4zqMKohsKV0=;
	b=pIfm2E+f5cl5tauX7bfsCMQRX3Zm2ZDTG5zbxxfoq1weSDHx2w/OPzS/xUCcyCcDjVdY
	 IxENzOHpSidpO36GCd2gIumM4Qd/JA57aN6OelMfieJEi79fWykv5RomZ3BMRiYlzh4rf
	 ghv3GRlMqki5Q+Q9OqIBG9RpMKlTIJulz16qJ0YMo6npIjvY06z1uzA7A9a3ijwdldFhH
	 v1OoXcozD9+UDc5N+2DSoJLT8prPMsuQXjH0aAVmwb9vQxDCwMa2YhHDydGqmj/uUdFO9
	 PkZsX+GC6kvz3tt5e6dlstbm53biQCWoOF/QeXVHHJ6xSXylqt8J1G7jBRVhVfaYOyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPxwQKau;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9pmi6fV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36561606A888
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36561606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPxwQKau;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9pmi6fV
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8upW32934224
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:32:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zkgm1t7dXdy8TcgUYM4rsV7MD9YhFwG+4zqMKohsKV0=; b=ZPxwQKauFs7WJ+4Y
	EMyRHC/myb44S9B132SesqbUeZ7Mr+9zbODjeFUUhtTLhcFZEqghODfYctZiWY4K
	K8hQddKPu3OU7r4q+mSZY3E5l+BJLCzj4ziA8PXiAETq3IZ3fvWdu58j+YH9GnYB
	3SiUY0qxgCgMNg1U/wDYNtNdFg568+4cyDa9yQteAbeDExbsWDrXP7xt5HEPig7R
	QLIv9nsS34lammcc0fNthESM8Y4w3oJP7ksvc8SskFM5xd+sGxvhrg+qZ3AMeA1o
	OaCqSelXp5WQKNLKx2F9YGF4fo6jdCjq5RUc+pOzqxtX6CjoQGrDo2w/Ps+jd3bx
	MqA+bg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0ad70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:32:32 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4ad9bc6aa91so5228707fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907952; x=1795512752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkgm1t7dXdy8TcgUYM4rsV7MD9YhFwG+4zqMKohsKV0=;
        b=B9pmi6fVsFFYGYwnqBA0lWSugbglm3nX9DDobrRokxpBxUImHuVhnal5w11zKFkb11
         PZzH2nqbArvvZnwC5kEaXo4TUEx0dgZZ7VbGvFEdQhNPN1FtnINszI4xXMJrpPsEvUNc
         PepE5Reqxt9aV5rtVNV93bY7zXLt/QCjjNRS9+bivppQpnzPHlQ8wpzqrj789B7YynDm
         RyIepe6Qxm8MDo5biR93lGahoKp+Q23Hg86+1W56x+JQaTgv8NOoGPntNQkVrdM0wuMn
         tImx4okIFMVBXTiTQWLUn2zWaOh1w4tDBBqk+r4471d3yDu/f62Gd0hF5cNnl2gnPh7n
         Jerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907952; x=1795512752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkgm1t7dXdy8TcgUYM4rsV7MD9YhFwG+4zqMKohsKV0=;
        b=r0ggzLAlboCKCAO/gNg9qUMJG/Wgv7dOniSF7KDNbTR44YieAy+PDQMK/kGJ9VdDaO
         tsUU4RAkek0ixq3zfU3g2sji3rV1MnCH5cfgDB7D/LAGaIDk250FWgQvKajjXVsWn5Hm
         TDV6MtI6ihKznYzm4S9YifiV+TKQ1Y4oaUfmUAsMHrwhDhFbQJ8RoPz2W2hw1SO7OUSi
         bKwN/DUAQ/a1XOl9iPs8sQk1eNZOB0PlqyNhR2e+yuAL/OJiGEJnNNuuUNsJNXjAoKkg
         fWyAl+voKd5+W6HjgyIA3BkOBh6/X9bNNQdlMmKFuVxYxJzQWdZ+RM/YzcG3ZCrj++Bj
         7QGg==
X-Forwarded-Encrypted: i=1; AL+hErEwSy8PRzfxVsrUukLk7tYwpn5eedn4d9gByrvTIznXzIA9oJ0HkNXgeUjaelaC8MtsuQ/K0+fPR2I4PmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k252E4Cn/ucVIR4RBu9q2tn0bIyVtXHDEP0Ci+3A+z/CCJx07
	MW1jDD1Msj2+yHkjh1gOLhdozojkQMgVVdDa5U9aM9MedRa3phRvFvtZpTjP6K9RC8ZWGlfW+eB
	y5s/aoWh84CXsyTRll+rKvu1NaQc/+MHQOlUgkEbf+qjNloQoM3ihXgsOLbxvdRZAGO8=
X-Gm-Gg: AYBFou3XzrONoD3KgJcJXItWuvk5xsaNz/zqHtMWdzHAp+zOUrvHMI90FkO/zXBddsY
	9P/LlSjWEFSVT4sEl4ON0KUzhX22EVg7GvgUABmc0VOt1aJltsiYklTw+O5ylvbGMS8A09dskvs
	WVY3d2EMM0MjGCqSaXb3MdjDMeY6dGW/Ed+F46prbJ1BObMeIOEXYpqzvnZz2nJ6vfjSpKHjQAC
	6no1ob2JF0m5NY/ty/7iv265wHk6XF9tJ/koZF9yliJgGNkVhrfZop00ncGwq/Q/exYkeF9SHe6
	uJB3vhnkSWGo0emojKr+5EkFY1Ys3ANjMUTCYwi0rwkgc+I+Lm/PO5+h5z7rr/RYgSDVshQE40c
	NV5ZHAGMAQZPJwC+rKwn6PYkqJnFmHMM3bU0HmRljegWNDF5Mi+srvduMQiu80y7Kub/VEXx+OS
	G2uTxjski8FRnMLV916z9IM86Q
X-Received: by 2002:a05:6870:c2a8:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4afdf4eed55mr10942745fac.59.1794907951595;
        Tue, 17 Nov 2026 01:32:31 -0800 (PST)
X-Received: by 2002:a05:6870:c2a8:b0:4a7:4324:1814 with SMTP id 586e51a60fabf-4afdf4eed55mr10942736fac.59.1794907951129;
        Tue, 17 Nov 2026 01:32:31 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2206dc0sm8678928fac.5.2026.11.17.01.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:32:30 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 01:31:33 -0800
Subject: [PATCH 1/4] leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-1-7a862240683f@oss.qualcomm.com>
References: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
In-Reply-To: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907947; l=2942;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=bMmJtTuFOhspQ50/s2y2wIQI3rsaWPAH5XFVb9ltZa8=;
 b=5RZKvwuLTDfyyHFtUe+m8WLbDkFyGodk1XemXgtwcBiJQkYhFq+E/FYdTR4CXMLo8e4Qk8ekD
 y5UI9w5nj5JBMWbOO1BLavbfpwnC/qTHQcaA0yiq3rGfBrZzaqcxwbX
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX8JhZGiPHa5Q+
 +/IM9pqVE+7G3WF7bP+OsP0cVLLWS7XN9P0TZpXakvMq8kVdsEEbsjmwiZxyNdSCDRPkbnc3K47
 aCPRtEn7SHPLr8epMfj2YheFJnCjyHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX/qSxc0bAP48i
 UnANYZgWJMO6UB2dRFzQWWjWGLjGzabYqRJLALPZy55CNAdz/qhh1FSsNE1BtbtrM4yy20Er94J
 65rV1LV3G8HJrxwI6eg7Sevf44G+WuRpqcDqpTBasnihkdVmKkoc5XpJk3FR+pFx+aPZVIkSsix
 3BuTgZvCoqvDZOa7YnRvZ211QlSh1nylswaRUh/I7nAQ4tszM+knvAyLXkPHSevL8n96ri0Y1K0
 tS+BOfUIzCbHnRihd0C73pI8WTStsWalj+XMehfyUr0i7cwcr4KI9HWFAd/uHcNmUd1H1YT7stj
 rdOquwzlxNg+KsdjpI7FnOJaO5k+sFREFi++nHcy8ORh4MNhUkzEKl9QNEZ2ihMhmxe7dWDng9r
 JIttTP66c+LjC6b7jy4e6FEwDRqDfZI1WJ9HAhBr12zoEAoDEbxerU6y2dYRzW2M/HngugU45+H
 c1IJQuRLGSdR1cHVgcA==
X-Proofpoint-GUID: sDmGe_zjS4MgTIwPmY1Z3sHs1tW6s_RX
X-Proofpoint-ORIG-GUID: sDmGe_zjS4MgTIwPmY1Z3sHs1tW6s_RX
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc1f30 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kaEj7Wm-z18sYFa5t94A:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170037

The LUT resource cleanup path currently treats identical high and
low indices as an unallocated range and skips clearing the bitmap
allocation. However, with a 2-step palindrome pattern, the high
and low indices are identical, which can leak the LUT resource
because the bitmap allocation remains uncleared.

Resolve this by tracking LUT ownership separately from the index
range. Designate the first channel as the owner of shared
allocations and each active multicolor channel as the owner
of its per-channel allocation, then track this ownership state
for both normal cleanup and allocation.

Fixes: 24e2d05d1b689 ("leds: Add driver for Qualcomm LPG")
Closes: https://lore.kernel.org/linux-leds/7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com/
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..e14a3316bf22 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -111,6 +111,7 @@ struct lpg_data;
  * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
  * @pattern_lo_idx: start index of associated pattern
  * @pattern_hi_idx: last index of associated pattern
+ * @has_lut: channel has the associated LUT allocation
  */
 struct lpg_channel {
 	struct lpg *lpg;
@@ -147,6 +148,7 @@ struct lpg_channel {
 
 	unsigned int pattern_lo_idx;
 	unsigned int pattern_hi_idx;
+	bool has_lut;
 };
 
 /**
@@ -393,15 +395,19 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
 	return 0;
 }
 
-static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
+static void lpg_lut_free(struct lpg_channel *chan)
 {
+	struct lpg *lpg = chan->lpg;
 	int len;
 
-	len = hi_idx - lo_idx + 1;
-	if (len == 1)
-		return;
+	if (chan->has_lut) {
+		len = chan->pattern_hi_idx - chan->pattern_lo_idx + 1;
+		bitmap_clear(lpg->lut_bitmap, chan->pattern_lo_idx, len);
+	}
 
-	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
+	chan->pattern_lo_idx = 0;
+	chan->pattern_hi_idx = 0;
+	chan->has_lut = false;
 }
 
 static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
@@ -1118,6 +1124,8 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
+		/* The 1st channel owns the LUT while other channels share it */
+		chan->has_lut = i == 0;
 	}
 
 out_unlock:
@@ -1176,7 +1184,7 @@ static int lpg_pattern_clear(struct lpg_led *led)
 	mutex_lock(&lpg->lock);
 
 	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+	lpg_lut_free(chan);
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];

-- 
2.43.0

