Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE643FF89F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661646; cv=none; b=GZvtx/eijJ54M9q9jJLQ3pWte6stct8RHXEL5EbpUScTOfkibAdTv0llGYuJnMH1IqsimjYyj64K79lGN0wjP1k+r0b96K7xLV36Et/CAQUmCYc+93Y8Tm5M6hH8VmexHYYz6EfGE+4MAGIT/VxUib+8NnPX7QlsTO2y1ZYbOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661646; c=relaxed/simple;
	bh=G3am0/a/Ijj4U5pm2yL6WwsTqv72Q+O6M5TIZ7omO9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJVgY5MCjyagQxaZTe2SDu9P8tuHDCBIoe2dekwD3WqEhetHHJfk1paGyrYN+WSt3VaEQvyzO2uvc/XS4Jwb6bErXuqUtu6DqhTdCx6Cy9n6Ax0cdu79clfkhVvze2Qa62E9ymkE/3yof5FSSJ8qF89dYhkMVs+YAMRfZtiVfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9UZRBES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJq1VUSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9UZRBES";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJq1VUSX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Kko3241632
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=; b=Q9UZRBESwxa427iV
	zYcF16rx3BgqMFpAnE0UZgIdCn8gHcyGim2mxeXkEl5VNuCju6pwR7QWN/eekE4Q
	4xhPF9K5O+4OKZmoh1340bjY1oQRrvex1FHGq3fg+Od2t/uHOXTWLxhIzVxeNSgX
	2jID+6PV1tBxFaFUu25A36J+jepeio8Jfn+1W2XzD/J5Jn8i25RLHo+lGTsKpqrg
	MzGO8CE2Vk88/GpLm/y0BBwgJtDS6+OxNTicv7L1/uS+MseGQEiRrUnVtsf/LwwF
	ghNWk1h8QQFgXLenKshoMo2nkq/uyFd42n3GOY+2dZ2utxSU3CQBougBqS86sil9
	UShzJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144sbk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:00:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so593782a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790661643; x=1791266443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=;
        b=OJq1VUSX22gsT5/HBu+fS891iGNbOchRKfE7tDCWnbBmAaEm45FIjA8329/jZfTwvM
         MtEOLpZIBHa4gmdWxx8rYbFKmf6NxvxNARbr818TOFe1P76ev5ftCW3tRO7nbNDzczYm
         QcknSO88ZnLldmUkcZooIbhylFSFpj12aTUeu906hsnAjOGcCB/ZTdBmY3QnoX5VZQmU
         2KTklE7FVDMbz+uMo/DoQKBN58Izkx7pIZmTo6Sl3RqZhps0bUZr+tcys0zhwOUierrR
         3Jbr0OW1U/bbq20bPCBe1OzwfCe3w2YFdRACFAs9wYitu4SozjZWsylIojzW9Rv+hEbl
         eXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661643; x=1791266443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSSINV+dZj2OXNz4UWPYAT4M/ULxuq0D3kY0/YhDsUQ=;
        b=ppgpmokOOpJSb7p/6D0oqK1t3aQdQivwyOSv6ht9OMe1P51rjwY1fe96ZTxT0Bpi+r
         aG3RHWJLD8b05elEKl+OzFjEY0ZQAotEBeJkLyZvpz3OgKaDW5r+mHq0TyQQqrVvOTUv
         dh/U7fS9OuxXqOzKvy9AuAX13/gV1J+/zSgdyO5PHDqxkUA7PnIiIBhV5AvsYF1CMfju
         +kH+95s8Ivxe5Cit5kPlCx0aMTQTAIgFgX2RRRewmMGbZGnMhSI+TLRYQxo3BkXHUnt4
         lDlyuyh5H6NBWWw6sWc9p15bd5YUu2juYnZSgHgYh1XYG2KLVjRFJr94i296KLoQvobV
         KMUg==
X-Forwarded-Encrypted: i=1; AKwUvByl6CUIkGfWRquvOxP7Qjg7vTPir04GGymvULUMDZRjhpD9mVWDZRZ2m1idfW8kyt/cLrltR/fo4CrmXgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Bj2J+ZUSWKutxAqF+hGMZ+mGKd7dzrO0wvKGFOC4dGLNFofy
	IT90jUYLrQvnxaipMg4S1OkJnlsZStoBY0siD03NuEzCe7O2tx7It31WuUAWbkrddfl/iKbJSQ+
	Djylh/g616hVxlBJrcO1hHqtKg2hOGemwRlA3WpWIFHv3zt3gt7KHKQychj1id4q6UDA=
X-Gm-Gg: AYBFou0uv09UldXRQpzvNhDjIYZkntz27urL+X5xQiz7hTH9A9hMp41foQJgbCznOBe
	QAlaccZSylr6bl/FFGjv108QBPqZ7VJPcswaD4tgzb54EJqP2yOxZDAPTrC65gELQqYs6ctJ/vL
	rft1OVNSITwsFh+3vjyA7gKz+pfcWZOXzNsdzeW2CkYLJTZHQaCfoGG7n3xKFG+6PA3NWR37Zrd
	XMW7+HfRtrun2T1zNFB9Wvik1rVP4BFKLV0jwVHz9wSGDDlku0gnytVDrjhcNJ2ZhmBRIZuOpAw
	Jm0kaAoEqNpIeGBNHi8XV2RMNy+TbZpmCgWOdaodgjJI4JF82uC8UwksrybK4t9QdkS8dh0Tz5c
	RHH2ugV71axRmFYIYjdjVsn3m3sLUP8HY4LEPL7wAFX9XVWOE2gy72euLJ75sGY55lUeMMeLMyT
	YXdkuZ582jjA==
X-Received: by 2002:a17:90a:e7ce:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a098db8c10mr14573794a91.43.1790661642638;
        Mon, 28 Sep 2026 23:00:42 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ce:b0:3a0:2662:815a with SMTP id 98e67ed59e1d1-3a098db8c10mr14573757a91.43.1790661642186;
        Mon, 28 Sep 2026 23:00:42 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm3383588a91.8.2026.09.28.23.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:00:41 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:00:27 -0700
Subject: [PATCH v17 01/11] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-kaanapali-camss-v17-1-dcf3fd37f76c@oss.qualcomm.com>
References: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
In-Reply-To: <20260928-kaanapali-camss-v17-0-dcf3fd37f76c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX2P9L4KY1WSxw
 DIkgEMELIpbuhIzCSr3A4PRuDadk1CxqQdR1zmVN8cOlnUduC0NOwjGDLzwEgxzve9TH532ZjvF
 GJFiPY2KMVCXZYNQRxOu7KGtMiGRDDo1Eez0ZnBLnXSgunW7kgk5e9otY2InKzSt0atntjyt3Gi
 ZXtmvycwGCETOymTgb0ggR4dyYIdbGnrHWTMnEhqMTuWO302B7JzT+fiDQ7DFGts5nuvGCyOmGQ
 dkNoF9YUdsfwo5uDSpbKdhHwnbRvgP5trWL9sKO378Y76GLaky8FtQWr3v+9ZGpSKCTsix7FopK
 3dxseA9eA7d9SxskVfWlugXZynB0cjFNA511M/qkm1ke1+EfARHz5U8Jowe99ZEQVt15sWS/hvn
 F7uMzKJXlYwjP6fJPzgmQ2BOzL2n2inJOwefB5bIIGhMjBBHS3JdOW/kKLSYZCBsf07zyMqTewE
 23lHMdmpQz7s1K8nXQQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb540b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8sc_bQFcTW-iTt5i-CEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bBnFSXhjHTNgsYH3U9iTBq7Jq--sI3Jc
X-Proofpoint-GUID: bBnFSXhjHTNgsYH3U9iTBq7Jq--sI3Jc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyMyBTYWx0ZWRfX+LHvL5ITbc1A
 1O5soIXVzBBAhSBZiEvvWOZiyDMkWjyeSJCl4exx+hr9t8QeXfT4WDEXQcDyVW2GMGldlPZUqj6
 sP5e0iPaMchSNRe6XWWvkGaVuwfPEV0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290023

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c..24ca06b97656 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    enum:
+      - qcom,kaanapali-csi2-phy
+      - qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

