Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011008.outbound.protection.outlook.com [52.103.66.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9E243B6F5;
	Mon,  7 Sep 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771526; cv=fail; b=eKHrdaoiBzURth3FumlSe9Afz7ZwopNMlPIeyg6Ht3UPSw5tbDkndmCmj5x/WWYVeb7gvGpYboaPF1TCd+UT+6t+Qvcb4nPzuFUK9ilSFxFgqKtwb3zrbXjoWs4WIrlGSZ0XuuRaUymS+UdPUd/OpCM8tMCC6VFjoQrKIDD2PyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771526; c=relaxed/simple;
	bh=hWFzjk80N13zIFl41t4AhyYn0QevDwqPWFIUkutUwLI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EvBSRm4OzRYHGmzb3D1ld1GffTjMtpct1KhY3X91UBXl+9MroBsN3NRUdHnZvuhYFOyWP8W9jpxXhgNT2RTtdOmCWNlQfVuwpUCIffzi7LRw9Jl6mxlWC0u6k1Ukw18mks9CqjmX98tcn4JfBILCT6uAqj9P5hxcU9T5Djg5RCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=jQKTMRv9; arc=fail smtp.client-ip=52.103.66.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="jQKTMRv9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzx8NqWRcUWpd8hMOsVl3Nfx+bwGdpwE2gYAUL+kyy7SVeNFRnEOg8JhKm8T72yWEFqeIOH1uhVJ+IOgUA3yEdLjnSL70OwdjYEuppuYY6dahmbHLR/YC3Ft8RabfptMf7QC8eDyuRgLbCPMQsdz7y38LXOQkDB6qGEmH3HKWB3MIW7s1iuaYro8S53H1bPPv13kGHBGqhYD5WfV5rHEIqu6pyRv1BEq8kGA/n6bbQq02q1zpetQC69zMHPjHmhqe3CO+fcXV9xFCVoL5hM76iwIykwbkE2DiirH+Naf97AXDo6BnSgKRigKKP7ZMM6XY0GNfdmoAMMqcg113gd3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9lOenzCX+o7RvsT4BSm7QC0cJm/BwNftmwNFBWWjAc=;
 b=CXFfUCm756EpEok/e6K78uu46HN0Tl81U7bbHV54EAoxgDy1+E51h7cxF6daj8ogLdr8+xqwv+siu0FH4bJarKcoKcNAc2/qWMtRk4dxQVeOwc+admj6uj3XxKHtJnjqKg9M5Tu8ieXl8N34XUlOuexOGNibIT1kSqF/AkrFxIzfFomLntaOr4Hey68NtPFxoSB3fGKR4OXBQHWIUg9JUkXKqlGJjLwaXDRPCslXBZWBPkCmsrP2Ej2iawzxvMD8suCUdtwXLgtj6p9XNAEyI0NiHWs1/6BtvgAhFD3kdKnYkoGK0rcZvWD/tAfYHZx6yowUCAMotw7iSfEjjP9D8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9lOenzCX+o7RvsT4BSm7QC0cJm/BwNftmwNFBWWjAc=;
 b=jQKTMRv95pDWvmqgJvb4nzxDCII9Xdz/sZPiCH8FBE80UAbwhtUVkFzZc9R6KB6m50mq3pchPMhtvXlIe6QKhtE9vg2yM3sF1FFdqqmCDY55GJMMK9cnE+qn3P6DfPlCSDWS96R4V9m1yqo+IrG/Wh2yZoYZ3+sXX6fLo11OtVTp3XLuKbRaODR4oOV+Xu/E7CJtM+dnjSI74YSHGuPqV7HENU9emecqN0S7heBW3P+Z0LMizLm/K44zb0vog3+plisUkGmNLu+PRaAYUSoz7zxexFeI2h6uyvtZyKVdwKh26qGbSTS6sG3gD4J2ob01K/58vJFRxIqQ+Mw2Z2C+Cg==
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com (2603:1096:604:1d9::14)
 by OSAPR01MB7277.jpnprd01.prod.outlook.com (2603:1096:604:11c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:58:40 +0000
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542]) by OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:58:40 +0000
From: Keisuke Tsukuda <catnyaaan@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com"
	<syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com"
	<syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>, Keisuke Tsukuda
	<catnyaaan@outlook.com>
Subject: [PATCH 0/2] usb: gadget: avoid warnings during configuration
 transitions
Thread-Topic: [PATCH 0/2] usb: gadget: avoid warnings during configuration
 transitions
Thread-Index: AQHdPqcTJZV1Uu+ZmEuJcr2uw4BU7g==
Date: Mon, 7 Sep 2026 08:58:40 +0000
Message-ID: <20260907085806.52647-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9313:EE_|OSAPR01MB7277:EE_
x-ms-office365-filtering-correlation-id: b4595be4-8458-4a43-1f5e-08df0cbe3640
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|31061999003|15080799012|38102599003|24021099003|25031999004|8022599003|19110799012|25010399006|1602099012|10035399007|2607281247196008|3071699003|102099032|3412199025|4302099013|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XRJp6c+Zi0ojzz4T+wMUIZXEJQTqBtkWqb1fi25wmle9Q0EvHofrdwmlQW?=
 =?iso-8859-1?Q?8BymzpP8msf913WrMDpY1ioF6LXVLDE7oXnOxNEI2KjyIbWshxrfkRc0qd?=
 =?iso-8859-1?Q?6DV5kSrc57ZpZGfxgM6mVfRU8ngmPf/gzXeaoizB4tKI/wKwZyIxqfw1Ri?=
 =?iso-8859-1?Q?SdQn6Bhv6DxW8grz/cntOr/NkD7sMU7YkS+TRZ3dPKI1eBEjQbeFp+7yek?=
 =?iso-8859-1?Q?bD74p1LGN0X+5AW02BnalXpwLk1n4BTIFczWggvrekRlDdESiDPaumojVo?=
 =?iso-8859-1?Q?4OPXAApNFOp+BIvCZw8P9Nqss1tA2ZYrR5EChNXsGBPyXcCwnbCYXf7whA?=
 =?iso-8859-1?Q?cOK7PJY/tV8SH0wCUVG8F3zuu1rIm788AL5ARiObwBNyMA9ziHK8JLsJ8D?=
 =?iso-8859-1?Q?8h2CxykLSNDV7OTd+JTYoknmB4Tk8+J2K5TUguREchey7kWaAG8gCDweQE?=
 =?iso-8859-1?Q?/X7gYif/tFzQpLOjo79Y9vwqX9at0QjDGtqL2qPaOC4q2m0UTwRsWkXgPp?=
 =?iso-8859-1?Q?UyLr5jU+EU8zVtSZ48E6swFFL0lWrdVa6VnUdMxK2vL9Ijj8X+UwIwZvxl?=
 =?iso-8859-1?Q?xY+XiCtAQQ1nUofTy+crTAJzww6RX8xYdC6wOXS4cZRKZm5AgrjAOeka/7?=
 =?iso-8859-1?Q?I/bI/cAbnblO7tks5o5voyAK1Zm+gajHWz4rNS/f5vErU/D3rJyBedOD8f?=
 =?iso-8859-1?Q?C2lil94XXDEKl+PhMS54X8w58BHmiGt6ffNcmNOKSY71dNvGZgEx6wUfWN?=
 =?iso-8859-1?Q?mgoGnaWQ7/CMOHaY0nLCTnJqg/TwQ7eAYhb+dZkdVhpJpYvlznKj1Lgv9s?=
 =?iso-8859-1?Q?L/jndNKvNeCDGRV49R7kb0UcYLd+4OXKLQUT11lsMcoZZfmgyMTFsNEr50?=
 =?iso-8859-1?Q?lYY1GELdSiJd5AJoMKyG0E9pavzNYdjXluCLiV5jIZILnVutTB53PLQLha?=
 =?iso-8859-1?Q?gddFbAaxB0Kux7NZoLaCgm+6RzMYpuMM2MG4uKeTKAT3wKtkbvN5C4JqNt?=
 =?iso-8859-1?Q?R0hkg9FireRCv4+zMHFuKULDEC5vfNwD80MmjPzP+P1wjnPHx6qIdWFDNW?=
 =?iso-8859-1?Q?TAZO3pOSn7N0XrEhqMl49s1xr59dP5DbufSr8W94XCjg?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?b7tHYLqGMpv3uDDgwScSnIN3B+slusuiL6YbZAYr0nt6LovgD9CJ5mjtoL?=
 =?iso-8859-1?Q?ohTPVv2VsEt9qbs2tNgQd19yQr8LEQ7tO5rlxbKyZ4bfBvGTJLQj2yEkP/?=
 =?iso-8859-1?Q?kBFXmNUzFA8x6JzvYqNawYTg0etFcDOt5kNj/ATipMHMazFxJpV7dGe1Ph?=
 =?iso-8859-1?Q?OvzKf4ydp3qVJ8QO/167Tplok/qKuI2/9Ot/daBM+U3rCEOIr7n++Jh5Rs?=
 =?iso-8859-1?Q?685QbxOCMEcVdOc6EtTKBaQ0YYjmmb9IH2vm2MufMnTJ36B/vkbNpnQuiV?=
 =?iso-8859-1?Q?3JxoBF4cEyyYzE30y1+O7NXXRd15I2jGNBPN2Otb0odoJtKL39Z18JjBoa?=
 =?iso-8859-1?Q?9vCklVVxT/ybiW9OvqT55TpyNEHNvB8yrZAQjk9J3DP5sEmVC/TpHHjNeD?=
 =?iso-8859-1?Q?Che9zgT/luXn8GLm88B1+yKrz3bxGZbMc+84wHunGI5D6Sus3jElhBejTR?=
 =?iso-8859-1?Q?W1okE4H+jcfgwF/5TTJP5xOpfCHLJVJtMhpcQoajikoxkC7coK+prnoAlQ?=
 =?iso-8859-1?Q?eulk8aT11b8irD+XIvDPxNumXnNfZEc0ZqZo1qPW+yFtz4FGnSx9due5EW?=
 =?iso-8859-1?Q?lCgPY9vVXvY+wtrtvzyOAke2jw8Yglg/pixXRPL9YOi4kV05tW3QhZ45OH?=
 =?iso-8859-1?Q?TG8PvqYWjgk9AH2BGwUnLK6US4u5eAEVmWJMTosea2uakiOxtqpqHBWrHl?=
 =?iso-8859-1?Q?9zrEm5YEhx1pbcYGqJAESRiBcyskuLtq3kkXRJv/nk8vBRBuRvBu+ML2dV?=
 =?iso-8859-1?Q?e/MzQOYs1C/fgZHdbHT6PzFNRmQhO++Qo+wwSLvtyxwUNIIqGvHbgKhXay?=
 =?iso-8859-1?Q?tLCjUNQMdpRt/VdfJ5eY/mGIVg52tF4fjuATlom6agLe2isOH1zpcRXHAm?=
 =?iso-8859-1?Q?0epdA0zaKoqgJBGV1FmvXxHS4Pa/BJGpqIpZmzVL4+UGTWStmuBtO/dXoR?=
 =?iso-8859-1?Q?GUjoavC9RvmzTinSp3e9R8BubN+q1Im2L7G41poTd9A9Ro1bcm1tmhVxRL?=
 =?iso-8859-1?Q?t8FgmSSAqErXLvg+tjgAYEe6BAieqyspSFeSCxeCxMLGfZuiOBuwQgbmQc?=
 =?iso-8859-1?Q?r390S30vbsY7zOUZtANCu/9mj5RwSdANWoutTdN+i3kI9D1k/huBEcoq2E?=
 =?iso-8859-1?Q?d4rr8SJni5oMTHtkTzkYcKGaOt2C13YRaviBSnPxPgyDs3VBbTaPOopX1q?=
 =?iso-8859-1?Q?f0UlJdoAw2N2VvR9ggQUn7uc2Jh7MmXXEx36ssth8ObNv52zRAUq9xFUst?=
 =?iso-8859-1?Q?h0NdUfWc2MMUXoDv9hW38oHSWtwqcu+Z0Fht/Xqk7wRp+vmUCYGSO50y3Q?=
 =?iso-8859-1?Q?VQj8+cjS9AwxccONsxJUXRqMZHFJRxdB4o1YiGZfLhM7LR3Ilkvb5y4XQt?=
 =?iso-8859-1?Q?e7UCTabIqb0DtKIj8uIULh+CYS0o3U0IlCuydLl+HuNXFAhjBvBa8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9313.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b4595be4-8458-4a43-1f5e-08df0cbe3640
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 08:58:40.3299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7277

Rapidly alternating SET_CONFIGURATION requests can overtake the=0A=
mass-storage function's asynchronous configuration work. This exposes two=
=0A=
states that are handled safely but currently produce kernel warnings: a=0A=
delayed-status completion after reset_config() cleared its counter, and a=
=0A=
class request while common->fsg is not installed.=0A=
=0A=
The first patch keeps the obsolete completion as a dynamic-debug=0A=
diagnostic. The second avoids the warning only in fsg_setup(), where the=0A=
request is already rejected with -EOPNOTSUPP; warnings in other internal=0A=
f_mass_storage paths remain unchanged.=0A=
=0A=
Both reports reproduce on an ARM64 Ubuntu 6.8 VM using dummy_hcd. With both=
=0A=
patches loaded, five 10-second, four-thread runs produced no WARNING, BUG,=
=0A=
or Oops. In a separate run, a kprobe observed five calls to=0A=
usb_composite_setup_continue() with delayed_status =3D=3D 0 while the targe=
t=0A=
warning remained absent.=0A=
=0A=
syzbot tested this exact series on usb-testing commit=0A=
edc1518454f6439e50a9220e9a3ba09044ea8d8b and reported OK after a=0A=
50-minute run:=0A=
=0A=
https://syzkaller.appspot.com/bug?extid=3Da83a5a1ba9ff57935171=0A=
=0A=
Keisuke Tsukuda (2):=0A=
  usb: gadget: composite: avoid warning on aborted delayed status=0A=
  usb: gadget: f_mass_storage: ignore class requests while inactive=0A=
=0A=
 drivers/usb/gadget/composite.c               | 2 +-=0A=
 drivers/usb/gadget/function/f_mass_storage.c | 2 +-=0A=
 2 files changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
-- =0A=
2.50.1 (Apple Git-155)=0A=
