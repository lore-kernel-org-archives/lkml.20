Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020092.outbound.protection.outlook.com [52.101.227.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44102503BDE;
	Tue,  8 Sep 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859520; cv=fail; b=th6od9fBulLVYVZ+dTDaxfE9iB0XnR+uB/V0CXaIRDtah0e3gKzQwm+kSr/AECvpo1DJov/ODj8C9aoy7OmfkIHYStVtJ8dwehuP+NmWn7yda7d93YNiaunP632zEipNdLolrPeaj2oSyiIqudkAJjhijT1HnIPJVTChQbL6bBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859520; c=relaxed/simple;
	bh=jqU4ZzxXpT6lOZIo0OC0V+Bkg+XRToiJlHOG5/2NRfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i7M+h2tpQJ5lpZUPuJHOEPItg24J9FxSb/xlgtcBW2D29CvKG2sE3h3LsXXc2ORg+2ze1rffqJcTd28zO+rM5zSkQ4xBfi+Id84/Wp5FdyvsfWQ6HxbrN5UieWNjtfVX13wT+LuAV1ijO98R3mRHudkW+vMoMtW/9+iwcH9lmjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=UOms2XM5 reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="UOms2XM5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whPKuw91kd23CPgdw5Jy9DnPSv4kQOYHHMOmV4bY3bKS7uJtFf+XVIpV2U0E65NxUwFC1q8G378GakvzZJ08z8rYCmKAO8/UZwvZjHWX8UkMQPKEbEvsEUHAgv8X8oJHD4pbf27QhhxmD9zEytyetWGhmAI5NN0UpR5dwNqy1b4N+f2tqiBxtNKGYx9euQ8olGCdds9s5iQmPgeLjI2WY59iu9Ioig16EOGYKLQOkY7Qt9ZLcSVGYer1/LazFm/wyO5G/Ul3YVrBgmNgbMg2rfW3t2A0fgkifnjFEGtQrGwvL6c4Y36uP17nuVaRHiGJpCxcm5SvRhjfd7bS7d8U6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqU4ZzxXpT6lOZIo0OC0V+Bkg+XRToiJlHOG5/2NRfI=;
 b=AzohFCKfwT57NyiOmzTwkEeJKaeKDCyarhjTJq1jxmeLVqLV0vzGKRdXnAil3eXOlqYs0DwFPHYvIbuFyrqsIX8FK8kwq8KYsoT9HyhDj18NxIoPJf7CX7HyWH3jZyXuDuwJG16N+z2+NpompXt9ElTD5nGuIVF4iEt/1jclsyQ5HFtSJgiX1+Df1/vZnW9PsPuWHuL0NQzAw6+9jkahAmfUkD3Bq/9qvE6YavGx0/LQ6sfVZbYqRYZdn2ARv7UypzZScocb4QN0BTBApqno7F92H78Zgczj5AbbrAIJ1BkSR2lNz+XaEzklpCDf8iClOxzt8N7Wyh9fdPirP4fqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqU4ZzxXpT6lOZIo0OC0V+Bkg+XRToiJlHOG5/2NRfI=;
 b=UOms2XM5g4zWvLxnytBWbfqsD/Zp9urh7KepoCUqKoG63VwmiPxCOntNQcFnmaBvQ+CYDIf04XbaOOSzVvKyMSAiqlUz6IcsL2HB6Cwzt/cxM6I2hRQh7fVXMQ6LL/W8E8hw0J8NvGkXwTME+MtElk24ns3bplHKuywNLDDbXmkxde/69aRjLKL96cKSsJmkVQ0ZgtDAK8nxTbZ1xEvhLjBInarN04xGW0vklov29Y9PFCoTb6aqIaClKd/iZk5LShypNA0QKRecTnzLpw7jSqkuq9emGL+MTrdR3rJRuqWy+VWQpazHYLwr46EoAE9DdUmC2ONn8Bduv1ZvdMcX2Q==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB4835.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:181::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 09:25:13 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 09:25:13 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Walter Werner
 Schneider <contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Yemike
 Abhilash Chandra <y-abhilashchandra@ti.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Thread-Topic: [PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Thread-Index: AQHdDspl9ppXmum65ESzuXKgK/RNX7aCoL++gAtqjtqANrh+B4AAA8EAgAACpsY=
Date: Tue, 8 Sep 2026 09:25:13 +0000
Message-ID:
 <MA0P287MB21786E4E69F536048D02F69B88B12@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
 <MA0P287MB2178B8563D434B18699EFBD188CB2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2178DE6EB4C9E675B9F967DD88D42@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2178A6EBE37DEB29AEF632C388B12@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <ap_SJs-vXJu4tClB@kekkonen.localdomain>
In-Reply-To: <ap_SJs-vXJu4tClB@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|MA5P287MB4835:EE_
x-ms-office365-filtering-correlation-id: a907202e-a40b-470b-ce4b-08df0d8b160c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|38070700021|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 JlwY2CfBMEAKXlSbBe8I187l4JBkmBKL/cVksbK1foJ2Pp34O1j7vlAHiYqryD1SISNaDD2h2imwsJluVg06fEWrCb2BonRHEEaz3cwWGlfEHQCSY12E1ooVZNbBOZ1G4f1d+4LZVRdhOfdENqWywPldei84a+f3I0CmX3zlZ/qorIfTlenf6ey2wFe8zh7BXvK/MKn46UzU8DZBF7jkdYkSdlekGoJUZRIqPyjsePr+sf1ChB0zQia1r0onbwsYYWsjEZz3pPBWBJaRStD+Ak8qg3mh61KXUi+2KPu7yUUXewdrmk/uHQmIwMlD/Z1drFy0g6/qRmIYnDlBoq0HQFqKq7hJlZmXgyPfJHUSrOQYUFjjjPkfb8HqNPVCSE6LegyBtashMu4yI0JoVo9TzEjEDxJmyivZjaoh+h/lnBTROs8yzq1TLIjEJCOiC4rdxo7/NNgAYAyzbpA30zEiSgMD+fRNOvfiyGsRqT2DmdGUbaqDUFoft6IKEy2M6O6do4i/5RLuwGJzyWcKfE3ObIgfjNpRS5bOIPgz+D3j4RUAvhAM8U22aZ8iLCanDW/Cwp+0CRrlQKRmX0V+4RLfVyYWH77mCqT5QqNI+Gftis+qxxja1juBhZ6m04YPZzS8Ql5g5RHrjT9WVlxFdealq8h3qlz08kF6CYuF+RgEgHqe02gTRUNxQREt0/LAaNTTkQmE3VtWngOl4Okx5u6MSrNpio2V2Qsdtc32z9HnxcM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?/2NHlPy9/aGdE0Yad7rSwCfkXOzzTZSYQlINKTWfQjBI3tBcCRwVZHDB?=
 =?Windows-1252?Q?fTiO349aSID+DHEYh5VCLjO6FYfGbMB5tt4/jyX5pisiVKRNhNDjZtrN?=
 =?Windows-1252?Q?y1t/H0pGNwfTjhtK10zip9zeBW+zJ4Bb8adkZCW6krYJyOV2oyzZ1cYb?=
 =?Windows-1252?Q?wFMuUsVzi60HSIArdI+gwjW4HcXDZlu6u8t7s80A79He0yvzN76yuGl3?=
 =?Windows-1252?Q?nRrLu1rw6/sofW56/8sorsIqjVz5JhkxlWBB9bQyclulg9RNdroDTsdw?=
 =?Windows-1252?Q?VegjilEUO5hNNJ0i7mgGdMufH/hJh7b1jQY4hkG2nk11RT9YWNVd23rS?=
 =?Windows-1252?Q?2jZuPTmUC1r/VSAjxktFO8LIgZS2Zc1O1ZpOdOyqSYZN9wM24oBQ0L8G?=
 =?Windows-1252?Q?P9HJMcdAOaq0nH8UajfZemeuYlv2SI/QtOpq2K7aeFlrfqoZ1Fifd2uM?=
 =?Windows-1252?Q?h0fwTbwr4Rfxu6PrSe5uhyt9NLcz8nPnYyFij8e2m8eP0tYTMza92v+9?=
 =?Windows-1252?Q?+VFIm04zJnr6aRw9/tbQwbk/BmfW1Jjnp5Me9bCa9k/ylabpD/IKoZWH?=
 =?Windows-1252?Q?vKSSEXt2Wd1sYrWIbgPes+ssEFhFdCDqDdb4A54eagOAShsIwkz01CKf?=
 =?Windows-1252?Q?bd9jxlBQZIRFTuXlJ8B1cmGmBTGksW8i4q9Zdjt2VSkxj4ice/Dbc/e/?=
 =?Windows-1252?Q?ChdSEc/BCx3e00kJsIg9WteGP6XnKfsHj0oEFJ9J+7gfR+ZaQ71eGANY?=
 =?Windows-1252?Q?twENQsPh0iEBPgBQQENfrBh4YY7Le5lZKQ7rn7JLFHi81npqh+w+BzFO?=
 =?Windows-1252?Q?QiVHo/VkFFlxVzTYEg/rOs2UmZ6WJqZzgMWBCCX3MyEWnfj57jVKX5xg?=
 =?Windows-1252?Q?A7pg4aBivNjAprPpkIhwrlw7ay1L2D/Pl0nYu2DtAvRiGtTwyfoLaWpv?=
 =?Windows-1252?Q?be4wfn+53jkHXJi7w36A5VsaFZEBnmT6gAurfFq4Fyz9SiEe6HWMdqMU?=
 =?Windows-1252?Q?UM/hPLbUNdUp7fdVj5grktz15oZkJLlxYhR0NgN6QvhsHXg7xReYKGN6?=
 =?Windows-1252?Q?yGQGm9pBinGXvpAn3LDAcgmOw/SIaFcJZ4RE5Wp/y8NhIEcToEraLhHV?=
 =?Windows-1252?Q?eKE6NR+aRPEEmXWDQpIhBeZRgOVv79Ow3w/J+FUolgOq/T3sQ+wyngxt?=
 =?Windows-1252?Q?N0njeMVlSYhT62182kjYBznL65LJRj8oXBE81tI+ZxJqAjtLfFqfeRwU?=
 =?Windows-1252?Q?vEVsOLkkEZ58zC389AAj+PIlJidwKVZo/2ODVoRBi28GnDQMLOrvTTVI?=
 =?Windows-1252?Q?vXYOrK9ZpFkVyR7FlNkoImJTrWrJKAUJMBUMoCuxzzQw0XolhUcFXmab?=
 =?Windows-1252?Q?KVN4NO8SD0WskR7syqxH7JSwYwlWAiXuePUsnKTfIFrSHmVsXRa93EDD?=
 =?Windows-1252?Q?tbPcnVJzlZ3vHkn/NPNfD0EqTF2SBCIDkqDwkIFTwzYfCBFEDLEyAeWh?=
 =?Windows-1252?Q?WVPGg5kQIanX7G7hZv+q/DiZRuuR0zeYi/lTPp2qxkle7u650ODDQHaE?=
 =?Windows-1252?Q?/uK0KGN/oDAS+ndX4vKmYWUYdnPwPGdjEJAI5OeKXj1I8+GQJh4M1CHd?=
 =?Windows-1252?Q?fjqXqB5IiC5L8BH44HbIBLjSYBMqDVi5zGBzAjrkap/DBVoRnlDpNGgM?=
 =?Windows-1252?Q?KaCcl3aD03hR63Y4u/hOjG5Uvz8qP9m4waCn5HafuPWjOjlEcJCTKQvW?=
 =?Windows-1252?Q?6hV+cPweJNQ9BXIeCIiIAsb3DWn58JT43bb9fgxzcYlbuTzd7JZ3M1Ad?=
 =?Windows-1252?Q?8Wv3CUNW7dMMfL1b83HSFlA/zNrZBgEZA5EV0/NNDmWsk5tBU1i8J5TN?=
 =?Windows-1252?Q?9M5/rdfKajphFyBbZfCi9bptBTCdj9p+UBc=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a907202e-a40b-470b-ce4b-08df0d8b160c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 09:25:13.0863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nth5VR+pMI8yAN09liPtonackHHgx+5xpu7RAiGRIRaBHLKcy8U+HfGQ3PZP+cDQ872vwREfBjwvzRI4mMb88WMqik4IVo1o3DXbNIpkIHczyzWdEwdgRn8UpmvmF9dT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4835

Hi Sakari,=0A=
=0A=
>Hi Elgin,=0A=
>=0A=
>On Tue, Sep 08, 2026 at 09:03:10AM +0000, Elgin Perumbilly wrote:=0A=
>> >>Could you please have a look at this patch series and let me know your=
 thoughts ?=0A=
>> >>=0A=
>> >>Best Regards,=0A=
>> >>Elgin=0A=
>> >=0A=
>> >Just following up on the os02g10 patch series.=0A=
>> >Is there any blocker preventing it from being merged, or anything I nee=
d to address?=0A=
>> >=0A=
>> >Best Regards,=0A=
>> >Elgin=0A=
>>=0A=
>> Just following up once again on the OS02G10 patch series. Could you=0A=
>> please let me know if you had a chance to review it?=0A=
>=0A=
>Thanks for the ping. I'd merge this, but the patches are malformed somehow=
.=0A=
>D=0A=
>=0A=
>Can you try resending them, please?=0A=
>=0A=
>And my apologies for the delay -- during the summer holidays not much=0A=
>happens here and the e-mail backlog can take a long time to clean.=0A=
>=0A=
>--=0A=
>Kind regards,=0A=
>=0A=
>Sakari Ailus=0A=
=0A=
Thanks for letting me know. No problem at all. I=92ll resend the patch seri=
es shortly.=0A=
=0A=
Best Regards,=0A=
Elgin=0A=
