Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11022098.outbound.protection.outlook.com [40.107.209.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7775C35C1B2;
	Thu, 24 Sep 2026 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252805; cv=fail; b=U2Yum2kgEamndEEB4xyZ8GV5tWLhlmb4/6mNoAoN9J8w1N05JUZrj9LY2q/GyyeHH2Xey5E9/OVd8tg/4PwEthETng+7Cy/xOeLTZ0M5QZelSvXOsEF+h63YwP9hb3y7GIIEXdCuiZegry4Oaq2rBW6Ytllh15XH0coJeDTRt28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252805; c=relaxed/simple;
	bh=E4duF26uw45GQXW4vGK1Hb04SfZgqVMZl9LIADehhAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W2y8hqUxAvXxEgd/wel9e0XCrsaTNAbZa1m8dssY04KwXSFL6eU6j8FmhFWBuIOjrdTLa86JzOddcjMpb+DjSZ9K+RYxxJPOakGIkHgrN04/keuv2joM1w3KhARhoupm6hVVoX0c9CA0RsrC2tNs8cDTrv2nPNo7tyaOWjpezEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org; spf=pass smtp.mailfrom=lieber.org; dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b=mmDE5I3T; arc=fail smtp.client-ip=40.107.209.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lieber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b="mmDE5I3T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsRo9k+7Jr0COSazaFwzvjK2F+N08fVM2GSSQZmB7FGF52qcnwXwpKFlq8Z42Io96YSZ8Vfx1prwnDd4tIoe7lFfLO+GwChoNCp4rId+0Jo+rthMVlufW6r03AmxWx/CkGoNNNU2E+kQ2V7Lr0+tKKGaaXLnQmTbDhlwxlQ6iW/0o91InWcyDYL/7+cIGcAehWeVp3CWsB4QGpj67s+iGeUmUmkMMWTxE9KgsFGKvyEGSZaUf0KU0OF0CTFAr1635bpnvFCzV3jlYfvyPPQH+06yNVNFkj7gYyA1lzFFxazZjCO95z6FwUDUcae/50L7uJUiCytqRLweib/zWLTKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mA/BU78xhBed7iNu6lEnIfOPb1U/xRiB8zzX0R65AdY=;
 b=c5kXahrPGzizB1KdcSJfCKC7tEzGEjDZEbgfBoQ8skoTUT+vft1z77GJ+CycdArAEBoGtZvuNtVp+2VNv13lw5Hfx0Srn80n5tELNxk7pavgHMaSTow7I0TSSkW6qqYiE84yGgit9fHS4GZYoYeGh3IFUrtTMe85FzI6DQv6qen9J5t39oaiOAdsjUfn1xzDbcoY1EzSGaYXvqzpP/X5yVxrMIG6rTnb6+AaQQ+w3JwvUqSsRIzdwN1WS1ibPdBEekg/aMhberTKpGGRP6Bx4vrpfc0KmlH7Sc1+w8eb0tq1Z4Hf83g10mcdQIvzU/uH5GoI7lPA2/CFqvs6oKNvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lieber.org; dmarc=pass action=none header.from=lieber.org;
 dkim=pass header.d=lieber.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lieber.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA/BU78xhBed7iNu6lEnIfOPb1U/xRiB8zzX0R65AdY=;
 b=mmDE5I3T7QwHoIg0q3cjqzdArMUNvtBifG0jZL6ZHCa9d4qx8G8ULwygt7+c1IqKODN5QSKsrvXclafim4AFCjiVFSy1cVncXgsVbsuPZ/wm6XH9T6fbix5H6fHBN+zOddN/h2NrWdBs4ir6EDkf0J1FIwZV+8TVrjiykWnvVmYwFU+tJzdkJRuxuuYlgMYvR118c83CpCWNGekrmBL6s7P35U8oOpVV663wPDhkhr7xjRpxFesW/Vy5qTK3gv7g01Sew+MJglZhkmifoDGd0g4wphWOHkLnNxHIrqfkI0Nd0DBH5wE10K8PMoadTKUG/kavITXhgX1Iry0GGNIiZA==
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com (2603:10b6:a03:37d::17)
 by MW3PR15MB4009.namprd15.prod.outlook.com (2603:10b6:303:51::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 12:26:37 +0000
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61]) by SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 12:26:37 +0000
From: Kurt Lieber <kurt@lieber.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>, "westeri@kernel.org"
	<westeri@kernel.org>, "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5 dock
Thread-Topic: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Index: AQHdTB/xumZMHV37HU+Dgj/1DHc0GQ==
Date: Thu, 24 Sep 2026 12:26:37 +0000
Message-ID:
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
References:
 <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
In-Reply-To: <20260924101046.GN106095@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lieber.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4696:EE_|MW3PR15MB4009:EE_
x-ms-office365-filtering-correlation-id: 2b909b6a-6a29-43bf-1a68-08df1a371432
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10070799003|10067099003|56012099006|4143699003|38070700021|7055299009|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info:
 74pncuXkWRd42fDiPh7XKmBtWSMmbv7hNZRm13DJa3l80kBVRGW9Qljg5nCXzY+5QLHx+B6ydue5ro/2YTZ5XYhsreqsiF/kR5sQ+cY4sBxteRaENRkx7WQGYEub3s4fHw1oxMqvHw5fGIPh56iDRJO0h8ZFJ4/mu52/wOk6Vb/dzvNq5ZixhgR0Q4frOKmXEQ2NENMeQtsCFtVYFfYSvEsZmWj3E8MUURgBZ8GPuERlU98qvNw6nbzjY70PmQzvaJ48yxqlzyJxRxhPVZ3P/umDcPSwNof5l0MsXh1aeagDT1XZLKg05VFK/Jto31GEIl1JERTKx0oScwKfegC4mvDC+hunj+WupX2tenYbG1vnhc5F2/wJCjFYpAMHAXycFoREoyHZDbyWWu4GlVPAoWinRv03JTvA6VmV/z8RGnLUM89wV3OLSRsmB9BvQd6O+lEhq0ih/vHqjN6sCsq8RY9OgzWtzxUMMaunry3/3p/V1I/0tOz3rLzGCogXuApPWz8kIJndZ1/4zwEVxnbu9VcGJoNt6OF/wZD9AwdF1BDeGuncukP9fRkEFdSWR9PxzMkTL57RTKP4tC0YYipWKaNHtYRrsRLdjcaZw9wBhDFJ7UHIbq7w+BuMftVsspHaRGUWsQ+NAbNSpiXpFX/rtSWbmUjxNEBNw3GM8o14i+BP37dDXY7xCwnRUCnHIhmoRMwxmHvdfmTdOv+VZ+nGfVIuRID1rJMTuB4kcNaEvtC/59DNR5MBU37N6e+Z4kDG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4696.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(10067099003)(56012099006)(4143699003)(38070700021)(7055299009)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PcdvuCcLZfEQOr2UDNrr/xjUDsgnR5+jfaOf1/upah6JtqivgEOnb6Fzev?=
 =?iso-8859-1?Q?7SMduDdS5UjWAvZzd+ZFpoO6rUzE8j7ujMh+BeuH8r2boqM5cTfjUAhpbF?=
 =?iso-8859-1?Q?6Q2HFt4ce87G8HxhIdQCEDeCe9Yj5XxVpbSNNcmadm9q82+LdxJTMf4M+q?=
 =?iso-8859-1?Q?qr3lPHp6cSGjm/sgG4WozWyplR8ZoFHC9F6pMNvLnvmbHWZ2jSlchkbTU+?=
 =?iso-8859-1?Q?LNy0sruVY9evwNQsh3NVGNTIWfUgnZEFQhkCIGnIwFfCUi9190oggVvzbA?=
 =?iso-8859-1?Q?jiKWvjs4RCmh43QHoIrMiO1/nrpVTW91zXxVBj7gyob85X5rMXq6y+9o+2?=
 =?iso-8859-1?Q?80oNmkQm8u1pLnI7mdFXM/taPUJTAKdh7wWFCiHuyjIZ2yvca95iQ5Ca9f?=
 =?iso-8859-1?Q?fND1DFr7D24hz0ziSGAfc1l1g/Ez0Gm+E9cIqmvwEyq5I9keQUBGQbPJs5?=
 =?iso-8859-1?Q?r/GLuBXHJtFmVDBtEcl/q5yXRtD+ctfdY44ZBv6C2+nUPytIPWC0MZI0bz?=
 =?iso-8859-1?Q?2WxBu8RX3YSj7TWfR337VLkFNKjx15xSuriL1ijaXtH1zueDXPKxQ94iDA?=
 =?iso-8859-1?Q?r+iU/6R4sGet461rJZFmcGhlnuWu1jh7cM515NWPVaTmv3gdFa+98r8Z+T?=
 =?iso-8859-1?Q?ikdODZkVHrgZTLM+V9u/mU7x4QXtbjGJ5yukLi7L0SLDQd/aRWc+wEsqsf?=
 =?iso-8859-1?Q?MNp79rtyYigR8F0K0V4TPVBU3R3VvzDqhct1a5NPU8CO96jH0x3VpCtJhH?=
 =?iso-8859-1?Q?h5JkC2F7xsbno3wj2KL719AxzK1B6q929++DeagDi1Kz3C5H4RyDa5lyem?=
 =?iso-8859-1?Q?5gYLEjUm24WK9HAVOrP0tQ4/k7dskqsbfrbxi201KDu3+SjSQNXiDwSRLD?=
 =?iso-8859-1?Q?YFsBCBd1SrQ6YxN4Da+DZJiJv2phwFr8gTfW+uwdjnbCi7IiOU/u8DeuLl?=
 =?iso-8859-1?Q?8HYVmwU0El2fbCj7+NXDOBnVl2Tx0af3lqDp+mhlrs/B/tSUYuRtQMP5+O?=
 =?iso-8859-1?Q?alJZCN56kda+LxoeRHpTaTK0CXTJFc4kZgHClbwI+t1+d8GCSAwZEsk1Vd?=
 =?iso-8859-1?Q?2CPdczl63CnMIUwwuwzjaXBpxFcT3CRbrvUyPUOCAeHCAMWhKZshc9mQg1?=
 =?iso-8859-1?Q?OoSNkLZb0A/MQe9nFJaGNjuqup63YIx18GcQQrOON/pDmWQ+EGB96U1KKl?=
 =?iso-8859-1?Q?daUM1T7BS2nFPnN/sTKdsPIgI1O2r2Wr2sgLd2qTWsvUy1byWtbMCemE5j?=
 =?iso-8859-1?Q?yhQJDHi0tZ7rSeaS5+83UEDILbnw6NyH8sHG5RMwE73k+ZJfrMqi1Qt5sv?=
 =?iso-8859-1?Q?IdyavjtdfW6mhB6/6/3BNQN+fbkzyOHqjOGR3ezNsfhbmwI3PU420C2WZx?=
 =?iso-8859-1?Q?FlNcrm7abMXxgoSVi5mrHmFiF79E4Jp3decMVuh8L1Pyl+qSM2raWUpzpQ?=
 =?iso-8859-1?Q?k1WJXU+57r7f+yLhe79+awaKBbrxo4/cS6OvZVyCl/kHbHzNn57GcPa3Pr?=
 =?iso-8859-1?Q?iM7CSZbkd1zh2PGzLv1ePtQjLGvWhZ92BCJappAMWUZDhpLxr+9ku8IfZk?=
 =?iso-8859-1?Q?R19cECb9mWO99ycZScy5icAS3aD717b2+KhlnePN93qKtLrnJSWu9/xKDM?=
 =?iso-8859-1?Q?5+6Dr9EXnlHZ/E/+dhsOC78KL/7T6ClZoZjytuyY9/YWudT2HZkNZDACme?=
 =?iso-8859-1?Q?sZ6d3Q2mW/ZvjZCqow+edObrlv9LQ2/65WbbiHw24PYNTlaZtYRiZLlDTs?=
 =?iso-8859-1?Q?1CpMv/TS48TFafy9EfP428dpbeG/3fsMdA3r1aEuWCdyWuSaVaFaTCUPzQ?=
 =?iso-8859-1?Q?ow+ScH10gN7DGoCHD6y60Ys5W+7S0LX9le6NUre4V2G9NY7P5hG7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lieber.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4696.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b909b6a-6a29-43bf-1a68-08df1a371432
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 12:26:37.4114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 213667ce-a7c7-4f7f-ac87-9abccbddaa2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tUdYwRK9Gd5sV5PMOU/N2acVQGbRpEN2Mt+glJyGBMpaOyT9jQifjZH4uO1bdCgY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB4009

The Anker Prime TB5 dock identifies itself in the DROM as 01ea:83b5.=0A=
Its router config space is an Intel Barlow Ridge 80G hub (8087:5786).=0A=
The upstream lane adapter advertises CL0s, CL1, and CL2. With CLx left=0A=
enabled, TMU uni-directional LowRes setup fails with -ENOTCONN, the USB3=0A=
and DisplayPort tunnels are aborted, and the router reconnects in a loop.=
=0A=
Loading thunderbolt with clx=3D0 keeps the link up on this machine.=0A=
=0A=
Match the DROM id together with the Barlow Ridge hub id and disable CL=0A=
states for this dock only. QUIRK_NO_CLX takes the same early-out as the=0A=
module parameter, without disabling CLx for every other router.=0A=
=0A=
Assisted-by: LLM=0A=
Signed-off-by: Kurt Lieber <kurt@lieber.org>=0A=
---=0A=
Runtime-tested on linux-omarchy 7.2.5-3 (LG Gram 17Z90S, Meteor Lake).=0A=
Booted with thunderbolt.clx left at the default (Y). The dock came up=0A=
once, CL0s/CL1/CL2 Enable stayed 0 while the support bits stayed 1, the=0A=
link stayed in CL0 at 40 Gb/s, and the TMU uni-directional reconnect=0A=
loop did not occur.=0A=
=0A=
 drivers/thunderbolt/quirks.c | 3 +++=0A=
 1 file changed, 3 insertions(+)=0A=
=0A=
diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c=0A=
--- a/drivers/thunderbolt/quirks.c=0A=
+++ b/drivers/thunderbolt/quirks.c=0A=
@@ -116,2 +116,5 @@=0A=
 	{ 0x0438, 0x020b, 0x0000, 0x0000, quirk_clx_disable },=0A=
+	/* CLx is unstable on the Anker Prime TB5 dock (DROM 01ea:83b5). */=0A=
+	{ 0x8087, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HUB_80G_BRIDGE, 0x01ea, 0x83b5=
,=0A=
+		  quirk_clx_disable },=0A=
 };=0A=
