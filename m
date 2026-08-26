Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858BE35E1AE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763862; cv=none; b=VY/rfi8uBcNB1Z4NcF8wMuhjDQU+0kQgJNb4Y2g8SRT+q5XvZd1+ZqS4u5phhXWUOqpaKliz4Jn3Ibo1RHO8jN6+PHigFNw4jVCvStR3RdoP0lehvVa3sTayPRzLrz2OUm7zBGCdr9IzmwT7MFN5W6ZZw6WyJZedWVDcAdesGoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763862; c=relaxed/simple;
	bh=XU1ptAM6EfnwzxCKISypTLGtRTu3B+bY98zEVbWVya0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XAVAlU0CzrGljU0GZT9WhJ1zlDfUDYEceg8ZiXfhKS3dulQV7JpESuE/bIwacSrbMUhXRfyAkgR+42R68dDoIdV9w9ls1L4oMBADrT9OTfuLCsikikmZx35DsL+bB/ZpMpUUccYSg3K+sqXrbgYZ4Iz3dsyu+EquUbrFg6E7roE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2Ms9lGQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPfTtBSZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2Ms9lGQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPfTtBSZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGuoPW1310598
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=; b=J2Ms9lGQoNzDyXdW
	1jty+4rgueJGi4vXkfNZluUY8TTj7tMwOFbBDIeVODLIdsHjOhGrLbz90xrYmxzQ
	HViZhxIVHEgfBSQRo9s5TnA4LThVNywsxwHTsid4SFDcGnOExL6wYQZ1C8iHkT7I
	nTgon60/shyhhXco3pdsGWeigqXXVMB78nK5i22smYTVT01VadIorRRnltSVhxMI
	zZ0K4bNfWz6YSk7DTZYS7cIyvDby9wcWOm+5I8i8vXB5+3EfnZua8iNDaeixxMQA
	/EpWIXxnElftHrEFrTBP0ekRLZcIV7NQyfr7w6vviVPmByUTaN2qmcicaznaTkgU
	8+LXyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03a94yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:03:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6c166bafcso18695725ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763833; x=1788368633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=;
        b=kPfTtBSZr1SQ9cvilZ6uVXU5fULPT2kYcnMPyzrBZbqj2MDwtQ3koHj4i5ALha6idM
         ZEsfkeA8v3PP7Nl8Hu4YVrqp3RjZVSPeSBoDYcZFy+O67y/U2OVOtgpzYOy1717CpjYO
         OptAJHRyvgn36cgRFTvCUcysXqMuWZFG9A9fFfMXRFWCiQg+E8AcGp0Mvylih//kxPTz
         a+J8AZP3z1bBusqVMud2OZmTda/ILvrsqfWbHWTJqe7M7WjWsFMyPlh2207RJi+xPJYT
         g10zooIud8zDoBs/uG/seI5prWII/o7apx/SswHUFcVRjhRExVksGAFkfsKg6Qz/AODd
         c0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763833; x=1788368633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0k3+H4B1qpu4qwyjsM0FEIjECEIpbpZmm2blkY+EjPo=;
        b=GoNzXJPb/RflaNmSbV6dwVsz9jwXVzIuDhy2p6zr5lLN6V6vO3FMhf6xO9/FmE++nY
         xLquRC6xc436gEA11QRvPJHIst526iwrKhEcmBAZEQrMwDmX7R74VzEfG/+uWUfi9Ydu
         UnNT8yV3+w2YYK4OYf8p8DKg8acilhJDhPL/iBiZXjlojifWwnQ8E2lS+/rjGwSjx8+a
         tJwo6ukyMR0wjscrBXLqID5xg5/Ko2ueDmH8dR+BGrDZn7Cjo5sQE/gOaQNdvhyjcVtM
         u52m6xiNTe/1B5GZY1xwKTbFJG+IjR5Jycy+70rfXvwcweqlo0/GCwnNWxRdFzAlo7Xm
         0TNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSjHHjIXvA1Im4S2O6BIt1quDr6vXMmnZKMCCYMFROmsJP+hj5M8L2ewXSAYDf9fNhvUbPXFVNSmCz3Q8=@vger.kernel.org
X-Gm-Message-State: AFuF++lJEvaPf7Ie0+X0v25y8vujRcKiu+hAPyVdl0Yo4zi2R2L7jDIx
	r65HQnBNjS76/z65NxCrfZqFYKbbX33OtjuFOjSiPENiaznfsSKM/qE07eIfTgKxOIbnYJ41Dgm
	mFSS9HJh63jtgt79gAJ1qNb91h/HEUH7ULIWTnlOe8snKJM8UYM9bocUSCHrhV5P99jA=
X-Gm-Gg: AR+sD10ZnAxDU9E4RMQaURZyeL0VbKum82PvVsKshZjep38KQkYbqmK39MCtDYFCCDq
	BWPkrk8Aqb/u9dJn4KgAkS1MesJnKuGghhLUxcAMBDEKyQxComBjjdyvqTP/qq3aaROWWM3dOYm
	tD0h5OdCAUyBe58RUZyqOyd3RS+Xpgr9La2v5xpG0j8FXp9ivwarPf6X+E8L9YrJNA3kkkX8VGj
	fCqR9BQsoE8RWoLJoOi+daDzMKx/CHB+P+zbt4Mrswznv0YB9vDN2vGAbtgbZ1NYxcRGcsBcRbt
	e1ySg8wYm9TNYVUlm5Y3UBQ1Xx6SCdzEDaNk9R1+HCnLwqSvehWPhAxP5WeXhNlXmxUsOg6njZY
	2f5kIng0ORWtQwFCCejtKZF9h7evSc11WOTACXr+DW6fuEUn/GhNcn3y9m5ljx242jFbOkQ==
X-Received: by 2002:a17:903:3243:b0:2d7:2677:4355 with SMTP id d9443c01a7336-2d7267747a2mr9960235ad.3.1787763819539;
        Wed, 26 Aug 2026 10:03:39 -0700 (PDT)
X-Received: by 2002:a17:903:3243:b0:2d7:2677:4355 with SMTP id d9443c01a7336-2d7267747a2mr9926445ad.3.1787763806509;
        Wed, 26 Aug 2026 10:03:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:25 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:52 +0530
Subject: [PATCH v6 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-2-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=2226;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=XU1ptAM6EfnwzxCKISypTLGtRTu3B+bY98zEVbWVya0=;
 b=nRTL3Gl/PRzPtuvHmkGijqsbLBwsSkFNJsrC/6RaBj8Eqzt4P2wULurs7hkAe03n1JhDZOq//
 hRYF9nz4eFDA/7aNXVlgMEAMFugpOdBb37GFCakBXzIiuq8K03X5sXH
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: t0N2QVMIrTdCaFexcfRExU_ki5PY2kpQ
X-Authority-Analysis: v=2.4 cv=VdLH+lp9 c=1 sm=1 tr=0 ts=6a8f1c79 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YrurubeZKOWHlXb_luAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: t0N2QVMIrTdCaFexcfRExU_ki5PY2kpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX/AoaTWgBVub5
 vphWa96i6qhsVR1luXFRXm+vjlIM+4EHUw9gabazGmKId07OYXQt+wCqgVuKZdf8XsyrDpVKiMO
 umzcKdVSlvz3z43lgq7jNhxSc0E3WmUG9opwKmLHowemb3rELQJBQxk4TJst2IT7Z4acT5RLHiD
 AE8sdKz8h6MyL0bgIQ/P65kJXJDy4OdW98FqbCSSonbjknoSSUfVGCk++oAhw/sPysGfNZfrR6q
 rl/xJmkaPEuNPuflWMg1MoIrowbaxKwOD211wBVhU4UyPi53JeHJjcFpSc/v7wdR+vbN66J4oWj
 hfq762WnTddJwqIWrvhLqPHkNmLLQMhjsAxsIu2sdx2VwCArNYZhYVa3CK0yHExJbvXZLFQlUhK
 7ncnr1EfLJ+Kp8Uf3Rb9YUXcC7I+CIkV6hnbQJZmAI0RI0TRthvpaKhM2EgkOa0Ksk+GPqfJv+n
 j/vWPFsF8wkycmirZjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX/snNPdl8SJOK
 iFXUM3KX2HuHT8h4dCCgEr1uLtFbDweZupqjAQZ9xQFIpZQehwsyN4IpJ2+YcLfXhahUU8T29p0
 oPb67oCmxeAy+U0frkgcZHG6ieAmKTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260141

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode) because
DP and DM interrupt lines need to be configured differently for each of
them.

Add support to cache the PHY_TYPE and add the following helpers:

- phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

- phy_get_type() for the consumers (like USB controllers) to query the
type of phy connected to them.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..038c2b58bbe1 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -21,6 +21,8 @@
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
+#include <dt-bindings/phy/phy.h>
+
 struct phy;
 
 enum phy_mode {
@@ -152,11 +154,13 @@ struct phy_ops {
  * @bus_width: Data path width implemented by PHY
  * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
  * @mode: PHY mode
+ * @type: PHY type
  */
 struct phy_attrs {
 	u32			bus_width;
 	u32			max_link_rate;
 	enum phy_mode		mode;
+	int			type;
 };
 
 /**
@@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 {
 	return phy->attrs.mode;
 }
+
+static inline int phy_get_type(struct phy *phy)
+{
+	if (phy)
+		return phy->attrs.type;
+
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+	phy->attrs.type = type;
+}
+
 int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
@@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 	return PHY_MODE_INVALID;
 }
 
+static inline int phy_get_type(struct phy *phy)
+{
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+}
+
 static inline int phy_reset(struct phy *phy)
 {
 	if (!phy)

-- 
2.34.1

