Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218E3B7767
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459885; cv=none; b=sHeAd+zbABMQD/4zUuG7TqcU4l+idEfFENlBsC1ffKYi3wwgYcSA67Rfy57ylS9iwuXq2CSNHV4br21C2VWGZL2cnhkwYrRtjkwILxM7AZXFljV2mChj92vmm4L/9Ov2ZPol2A3vw5UxIwTIzJXWMBdv9eyt78ttMjSdVaDytSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459885; c=relaxed/simple;
	bh=95bc2dL3j7zvq8sUrPF+9bW5u8zLw6OG/1joY1aHH+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3XzeaTYNIgiraiDo7EKwt1eSE6BPmW5xmw4x4GEa75ZCo/Pi3IjO8LmdjU3MH3UBb2BjpoNAZP0U/W9a7BlmCrFT5bKMhZTda3EfARMTa1A2u1vBo4FaAApw3nv00Aspfk3o4eaoERpjmWr6QzMP6O7F3UtmUPTeQ2ReZETmYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwi/azVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJhFv0G4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwi/azVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJhFv0G4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F7WnSg1790832
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=; b=dwi/azVliZVgSa0O
	lPcr/d3/Its4D6WIkE+zrWZhWONfpCzzyY1p5QPEdV3vpDIjY+GvcEQZVy73s69f
	93OMamrRWINQ3hxecPRqxs+YIOzNKEXfI5nPpji4jo+hXWuUtGUnctrLmceer19L
	XKxEL1hdgYbUz6+cW05duHvrWetoYfzU8I/UtAOIhpXobSaGOJSn80tedhbdqgQL
	45WoX2iqzKprZa7ia6RkBw+SmS8OsXjFZ0jXp/QKBRkwxnrTZA7Au/SOlJx7+7h4
	WPNkZNGc1ngccuhEnt5pl67CazBrjJdta2XS5Iw8dRcpigakPV/iftI3mzn/G2h3
	BJ1sag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp85h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:11:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so782756285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459881; x=1790064681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=gJhFv0G45ZPQGOWRJujt5ewrgGQlBCQel/rrmRwFh9CrWmw6x8tqGa3nDad7sh+vED
         E7O+jLNd9VnXiDHSdfwURNm9coOK+NLBwhPFRSZvHuZWpDYYkoTwLIVGlwbTkpBjI1wk
         QOjIHlJI8eKSjFA/izX07tyqOr+dMB7g6RnSDGiAQCM5btKvRPMvwFPCFVnItcPxC0xQ
         1ksvq/hk7I9HHy25SKHdmnt/4qAug+RlhilCXq9EaNjtqT4eVupgKNgi/qmFK9ncl6Zw
         ntrXKx6K9XUY5HCwKdTUBRsgiXKdSjqgmE6DEezImdD22NZyE9hofWNUi3J2yud1MljG
         RfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459881; x=1790064681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=fk++JCrAVrwwHKlPgO0FazA793vJn21KCB0hrSpqKIJbifn79nR7xZRIlrjJaoAtZb
         nWYe2HraqJGNIrc+VkPi0oC50G0Xc7aKocv5rAvG1N5EKy1sTBu5gXvKFxXOvOEtGxI8
         b7voaTBsczowOOIqKiz2B7vu3vY1SPb/2eomjps1ZSs9KHfBJCg2ZcL/xrdtMy5SXq+T
         LrqBlxqrO0TonhbOb0UsW9UKEXEP9PK5pEAb4DOzVgnvfSa3suB7ulmqAvIeH5JzPm5p
         vdgqWjxc1OpPoBbeRq5kmrbLcc0JUfgY8DKmOmoBpUp8PhYi/VRhAoXanGdoT49TOzJu
         XkxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPWvzuR8L4rEoUGenHpvCG/5Lqkef5qr2wLsNmzgXNImXE6HZFhPJ46SA/j5LlNcRxhk91K1CmwfK1meI=@vger.kernel.org
X-Gm-Message-State: AFuF++nEljsYq6XJKatQk3RiPpmhl3WBZGrMfHSRNCDFPUQtkHULKAzK
	gjKVEEzOqDxxhlxRvUhDbey3jZ5PDMrNyCWlBFdIC3f0htsnBQUDHOdBA6eMjDLwwsVsGfkPcCJ
	GSojcHWm65MQjNeyUMg0AqAf6JAV3/+hlar/cV2QJUdjPDTTGLrSfXq1ZNBl8mbUqSVMBN8s1Zy
	NFsw==
X-Gm-Gg: AYBFou3a/B7o7oN4rKkjwcUJ9NmDz0Qb0NAxmcsQuz+s1qChZRYbYhEr6QY68usgIfI
	x4HnumSMkLYMs+XXbg/A6IC821DBpMBfDMjBqm5s8Ape5gKy7C7BFJlItthmBCEP2zVX87hSvsF
	TcqKPcE2IXDtHOIXrIGfFjWARr+xoInMrOQ2MJ+xkIjRNs8Vt25O79hxll6py6T7QlpyDtihcfc
	E1ibIGKzvHnRiqxBhwvso9wXpE8kLQK1LHeTKsdHeCOXwd//04HeuHb9OrDOranMkxVhkfKmiaR
	ZCOMvjp2oRg8rr3QXFy+2628hYcWuKxbmLK72EWZrzl04fT6Tb9Qil5uEBnBnV/GnbwFHgYGXzU
	BpbMGG75fwxylZPE5+mbNyPiK1kxoMxv+PDfHfy21lrHJaXuv0FluaTjPcvxrCwIgG29CS4Glgw
	xW5z7opTWY2Kexcs8MJOKtH3Yte3qCOqliKNuD4HJy0fzgLMWSlE8=
X-Received: by 2002:a05:620a:6086:b0:93a:1b82:4966 with SMTP id af79cd13be357-93a299fbf2amr906736685a.38.1789459880948;
        Tue, 15 Sep 2026 01:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6086:b0:93a:1b82:4966 with SMTP id af79cd13be357-93a299fbf2amr906734085a.38.1789459880580;
        Tue, 15 Sep 2026 01:11:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:12 +0200
Subject: [PATCH v7 9/9] arm64: defconfig: Enable CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-9-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX1xuxH5V76XAf
 vKIwPmreR0aR6K/JCWiAO9LpBIxvpH+voMuIvxMpnQNWN9eZ7MXdd8lt9bC3vOqGbHjY/brNf7S
 lC0HwxfkKOgnAm/OYSanWq6wbObGrn8=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa8fda9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: D3nG7p6bH1tunRR3fJ1Aax7dUy-j-0aQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXxWcpOsvLVKgM
 IDjF5xNfgKPAEbRUMRXDxnk/8nl3HwkDbVro6sg4W3KC/TwRfN+WqKlRd5apysvcEA2pqziPFrK
 nUGw0k1KRENe+FclxRHCg0FOKCL6kRoLubNiySh85zuqfTtXi8LC3xmukiRc3MvPwmYdBZYnu2p
 LjSRgMPlqMJ94Wo48OIhbhyfbLXUIT6i+0BpCm/ZUqsYgGrhP5m9ONzLZP8fv85b093fkUmID3O
 le2AuYOEhR/uZJvINbmWB7eCb/8fywQOj0apRpKom9Q8SAjvhqgGIi30Sl+9+FZj6P0VSgfv53d
 LdrtLNF7UUHZdi4LsQ74OfXULJUYFZcB43DY5fniQt4gUe2XdzZ1enjtVa0UUyxujRqEbO0ODRc
 h7Lmpf7d24NXObsrO2rZA/M+B7XM5Vd75QSzyugj5xTsLDSyIWDVqB5pYxZsVgnsQPYVZnvnbTu
 BEE3zVDzfFqUZvKtFjw==
X-Proofpoint-GUID: D3nG7p6bH1tunRR3fJ1Aax7dUy-j-0aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

