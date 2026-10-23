Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775621;
	b=QdgaUQ2WBQNhXfnp0wuSIL/vXw8iNRiD1xxEdGibkzIBFb7kDJNkeYbgbu/uVXB/mc64
	 GiM4p9rTkNtWolodoSrjnNN3cTeQbl+4Mnht6PT8o0olpu9pwCzLAeniBPXH1USoDhNp7
	 kkhll6NYU1oUrBeDU/yY/9kOYUtBm8ZCb9qn4G0Ncv8IUVetRP5k4xK0WxPAwveDYxmHh
	 MDbe1DkvQKKPRJAGCwH3sdiXaEi0XOOSCQ05mG/BcPDNdRUBiNTC1qEaqWBIUO6IAKLWu
	 tlwIGjapb1huZgQL0Fgym/Lsr13cRUULGPfR/svjlQ0nDWL4F8uiPZw0E5XwPaqjk0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
	b=tr8WEN3qDA58eYlSfB1qBGZTE7vBnz9IEUvRZE2StYnenciZmbq22P4E7lbZ39xBfOcu
	 ZWoX5otkcmJVqzPJb7EDTUQQvoegUbIm0N0DF5yPUDRtXFiSyoS6Qe2gS6csneUNjSwxx
	 TiuwsNdxK5JJYpKA7Zk0SPD9piaNdar6RcTuAz7lNUlXIPMYoiLUjdXPBVvrD4pwphSAk
	 wPdCsft+hYhmuV29kHdl7RzObBGwRgylFlb7j/ug7bT9P48/4j5fNy7VM3Lv6+9Bzy7TB
	 ptehASJmYQadzvp6PqzFEj0D2ib+ebB5RmVMnq4/gr2GN9pCwOpqbL6EJKMnx9ZEYLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPeE9K52;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNgySCA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146060A2626
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4146060A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPeE9K52;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jDNgySCA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6rwG1492210
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0RaoJf1quXY
	WRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=; b=CPeE9K529Dr5esSobebjLOZOJmn
	lC7XXPUB2BhZt8WFuvJhrtNQLzNm3glP8Lpdvcwasg6vfan8GbezAjEsj4gcbxpr
	qS2QvuPvrJY1zwFrvQeRNDzQLsgHXxycCQAGo0HGYlfp8/XC8AFs2t2Rtd9QQeE+
	wLXlHCmnCVt03gMhBE+qHTLqNuuvQMEuUv2XdNDjTHx+PzQ0UHo2KpxByoncWlL7
	e+iBRwfP37yaZHHym3l2HQSsNA/yBZ/66koZ0D21s20eLt/OduPHLiDP2oldZFN0
	sCTgg9DctvSgeVolatlJU7EsZFJ3BX0tG3Hlads4JlfGadaezQZVJOGHrGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmav65m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:13:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso437919885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775614; x=1793380414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
        b=jDNgySCAGDqPFOm8WeJw/bnsGCKYAxZM8As1HC3sVfyuFB2FP4TMkp6J2Z3tcZY31d
         OExh9NnHxkZPY7AEOlp+nMbS2vJQqfTvLlzxQ38Mr971jVwTIgtIzFArlZlEK/T3lp/+
         Bu1rQlHHA43W2Iijk684jYri88rTP5HtFsujyL15Yz4M25n1JyUHABCE6p53DgbWmUVV
         29gD6t1tBeg6Xh0QQtzUnPn1Utuu+0onMhnm8SOhNW8s+NUnRWnNivNAXK72MLP8W7aK
         G4AcBqxBGSQfsRlRQZ1fSucoIoRQR7O7OqTiFgTY+mZRBfXxc5+JuR3sgKlVyUk8ugFR
         QERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775614; x=1793380414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0RaoJf1quXYWRkDgnF0+UKFcSUDOACQJ5dkLWQMqNDo=;
        b=kk6T2ekdlEd8mfYAebwXmIxZ9eNIcyylZuueVehoRZzH6dVur7rgIvsZ0/wH1gXw9i
         Lm/kLu3mjZG1XepV35krvFCQK73Z14VGn3L4W/SLxXOhxRMYVL6AYLEcDGIGaVbbEH/S
         OnOCA2gE6gVH1YrLHo3l4CIZz7gVexLOwCqowH552CglbeI5khkAbW5bN0WC65wccPN0
         9dcwHy9PKGESw9etqaM+9lvUHu5gfIPz2RoY5g0qItH8X301t9QDi81ubFjFeV8A0ZQW
         uXfWEHz4Kw10kME5NHyhG5HVV1skSdAxWdCPlklsoAmLzS0vy4e0DHTyYUk1gRezchQi
         ERRw==
X-Forwarded-Encrypted: i=1; AKwUvBw4djnVuFgPPDUUBDgLnAgDiVdLQ6XinDhkPVPMUwsGiHp+fjmPJ/cS89bQADn6DRcEzZ2Gyrj4M68/GYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCCBxOLrPdrSchFNbKQDWI+aGU1gjMQTce1kSepc3O8i0iwC2u
	FXIUsxaBL82dUd0pdLpXDez0ROx5Q37O3UGng6pYEWY4Hmhga2ix3S9pLtALgulmMwODAwtXXWD
	qOh8AnWWXsFU0xr8Z4PXosw+hVhsOI+dgJoRIgVZJO5/UBqGkMky+S8ldRupMxluFjCU=
X-Gm-Gg: AYBFou3NubNtWSuSAk/xGRGOrx9HTBZ1xR8VT1kOM6HkgFRmLepIaL/CBidq/a3AjJq
	uCruz9wVLy9TtzsTxgkbe3a9GD+CNnDsG/XCkThiUyN/5ZnVizjLsECRVuysRaxbfB+yxAiVqnr
	9mItBOY1yZ5jQTIiD2lryzz/y5Y7tpYpJsk2+wUKAq7K7L8N08BjkPvG9MYj5erbR7VH3KgrJg9
	RFvQy+8/0GudPA+azV67GGvVhvt0nCVaghxEqPnLVposD2qsd73BZx4tNeI1JdTu5t+NJl9uVUw
	s570nmgQrT3A3VSlpp9t/E4uX53jMtwT2fPZl6tyMwTJMXoSxq1nnjNxl5rF67WSbF9lQKLiMd+
	KaGvO/yMbBeIh
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr963959485a.2.1792775614097;
        Fri, 23 Oct 2026 10:13:34 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr963954685a.2.1792775613589;
        Fri, 23 Oct 2026 10:13:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4104b5sm1043841f8f.36.2026.10.23.10.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:13:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 2/7] ASoC: codecs: wsa884x: Accept temperatures across the full trim range
Date: Fri, 23 Oct 2026 18:13:11 +0100
Message-ID: <20261023171316.819857-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb95bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KF22LIoASRNQ4hJq_1YA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX+YbFm6cvbBXs
 Xlju7Ijn+NeVtn0Mzaszh6Z4oXa9eNA2csVF8DZjWILaXqljGW6kSPZjGCK7lyvW5NmXDd1M8EE
 wXnV7c6fooHD++nhfyYlsQnZNLB6nw0=
X-Proofpoint-GUID: 4b15Y3hLoRGzw1IPa3Ew_GFH_VscocSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX51XHW7XqOlxY
 VIRdD34PfJxGkGZNdr5TuWeVLSm5Kz0P56m/VGz/SkmcmvSCPHJ7FDu/TXLdCTGuWmPcNpzK2R2
 rAhr+TP15aSJCWVu6fd+dmzE4wyNVeP2ZCWzohbKLXk8/QwXhpyiprsaOPSK0BnH8+FPDNYlZU9
 A4lCuK9bFvtXznOCgFCaYayCzNZg5pPLPytRGIpH2AzBzhOu3LP1I9c7l2okln0QKgULYFDlIfr
 gNWpE9FsGZgq4m9qryh/PS+wzCXOfyXazUvlNJ1TfmbXUVPBBFUgwLeCHGeQQKpuCXuyhY6u+C+
 lHEJ8+G7THGyjr82bEUSkklYR6YktpwBvUA7yWwIQkcNW1OkOy+wsmT61+oI+90UI3tI+9XeBn+
 yRM+n0G7jN+SFPuxzIdulrdMFtCm20oZdFFb7l6LnGiFlFb+SFEfrjwrg4AtxiQPfKZloKwAA0t
 tyWbsr3WEeT4QQpwHlA==
X-Proofpoint-ORIG-GUID: 4b15Y3hLoRGzw1IPa3Ew_GFH_VscocSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

wsa884x_get_temp() rejects any reading outside 5..45 degC with -EAGAIN.
A speaker that has been playing, or sits in a warm laptop, easily runs
above 45 degC, so its temperature becomes unreadable when it matters.

The check only needs to drop bogus conversions, such as the all-zero
reading before the PA is first enabled. Bound it by the -10..150 degC
two-point trim range instead.

Fixes: 6b99dc62d940 ("ASoC: codecs: wsa884x: Implement temperature reading and hwmon")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index a367c94bfb4d..f0857c0588d5 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -720,10 +720,11 @@
 
 /*
  * Device will report senseless data in many cases, so discard any measurements
- * outside of valid range.
+ * outside of the two-point trim range. Do not narrow this to ambient: a
+ * speaker that has been playing easily runs well above 45 degC.
  */
-#define WSA884X_LOW_TEMP_THRESHOLD	5
-#define WSA884X_HIGH_TEMP_THRESHOLD	45
+#define WSA884X_LOW_TEMP_THRESHOLD	WSA884X_T1_TEMP
+#define WSA884X_HIGH_TEMP_THRESHOLD	WSA884X_T2_TEMP
 
 struct wsa884x_priv {
 	struct regmap *regmap;
@@ -1929,8 +1930,8 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	dev_dbg(wsa884x->dev, "Measured temp %ld (dmeas=%d, d1=%d, d2=%d)\n",
 		val, dmeas, d1, d2);
 
-	if ((val > WSA884X_LOW_TEMP_THRESHOLD) &&
-	    (val < WSA884X_HIGH_TEMP_THRESHOLD)) {
+	if (val >= WSA884X_LOW_TEMP_THRESHOLD &&
+	    val <= WSA884X_HIGH_TEMP_THRESHOLD) {
 		wsa884x->temperature = val;
 		*temp = val * 1000;
 		ret = 0;
-- 
2.47.3

