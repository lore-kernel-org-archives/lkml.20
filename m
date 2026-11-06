Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793944261;
	b=kTwRrCKqy+QmwZEeClWkwzJO0b189uEHB/9qacyoDCxOTuwEns+sFbRV7zmlnPggqymY
	 UqBnUzBtjgKVBXLOKcrw/JL7GYnaFY1UcW8Mikw4MjGKhqouN0IUHvc9JYXaulfUnpU8z
	 A/X9kOHcWobXpgZo+z8PWnZrln+LJN5/0CYpBy40BC79sytpYCFxbNcckqELoQNIbz1nx
	 AKP6EtsZThXQ8DRRf0uQdD4YvsrjYqpKXNfiGynLHghLwX/S6ZI1H5CLIEW/H5FAxDFN1
	 gx7e4vFKiUjUdxSaFd+9/neGyFCSKfzvKdev98/7bRybp/bf2vBEB7QpIb/N6Kya6Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944261;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dVP+qCkkMPLsu4gm0MWNyC2eHosbsk8xmc0m0idUjvU=;
	b=O/3QeMuj8RTA2fslSmuvQu3pn3abD12Zazyj+35S0Pk+d635j3fkguxoG1O2f0DJE7HI
	 MrlPyQ9/vQ9QZXVCc8ydr3sf3Sk52TmkGIJ2vdcSnpWpFNa+h7n8OKY8thiIgHMGWz7X6
	 gsV114ibFKLbIBXD4M98ItW1XacOkEf7d1JmJd2aKaIL8hPp4H38CPBIEv2FRSTC0Y0wI
	 RIdEjX30+wX5uw8k7CTSasLQwbReTnhBdwppxOalNXUKKmY9YQilH/axW4ay8pcc9ngeJ
	 OHbArGz8C6VOpkbRibh8qm0/+/0wQyc9ejAvhKACMXkU/9LhhKrihqt289DWKT9l7MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.116
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023116.outbound.protection.outlook.com [52.101.127.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C31606A337;
	Fri,  6 Nov 2026 05:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C31606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSeF36TJq1aRtPL5SnCl00Z8uim6RA8JQJBtwXZZJzBtyQmFg43aR961fIKU+84wi62oW1Nut8TkFCdy+YZZdrFmP/N4OyQNPMZE5tzInWeR+FjpeRP5kS+0teTj4V2pcpIgctk6OaMH6ADsmaYwDvtBqEWCews2ytBrzb626bUe0siw8VDiNTTEQZIpRzGRxbVORQO5zyz4BuG24L+vBiL0KjCaStAPcxvsDP7ZOAs5PtvgJjFshTYJjOC3aSLlel7uAiLdQW0/J6Vs5J1Jqf5bCR9/cmQuSegQ9EzMkXw9O4FYVXuUe5VMs2OL/coTD67w6KNw+/cfS2zhk43EDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVP+qCkkMPLsu4gm0MWNyC2eHosbsk8xmc0m0idUjvU=;
 b=OMUxtXr8+dtGQNlcwzvkpz9qFvXKBz0GC1NSLhzOWeRmfvi/pT7UVnWbDLA5N3F5CQaKA8isExF9xKK3S9dW8AsxAY64Xv0EfstpQeAuRIehzwBD4VT2w1XZuFrheq28PpiulFvKpDW0fsdQ7mRYVPCNDXfMV4RdEJj8H75b4wYRnhyzedokEuTlv3QQyd8jvJ+wTZFr8YERA0j62DL3GFTb/GUNLQfdKiLpxcBP1o2LeKhsaGmH8lNjWS4t6s4MWdsve54zfDM0EElHzoDqNQyYa1XbUHsvnCmw0hCZdKpPxUR1+xYlzEVtze61GYJL/LMPsBisxq5SKFj0tr7lGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0133.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::14) by SEZPR06MB6485.apcprd06.prod.outlook.com
 (2603:1096:101:17e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 05:50:56 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:990:54:cafe::32) by JH0PR01CA0133.outlook.office365.com
 (2603:1096:990:54::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 05:50:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 05:50:55 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 189254102E6B;
	Fri,  6 Nov 2026 13:50:54 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: cix: Add USB4/USB5 nodes for Sky1
Date: Fri,  6 Nov 2026 13:50:53 +0800
Message-ID: <20261106055053.948522-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <7a3f7171-ee2f-41b7-b578-da602d95cbc6@kernel.org>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com> <7a3f7171-ee2f-41b7-b578-da602d95cbc6@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEZPR06MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 33828d95-6132-4ab2-afab-08df3bc9ecc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|36860700016|82310400026|261021123027099003|261028144727099003|261102123227099003|56012099006|4143699003|5023799004|261009223027099003|261026140227099003|261021121427099003|261026121527099003|261022105027099003|261022075727099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	qGoMKhddL8nUPmY5uv0d10Nrs9SfSuD/YQzEkzUWMrs1IOSFBB+tAw668jnVHAN9TsuJ8fPjoJvcpTzPCvOBx2COWxu9WNZ2q4jR5rXrVVf3aYcdh+pLVpkO9aqenrC5vvo/K1s9qZFnyClbqGaUWwklrI5V5BwWju5E5ykX+DnrTBaajmfk8BA9KfI8TT9HFVe27ANiD/SHbLcQ2XdmOSpwLQr3sGRiydD5xpJNUcvC3k+QtbR5zhIYaba5R9KFEDVnhse2K6w6tW6PN8Nii1g90oPfS1v6HGFVEVX77jBpmjc+hWNdT0aeoYmKStzt0jIuZOHsKGLHhaG0Uv5AOZxmS/HOIO6Pskn/TykAJkXPDenzCYHKUU71cEK2J25PBZWcqJZWlBXSpWMT72mAqO841fzBST/5yhx+gKV/vFzZQVCMbymXpl0GwyzSV0Sr6hlJjXZGZXa1N+wE+Y+uuZ6PsBHWVAkTI/eRE38sYvngBunX3yjEO2+gEklQbpkcK1mUsku/s5B5ObkQDsuVl+0OsT3gtt8v0Gj3EZvP4Zze/x2kzcLmxQFdt/gwEHQcVUaMRi2TuZ5Ke8EeAv4WzBYyiTkD67Zn8jdWt0sz7dsGRM/XXmsnQrjPokNega6sWN7A3X0VybZk6y77j0yzoGMflB8Sb6sjBe5bzb2/GF/PWbVnmfzwL85IMGiEQDEDwYXd/cLyx+VsUzrqPHVakg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(36860700016)(82310400026)(261021123027099003)(261028144727099003)(261102123227099003)(56012099006)(4143699003)(5023799004)(261009223027099003)(261026140227099003)(261021121427099003)(261026121527099003)(261022105027099003)(261022075727099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	plJyB6YfjgThONQXlgDa4NHX2ZLHdCfycYMNaENMxM5irLJUfOr1qTnVHvTj3h3ayoWsa6ziFdcwIFBPziUjQTqUhanmiQWr+kHqNLqzygb6jpG7ELgk+tzLPxMEn53Ng7hadFFZhCezJiLb+qvGr6XDLhPgiQZV5LlvzfoCG/CGxYtJcgtMkEDV0Qcezk1pWdtPrlgUfEcurxkn3lmQKqDsMyvhVgb9wmNSrgOLFPYhXDZVe8Q+I0AkDy0RTStzfA7y8xwKruJtTmEC9i9TtKzAheoHkhHnS6ImRUh2rEW7ZDA1KpQ01ephGknwWU9L6klCu2RA0Y4Sg1chKNHqPzDZpKy+5PSQuQyzuRA+NyqpoX71ofz4AentbF2KW83c1+MGC7l/PH7QJTAReUK5Q1hIbS4vXP2eu56BOId8CMmmp/Zjmhd/z3PmAAS7N0NO
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 05:50:55.2217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33828d95-6132-4ab2-afab-08df3bc9ecc9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6485

On Thu, Nov 05, 2026 at 08:48:27AM +0100, Krzysztof Kozlowski wrote:
> So you keep ignoring review or parts of review and never responding to it.
> NAK last time, I will be NAKing this.

Fair, and it is the same mistake as on the binding: I answered the v5
cover letter and treated that as answering the review. The full
point-by-point answer is in the reply to [PATCH v6 1/3]; this one covers
only what is specific to the dts.

1) "Shared region is not a simple bus." / "Drop node. Not relevant."
   (b28d5657)

Gone in v6, together with the ranges translation. v5 had a
usb-rcsu@91c0300 node that was a bus for a block of registers; v6 has
neither the node nor the translation.

2) "So this is @14 / But this is at @91d0000 / You have completely fake
   representation of hardware." (b28d5657)

That was the consequence of the container: a node at a translated
offset 0x14 with a child at an absolute address. In v7 the unit address
of every node is the first address of its own reg, so nothing is
translated and nothing is invented.

3) "NAK, undocumented ABI. Drop entire alias and do not sneak such stuff
   in the future." (6029d402)

The usbN aliases and the id property are gone since v6. The mode strap
is now an argument of the syscon phandle, and it points at the S5 system
controller, which is where that register is:

	cix,usb-syscon = <&s5_syscon 0x424 8>;   /* USB4 */
	cix,usb-syscon = <&s5_syscon 0x424 10>;  /* USB5 */

Controller 0 of the Type-A block is used by USB4, controller 1 is used
by USB5.

4) "No improvements, since v2." (7c35c198)

Correct for the register model; v6 changed the container and the aliases
but left the two 16-byte register slots, which was not what you asked
for. v7 changes that part:

	usb4: usb@91c0314 {
		compatible = "cix,sky1-usbssp";
		reg = <0x00 0x091c0314 0x00 0x100>;
		...

		usbss_4: usb@91d0000 {
			compatible = "cdns,usb3";
			...
		};
	};

	usb5: usb@91c0324 {
		compatible = "cix,sky1-usbssp";
		reg = <0x00 0x091c0324 0x00 0x100>;
		...

		usbss_5: usb@91e0000 {
			compatible = "cdns,usb3";
			...
		};
	};

One range per controller, from its AXI cache attribute register to its
AXI clock status register, instead of two register slots. The two ranges
overlap, because the two controllers' registers are interleaved in the
shared 0x091c0000 block and 0x0328 inside the second range belongs to
controller 0. I would rather have the dts say that than pretend each
controller has a private block; the reason the driver uses
devm_ioremap() instead of devm_platform_ioremap_resource() is the same
overlap.

5) The PHY is a separate series since v4 ("do not combine USB patches
   with other subsystems", 6ca4ba08), and v7 touches only bindings/usb/
   and this dtsi. v6 also modified the S5 system control binding to add
   #syscon-cells, which is not a property that exists in the kernel; that
   hunk is dropped and the changelog no longer claims it.

6) "Odd style, please read git commit help page" (0df645f6): the commit
   messages are what git format-patch produced, nothing hand-edited.

As in the binding reply, I am implementing v7 now instead of asking you
another question and waiting.

Thanks,
Hongliang
