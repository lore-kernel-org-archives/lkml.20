Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485917;
	b=HXnqDUZ3DWEU/R+/W91WR1Q6oLvzDcSnhdIRcCtn4hBNvFRcPjt0MbQGMcz2oB3Lk6CG
	 q3EeV8DenaB63674zwpzLCiPdF5+Xcdazt6cFN3m0ChxELYL1u0yAluluedUINGkWpJEA
	 jpvD3ELAjVWXXkjnSUNpP0o2I3sHTp30dFuZyfZR6ZAzw3HJISdOGYb1cLCVzbmtFdSTt
	 57Qh1aNFShYhA6yxJ3MtIklDe8HW7Qsc+KELf+sglzEztboE1trgcD8vXbo9eqpne6sR/
	 QO5drcGls/vixNInZ+gW1rXNqVzsLjkXBHY5v9tdFEh90WcDiQDlKVmOW+wozIRSuGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AVi0JRv8P3+r3ZGqEi7SkYqg3/i2og3k0aYWvl4OUjU=;
	b=kLLSQP549odZsPl5NejCxKhdB/i1zBLE1FkJ5Tfutxj/VrPE5sOi2y8IYwEOlq8hW58b
	 ANMtpaLkEwoW+eKiW7JU0A3KEom3HuRD+j7iLNNcB0msEtnYW9zeBCC3/3GOSVYhEsDTw
	 C0PD+00lxkwVTV2ok43rAV2FbyH3foeOglNtZm3EmdkNWZvSR12PwFXMZ8MqAlX7VZrca
	 7CXPoAUBNowfLMIy3iyinzNjHEA56u7c6SpNNWcnxqm3yNn+Td4g4Z1qKutdZUlquHVr+
	 2I4ukKWvNtE0+KhkS7VvsaoNobZbKFrFfkuGtoT0xxRoof4uFSLtnmib1wol5UExEiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=THWclgoC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZlNdjfin;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0A606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE0A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=THWclgoC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZlNdjfin
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Kr7W1254672
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVi0JRv8P3+r3ZGqEi7SkYqg3/i2og3k0aYWvl4OUjU=; b=THWclgoC0Obg47eO
	/dvkdhkClTknxpX89zTrsnQSXWyxpF5HxnEaRYD8Pwr/RYqQtNW1QaNLJUyMo9AI
	wp93yW84odpAV+y5FpIDHkNAyBg+I+A3DtDOFQ8zJ2QHSMFVxfQcMzAIEvs0kV+h
	9PecD+L0OvdMO1Hytg8sQhuWJegLCJUvlmHuf5A8yZh8KywK6M2I8esgP+3o9spd
	Zb1Wi3G44EQGZzID2tgEL4PPQ4VeRnaucVhqKLoKgdY9XpWdNAzRr2iQmD4j32S7
	lu0rPSGylQwco1vrXZPy8KymZXrQm/3kfVz/HHJzmp0oBJd5DcfrZp6YL468awvg
	HNynhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9nsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:45:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so94743885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485916; x=1793090716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVi0JRv8P3+r3ZGqEi7SkYqg3/i2og3k0aYWvl4OUjU=;
        b=ZlNdjfinE4hnwiGBwU5RDMyxLXuTAUA7sBAze/hbRlpR9N5+fvsv2BZehAN1qNH/ag
         eeyqb0feh9SCd063hqflQ57deUzlFvLfv1P9FB66R7tZ1i4K6+/xecaJNPJwTRcrFWZD
         PPHrnoJ+N29CvKqcY3sfIA6kXB+KOyAW3C/Vq/Jsue6Oi0t48cExGzTwnJsUpuAbtF3H
         SCEz+fQ12EapxwCK6HfCbQJPHDEiuEywevpu7xmZBrAm6bCEsmvyfGbGG4Wy7DVQBHHq
         +ehyhNx/SVbUYNWJguXbxYjaBbL6smhwwP+x6c0oN+1CWOOgDpxgTQ9aFYT+h728Awju
         dBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485916; x=1793090716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVi0JRv8P3+r3ZGqEi7SkYqg3/i2og3k0aYWvl4OUjU=;
        b=qx1Fy3OA1caw//4gG1aYnXcBt4IJaphA0Sfh36+fskQ0U+PQMEFNFvcM/JFDzH/MGe
         zxQ7hNW5QvkqWAfkQOlZ8d/FlBqz8Wrgng5iOseY4M2orWIs3ymP+tj09rcJ/gkyeUsF
         4gpL0JplWVJn3Tl6e/H2MO2VE4Z4qhJwXZubED/XiGqztm6dQctqGvqfOfwJDh08xXwX
         niBrKa07htbvrmDz334mjMZKMSjIfgAKScpBBR0Oy+NSBgBjjV/Od7jP7hBKxEi67DPy
         /oHAb/bf32x9UooIhyUhzsO0rjtCMZ/kIsvp+xXJRR80WFkSy0zpHtM8cr7Naix+vsC1
         20yQ==
X-Forwarded-Encrypted: i=1; AKwUvBzi16KD3ZowD1jRjzFulmp1Rkb+CgfFZJbua9R9y2g6OjYPBfeO/V7whzZFUSCaDyphrNoiJIqf3dg21mw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6MxJvUNzXYzvWYuQyQVIew+xgsQsW7OeWSm988CjqSXu6CpXK
	SqTr69De2AyXeIN6T7+eDFaLkF51QadHlN5ShotTPgKzADVczH1K4pRzdg7eWJvytkULLDNOmZQ
	KTS4TNZijMaQQ+0qqy+cG5KStKxChJsuEOTSpUkkjgHGGNWmADR84EqLoFxujtRfjvWQ=
X-Gm-Gg: AYBFou2p1pBvbVzHvfYuZ8HX6YesRD/ZfxjRBluoARMSLfoAKHYf2qnO0l0QUwJQeam
	h12MSz95W2IGmzx0hda19i+VNrZtfU53f579IAopsWk2XdTM39nUenccV/fMfUy7URT5bPQoBxW
	S1g8nVvENbg/L7wGCPx0Kq8ZHwvJ8dJBRJ582OJCF9HQiSxD7lkdi6cnadKRvBxQX/ql4EzC3J2
	DS57QFA814OpDBmkPDKGztLtqffMWEl5Ef+f5uw0RROon23LY2SvdBXpC+lQnf8uXzBS1znW8VJ
	FRp8BPfynEAJBUntLRXvRTkFnVwJf0oFcCn7shusuHevBOQK0U/8RJlSN17vlT40V7nO0v74ktw
	1H53fYpaDaXdKBu2lwtGh8r5DMEVw7FTyJzt+ijiIZDW7MDMH9HcAAPO8n4U1IWQhs6MvvSbfBj
	KehkMmAysdIFZQ
X-Received: by 2002:a05:620a:4147:b0:93e:618f:8127 with SMTP id af79cd13be357-93f4c45172dmr225009085a.8.1792485915575;
        Tue, 20 Oct 2026 01:45:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:93e:618f:8127 with SMTP id af79cd13be357-93f4c45172dmr225005785a.8.1792485915081;
        Tue, 20 Oct 2026 01:45:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab20a8b3a4sm27637231fa.1.2026.10.20.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:45:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 11:44:52 +0300
Subject: [PATCH v3 1/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt parent
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
Message-Id: <20261020-ifc6560-adv-v3-1-5da1a33fdcbd@oss.qualcomm.com>
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DmTKjB3QIqYbObmXidiYRT4oSJp1+xTSHaj7ZXe8IAI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1yoUcZCLmPIuiCrrKuhPYzhaWXWm+UG7avV5v
 UZ9PZHWTv6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatcqFAAKCRCLPIo+Aiko
 1aPzB/0RwIyXb9VnyXDj66X62KUv2xFp4PEQijR32P+50x4bbRmxwUb2Oa3J5DXhwzjmdNTVfFz
 k21re3WEGi/kD/QfLVeRN+mozxvL2wnt3XUBjz2Mg6bCRGzvPxUkl9ZLbo0Qtt2pd0vShpHyN8l
 ySBwpsiVtIlCNWcdmVUYEZRsxIndW1GrnW8kcSEQfCIh/aZhWQFuLa6kZDA/22zheM6aHSCCxRU
 LvqGBmnxmYM3s4rTGQndRFSUH88/tAr+sFHEJIVtB+nu1DklFpuCeXsl+O8drvzMTLIvWWR4U2D
 GNQLOtibvO/yj3+4ifeAcYetNbwsg1Cnra9TQGbnVsCqovFH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7DejhJbwJFrLgRrHS36kRZD8M3811pPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX6sjPwnPQC+vm
 GjqxXNPCF3MCneOJY9UOwwDr8XzycLH8AXu5Liz/TM18Z/w9KxT3CsBPik/SYxq9xqilmLUfVgF
 IkZZO+9VnIxL4ASUd8RuVqgVNhTfDL4d5wDdSDVXwOZDLdl1BIhXVhTCiEZhEylUecADWfblp/A
 F9FWLsiNtlJQaZpaI+im8MVK5yP6FRg9tHDfxNZhdxKoKP+Rp4pnN7LvARyx0J82Lr8eqTbr3D1
 qmsmxouD8e49rvG7H1Y5ks2EaVnJaYx8wddrlr0sYuLThko4EKPbSv8PI4+s3UHFl03Ycwvi7SU
 kfQ6JX6dkh11dBsFSr08isUo/zss98L00BcpfV8Sc5LfESit7NMo+PhPfGFA+N/YwdyTsSmNRZo
 YnVGP9Z20bnVDWjkvcVm0SCGOhCRXk6UCWFvloDxL2AvW7+sHU8Zq8m6Mf3N/RKcLbubV+7jOqs
 V6GHFNzDZUOlvxTX2gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX5jf6O+F+GBTc
 FGbswS+rM1KgpQ6Z4g7/d8R/a+Yh7CEmQO7lC9D6JO8afo5UcLXLL2Tf0gsBfVp99lNbViULf/C
 fgtRJ0ISu/0eS8caHd/2EsMjUcMs5v4=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad72a1c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=nq2omAUuIs4UQwLT8rkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7DejhJbwJFrLgRrHS36kRZD8M3811pPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

Probing the ADV7535 HDMI bridge fails on the IFC6560:

  gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
  gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ

The bridge's interrupt line, HDMI_INT_N, is wired to GPIO11 of the PM660,
not of the PM660L. PM660L GPIO11 is LPKs_CTRL, an output which the
bootloader drives high, so gpiochip_lock_as_irq() refuses to turn it
into an interrupt and requesting the interrupt fails.

Point the interrupt at the PM660 GPIO.

Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 9e14f53b552e..eef4cab8c200 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -167,7 +167,7 @@ adv7533: hdmi@39 {
 		reg = <0x39>, <0x66>;
 		reg-names = "main", "edid";
 
-		interrupt-parent = <&pm660l_gpios>;
+		interrupt-parent = <&pm660_gpios>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 
 		clocks = <&rpmcc RPM_SMD_BB_CLK2>;

-- 
2.47.3

