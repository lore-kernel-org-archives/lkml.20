Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37133D25AD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307843; cv=none; b=W7olQAYgPBdnBDV4e8XZWqTAH88pk7U3HNp3Qctczd9zHl9w06V7/EfqGxAA7P4rOg64WVHgXzWKZyxW3+HUn4uSpvwBqJxQDot4sFG7XJDAUZXndQA5Gns1ssZjuQMwPHuF4frvLK2to5OvrBGyAGBHvyTuQbxOTP7NrgZ9m/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307843; c=relaxed/simple;
	bh=sX4fEQfFrNSZ8fgQgLtRKDIGj47yFxCj1lU8vWYxAr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnLEIvdO6zFZXuFzCDzS97L+sb993trqnHyRETH+xsBOsATDjZz7p8WhtppNELP5qZo13Yu9phjjj27jXi+Tc1FFi6uNf72n5Yy5CZbIZQd10f1oMKBLWeB4wsPUjeJRqsC5yFNqtqSk/26ubuYeHybsF2cjQcYwkLnbMpcVTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJ9yJ3bg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR+7EpS9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJ9yJ3bg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR+7EpS9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tDuE1669191
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=; b=NJ9yJ3bgcqAq6NsK
	BZ5aguWeQ5S8ZsBhM9RH6omS92TvM8wYWFSC5ZODZYvQsWltsVfkffV7yyzvL8+t
	MtiiOgYU5RrlwXV2rEP6q2T98yuVQMCFSmKzignKjNmjeAOZgJ/IKJXyBHU/w1hL
	Xsgln3Yt6n9ut3IFR07f30xsU/HLDWOAt7GTdCYbuKmxybTepDonimUxBj7dpl1I
	S9VktXLwJbrJnwMvdh8RzNhSufukDBiFEa/zQwhKArEB8KMTycZwYiwCIkPnnZ4f
	DNjqN+/VoTFqor/v3MXCJZIYogAjFNCwd/Q/CSNYOT7/wOfPABh373ky7RYt1ZIx
	C+qEjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k2g6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:21 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so1993089eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307840; x=1792912640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=JR+7EpS9VdswK2ewpYDrcPY+jUAYnTZ/TVETnJdgt+zMF+8AX8X2cKFJVUHHJJaPCr
         ri/UttwvtlVBPi98V1UjID9tgj6DxwXQ0sVwS61LWpJeauGcFdyfXTsELkTITfGmiDBX
         kbjblL0OZGW1Q2tLTDst4btoMQS7XkQjleIGWtB9ZFFqH6GcOTPw0jx4+tSIkobaoVzm
         nocz2CjEEXmXGQTPcpBGocPfo233FO32+7aSJAHtjuvIIfpGBfAJzx+P++F/Q7p8KMMa
         Ot9uhJrKU/3n9dDw3MirR2C9RLoOJ7Htz6nvz9Dskd7PXHBDVJgkuMoU/9ZTlR8QRE/w
         1NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307840; x=1792912640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwp4TN15dPYwC5cOl0QkSzPCRmE3TPrBl4X5VT1FhRg=;
        b=1cu5022cEnHrwqE3cLmyUTXnPKtSVVqZYrWLxtoYsv8ircJ4hOMktorSnluhBel84U
         13FTYuKW93+oZkOFsxoVZtotsGRWo3E/aRpJXLZdCMKS+rwb1vbgmUn8JaEcHPVJCBS/
         68NNEGLYuPpju1vsz978QyRu2CQPIzzy3n84ZDZastps1Fr4g7PqK6bZRiqWoo6txfwt
         ZKYHiv/AgtCSTz/4LU4R+eVTDxacWFIt9NRc4HWMaYBRihtmVKGtI8klKiiQb/VfRgdk
         ANWIpVoME7TnXWNgQvKRMgpP5YFn97UjdOnuG0fhABdf/cbZr/KRtcIzV6kx4BgT+NdM
         +vtQ==
X-Forwarded-Encrypted: i=1; AKwUvByVCBDiXGP+ZKmIjbgiaXka+8P222ojvax4CXcKERo4zfuXuKjThgrr6nbLdc7tYHbdM1mvY5iOenma8HY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUJWulRb9XLn1DjJ0jP8jhbQcOem2XZJXuy6ZTVLauX45BwJif
	GqksT6wtTNB9+I85Ne8C5N3LAdLs1NX3C26AaJtRApl9irl0Cbmj92coSjXtEP44rY97JpqsoLP
	SXwoISkBxpmtsGhZwDT54ycLfkJth4NNizDe5Boq8Xuj12LUXMKpdEcVVaNHjfTWs9FM=
X-Gm-Gg: AYBFou1xz/9LWjUUaoINITITZ5FDTsi548ncRhYwIVgBzRGs7EqKg/z6OxeRs41yi+t
	GTt0c1fYAsWpvlAVOA03d0IjDrftvD43b75XrpPI4gXcTp6lN7CZNAstvekjg6Qg6OvA7hHLIXw
	Ix/PMCchh2DBjQ1VtSL/soPiQk2hsxuaI7VS/f6sPQvOGPLmMD4VpstNnIca7Qdn+Qd0qN6R8rm
	48mhkVhr5um5jy3rEsSN4x3Z8u6xo1p8jc2dFelJ4mTQUsf5GOb8cCZQLMN7hyYYvjpKn+GDjLp
	XRAR4oKyJancrbJ4bJ6FrJxz/x+UiUhgxs/DiE1H1JLK2EMb8+xyJXDKMFUVTT78wfvzMru/eqH
	Hg09EZgDYPR6MMnb96va6yhCwqzChD+giVpg=
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr6606424c88.0.1792307840332;
        Sun, 18 Oct 2026 00:17:20 -0700 (PDT)
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr6606397c88.0.1792307839660;
        Sun, 18 Oct 2026 00:17:19 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:19 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 12:46:48 +0530
Subject: [PATCH RFC v2 3/3] arm64: dts: qcom: nord: Add SoCCP on
 Ride-Embedded board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-nord-soccp-dt-v2-3-4d713d316e9d@oss.qualcomm.com>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
In-Reply-To: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfXz2RC6HZWMfBm
 xZbOvMP6/B/3KSqIZlKKpBhAl0xRFgFDjlQp1GJ05g/EIVFh/A+MKQa3yarGqtveJSelTTRDjX7
 kBeJlAD+o0IIiwLgt0O3ryunH1hsnDM+x+CI+7Gbv6UaP6uj3rHPeMHv8g+E3oN/6Y5G14U90+7
 8USbd9d1oW3W8qIPj8abNTgdgdk42eb6TJRJbegrfm7NY37Mzyl/ZzYNq8hgH1aqg7AfTu1ow4a
 Sulq2wd5zhEo/Mpl8C8zeQGv4yC3WOjgW+rMm65Ga1mx2iecKnovo8lkG/krwnZrDASGTWfAwYW
 /68tE5nuKvEMRSFUrPPeupzpUYRoCqRNlJngrpFjwf+H2PitHPXFjkGtZlNa0+11op3nIKqOOnv
 sz63KDf9rKrKQyVXmBzOM1eANMutbJ2FHkJ/rJuOyxRdY8rqAcVwNoz1hrkZ6d2aNvBeUQoD5f/
 ucbVceCX9IwUFTO0ClQ==
X-Proofpoint-GUID: HNzVN9PRcvmcYCd78YzO7uS2AHJftyh_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfXxpONRbsygmU+
 bWffpb7Z8gF0w4G2eayIR2Cq1GI+FYN1k/KijKsYkAXZBZr7XWKCHihSIDhoa8FjID9q+W6fFs/
 +EZs6Xw94fjucps5OC5LQFgsIWTwDlk=
X-Proofpoint-ORIG-GUID: HNzVN9PRcvmcYCd78YzO7uS2AHJftyh_
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad47281 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180028

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

