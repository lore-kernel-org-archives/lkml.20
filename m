Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952012;
	b=4itQRaXrC8MVh3o3n0eX1u0a1WFMh+X2b9oDJ5wVwUXdeRTkJmHcg8FxLNptQ7L0y1R6
	 vsIgzdyqq9f8aac2n+r4finOQVzOexTnmokY0apGYQocbxFw5tRRSHpstKqgaV29q3Gf+
	 acdcczga9rgArMHDA0LG0KVH1Vlq8DUcTe2G0/yjEL3KU3oGQOafIG1tNnQC2fWI2ADEK
	 H9NaNwMTN974Sub2r7WfRY4A2MZ7kiAsHhYaoW7HRpavG/ByMw0lqyPvF9kk2LDKgNa7U
	 MnhG1DmSPd70pyRnxNJXvdLAnUvfBZn5EZX8f8VZsNFNZ7Sr1sMcia3a6yvSheEOemw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
	b=N1ik7g09K4vHNi4ac76Yy7OAtSdUR/dg5FaoauUXSvqbl5pgey2jA9fkyt56d3yqj6ZF
	 3foSpbpFCZl5k745Agu+9dN8FK4/doZ++MBDiZGIsg3Mf3mDWqBy6Pgsv9RUafGufyL9e
	 kwQFp4g3453QAvPQ/VKb+YZwMJVFmEhPwQbHDqLtarUsqO6khAoBdsGBsOYCGUsdqwvIk
	 eaRTLadezPhm0tcyw7numWcedfro44hYfwZ8+mfJg7tS8pm3stdA1tJQ+tR41ClyCR/R7
	 l290oVOPsXlkufCDkrQSLiFYB/IJpEK+IPt3iSlrfV3RO7bfMYPw3lDE3KQ0vNrgBGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gC4ka6wv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+hXPl6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330F60A380F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F330F60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gC4ka6wv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+hXPl6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RR383301586
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 08:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=; b=gC4ka6wvvexq3Eu0
	A8JxHpN5jaGWmirVAolVsqLvMcdmwIap1vspNRy0s+jHuDvekHoidn72sFdwBx16
	bJO07CJq4C9vGt/GBELk79ytBriG8pfUljeYFbl6K1e75qDIJloPdKEDd60yRo8t
	Y//fkfZvDNafbU+f7UAjIk+Gd1tq3MFETLNJ+OloDV8kZNwfUietf4EogX1BhJwk
	yCOVyvg6RBsZawfhg34uTjT3ubDT9kAFNyVBqgJeSH+PA/5epwO3yK4fmNVEdSBE
	4pOHytjyfXVjy3qK+koWV2s0F4nbGJa6tFwCDrHGDuJbBOFndqDwbe/9DbkO7DGB
	ff2tgA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1scb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:00:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so303218b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952010; x=1794556810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
        b=ib+hXPl6S7u31rGkVQebZyJV2wnIcYQLMP3qX4z5T5gbZcbBA2SlTALlOld2aWwqft
         aXKWARs6vRunH6/qolzrMFvrkib+yoZn6g8cAi9ex/iJ+KpLUQCkiHY5JRSw30eB1+CB
         +fIGIFbEoc01FiWX5QWOarC5Pidsaz7st0AoQle9c3KimFmsr2eNpamM/79Z//OPXNpG
         mlkFxF199g4MH8MRroLCEw8lQfBqdyOtWOfcMDtBv+VJnM7/NDji2PB6ILg4EHIMTT6c
         2YlERtted8zqeIXsJpTMa3h3qwLLR7oY4Btt67J6jiFZkJzcvXts6EmBOFteGhEKV4X3
         dEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952010; x=1794556810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
        b=VH+A6Bf/0OEMcNxFMzUEpf+ZPGkJvpvDkWq4v7993qVbEwywHWoeAnAWIOR02LiMER
         QcUfUNQpd0mzP5tbLVFQr0FHikKunDxbpwMqeZOSc09U/lzqqT4exvnQImUWU4ZTdC0D
         dIgNlkuHtnCjQv01PB0/XBZk+8I262vV1KH3lYHcg7OEd0sJepIt3kRm14WGDFPaWuxq
         FhV8mt0/BC9wJO3JTP8A4fsOY81aBPd2yquVxflmYvbS+cr0X5wU1EMOwF5KAWrlr9AQ
         vEyyxb7HBt7gay5ZSK2nW2xHjjLqKq8qwghIwXrJFREP96yka4SY0d+iJWzKdpzTvlFw
         QDwA==
X-Forwarded-Encrypted: i=1; AKwUvBxrJw2NnqQnf0gujo+5b2mb5ytagbn0sAA6AtNMh9fA653M7qyZzFQZbWujBuXqYtFSuHhbXijHm5XW/80=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P0IB3WfZCd8TBw3bnCSqRmKJY2u4uCoAn0r3yEjEHy1rAGP3s
	hciLfi0FSzLSB0UDu68/KRz1IdxqmeAogoqrICFf/5HFOSl6MTT3JyMCtNCawYVs2GEEPTRJXPP
	23PEcIqv2vjFFRcEbmIBSC+PUVlybhkvxN9NnqHGDtgGxrpQLQiJu1SHO3RQTgC/YJSw=
X-Gm-Gg: AYBFou2mZlGeqHeV7reR8sEAlLwGK3jEOCRFAj5cvl5xBekZI7YSPOuxCXdpyM20EFF
	d1geLdrFLjHcm0dULuKY3eadS0aOASQC76dXKW1nn/wp+dgwv1tdD6+amIBDrUWjx21iWuKaQ4Y
	TkEkK6aDtuTbwP17kidTqJS/V0DrzIws2/FvKDWJeCIbuJEETCbwTe6zQajqUwWh16qmdu+Y/iE
	6rDuvGvodF2ukyf9ic/jL7Nf+TnaSbdoJOrGmS042ky5dx00G59i7VwJTSPQP2GaUKmCY0+cF/n
	sc9sTKXcVoZfeLoVy25Qurc3DZY0LdQgpFQVB1qAl/JOPnQyHmhMg4V8OJjPHW3FOrr//26gHay
	tFXIDMb0d6o/ILiZPxs98AzzeE/q0QJlP7+/iQWdu02qpMCgM76VEmCL7T0IyjWisoTbtcl2J9u
	bmVInfP9U/6MXMgnPgiHsW9s2COHFtxtCDeV5tOjsM3Tx3avA0zosTYwoFvFzGle9SCeAE
X-Received: by 2002:a05:6a21:4983:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3ebb298a8bcmr1772181637.18.1793952009806;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
X-Received: by 2002:a05:6a21:4983:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3ebb298a8bcmr1772159637.18.1793952009345;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dd36d3sm354529b3a.37.2026.11.06.00.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:08 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:29:41 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
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
Message-Id: <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
In-Reply-To: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793952000; l=1463;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=v1VwzLIVBJen4A0nAYBoJxmCuCj+Ao+KApsK3wQ2L8c=;
 b=3MRGkfYYbz1vuQJwnIQLL672bkTkOf5vmz40JpS3zxg8k4EEjIuNsZEYz0lalZTfJbetjMGr4
 87pSXFms3NeAwtmca8YzIgsmXdJPY5fLe+mBtDylQlwmUPGfKh6+tLO
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX4P8JXl6uoxPe
 WEM92Ivpa5G6/2h4xbkBRnL88VMj7V4oIlKGTsfq4Zl5Y2xs/oiU32WL+dvusWd5OMTSKcAs4zA
 96GvDWJXZH4Q+oKUufJqpg/t6kELveVtolfogReYquVJddaYA0MBQVFXl7r1NbiO3dW4Cz+tyer
 jRw2mLIoLbeLjHJxYXEWDcx+68uIOkYiiivzlCJtf302tJY8lKqb0AzvxDPE5TNI+iP8MkamIIX
 ZMSFKFZIZ2EkH/uMWIGzKtKLHJKskWZLY/sKKUnc6N80UJ6jCftHp6eKETQJzUH+npFhB7JiHAr
 muWOVXqvVmMU8eupP+bDcluYsdIbab/JX3DYoN4tX0RKw2YpDI6h/Avcreab5/ZyFMnAFFg/rVo
 i9Xo5BwhrifAhYHUUilPKSsiwCf1C6VKi3/ehyAPsOmfdE+Jm7v4uvG5uF92p2cTq788b+8+jw/
 23oz4PuXWO0ephsbTiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX0bjYw3hEBZoU
 aL4eHXFMG9tfMmjLzerx8k62BrS8dwTeXZVctvrrU0zSMSfON5bn2pEkY5L6GW9+fuqLK51aqOq
 OGd2Cf4jPTN83Zrpn1iIq2aL6aZy89Q=
X-Proofpoint-ORIG-GUID: bl-Y24s9n_7aij1fho-c546EjQZEXAWR
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aed890b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=FfQU36pP55OiWfDkhZYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: bl-Y24s9n_7aij1fho-c546EjQZEXAWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
be owned by remote island io independently of the selected mux function
even if function is non-egpio.

Presently egpio is treated as a mux function level decision where as
hardware programming guide(hpg) specifies it as pin conf level decision
i.e setting egpio bit is independent of selected mux function, the
driver/apps claims the ownership of the pin if it's egpio capable in
case of mux function being specified as anything other than egpio.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0621..d7ea3eb4e124 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -87,6 +87,13 @@ $defs:
       output-high: true
       output-low: true
 
+      qcom,remote-owned:
+        type: boolean
+        description:
+          Hand the specified pins over to their remote eGPIO owner. Only
+          valid for eGPIO capable pins, and leaves the mux function
+          untouched.
+
     allOf:
       - $ref: pincfg-node.yaml#
       - $ref: pinmux-node.yaml#

-- 
2.34.1

