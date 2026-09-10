Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0B34A3BF;
	Thu, 10 Sep 2026 04:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015196; cv=fail; b=IMhw6XiJL7up1F6ZnB7FNp8felbf9Im/YbCr6Out5k1seNidL6vbN/Kw6WnDcGBCF0LXkpeQu48zktCPg95FwoTdB/0mDSMCvTR1IBO/ibEfnc5Zt8oOo5fZTTqSxUooJOz0Dlf6rzN83L9AMqoZiOxZxYlFmOdRrpF3sXeq3WA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015196; c=relaxed/simple;
	bh=8xX51ZrGlfvkNWpsMHfWfSFQC+KNgpOo0KxPJqxgask=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XRq7K6opXC/VE1bBAmnoyIVaX/z+VMDLupDPvSAd1FNQ2xIFsmaceOihTzRuJNKraN3SWhuKD4KD6lojsFAshjyz+aksUQ1YpYcwHTMrQLrKpaaGarxvYM0DNZs9Eyp3sxLoS15ObV1FbQK2Dqu/c30BUwmJ+yYEVWTdLnbEzd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=snrhmZae; arc=fail smtp.client-ip=40.107.209.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="snrhmZae"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhbhCRI5Y/DZwufwWOLW92tMY8CCoEAff53XDWrlCvuJmy87QOWQQzb4VwFi4tLrpvnVvGCNX6ULAmZqBzFn9sA6RucLUQYwunYgWuM9WxYgH/vVOPmvGKVfhXHz53qfHQQ3HppLOCddEWRmDZoIsj3s3KloLNoEZDvysfio+/G+gX8mv0JrzxExEb30kEzhG3qviEH9aK3fyI/b7Qy9M2n1h819Y0NXFh7DizpcdDh5CjReYk+s1Gyb5HOm7grPkvqhDRNATNCIfT85qwOSjRJ1/NnP4fLoZ9nlz2Qi4mGJncX7PRXZV1RuDCOywD6gnjemqB6l/STt8/oS0EtzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xX51ZrGlfvkNWpsMHfWfSFQC+KNgpOo0KxPJqxgask=;
 b=oAYywO6AtW17IEJn8YSwONH+Eq/zrHYM/mTFVLB6/KKO57ANjYpIUt/olmBfPbvQkQeQV9KM7Xv+fa8E9Z8CxyoM/ZzcaoCrHyJ7LnGvDBMWMykG7Zksc5uLtAXQRRsnRe9lQrZnGRc3BK7IpRvYSm+34IlkCnqnrQZCHi/rdIfkY5sRyo83SL4CT2D2FLSJaSzCYwIDO4zwdL5lArHHXv3CTWXyPbFCd9QJK2LwMFzgG5xjBKTqU4BXqFwgm6oiQHefTj+6b23VrHpUzpuVpDoXwebmdxQFC10uRMmIV52SGpK7OpfixWpTs6MamE1ONUnMetuMcngj4TNw4C8E2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xX51ZrGlfvkNWpsMHfWfSFQC+KNgpOo0KxPJqxgask=;
 b=snrhmZaep1XEU+Z+JoJxE/unjbWWXP1emsp6zQdKzueQifYmbNq2v9ZD5mbHTyCME7+u6g8Y2/UOhiHIO1jEuH3C4stySx+b6zPHSm5cWL2vBM6WCJCxB1EQt340S/A2f9S6Bv2PtMIcuuhC0L4JeF7SdeQ57dGvuofY+OV28kr0WUZ5qhceqHSeJTS7yrpPXt9HLofatOsmA7bDrvYe55MYwJNKRAnObDiuftDbwa9rQd5ldSsXMn+7zuec/LtiC5lVTLv4HxREcw8ybnS4wsxqCakLEt9VsB0viy9SGKFWfDPkEGZPqVd7HUz3W+HwWFPy77jOWyZYERt24Ibwgg==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by PH8PR12MB7184.namprd12.prod.outlook.com (2603:10b6:510:227::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 04:39:38 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%5]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 04:39:38 +0000
From: Qiuxu Zhuo <qzhuo@nvidia.com>
To: "Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Topic: [PATCH 1/1] MAINTAINERS: Update my email address
Thread-Index: AQHdQG4oBWj+KZ5gc0ajhRCUEVZKirbGZDjAgADXhVA=
Date: Thu, 10 Sep 2026 04:39:38 +0000
Message-ID:
 <CY8PR12MB72901E48FD57969BF72B5115D1BF2@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20260909151531.69074-1-qzhuo@nvidia.com>
 <SJ1PR11MB608383B6612DB096E8ACE8BDFCB02@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To:
 <SJ1PR11MB608383B6612DB096E8ACE8BDFCB02@SJ1PR11MB6083.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|PH8PR12MB7184:EE_
x-ms-office365-filtering-correlation-id: 323875c2-8ee6-474e-96b6-08df0ef585f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 PRWJd34yYxGgl9kzC8JtZkDYCRSPJ7JMmPb7Yqx/Wn1WP4fa29P/h2j4DeCoGjdfNlcfm1A3J3by8VdydghTErFMKn20VB7sfJOuw7VCHOeftUmZZVj+FsVb8LvQc+wvXqHoUKsdvOICQ7fuTzcXMZDyvfevON8p38CbAOEsFLleHVHcGNkO5Od2uIhGchYr6mG0XP7kZE4wfR9sYSOlfBnLeOANj731iLvu+HL5iEz1HERDhtVZNnNCCQBjDQcZICsvya1/a9+Y30YBOMFql1/pBmO79BX1pIwKRBisU0R7lvv02YqqESGa1MOMXfvOvJFLPRH4EICqWJLPBzdPDc5MeFYlP9AM2XFxBjRWjGlh9P/cGazsw1nEGX9fQbggmsCfjmesbuelKBu4/Ui4xFN99187JQVMhr6FJocMBn8upt9cPCUuOzi6DZNnz2TTtuGE4DFylljhUZcDn73cIV5Ks2/OhpKuOqbsblwEycKCtTr8qK399x/mxA/wtB5ZyIA8MBZj6Is3VcTnZD5VDEW+MT+ohe34mSvfobaWQyEtNmscza3+cI4GshCRdAWB2UNvn6YTLlqmox4yJrWbstljMzWNWWBxLJcFJurIr53wH3cXIvVGLDh/u8H/DPFTL70UvhMiGKsRFJAMZeuso8ru2AqkjohpQVsiJ5+Y8tBcmvleB6tlcoB7EIOcOxOzgm62J3vWCJgtgaGiyKBSomlKeaGv1GL6tTNi6KjDjLY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I0KK43A8XZnKfbnAgeYXdcWXlHOmSXbVdkMtcyRYZN5+pxBVDWm7Z16iB3bF?=
 =?us-ascii?Q?YcMZ5RudJJQeD4yzFF+LJK4WWWAMrdralrhxRYRA/L/skfDWoZtBHePpprOm?=
 =?us-ascii?Q?DStwfkCqEpzdd+rc8Ss/sY4NhzQLac6m6wCm8PY5UIVDakB3ViUTqmJBH1RQ?=
 =?us-ascii?Q?CLf7dwkZWJYW368A2CSN+MlMIr7zyjITi+nZ54w72NtH8r41gj/+ns7zFeC+?=
 =?us-ascii?Q?qgRoNFSuNXyyr/puiqoqeG9wpUBMSXUINbdxP4+y1j/0wZMhfiWWRzfvF5Oj?=
 =?us-ascii?Q?dGdh+oPp3C4gUMX7SK3hhG7+V03VqD8WJnA7lZfcXwmiR1KHGdlOMIUMRkm0?=
 =?us-ascii?Q?cCkEHjocWm8ZEEpPtFZxOXat3zP5Yj8JdA7+w5rTDhhOG/rX+QZGWbhoOQn1?=
 =?us-ascii?Q?ZLsUh05cYkVLzLBJLDHsrsUf6XOoGvBmNE9dv6bsZdXOkkoil5wsn8V/BkId?=
 =?us-ascii?Q?B7sHHHVnFm0fcHujDccf+IRjQziBRWJdhVPmQcnuvV3zTwkaxJagJTD2RG5J?=
 =?us-ascii?Q?0vYvCOfhqylqCPcpww8zaN8LI/ZJ8eD+MgZ9ZPaPSnwYyVqUj8Ru5/P4Korv?=
 =?us-ascii?Q?prmIDOVGbvsHnPiBGXsBdpD19OBKZrOV9apw4GNtj+lvYVBrBepuUFlsaeAn?=
 =?us-ascii?Q?1t0Rf0eZvvcshlvEctrJAnqQlEjUAKNusfD+PpkpL691bk1r92c4i5m1pGqU?=
 =?us-ascii?Q?FWeRj30Me6Vi/EeDkmvVKdd6cuupqWkf3mNNrJo9fCFjcyolG1c0eFq3HPGf?=
 =?us-ascii?Q?8MepNNnLBSpi7g8maIQwCN8WkbbtfmFYIORaLARm3GKJgV90bLHZcMhX0M/Y?=
 =?us-ascii?Q?SR7daSdKDWSSsLoIjOmO9iwnEAm7R4kfK/6exic8t6vmXSBdHxmutX/wA4Pz?=
 =?us-ascii?Q?Kj9iCRdn8/P/Falb5S56IVBSJgqD8BVvCvWMvrAKFT5UCvxmfHGJU+TR6lwl?=
 =?us-ascii?Q?TcjThOGk3e3di8KGXrZCCg4q6Nk6OvTQGGtiskxlqDkS8zidwvSM0uSaHnEo?=
 =?us-ascii?Q?2lElGQEoLsmUWWt5SrvcfVuJ2mYTDOXmi6ch5vvDE3lzsPNh6MsN0VP+D6i7?=
 =?us-ascii?Q?AW/UrxwMU/yR0Ft+oOlmPx9eIINi6LxE/4Sh12k+OqXOD9patAHsWhKJ93bU?=
 =?us-ascii?Q?UBkG/aSyDd+4aM9/BvQsz2jaWYifYUJnx6lBO58xyUFr6B0fYombtD9+yrWY?=
 =?us-ascii?Q?tnnqVgpmkVlE29pvmojmJgUM3ZUK4MKh3gbsRO+WE99MzVYWl8hTgo1MYvQy?=
 =?us-ascii?Q?HoQRqPyiopn2VtzG/PV+wdHUU1nYn6kHV1XakGyyo0Jw2PKr/3la2LhYpRnc?=
 =?us-ascii?Q?8E40o3jfwZNRlhq+OOETb7n50VRidad6Rr5Nf6XDtV5FCSQiSNxfWqbbUSOM?=
 =?us-ascii?Q?J564D3TH9jVDTKP6fVal4UmqUtDW1yPBe+JG6ur7z9znCMCpJOIxr5OCr+A1?=
 =?us-ascii?Q?BdY/Q4maLbkebS+THjN/mGkmh/Ry1NbcpCJ2VeizmZyWtyQxr7VZa6yxYpAw?=
 =?us-ascii?Q?qB5UNG46q7NvTUshRJ1rFBsg1dkLyNylwuiOWtyOpAEwM/YDZJUOU21O8b7L?=
 =?us-ascii?Q?XCEkAvTcbxfKJBscJLneSQH1++MkJFUemR3wqf5bgLm/LaxG+cIapLbNmMUY?=
 =?us-ascii?Q?ZowXlVtZtr+WNu6zIyWeFkjYPRTo0B0NV1aVL+QRB45qm+2zOpv/tNvWHTQT?=
 =?us-ascii?Q?iayc3yE3uXsFJ5gRIYAlkbTbpXLDDdu4peFclBuYSsA19eym?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 323875c2-8ee6-474e-96b6-08df0ef585f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 04:39:38.6788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQ5boR9Jc4NKOJqVIv7EH9tzZvtYAiTcHRNsttzEByqcvcevEdnlWc28cSS6HDDNa45gH/Add51mnBgsaU6UnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7184

> From: Luck, Tony <tony.luck@intel.com>
> [...]
> Subject: RE: [PATCH 1/1] MAINTAINERS: Update my email address
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> > Following a job transition, update my email address to my current work
> > address. I'm willing to continue reviewing EDAC patches.
> >
> > Signed-off-by: Qiuxu Zhuo <qzhuo@nvidia.com>
>=20
> Acked-by: Tony Luck <tony.luck@intel.com>

Thanks Tony.

-Qiuxu
