Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465545C704
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434885; cv=none; b=XNv7bAC+eYzkd4uSW1+loHPJb/hDCWaWhw9tFyuw1CWa7LSrXR5CgH4G42wXbUn61P0VptDKkmODpdPnDz+w6rTp98R4XmLd45LZjj2+w3JiOs2mM7jh2NpMxnJj2TPGKTzHo9sdhpLed67k2H/xGKh+yckfi0wgVgQ3zv1VHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434885; c=relaxed/simple;
	bh=Z45IKqKNmKHMoDxnTs1W9/1hhzkoL1sjpuMqPRPU54U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTSOdHM+U9xAKRNHQ/Zr1DAIVQbRusioPERnA5Z9Z3szE+PnixTtStdK/cmWMdpl7YprwKXYKzEZdPe+QB+ZD6H6CXRiE1CL8Gyv+x/GSk7EjDsyrFBrRz3nznC++r8PATKpwBoy4PLb6qEtywzLg5YvGyPQ2VfOVgsPUF/N7iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5tsVqlu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYcXrcZj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5tsVqlu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYcXrcZj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBPY3782257
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=; b=n5tsVqlu08K2ECY9
	mJjVCzKlbOrlYE8NezbdYjdU9cm3Vxro63CbYswlKBQwE+PM0mYnHKEkC2H5pcNz
	EkRveaEDet+OB3UOjT6DVvTQjp8tlJQBIBtvnGF+L0f05s6gBAciXoaQTRrDJ1oD
	ArllJBbAuq0LqQHyCXvE0vA/Cy0r2xbNwNAr0vSZ9zmC//VLQq7nJ9XqO7/Eh/Mr
	+M13hDqvW765GgZY0/Y/DL+LgvXaaP0Y96GTxpbktxnAYck7jz3PNeL6JahLg/fI
	+AXapsbMbfZZ2dL1v6u31aVZV+EOnbPeHwZA+hNew0JxzNisjqZTc4w1nt+U3aU8
	9FA0fw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdrn21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:27:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so57715885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434878; x=1789039678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=;
        b=NYcXrcZjcGcj6bfh6QdG3kGG+4bHN6uAb5PB4u+lyEyg5cQb78gHIU2QlcrYZTw+T/
         QwN/8YfAZu+93dj9cjLagXroLBxoaDAq/QI4S7RUwj9hGBQ/7sWutyq/QnQAWLb1QaSR
         XV8cjZNZMk9H+FNlDDAbHwOBbiXZuOl5FBvdlozMIN2nolDP3Cn6clqIhZmWj5/ICICR
         b52SIXKbsOZvicv5k1abP3Ldru2CRo0qPbbKT89yvToYpct3CRuXdfmt7u2OTE7sT44t
         5Fni6pfw7q4WCcIWJiqDRw+OZ5jI0/2SnG5/mO6cVi56FyROkRXS9qbubp984apJlTJ3
         tdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434878; x=1789039678;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZoiINMgbp5hKUHJne2KrubQpmenpvQCezic7fpoj7E=;
        b=lw09hs8R8ut7ohKKKCMS4Qk5PKtc0cpd9BYbiojtj1oa7jY7z+339eWY9eYsc3gnj8
         jKBGGdKkyoeIQLsxwmZL/BYWR21AHnPPC1sc8GRHXEy+WugoIG3ySZhq6PmlCngT1BqM
         ZvK+nhI0y80/A4A6YvptLbjjewfNH6vKU8IHQYzeXco17j10KFVa+Y5RMQB8/DDSrDU1
         C9Z2xyXtQYQSl+a4GW5pndLzy8uDqbjcvnvpxsFNVg3vw78R6KobWotv9zV1fynSqUH8
         93UBq9m6ftIwr+ZNEqX1YGetmMFEVBp5O1kdxeKyWVol5J2ZkhzkFqeN5FOZG3khVTd4
         1qcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZVyET3EZTGyI6W/FlwVS+wc4oFMQtapryXWP31ULiBQpn9kg3XNdTNH3DL+nJ19Qx5N8i9msB7+DdEgA=@vger.kernel.org
X-Gm-Message-State: AFuF++mf7xTc8Ov8Vc44+Ef1vDnoOfFjCZfYJqFcPegIVRDwQb2M0Je0
	mKsjIu5DBuxO23GDkcnWt6ugZWwPOdw4KFIYpZ5hMtS7pVY8jCAnSwW9mF1Ui6k4k8w+e9tE0+9
	8tPMR38HVv8ZFQ0k7S17XKwWG6FL9axvSKKdfAmXA4bH1ZffDGqJ3/UHlK1h0KSX5N1s=
X-Gm-Gg: AYBFou2kSIsC8ePJxD+RUuh1JVW+S3IfVIW5XxbMGS7/aj1IFkLto57QDVv8zc/dsXs
	d1cTxX4kmqGDXIPpgRO1Z0v2xKlT9icYmxswzKPmxT+vqMEvMkd/s5IM3M9cbtsUu5HCtLlGP/A
	yaMDPuJ5cNEo62BEdH9vZZm7cHJOBlV32Tdbv26eblzvQHs+sHy6FrPegx4Y3O9VQHhug6I3plw
	DMl0qF+31uFKzzR/WKqoyRmW5v3rszh1Geu+ALITagiQeGdJP6sFAwVwMRYYJqN4tUTKz1SlN/4
	LYZ+S05SuzmZEXgUY0QAQO4cBVOc7VWp8ur3spGcYPMNCy0n+mcpdt9BXQo7zpirFo5Zs8GHyp7
	6Fz5zr4RMnGT7cSXT+7xuaw==
X-Received: by 2002:a05:620a:270b:b0:939:4a24:4de4 with SMTP id af79cd13be357-9396107ce10mr867217585a.5.1788434878355;
        Thu, 03 Sep 2026 04:27:58 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:939:4a24:4de4 with SMTP id af79cd13be357-9396107ce10mr867212985a.5.1788434877711;
        Thu, 03 Sep 2026 04:27:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4244e45sm86239866b.60.2026.09.03.04.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:27:56 -0700 (PDT)
Message-ID: <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:27:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX15fiCyfLELx0
 EG6XIQk/qo65WK8B3P/pRKWUP2Gp69lkTo675hV5T97491r9MqzdTQ0WLjIOguDcDNND0AzfWzq
 UEp2DqEp2WrHnoDI4FA6ofQMrWmjQTs=
X-Proofpoint-ORIG-GUID: TuSmXQTWJDIUWTRc7raeindGqHijLU4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5OSBTYWx0ZWRfX2HaQT0Iu3fta
 p4UNJ4G73pidFKvkCPPRAKnALJupFhjSa/XD+8m2/RG/8q8M+kwh26sTFLzpK7NMZZNTXUd25Ps
 9nMRP7ST8PB4UvmOLnZ0atoOYCGRjaQpamtn06YOuwmtMhxlFZkOUcpyKTMiMxgrHXYCqLpufV3
 jDFAy8AgIoCZ8XwyfGvY5bXiHm3emgHvofcCuofKQXtk28OBQYBagVHlMP0oCJCqxdvE8DeQNHM
 Y7N5Z5W/KbdGJKzEzcC+NOX6kf6XB4c/T32VM1tYKhDqzxiAH3WGQkxDu6ME3dvYLf7rG1Fm148
 Q/64+NwK/T8GaRafbSK469dfKRu3oMxW3HiTfxQdf5ePDmuNBieqNOpEZCYtjjwn9Kmw1ml1PaR
 W9tkLwGrivP9HM7H8qE5jwEJ0RyTfE2oYY1GqMRsk0jCFhTb2eC+kulFObKArTZMjbVwiSNGsk9
 51t9GSxppDa6ikSV+IA==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9959bf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rCHStms5JtS70C2hfqUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TuSmXQTWJDIUWTRc7raeindGqHijLU4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030099

On 7/17/26 6:41 AM, Fenglin Wu wrote:
> Currently, when the LED is configured as a RGB LED or a multi-color
> LED device, the same pattern is programmed for all LED channels
> regardless of the sub-led intensities when triggered by HW pattern.
> It results that the LED device is always working in a white-balanced
> mode regardless of the intensity settings.
> 
> To fix this, scale the pattern data according to the sub-led intensity
> and program the HW pattern separately for each LPG channel.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

GPT came up with the following fixes/suggestions:

1] This one makes sense at a glance:

    leds: rgb: leds-qcom-lpg: Skip LUT allocation for off colors
    
    Multicolor hardware pattern setup programs a separate LUT range for every
    component. A component with zero calculated brightness is disabled before
    the pattern is applied, so its all-zero range is never used.
    
    Skip allocating it to preserve the shared LUT capacity.
    
    Fixes: 2882fa0dc1cf ("leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode")

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24b1f570f524..e32388a16537 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1219,6 +1219,13 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
                chan = led->channels[i];
                scale = mc->subled_info[i].brightness;
 
+               /* An off component neither needs nor uses a LUT range. */
+               if (!scale) {
+                       chan->pattern_lo_idx = 0;
+                       chan->pattern_hi_idx = 0;
+                       continue;
+               }
+
                for (j = 0; j < pattern.len; j++) {
                        scaled[j].brightness = DIV_ROUND_CLOSEST(
                                (u32)prep_data[j].brightness * scale, LED_FULL);


2] This one.. I'm not convinced..

    leds: rgb: leds-qcom-lpg: Reuse LUT patterns for equal colors
    
    Multicolor hardware patterns with equal nonzero component brightnesses
    produce identical LUT data. Reuse their LUT range instead of allocating
    and programming duplicate data.
    
    Free each shared range once when clearing a pattern or unwinding a failed
    allocation.

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index e32388a16537..1c4d550c1ed0 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1175,6 +1175,34 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 	return 0;
 }
 
+static void lpg_pattern_free(struct lpg_led *led, unsigned int count)
+{
+	struct lpg_channel *chan;
+	unsigned int i, j;
+
+	for (i = 0; i < count; i++) {
+		chan = led->channels[i];
+		if (chan->pattern_lo_idx == chan->pattern_hi_idx)
+			continue;
+
+		for (j = 0; j < i; j++) {
+			if (chan->pattern_lo_idx == led->channels[j]->pattern_lo_idx &&
+			    chan->pattern_hi_idx == led->channels[j]->pattern_hi_idx)
+				break;
+		}
+
+		if (j == i)
+			lpg_lut_free(chan->lpg, chan->pattern_lo_idx,
+				     chan->pattern_hi_idx);
+	}
+
+	for (i = 0; i < count; i++) {
+		chan = led->channels[i];
+		chan->pattern_lo_idx = 0;
+		chan->pattern_hi_idx = 0;
+	}
+}
+
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
@@ -1226,6 +1254,17 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			continue;
 		}
 
+		for (j = 0; j < i; j++) {
+			if (scale == mc->subled_info[j].brightness) {
+				chan->pattern_lo_idx = led->channels[j]->pattern_lo_idx;
+				chan->pattern_hi_idx = led->channels[j]->pattern_hi_idx;
+				break;
+			}
+		}
+
+		if (j != i)
+			continue;
+
 		for (j = 0; j < pattern.len; j++) {
 			scaled[j].brightness = DIV_ROUND_CLOSEST(
 				(u32)prep_data[j].brightness * scale, LED_FULL);
@@ -1238,14 +1277,7 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
 			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
 
 		if (ret < 0) {
-			/* Free LUT slots already allocated for previous channels */
-			while (i-- > 0) {
-				chan = led->channels[i];
-				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-				chan->pattern_lo_idx = 0;
-				chan->pattern_hi_idx = 0;
-			}
-
+			lpg_pattern_free(led, i);
 			return ret;
 		}
 
@@ -1271,13 +1303,12 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
+	lpg_pattern_free(led, led->num_channels);
+
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
-		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
-		chan->pattern_lo_idx = 0;
-		chan->pattern_hi_idx = 0;
 	}
 
 	mutex_unlock(&lpg->lock);
