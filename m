Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370827;
	b=bPSyrY2xf94L4nxqSMX7+IVrpMPdNl3bC6a5n5LMm8Gn9zHFTre06GVwYZZsd27CSmx8
	 UCxYT5Mvh15WUt0keujMyZgSis2OhxqW0Wk1AUQ+rhDMFzANtILXHkPnOFo9/rM+ZDv/l
	 82QCeFfHod9g868A3N8OAzYSiHApu7LtHp6LNI7fEScRDGF0lk/e7tRQz0ox8wMVvPzLO
	 3+lxYk8uMj130SjkfDzWuJlaKhua8UQgYTKbsloXWDXP7HffWOUnI9kfgonW+8yRYGU9b
	 1Nblc6048kqgvEMjSZ+YGh4v2v8DR03QKSqoR2EREmVOuV91QBtwTgxknm6zldLvpxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370827;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
	b=pZclC0BFQWTX3yac4cGMU8nyXH5QyPql0G9cyPm/mmQX2RdsQjORAyXOVlpUtWr/09by
	 C7blxIG6YImBLqwOLn3sPUU4VGEmRsYdY/czfvdzh8oQvR8SWSCtI/Fykwd/0wuuzqS8B
	 J7visKix5L6GqzUVl3lBu98gLBx4gL5ILpm3gsjYEqym8lgHltlICcnBQokK9ieYlZeHX
	 Qq/TLXcYlqHVMDa83V5IXgsCKYEzVw+0coDyGc+lLDp/62TVoOuyaZWBY7cvX5hKUXna9
	 Ji/st7vbF8EfRQUaaHAe46lZwfoY0fuV4LIHoaOmi4rOt7V/LHGLNots/7+tPTMpeiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV7N11Ml;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RICd1rha;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AEA606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1AEA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV7N11Ml;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RICd1rha
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB3XHMs1176731
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6VnyTbD/yi
	L2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=; b=PV7N11MljGmeoTMURIC+lfZmtQu
	2+X6oNuhDRpA8aHtgZ2L+nzXiy/PhqYS+0sTSNzQT8FwaNUXvhIR0DVpxSI+5MTe
	J71UE7DOkL1jnxoo2a7vfc0XUXA0IIQo5OvuYOYLz5B99vcvKdKLEdNDXxIas1rs
	vlaUOlQAHl+KqO7+HaG1uhXBGiFrVTJHO/RSqA2sT2qnTGrhZfd8OGnwCu0SnSXz
	9JNZsWtWt8hAq6Pyfkh9+GHgqApKSA4pGHIjAsEpIMWtamEsgEmgzuxL1zbRb5xH
	MOJ/1zCV4Ak3wDFM2TP1Y37Dg1wRla3OlhjHyh5YjMkdYkF+maw9vWGOxAQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdg4yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:26 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b5b49cabso2444835c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794370825; x=1794975625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=RICd1rhaa2rM3Bqgbv7ad7wmLHdSmrkkaWEUEBXJn+QBFIDTaB8+KnhPFo2CF/hGNU
         IEJejAK63TnCJ/m0RBxYBd7A9u/x2H215ZWdyEu4qosJDC2deqs6+Nv65ao1vsiaSnI4
         2yjFP/VZ/gKSImUDkPQuDAcgy+CCoZP/fkuRc28FVpK22vRirConqzmkpEMYohcP9Phy
         7/Nb5/nunrfOEiere9GT5ZN8KWuqajKX0ixEdbCclkVEztY6+pyhsZn6Q8qk4Ui89ip/
         h4oP2HX848p+k++pbsSovebdkEDD6UpelKhxwZOPg6oLsQU14nYjRSXGeJ1qGozm7T/p
         Teqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370825; x=1794975625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=wNG6pYFf7oRO7LBDozfJedGVVvY4j37Q6uf8D5XSfWYjZ/DdQ9Y85ATop2ryjSP8hw
         kJhVsee0p5KNQRIck8D9EXC9J/wTzhXS/0+bz9SNnjF+3OUKa5c99nC2f3jxl7dhLiHW
         lNRw2ZMEKh3v7xfL60Hph4Bl2HrD9HWW8adadYT0/MKRo0n4hOY7mb7PIiI8fAXKWrg8
         Fr9XP2TXifOohfWLXkW0XjEQn7V/qv2AOlOZ4sY5+bJIl2GfGsoLAgjzBS16Srqd8w8s
         GyMi3pueeYG8Ed+AdKYvYodsTHPEKwQ/Gw391fB7yh6gcflyydQ5pQDly18VJNqkyFPy
         oSqw==
X-Forwarded-Encrypted: i=1; AL+hErEfvd8jRhu7a8d0JvhvenpUxOTqPdOcAMWWzk0ZBApQ30R5MPvxdBT56EIb5wngi1hH6aOEa5vSZmQ40dE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UI5P1ZjGtGWP3BuTNIvayOZveJ0mA/R35HBw6vsqhPIQckI5l
	hmktKRqapkobYDrQCOZwQP7LnjwsN0HSWBGv3VLgw1aQmwLuJlBRcrYZ8pbrCzsoVVC4fTo3MCQ
	dSMF4lxrIXFYGrw3z0x6eTpUsKm23cGqa75N3gcryBnk3jLOlxScg1VV+Z1yToHo1XBc=
X-Gm-Gg: AYBFou0M6I9Gjkgi+7t40bXS+xaFoXH4egVy8HbvL9su9IAdyNJsabiS4L+kt0GIdhC
	1LapNFJjsc9ZUYnCTXme11nRlc1T3/knG9TGwM/2Ob86/ITB7399LBM7RHZjw9rNymrGsvkPjKY
	hhueK3b/ODPaLZZNU2atHkuCwmZ2/RN7suRS7PuvkFM+Sb8ywWbXDvdn4256DXGdraes8nh1DCO
	hdsnqDXWxTo8I/xxCfmQyO4DUdLWv2/xp4BDeKYGbKFLe2HPux7nObF0GQs0cCnTzXju7fM6d2X
	v5+pcSZ3LcoWwbGNhs4muvMk+ZyzeBcNBEPY6ycmwWVOHky/1tpaPRJrsH9p9rahDr/IyPmOJzx
	mGCfKiWJv/OucPn8Geex3TVCJl5/S9P134zOsyJvufzGOUezt5GSF5ED6Uajs2/LdVQAMtOZPjn
	Kqh28LiYbsaqihgftVtwhfU4Og2hrrghWF
X-Received: by 2002:a05:701b:2212:b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b3c0376554mr1193710c88.42.1794370825394;
        Tue, 10 Nov 2026 20:20:25 -0800 (PST)
X-Received: by 2002:a05:701b:2212:b0:1b2:cb38:5412 with SMTP id a92af1059eb24-1b3c0376554mr1193689c88.42.1794370824674;
        Tue, 10 Nov 2026 20:20:24 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm21690542eec.16.2026.11.10.20.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:24 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Wed, 11 Nov 2026 12:19:39 +0800
Message-ID: <20261111041956.3639092-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
References: <20261111041956.3639092-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af3ed0a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Pbp3yVwj6iIoPtAh08QA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 7mHy2Y6N8psGaqw77xPguZNI1IWN2o7Z
X-Proofpoint-GUID: 7mHy2Y6N8psGaqw77xPguZNI1IWN2o7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX4dxH+OwXC6sY
 B8ArYneyHM5b9ZIRpVs9JF1hgLgKkEPoUHl5BH8LqQXRp6TjJ26CR5rvjk2sxiM8wp4xvmt7KXC
 KlqfDv+jA7Qi9FTwYs6SM/hTmGubhc4qUs/nE5JCw+2dyR3c/Wi2eMZ3RIgbPtKzUF0GxphhxnE
 B61P0P70hjaet9UdCVs1Nh0lPpnpcpO6GlA8b7ESw44O80ShCyGBUNI0nw/JCwLcXyUKebdYsjy
 /Rm/42bRWQrVwKM79sYYMZYh21xw98v/5fWPxZq8EwCGZDFSHHgsgaLF78W4cDmBzr3/TcK7QbN
 qIi9gkVspGIka03UFkwPHjdgXDYYitGYe1W5ubyLHvUBHqSxExs7pbFFLLl/P4BBrIJJSyhvXQj
 mwL3Rdzp7+bypsoRsjKRBy4V+UYCG3Pt2qHd0FbN00eS/sJUHEkcoDy60vxl6kHjyDWrfLC6wyb
 8hfKYIB/ss99aldSNCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNyBTYWx0ZWRfX3u02kFRLKFch
 kytrR5cwPo7FQPN2tJ8RoVnbY2XrzkpF3Oqe0/YqRjsYisBSQAVClOXmkvETRHLDsR2wbRjWEIU
 qZgAalYdz0rEfLDXRACIBUSFgPSFEwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110017

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

