Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827010;
	b=oEkXoUNQdxvrbv06Xu+kdkvRWkPeknLbsUrLZKSRwbFLUba3sUff3F2nTtHW+I+Jp5iW
	 MmPOMHf4soaV0uCofMgX06IptZf3TrPu6CD36tRNAx6Jufh/q6TLZ3I8ealCYf2DFswVa
	 yMRR1Ei4FcQchnh/fD4phsT6HHEpmD1Cyn9S8PSrzFMLmWONNL2Gnwu8uymbJF7zqW+Nc
	 SGhaIJCZPWIaqzBIKhat9ldohxJKAYXlgSOuTJ/6n7bykHtlylq14dP2GWH8TegPGPxb7
	 6TIZ6IcMQjxxnx1sgbqgeDs9KIfLD32u3BLSXQZ9oJDmbbFJpKJ30H1PQpm7j27KsJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
	b=rz/cfxNHRU9WNCSxKeUkOvzqKi28iSjbfB3hCVRxcJiSjqAT4i1cuX5vBys+o+TUKYGT
	 7IDYmyIbUoMCEF07hIXjrZQlQV5M4lLPDlD4GGIjx5LLxJzIFLLXGzBORPbePia2CJ+sm
	 ZDZSO3ug0wTPWnL2NHvcN/b2ejv3W3ij7OYLF8rqqWNd41ks93MLLXvdeusJybC25kcIk
	 Cifx/klWFJ5HGxAwbLvEy4CDkIiCQn+V7XE+A355wahG3dddx1zI4EiMvYpIcSLkaTb5i
	 Uo4oCgoclJxNahk0/mY5sRwArllPgeCA39Or3YcWxoNLXMzO7YlAh7j7m9lk5GTyWHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8UMAqiD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYGqMBa0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B6606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B6B6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8UMAqiD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYGqMBa0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGAKt9k785085
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1ng8Ocvz7fCDJlR+ot4zgt
	aeJUok4UFUIh130ek/3jE=; b=g8UMAqiDvzWqaJx+jr9HP3VmQrajYOcDXvunfs
	KQ+ho6F+A9hm2V8ey1jBA6nFNSld+eJGyv4NRKt/GZoZ7Ez6EYt8r3R2WVbUihZs
	xcCPv7V9KSqRu3gtCBYmI/sIBi+NbsrG4xc2Z+4kTXqhnwGT8DxwVuJgQKRiOPbI
	JPLMKef6fj3k7KIa1jerUQ6sAteybHHuJzhImIKPQ7j7EbheBGOqW5JrV3OVd71C
	lMaaOomiZk6x0E3ZyFrE0aiC66q7xRbCRQwTRpZKhgATNd0u8Qo3k7c6TADzsya8
	VT3Y+0qr/18Rydy9BF5y0eAk4vNfB+lcfaX9jLQzyBrAnZTg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g04w8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:03:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a073778890so2512306b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827008; x=1795431808; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
        b=WYGqMBa07TldRM1uVVNJh/WuGNYpnZ2AKIamy6p6aVt05UbGyb906tbRUFhQLWka0L
         rHfWCw0ftNUH59/Lu+dQEJKY9v+0VrHKeuXSpemaeEgRqYju8wVLI1yK7P6GZRBNXt+B
         tvCk/pITpQNCLw0YXij7ihv7FiVG1hFJ2CDOdooAKxlMrwtkNNRFYnCRE/T/BqMIDydy
         /ej2ohnHXyEanE0qW9/Vev82s4TFsOMKmHo+UD0IRJnVKyUvAcS5j/2Bto8vdFdgZi4e
         xoOJpASAzqN6b6eZUS0wXN0Yws8MK5QArwV44sCNdFFlULwNu7VWnDn+fJrWC7z/Cu9e
         iBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827008; x=1795431808;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1ng8Ocvz7fCDJlR+ot4zgtaeJUok4UFUIh130ek/3jE=;
        b=o0g7CXPbbZEe/qAUXEmwGz1IrYDOmCO6r+R7+DLW8mtI+etub80JQSWqeXua7C1Cx8
         iQG2Sj5I0cTe24BH1JdnILw3hkwSoLzqgLuW/7qtt81pYKqUZBD3o6WRnk2BMPwE7gwt
         1QhEJoSe9GMjLI1vgLntCxRBs3ewt8K++D3QnM3d/x0P4sk9BCtZ7UxiYQ5LW7+kWrii
         ca7axL0ek1aEsaRyX/oXx2d2G3/9whHVwOHH9YHgdJixtLJ7X74MF9ShbifIe7eWxI+B
         p4cMAORNxZ01S1qRDokJyvcSYUjqgY/n4rOtuqQ3Y7TX2FBKdAaYlBWBwfvhtO9vCvly
         W3MQ==
X-Forwarded-Encrypted: i=1; AL+hErG+t/ZF4Oiz0lk91WSg1fYvt1e2QwDufeNVVnn712YaG135JPfaVG7fU/5RV7x52vuZ6d/WSyHKTVWJa9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yKa71989/2g1qM11hGYjNAilZ0dRNkw/cdumABR8QrJb2CBuH
	ZmIXe9id/vJstlTOp4pmE1EV8RJvEt7UVBkuZnDSJdskOVgUElJDASFTQb8AVA4MI/AAvhrFRku
	gWP1h1Oyy+NDYTYAgYtUs3S2M/g0Jhpd9GwwTVs4ZMj8TkQiBIB62Zm/ByzBOtfKzvzM=
X-Gm-Gg: AYBFou2bHCCiDiOKTyfndnfchb9T7pyg4vVAdqjVugltF4rYYvscq6RbwPMn01sPIAg
	luOclKe3e7gUVz2k0qi+iJqhqlXPdzvbU3kj/aN41RmbNfIWPTmoA3AmnkjNGyFHkZTVdsS7ZuW
	B4QZ62CXWGu2oq3JJs7JJ1QD/rIBdHEnGDtrDz+ACfPNl3tEdNwYSuo/d7HPpNA8mk9HCsOO+ft
	Xji5G+DSw9Ki1XOSq4EK5VVwgU6jTgi0W/Kb0R+c0y6cXirPhTm/zD/GjMiQbGBOTiHIoQDfeuc
	lOBILDEWXDKSzzZRLPn3tsOBWyKIvSZYiZ6k7/o5Xo5wk4kcZU753BhUT7USdgTFrpB5UrQ2Ih1
	fw+7EdBXhbvf8+sXmKAc2BslAQUdtqHFYHNz+sU+5g0i8KhEtUNyvycc4l7KQjejw4N1J5VzqB9
	ykSGpqGSEBHu/Gu+svvLCk9mYGkZemr2m2II0=
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr10042018b3a.18.1794827008494;
        Mon, 16 Nov 2026 03:03:28 -0800 (PST)
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr10041988b3a.18.1794827008017;
        Mon, 16 Nov 2026 03:03:28 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8121sm3499779b3a.20.2026.11.16.03.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:03:27 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 19:03:01 +0800
Subject: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
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
Message-Id: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOXi+moC/x3MQQqDMBAF0KvIrBtoRK3tVYqEMRn1Y9EyI1IQ7
 97g8m3eQSYKMXoVB6nsMKxLhr8VFCdeRnFI2VTey8Z737gE4/4jQWFxD3FDGFYNNmFWdvWj4ti
 2zzoJUy6+KgN+V//uzvMPM4fa9m4AAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794827003; l=997;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=odo/rV5qNFliIRkRRmj1dui5NiNAsjMnmpo8SoR/RjQ=;
 b=jknWsnBgy2n9uBICUy4HdpeRPU1LJHz5YpX8UZFlu17CDjHJA2PIRahJc+OKyVYSSiUj8Auce
 386loIbS9/fAuK6x48tCWT21m5rC5Wn4c8VOUfzCuS7dw/jkvAbjkMV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfX9VgUa773ufrQ
 chXxQYTN0+UQo3RW4YwcwMYKH+VZMG2ksj+vyqY/bGD8jmBtnFIbfXXNS7dAkMuP1dVH9epvcVg
 ecbt46IIMfrqjTp0OyC/R+YSsb5xy6mxFDD0A3qCCMfhdwpR5wfkXZMPGvRNiweM4vaFk09Tkqg
 FRmPZilwFFSTVW0NoRV+aftvoRJ7BbsJLjM1ELkcRt8bP5Z0SO95XDUzAut9TG9wuWB7SHoDZ4B
 rQcdaECbuTUpzCtBSWgcZUWCYJJ+FNMRgEJLshbRqca7EarBgSFhg1MgWhPM5JVxB7mqPDklLBv
 Cr/ZYeqzW4O1IL25Eb+NaikHME8k+yjyL6NdUYb8ZBg4zKx0an58MhBH8UwEvjfN3Zf1WSXvXXX
 OfiRF5tHY9CwkV6V32zBvflxlF79MZlX7Kf0rlHd5RlkXRwATqJcT2R9n1Dn8N6o8+QJ+HP4JL9
 5CuqORfQzd7Yyuyo+IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0MyBTYWx0ZWRfXzZ2lhTVzEM9J
 DTqew+kVbyBkiVDvMlMz8fXUD8xo0LIbMxbj4BQsirtgcGNosd4wJDOp33dYlLm6oeRorDY/QDn
 DRmixNL1IDhDyheJRVOJ1I0tZgumuFE=
X-Proofpoint-GUID: HYOjAOWiqUFIFDDtIugdDl2dEnMbPUQK
X-Proofpoint-ORIG-GUID: HYOjAOWiqUFIFDDtIugdDl2dEnMbPUQK
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afae301 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r7GndIfPiZ8jbtywizEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160043

The cti_riscv device is suspected to have a clock vote issue on the
KVM enabled path, which causes the device to crash during bootup. Mark
the node with status = "fail" for now to avoid the crash.

Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..5f5a786fbd2c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3996,6 +3996,7 @@ cti@982b000 {
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
 			clock-names = "apb_pclk";
 			label = "cti_riscv";
+			status = "fail";
 		};
 
 		tpdm@9860000 {

---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

