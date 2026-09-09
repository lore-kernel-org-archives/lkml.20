Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CABC569F31
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963484; cv=none; b=bkjMhabb1sw+zu/tSWTCjgUP7eEIVWkx6BICiH8/Z1OjKLgQIuJ6HMtXqBE8SjpAxzLfcg8libaZtS40lv8C4lXm9My/kY8zfI2JX9Wt1In4dDLJzorb72qv/bFoAy7RcVp01mm1L235qWI//1Yr0ssrh8zrgtylqP+OxQXfYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963484; c=relaxed/simple;
	bh=c0cxm8DOEPLClpli1HmvHjC8bu9sqa+m4ayGpk0H/b0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YkHq4IqdPDyeFmdH9Hc1orf9hHk0ujW14PGidGQWRaaEpV6/bHn93L8migGZSFb6Qr37+PhNojzmzzKyGNcQ9DeB0QI/ZiIzeryXRUNrbpT1U82LQ+p4TxUaGJZ71DlA4ftNiJDjQ2KBBmaDgsoCHFA1Z5Sh02p+1i7KUVlraCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3Sd0IcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgKSft8H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3Sd0IcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgKSft8H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU27W1723079
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=apcsZg0PcToMRQMErCaGrj
	GBMFk6lJ70wquYVwMAbm0=; b=f3Sd0IcWNDGqqEPl6fZ9kvm82NXdz9l5KzeK68
	X0itKvUapiJNGTCiC+zbEETX2wV4WFElBFSr3ldTTaqH9PPWws7xwah1P/vvUg8Q
	G6DMtgZNlYyjVs72p5FC/40HczSWpwJWjE2NmXvbGk7v6mywa217u+ZGwA0O97oE
	JTbkF7FKMGmckwDJE/0cgzwTkz5U8FfMjHKI/UK8Go65jD9hJfDKFdNzyDhu00/G
	XgZVeEYMPogNolKG+npNCp0zwnfrU8ye+70X10CXEdi71kcb14xTQiETSMVISaPy
	n8ueZsgMGPL0vH+67RL+tmDq/+/3MuHuiIzUDM/UsPudkPRA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cns149-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:18:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so673001137.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963481; x=1789568281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=apcsZg0PcToMRQMErCaGrjGBMFk6lJ70wquYVwMAbm0=;
        b=cgKSft8HtxUJDvqCHgJPF9cS1nfC/eI69GVjVMYbCom2MCGM7C0wxGNfag1IIOvzoH
         QkTQ4D9ia1FzaXm3mfJUlx07JTPhqb5P3dw+boQ+6aSA/3qOxseqZ/SmXXDebM+n6G6i
         X3llHL7mEU6nCqMAWHPDUzXi42FygVtjbNIleVdw8Ud1EMErBcS+q19mfaJ7bhB7McGK
         8otKDSm/A0h4RcU59mHEe1qK8DVC0REffo15PG2g576OHAKJX6+nX9Ims/xD8aGTF2dJ
         RwICfSKIls44MWwO+iuhHFEPW4h/vyofpn0fpucc0ouvkD4wl32KEjCh+k56Uost9aO+
         TIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963481; x=1789568281;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=apcsZg0PcToMRQMErCaGrjGBMFk6lJ70wquYVwMAbm0=;
        b=Q3bP7dW+nyxYDUT9ALu+qzD6SeywdGIh7e7G4lppyM3aSJWaVi78h5SuHHBu12TYoQ
         dPJVeH+zA4oQfGDS2kdk6J6gvmyRURTxgioHn/dh6Ipn1ouDt311h7Oy33Z6e/hKsc2A
         dfJDfUdQgkdVOaI9HoD39hJxtoT86oq8zNtj4jBg9fs1oIBPHmpt95zVU5g9LRq5zAXg
         KqoMH9jbUS8k62FHKA1ubnrJvsz58Fg9xj0L6zO00XuOCPRaOE5i5+3fzgZrGGIIsfNn
         uCe19FFx7dkn0qL5TrH0sjwqzxd80vWBccuZX//fo28QUofXF6PNpxp4IjaZNX4hSt2R
         qCVg==
X-Forwarded-Encrypted: i=1; AKwUvBxXCZSCaPFwBi3LLfAqUAj8tQeNR8HYwyRMY9Sdk/j5rT+d0EWW6ez2RxsPZ4M6/qisSkkX4JYa8m1uzac=@vger.kernel.org
X-Gm-Message-State: AFuF++nlJVaBaUPr3zjRRgZFKfkMvuoLQsPnS/kpEFNRAqJFq2HH9VCk
	oTC3e2KcZ1KuZnUwUniU5q9Q+IG0AUBZ7oweIWaBh7IrjCWPZn5TZ0d3+oucsY4rSLwMKlUtzfM
	H/9xVrcO9ejSRW3vI6lFzkYK1cvc9TM9xQkaSKd8P5xy4RCZLu+b/HZJZorgLPHRIwZc=
X-Gm-Gg: AYBFou2RH+//rBODW1vHV8mBIZSZ2zWM2RHC5eAJ/tuaHuiWRqH/k5f0spIBn/szeRb
	MAwlnfCjobNd+ODzTzBWwQ0ulOkImrXsPDsOWg310bVJckCArTGCyOHtLdrQLNFcxJRWRCSc1A/
	2r0OXHovpMAvD5qQAtRJ5Ixt/amzUV8RpkcntBONAYqh4xokug5x9OX0ozxB8Kr5USU07StJ3UZ
	snjrfvNBs38Z3IH1ONY2XI6Yc9wnAJG23un2oRurFvY8i8LS4VesBRGG4GZQO1rIRqRhC4JPCcW
	uNAv7dPjsOiCrAqYKFSV91qB4eJHlr7pwHTDzKtPKxIyEfZ8+vtih31xtJ/z/DazwiVst+Ucu3o
	qqz8PptPeyXqpIWdt8waiqdk=
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id ada2fe7eead31-78a568a7517mr6302034137.5.1788963481461;
        Wed, 09 Sep 2026 07:18:01 -0700 (PDT)
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id ada2fe7eead31-78a568a7517mr6302023137.5.1788963481058;
        Wed, 09 Sep 2026 07:18:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:17:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: fsd: Cleanups with new dt-style-check
Date: Wed, 09 Sep 2026 16:17:51 +0200
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORuoHczNXxEPXRJnhtbRtEMY+
 3erHt/lbWCSVAzOzQZJVjV9xYrjoQG6hzgJKleDd75zgxuQs6GFp5U4IT0kxLKg5aSUsfUnYmL
 ueglQgyXJTd+//HL928o4C+XvCPv+AbRhanh+AAAA
X-Change-ID: 20260909-dts-samsung-cleanup-strict-327cdcdd68ea
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c0cxm8DOEPLClpli1HmvHjC8bu9sqa+m4ayGpk0H/b0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqRFO4McZz6cukP6b+AMueoMq8DlRFKGo9mR
 6iA1gvgMfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqkQAKCRDBN2bmhouD
 10WPD/0f7lIhTibcfCES5gvYPnDu3o3Lu2IW7Qj0PrIYjFjbilCdgC2nnk6SawIlqdW8B3uZTQd
 or1k4v6ReZma6X4auTwcYAu2UnN8Pz+qQ9UhOmCsvKFhXz4JsZmrm52PhlKhjmd1T/RbkHfmr4N
 byaoSJ00WrrwMFfIFBVngsoIsjdtPeK+jAXOcU2rY95Pl7tN3ieYeY1ZhuF38CJ3ed/CtGz3V1O
 U5oW3kbA6PPpLWMdx8BXo4B/ygsoa4HT7OdECpM1NSWRRO7BYcNFxuUhka6NqVz/BSCdJsEk0Hd
 Qy69mjaWuWy0xmqm0fGSutPV7f6vGoR6GBZHVHmLPCVoTrP76AWxVFIn9DzixNyxKiFh4knJZz5
 jMNI46DgssgiO+GH30qi37RClWfjvkPYPs8aNs86T8Tsx0Waz2O0B4m+lVJZdgmR3XvC6b7JO60
 ooza896KnZy9l3UmPw7Xnq3jozGmd+DXiqr3BwBdTAdcjrPXdxMlTtDiPplevdW/qmAtRtU5F90
 egTcYZiEIttSbJjBtciF+3zV9oZxR38kwyB/eyGwMrIlXPMT7044r3HQHjAUF7kLz2D0ghXTEL1
 8+029XgQnNIgLmvf6tMZ2diccS8pqoFOOAZ9znsfa4OVpL9DN5iWZIx41N1n0KSQRj29rFE4lw2
 2WG0kEafeOl+ncg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 7abbM97pswmOBX1Df0emmAjumqeJxO6A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXzi347yOOuFHP
 3X1fPCbbbHOFWxeGBkY3wn+M4aprNBn9KHqV33dBWvUoCGVU5YARuMx/v/wnmI7I4EylZxWCJ/9
 OX+xFAhqt78Zo7fiXX6NTkzVEbnFL/U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX9bHRlBjyJmJ/
 //mwa2YEEU2EUkuxhFYWoAY2z/PzWeF0UvW2egXz0VOGVRAk8yDCa6GnbgFYQ9M8gZdIAMjji4t
 LPfDVteW1KPCToHme5YHoFHkPIlERw/aoF4UdTE3tnXuv2yytkVLEKAMfpke5p7D26Z+VFNB2Bj
 Ev95qQ4KQpWFTGaiw2J7kzAP2X5iQ6YEmMxR/+T3xWW4L1KXF5U9eRMdHqajkn2fGxha8BN7OhU
 1UqIdNuX1Qs/ixmMUGkjEDY6cUCL1HIX08bAy8uEeXRALXr7/dXyGM9CZ2AJ4rTeHvBae1OoXFT
 otmkty8dsO+b3uIDdCvWltlHCMxFhglJFUYAITkXinjn+d3PXnlKOBoQFSbfnK6dxlZWAYJn+37
 kuyYv7/RS/2+vIckz8kLbTC6W6q8NMKZOhKxJJbogod2FC0go2TKrAyg6MV90XqAa+/t1u8vAJW
 m/RvKU7LKsEHICdATbw==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa16a9a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=13zs_1EsgYwksEZ6_G0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 7abbM97pswmOBX1Df0emmAjumqeJxO6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Only a few warnings are left

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: fsd: Fix indentation of CPU nodes
      arm64: dts: fsd: evb: Correct node order
      arm64: dts: fsd: Move idle states out of CPUs node
      arm64: dts: fsd: Re-order nodes to match coding style
      arm64: dts: fsd: Re-order properties to match coding style

 arch/arm64/boot/dts/tesla/fsd-evb.dts      |   10 +-
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi |   16 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi         | 1162 ++++++++++++++--------------
 3 files changed, 594 insertions(+), 594 deletions(-)
---
base-commit: 664f1ec11b4dc75f6de70a52e8219f812b6e57b3
change-id: 20260909-dts-samsung-cleanup-strict-327cdcdd68ea

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

