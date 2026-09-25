Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72F6453A3B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322721; cv=none; b=oFwjF0ta4kaMDQN3WXR+JFVnvYQyvGFKhPNcUT2fOjx/VGBs1saXyV5x/MdWHDEQkYUnzNgz5P3LJ/VuwY0+jYgQjju4kXeAIizggBpLzJ5M3tmAggrNczvrSwtNWcMih2UtJCjdc2cQTOY7UDLBzh6RJ7+/4XrAl6LJ3d2AB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322721; c=relaxed/simple;
	bh=0auXRGi7BMPtaQirmtNCnRrzSqkes1ZuX2yTNpvvx1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oDuqEU+nhpi2wStDKQK8wOE1LtKWNcqIa4U0GMHbyPEcrIH9jejJ6OQy+nSgQgjWV0aeiCtyVVJXXzcgkJbBhEB2VNGPIyD54psoILWLthdGqYCx6uFpbpEUVrYQZvhW5uis3us9NHAIv6tp0Qu/OmAAUEV4IcpzIuEEEoT2qfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlzI11XQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+tjPIcb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlzI11XQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+tjPIcb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J5Xi756811
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jjQ+Wd3BPLE4CT4u7BQxTB
	OzgDPlmy4zTCF9SWKHlA0=; b=hlzI11XQkkrlogl8W9KfpSealGn3H7Ya97ev37
	Uvpnqpm9DxzyGiZUD//py/m8Cey2y0WhksoWA1i8F2c+A6wyTxnrysQ6ePQ29DWa
	S/VY6FcGpF5lJGAwhlFTeND0wzOmogRzwwHmv7RTp2WGcbKHBfZ72ZExqNuvBHub
	lTixoTHk1bwwFvh2TxEq8569krrb15XIuruqeKe+H3STOtA+YhkRLO7y7oLjidOX
	fCjmSaJ/ed/6Kj60i2C86lSCdagwlqQUjEwplkcJjEB0/nPsCXlWIjphg6tWyiqr
	X7yTCb3W8dap2Dw3gD0vSwZDDk5bP20KzfqE1So2mDsFVadw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq08e97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:51:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fc0097865so17677701cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322718; x=1790927518; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jjQ+Wd3BPLE4CT4u7BQxTBOzgDPlmy4zTCF9SWKHlA0=;
        b=A+tjPIcb6TyT0ErG+JApfb5EXAbrA1bGFifh6mi0m0GXAzrm4OtLZRLIoL+ihaw3cz
         G7LnrDD75eN5YLKy1fLH1AQbrN4btBdWk5w2NP9uy/deKLm42eQh0SFqXBZApyjL3G5I
         KmyjbN81R0FHxnMhp/IWMX90tlVpBp/HXbH7zx8HasFpGCNv7chfo4fDFxcVePn0ik5T
         C8Xi8msRMEgxLX2dzPKnehn6wJCXyzzDFDLirK93RW79UZfzyVYHLqmMxMlcTiH1dahn
         x9b5Y8Sr/738HS9gLwfUqBpjw34qP4pd2177qEH7mrxOV3ez9tqTbeAx7wYb6IR5ecrE
         5Phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322718; x=1790927518;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jjQ+Wd3BPLE4CT4u7BQxTBOzgDPlmy4zTCF9SWKHlA0=;
        b=xXWNj4KVG/BDLa4Cj73UuDXFTifRw8+VcgyiqOS05KlVNa2zc+0xGzi3mh2Tp1Egfk
         b1jjJaus+YB8OR5s0K52uLdtBwckxijTJsTdn2AnGqTRbdJ+TglwqdA++TBsT8e9Q7yQ
         j+CZcgB1xrdxXhlCtkgpllTMNzHmfFvL1JrA0CYLKXKGDvdeP2ExfpzlvTgpi75eEoHP
         lEAeINE9PKl8nvQ+gO8lF2G8J4UsklE9Z5fFoJE25RrYVPyhcQYpcjxpBkeqFv8j9Cm1
         VYGMS8qCHgcIk72eBLkGE8rh6lHCseCKJgnt45JQSE1tk3hKQw8+Zn09VrgsXLauO99w
         7c2w==
X-Gm-Message-State: AFuF++lSo94NIDaIl/Kxkklyf+6fysgNO3LpkKEwMsadKJE9gxjh6PVU
	fFH+1XG+Yc1OHaFJAcZmxkYMWao3sRSRY89jTsoHyHfcU+QU2OybfA6IFDBeBH1OzT5sLgpX2Ww
	Gy+cG7ROgw3Lsj+Lhtz9PPZXo6GWuKjYW/lISs55uJwIjMOvcESLuY4ijIrf8kLjgbDw=
X-Gm-Gg: AYBFou2jDTCd7DpLrlSQm/Czj95MezKmqwdWP883Z+EmDpcDCZfNQtAkKbACtxck1iv
	KD2WXAAcRGjkAsyYUJyzA1mkwuxjMSFw7OSGLPyixo0l/194i93pujur5jS7TFrI/e3W0bLNpqP
	pBdcWdcqEKu99JrbTy4V7lf7Y7Tn66x8wpxyE5SR5EmBBhmYhL4oqGxfwjL29flZXv9ZDjYYzI6
	+mL3MRnwZ6O11i07mgwpIvuv2Sq4E/hKvKyqEth4kl5uT7iZ95L966ruaMT0812oaqUqnSD7Qr4
	ZksZK8APyGAGbLxhNDU2eV6s9bXcA8mAOuTIkf4zO5BznQCwKmLAweKMnSM3+9NAg24vw/g0f9L
	pmrUbFAabfadMvf23aZgqtMrRfgxuckTz+kfkGLJ/d9nqhka5Ma0kxZZT9LIL37ltKkvNlZhGkg
	hUT/+WEiCoEIc7cEnuOSRrjZ4JMamxTfA2McJ7YeULpDsWJ08fHlM=
X-Received: by 2002:a05:620a:17ac:b0:93b:d79f:d948 with SMTP id af79cd13be357-93c43eb2a12mr287272985a.61.1790322717566;
        Fri, 25 Sep 2026 00:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:93b:d79f:d948 with SMTP id af79cd13be357-93c43eb2a12mr287270885a.61.1790322717113;
        Fri, 25 Sep 2026 00:51:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm4797443f8f.9.2026.09.25.00.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:51:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:51:55 +0200
Subject: [PATCH] arm64: defconfig: Enable EMC2305 and PCA963x drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABootmoC/x3MQQqAIBBA0avErBPMIrSrRAuZpprNGFoSSHdPW
 r7F/wUSRaYEU1MgUubEQSq6tgE8vOykeK0Go82onRkUBtl4V5nkuiWo3lm05NA7tFCjM9LGzz+
 cl/f9APxHsLhgAAAA
X-Change-ID: 20260924-config-ventuno-398c8e9ca9c8
To: linux-kernel@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX3opoSnHBppL7
 be3GAls+eyjg8IdBP3jqDw5cCOJ8GR0TdTdS7AT75I8TWTo30qP+AvvPP76eAxE2h9EniYWaN2g
 B/gKvMxoSiXo5ozgjpG9bt9y6RQC6YY=
X-Proofpoint-GUID: CJ4evuihoz5965fde-WcmtVfYVMgj8tp
X-Proofpoint-ORIG-GUID: CJ4evuihoz5965fde-WcmtVfYVMgj8tp
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab6281e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=kvZKKbouJESGLE6z1NwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX+/WAzwOD6LPr
 XjtM2oIv1Fd+iHmCAhOZmBFp929n9+nAtieaK7J0i7kScxd325Vf4v+gvZuQOZLL+tVOBjhbLTh
 OxCJvN6nAiUwEtu+DAweXAuYnadj1k+qRoh7ppmOXm8/WIBrPaYPXWVRBnJEc4Rpkf59L5aFozd
 xZmIjjJ23b79W++vOJ5i3+xUIBqQ2L2YVifNfbF0sDuGezcH9ejfM+RLtXlYzmpW8U0KGtXpyiB
 LMLbYUoV3STgjDrioMk8g75nUuYtbMqDkfycKJltUrFHAfo5/onw8FZ7qXd80sZ0W10WWAkZxnd
 /nxGeWHY4u/TWiblFIdPtiI6aC3AoPHl7pkuK7xhcdUw3533uoPrSqrmVOLv/yJQqbQpsuce7cM
 hhWNuhgQz2Kjk7C/lNLTal1kkJeTziDCi98PTww2Yuw6LKCuaChFJj9ADqRRVUYF7l/whkPyGLI
 urJasyoXmK4rUORN+VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250031

Enable drivers for the EMC2305 fan controller and PCA963x LED
controller present on the Arduino Ventuno Q board.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
To: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..012bd0cb1bf6cb130c92012748a90ebe76534854 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,6 +769,7 @@ CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_SHT4x=m
+CONFIG_SENSORS_EMC2305=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
@@ -1323,6 +1324,7 @@ CONFIG_LEDS_CLASS_MULTICOLOR=m
 CONFIG_LEDS_LM3692X=m
 CONFIG_LEDS_PCA9532=m
 CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_QCOM_FLASH=m

---
base-commit: b9bb4134a9583a388704433eef22c82c49963585
change-id: 20260924-config-ventuno-398c8e9ca9c8

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

