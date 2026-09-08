Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB95D38228A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848632; cv=none; b=QWBNB8ju+/zM3NVEVwugjv2/O+K1PGIa+G5TNOdoOPsPIh42w/arUHtjvqbuGtxMXOBpmBC5/5+fbhsxzbk7qcNLVwcgw9lRA2ZPJf1NfJC2BePQ/2u8WckF7qp1ZvzfbrB+j2/R3M7Eig1KjzABiQn2NkTRubrCCsdRDUlI2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848632; c=relaxed/simple;
	bh=mJATbGpidDn3SSlx/W3gY2kMWMLfR+Jpsm4nDdoHduE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsgejjqYBQBftzM+oZFEd4ovpuDnx+gGEWaIKXfW2O1UuKNOK6+NnQjy4EzTSCgxC+12F697OZZ4/nf3VOAefBCniYJm61rad7NpdreFxjrWPHWp3Tak4lHaaL6w8m8EQWZCPlMJpfUlu2cbeIKGrjgt4FQ4awBTVQTo+C5E2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9YnjvQL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaM5n/Ni; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9YnjvQL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaM5n/Ni"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M6jm2072913
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 06:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61HdGkF/68LYVs1l8XHHaSlHGHJ3i26abyWFQr6sk/s=; b=Q9YnjvQLzyqLr+Q5
	YaazQ1GvFJmPy5I7L69PVQ1wAmGbh7b0XI9GEYEgHCfNb0UbwHbnAW+Q9L8eYG4p
	7Vbe/LBvz982BGZ1dpsfocuXJzbDuzS0zCZj9kxiWbZvA0SjqzmSi6bISX46gxpm
	zaQ8DT2TSjWx+ClEBREBOoOrw6TnflbnzCHvJy2wo4H1jClKrQwWbkCZb4fa415Z
	VT5HZSBM87hLkZuxLr/rmP9P8PCdJuSCZWxbKONKDJHdIcnTVIRz5SDSOYZGoPVa
	gLE2ra4VdsrLFzIrdXoHWH9mERtR50Tv7GJKMbKzMU13EjJUq+FxCk5ZyyqDO7au
	2vitcg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfym2fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:23:49 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so3385663a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848629; x=1789453429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61HdGkF/68LYVs1l8XHHaSlHGHJ3i26abyWFQr6sk/s=;
        b=GaM5n/NivhQJ+P1aGp++vW/YN+9aid5SIMgt8Yw9GAHQif6vUeK4SOwz7AF9sSaX6b
         zOxyaHxNdz2TB1LaFeGCBpaJ/YfjF1U6t7FOA51dni+JkUIm+rPvZFAoHKqEuOLpP8tP
         S3R5cNQpaCuA+eiF1vj88mhX+drgfmoj95dYb4OSi95+OR2sGPzocQIYglwVfzWzDhhr
         9cPOnzp9ZGp/5lmwyjdeIoQEYog297y5lcMiKQHXj8MwaA77Ga9ZNCn6Cr+wo+BvcRVR
         gVzzNmaMe7Mogjy/a1/Wsp7OdVLLUS9CP8T3qHvdsrySWIZA+6QghcpBRV7l9idu6SVm
         rBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848629; x=1789453429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=61HdGkF/68LYVs1l8XHHaSlHGHJ3i26abyWFQr6sk/s=;
        b=EwTquLa15yswVqn3sPb/mfPtEk+c+aW1T1cXxo3dAk10Kevz6PqXhVD6n3WOi8oJjx
         MwvjqIgwrnid6WDUgBQpip09Btd2w2BAJmRH3CLlaFqJoRk3yogyGk1h9BFGUKvBV0a6
         aQVcAsJF0qs4HajLfb01OCvFufe1fkioy0k6o7Oe/jFbzPMfkwoLpUOUMAQnDWoiuPv/
         xmSHSwRr0NhCJSstlYdECLQkanEjNBFbR1MvjqSJXlhcXqOVob8e/o49ng6Pclh7gUmS
         vWt6Af2TFSc/CcjrwXDOW7Dai4H8MHtqfhNUn1WeOwjFXGMqUcTB2Sji5c46GB6fTAu8
         /TJg==
X-Forwarded-Encrypted: i=1; AKwUvBzP4mfg/2Em6CHDm5mL3bBT6D9kpsvGVzPFEXdZ8hCbBZPD2PQp8R03f+e2wbwJQoaT9Kd1ZKbpSIZMcCw=@vger.kernel.org
X-Gm-Message-State: AFuF++nJy69CZSh1pTC19MyrI2gofFcepxBDaHDJ4pOqN08Jz62cdVV/
	8/IGCoS66kbwitl+aA4IIZGZvaFMHy9d29nPswV86pkGZzRjCDbmzGNLP+FflFbFQp36Nv3WZQ7
	7u7Xc3TGwIOS+GO9MYn37DMPCbMqlIrrdNMjat7mRbI7NhZ2TK2d9YGw5SH1jJNeifSU=
X-Gm-Gg: AYBFou3X9psHH5kECKQ72UF/UOKYoj9xfkqPnbzlQbajug0nrjgDY517T8e8ECCY0WR
	xxZ6Um9iLq717fG+aeD8gyQsmOzvKEpTChTuS9BHlP23YIqo2YWFeBMHkXvWlDxL7qriAi3UC2R
	2/FLrS5THpqSZwOaLILFcH0sWYRCPmys1GuDBn1Fhh1wV2+QOVgN6qEtEIdQoXhkMMYoJ677m+G
	rKDvtMuZ64ODOTFK3odzn5YcLUU+iMSlJbetFDf35TTzfEzL6cqTppjwQaojduxRfn0ELZp4Lhe
	BmY1qs+G9eB+X1WaXAlvNfCZ+PfYgfhSDXAOg7GL/eSsTRt2mQNFx31BW2+U7fWVlEMJn8oQTnd
	gRZNdlPMorAKOkGwfK8P0X1aUsgc7DA==
X-Received: by 2002:a05:6a21:3a93:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3da214198ddmr35394003637.7.1788848628660;
        Mon, 07 Sep 2026 23:23:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a93:b0:3a2:c9a1:2c26 with SMTP id adf61e73a8af0-3da214198ddmr35393936637.7.1788848628073;
        Mon, 07 Sep 2026 23:23:48 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm26266297c88.8.2026.09.07.23.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:23:47 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 11:53:30 +0530
Subject: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848616; l=1491;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=mJATbGpidDn3SSlx/W3gY2kMWMLfR+Jpsm4nDdoHduE=;
 b=Jkvw1pk7oGOlN57WgP/TuG5k3irKsBRAa8w+E5vVUW43T7qOC9t/PS572nlfiVy1K/+g+DeCL
 YSYm/g5EgGGCXd+vkMZ5nnX6zyRl8UeIu6/rKqt5Ifj6IfD7P9za1Ba
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: Et1j1LsmcQoj2FA9IIgxEaUfy7CaherI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX0dkJxDvNM9o5
 Jexe1OEI6S86QVBp8oZhpxQV/45XXwPnkn/RrTDiXKPdbY+o3bDhBqgt7+JoyrS44oEHYy00dMR
 jZYZnUbmoq5X9DKlZ9l0EzNwnVjSBTsqVlOqbDI/sE8ke6uI9j7nSHJjYxKEYBdJdetw5t0NETw
 MpOmbemO6qlCbfT75JX1gzfGupElan/m2nnMGgCmjqfgkfZ6i9Vhk0Y8Eh8aXMVCnHIssn8Ypko
 anW0+LkB8lHUVhqXC0ZdxIuEaV/1X54Jd142w2ua1agMBheeeDX87fmUlQPBAikVMnBcEFYRjnj
 C9MfCj1Bpn2SH2J28yWV5plaquaMsU7bKCwDpTIv9HdNlauSodHfI+HuuIKwGrWMtTb9W9pia01
 RbgGnIlUNgCGHs2IIUIU0Qrqgi5ob6yxFnS3pK5+FKR/1KNnMauXzEp7zGvFHxyyrqWKsdV/wRn
 40+T+0nppFLpWGbih3g==
X-Proofpoint-GUID: Et1j1LsmcQoj2FA9IIgxEaUfy7CaherI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX2Ey6WYA+ur0Z
 3n5XPyoZCuUSJcSsnY5YJGJwHAHy5QGYVPNQOt9UqLMSkjd0qh/odknCJuW0Q+578YKi3uLooqV
 qz0mYCiUN7X81F8KWPvr6YFLSD6QBvA=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9fa9f5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QNdpPppxqghzCxVJOWsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080068

The GPIO mappings on the IQS variant differ from the CQ variants.
GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
Secure IO pin; the latter is connected to GPIO49. This incorrect
reservation causes the probe of the second Ethernet port to fail:

  shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
  shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
  (GPIO_138) from group gpio138 on device 500000.pinctrl
  qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back

Replace gpio138 with gpio49 in the reserved list.

Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index e119ace54e588dca38c7c12fc99cc41d6623f690..c3f5fb84a07c425aef5ae36fc6e2842d87f4cae9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -220,7 +220,7 @@ pm8150_l18: l18 {
 &tlmm {
 	 gpio-reserved-ranges = <6 4>, /* Fingerprint SPI */
 			       <30 2>, /* NFC SPI */
-			       <138 1>, /* NFC Secure IO */
+			       <49 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
 
 	sw_ctrl_default: sw-ctrl-default-state {

-- 
2.34.1

