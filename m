Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE4E47ACCB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256290; cv=none; b=GkoPkPzsnuoKMABDyb6SnziHx49ECNTRizCcYqIyFDfMbP4bOeef6agCZHGfx9GZxot1ZNejxUGzh9bOL2A9rBkIOwUeiEMp5eB7rC383lQ3YHxl+fUwGZBT8/yeQFKSCHIpnUrdq6jU8zKeCknSvFqbwPyB5uhWXXzLPt8k6FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256290; c=relaxed/simple;
	bh=L7RQD5/LnUNN+s/Jecjvx7E25e68IWUWZrpA+5v3D2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJg2HcLtJQZA1Pq1B/DjWXf+SuFBwacew0n/zbIo7k3Cd9xYBr1ic0oWLQhvBXA14E2h4DynLA1YxW6J1BcHIC1Zfv+DR31Nd4lHv6Og9ycrcxeTnveEFN08nMwG4VMh0NPdJfp/vW6Lp6UUXkcTqqcz1P8oJaYZVfiSj2RBrjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZGq4Hqc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFkJ1rvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZGq4Hqc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFkJ1rvj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179hXT1812024
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jb50+pYjwgA
	TQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=; b=QZGq4Hqc4YPyRrfbLWdCcXuOA8k
	CdC1cva4qKtMD7gPP5Z5vyeEmXphN/AisMVePoDd60mOuhK3gQqevGi0XoGdgWC6
	/GuH+rqM2EhBiGKMa7wsRx3akHcSnJcZwFhG24P5Y0dKt/ohP8bAnKu4g5GzO/fQ
	XrfQOqtkfNZrsdnvKHtqJOt8PkbkzVPfJmg2L89XUm+BB4i+I4dH4i1zFX+uK2w0
	SWughQsGEK0h9hjQS0h/vbVREiFDJ1iZaW4Ux82TCeNgTfyxIymsUQa40i8fEKCn
	toRUmTnP1TY0SgpngHFqXjyXo8egpSybDKAu1ImzxQXgB4YnJyVGzMhJT8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dv6d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:51:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7151120d6so22988865ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256286; x=1788861086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jb50+pYjwgATQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=;
        b=VFkJ1rvjxczmKII5G647YGAUdcuTnA5PPHx5WyVkn+3u6jGGiWkvKXkblnDztd3I5A
         wOnSmxhzZ4NdY+FxHh/VEBXgVUlnxNkdXay+AFP6rNqcBxAKAbCsxTlXzEMAv5+bIK8S
         NuCNaeblzZT63iAYn/JY4m/staHJ6qOM/aB6MeJOiyETPMYTpiJptnCdky9sm2R+LRU3
         SOG2krbZBV6XqMTlTgIHIFoB4XVKIn7PDsGq6CoKGQ9oNss9SzQg7jTQL8XYco91LSYG
         8lnRc7bfTCXBDquieFUsrpxD3oGuzCIggb+Cy4bBXEt9BBNs1kIAYsHKnY1SaopWtXRk
         Kh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256286; x=1788861086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jb50+pYjwgATQrbLAr/ZmgQJVjW8TG6fm693bt3UZ/I=;
        b=aXVMaZdrT0Rz4PAELcHxrx1RYrdhm91RNJyquaRJHVkYQShJyq5e+8RO6XLN1+09qn
         MW0LlPKwgsDvphG93fOgDJUGeeFsq1rSmUUJG5U5iWQxeTleE3UpRElDGjVBrZc3INv6
         yVmtTOw6us8KOFN4iq9qEg9h+BNjMFV81d04W2JRiWd+zQnR0I5hbWEpkc1JlynMueXw
         RnRRg6as/LSdT9ZCN5cZg9YvSg29RjFnTZrK6OG8S+91nbzMpX6fqqcjXizqgv2nmwJc
         73xy4bwlX8IpbYXcjEQnvZFGErgHDrwNiRDIuy46qmfE508Ay5mz2EXBiUa9CHM7VS6H
         4flw==
X-Forwarded-Encrypted: i=1; AHgh+RqwusisvA4xyUpvR7aZXGdAHxJZ/Y+f8wtMdtLGMCqSa1H0Qom867JRLIzFgq0mod1K1g8jD5qFRiOAgKg=@vger.kernel.org
X-Gm-Message-State: AFuF++lh2STi0L0qoJDPSqDtbhInyrFdP4bp62wzFhz60ashG/EtSPnG
	HjalkkJtsEA95AFfODAM+axWMkCof0APDCBuTGnOJO6lPw6Hg/8pMgQW6OX5yswFBKVTpHVK3Us
	H7WPZBmX9KYVjb/RooXVH+5KFADw4zezEIYq/5Sy+CzurddaPV5r+k9kGg0OKxXtdajM=
X-Gm-Gg: AYBFou3x1D0UlKDCmEOniL35zf1eOvVskDHyH1s9tbO9WVubB88b0WYESwVZ1Em5dVv
	/JZhN68rOk9hEkx8yGj8k734fXqCzhpf8yHLU5SRY2HA453+p8iJjZiA2V1INnrvGS5neckC21U
	tSV9FN0JaUC/GBIoiLuTi3m0k7bRov5qC2+qQcOcM9qaqM7TFJAd62BoZKtpEAuzY92og7m+i5H
	J8KpKdIAumMTg69FcTREy+a5Geo167YFEI4969DEWQq8UAp84Gm+yMj4mizlR3i1dSMM9yM9mCT
	voAaj7jGojtjlMR7vshOgFKqP++7sIWDJrR55Sp3ITTUMZYQa1b5Yqry4Q9Zm0reI1TrdUZ9Dq1
	ueO0rrY8Rh1ThtedBuTfZbA2Q1Yizz8JW9KW5hNhx4vjys25DWeSgH5fCYxJP
X-Received: by 2002:a17:903:1848:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2d94a96836cmr113815085ad.20.1788256286501;
        Tue, 01 Sep 2026 02:51:26 -0700 (PDT)
X-Received: by 2002:a17:903:1848:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2d94a96836cmr113813925ad.20.1788256285941;
        Tue, 01 Sep 2026 02:51:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:25 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
Date: Tue,  1 Sep 2026 17:50:53 +0800
Message-ID: <20260901095055.42229-3-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a96a01f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aaKdBBw8xNbH9Tj6BHYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXzyxDVySay9kv
 UQyr6YBsBAZqy7RIl7Z78dZxK+ewAoizFjHMtXvBkir/8NOaaOkv1gfP8DTCKyMX1u9zLAQcqw/
 lGMYUxWMa4ybKwgkZ/FQNLNs+2+WVLlDzsWZkOReolYJ19tnmldjZ0lKYgImgWTZzQyLHb1uoxv
 5GPYPZvpJKAQjtmvJE3VzlhnHPA7R16uxSNYRp2jidCCk0e0C6DxAOtjE5sH+5m+LZWGyyEVDjL
 GPaXJd8313qWW9WrpfNe5pruzNfSjx2xCisiLHYIS2paedFAJMTxzOCOZZRyWbQIo7J2P65POM0
 ovISWxVBassuvGBuWtXmgd52MKBi28fDeFSZ7GnhjHt8pP+79JiipLCvgJCjGBwXvhH3U+fNVhq
 d27goP9wb3V/zUZq0mdgak/ccJb4JQOzLzgHdHBXMKkw5OUTbJG4EN5imrvqG+EzE9+gjpd4Xgy
 mK/ML22sIWoeiW/x3Gg==
X-Proofpoint-GUID: 4BpdBuw8h1Ch75DJGVI2Irt_WxGyTcBl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXyOylB+INlcc4
 uqYA1M9PsuM1sHVyGQNOif2KFIeuk1gFdtVgdT4UZOK25z7xE4d5JOxNffxkXcmiK6jzsmvuRsd
 Tb/UBio8bgHPu37IC06WvlCAD9qIZaA=
X-Proofpoint-ORIG-GUID: 4BpdBuw8h1Ch75DJGVI2Irt_WxGyTcBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add a compatible for the eUSB2 PHY found on the Qualcomm Nord SoC.
It is compatible with the sm8550 eUSB2 PHY.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 2140482c8e3b..7fe8c82db38d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
+              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
-- 
2.43.0

