Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazolkn19011029.outbound.protection.outlook.com [52.103.55.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE15556B92;
	Tue, 13 Oct 2026 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.55.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791925760; cv=fail; b=qc/SyChQ/dNcD0aQPjPM02kDbwvoScFt/21gO4SZ03LLE2Cjo4C9StAmiylSL/oYBMsn/c4Wnb7Jfri4EnzfElT5o7zp63ux05oxXheh/UsYLLZfh/GlO1SrtZ/YcRH/mFlLhwGG8/MdLJx9KVjoWFGLVQleAp9bnYWBRwyOz4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791925760; c=relaxed/simple;
	bh=KBbx+VursSt3wBItN8mrdGl3A/hflFWlz7NMyji6zBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y9oWBnBMoeCkY+bo45UahPqeoOEoYOyI3bt91ZMfpdXMh46IZebsPicMNWCG7idPoAyRsrO/Bh6yOC2UWMhS1AqaSySG8F0he8FGENu/i65SDItL34gviUp24zZDOI0PHlDNHRhw0cH7vXORsBTt/x/tx7iC1zKO4bhK3jW5epw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=o7ALY3qG; arc=fail smtp.client-ip=52.103.55.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="o7ALY3qG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODcP1O3wah7kY70KysqWhivJJsQOF9pkViKx5iE50mtbcqJGG/hVYRhHtpPG1dYWoQBBRWmnNFUNfEkeshzYMI0l7c3J03QVvSpaq0WhJcDi0bbqMH2TBFHpl/oyarsPKgx3wPJBdygmJ2lGk3cd1zHb/QzXbIMOaIpjqWjZ9bAmydod1E7wTMO88Hzzz6/Av2Ux7beimLlSMm5cEDVgOk/4FpXTzUb5Co7bZgF4YB0fERopu6GYmn0V1QvTHod7pHuo8zDKkwDTAWDd6Tz1p3oldbdLQ8hhLsGVbLaoisSX+HAIpEkRuyIwe4DC4ozSaJzTivRu4oCbEpRjB49FXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBbx+VursSt3wBItN8mrdGl3A/hflFWlz7NMyji6zBg=;
 b=kudmvjP/d2kSH9N6z6Ln7GiLEwCofJem+pcoNcqj302+3lySqQNdejFDSSulTYIq8OLTDHc6Dr4UMLwYiv6sGt6JYVRhcJ05se1LW1+5PAQ3L4Fb/Da05IZ48H9sBWQYDzn3V0Ej7Rcx9cT9JA7t8TwNOM0xl2AkzYaitNtrlnb1ZnDgmAPbDTIVjTr/ORUErfRE8tMcHdpkVfDR5qd/rvcdc/a67fuZGpJoFEZdEHn4rxij1690cLBfuu1TqiO4og/rK6xPfXTSm9iXLgBCYzKm0BsYpc8SIzhTkZTBpMC0Enp0VjhVGlOtW5wR2nFvGUX1x9K3eninVpbLjEO54Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBbx+VursSt3wBItN8mrdGl3A/hflFWlz7NMyji6zBg=;
 b=o7ALY3qGNww2abLE6ytf4kN8eAeUEjrXrrz9u/M+p4h7t5uhyJqrkeqclGPQF7QmXYIcs5k6VWcZL6SK1Z9swwps6Iwpf15ME3Vj5krTApkvc5rQmIaj75m6kHgr3AeeB1l0ncQtCmm8Q4SFQMq3k7UACCySnVyku77Av4X0ThiosVKmS3I48P0VFIeTGFjnxsR5txaSyW33CwdbWB2rWyGSmzERj3IBuGlpsFo704UrLpvZvi1hOMKHtghItfcjgS6RGX+MG12++QLHRhjR9E3/qXrRMEPQgaupnHc99RQPTSlB/yH0c5VW8ho+UVFfXG40ZCNs3qhRKY5XsXFLug==
Received: from ZR2P278MB628354.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:203::6)
 by GVAP278MB059274.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:77::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Tue, 13 Oct
 2026 21:09:14 +0000
Received: from ZR2P278MB628354.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f796:8616:de10:f590]) by ZR2P278MB628354.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f796:8616:de10:f590%4]) with mapi id 15.21.0522.012; Tue, 13 Oct 2026
 21:09:14 +0000
From: Philipp Oster <PHILIPPDEV5396@outlook.de>
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>, Kevin
 Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Georg Wenzel
	<g.wenzel@gmail.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 0/2] ALSA: hda/tas2781: Skip invalid TAS2563 UEFI
 calibration data
Thread-Topic: [PATCH v2 0/2] ALSA: hda/tas2781: Skip invalid TAS2563 UEFI
 calibration data
Thread-Index: AQHdWxNBPAlVBT6Do0+OxDR9DZ/webb79x1V
Date: Tue, 13 Oct 2026 21:09:14 +0000
Message-ID:
 <ZR2P278MB628354F75EB9A1EE89217AC93AB19E2@ZR2P278MB628354.CHEP278.PROD.OUTLOOK.COM>
References: <cover.1791895478.git.soyer@irl.hu>
In-Reply-To: <cover.1791895478.git.soyer@irl.hu>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR2P278MB628354:EE_|GVAP278MB059274:EE_
x-ms-office365-filtering-correlation-id: 2bb344f1-b9d0-4487-c9b1-08df296e3c19
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|8060799015|8062599012|19110799012|12121999013|25010399006|31061999003|4140399003|15080799012|15030799006|25031999004|51005399006|40105399003|12091999003|2607281247196008|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Am9OCO1kEmBqJILP1w4GxXmJtEYzHkEfIbzXkFnUYA30fSi9LjnpswLtbN?=
 =?iso-8859-1?Q?SV6HRu8gdi76p74rwk5mcv4GCMeiHV081oB7+UAWrLzvLv36ML6qjqVNQd?=
 =?iso-8859-1?Q?OTZvUL7p3lEQO2qnQlBSY9+OnfcS0FOfa3q3U8ds/xlPR7N2ZHx9s1D3ot?=
 =?iso-8859-1?Q?Ee/KHu7am0YleXh/5/UXiRUHofmEteh/qUlJRXSMMmaP7JaxdJo5D29zoF?=
 =?iso-8859-1?Q?oue7KI+7sF3Rwk7fFdV7YJ48dYo39KSxpmHkMi5yC/WPpldRy3DmSqhuBJ?=
 =?iso-8859-1?Q?PKJTc7OsX1wwf6PZ1G7eBrlC0PzVPuH1dCncUinih0w32L4bZpyQEH0+60?=
 =?iso-8859-1?Q?XX0qLK2QmSGi54bnAJCNZKh1jGmoHlD5lDQHAYEMLVkl9Kqh12cCaAYgbt?=
 =?iso-8859-1?Q?qv29Jrhbe2zN9yuuc7cHOoG0qpQ3RmCnWCCUrr3N0CrWH+LVFtNyDE+/ac?=
 =?iso-8859-1?Q?55C6VP3Mso3jRfFUdPZUyXAXM/2GUoO5ClY/DlBgE4+n1HrWGIoXCphkgf?=
 =?iso-8859-1?Q?UftU87GOF3Zso0MwGik3Wn/UaC+cuqIAPASpMP1W2UcoThdf+xirKiI++1?=
 =?iso-8859-1?Q?le4AtGzHXTwz+VDOi9c24eCU721CYn/dRTT3dCsY7fTnOUuBnpIy/5T1zG?=
 =?iso-8859-1?Q?YcmtoGP3m3562Rp7mfAHksginSr3pd3FW/VlrBzQJrEaHkVS4bjiE4auxV?=
 =?iso-8859-1?Q?0cC1Y6f1xsrKuoIn3VHTPp6KbsyyVeLqqI0xkjI57RorFTn86hi/5JB+J7?=
 =?iso-8859-1?Q?3RAmm+DYO51arDjdKUakmvAHqIDKGTZD/Cx7B3kllsSxyMTMDfMNlFWD9e?=
 =?iso-8859-1?Q?yjTU6c/jRBK0Bam7uffR3c+hawieD9Yl6IyHHzzJA9BCzCIeoK9E4mjI5l?=
 =?iso-8859-1?Q?NtOMxEgmNdZtNEKZd2A31EWSe1ZV77NqWQEbL/CYD0Y1duDuhvrnLMxRde?=
 =?iso-8859-1?Q?dH6qfIc2YQr+rn7svj1Emh1OQRedJjamH1s6OMGYJ6bd5Nk/hAfS4uZLjC?=
 =?iso-8859-1?Q?7uCp263UUshCbwfgyx+gJ99aiUNOMezPqAwgwjvPy+5h7bHdh+BGm73sod?=
 =?iso-8859-1?Q?KFORb8P/QlVQqrAd6+onAOQDJ57CIdAnullKKtelg0i0?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AL5ShdJ1Ti1o5hpwXhMAKgGS+ru+nUcjiFYdC6+DtRkooyKp3OakfW31/b?=
 =?iso-8859-1?Q?PCdjfwoHQMM1vlPEpCiBYKGdxwf8juuFYOg6e13hQEqkvZ11hLvPGPrE6u?=
 =?iso-8859-1?Q?YecYXngLthZ/2DfzxMJNxq07B6LteyssqwYn8I+Us0YdjdQY/WoqObqzVO?=
 =?iso-8859-1?Q?3p3K2fPOJDEF5A2hLK88gHRl8EqDTGV5kDzWG3qqZF51saJWwqgwm9xSV9?=
 =?iso-8859-1?Q?I9hwkxihxo+HnURTEhaVrWxtw1uFc7qs0fk4nnxn7yubYPltdibU4i8D0e?=
 =?iso-8859-1?Q?BmbSkkFqvG42yfYkfCwO5hZbN3x9uDenbcDvAx+VOOoBu78w6k/ppbP3SH?=
 =?iso-8859-1?Q?2ovP06Unp5KCgEod4kcpXNy/hc+CWQdXohx/3d+P6BRAE7PH/1+eO6JS93?=
 =?iso-8859-1?Q?p4ip57CSvd7fRb6FWs+uG16467+HFOqPiduBiqPcfN3Di2Ts5S5dDfj38y?=
 =?iso-8859-1?Q?Fru+/TYnjdzw+9wIHNUZORgDhBYaSmGMSepLr+LiHDM6OTJnskyrnnJd1d?=
 =?iso-8859-1?Q?RGw32ONmCkmy2zk2NGWW39vOytmLQl344W3Rava1YI6Da02hL1H6h57FaW?=
 =?iso-8859-1?Q?A4iW8I0b5jW2VCuU0myvYnvhzJffuHevZWyWXgGJA3vdyoUec5ebv2/ICx?=
 =?iso-8859-1?Q?jWXiAJ02bzlVy5AQ1MCcjuC0sdGCH/8hrf78U8RNTEr8qPAkbjrYs5Pgns?=
 =?iso-8859-1?Q?ozhGHN9Vdm4k2fbTJAZvmJqPcsnPZvqTC+n3PPIapRTKrGuqZrLmpsT0R4?=
 =?iso-8859-1?Q?PIs4M97Y/mlkOP5Bb8Ngg5n3+RJbaDl+4q8O/5mbVzZIxmM8cpf5UrNO/k?=
 =?iso-8859-1?Q?WcPyV6EnNevCmZZ3/1DXu9P+qY/eIefHTGchmlYws3LuqsGyHQ+BlM4mjq?=
 =?iso-8859-1?Q?oFy1P+VMWLHCg5UTziEULH9su12jMgRJL5LJEvA+yPk5xFDzSpvEyuO2Ni?=
 =?iso-8859-1?Q?FzaM8PerD12EAi5URsm1Oxhjku+ZGnsuo4+qQFopOSMIbv7ImR0YxxV+m1?=
 =?iso-8859-1?Q?wKYvyBQbZI7A7j62RHM6dJNzKyi6m1dOTptubYU3hGkNacQIjXGKbNsQ9s?=
 =?iso-8859-1?Q?lBVlSin4mcle84yOOF1AuVK8M+4DsS+bYfdYTQFi0bpSR1+4PG42BXVfI/?=
 =?iso-8859-1?Q?vsidd1Z2abablpIcgO8WCtnEEK5hg2LToyS53tGmGJ5o5U/QUj8ZnS0VS3?=
 =?iso-8859-1?Q?XMA7x6Te6D/OTVfQYuHG63EQcUyoM7LEcc0d7D9k5acYNFISZQj7nclwPn?=
 =?iso-8859-1?Q?AUdJUooyc6G/Y9gcoGbg4dNnpvsW7x/bGxsHPekhtLOXLGXFtzwWeFwj0z?=
 =?iso-8859-1?Q?d3tQiwo06Jh7ZOba8QIcxhiKJCQ+KDG4B2XVK62hyDl5HauFPxVe2zfhV3?=
 =?iso-8859-1?Q?wseLUeJeCGbeOaxwbWIQ9cJPBo+QD7+mOQyQJPA6R6aCQeKYdYb6+Fxi4O?=
 =?iso-8859-1?Q?o/TdZkPnZrjBoX4T2ayiw0DHFhNGdZBxrJh3f+xLsf+mJ+10KEYhHmy3wK?=
 =?iso-8859-1?Q?cSJ3ycUwsIJvMqOQIIQsv8?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-b8459.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR2P278MB628354.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb344f1-b9d0-4487-c9b1-08df296e3c19
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 21:09:14.0934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB059274

Hi Gergo,=0A=
=0A=
thanks for extending this to the zero-calibration case.=0A=
=0A=
I tested the v2 series on my Lenovo Yoga 7 14ARB7 (82QF). Here the UEFI=0A=
calibration variables are missing altogether, so tas2563_save_calibration()=
=0A=
bails out at "Dev 0: Caldat[0] read failed" before the new zero check is=0A=
reached -- the case my earlier patch was about. With both patches applied=
=0A=
on top of v7.2.9, the warning is logged as expected, no calibration data=0A=
is applied, and all four speakers, including the woofers, play normally=0A=
after a reboot.=0A=
=0A=
Tested-by: Philipp Oster <philippdev5396@outlook.de>=0A=
=0A=
Thanks,=0A=
Philipp=0A=
