Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F04AA1E5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401504; cv=none; b=I7bAPzEGWAxn4p7OXnq9Iw0HlHygFBlVhjKdSOWcbVHvfqtfQrxWj6p0sV4MFLuHWEH5KbXOtwry7F8xq7SzvDlmoeLwAffApu6j1pwCCo/7KKYPwpfiw6Qd7KDbfUUHZGwvHqGCvv8/E7yq7Pmbhni9AbbRvVlV3TTvw8UYHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401504; c=relaxed/simple;
	bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmI9Rh+ajTQmXxN9ONWNpFtz0arVHkwRomcSnGY2I7kR/FbF7Gidt3+dvZ2ia6RpJWgWIr78OaQyJ6DSzbKowH6H3a8L65wtRaj2qzdAudgjqPRvlUHO4zTAIhccFvtOI5DyTvtLeXjNLQG/UsQE+C4aruP3mCWQy7wU7pLXVgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVSly8hw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S46hWdkt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVSly8hw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S46hWdkt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P3Tl2042434
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=; b=OVSly8hwaoQ6Usmk
	+W1+TmqWW2KtP2JewCKwM5qvVICbxi/S8etKxnivLsmdnTKs42fg5WmO8lkSCuyz
	4aLeZzfMoSrG826PCBYC5BDYHR5ddAU/ZAFIX6WPbXXyK8ataVsoYCu+G5DzMEIn
	ECnp7c0tXZszwfa6icOhnplbo6xgWxziAucBfo4wmif3Xb+l1mArJ7riFaDNzxIc
	pZTRNWwKshTBzRBLd5Fs1l/yhZ/mxVKCHZq4uwmPwMOlwlME5Oe4UC/wzPMth02S
	naxza1DTyvuk5ecb+U9AADl4t7BvM4fxjBLfRDpN1a0TzNDhHcqG3KSX97tAp1Jl
	CvGceg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur20au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so609035285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401501; x=1793006301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=S46hWdktnZrG/PllBhkq6rr7eX+gR9ymkgxojzlxp+xedCvjZq9u+LQJFN5FEDsq75
         zlgq26bmhLkMlSPsqCaVdXJ4iwRpQ49IWGzUUyh5eUslqQA/Lav933JE9NZTkKE4em60
         OF7poXZ45H2LJn8XRVjddjGx7/h+wPDYFv6YNWRctKna4bJ3HrWFEkdKdv/TNwsbcYGg
         RQwGI0K1QncVE2shFL/EMeD1YNI4Q0ruRCiIqkw6YZUXUwSKdTQcZ0A4NDS9h5OkybQf
         WbMVurFYtl8XytIf2qXLtDyDnGRLWIeYnZvoQowp4U4DLrAP7Ig9TDTqT/r15tUnKjS5
         urCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401501; x=1793006301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK9XIjoJkCr9hVq/5NleYDwc98kzEkgjzgNbxN/oBho=;
        b=p72rXqBes03u+x7tJZabaM8+f58RFizuzkyFHo824x+0a3qpRRJ1WUMHS+3ZBmQTgm
         jhYMBJIO6XUk0f+QRvsBMNj5Grxl43rm0mnnKj1V6GGf3rLYoxep0+ndpFT8gsQECkNj
         cN0RZg4bCZTjRIu17XPPgehFIDEdyOx9qbiDXFE5gTyclnZypVbVZkuUVVPvvQArRlBR
         7ou18tG37ey9VhaOhch9srSe8qBbXRRLwnDd9NMXk/QIhxFf/hgGqekICEWLv1127Ud7
         qHMOrlshM9S0EKFKcsnkxSEMGmleOsH4tvM5gWgnxIgBWuIRHTQQnljrNTOWOym5hiBX
         OIfw==
X-Forwarded-Encrypted: i=1; AKwUvByqOVoby8uqN4/4nskWsS1uicJMfqxiZ+qAgRbA8FAgBAtnK0cboCnVdMrBuY08yNLf3JdcHO8rq6VDl9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhOV5uyyegdoiYz48bB+K/uBac1cvWYBHHlaWKCGBRyxqUtyo7
	OwUIbqxvGfZucNlMTKg8HKkodnftiJngfI7FKD8rUoURSFIVVqRTo9Db0L6xxIJwyFuuYCFR2kR
	YLYyZtT3Y3mKQEnibx2ek/IPvF+IPRbzdIaIxZ7KrcWdm3XVHcwlgK5AkpbdYt4/6EGo=
X-Gm-Gg: AYBFou11+silkIJE+I48kJAR2MRlKLgAzLRWt2JDirS3WBT9hnuCsbV9Tg3TVbXZr82
	2rXrKsRDL3GtlgMjggWuoJxRK1J2lSjJpswv1qkhALktyO0eBjlJZfQiZvn8FqV4kewibTDC0Kx
	58bqxulBuHERPQgBiSZEocx/zLnJL2i8pPEvWU7saxQO1K5ExpqNrNYChOIFkkuf9jjOwvdItgF
	g29PYV8TsLf9nf22aQOueEUbs0gybcrZE6nKUAbb1UmYF7RkyuI8ZbaW1dliZ2XOk8nvbpoEhnU
	0w8U7brVqospv8wrzn2IMxYDjjHXFxzf34tW7pbcPbhjpeGa2DMChpS7lixy35FnSnNLiz4V6eK
	dvmApGhQasTh6mTYlwtbkSsvW2L/x3+XLmL3Byy7dxWFCWbjksqLA9w4QSLXC7teKVhAZE5HcgL
	G3ec0tmhu9sdsE
X-Received: by 2002:a05:620a:a0d8:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-93f2ab978a0mr752274985a.29.1792401501055;
        Mon, 19 Oct 2026 02:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d8:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-93f2ab978a0mr752272085a.29.1792401500588;
        Mon, 19 Oct 2026 02:18:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm15893441fa.25.2026.10.19.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:18:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:18:05 +0300
Subject: [PATCH v5 3/5] dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sdm845-hdk-v5-3-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BF6415btVpAVudmuKDsPZH7SQiNfH+6JB5g0CaPUoN0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1eBQFMOLG9PQ36ITEssszgQVT12P+KtvGzFFK
 NbVV244DieJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatXgUAAKCRCLPIo+Aiko
 1bQtB/4l4qocq2Fo6r7FjoNyp/oDBsptgFXXkJhqJQwPL1HbgxdeG9aUp3rqEcod2MAB8EW/mV1
 tqlZ/YJULnMcyyIXxoyBQwNQo9BKHVh/1iQlBqhau5BwFUam5j6ynUdo1HUeVm8hOUhpQq0XYIu
 Gckeqp+LLXJAUa8WoVTXNKjFkvJCB7ZD8//mvvyTmcoCpD5Yv+ugd/Ja6JzKRaxBBE9tBZPVBYm
 wQoi3W6CG9lKpoXm/m8kyjvct2N39YhIF3qajF6m+rSK6imLKP6goxozOvVOwfARfUSpKe7X8XD
 xN6CIS/jxKiQ/gQerGFRFGgtHBJnh9dHnbbvvBt0q+kww5oX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX0NaKSS0BPPrp
 GSvU/6/gLc/HONcx3mDq5NcgvRYTjsPHdg5nIuXqbX0qfLJjy7tS1XOCvZtpMl4dNqAki93QDSa
 SLWj/fPnNPEmG2CfBddkE00Qsf9IlEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX45b+IWrux6AK
 XvkDMtAEFIFLqGEG/nJo6Nt2vHiZiTmtfbI/yVr5+mXnc4uqdCICMdJKL3BRrbty2VdUnOS2co9
 TYKJC+eOj1Xwm6FaZjeZ77kPvm0ZyvZ0NXZgk/5nYsrgRwYHZEZXV8Y03xsOpJTK/vQN6y5nsdN
 P7xvxQB2J8vD0ag4UxU6ww1K0Ft9jtN5oA+NZ7KRRDWDqhgBZ+xmT/aePfy/HaiyHi8ePRPr0SO
 FGNh8+EQimooDz7LphUSxodkiFdY36iAd6kJmwZxTmLslHhkU0r7Ds6wLzth7gQHrer6jjvzUjF
 KW3m22syYqGTj/I+kw6ebPitGCtqV5azvBk2Z3/OvpPsMb7ZNsCDzVTQ9r9seevFKUvvxdxH2MZ
 ISBU0sr0M1btPgFEJzAba8UAb3LiaagSDXnWrj13M9tpfnmsXu2sMCCBAvblG8CFkyZFafY2Bof
 6NG/t2Zi6BB673yguKg==
X-Proofpoint-ORIG-GUID: j6nw0xJkbQujT1qIsuWKZRxsdouOLWnO
X-Proofpoint-GUID: j6nw0xJkbQujT1qIsuWKZRxsdouOLWnO
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5e05d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=9nMZPvWkDyzw5AdY2PIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

Document the mobile HDK for the Qualcomm SDM845 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..dec58f8818df 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1003,6 +1003,7 @@ properties:
               - lg,judyp
               - oneplus,enchilada
               - oneplus,fajita
+              - qcom,sdm845-hdk
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn

-- 
2.47.3

