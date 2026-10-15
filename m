Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020098.outbound.protection.outlook.com [52.101.201.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025534AA1F3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792097435; cv=fail; b=sEvfJthTzmFPA/lLANA0a7WXf/OqCNzKlGk+zuX+k8CG+nDvBJ65ERPdPY+lnStYjFKAz58+d+X8rRr+3o5n4cXcDEOlgZzjH2os+SpRhzJzvCROW6ko/hRkK5UPQieZW3w74amG8AyzrfhMOioYvkd7wVP+P/otgRgwW7qUZ1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792097435; c=relaxed/simple;
	bh=MbZYyBHIrrN//tdf/2L4DLjGxLiWo4LpeV4hAAf8MYw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BhWkCPuFuBIdt/V+p7RgwuUJTRZ/SenywC2UF58DySFvoISKUq35r7UO3Aw8kNvzxUwyHOpIfgj3sJmGDayGrUCZij1hoaaOfeX6jINH3AqlqtbTyhlKJHtf4v5CgBlOobrOQIqhHZBHII3SbTXYHsSauAlGykbPCLdq8EeyhuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=hxlidVKc; arc=fail smtp.client-ip=52.101.201.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="hxlidVKc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut7Rcb3nkGtOF+nf9mAqK8qxSEKavM8Cud1QBUlmUblQksAvmNOz19U/e5FsmJMrdXwC1YNF/Jn2Dto8xLppyXbCuXYnmaLx3pz4y2ovYdZRoLyk/RcNC6wAeON/NZHpkw100SqnpMNNqT80++nbf5+0yTDSpiXzgxiWIYzkMzdazhl+rX3OHtHquEY7F49UxU7xjoba2o72GLj54fE27RgONsfJQhfU4387sBP810kLHZL44xmhLkm3X9BtrJhyFv0iwchVUMTUCyExEO226Gw1AzdGN54vACIOynCsctVpMTpt6wITLZ6QN3IjRapcZoxy6tCTsxzGs7qFhipwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3Znm7vk2uvRByrqqK7dUHBGUOIYQO9jjBZNdC40c7c=;
 b=l+cVXW3nmKHBkRcuj3K5rb6JUMo2GTBF9bbQ4MsVDi+dp/rVvVI3/eNY+G9NPcRjSE1vzoPEX821TptFgxm+X+tIoRU+EJfr/VjBc5qavrDmV/CqxcLbbgifqB2aBhPrxtdFX3GvDAA1nC4efubJ9mrqIwAS2++eXKFNcmXGdYkZUMp75181s0g3aKjC7Wn5yhGL9qtE4QHgkMT4zMli5wo7AyH2OdFNeMphgprjRzCI7wTcb14gZ+II8rapLnuN56gUWx7h4KZu5cSxJmVvDWmI18nQR7ZygEU9rLqSu8NHE6c1a01DtGBYgBz6AGH5F9X1eu03TgVYlFLHwkIJ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3Znm7vk2uvRByrqqK7dUHBGUOIYQO9jjBZNdC40c7c=;
 b=hxlidVKcPpmaGL2MiYboivOPTVTCxFcMh+KwIV5IbBxKZ07gKCSGtcomGwsUegKfnP2BMkF2ug2dLHnzVWcQ+Gu3uPsWD5HNaEUTJYdSK/ZmeXrJW5SR6gkjb4jqc8ndTCwKUelKx1XkrcRuhcy5Mk7RxBZrQdHnUvjiblFTIoI=
Received: from LV5PR21MB4704.namprd21.prod.outlook.com (2603:10b6:408:307::7)
 by LV2PR21MB5995.namprd21.prod.outlook.com with HTTP via P2P; Thu, 15 Oct
 2026 20:50:30 +0000
Received: from LV5PR21MB4704.namprd21.prod.outlook.com
 ([fe80::144b:98da:1262:2ebb]) by LV5PR21MB4704.namprd21.prod.outlook.com
 ([fe80::144b:98da:1262:2ebb%4]) with mapi id 15.21.0546.007; Thu, 15 Oct 2026
 20:50:30 +0000
From: Haiyang Zhang <haiyangz@microsoft.com>
To: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <DECUI@microsoft.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] MAINTAINERS: Remove KY from the maintainers list
Thread-Topic: [PATCH] MAINTAINERS: Remove KY from the maintainers list
Thread-Index: AQHdV0hnUKK3KDVgf0aJbaPNJdiJQ7b/HfVQ
Date: Thu, 15 Oct 2026 20:50:30 +0000
Message-ID:
 <LV5PR21MB4704FC4A8175F692E1FB0E18CA9C2@LV5PR21MB4704.namprd21.prod.outlook.com>
References: <20261008171348.91738-1-easwar.hariharan@linux.microsoft.com>
In-Reply-To: <20261008171348.91738-1-easwar.hariharan@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=4237ecad-070e-440b-9352-0298ff022ae1;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-10-15T20:46:32Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-traffictypediagnostic: LV5PR21MB4704:EE_|LV2PR21MB5995:EE_
x-ms-publictraffictype: Email
client-request-id: bfda2baa-1ce5-410a-9314-14f25ca520ef
request-id: 90b6fba3-1f8b-4e25-3ae6-08df2afdf302
x-ms-office365-filtering-correlation-id: 90b6fba3-1f8b-4e25-3ae6-08df2afdf302
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|56012099006|11063799006|10067099003|7146999003|22082099003|18002099003|7053199004;
x-microsoft-antispam-message-info:
 nVfFVb/zJE5232URGctuU3mgFfryu8BlLlK9xxnIsb0DyIt93YUjPa8KRdMqZwJC4h2Vu9347vt4BR+XHwVC8LqM5vI7x5rT42PHhcJeePixdgoYMB0Dddj7q3ah9Bl9GvVZlveeb0rhmKk0jbKJeKBBVIBpvx7EcTywmRQP3CQWsu+Iy1jKtdJ6cPNxHAG8Lr3MCw71l7V3sAuRAnnaL7hb3FC5u7fYIOMmukngnC+EtP0EQ8CrtSh1hbpEG3+z1WiVWuG+k84y2beWu5t98rhFLVlfRZsdhtYJwpm9O4e0041yRJyuYp+0SqaHuyRwZimsXf51OzaOdLaSkOoGqZMDQgzd+IHhbsiqiSTV3Aj0G9LNr/lTvK7cfJHGRhXZMs6v+W3OaZZ/l3iFfXoe8DocqRQ2Hv5xw4fIrzKlQ1llgHtZeiiIbH7+nWf6dVDhtVT1lHae95PS8M9y5eOyOsbeDelbRH6U+ypyHDfvkCjIwWeH3qj4/kZNLV8BVnZ4k6C18qUYZZ5FzKxERjbKYxTnRkk5MSuZvT1Zi8aitwm0VgJ50L8yRhA7M9WgVKYJVSk+fRjIe3AqFug7+W61RFBvfew3/6kP40XItRA9kzHtx55x5z/qaXxn636XlV99SC3DAaonPqYAeleGy//5wk0xxsxhQvQA7uowrB86OeTql4Lr1ggXntZoWmDSpEqn8Aq7aqj9vw4QC/MM7wM9Ai8/SwxfSYED70j8inQNtXs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(56012099006)(11063799006)(10067099003)(7146999003)(22082099003)(18002099003)(7053199004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mFeaQkD/D6WEesyNlF659h5IwnJbZbY1bXMGIrkQp/igoARblPmWr8xNCUQY?=
 =?us-ascii?Q?h9kD/2QUUqR5fRI9VYI73rG+hGCKAmrUVwMxSC78YDVOogMMYVp8zhEtGId1?=
 =?us-ascii?Q?Z7Y8Lm/qUBEDFDD3cPRrwNx8KQvgO2RWliKtnfPt1CN6fmAEYLS498fyS1RO?=
 =?us-ascii?Q?mhWuwNjpWIXCvKJc4oCL0N3gFkGxKukN8ccfRjg/erQY4MTenq/t+n0u5JE4?=
 =?us-ascii?Q?NUoVdjgqfEdIm9INZ8tCOCqyK+Zrm+3Sz4FggOOHQUwFgVJl+kUzl0LuQA5K?=
 =?us-ascii?Q?4EWHCJigtPpJ29JjJM+zWW/vSeVyqTo+xm3X4Dmp9+j/cUG5t63SVfR4Im5R?=
 =?us-ascii?Q?ppMIY/1AyXo5nlX7qxMGltgSnN9G9s9eJHwqCe6WGIRcjMPiHzP0rBHktMhk?=
 =?us-ascii?Q?r9Mq+9jBR20JwsIybJgjcEy21BuXkiJMGXuCJSpbAhZEsi4y0omxxznmaVW3?=
 =?us-ascii?Q?Zl8G5j3/BswBWPik5lcUN631N/nMtakv+F2fLwPu0mayYf7rjrq0MQ71pN5z?=
 =?us-ascii?Q?hOkdnIbO4OJmeg8HA0GLjCQT8na0F+fAzFWBh7pA9pkfuj2ccj4oiRiCcjvn?=
 =?us-ascii?Q?E3QX1KnFkz4xNSEd24s/BKj3s3N4pjmO4/3v3PD0cpo6NwFpi0ZyNfW9HGD8?=
 =?us-ascii?Q?7cjGh+BaaJ6VTLaDYKNBAtfUDlg5sevJqwK6CA30glyVMLi7jieUHacnlYGf?=
 =?us-ascii?Q?5XLnB/qKH+6S29DTCo80RtdAtYWo4kkiDG6vCUPSD6yehxygTzeHZCkuww0k?=
 =?us-ascii?Q?SBDGKlg+cgglQoxPkr2/CghsNMBzMHUEo31VvKoB3WA42XEKaoi49HHMDT1i?=
 =?us-ascii?Q?l2hO1Uge3LAavMl2bSJqy9yucxUOooZ8Akw1QVj/byQBI3VtX97+ML9fENHm?=
 =?us-ascii?Q?+z+sheJCPbIYrRXDO3SWxb3eCi6bd8dB6DB3zRHigM6t/wW1xfm0HqroMeg2?=
 =?us-ascii?Q?fY47zwVABSk8BXcd5qMAOWZLmIl1pM4dHcYpze1fKtAZZfATvKszsT1pMzsz?=
 =?us-ascii?Q?CxnYnDNO6X8cjOkP5+ZCaol2HmCh9oe+D/M3pYCJXBBme+mqOSiRJeZJ021k?=
 =?us-ascii?Q?AbkN7paZMKI/kVP453LxTHEneo1D5vw9A5Uxjr2RtxyIzATAtr2hx6zMpPRC?=
 =?us-ascii?Q?DJXJOYtUx7Kt5ldFR54xiTtCvdVh98IqHH3UVEjxJXhZxHjOTaTr9s7jFRMf?=
 =?us-ascii?Q?D+mbxfAR7u/QdDhqv4XTou7FMnk1FEPnUG1fDlzp3V7kqyBbeEPNg4bjO4ji?=
 =?us-ascii?Q?5maj7D7pBwYp21tTCuKQq64/ZM4SsmgnujW6HPgp2i3JC7cEsuQVaJxvmXMP?=
 =?us-ascii?Q?CSNnsoFmX7CkmG2ZEjkpKZdua8M/XMYMt6yXPznZ2Fkrt/331DL8WvHReLro?=
 =?us-ascii?Q?8UTwvsvy3TKDAhRwncAIVmP3+yY4t5315wQyXHClVovJfFDNfrJC7nRS5WO5?=
 =?us-ascii?Q?xQFpGbWrXbgWxkHL5X1Yb4fz2+FIlUoD4HnCy8BybAHEc42NnGYAKULYHKxF?=
 =?us-ascii?Q?mJA2vIblEKITMOgZFMZ4fB07F9QyFs56X5gb1DCiEXrg/LVXlEDxeLc3Pypi?=
 =?us-ascii?Q?1nj+hqW+WaLD1mzm0RG8qt+m3CYhDjvOQSJ1ySSTfrywq6T5+Wtm2NCDRvsP?=
 =?us-ascii?Q?rq1e5+MB1ydychpkln5ztncKWUNsMf4JvcTD7ZMPRBZ80WzujkoHoEqZl1Z4?=
 =?us-ascii?Q?r3UqjLzyjseNSmEqQ/nVpi4b9tZJ4K0MDKkkMSJ4OXoTLGW4EpFh3z1YjmqT?=
 =?us-ascii?Q?4iQlqu8ypg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR21MB4704.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b6fba3-1f8b-4e25-3ae6-08df2afdf302
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 20:50:30.1882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0yzStaw8KzdGhzMzXXxTGuSZg00b0jsNgVwy7t+SzRBxhy2EzCemPl7vADq9u4jRTuJkg4v80EdCydsstcYPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR21MB5995



> -----Original Message-----
> From: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
> Sent: Thursday, October 8, 2026 1:14 PM
> To: Haiyang Zhang <haiyangz@microsoft.com>; wei.liu@kernel.org; Dexuan Cu=
i
> <DECUI@microsoft.com>; open list <linux-kernel@vger.kernel.org>
> Cc: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
> Subject: [PATCH] MAINTAINERS: Remove KY from the maintainers list
>=20
> KY has retired from Microsoft and his email is now bouncing. Remove the
> entry from Maintainers.
>=20
> Signed-off-by: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c1..f263ac010209e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12161,7 +12161,6 @@ S:	Maintained
>  F:	drivers/media/i2c/hi847.c
>=20
>  Hyper-V/Azure CORE AND DRIVERS
> -M:	"K. Y. Srinivasan" <kys@microsoft.com>
>  M:	Haiyang Zhang <haiyangz@microsoft.com>
>  M:	Wei Liu <wei.liu@kernel.org>
>  M:	Dexuan Cui <decui@microsoft.com>

Could you add KY and Long Li to <src>/CREDITS file,
which list the people who worked on kernel for a long time.

Thanks,
 - Haiyang

