Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775619;
	b=EOjZefKMNGYxcR8oG2Ok7O0jTbhHKpgc8C5yAhNbR3+3lzm3Wo6ul5cimww5OKp+jcPg
	 ze74ZbSZgk9dSWLGwN5D6gIPwMF7PlL2CXHnJkjvou9UM1JEzhMVJHnnbTr0eF4N0dxjp
	 VmDy8Eqt0Su+6ZdV28h+3qyls3rgUxItGmCuX+z8JlKaMiEICs2IL/K4/oxnDvCcxnt94
	 q79iZQHC1cuwQnQtgb6mqYgpomwKxfQvXFuBsU1ATMQFNDauyHpwZeZ5uyqLWZuhEJUmS
	 NplpF46wcunsA5ULL1JDevUaZrpuh8WFiIeXoXLfvtN+BECW7ajuybME+tJpjuw2q/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o38SHGbZ6zgVNzoWguy2MUwD3AzbhFlCQHdQs5MMgUY=;
	b=d+alwvMfIF5gdOwLSHm+3vT2ZR2FP37nhoZHGbvYfyV6rVJAeASFzpe7v/1+oOfZsmra
	 0L8IdEfoQY+b3jty7h4gvWiA9IY1Ji9R+cvsS1ncpycIthBO7GjWzZxrcqgECKxr+S2jU
	 a5ImUaPIyL67AfFlRPGAS9kZzfeUVRyqLU03pcHHdh7TgtgoK+cvfMfwdOlqAT/OGTQZF
	 8ART7QgJgmmrA+Ve4fCWkF/0zJAcqBP3v5sM5ATu5Os6pZ3DlQ7dKJ5IXPuou+8VuWB+z
	 1RgPrVCsSMcG599598nhTHNfrUnpPIVvG+ZEReYJm11FpGH2L/KlJb5jgbE8ZILBnXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l0+R9SR0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gldlTce8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74804606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74804606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l0+R9SR0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gldlTce8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG2vK73228347
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o38SHGbZ6zg
	VNzoWguy2MUwD3AzbhFlCQHdQs5MMgUY=; b=l0+R9SR0OTreDR/I0IQvUgOwyPm
	EFuLboXhCU4myF0BHYec0m0OtcxP0Iul/8+mXM0ahf81ngCB2hNPgpTFKFfcDtCS
	FVHqWJJgL2xYJZVe7ARlf5oSBMcjIp0CU3VrEzrfM9D1FztP5OLd5Bz+9o8JhT0+
	3BqWhjj8C/fW/R2LaExQ5iLI3ZQvez2xdPkm3zaLERSQGo4CG7MIsUkK3wWQ7+nh
	kpykiD+zWT38ErO7m0i6IbsuUvkq8uSkfhBGwe9Knjxt66zo2spm75Pw9WvV4eH4
	/7l5dhWmb2+0J6csmtgxANyoc4KHgKtNjhkkMSNivu+H/Avb3aOfuMFiYIg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart091x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a7c17166so24252686d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775617; x=1793380417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o38SHGbZ6zgVNzoWguy2MUwD3AzbhFlCQHdQs5MMgUY=;
        b=gldlTce8WZZFWQBu1OCw391OnzYez1fHi7gTCevnJYC0DMnrLYh6+1MxRo1ReoquU3
         7b9/dHWU6HbTTUsMefJbYHO7bNTt7Qsp/wKVF4atkiSfTOh3VnZYJmw7Ed/GmE6RB+y8
         KvPF+kSpHEbZtWvyj+NTYeTOVpFrvTxMdd6Dzjko8RUru7h8k+zp9rbRYeQsDXMLFtbC
         KF+GnWTAb5SyQxQ0QT+eg4fqfpEBv80PNUqqLHjnCJYu4UcmYUzeB81Z94nI0Hnqb0/D
         enM03f/Tkc52MefFKupYVQsD6JFAks8S0nFW20IW9woxy+knVRw4F8wv77rx77XFMaur
         cXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775617; x=1793380417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o38SHGbZ6zgVNzoWguy2MUwD3AzbhFlCQHdQs5MMgUY=;
        b=CN5WYCQeiwOLp/Mh54Wv6Wo4Ev8QJ7cM+TYfFHq1yoHtD3/GbxGghrAWy9nXw1fDxH
         E8dbuoUzKdAzfCcQQ5UVEWZyGoHXpdSoYTpLxMWkvsggkYOufiLYnI8YL8/UJL393tWd
         SIOSUGLPtNUIGn0KwDvKy9rflTEXZ5CLMhkADhLNVB5CywyapVs7DfqvJre6pmncm1Hi
         bxk+P1/aOI+HVQT+NARPH6/LkQ4ji/RR+aWZEIzlUuliyRIHoq5J8HvAqIInhmzuAmru
         F50igdA8F4mhE0zshQ/z1pLDzSqNBsCNctrtJhrjlNppbsyuESyLx2gdt8h4RWfYwJXA
         1H0A==
X-Forwarded-Encrypted: i=1; AKwUvBy0JWute4L8UrOToqgmfa3/ctHUDEi3y+6lIWdXngAylbsuTn0dzPoN2K4cViYZaX3qMgEbiPpTIJm77uc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKScSopN7V058S6pvjmUl+lCoTcUPdJohV14gidalZ+khTRF1/e
	Ak5Da8U7oPwHVssNhJQVvP+Ybh77BwKrAIOsXbrxMZ36vZNDrhrKeCSSof/1JQWX50yqUnSGxkw
	zf9qofOmM343hlLm9T/bgiuTsB3+BGW36XY5qp8GvSrN69xJXRuxOrPUv8U6qYQWmKGo=
X-Gm-Gg: AYBFou0E02oKB6y+7RzdXQMu+LvOwybfZxrZGneCoGnoo9Mj6CmazZsJalZb57a8nM1
	HDcglBaEwCyJwi+m9C32JY6HtXMUc4LO14xzdpYqAFRHrswsWmY9hX+DIIWxb3OwxG3lIEdloGV
	ApBzKHR8wH82DxIKgeJKiByzChz9PaByp3MboynQZPfmOluyywE9AWK5I4vO/Iaoye+3+rToTCQ
	7kiD4dK+6UkpBsPysO7ogqNjy/2HhO/7Q/l4nMk0o/bMwBcOykt4nC4FdKIp7r/mHAtU/GZr6VQ
	NQSGWVob/Fnmsx7p6s+SJosrzHC23A0bn+iHd4yZHNKTh75VTBtyoBhuauI30xUGOAMFzEzeuKE
	WjW4uXWOBQsp5
X-Received: by 2002:a05:620a:4395:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-93f6f9ed474mr543864185a.68.1792775616749;
        Fri, 23 Oct 2026 10:13:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4395:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-93f6f9ed474mr543859285a.68.1792775616307;
        Fri, 23 Oct 2026 10:13:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 3/7] ASoC: codecs: wsa883x: Accept temperatures across the full trim range
Date: Fri, 23 Oct 2026 18:13:12 +0100
Message-ID: <20261023171316.819857-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1PCuwGn3smBf
 rpbXf+2CcTALXZlGd74vqcVP/Bq29555IOhOSctOFsNyAiekZCT9kgdEcSno1zGhX9v/Hc8JIFA
 LcMk0CmmHvUuG84l5rSpDUpuzIU8KfU42+EGSSb9yEmJxYm2ygHWzw4L/Of0I9P6PAULrSbbBPa
 Qhhhd5YyRPNKsRsmDhQFesxkda+AQidHGv4f/VFKOs1vAqJe43pY7sVbltqYETidSXPZc9JDV6Z
 hF98Dkc50NTq4IbbsQ1558qCS3qNu96gI+vIXl27rsPkzW6+pyWoAg/umHAe/axKFonqfswo0oK
 YuzNCfWN6mIemwsYG1NMfv+8UAi6dOy8uf7as+NwCVC4fPEx45LuQpL2VSjijjbyHEmczDI/FGP
 wF2ZFVejYfxmqpv+pNYO4j6CJKiVWU+5pjwwoTTy0o7+iro5Jo8axB7WN5JaioRvBLe6c2sFYtY
 cuM+HaG4hTR9QrwvLrA==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adb95c1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BDwgr6QAJ8wfB24CiCYA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyeg6tyK76XG/
 KbYWap1dC7ogg0eqapelAhsyt4JJA/mDzsgdNYKK603AM3E0QIpPwinRbSUBpkKVP8L7kNueKou
 IVFJ7EPDCenWmVZYJQ7KPAFbgEoMFo4=
X-Proofpoint-ORIG-GUID: snavedoe8KoUVZKRyoLleBOeoonDTdWX
X-Proofpoint-GUID: snavedoe8KoUVZKRyoLleBOeoonDTdWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

wsa883x_get_temp() rejects any reading outside 5..45 degC with -EAGAIN,
so a speaker that has been playing, or sits in a warm chassis, becomes
unreadable above 45 degC.

Bound the check by the -10..150 degC two-point trim range instead, and
use inclusive comparisons, as in_range() excludes the upper bound.

Fixes: a02c42d41af7 ("ASoC: codecs: wsa883x: Implement temperature reading and hwmon")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa883x.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 442cf9f3eaac..ccd4404c1644 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -456,10 +456,11 @@
 
 /*
  * Device will report senseless data in many cases, so discard any measurements
- * outside of valid range.
+ * outside of the two-point trim range. Do not narrow this to ambient: a
+ * speaker that has been playing easily runs well above 45 degC.
  */
-#define WSA883X_LOW_TEMP_THRESHOLD	5
-#define WSA883X_HIGH_TEMP_THRESHOLD	45
+#define WSA883X_LOW_TEMP_THRESHOLD	WSA883X_T1_TEMP
+#define WSA883X_HIGH_TEMP_THRESHOLD	WSA883X_T2_TEMP
 
 struct wsa883x_priv {
 	struct regmap *regmap;
@@ -1430,7 +1431,7 @@ static int wsa883x_get_temp(struct wsa883x_priv *wsa883x, long *temp)
 	unsigned int dmeas_msb = 0, dmeas_lsb = 0;
 	int d1, d2, dmeas;
 	unsigned int mask;
-	int ret, range;
+	int ret;
 	long val;
 
 	guard(mutex)(&wsa883x->sp_lock);
@@ -1493,8 +1494,8 @@ static int wsa883x_get_temp(struct wsa883x_priv *wsa883x, long *temp)
 	}
 
 	val = WSA883X_T1_TEMP + (((dmeas - d1) * (WSA883X_T2_TEMP - WSA883X_T1_TEMP)) / (d2 - d1));
-	range = WSA883X_HIGH_TEMP_THRESHOLD - WSA883X_LOW_TEMP_THRESHOLD;
-	if (in_range(val, WSA883X_LOW_TEMP_THRESHOLD, range)) {
+	if (val >= WSA883X_LOW_TEMP_THRESHOLD &&
+	    val <= WSA883X_HIGH_TEMP_THRESHOLD) {
 		wsa883x->temperature = val;
 		*temp = val * 1000;
 		ret = 0;
-- 
2.47.3

