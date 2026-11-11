Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416651;
	b=RnpsFL0ofvUITh50cjNBdS+47w/s9VGWV3IRd5qL3B7tslBjTOIFuKxNKAM5+wchI9Kt
	 EegwQylL/ExlSZRWnZadtjgyBFIJT5Lg4c4CHQU7s+d6Qr8XG4gXRhhtmEx8U5npML5gi
	 nNUxn7n11ABcn7jXTmPwaGCynKuqmpx+u1W1uicYYLtnsyWyvfpXNtUFbvrSMwB9306IY
	 yr7fzX4jytEjw82MALQmQPa1ng8qBq5rE/7MZubaPoACUzOhZNqLTLYMU+guhfAfH+yLB
	 F5eWciwpenu4FEqAbj1Vh6nFBOsf15FR2MszdXQdzeliIiGhzLAyj0SgMLm4LxAsSZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=ahAgjHLdUZXz7TDB6zYbVo/xyyGo2y/6Fba4bDWcnjV7tMP9ZoYdxch0Ev7h2JzK6lNS
	 s9j0d4wa587mR6u/gEKkDP3xc3nPzFfdyLrqryKAEWY+W3r2MeANWi7OKVx/eRDADX8ZN
	 Sgot30f3LoJHLHb8sWuv1q6jQqb7D75NrWZ11NZY1WOxLxcKMQVJJoK9NJoR/SrleD9q2
	 qkdqfSiOXHV+HYK1Q2rcKy8k/lHO5DZOiOexk5pVp0HlBgdFIesxaJZ09y8HAz7nLURCl
	 t8v6Y63qyyl+5yovJ9YINmXgNzI/7b9+F0JCzaj4IpyTb9c2LFkyOImOEUvu+IFD7Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMrv5y2S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTRCdbup;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80175606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80175606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMrv5y2S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTRCdbup
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Mw72665059
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=AMrv5y2SDEj1201W
	DsPJqv+W7HO6XEwF+NSlGw2wfde108At7Bq4KcuYbTml1XXLLOuh06F3o2BUuGQN
	BMp/L5CCvnnEzQaBcH20VUH0FB/GVgWbYPAqngvNfMLMMenxSYpygWDPC8v1jlpa
	SO6I/A+sb7kphRbAN/KOzHqTdEDthKjoiSXRHCmmjQCGmvvdEcKUQrLQHemYRUdB
	dxLQrIqa6aDLx1KasgbZRKROrInvRw+Dn35K3TWnnsvdr13ECX+NOb85Ctqub+hs
	VGpvkWul4tWllN3DEM4Zx50wVLr73mrnWhu5vp2slNkj8pw9bKri1e3Tx5AuYvML
	+C6sJw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjw18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:04:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso3056354a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416650; x=1795021450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=hTRCdbuperrJlE2nKG5TGEjRpkD3exwAY6wxYZY9UDHtUu3LGtxWUh1W6rywmZ28up
         yzXZzz13VD12v/kPZK5FxCH582baGSgKh1rVndHJeeGLiOXLezj1d50pCrd59rQiZ9wA
         o5j2IQmlw83uc++CuWtFpgOtoOlhpKAMuAF5MzWdNAlFa0rVjBIfeM2zFpNfgdROBaV8
         Dle1EXa5YM5bBnhaHyemPqyCqLNPt94gOkvJu2SfNruF/jkCipsSSx+9J3ciG2rEQoi0
         j/QgoHWqB/53Hq2/23OuR86hm3LDfW3QNvED3UruIMmi7W5ZAtES13GTEuyd2jUXWV/C
         +cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416650; x=1795021450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=zokcYpMwrbNWegoNWfJkhp4nmDMBP2JVVZpsKhFE9xZDjmhhCuZ2hVhFBVDX7MSqYi
         j2/C75dc8duvy0Wya0lKW0WfZjOiHo1GDvxQjnw/nVN1DXh0iuPDDm1g+aq0sE3v2sOl
         fqmGF4co0fGCTYwCgFMKkA2muxs59AXKUD8kC0F+vQ/G7EcaYF0RkgyWulUPOzXBEw2A
         p2dC20nooR51d6qqcKJw/I+JO4mZSEAuLxM3nRQEbteSZjUj+FDUrOb0PpXwCry6kFKk
         JFYEMg/tRt13/qwghKS877FD1Qwrdrmc890hiXFzZ5aj06fF+vQtBsVbBKwpt0rDKbrJ
         PVYQ==
X-Forwarded-Encrypted: i=1; AL+hErEInQw8weuY3KcmKDUftZZqz8QUrEF+cSg+44fbdao2V/1W9F7debkGTCzDBq5dY3OFvRik+AC1IZJqSMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fJBvp7aQ22kSY0TyF7rufqUAAQvIpEzloRMdF4XN47zV/ERBD
	zXisDXLCqKL3OCa6jLh0mj60oXkq3odIjois+xRzRN8j4agyDg1ALMYXnXbj8Vtp4VK7ObUj0iz
	C9U78YEINmrUw/cq81g552tZEFKVKUv1xxZQ0tx+cWaD+z5xdMNoQ/Pc12OBx5eDkB0o=
X-Gm-Gg: AYBFou3o02MKig1X4fpxmLtbJPorL20Scik3r9P9I5wIxo1CgKhqISwRZfZskywWlIb
	ZI/8UrTRXTXaApaBZ2CHrmUAFzn/L1AcjzYQ5XIOd7ZDd/F6ghlc3uV25X+Gr8CqgwDhgYQAfjn
	aokpyHAYWl6fnMsjUZgpQ2cAFLW7DQQLfJaLZRXeJuwnIS6vtBlm3CXhATDgMv4q/jyXFk9Q8QZ
	qlo/9gnLZcoj4OZWE+JOiVtbm1H38kxpvHgHep85Ari8CeiclcsmLpO2UzoX1e+K8/X36ERzzj0
	zhnVvV+7YfgpRaLS+E0rI/dKzbE38dIIow6oTZWt1dLb8a9Sp5UXU5yJPClf0Ib1ftGc8PGCZ8B
	K0KfrTeatOFp1fohbfmvsj637+0ocUkz2eo+mXo0WacKqE27BxHy7JXBDIvK+QoJtjoE=
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr2767194a91.43.1794416650134;
        Wed, 11 Nov 2026 09:04:10 -0800 (PST)
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr2767168a91.43.1794416649690;
        Wed, 11 Nov 2026 09:04:09 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:09 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:55 +0530
Subject: [PATCH v4 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
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
Message-Id: <20261111-pm8010_i2c_support-v4-6-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=feaEG2hkVROaB8EYdcswFevmqiFEx+Eno2p6KQHNxWJaUuvO3Xl0tLWruMpRpCxJoNs351DJ2
 on6ScmDiLKWCSqCwaIOFYwv3fHlMaGC3MbVvmDjeCliAWY2/RmXm4bm
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4a00a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: y8gLyRxJxLrIqsSDk5z61f3Vd9-i0WBX
X-Proofpoint-GUID: y8gLyRxJxLrIqsSDk5z61f3Vd9-i0WBX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX2BYhZOlRzxVE
 YuXEq0Ha4hJULa6W3OwNF2uc242Y4pfduyGEhNX0FQYREKPW2xbp+ujUFcwLD7rYShMmZM7cLmi
 ZQfT3piL7HOD5tuvM78I+holKgfadeDqv2WQuFm7/noTssoiBo/8ZqEXjNek3PGYVZ5Sl8lfen6
 6/LBTFMhu7AB49blRuRDKYHbWSHNREuTT37srCOoA3jPgzKaH9nAIOGkaeqnh/ALLyqba7zUoEM
 kF0SV9i5A2P/rg/dktwXvZ8EgCCexN/MRGztYIrNjKRJj2LEx8SHVfWr6v0UQvmGAv4tiA4Oxw7
 ZYjo+vVOAomiesrs3cO3d6rQg38BfUIlI4KSjLaxKtutp/dvb0xcP9ezUQa2mC5Nd/09atRSHhA
 RL1LVCr+oomZu3YEJgE5DD4x9twoYmGoT5vRmp7JlagubXfA2IS9+jtqxP+gFo11kk5vOXc2eoe
 3lYtzAohpPtxF6gA9aA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX+s9v38THY2m3
 GQlZ+2lDbNuAXValIwd1PhL+a8Hkm+AmI7Vn32rL7LVIJC/IhN+5XV8t/OnfbNtcwTOSXMYyJTT
 pfP01hHlr7GVZq/hKGkv2/80SxwmkOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

