Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3943A3C109F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461663; cv=none; b=gR0vHU0HZR87n+udCwUlYnHtkS7C7TXUQz9bjjqbrCnATYn6zWFm8EYO1v5+zaJ3Mpw00mqWq0UmvCDCiE+RmK8GViIUwag2hm7QseNsDX5OhtncSPeS0H/l5OaSeeR/Wp4yfbGhghbOJ0v6E4WC5xQgqyjbtNK6FZ2EnbifBLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461663; c=relaxed/simple;
	bh=eAeA03T9lPFg+lYkanID++2D7piJ+xmNgdrmLwHXhVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eb6zctKlB0gKHQ5dcLdxDrsxigpyxwQrGrdc0JyIMAiiJ0uSBY0JvCE9GgEML7cYeqH0s2s/8T4W3Fysntkvino08la4suzMXqy/VlM+71dnHTWc3Ex9lEWpB/FtH+CtKYlI29wTfuwEaQYWUr3MLtVLy3xjARgfzPkleWL84wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f271Zlaw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtVYkpua; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f271Zlaw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtVYkpua"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3VLf1430690
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 18:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PjFsoLdjz3lbAFz0S9PY2FNskMpGHLSA59veDz6yFE=; b=f271ZlawdDSjuap0
	f7XPf6Ki7lvPqYiVXxJcFJZaYtOp4PpyH4r0rEdXUnuoBeHv9QqqaSWaK94iU5No
	vE+J6nViVtcHtUtWDjwyQhPTD/qmEdATcFnUE4HCVbDaj7keVWfcELOlJPkZUb1e
	Kh26+VqUtlmRaiLnKNoRFJd4wwLbnXwFBItByRGDDtB0uVF9PX8OzTNXZCAYmUDp
	g65rArQ15MVlEsxiA1aH/LeNpgJp1gZOUIzChso4W6i4R+AV0MjZm4PwMPgdiejY
	qDL1WpjzKIcZFxEnGMAYBTiYYOE6RLnoQR7yP4f4rTrLZmuXhujy+2X0OtAvhhey
	cJ8Epw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4kkgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:54:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso1549502a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461652; x=1789066452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PjFsoLdjz3lbAFz0S9PY2FNskMpGHLSA59veDz6yFE=;
        b=BtVYkpuarFNms9vNk20OEmfu93KtGNb0aLfnaz58xgJMVpSQp2sz5Anfa22EEvg9+m
         o0136QQX/H60e7xX6gzlUKXZ6BXlSpKNrxuP6jJp18dr86XwudVSqgt8tivKCUo4rvAH
         +yPhDw62QJCHGiN2XJhlg5LFQrZrjcVFm840/cM0jUBqpoaCjM+n9Tv7JLc85OU/wXet
         OSuOjouT7Tvt1EeJO0lvXM5PqFr7aC/CfAPwY5dZ2EO8QlTTI+AKIcUHDAqG6262MaYS
         fZ/o5TLGEkCck1gZz/cp9ATMvnt2UBVAbUKK1b5tj9Hd1YAwWN5ZXgpHPFCh1MLLeq6O
         iemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461652; x=1789066452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PjFsoLdjz3lbAFz0S9PY2FNskMpGHLSA59veDz6yFE=;
        b=N0iFDrXtDInxf+O+PR6w6vxs8rLsHuXntumZFS2drAmPo7UTrKn2XzL41urYwQeXjw
         jjic/dYxUboNXZAdUv0W5Iug0zFUYfZjNi2+vTy4GKG4KFPpE+kw3bhwS1RfcwC07N2J
         /+gAHXqBuq1BvG4xk4pF+Fl1ob0pA6G+NrWHqqxLHCpi/SI3ofy/YowluGRltG/tl4IC
         uN7fNSBI9AmRZYBiYItpqWRs/ZLfoQJr1S7PX9T53sefU460dp9y+e2nbX75fiTYduKX
         cDLx9+/UiwOiBdhmzOAq9EzZ8wqYCyGw/a21DmZAhAqxoG9pU0L3ukLmdUsWakOU3hT0
         ZFRA==
X-Forwarded-Encrypted: i=1; AKwUvBxcDmxBg3iagkNZMz/UmzIGTHhVHT50AlaKo00noSoaR+EWqFQyNGvQC+sf5k+kZaLgwgfpC07hqY0XrCA=@vger.kernel.org
X-Gm-Message-State: AFuF++ksAjxuG9XD8Pj54QCgh4ggnZF2hOK9lFbroqmQubDeLpkJkH7e
	hqyyYd9Lg0YROT17mGnvIL6CH4PD9jV4BWm2k9+FWouuCRXn2c/pfQQs7kYkvmfJAwUUj1xloDR
	TFCZLetdzKOKADRCFQuAL9JQKGyxBzbNEAoqXbIHeD4MpcRDDq87lNY6jplr8vpe4S2k=
X-Gm-Gg: AYBFou02hDjrFydCbEHDUJnZ6+AWZJHaRLvwXLgkMS1hewARRNCiH+jRqtqr7ZOMGMI
	6Qg1rEU6FYqODOcMdxm9YhvLxlz+ZTatG3Pc17q5v3bglG/6oZsvnmluOYU9p0coy2xH03NECkh
	upYVwYZcaYnnJPB4YaBOcSTxN2ul5iV0JjpZ/TeSVX7ilTrvmthncHCxTszF77AOMRtYi22tRnD
	Wbv92WhEp+jfIYLnYYYNBwqwfgUXX7vSSYkWMjQEWYJfXx2niMAWeRH2Vm6w7soqWFkBc87r2G4
	NdwBEs2o3s/SEH/MrAbSXe8nwCRzmHLZq58ltgEffTxf7vE9bPj0T9ya8/FYKD0EHFUXXY7OejB
	YXDwNkQtidFSz2uVHjVB49ucHyzWayQ==
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr9549247a91.4.1788461652167;
        Thu, 03 Sep 2026 11:54:12 -0700 (PDT)
X-Received: by 2002:a17:90a:ec84:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-39b07f44dbdmr9549167a91.4.1788461651588;
        Thu, 03 Sep 2026 11:54:11 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:11 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:44 +0530
Subject: [PATCH net-next 2/9] net: phy: dp83867: add regulator supply
 management
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-2-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=2110;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=eAeA03T9lPFg+lYkanID++2D7piJ+xmNgdrmLwHXhVs=;
 b=x8k+BJMfgeIA9V79xwFwkhli5rEq070Ry+6o3SC6wsTxHrrE03KNCKUMqPOPL/UC8NES8w1xv
 ZqcqjmRtXccCwCyJoxOyN2R3Cfk9wAMgmMAn1re8nimq1tozDzMfu+C
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99c255 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uuhe7hOpKvpPPjRdXc0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 8BUtHAEnifdS82hz-2rZgMidrLi4-gKj
X-Proofpoint-ORIG-GUID: 8BUtHAEnifdS82hz-2rZgMidrLi4-gKj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXx9QaBejUggNw
 NW10GJ/EhR6WplhtfY77Sc/MJ2vrSZrJBX8X2dRlg6oTRWv2sAuFVSln72SYpRR45STUfP6ODi0
 5VKtxovoRGneVpG+bflJzRUYtyHzrNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXx/oNUFS2mCdw
 90v6iyPDEs0pmCbcp421R/e8FdUePeGmlpXYSybft8ubMtibQ44LrPDe/Azvw9Zr/Ndf1u7nkml
 ngvF+Li4eQcvyjUtQ6QWu2xBBmSPXPKXOj1fyMrsXqPUCn7ICbWjldt1sPdhQl0HZDiapes5MKh
 tyvdrq8Sfa+J1nXKXfreDc44vNhKpxkWXjvdckHCizqENabnuUTX4wSoPVCOhao4KGEBl66EmyG
 LFscjposLjLIBP1PLP5EEeG+P6YJ8xdK5Po0NQ+/h91tSIz7jVp+RHoHa8M/IEjq8pKKZVpUleq
 aXyxY9WMkGCCAZCVadt6ZeNB0JJnO5URbpnmrHgT6zTkiKOsKaWJsR8gsTxn/pBQY0tPAGUcTiH
 tn6ptd7vEuju83nRApZblQsFfr4+4iFi0Ew0wIW9Z8FN6TdKU41QNsENlQvYhu9xaduHm4Oh3ap
 mMKV9qBWJbCwPG+yv2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

Some embedded board designs use GPIO-controlled regulators for the
DP83867 power rails. Add dp83867_power_on() to enable all four supply
domains at probe time. Absent supplies are silently skipped, so boards
that do not describe them are unaffected.

When any supply is newly enabled the driver sleeps for 200 ms before
returning.  This satisfies the post power-up stabilisation requirement
mentioned in section 6.6 of the DP83867E/IS/CS datasheet.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/phy/dp83867.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
index 88255e92b4cdbd6da2e2c1d10f9c72348d28dbc3..e03b39fd080d12afe0d02a53ffef2a6adf73cd9f 100644
--- a/drivers/net/phy/dp83867.c
+++ b/drivers/net/phy/dp83867.c
@@ -15,6 +15,7 @@
 #include <linux/etherdevice.h>
 #include <linux/bitfield.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/regulator/consumer.h>
 
 #include <dt-bindings/net/ti-dp83867.h>
 
@@ -719,9 +720,40 @@ static int dp83867_resume(struct phy_device *phydev)
 	return 0;
 }
 
+static int dp83867_power_on(struct phy_device *phydev)
+{
+	static const char * const supply_names[] = {
+		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(supply_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supply_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "failed to enable %s supply\n",
+					     supply_names[i]);
+	}
+
+	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
+	if (count)
+		fsleep(200000);
+
+	return 0;
+}
+
 static int dp83867_probe(struct phy_device *phydev)
 {
 	struct dp83867_private *dp83867;
+	int ret;
+
+	ret = dp83867_power_on(phydev);
+	if (ret)
+		return ret;
 
 	dp83867 = devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
 			       GFP_KERNEL);

-- 
2.34.1

