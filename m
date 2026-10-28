Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193851;
	b=5ctx90hvno3rMjw91Yojmuupng+CwvUQBWfBKYcwTDZaaHYW4NexEMa2tmXabvxjaRLw
	 W4s2kbTFzRhaK3ZDz8NN3lBAFfJunoXJno1FgcqOSf7PAWZUeeoirgnccNxtJh8WFclM4
	 6ZyZ1k/SzNUKoDw6g+UJJFAF9QZsZODW6yKpQ6zsg4BesIFtMY1p0W5Q0BtB0FhPop+R5
	 KZIf3PRL7ebhsEa5DKGYD0+lpuTBFYaVO1bWkFJ/clWz3IDeAqV9A1KaZs52qGedaltJr
	 98ieHJozoCFFGo/PomY1R9VFy0xFkec4aryXZMy1ho6xEgwiLegvY/KKQY8gP832+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
	b=BRr+xzSpai+K+dJvvDGl6z9pALZdCn61NGvKSq0eyybuMdxgspSPuj/lkZe7kFZxqCwG
	 E55yiE9nMmBvz8ramwEF3DbwYBRUDMBEUSlpoWBZnYiybiuktJ1Lyn89POYJ5+ua9CCtD
	 D4pueTB6pBZRM65VlE+14PazJh1v74wUgUcxL8nFvYnX8Ik+tfcpjvGPUccCdaPSI4MnR
	 h8HQ1YXaQFXdaNNxlpE+4r4G4Qy5/Q16fwfhsqjVQz0Byac2ElXIWB4YsN9ePwBdkWbpw
	 aTpOpC1R4pfaKP0lNQ/5dIWqk3XIUsy6k6brgJCTeG6ngPjeYC8PS5weZmWB0H8mHCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bl9Ki85w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PADIeGMe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18399606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18399606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bl9Ki85w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PADIeGMe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAJP1606935
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wv4VOK5tSeL
	NeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=; b=Bl9Ki85wq+18hA6dQKzat3tfbjd
	wsW7kzy63YzuzG5Ca0Nhlz23lHi/asQaa2PPgertmjHGHZePReHzNljvI9U2KTdj
	3FQKVbC7i9Jx4oRKw5N6Czltwh6JUWMybl3fYGrBoMALHnRrhInKq6Fd0IjwtaPt
	HQ/ZwHhDW3Rc6BsTpgluwCAWeEG0trxgW6ShxGxG2MsTSQ8cABxXCM53sRsCkimo
	j8bBceIX8J3wuCO+tLQFhvii0/2m3vE4ixg8RdnuqibGwAP8uxevJZRLT1HRVXtY
	SnTK9HGL9Z/Gf0ekDdgz56DCkSxBmJy6AQ8j8t1f2SyVXOCIKceYjofHhQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jbnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so137635985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193849; x=1793798649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
        b=PADIeGMeg6GQrnj5Igi6ul/xb2U0MFcAUkwgrnDd/jw/UUcfMxp1Jj8gJPKthItIpk
         GyteDNSw9IHPP2ZBAJo76V/m4vO3Yb9aipJhv/yEy07HyK6Zy/PpgV+e3g+DLxoTV/XH
         3KBOWkq28W7c5pYMl+cQ27iJwgsAKP4LwmB95PAm8Ktms44IKZG0gCedR79OA8d+K5X0
         vmzOWnQUFShHsy/vaHvimDpoJPb/8N6fb4DfGj8TdChm9lrOglsPTF74T4ua8uh/bvgi
         XrAbQo7L6y9ToD63SKMjBJuPRFuPmNKRoOqALmTg4iSccapdsCQo7fKUAHtjdVHs4mpD
         pICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193849; x=1793798649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wv4VOK5tSeLNeBGONP5wrvvrJlbhMS56L/2JZ3kV7Hk=;
        b=wHhh89tAVFEBPSyz25vaTa4k9JtPzVND8NjXMtoioUw/sFGkwwQjxJ8bpQCmeg3YaP
         2/sfpAqvTb45z5EhLkRDHAFmZQLLpUsc1qRiXPUbUpgmIzOtP6/B1lgenTD6KnN+FAmW
         oh2vip2NAnhHdYYIBi3ow8rrnMCkdoX7PShPeR+ddJu0XHBwKTHJDfCLZhTSTC3JsE+v
         nh9aC8D/rpHUBHmm1uwnOx6sTj8KzXppwqzFX38Z5G8r24kF8eGDbEmVcaLLDg0wr5mW
         bEy8ynhKWKt7q5K9C/TWbOkWnrG7+YLydNDtn1A93DpCifP19DW9jjmF3tvepBvP4qPd
         BSKg==
X-Forwarded-Encrypted: i=1; AKwUvBzAvUEQA93lgpztboO/vltUXO7EgoAQzO/ZOJgSz+9jatLZA+S88ZKKzZXprKbkxQ4aC58hX2sZD0zBqYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKw97PdAWpnBslApUeEVmBn8jGXhKcE8389fsECVdZ+odTqEaV8
	fjtswTqY5d8jE4cVo+PUaWSfPropif+8QH9Z26WIZC47EoNUSotp0h3PxKyD8WTgjMMgBYnv4eR
	pyOfRx2QPcWsFugmaZI5dPfvqP5WNWZAF7HqO91T1EnqVJdUJ4fbDKoLABfSNDWzgpQo=
X-Gm-Gg: AYBFou3BYsshaw1eyKDNps/p/DAXZAe897f6HHv/b18a+16ih44dA7Y28bE8JcSF5Qr
	LyYX9s4/QPv+UUqAh2rf+/c7ME8pQYvidu0NZgy5rnRLDaE2l0R0sSW/U8BwL77T3MBdclnk88A
	GsHSFT6fDXvnEVfxCGX0fv6cBoAqpUnihHELiqH2VPbd3Od1YCIzETsqHvbW0wGaFWbZyyi9mU/
	7QnYYzYqetsU8nTL/j882/o/73Dfw6J/9t6B6AMQ1Jdq3/3JLSkxoD4PYGWAUPTGaMydsRmWTpn
	9x1fITyPYEvkWDFssDbXrGkjkqXuISi29xI+9l93tgBY1hjGl6UDBc/avZqDCHnkfeu6Jz5QZhC
	P4P0xVZMDxYgQFx36rXQRirwIqjff9AJn7XEW8IHKHNIhccOJTHJLzy+oa6IGvrOrirnXPBsuuA
	==
X-Received: by 2002:a05:620a:4546:b0:93e:71b8:584b with SMTP id af79cd13be357-94408a5cc06mr316384685a.34.1793193849180;
        Wed, 28 Oct 2026 06:24:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:93e:71b8:584b with SMTP id af79cd13be357-94408a5cc06mr316378985a.34.1793193848519;
        Wed, 28 Oct 2026 06:24:08 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:07 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] media: qcom: camss: factor out the VFE minimum clock rate
Date: Wed, 28 Oct 2026 15:23:58 +0200
Message-Id: <20261028132403.3505037-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX3T3hcFQxMi4c
 7JcZl9tbfYtHpnYMcVN2D6/w8KJlwmZqecaWZEI6SrjqGDypFsS8MK0gvYoZhVm201iOYBXVcEk
 bZLeD6LgSX4Dup9hrgiRQhU/ndLq1qw=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1f779 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=ezZDx3Tf6p_-T66H79UA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: N0AOR-b3zO2fzlxn6hA_q7hkMJBUmlC0
X-Proofpoint-ORIG-GUID: N0AOR-b3zO2fzlxn6hA_q7hkMJBUmlC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX3M8adHRXs5c1
 bufMY1/HxX5Iyv5ayiv8oN5TRzdexTCGfhgymqO+BQrl6X6aHePYlWLETw93/WMKg+CXpCJb9dg
 r86VvZEycNZ9cUmqum/c1uRxuHyd8yiMncfxZXiT5U2kse9xYPdYFU6CKqABQThJEV9r0bOJ4/t
 orTJH1/BUV+Zcd7jOR7DskW+ubyn7t4Psqdv4xQtYwUUZIdQFQOa7h79eBlqWqYbeeSSFF3qy/5
 ocFMqE15UWNZXbLsGn7N2edsN/43IuPkn9RpSrmXtu+1wkrMfhdR1E2zcpcdu0EKoa3llrZbV6Y
 0mvC62JqRNsGB+XaUbJUIXjTQ0JvwJnB4QEVIE2T/4sOKZoQI+soNN/n8ytSW0PMMbApb1rZOba
 vuUHjhyDdE/IfqaTofPcOU9sQ4aFWON2EKn34Ft8SooVAIXlU+KzWtmaC6d65DKAFgSoyUxy9uT
 reeToD79cnwPbomc0bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
minimum clock rate needed by the VFE lines from their pixel rates,
inside the loop over the VFE clocks. The result is the same for every
clock.

Move the computation into vfe_get_min_clock_rate() and call it once
per VFE, so that the clock loops only select and check rates. No
functional change.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 108 ++++++++----------
 1 file changed, 46 insertions(+), 62 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..59be37f83df3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -935,52 +935,66 @@ static bool vfe_check_clock_levels(struct camss_clock *clock)
 }
 
 /*
- * vfe_set_clock_rates - Calculate and set clock rates on VFE module
+ * vfe_get_min_clock_rate - Get the minimum VFE clock rate for its lines
  * @vfe: VFE device
  *
- * Return 0 on success or a negative error code otherwise
+ * Return the highest rate needed by the VFE lines for their pixel rates,
+ * including the clock margin, or 0 if no pixel rate is available
  */
-static int vfe_set_clock_rates(struct vfe_device *vfe)
+static u64 vfe_get_min_clock_rate(struct vfe_device *vfe)
 {
-	struct device *dev = vfe->camss->dev;
 	u64 pixel_clock[VFE_LINE_NUM_MAX];
-	int i, j;
-	int ret;
+	u64 min_rate = 0;
+	int i;
 
 	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
-		ret = camss_get_pixel_clock(&vfe->line[i].subdev.entity,
-					    &pixel_clock[i]);
-		if (ret)
+		if (camss_get_pixel_clock(&vfe->line[i].subdev.entity,
+					  &pixel_clock[i]))
 			pixel_clock[i] = 0;
 	}
 
-	for (i = 0; i < vfe->nclocks; i++) {
-		struct camss_clock *clock = &vfe->clock[i];
+	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
+		u32 tmp;
+		u8 bpp;
 
-		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
-			u64 min_rate = 0;
-			long rate;
+		if (i == VFE_LINE_PIX) {
+			tmp = pixel_clock[i];
+		} else {
+			struct vfe_line *l = &vfe->line[i];
 
-			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
-				u32 tmp;
-				u8 bpp;
+			bpp = camss_format_get_bpp(l->formats,
+						   l->nformats,
+						   l->fmt[MSM_VFE_PAD_SINK].code);
+			tmp = pixel_clock[i] * bpp / 64;
+		}
 
-				if (j == VFE_LINE_PIX) {
-					tmp = pixel_clock[j];
-				} else {
-					struct vfe_line *l = &vfe->line[j];
+		if (min_rate < tmp)
+			min_rate = tmp;
+	}
 
-					bpp = camss_format_get_bpp(l->formats,
-								   l->nformats,
-								   l->fmt[MSM_VFE_PAD_SINK].code);
-					tmp = pixel_clock[j] * bpp / 64;
-				}
+	camss_add_clock_margin(&min_rate);
 
-				if (min_rate < tmp)
-					min_rate = tmp;
-			}
+	return min_rate;
+}
 
-			camss_add_clock_margin(&min_rate);
+/*
+ * vfe_set_clock_rates - Calculate and set clock rates on VFE module
+ * @vfe: VFE device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_set_clock_rates(struct vfe_device *vfe)
+{
+	struct device *dev = vfe->camss->dev;
+	u64 min_rate = vfe_get_min_clock_rate(vfe);
+	int i, j;
+	int ret;
+
+	for (i = 0; i < vfe->nclocks; i++) {
+		struct camss_clock *clock = &vfe->clock[i];
+
+		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
+			long rate;
 
 			for (j = 0; j < clock->nfreqs; j++)
 				if (min_rate < clock->freq[j])
@@ -1024,45 +1038,15 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
  */
 static int vfe_check_clock_rates(struct vfe_device *vfe)
 {
-	u64 pixel_clock[VFE_LINE_NUM_MAX];
-	int i, j;
-	int ret;
-
-	for (i = VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
-		ret = camss_get_pixel_clock(&vfe->line[i].subdev.entity,
-					    &pixel_clock[i]);
-		if (ret)
-			pixel_clock[i] = 0;
-	}
+	u64 min_rate = vfe_get_min_clock_rate(vfe);
+	int i;
 
 	for (i = 0; i < vfe->nclocks; i++) {
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
-			u64 min_rate = 0;
 			unsigned long rate;
 
-			for (j = VFE_LINE_RDI0; j < vfe->res->line_num; j++) {
-				u32 tmp;
-				u8 bpp;
-
-				if (j == VFE_LINE_PIX) {
-					tmp = pixel_clock[j];
-				} else {
-					struct vfe_line *l = &vfe->line[j];
-
-					bpp = camss_format_get_bpp(l->formats,
-								   l->nformats,
-								   l->fmt[MSM_VFE_PAD_SINK].code);
-					tmp = pixel_clock[j] * bpp / 64;
-				}
-
-				if (min_rate < tmp)
-					min_rate = tmp;
-			}
-
-			camss_add_clock_margin(&min_rate);
-
 			rate = clk_get_rate(clock->clk);
 			if (rate < min_rate)
 				return -EBUSY;
-- 
2.34.1

