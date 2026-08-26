Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F32339847;
	Wed, 26 Aug 2026 12:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746612; cv=fail; b=CM0kb6eRVSVe39EfbCHZM9S1DuGuqgr0K2tGQ0jy3kevFXYKUSFWWLI9ArsyfS+fir59ax81GQ7q8RR67TGunY6GiK1p0mvzpWPNnr5/OeumBHQJlDhwh+eI9ln5yncEaxJ+VhPKHVll6FEepMw104PUQ6VJ/b10Aluu/tUINPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746612; c=relaxed/simple;
	bh=vDKHkXe1oBg2YZWHr65P67l5V3lJR2g18kei2QM2dcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BDpzlQILj7c60HUWuOz6jmSJejjxF2NkBFlvvm7JkKgAgwasGAlEx/SWHV/ZPEjBrnsvFKpyvOff9wCvPNqGhBAJgucjlYDTR0JvLyd4fN8SuY/yfuaLANjuGxr+rsuD4UhTwzCx4ZZmj7JHST51ztPvmjy46Zh0F+aSUYW9eUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SLI9P5HG; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SLI9P5HG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cdr3ce/YuaNdtp4XyJmeQPdd59qA7lGudhkYoTd0wflcgq6TUZcrEf7eZFbrhITVqtVel2wZa+IsvpIfz8qdpS0+53Y2QVQW1FHT+24fmGcCBOlxFpHYmwbxmS9GTPkERMrxFkSgn24KTH7eisZQKydtAw1C1Fu5OP/GsR71/nS1NMQQ0ky0KZgW866fZOhF+bbkJYDO3imA33vxiVuSiWGd2xkdjNkY7UW5HMeFr6pgqtXew+jvCzYKn8Xa+Gi8U8XJkalz5OR7TWZ0/GvPz9EbXCM1qXZcfG//Ow5kcIIeY3rc0rQW19w89PIGY17dFzPMleC7tQWy42OtncDWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGpnKBBYO3gmiL2t3vu52Gn4AT4WKoggTVZpo9F8Vak=;
 b=WORiPJpwRjEdZJJjPl145WkfmTLJ25jYN8I3LdW0PO9akf2AUl5t/ngFQ5ep4mRVo3hmETK0ci15xtzgkQqB1RhFo3HuUvx8D0QTJO1PN/Hlwe1DjLDav4RG+tiiKiBMjiKqSc8aEQrLrX2Ijh3Ny5eZ96vI59C8Z0R9VKmS0O2Q/QBxlWLr52Hg/AkeXrsIajgTFwFyNrYamFil9XNBGYaDt1ZqZR2E//IHR7By9PDxtxnIdi9uEIi16yCapY/CIefLwFzHmOqAt2phKflG41CwyHVBcB0CEgUCu7EJwIOS2SD8Dxd4y/OmG9ksWCfuq2PQw5UP0Dn7mj1Kzqa5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGpnKBBYO3gmiL2t3vu52Gn4AT4WKoggTVZpo9F8Vak=;
 b=SLI9P5HGeYsD/sPNqoPWh9ns/aP0k8ZLMiic/oCGSCAqurQGK7wImCnVlw0GwTiIjhOBK1ii9O66CwI/Oqq9XXiEvnvijrUFFNpRCC61zmNPkG4HxCpSCsrnoLu+n8vp3czGlA4evcJYyjPNCkLvsFyGHQRWkOjSEuzKfpl7ufPSxPIwJZ1SoRAX47hU76fp92+0IKM2FtaTnMRv1TgpI8//WU3omA+zjxzE7wyty8iY7WwsTqUnLSXgEMs/LG+Avn/qtGH/c0+sTZsnEXwsWYmEn+vzFa5gSB4g0l//8yy4ohQLomJ8iD96osgxE+8E2dJcly/nZMEydBAE7qDlFw==
Received: from DUZPR01CA0150.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::7) by AMBPR10MB9319.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:6af::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 12:16:46 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::38) by DUZPR01CA0150.outlook.office365.com
 (2603:10a6:10:4bd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.9 via Frontend Transport; Wed, 26
 Aug 2026 12:16:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 12:16:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 14:22:05 +0200
Received: from localhost (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 14:16:45 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 26 Aug 2026 14:16:35 +0200
Subject: [PATCH v3 1/2] dt-bindings: usb: gpio-sbu-mux: Add compatible for
 FUSB340
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260826-usb-fusb340-v1-v3-1-11927682504d@foss.st.com>
References: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
In-Reply-To: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley
	<conor.dooley@microchip.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|AMBPR10MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 042c98e3-bce7-4d5e-fa9f-08df036be5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S19E2oYMEuXOy9vO3EUcvDiz5fZf29Y2P5XF6drsr7A9nUFql58DdmcNAFlFOKD+fRbKN2Xi/ARs3uZd5oZPM15IqfSO7A0T/+ePgmixOGbivrsmAbB1PL7wViz5AVJSJpCr9H9KdLDiZyD2to5f06GY6328moZ8GCwoPmg7CCnLHR56+lLBf36tyuhPeBSIaeJMQcyGLpuzh+GI8Zf8GPpbzlAD85gIb/EAtoSPnKnC4JGXyGJVVCphiTSAE04Z2+k3X7e+Rfywpt2qP5Psv8AucTiuIiddIWbu5fvWFZZ11OehWP43zKdTJfcYlJoHDrQ8b/X7lFjug6aN7dDerL451ICjGLw/CltrhrXqFafugEkgiho2daldb5NoEcXvA3lZyMyk8g1k4gHuZVssoL3KZwYi4W5vzlOlKX64rMiak1z4ovCgWsLWHvFa223Pu7RND6Op3F9ehSGag3DR5WF5nkEIx6yYVjbm72pHmrid+4TxmuhD2c1X/uwmGg2HIzg3xAL1BD3LO41gN17SZzkOadztvGmCfCEfpP5RBtXKa0HfvTinTD67rXH9+n8r8lzjsltT2LxSB882rD5tyRSZQkR79fkUowN+Q2T36qH9kUbmrVm4/FD3bZ5svKt6eLij4G6RHMMtCwjZoVIMr4PEVu+pfhQWSKqk0eIyAdt4Lid/W7dQs0t7hPJI4KMURuJzzzXtcEF/63CopaZ8qA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BMaWkl29xdup/nu+xVsSQuhJrBEXte8knScaFv6Z+MnmTOLZRtx9c1/18NUAzk4G1m4b9O0IMrGvqXUtXWlX8/qnU5P7Os/ODDKGv3mE5ettZVJZ4LXZKq7zY232J1CauwTnbgX7PXz6TUJJ4/RLKzYZe735DAjqpwE53y8p/PM48sPebetJOc9VGzw5Sp0VrgGwdvyemTXkKEzwMqhTzdGEcX89mdhIxEW0N9rH93TL0HXUXdUCcoKgKeie/qYAY1mMFuRGDWwWXwbd619FtVLzIUK9sRo1vl+w2B040XSnT9svD6C4wgglimRlt09XTx1Hq+M1EiuXv2o3aLTEDskD8pQh6oaqPZpUef9YQq7uw4pObG5dxHHs97ZARy+pqu6vCC2E0alZmnJUE0NmvcyOcSuwgjJ2HhxIBcDe2uL/Vf9pKZLiCyZdcyXfGUEN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 12:16:46.3799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042c98e3-bce7-4d5e-fa9f-08df036be5fe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9319

Add a compatible for the FUSB340 GPIO-based 2:1 SuperSpeed switch
with enable-gpios and select-gpios controls. The switch can be used
in Type-C applications where a reversible cable requires a switch.

Suggested-by: Marek Vasut <marex@nabladev.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index 793662f6f3bf..c0e60848d8ab 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -22,6 +22,7 @@ properties:
           - nxp,cbdtu02043
           - onnn,fsusb42
           - onnn,fsusb43l10x
+          - onnn,fusb340
           - pericom,pi3usb102
           - ti,tmuxhs4212
       - const: gpio-sbu-mux

-- 
2.43.0

