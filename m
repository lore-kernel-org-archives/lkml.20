Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370D471412
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250066; cv=none; b=TBdvjEJbF/W+eR7fPi/OKDEvdu05352eXh48lt+/w/WYrRTBvToejNBMFLrPIj+ir4L7gmDG1IFIhtUrLMcl48fUdic5kBD0slfoi2MUqyO5yucvcCLiKMbCmKEyYkP4ZaDekmL077qDepZ04InvPuotbs0eBnbGyX8ZHho4DU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250066; c=relaxed/simple;
	bh=tN441A2j08V3jCDl8xEwrRaH1qOximKOl/mS1BZDvPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HeV+JGurBoBf9iXnb7eSA5qt3Pn6L23l+dm3sSsjGHtlJd2IavaBHqP43f/r1knPDE+Oi8RWAZVSQLWg1Z2U8jArxnoYT9FAs/KDY6xX21wpBZ8KWsct6vFamPxrEuMfu1SnYDxG9iWslX1Ke/5vC96XyyP6ao7M3rXBbnlGSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzO5z3P3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ch/tg046; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzO5z3P3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ch/tg046"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Jwi1709543
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=; b=lzO5z3P3twnyJsy/
	0Zh8c/y33YnHM/BgwuZOSoyoo8gGT9djSixiIWOBVbHH68bSbI/U1gGLl0sMgZg4
	4OYVdygfkxpOUts7x1R967VW36mi3oVn5lChUl93n+MrPikJP4X5u78WXtonQtmK
	x81grYDv3GF7ROSDy9ZLxEqxNvBG9Bg1hemJVoVebEhYgIbExMKxmB4ob3c+RnFl
	ZR7ZmJ2QONPRMvGX2vejCeKywBimcrwvSWERgr1Hy3OuQeZ5v10iBi7p3rNA7tzG
	8iUgSTQX9ZMhAhh7449XJ0RBpUnZNkD9a9z0CUZGHlyqE5s3BIsSFuQLlXnabx1d
	dUs5EQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs5gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:07:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso608747285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250059; x=1788854859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=;
        b=Ch/tg0469oyJfVeV9OX+C7OhDlHHzVZRR9123c6+eG2D/IdSffq1tTmfPIb5HjTtqV
         VzNu9OykhYrbYkXAtHns8+4Bg4rqqeKUIpNZf+BQPTlmdEvcT8wZcIOGwzkaQonxOoBL
         cQslmYR/+L8mg1dz63C9qFBEKbREM6J56yN6VXLPOJ/6uk+YEFYk+TUuTcwDxMdf0gBL
         C4bvX1nAqBTnRInwZBlKdbpnu18W+cSFf6KPE5GTHGrdlw86T6+edBxIn7hu1Myqdy7T
         VUMRfvrZvZMxIsWx8nLRv+zk0RrfwTT/RQ23HBQKeYGbTJ4VyGtAHfTxBDFJBEziNWhh
         p0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250059; x=1788854859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub51OpT1pPGndfOtUN2Qf/Th8h1NXJq7cvAp84NRqKM=;
        b=Ku21KfPPeQnc1czwjglSnBA+chY2aLs+8zhgJIpvwFlsZSQBEWwVhphKKy75HnUSgW
         worg8P4RpKk3WKYvbMM9BsrvL+r7NnBu0Lpe3/79W+dXhL4X3ONoKhBqJwkYRaoaBaeQ
         hw4WJwQyIlmdPYi07RY5xG/+YBamTSFOimNzNxlfXiKqY1o4swJ5UwJQUIZb8e+eSzro
         75bpZL0gu5sEUMS0i4vg0439EYudFe1DTHxlHOJIok3FUfRZnw15utor0H/q+SzTF4JH
         cGf8NlriE+s7uMAoeMCVWEtftzsKtjmVmD6DYuqu8BW9APc1Qq1LwLs0JFC/wuV7X+YS
         iUCg==
X-Forwarded-Encrypted: i=1; AHgh+RrT2pdx1LRYKoWwBCVdaitIRuQJk26wQd+v3wzmSA59EtrbpLhqpB4AfVcJIz/0ZeCJOhljO7S/kEifW9c=@vger.kernel.org
X-Gm-Message-State: AFuF++lSKJE/kakjiTHfsHpvLu/JMr/phcCQoEsj/37FCgNd3C8+QjAQ
	cTv5TheyJPs1aoMoxvg90Z9nDa5sUM+neI7mdW9GD/GEyYtcy4aipwFMblb9UeSwhvx7PU5DF9x
	B88lj98XJTJ7tH7SaLPZ8EmHOFHwEH1JQd0eTmRm3j08HzqE7K9fDTYiMzcMyJSWNAR8=
X-Gm-Gg: AR+sD11nIPKwuvwaISTMMcBZ8RoQwWPR1kOxWqliS8ICu5eMRMnUgpBRPDuwq4nXfO/
	lRjyk1HlqLFu4hsaCmVANsvsPpel8spPga1fXJ4vfNHKaoOH9M9NUzN2flsQGm1TIncFYtDBBm4
	a2z2Kr7Bebvg9WgsdDEfIJvdFTjpiFKH6YCjGcEPMl5OZ3W2iH+XPOn79OhNfDTIUTHOtmpFM3A
	428bzngDha9XHRPL1cRR4rvWxX+neckjMQ5f0gFHuVkEjB5qydd3CuitbzcG2K7tbelP/ukB0Du
	vn+0Db8B9HuLT9xuioONEld8rsaYSdQfom4uDHVX5BJPDOIpLtWdxNQiZ7UlmSbT98VDWkGyjU2
	eaBC1proY
X-Received: by 2002:a05:620a:444f:b0:939:2940:6368 with SMTP id af79cd13be357-93929406402mr1933016985a.19.1788250058568;
        Tue, 01 Sep 2026 01:07:38 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:939:2940:6368 with SMTP id af79cd13be357-93929406402mr1933007785a.19.1788250057848;
        Tue, 01 Sep 2026 01:07:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:01 +0300
Subject: [PATCH v2 04/16] arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-4-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=tN441A2j08V3jCDl8xEwrRaH1qOximKOl/mS1BZDvPE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloeuEYxK8/ZCk9O3L4/VcXpkgzptlZdK9G3Qy
 0/HXV6+traJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHrgAKCRAbX0TJAJUV
 VmSvEADCkuxwObHMfPPlGdOejFWSmTVLfH/zqt6RBd7ftTveyTubIs3+n0aroxI53OQlVlQ//Ek
 jcSry3E5WaT+f6f94eYKdK5QxODe4W9zhO+4twWcWrZzSMwPPAvaP05SXcil5m3HF8J+nlq+B5j
 FJAf7GGVJ6kICyEm5BCP/hqU8MT7UTHk8eJodl7v6Rl9NPhbrQ39Kq/bmz2evocQ8XSRR5W9t9N
 X5ljk/Q3ZxRtzS7lkBMZOUMu5G4LSJjpFbtGH7PqF9FYs/ZCtT34Icxak2YJDPlS5npsaxmbVt4
 TJuizfUhaJj+192lTdweOizlZu2jLf24x1rg4mE/CNJIMbt7JpWRJSpo9uzVdIxG6KQFmuO9yE2
 JQ0qo6TLWgiHXOT9PIRdycQJyPn3AajgLH3BrxxczTsBrs7Fbz+YeJA45qSH6oQpjxESvnt87l/
 ZkBgrZ+9TQZYMC1pfxXS/XuLR8TZetTrrAwOpnZoEka2DG0aXDJB0pCKcsB8qXIoAHBB371dOD2
 m2ZAnATDZEoMZXwpTBCMhBcmjdUmjmHCDbHdh/TAVI79wZFxdUelaEH9KQvcd0G2sOj4bCyfjT2
 FkyjQuILJFA0rru5qg1OFtodRWx0mbhqCkzO0Ue4h86zGiT5pg0ybTEo4C7tancW18j9vcxCqrx
 nanF+AxEnyfONVw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: DH8cd8PUQiuwdndOxhKoBhmFzJdleKEr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX2PEmk3r9EaLN
 hcfc2uISzwEW7e0h2ybqbK3w+D+dxllBrRb7q43xIOCtpAt8WLOC8GndZbnjXy8+kHnTvXksMOS
 z1Iz2eMUpITAbyYOZWzItzj292udWSs=
X-Proofpoint-ORIG-GUID: DH8cd8PUQiuwdndOxhKoBhmFzJdleKEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXzutHPCraDmuC
 PC9RiSyb4XytW/qa05f3J6M2i0YpOulzij2cI7853TbzqUlCKciaEXAVWVBWdPGDfR+DAGrV3T+
 tyNOxnZgpivv10YPu5yOo2DmwPYm+bhhUt76kyew2In34QFv3w7B+h/HNiRY1ql4yAk2vCcjyxo
 jGoQD7G8Iwju5zydShNq/tmna5RgyLZHxiH705ktRJGDyQz2O/cxiMbzGAk5CyDO9Sgcqi4G7sz
 4rzsAAMkGp0aOG5WuorF4gfZ9OUDe+nlACQ+2K4IDrsO6aInTZg06iOhmIU6Xtgbf4Msdge83Dn
 c9ct609ye6pFWeM+1yJk7Zzmqo3UimwwT4I7neyEyRQhl03LLnaw64L2HuTFQv+7uV8lS+eFSSp
 CTykUv5YQkjI32yIp4XCD4slPI0chy1CKcwsc4wMVX3eik5tjVOPVNAuZd948PtbBylNx1o60HD
 iGn9AqrOOlBkuPpYaHA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a9687cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 2be5a37c00cc..b795b65d604e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1072,6 +1072,7 @@ &smb2360_1_eusb2_repeater {
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
 			       <76 4>,  /* SPI19 (TZ Protected) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0

