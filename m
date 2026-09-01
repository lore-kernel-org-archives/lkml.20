Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AE5478E25
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256285; cv=none; b=F83sS08RurruLfTPACRpyUCEf3Ii0n/JZL0zbArqhtF9ss3Y8SfaWtODT4dMlaAqtWY84sLhMWbiJdCjiXOSLT4TwzVht6KwfU36FW00UULI/DN5CcV2I7FIfH0qv2ldQMU7ezrpFyYUV9w1DVEhCoAhCDS2T+Vx5uOOOSOaN3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256285; c=relaxed/simple;
	bh=rreLXykQ63a6y1IOwDu9sw1t19oiyBF8/4USLE8zOa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttJv53OsZuq4D5STR265H5JMhkVgVg5X2RdmAbP++GarPDucm1dXMFeQMeQc19l3WWxD8ySRm/6QavXh1PbuKh7Lkqk0AnQDKsNuNJxy9SJWf4+oo4sZaqzjwnCoL8HbWjTugLJWuhFXrLxAgo1qu6opqOvMDoRYu3uCD7ltGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+drau0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkcQTDXs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+drau0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkcQTDXs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179OXo2321942
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mtqWHtuTVnw
	9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=; b=V+drau0bLqvt0G5kCd0l3IURuGh
	Y6WtBcFldiI+HJCor924vxppPpWslXIqZABzN+lfYiKTcghIpnCF8f1MvLfG2zaR
	b5ycASXx2p0oyvGNrLMFgj5yEdLKcpNP+LZKuknhrEhPZmSwmlAPf5fIVtuo8BXb
	+FIrlVNm/qum/08SovESR9K9wJR+CaVV1V1HRSvLLRAuRRofCif/mPzuZ3sKELp5
	Fs11CFPbcUCWkekhPiNv/3W+Y4MrFnabumMAG0Y/J0AMgaQmCSFCribZ0NoYIvpX
	NH7QUfP1a/PiQUU4Wb+OFZ/0b/wo9IhDrzn40vDTFPebmWq1pYtiFWIcJzA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchba91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:51:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so972132a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256281; x=1788861081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtqWHtuTVnw9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=;
        b=EkcQTDXsm4xVU3WfoclUF5uMkJUJ+GCMC9sFnwCYI2jW82aWFcAgsIWJjZWke0ONrb
         EIBYVNaDAV8v/gkvlw2z0cklPlM67/31xcETbxwzYtBoZPbjn7/yZkjF/pgIYW41NCs3
         utbKjl6WCiXvQESFLANPlQqIBgqEcz4vHm7/5f5wSJgE7nbnXz3moR1sM0+PEGeTikra
         3wBq37NLVO+07MjfedzKDBje9TWFsh79NC1JmdaXk41KIxxownTbrzBWCzT+K94UlCvI
         6TyuS+CA6pah0kcPWJRD9ITpVAn9R4r+VKerzlgw9Z3hr5XmC6n8P732vmZ0CqLvEVkp
         A6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256281; x=1788861081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtqWHtuTVnw9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=;
        b=MPbgA1RXHSflpevfYcdvOY7z1CNfSVq1LcqBk8CC1s1nszG7RTKVtjGuYl1JhIFiXF
         Ojcwdp7mwoyjMFdV9jOxsu4R1AdKfO82Rogtp9tBJw+nMK9o966JecXDLENBclGVZeZq
         WE50RMFTUOuvoP5iEhMnxYtZm4IPcD68Jib0hjRorEMJACELwJYXeE56dSheBrAzx82E
         vUsKdAn7TO5fYuEQUMWM2PDAdljwlAnUZcH35oNAjC5rZUbRSX2SkBEwOGuQL8X/XjhT
         f6RCfoweoB6WGgaI/fW80JyPnmy9Gtz/UVNjkZNqVeNdbMjmIJlLKqnJt/fa0Fi9Wads
         mHJA==
X-Forwarded-Encrypted: i=1; AKwUvBwfo9hD+GKfO5Ijinl9kWTO2IR68LmD2Z6QNsP8QxjCS+EpQt5/PLBjy6EF08j8KDwcpVofeaGebRhAA2o=@vger.kernel.org
X-Gm-Message-State: AFuF++klIz22XuYukjYEO+0xM4fo2PvGRwldaTCdWhUPV+OSLIOzCNcS
	ioVJGsZdUGD1/KzVWkZG9WL4od+lzQ5EKTe+9vJhsgldg8RlONa+R9XGjvpylcaJwNmYocKZ3nM
	FgQTeKlXiQyyTLpuP7ua7Um1JyYHD/x5O3jpqg7beMy9h0D8ijNAS8b7wEcd8Vmprnkw=
X-Gm-Gg: AR+sD103udGcKnJ62fK6V33ABd7D3XBPI+qdU06g07T/ArZ2LDfhbFNCRFSt6tyjdgm
	/iazGREPefLJ7yylt3o2zI8L7C4K1VACkosRz4ctkvkEjjZ8CjyFhV2jODO8Nz1FtV9UgpjrfdD
	Gw6eWIwmJPAt7njoERIhrPJBBxhSKcVhEt4l3k44IiRVV3+HhZvb7xFqgZzGvYF5uPbgML1WyE4
	ZCgT0pfkA1g/24K52HoiIvoFRSU/QKb1kGwN/06OjCqZVBmz1D62Ao5VIjv2uQQMU+7VSvhw1oi
	RtppM7pzAibftU1VPHk1yAapL5BnylgW8dbvj2tbGwWB/5/8V/LRf3KKAu7fNfEVGNCfc2K3VFG
	dv7+/ZP13TtSRw97gVZIiM2E0w2lSusuSqli0jqe8Rma/kBN9byCiV5lkDey9
X-Received: by 2002:a17:903:1ac7:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2d95284f383mr41119795ad.19.1788256281580;
        Tue, 01 Sep 2026 02:51:21 -0700 (PDT)
X-Received: by 2002:a17:903:1ac7:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2d95284f383mr41119425ad.19.1788256281101;
        Tue, 01 Sep 2026 02:51:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-phy: Make resets optional
Date: Tue,  1 Sep 2026 17:50:52 +0800
Message-ID: <20260901095055.42229-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k6jQYZuoicIxv8FTCKLXuEDANyuNvO8h
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96a01a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=J30188syTye5AiLRMCUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: k6jQYZuoicIxv8FTCKLXuEDANyuNvO8h
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX7rWtH9Db5Z8d
 p7/RdCtzMhDexKFxqjasSCX8zejsqkeRZQK2xoz/VzfB4dC0zSTVhLbJudsBAcrC+1gfcwqEsJx
 cO47fvHo8xMUs7DZWFiXnsDjCRqZ5rI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX6chk/xJI8AFJ
 3WxCngvUTe7eyKiEOOQHag0rORrq/FJWuvf17X7snTaMWcCZNUoNHaUSH8cZDnyg3BcTh6svyW9
 5mVagClg5xD09L1CI8809WmeNTCdeHdeVAeeHo+v/wf2I6rOiTs8qWzJ89VgWJl6vhR7UUx63bC
 D18ny4syDj7GsDyp071orfPCld3lEF4fBIhGNgJKY2Afv7OAj2sChfW6tsBnFVFf5JtPlNdTeAN
 Qpmk00faykq+spuV0lv+Wr9BqL97v4EmzzsWebuiDisLq+QPN0g9DqPuIl4lROMmA/Vcn8c6cMh
 8VaWD+229lBLdvCEm33O8UbaaStNb4KMMZL8kzHC6QxC50DQ/dGUEE1wCN0CfGXEyq0/gGteByL
 oZhn0I+DKij/i5vLV875Woc/aaiaQZQ7euY9ORrbQ3Xc4pI0uXtYZlKUPXfRS6BvPDB/m8zAHkI
 KKeiJj9qnlaM++8dcbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Not every instance of this PHY has a block reset of its own. On Nord
SoC there are three eUSB2 PHYs but only two QUSB2PHY block resets:
the HS-only USB20 tile has no dedicated PHY reset and is instead reset as
a whole through the controller's own USB20_PRIM_BCR. Requiring 'resets'
makes that instance impossible to describe, since the controller and the
PHY cannot both claim the single block reset exclusively.

The driver has always treated the reset as optional - it uses
devm_reset_control_get_optional_exclusive() - and the sibling
samsung,exynos2200-eusb2-phy binding, which is served by the same driver,
does not require it either. Drop it from the required list.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 096f6b546632..2140482c8e3b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -64,7 +64,6 @@ required:
   - clock-names
   - vdd-supply
   - vdda12-supply
-  - resets
 
 additionalProperties: false
 
-- 
2.43.0

