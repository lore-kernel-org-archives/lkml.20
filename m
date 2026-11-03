Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720480;
	b=Th8fRRbGF5krGTj2pwwminYbDr9VAJ9GcXV7OMDBbuLIN/4SSwDAf1h9+np5XZ6SMwZk
	 CAOPersX+2w0L8yC/4m4y9b7k2JoLNI+1ngcxgBEfsf0+ZQrTVICuTgluOjMPZX7lC0SS
	 13HACcwDY0Cc3sAYilKMvfZX3O2gErqTNj4AbvwRWZSzcPtMK3SL3lnanJTapAYgD+0+Z
	 97B8UrJ+vwOIM3qTYjeoGUEw/acMqmP9Jj8AcbHlavi8AY3gJ/D2bZbSQUi+vz/IPg0Jf
	 eP9pJPSUIl4JoCKie+exJ0Ny0lMmhpJwLqvlmxI0FaUfJ8YZ6D7FFJ4VzE3I2cnONdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
	b=LCZNQOF+lYg7pqofCqcKjinGaIKRpliPv/6cQFK1jiqkvlglVFxHzBpS4Pj92RtotzrP
	 a50LoXMxANR5o34NxwnfbgI9D76ZOcePBD3kd4u6dmuoKrLerqvYtU4ii8eD7ajQnz4VB
	 ojUfYJ0rTBCx+uGCGa88BNVvsKOqLoNwkASOYCEqqtb1LoLtmbYn2Lg4UeZpnVAWbrFBo
	 bx4gmFFfu55YI3qoPEmXtPVA+Op4wsQ9noDDng2XZJKgk5Zd27E88OlJjbFMTosyDwjlX
	 s8y5Ue0ePf7LZV+3JCw0v9I2QL2d0PpIZQ9vCQSWY83Uv5EEous+7CNE297dUPI1o0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nt16aCb+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D7JJyh6d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88BE606D818
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88BE606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nt16aCb+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D7JJyh6d
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9wME2727725
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=; b=nt16aCb+ZhhBiaQn
	sy1tCG1K4A3vKg43O3NICLh4CMx6gBopwGBq+WuzbJWZDYfrKq3jL+ZExgOzM4jl
	LnWKnW4LWdbucZTGuVzO9iew7Q5yM5b0F1LuZNIq39PtPkmQkiNWI5wPItb2LMpN
	lIlPtcwJoozlUw9+6lvfZ/9Q04oOqE7TRQX2ZFZbW5QzCpr3aDMg2MnSNWyLEGNc
	ChozJZdxuaZaW4YkiyDuyXzPpIa0QZ75CIrubiSymwPLZbV/iIs4b0sIzL80qo1n
	GVzTIRyz1GmHO0bvAOFOxUq9Nv9PNm7YcMHJ7iBXhjrUnu2sbKm1dreYhrIyv6yP
	LOypEA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bgdaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:41:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso2297607eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720477; x=1794325277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=D7JJyh6dN4KOp7w9MrzT9sYd7s+xHBWzwzYckrnhcdUlidZeCDX3YmCOmS9EdYcbN7
         I1bsWZAqKvETTcbiQpkM/xMm0G3RPCh9hR/vgbLYkcuadUQea6t9CVAWsCfvb34U3+Q/
         WpV1BktBsOUMwLeIG6I4guDcqK8e4pTNiUVM7Fm7hqso8vKEVXjW9jRByJM0OyNdMrvk
         tqQ3Pjokpn+0e9i9hzlnzUdLAyph873VgBAFJabijQcvROJyOPguM4E0CgKwRbADX7i6
         jFoKAKxxgZ5fFvKBOxpzVhxrCcQysOZxu+M+cL9fjMaqxAX1QdKHL8bX0G3dIneMtau2
         CXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720477; x=1794325277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn7g+ecg+pr4fRw8wEKdLdBlRPbJsgFxcvU1mUPI6CQ=;
        b=XtmwSXlfHID/1RhFMBmfb/s/B8DG/WPYslto1MvOwj+nmu+QS9lFzt3Fs2ODQIbHGa
         VBRhHz1hUsaf8LcauyYTODbrLX1xanpiRwMRc4CTHmk4dSrU0BSYDP9y7neRLx6s0jP4
         zXr4rHuKyJLiqiM5ViLZZHDlohdZEMpOODwQZFPXhK0O0cICYrkn7faXbNTAHF0swtGx
         2ahVIlhF4oPtifYZzGgDgXwAMBECinG82adpdn8eNW3Butxfxlk9Irdhs1+4NT+ws4NS
         4ppuYdfRrvJzfH73fWHSwkE5r/y0kGRjqQkJ5FO//LEH10wnKW5y7WPSnaQJ6F+sjpWF
         TETA==
X-Forwarded-Encrypted: i=1; AKwUvByyMTjs9cg1T/nOuKGP9Ncru5WQ/LIm3DNI6mUcOLsZ5dmLe280PHCC6fV6eRPT7BZ9vYc3tD6Sy9n/eH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+haWDEnf+yjicJVXBWXqLvKJJ8Nv7SreP+EZA1chZa4YmslNwy
	/cvWKjTzOaAL/z2HqWkr57LOiflGTAQiq9q4eVrJKXNvG1mlKtkWBwv84l4/Gvi/v6G7hirsnWw
	oggBJQuF73wRcaBbmhGvUr57R7nPkH78gCqzdL+i99BLj77b8JoOdcY56IvYjcj8nuyLwfXuxgm
	E=
X-Gm-Gg: AYBFou2+sl5OEXvkPaw6QogHB9ItH4oNcNEjtBPDfhP38TEiR9vQrJCpu2Z30B8S4GR
	34CCffe/vr6Qfh5G/JKeV2pndtyrtWjYv6bUjBQxqRIH39ZuPtRiUvJlUjGiepBu9pwpIgE+dQb
	RoyJUGYW66UvJ/4iTpxrSsR2jaNxYMPIGVUcMpNR8p6pgB1YiCkJ2k7Jq2P2WConxe7IFZMPWXP
	hD5uPENFgI8Ya9bNknLekzJlrm8mzgHF7bTy5gebEFzsXft2PmOkPb1fIVeOQReHWonsxJdJKk+
	h5tqaO3+acR8XKfMx8OcpPZINxezcKQuQt9uB/oM8tI/fjIQg4wlXaKAxXZ+eAP0HaCcRM3EKpY
	rwmhddKm0CrXe5RkzjKpnC+WjVEmc3SOA0ljJttRlE75rpqRCEPDbmc+nnvCpljw8zUp8WTdRkb
	AqlPvMWWh8
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr20095872c88.4.1793720476905;
        Tue, 03 Nov 2026 07:41:16 -0800 (PST)
X-Received: by 2002:a05:7022:f517:b0:193:9aa3:4758 with SMTP id a92af1059eb24-1ac55968b07mr20095804c88.4.1793720476236;
        Tue, 03 Nov 2026 07:41:16 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:15 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:32 +0530
Subject: [PATCH v6 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vpu_iommu_iova_handling-v6-1-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=6195;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QubAncHhhvP95+8S4/Hf0daptJaGxx+rk0qFwJM9cSE=;
 b=UEnMGq9ltxZfe+efuJ0SQNZ3L91/jGT5P2IkwUdUo7Yh7x+uwMAi6sdgm4DEsP2zKOD8lmsHi
 XiYdL2X6NmRDAWIWCTL45SlDi0c5vWn1cKFeDq29Gw7dA6I3kfgaXKE
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX2pjAG4WCNgHt
 DDZ1epnBJZeDHHFtcpYTI3G4pPs4kfifzQ/CwIX5Dw/egtiXR0J9dH4CKYM7xwTe/SxqAYsfDpC
 Nkrsa5RMksPyP7WkuMJFupmI/YTY8ls=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea009e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=voxwdBqwZatJwGYNWigA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qk6DlmX2eQhV9k21wvGnc10u8G8d_dxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX9Yiu7o9rWL3b
 50eTG1/KhiDowqtWFqPrBG/l0+QEd+Wetlp4xEYq8RURE2P+FciS+qfGj0dyNWpd1rEzBr/jKB3
 iLOrRQ54nH/1/1WuM5JMz/5YjdVlnD2hg5dtDw7TgScavk9+u1gVwjT/GRLOAtjwcicFU6MrrUN
 DfPxuu8YHQDCBtCxv8Aa49rV+sitxjnb/abDtM13zMBVHYs9JqNOhJv1dmOWp0i9imtQEvraxRm
 g8syH9bBWsTvrr3AkVy6PQrUs6KvKAXM0qiDZKerWmfi3RkMLw7rCuVb+AdOL7fw2byvDkHGr5V
 NvdCgB4CYiEHYL2xQAhEN0mRwyFaugpZdV5uLHdmumePscW4TQNiP5rmhWsSRxFbPyDYNtSrYWe
 ZPq6VwN3VB8SqRp8PWLefQ5xr9zgs4AdgU8GqM2y/CvKRkdH88sNJRY06b89wZtncoRzRXCXd1e
 5kosDf+NRXC0sYB8pXQ==
X-Proofpoint-GUID: qk6DlmX2eQhV9k21wvGnc10u8G8d_dxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

"iommu-ranges" on the subnode describes the *allowed* IOVA range that
stream is allowed to use, so the IOVA is allocated from the specified
range only. Define all the possible subnodes so as to describe all the
VPU hardware iommu interfaces, both secure as well as non secure.

address-cells, size-cells and dma-ranges declares the 1:1 DMA
translation into the parent.

The parent "iommus" is kept as an alternative via "oneOf", so platforms
that have not been converted to subnodes still validate. New platforms
should use the subnode form.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
 .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -91,21 +91,6 @@ properties:
     deprecated: true
     additionalProperties: false
 
-  video-firmware:
-    type: object
-    additionalProperties: false
-
-    description: |
-      Firmware subnode is needed when the platform does not
-      have TrustZone.
-
-    properties:
-      iommus:
-        maxItems: 1
-
-    required:
-      - iommus
-
 required:
   - compatible
   - power-domain-names
diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 0be2f9119e78233928d23af86836ac294aa769ee..6c205077bea4d729335d7a5690a57bc1bb43ed9f 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -50,6 +50,93 @@ properties:
     minItems: 1
     maxItems: 4
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  dma-ranges:
+    maxItems: 1
+
+  non-pixel:
+    type: object
+    description:
+      Context bank for VPU non-pixel buffers, including compressed and internal buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  pixel:
+    type: object
+    description:
+      Context bank for VPU pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  video-firmware:
+    type: object
+    description:
+      Context bank for the VPU firmware processing domain.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-non-pixel:
+    type: object
+    description:
+      Context bank for VPU secure non-pixel buffers.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+      iommu-ranges:
+        maxItems: 1
+    required:
+      - iommus
+      - iommu-ranges
+
+  secure-pixel:
+    type: object
+    description:
+      Context bank for VPU secure pixel buffers containing uncompressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
+  secure-bitstream:
+    type: object
+    description:
+      Context bank for VPU secure bitstream buffers containing compressed video data.
+    additionalProperties: false
+
+    properties:
+      iommus:
+        maxItems: 1
+    required:
+      - iommus
+
 required:
   - reg
   - clocks
@@ -58,4 +145,14 @@ required:
   - memory-region
   - power-domains
 
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - '#address-cells'
+      - '#size-cells'
+      - dma-ranges
+      - non-pixel
+      - pixel
+
 additionalProperties: true

-- 
2.34.1

