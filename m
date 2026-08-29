Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9A03955C9
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032472; cv=none; b=Z90zR016+zYH+j3Ej7Vxay7LM4DDVaqLQ2+l33aEFuNGwGkvI/BHmu9p0SRYSThnZ1RH3xE7hind6+NT5XNlaTbVtZ/93WOzd4/Bcm6LsbbAqMrzie1QnX5vOV0bAhtBRrPiwkKPNJ8LodudcA/RvgYdbyBlQNMmtmfd+CGy6c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032472; c=relaxed/simple;
	bh=lCD2rnWylJ/gXC+S6T2sric6v3SvqHkmqg2cRrHiHMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eSFdaTPKriIapn8H+BOYvonGh9FJ8kRDWZbmqsNwC51Iln9tSay+oZAq+O1Oje+BgIFiHXHH/vGR/Ze8z3vAbCXM3vjFQLFBDNOh99ks/7PINaohwWODbVAdUUcnJPAKAo9DmJAJpDZDqrXxbun0yuCt2TWx2rBO8GmI/rQTQ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/f/+HHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SULsLshj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/f/+HHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SULsLshj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxuhv2422763
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q3ovaYbtyWvTPy1NCdh4shU/gvReKJ7Fezt
	hyCu9rnE=; b=d/f/+HHKdAQBAqMLf+Af5NPzyxKS9WgTtGkYRmH+Bl5y2xV4Cm6
	ypdS3X9LxySFt6jQIPdVKvUqJEhIilzGMEJSsHiWFgNoNYzs82B4lnMsDEXRIK42
	4++oQUB9orkOmUbeDj+NAZuKtXKXhLbgfACn8ulkdT/nFuogYNGgYqyOuP+PIHjp
	Nm9kUcrKgpIfVc0xI+WoEtxhbbKGlRu/UnF8gZY4qro5eMM6DZf3ql673l5Sjcs9
	YCluBaPGMX8LDc8/AcKT/jWq5vjH0NaCy8MXBzhEf1cUxxXAL7RUWJXNuyMJxTAc
	Rd79OWFqwIK+0vD6MyQZPo6jAGuAhTTzytw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2hmgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:41:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ff59f2c47so24837451cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032466; x=1788637266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q3ovaYbtyWvTPy1NCdh4shU/gvReKJ7FezthyCu9rnE=;
        b=SULsLshjNq19L/PORm9w5m5g8DLMm7ze3qk6w96RPezh3G00hiZ7qMfqKbLADV2czI
         X8AAn9M65DZVKt2dt3gNAAFvtPIwxE/hh3E2zAMmZue0vTz1Ep9oDEepBouAuMFHlG0F
         giEE18fNbVX0AxsbMgoorV30HJB02GulYfB4I5E4aXhMMoDli7srmdnRUCEViNP7/MIK
         crry6ZNbROzhoonVRjTpAFy6eBeGqlyJb70oqvdA+hhT79CF1i0//64Mws+CLn8YE1N6
         3Q3+Z07Je2SUxRFvkKEr7ZEYX8T2+PSM5ZYesQ54X0NEeIUAUq1qFw98rfGCTCuE6PGj
         Ttlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032466; x=1788637266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3ovaYbtyWvTPy1NCdh4shU/gvReKJ7FezthyCu9rnE=;
        b=puDUiD2zF4eerzY6bFGQeQ//DzO6m8pv9B7zqH2kGpiHJZspvEcrrAZ8t0hTM8ZCqL
         FwiV0kP4+OehVyGfy55E6xXBx95qPPt8A4ZmKewnNDLyT5cPou8zNvzakXxEnbkz46nh
         X9QvopmLu4P6yvH+9NDQwWAmSmAp1mwXKNkysNKbf3X9/+N/GjEnkkLUwupDsmATUTmf
         AsPH9ZmoSzjhu3tATAipeZ8CpIZTyfCpeQCTZMORCx44EdRdR7v7cEEfhpfX3Ot3fDAz
         CkCIBwJJq9YzAXsIhfsPkpqjh0LDF+iqo+16SlIQdRG0ASj12MbdqeY9Wl78qCALrznO
         3Z/g==
X-Forwarded-Encrypted: i=1; AHgh+RoqME8VZ0ai9qDPuvctQTNTx/bhuuR8i/cHYuNzDZOfjB3Os9aps+j1F6l2RAzoz5MV51Tswad260vceRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nX8mFcYiefNhsW8RCfm0qwyxCJ2S9JXjeBAX9+QnG3ExVkmsrh
	Tue1bjjejW4Opr75JRv07IcDfbbkcgpqUPCgIS2YmGMXNKKw+WHj0fmxQTNNp0MEA6kOOibYELq
	SEjcBzgILpU8Tf/KCTIkTvyTlalAnO7dkMLKiEh8ikX7lSZ8ccku2blY7C4w1gm3m4ys=
X-Gm-Gg: AR+sD10krrEqHK7ggQYyXOVlJmtJYFbbSUsfU1GUYAvbdoJcRSm72ofMV0MMP5js8zO
	y8uqMTkuxp8hb0LcrEXr2coTtk7LrFDFYW9XhyUUO9rFIXoOpilwjbAv9dQb+7fVv+4K3Y4xHlb
	Q4HC8xec1WsL1YSlZTQAjUWF6ZBBew8NHh2R+Ep+qR24Guvixdk5/CiTczUQBlMUXTG9hnhDnGf
	mCxdbeN66jy1f95Q0ZXeBnQGHLKGB/WQDRMJ8fm2pl2F4j8DIQHfROPysZM+Z3Y8XZRnDMgK/bp
	3E2HKOVDyjzVVzlJX549vL2zYtbGgA8E3aXKZ/TLa0B5to4VpUs6pXvvKqwJKClqcNDquQa8kKr
	H0xnT5ZZ2JYi/WhQ=
X-Received: by 2002:ac8:6906:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52fa1bb79c7mr304455441cf.10.1788032465971;
        Sat, 29 Aug 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:ac8:6906:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52fa1bb79c7mr304455121cf.10.1788032465612;
        Sat, 29 Aug 2026 12:41:05 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm243390275e9.15.2026.08.29.12.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: aspeed: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:55 +0200
Message-ID: <20260829194054.107929-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lCD2rnWylJ/gXC+S6T2sric6v3SvqHkmqg2cRrHiHMo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXGQUFLSmG7+ry21ITbphcniWDbQTny9DzW/
 uj6+C8Bx02JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1xgAKCRDBN2bmhouD
 11eKD/9r3+XtKocDcW+pxNJI51m+1e71/pIgJBXGflKkNxHvdYF5/H1EBW9204QVUbOlY8LHAeo
 12dvJa2Sj/Yggm6H3VzfBRbGYXsGV905x2qHmiuUeY7SxrM63MydbAmvSSzVm2z5jV46TTOR0hU
 Ed/GK0kBcFijqgjvbmaBBbij3jrqnaXMZYTvmB9IHi0CWTO8Ss4JfyJVSXnKsroc7EaUJJaQ3uV
 7D4WmDfsAhLi3ux484loF+I6pFnEdkSjQFO/NJIXT5X4vDFymZWDqyd6+zhxQSJor3r2fyp5PnC
 rxB79bTY4vn4so9xauyXexMs9vTkOCas8Nqfqlsfalk6Iibbv63MRGBaSUg/2MDHkd3KPtTaMeR
 yyqtmGj8TjVD2HQbQWKjdsipL91niG7Rdijqq7wdPDAGfczgERm6PqGBJKAqPBAYMY9MODHjwlN
 gOMakH04wqABfZsnu3lvwped9hwDwdfr+qwWPb8y1/oR+s5GGE28iohdQ3QryuQrGU6XV3J7uXR
 KVL4mNUZwyMJfQTPFYOIaFOmwVhL3YwDL1wfYEVTZNdZciWYgm8SUttXDiPBKxAsvAh9jYIHcqA
 aHNuGC9yJewTxdTALu9Rnvoinn57ZKyB++Eys+gK11mu6WjfN6dbZtCKqBqFl/6vDIh0ihWz+iE 29hKMHMetH3UXMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _dgxEMKoHma284jSkSgn2rf897gnFufd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXw3qgZEn8+CcL
 bmK6dk2uT++DlJ/vSnYkJY9Gppt4BxsUrjqWyhQx869Hcj6XfI9JlCe4omJwiLWrVC3fnpuEPn6
 W6ch9EgLlhOoOX98w/UMfx7o7p41PVoeBB8JDpqEN/KKnk87IviQ0wb+jo3ZHWpYxBvVAMttyhp
 L01WyT1Zzfm5koJUVfvdttyPPLnmvoRsFsyCdYphkNWTuIafehrt6fmtibOmCEjA6AMQIc+HD6e
 ZjrQtLxdLxAE7V0WUVSkjW2JmFGt3U0pquxuCOIDCJMOAQ98huvNSNoxsO9pXhMJJ3nzhikZ61A
 +rBgwCqYNr8SIjT1e6bYq+kXJv1FthhAUuzPshzlrtF541RAaz4pShyHWNBYHQxQn/Mr06KE3rc
 GedM7IMJXvaOxeuVT2ZPP1p4y7ez1UThEqx1aI79yYFPeRWcg1HSrCatSeUWT7u9mcQfdvV1tWZ
 /YyuzIIMaODElQSJcYw==
X-Proofpoint-GUID: _dgxEMKoHma284jSkSgn2rf897gnFufd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfXw6psixyNCbPj
 nVH0PNlcnLxssdYeGf0Qf5BFp241I4z2xeXfpIBh7h1TlTU2XZB+9ISlSITpiHDELqOLQNQ8mbr
 zW7D7Mxv51Vbc9SBcsIIystKUdrwdz8=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9335d2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Ta6ShJ3tCWu1s0TIFCkA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts   | 2 +-
 arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
index 89907b628b65..d235ebc3022a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dts
@@ -213,7 +213,7 @@ &gpio {
 	/*L0-L7*/	"","","","","","","","",
 	/*M0-M7*/	"","","","","","","","",
 	/*N0-N7*/	"presence-ps1","","led-rear-fault","led-rear-power",
-		        "led-rear-id","","","",
+			"led-rear-id","","","",
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","presence-ps0",
 	/*Q0-Q7*/	"","","","","","","","",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts
index b961dff388d1..154a2eaf8596 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dts
@@ -75,7 +75,7 @@ &mac0 {
     pinctrl-names = "default";
     pinctrl-0 = <&pinctrl_rmii1_default>;
     clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
-           <&syscon ASPEED_CLK_MAC1RCLK>;
+	     <&syscon ASPEED_CLK_MAC1RCLK>;
     clock-names = "MACCLK", "RCLK";
     use-ncsi;
 };
-- 
2.53.0

