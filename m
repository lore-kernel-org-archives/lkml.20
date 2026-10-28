Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793162889;
	b=Q0IrYdAkjx4CjPMWzSTVPFOYF8vAol/coxvccbpG+ZMAChz1OFk45zX2OJ8FLBb+BRHr
	 agRChZG7SS7gI3DIA8IUzFx4BsXi1qZUyCCQVMtqYduVsTgql+NiwVJmIpbBnDFFXXksS
	 BG35W0iFfJ9jBAg58Q+x3ynmPwaww6JskPGbFIUkh7bLN7cRqFJ8ounBbR7bNNvQ4rXWr
	 dN5doCvgI+ljFLZkoZ+nHfuybVNYEzenGdrnprepUXX6Lqiqh6DpZX78olWyLOEpUK+hd
	 oWjDEFm7IqsZJQSR+jDvIjALz+PnCvJ3J4M5j7IeY6k2DVIGeUPdnanRzb8hlEFLcMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793162889;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=r14JYt9k/EKPWRcFMPrR2sEg6wFrz4r3mTyV0BKnPK8=;
	b=tihJ60vIXBPoPbsLoQM16nz25wzpMF2xw7K9Dje5c7W2M9VUM+yzxlBQU1xmLpmftfmV
	 VAmT7jMtHKdnQOsxl01WrarIFHcbOtwiGBQxiDegsc8lP7niEDD1RApBWrzaiqpp72uxD
	 9g+oHcsABfqZ3OIIRBnDEBVGRif1a8BLuHLjbbep3QIveoId2CM5N5pPHVk6RjpI9C2hI
	 zfPT9oYjtmsXMfc+gO26X2gUnDF5xRSHaiOwJVkbUGwurmVdVWm/jwwWl4XzCN8KWQKc5
	 xQyrZGWG8mJqRuapoj5jd/pUuE+30fyRohJZ4zevUjvDqhIPkTWZCsxP4Fw8TyKbYUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="Rok/R0MQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.49
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D55E606A31A;
	Wed, 28 Oct 2026 04:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D55E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Rok/R0MQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrPfYb2936FHjLrCMjB/tTdTpeTPqtF2Sa3jmDthAR+NDf3eNncEzVgmrXuzKiD6iz3iZZmqU7vCJYy22MjbRymQhQxhk/ljwwOCk7QKge70MZlJd/7mEMpW2r01xEi8aEFuiLeYhlT7qD5lSPDC6eLvpYofhLluZ4fuDfaljAialbugzlWeGOXonAey1kGXEpM6yjXCjVbZrU4IBMlUbWCScEhEH+IlDN5aOSNfIUOUqqDzVZpLnxA9gOMMglYDMi8dV0K/1lrw3RrrTEwe2qymKREcDLK1suhyJJFtkpGiKRlgdvdRSzuFuu3TNRBrryBcWmtamxec2af3D4V2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r14JYt9k/EKPWRcFMPrR2sEg6wFrz4r3mTyV0BKnPK8=;
 b=knzNEd3ZTSpadL3mzI5SE4taPt7carvCy1fEyIs5xU2fo775XMHJoBDxZ3kwSITS18gHVbn0bKvg3QbJbE41jG2Gb/99RHcjld9CFmE8Y/lYIP5n4UDql/gcH4JRYwZnZ3WNmCAwbs+CqwEX31dlK1/jrm4X3twgPERAQGXwcD0Hf+1puom3Sb6nU1rrouiTss3yfnpXhgg+eW3D0CdopobL0qRaHkqIL6o5DQmcCQEAwoiddv1DVQDeKMcjU3ddvnmgMwMtW92SCQfGWA1LpIV4OkghohmJ1rKyK9nvBKzNUlflFWQDp1MLDuesnaUKu/mMmGn6aiYiNHQLPu2J1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r14JYt9k/EKPWRcFMPrR2sEg6wFrz4r3mTyV0BKnPK8=;
 b=Rok/R0MQ3PutNIWotE22lXizdqE0KwwAVRcnu9ANEY4O/qaATio2w3p5HQVY7cQhQueH5gyX7hThseMnE3stcVzq8MBTY7h2EDnP3Kvf+Y14pRD9kjprxJLAI237UeZ1LcLkyDNsIc+LUeVoTuxC7wAIg/nuelpGMmzvNnfnVCs=
Received: from PH0PR12MB8125.namprd12.prod.outlook.com (2603:10b6:510:293::6)
 by DSAPR12MB820198.namprd12.prod.outlook.com (2603:10b6:8:51d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 04:48:02 +0000
Received: from PH0PR12MB8125.namprd12.prod.outlook.com
 ([fe80::7fc:980b:9891:6c43]) by PH0PR12MB8125.namprd12.prod.outlook.com
 ([fe80::7fc:980b:9891:6c43%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 04:48:02 +0000
From: "Veggalam, Rama Devi" <rama.devi.veggalam@amd.com>
To: "Ghannam, Yazen" <Yazen.Ghannam@amd.com>, Rob Herring <robh@kernel.org>
CC: "bp@alien8.de" <bp@alien8.de>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "Simek, Michal" <michal.simek@amd.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "james.morse@arm.com" <james.morse@arm.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "rric@kernel.org"
	<rric@kernel.org>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
Thread-Topic: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
Thread-Index: AQHdYVvK+AnpE6IiD0ifHuUGOb9kqrcJowQAgAauawCAAhpwUA==
Date: Wed, 28 Oct 2026 04:48:02 +0000
Message-ID:
 <PH0PR12MB8125B27A7814A3818739C4B9CE6F2@PH0PR12MB8125.namprd12.prod.outlook.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261022143730.GA1287910-robh@kernel.org>
 <20261026203920.GA696395@yaz-khff2.amd.com>
In-Reply-To: <20261026203920.GA696395@yaz-khff2.amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-10-28T04:46:28.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB8125:EE_|DSAPR12MB820198:EE_
x-ms-office365-filtering-correlation-id: f5edd754-e3f5-4dcf-fa3a-08df34aea5f4
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|261026140227099003|38070700021|11063799006|4143699003|56012099006|261026121527099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|261009223027099003|261009221227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 iD9Jm4vo9eUh8lEC4gGy5tno02Y/IzA1FLynWbtgpKaPe1Y+obsFs28S+R9J4FvOfIfUYSYiJgbFcg3hT5umunFaYPf9PBblj/R+6SakhE9t8s4jZ9Cy9oJPI1PZWJvaL/mZyUVf4WEuGUho/HNqEsDkmGIYKMWq7Qt09iKO56YFeywaAHpLaHDlRqI7Qhg36LJRX1wPzczRJFGNFmabX+D02VeEHSfAeFiNQhGC+GQcRAjl3VLsgCRwgJD4jh2VFDbAxK6HpzrA2UJk0ivk7WI0o4frSHFAhc42nPR564BFi6tlT8piL8r7oBjsd3dBMGQgWWPWzAtX3hpeua3TDGmeDj53GB+G5NY9Bmqb/GPWHFV5dp45vo4YaT8A1HW+dEwBhbOEqdnvRdjEZda1XP5y3N+HIL0WJaht81qySKK60lo7XG5ud+tnSNGRR7I453ddsb9TRCCu2aXkTlaHc2LRst9ClQKqNJGm3At2ElgHkaZYsSuDOOnrBpNc1q1gKVR60sJ84Sh/5WZSKszG85oILB79X7yB0MKY1EMRqEhYrKVuQFChWuC3BDP+b/JBewmql3gn/C2Y58ynaDUPiX98KQWkpzxAFJ1JgHupnzO/e7RECqQPrFLieSzKIk7bIpejx/rOvblVEeXUWSCJ9W3hiF9DVaUKwjfMdq2AU+0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8125.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(261026140227099003)(38070700021)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fi9NeAS0uAACQ8+PQJtIYcUj9YIvpM5AVC9wnLxn9vqYIrbhVBrQHHnFJNay?=
 =?us-ascii?Q?6GP+LmmXyOZirhhujLycNw/Xn1cYzzLvIbBOmYEdl3x1FXAnXRXyb5d2VORi?=
 =?us-ascii?Q?j/x0mvyOuYGEK1OF3co/n+1bDG6vFN2xkAskJ02Ngskh5ayxED9cEOxydDup?=
 =?us-ascii?Q?pmZi2nXmZPWplotAqBGQQi508CORm02K7sKDsLJNYWbnTtJ51u4/uqMCBm5c?=
 =?us-ascii?Q?+ziUhzRKlgy9KYAYZQHwhVu69zlBXc4Y/mEq12sLrLonx6r4c/POXn8rBJRh?=
 =?us-ascii?Q?05opzVL2Tk30DqYhr2VpyAebdhp0Kfck+IiZgklPegrWYkE3O8UKqJ4U6WCs?=
 =?us-ascii?Q?5Z7LE2zED/55mUbYAGcwWlka3pwv8B3JbikQ3cts3+7zZOe8IFJJi8E5x4Lk?=
 =?us-ascii?Q?GJxGmAMtUTz55oKfMoUqmbQ68A3RUVPlGPF+V2j1yuIiLza4CttIKs5uyB/J?=
 =?us-ascii?Q?eW78TppEcT1/F29MSpgP65n86ZdHRgDOmBgoOBm133bpPNsFJbubBfpY5c7k?=
 =?us-ascii?Q?0sYYhXnZgazIr8rrXRXKB3cbWJ45nIomGyq9x0ZIg3Y4g0PwIKSeDu13Ka/Q?=
 =?us-ascii?Q?AyKLSAw9aMyNErRUQwueIz5Gs4hB4p7ieB/UN0myy5AZ+e8DU6FpDIkCJzf8?=
 =?us-ascii?Q?WKaloi2vRR9aq0etQo+tcCxjdosTapaMOw2y13lYJzrR8maoZayV6xKwBdxM?=
 =?us-ascii?Q?gkqzi3vpffFxZiCh6dMg8O1yEs5muvImbyKUj0/zoElb9Uks4iGztZQjVB6n?=
 =?us-ascii?Q?HrP1RWvm3gA0ih3waoOaubGKzitXCEfRKTWR3vT1CH55wT4UM/RaASSnsykH?=
 =?us-ascii?Q?VhxJeENGxORD/TEzS12RMpDFMTh4dQ4VQ7nv6LY1BX8kt/oM9iZw+0d9nEcr?=
 =?us-ascii?Q?w7oFlAfJ5ZcqG4jkVfgVfdMPS9Z0RzVfchRvEyiLlRuEty7+aygvennjxAcp?=
 =?us-ascii?Q?SytRXqMSwIWRgaA/G7RmV3/buZ5kCoVOOxQRhpbgRBlTCn8Qv75Y1WOMkFb+?=
 =?us-ascii?Q?Zb4kbG9miHcka/3IdKIATHaf/nCeBeWrU66ZlvdpVQKb2TjuMrP8nx/H0jAL?=
 =?us-ascii?Q?9cUYGgF9EPkxkp5bilZLpiJGWUgwJXKUtDjG4q8YF2kY/G1/biEN42JriQBk?=
 =?us-ascii?Q?u2uqGHsZYqPUmOyDr7jfa+0PQT/7R24AIr/UXJMB/cEM4VrZC07ySLuodZ9Q?=
 =?us-ascii?Q?7M/ev1NrGThevi7gEsYzRcfiRKGYLkmnUCIHbHvLlIuoeldoLxfAf98UW2ZF?=
 =?us-ascii?Q?z8HfHKhFDqe1sQX6pseg7Rl87nyN1z+MnTdK4RcXnQtw8am60PEs/z0xVz2U?=
 =?us-ascii?Q?xbfgQ9h54TqtFVqEkc5Mz/oYYHkdvB4UXL8UOW4jSG+FNb7sPJbFI40VEorP?=
 =?us-ascii?Q?xhVhtJq3jCicV3Hi6jw5CvvtddrUsY8HFJC0g4UU5OGHx7l87KCikN0EIvkn?=
 =?us-ascii?Q?wlshqZeHk3HzxTjBfQnHive/nyWAxI+cB3R2kYBSczyue7wv7gqotWxH6pRN?=
 =?us-ascii?Q?yIpwjxWivWmiO0IwjUcs8IiSZELPaQy3lO5Ukwev94t1X8iPCmNNk2h7HsAM?=
 =?us-ascii?Q?Fk93WpSK7FDpEd91iFIAtyPOiWghj3uvdxFy0+YVu5YSyU9aLZkBc2YtNTQ/?=
 =?us-ascii?Q?x3xwdGOPsf78ZPQTtNmIMepRmVdy0/7F4sSbDg8gogXtWmKCed1i8tE9Vy9v?=
 =?us-ascii?Q?a7DKk1HNz2r/WIxDvPwM16BsLDsk8D9hwwLfHYq55vaZ7ioG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8125.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5edd754-e3f5-4dcf-fa3a-08df34aea5f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 04:48:02.3007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: isov17JpTu4kk4Y6h+Ixzsz0h4j8nFLyknRxMYwYfeEfBpJ1cDhmeDHgGKDztvTuB7LHb36skIy3weuY9s/JUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSAPR12MB820198

AMD General

Hi Yazen,

I am evaluating both approaches and will get back to you.

Thanks,
Rama

> -----Original Message-----
> From: Ghannam, Yazen <Yazen.Ghannam@amd.com>
> Sent: Tuesday, October 27, 2026 2:09 AM
> To: Rob Herring <robh@kernel.org>
> Cc: Veggalam, Rama Devi <rama.devi.veggalam@amd.com>; bp@alien8.de;
> tony.luck@intel.com; Simek, Michal <michal.simek@amd.com>;
> krzk+dt@kernel.org; conor+dt@kernel.org; linux-kernel@vger.kernel.org; li=
nux-
> edac@vger.kernel.org; devicetree@vger.kernel.org; james.morse@arm.com;
> mchehab@kernel.org; rric@kernel.org; git (AMD-Xilinx) <git@amd.com>
> Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
> xlnx,versal-xilsem compatible
>
> On Thu, Oct 22, 2026 at 09:37:30AM -0500, Rob Herring wrote:
> > On Wed, Oct 21, 2026 at 06:27:20PM +0530, Rama devi Veggalam wrote:
> > > Add the "xlnx,versal-xilsem" compatible string for the Versal XilSEM
> > > (Xilinx Soft Error Mitigation) hardware block.
> > >
> > > XilSEM runs as part of the Platform Loader and Manager (PLM) on the
> > > PMC and detects (and optionally corrects) soft errors in Versal
> > > Configuration Memory, notifying error events to user applications.
> > >
> > > The new compatible string only needs a single register region and
> > > does not use reg-names or interrupts, so the schema gates these
> > > requirements per compatible string.
> > >
> > > Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
> > > ---
> > > Changes in v4:
> > > - Added a new "xlnx,versal-xilsem" compatible string to the existing
> > >   xlnx,versal-ddrmc-edac.yaml binding, gated via allOf/if-then so
> > >   DDRMC and XilSEM requirements (reg, reg-names, interrupts) are
> > >   validated independently per compatible string.
> > >
> > > Changes in v3:
> > > - Merged XilSEM edac with Versal Edac
> > >
> > > Changes in v2:
> > > - Changed "xlnx,versal-xilsem-edac" to constant
> > > - Removed "compatible: in required section
> > > - Removed "|" in description
> > > - Removed "items" in compatible
> > > - Fixed indentation in examples
> > > - Updated title and description
> > > ---
> > >  .../memory-controllers/xlnx,versal-ddrmc-edac.yaml | 64
> > > +++++++++++++++++++---
> > >  1 file changed, 57 insertions(+), 7 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-d
> > > drmc-edac.yaml
> > > b/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-d
> > > drmc-edac.yaml
> > > index 12f8e9f..b5dc320 100644
> > > ---
> > > a/Documentation/devicetree/bindings/memory-controllers/xlnx,versal-d
> > > drmc-edac.yaml
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/xlnx,vers
> > > +++ al-ddrmc-edac.yaml
> > > @@ -4,25 +4,35 @@
> > >  $id:
> > > http://devicetree.org/schemas/memory-controllers/xlnx,versal-ddrmc-e
> > > dac.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >
> > > -title: Xilinx Versal DDRMC (Integrated DDR Memory Controller)
> > > +title: Xilinx Versal DDRMC (Integrated DDR Memory Controller) and
> > > +XilSEM EDAC
> > >
> > >  maintainers:
> > >    - Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > >    - Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > > +  - Rama Devi Veggalam <rama.devi.veggalam@amd.com>
> > >
> > >  description:
> > >    The integrated DDR Memory Controllers (DDRMCs) support both DDR4
> and LPDDR4/
> > >    4X memory interfaces. Versal DDR memory controller has an optional=
 ECC
> support
> > >    which correct single bit ECC errors and detect double bit ECC erro=
rs.
> > >
> > > +  Xilinx Versal Soft Error Mitigation (XilSEM) is part of the
> > > + Platform Loader  and Manager (PLM) which is loaded into and runs
> > > + on the Platform Management  Controller (PMC). XilSEM is
> > > + responsible for detecting and optionally  correcting soft errors
> > > + in Configuration Memory of Versal. Whenever an error  is detected,
> > > + be it correctable or uncorrectable, XilSEM notifies the errors  to
> > > + user applications via the firmware's event notification interface, =
 rather
> than a devicetree-described interrupt.
> > > +
> > >  properties:
> > >    compatible:
> > > -    const: xlnx,versal-ddrmc
> > > +    enum:
> > > +      - xlnx,versal-ddrmc
> > > +      - xlnx,versal-xilsem
> > >
> > >    reg:
> > > -    items:
> > > -      - description: DDR Memory Controller registers
> > > -      - description: NOC registers corresponding to DDR Memory Contr=
oller
> > > +    minItems: 1
> > > +    maxItems: 2
> > >
> > >    reg-names:
> > >      items:
> > > @@ -35,8 +45,39 @@ properties:
> > >  required:
> > >    - compatible
> > >    - reg
> > > -  - reg-names
> > > -  - interrupts
> > > +
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: xlnx,versal-ddrmc
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          items:
> > > +            - description: DDR Memory Controller registers
> > > +            - description: NOC registers corresponding to DDR Memory
> Controller
> > > +        reg-names:
> > > +          items:
> > > +            - const: base
> > > +            - const: noc
> > > +      required:
> > > +        - reg-names
> > > +        - interrupts
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: xlnx,versal-xilsem
> > > +    then:
> > > +      properties:
> > > +        reg:
> > > +          items:
> > > +            - description: XilSEM (Soft Error Mitigation) register r=
egion
> > > +        reg-names: false
> > > +        interrupts: false
> >
> > These 2 devices have absolutely 0 properties in common. It makes no
> > sense to share a binding doc.
> >
>
> Right, and maybe DT isn't needed at all?
>
> One option in the Sashiko feedback is to use a platform driver.
>
> IIUC, here's a summary:
> 1) Drop this DT patch.
> 2) Have ZYNQMP_FIRMWARE create a platform driver for XilSEM.
> 3) Have the Versal EDAC module use the XilSEM platform driver.
>
> Rama, what do you think?
>
> Thanks,
> Yazen
