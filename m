Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800957;
	b=iIyh4LdDpRCDcDEKSYQ8gAqhzVoc0l8gIj3xhNt6jFBcA1AcLXPEPYfK30fIillD7KMX
	 Jc/EJIWsnhZarR+cpGxhsyaY2yhvOZQD4jQZS0CROZZ0nMVLK4beUox7ZMWSyYO+PAb8Y
	 GkVf5KF5GVP+bknzuidQsuILPUSJGWgWXzE+4DJhAiI0QQ+F6j2OmYk4phmCwXtyl2ceU
	 3tir+e/rA+I0ZRx+arY9MRXJhfzvHVCScR+nna5JSJcLEYDNqYiL+fmPHWM1gU/JSj0wt
	 iQ1htFD27Xp1Lcu6jHUcPsqldy0GlJvzASozXnd8w6plLCFlCA04tBOhd9Yl73lRurg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rbg/EhXUWMGD0MjgA+iY2A/4qDiv5VEoEsvbMhBTkFo=;
	b=xHk1I+JI2biEmAZsvHVjCNCHBohfzERoqWKq2Bbww5Yu75kOzLdV1pjMQGJbNaD1ZSkJ
	 dx99YjHsOPDcUw7bf4yjtSNRFKbb2PnUYuYaOovQD1jnUWft67Q325z0Ae/zj8cMQXuGc
	 PLerhAeWuNt5DZmInRS3i+rOFX+u3dlTav9zihhHHxY3RsIfpI5frxRaeKjJvIIbot3Gj
	 unJx26jhicP/JrYThGsOJxGpS6NKB7sDi4i2J7sRDUiEwFlDdI+lmDEG7VOlwIU+i16sg
	 oZcwz2NUghOW8+swYRLQ4ceVJtyNyeru8DHHldJbNg53wot8G/5kmuSP6/zatmGXX+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gLrE4lHE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DAOQQGvC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E7606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467E7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gLrE4lHE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DAOQQGvC
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L32t074019
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbg/EhXUWMGD0MjgA+iY2A/4qDiv5VEoEsvbMhBTkFo=; b=gLrE4lHEFPQuTnyy
	HY6XuOE45FCNf2/hCzvME7DXViglsM/+LS+LNvH6zPowawuyuiYYcl9fpCv96ear
	XObzLAtemkr0v7nU4HdauY1KLWshg6w2/s/brhcnB4eVfhmhpgl6680zsqIlU5td
	ckqL0NB8c69+RcnW7kGgfGW4jrP5vWKzw/dWp1UUuDsz3dxRYh1x0xvY2jZ8XExN
	kQ7dCfFsf+NW3AJliE+J3u40aXync1b5BES9KTuUMyKiVehbEeCtmIxhMfko8ii8
	uMktf4GkPOfNdksaL8EZhTVYwQ+EhgfJ/NDLSQ3m2ydVvj4YE7uJ1Yhn4wjcV8vL
	o8oLQA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjvnhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:49:11 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7de733fa9so3739980b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794800951; x=1795405751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbg/EhXUWMGD0MjgA+iY2A/4qDiv5VEoEsvbMhBTkFo=;
        b=DAOQQGvChSppmeimCdVT/mz/viLCcQS57A3Fl7wyHi3TetFkIbWkjW5ufbvfMbd2zc
         U40f+GKWSKigcZ1n54ET7TI7heRWP4V3evf/mjTW/baUyXl42KoGQ3eGPzNg76uxx3xK
         mZ4lagbNhCLCFxhf3s5LxYjC4aQFseV3nvCRuecgT4IDu1zkmTBhSKXczBFH7UpeQpqC
         eK3M/C4Yj2wV90EEeQ0EdeF4QXaC8sl5IVVrCSNpKH2UFA46hz0er5uRtwIP/s0Bq2xK
         AasOvDotAN6NCtD+9p6EausREX0lHFDlFHT5niGU3CEEIPmIQYzFgezjxWuFHUX+OhfP
         uLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800951; x=1795405751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbg/EhXUWMGD0MjgA+iY2A/4qDiv5VEoEsvbMhBTkFo=;
        b=WbE0XCYiGvk614lAUOJ0R+4VKx3rLgJ/pF8JB5ctV9p8dtsCHm4mkcSE+PLonlowKT
         KiMW1b4cKjyVVSHGx8nVrsRarQS9YMCw3a36rcZzLC3FTsV+4gOYMqQGyE7Cwfmjrrp9
         exeWayrUWDYreVyVwbudw57fBDDqxAnbzGr/QrZwot7f79Js5Oumo+AgMF2EEcJ7rcjG
         esHk/jqy1r+y31ih8s/uoCPz0nej9AT/b5zK5J/7Bvn2FGm0Xn3bkWxYPzQJDrx/oM/f
         1iwdcqY3PkuiAxg79tcR78klsJidd7arEMqsVKGCBR07xjLozo0qVf+bL2Pgo+aOxSO4
         k6Mg==
X-Forwarded-Encrypted: i=1; AL+hErHX8sMBhBk2JKoyRxSB/OCjflss3VWB4r3YI8FjW+6v0fkqI8i10gk0ujQtltYtTuhx+UfHahBKoGA9+mI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xcz2zoH/c09s+uDpLqw5653agmkGjaQQxnzNT+UWH2uclIFNf
	bW2nnViLe6I2ia8RLY38QHvB79W4iWayKJVxoTLZ4IqVJjhDmKqyHz3j1FOv3iYjG6zM0/MYMAS
	m5nRHxGws0tCjFVbPoa81A7ISA69Bf9PsH2ay6JU4wMFOT8be9MQ3tJ13qaVdMUp2J3s=
X-Gm-Gg: AYBFou2FUQdy0m4QCjZCkPvZvwRp6qiFxuyXo5+2EBN+9HZvgoy7z0QtOUlRVhMx8vm
	cgeOwsiINK36rA9eRj+BpL7lM0ocdCVuWQ8P38Y2iwbJrc6xhT4tFkp+lW3MZTRsa6Q0nRuW0g7
	ZatnMG4vIvpfjrUPI5WDD6VNKbImFuC6SP5NpZKFcqi3GK6bzLcRnDMHwf5MGpVJfT9Dc8kBh+U
	AjQO8n7W9KltzbkW0ls9W808JcdZsWUTrjc9JnstGZpL/GFVsNw9pBPPwrhXKyCkzpy0MU1S540
	KKgHkGGLgpa3bzeIxw0omwFM42ma1gBr1UtxeKK1kvlis4W4a7y9HswG8uUnMihPQ+g2Xmrz3Wa
	9ZGWOdZzziIPb2W+iYXuoW2YbEXjM9TP4VUXEydzJ93I5dgtW5ngJF6meScCw0ZqOcgA=
X-Received: by 2002:a05:6808:1782:b0:568:e61:dd02 with SMTP id 5614622812f47-56e645d5bbcmr9600329b6e.43.1794800950638;
        Sun, 15 Nov 2026 19:49:10 -0800 (PST)
X-Received: by 2002:a05:6808:1782:b0:568:e61:dd02 with SMTP id 5614622812f47-56e645d5bbcmr9600310b6e.43.1794800950255;
        Sun, 15 Nov 2026 19:49:10 -0800 (PST)
Received: from [172.17.0.1] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7024673csm8903234b6e.8.2026.11.15.19.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:49:09 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:49:01 -0600
Subject: [PATCH v2 3/3] firmware: qcom: Allow QSEECOM on ASUS Ascent QN10
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
Message-Id: <20261115-qn10-v2-3-19b11603e776@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
In-Reply-To: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=930;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD7RN39AiqmPzWM9d2IKsg92WDZlgjc/n+PPB3RMaNI=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBq+n0xuqSheZlUBlTOgMxGZv+x2tTIsdOoRmSxH
 VeF8VegwnmJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCavp9MRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXzaRAAhYxzusOCt0O/iwcebQHLdUWoczYn6Fumkr+A/m5
 1sQnPPCbT6QFpmppnzTVCAp/Te5uo8DFyDgcasj5tze+ca2O9zFaGBYqC2Ge6BM2cJtREjeq7Lf
 n1AoJtZnRF1BNFRfoAOPlsGpX+Khg2SMM6EaaSTb5XaE4lubpDcfHOEdvORvNi9J25P3PLOMEHc
 9Q8JJqzSLFs4STMHVSMCRv6CX9vgju0MGV7oxhzt/buAPrV6aUFe6zOPgzmbQg+mnJo1u515x8n
 hQYXmJdriy6JzMRaXTvBzlGCrCM2V9hV1c1/Bt6Vl8ungPKAQxPXQHiyIar1LG4AHqKZiSyzNsH
 ad1yl1A60RK2vFP2j6ox3FlPH0p3mX72NJgHR8Sv8rkeproJJvlF9k8vpKTcCJEvX1yCn2HAuVj
 yteTupb5txtHG9ZoxAYNHp4hdMlEI0TCv1bjief2DMWv5U2ma+bkQtsM3fBxbQ4ZACceNvK4tsf
 8nhxgyEghvGe5WB3wVGpqQKb/7Yw4R/2ehd1542ZINyq3C0SmYFoiVchCzfJ5BAms15OMCWLIq3
 pdN/n6fIp1f923D6YgZsitn7drfW++9hUDznJwFtMxDWUdNU86yoX1lGWu+ygUW/0SwyCV0V82i
 owFqE0SzkoxGIh9ZzxpmRsoEm+SY7fEshAMGaPZ8t4jw=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX10K2dfu/dfuJ
 PXtHDTitexI6sM7YYS+qpJSUz9TQX8TGvmVWk3yEHuic05ooH/Qc82GsFAKrEcB30OcC/un/QBL
 YUoMn+ahSjnQlY18qUxCfs19Q72vcuY1ns3JRqt9lcCQgxNLTZaUGb2OGqpPVUGaXXRvLrpSPyJ
 tnsdLCcizvyBFG/2eShhUpZv4zet5tS9jP0SGCTGJg+m/c5LlVElU1PvFXLGqbiEZL3iEQlnqat
 hDqz68c92/oHZ70q+250YTXe4k8ZKAHo2pQ5N0nCiWQLq61vBFebDVXvTEfrfUphZAFqqVaRjHX
 dwU/NLVkcnjOXsnvNPsM4MPD4pu7BBAlBWpXRVAzNHy6/legnGHLVFGWKGTqy8/tRFVgLBubd/P
 PaeOQOx8zvCfs0wR11W6xa2jETBK/vM2gqtzmV/CCm8Xx1VCUKLExGVwI3bIpgINnr4Dh52vn0b
 YdUn4qGBIoR6kZpfIYw==
X-Proofpoint-ORIG-GUID: KF-Daa_ZQmB29Q3r0xSRE9ntX4OV3cBK
X-Proofpoint-GUID: KF-Daa_ZQmB29Q3r0xSRE9ntX4OV3cBK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxNCBTYWx0ZWRfX7CuElVaI3I1u
 lPk+ZL5DOcYZ/OdLFb16FqPAlZEZO16S1zq0I1AkgEXOlAkxksxbn+xurGKQ1gIEdzjTYt6uyFs
 d4/SE+DuxQSra6vfDG78p53eSCxGCOE=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afa7d37 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PMzojMwlkinoLF_R2aEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160014

The ASUS Ascent QN10 provides functional uefisecapp over qseecom for EFI
variable access. Add the board to the allowlist.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 030e4ba90812..fa94eaa020c3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2226,6 +2226,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "acer,swift-go-sfa14-11" },
+	{ .compatible = "asus,ascent-qn10" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },

-- 
2.55.0

