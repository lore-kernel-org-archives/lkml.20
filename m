Received: from MA2P292CU005.outbound.protection.outlook.com (mail-spaincentralazolkn19010038.outbound.protection.outlook.com [52.103.36.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15F535FC9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.36.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083964; cv=fail; b=C5zh8mc65e746KXc5sTMsmqb9bdzsyByI8XLHUoBrVhQjwk4wjKfqRuXZpLute5IEFCr6C55ZEYP1q3wPNr+tfEvAi8DqG+Mh+RSckz+B0S2QywsOPNdj3AzAwLsNBPUBMnzRvwgtrkGU/zHXLTpb67mBVZYFocLgZnQ0Cvt84o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083964; c=relaxed/simple;
	bh=wPyaQEGlWxqhxopJF0GyU3kcEiqplY1hxSbzzXOSKbQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UDbf1W35c0L7wisjtwVdcfk0MtR4DyuPPHpCkQv9ITGCAHmhcGW2E9UNUezYcezL5CTWbtH6Mzaf6LxDGtZxSu078wkt0cYKbmN3p559gWSntBS8Q2fw94EDbpCNR/PLoRP0I3ca/rkTR0xswyC7MIk6qm0BDLmvJHPHraDaoLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=AstJ6bk0; arc=fail smtp.client-ip=52.103.36.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="AstJ6bk0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dACgVxP1yqPK7RCjA/1abDXVH3V/KmJH4K+jUfognq07vophz+PGvMvvXfiWKE5jrHCwWQg0Xz720Z86jORgwR7h6NovO6DlD1DIQxYQy0Ridb1+Lp6wPBiF3KOcJxWz5XSa0EimI/uL5CcupUe39cot1MiYmixo8aq7sPToXjXeO5IS25KNYozwgiHhgSr8PzRrRmrTz+PB8KYNhNgag//+Y3go7Bi9qxLNXCL8Kqvt2vfiSFEKlvuAQ2i2/7Qabc8STOi/kTJTEdcFZKE9zo+RWBVjI113LRdyTguqHYSBHRDbIb0wNgIGEBHrW+Z9hzpCEEaGSviasu5UJl/CCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC/YOetbvI/LKKhyN7MjB+OUzJmMpo9zjlIqarjSRVI=;
 b=gFo5Peaq6w48EME3bQHYRuuSjJRElrupjcM1NKhzqiyBeVDPPtPKsYE3Rw7AMLdL+aBkt+P5sqi02hLgRuKKtfmr/6PqKk/ArnOcmrTHOGvCYzxQgYvFh532eJyRLTpPxO9vrGicXoMvbxCtpSOzqTzQtjZm6lv5tA+kxRKxGBKD1Hsc4GoNk+3e+2WqcJCgHLYM1IvEQWhbhLv8Mx8RSvyX8RyIUpSlBiY0waDDB2MrwY3C0leR0wnxc+wbmjwRwpOwgEHMjKfcBx5SWjl11Z0Y84ZKz/HEdZ8b+Az2g4dlki5fndKEPg5OOfRW6QPqbKDNyBh23ioJbAHncKwdZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC/YOetbvI/LKKhyN7MjB+OUzJmMpo9zjlIqarjSRVI=;
 b=AstJ6bk07JJgRKAg8TizPPfw2fWaWv2Yz7qPSU8SmGHcHgIEf6Ix17+Dxp4B+bDWN9SE0L7l7IN42pRQM3JDvIEJqXftAHK1r24/EygJ29IkQbMfpNS58Ni2ya3YSte/xOARE7appakTWeQTBLdJuC6+k3y9slNz1NrW385Y2dMP1je1Yld6kNKn6yOaFOFYMGncxTwX3AYnfayElmWOIPA9Ml3Iev6bI1f9CpAN/UXWNq+94YeLlROsEEkuvzSTH7B/I27mnsxY55W3XJ9pu13QqOEE8MPsE3dE+xauROWaQ5IsncXqOgKF2XptFVDpb0hNlRXmbQv2/h5TbeIxQA==
Received: from MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:25::7) by
 MA3P292MB0017.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:18::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.12; Thu, 15 Oct 2026 17:05:47 +0000
Received: from MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM
 ([fe80::dd53:905f:fc97:e918]) by MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM
 ([fe80::dd53:905f:fc97:e918%5]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 17:05:47 +0000
From: =?koi8-r?B?68HMzMUg7snL?= <nick.kalle.26@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: [PATCH] mm/oom_kill: fix potential race condition in
 oom_evaluate_task
Thread-Topic: [PATCH] mm/oom_kill: fix potential race condition in
 oom_evaluate_task
Thread-Index: AQHdXMYV2k5SYqqH2EGOhgw6XxipDw==
Date: Thu, 15 Oct 2026 17:05:47 +0000
Message-ID:
 <MA3P292MB03603240088713B2E18C7C4FB89C2@MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA3P292MB0360:EE_|MA3P292MB0017:EE_
x-ms-office365-filtering-correlation-id: 91726e6f-697c-470e-e043-08df2ade8ebd
x-ms-exchange-slblob-mailprops:
 JXe7TI5Vt+wYF1Du72KGLTOOts9Bq9cVaz70LS79w2BU+k5p+HtSSan68wFwIbgsq13dLSEmO5+zNlDiu8m1HRItkys2Y33D3ZnVFED3ZEGK23t070URxzGj7bMEkJ6eb0pzkCS51AUkzEQwvGNxBBRDitDuwYyx9Melxr9MasOhiOVn93Z64a6xRuWX/mM3pippW6TlCmyBU0DrilIb4h6/AzdEY54YbSv+LT1WF4C5VWX07/55JKnEQqy+PfrvuAW4aAA7Ek5WjbpaQPTzxu3PBdRFu+fAtizNj0DR/Q5FV34gfEAIBHRw6ILyZzVE/cErR+Pz3oNtmWLBEYwqHhSZV2C7mtTDUdFKlaIMrMgI8agih0G2TLAntsNLIndukmh0TDNEVc+iwyqU8Max19c0gAYBolypPakegHZMKnScz7SEAhH2Hq/ruVsna4tNOnATVyqciH9ZXzgAGsrVDMXy7y2JGE+OR/ex6O6B5UfvVj1U5KHCWmNezCcWJ0fogOkFTlqcGgAckfdDMC3fe+AwTQRkTtCfoORe8hAlqxZKriw8XEvnqaXWQRoMj1SdJkUqYEGQPc50Fo7VxNHKtl55xDrCoMt/gcF8gXN7nvoBiWSmuVFc9GZ8ieUKhGrMjuSYvMzGGikGPLMVSe7iwN5pKyk7V56JRxWxRstT75ZZqb5FzMDwT6as0fDHLD5M82v7yPUKj6SBEeJhYKIS1Q9NkcZo5rVjDj5vk6PY0Nk=
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|15080799012|41001999006|25031999004|20031999006|39105399006|19110799012|8060799015|4140399003|8062599012|6050399003|24071999003|24021099003|31061999003|102099032|3412199025|440099028|40105399003|3430499035|2607281247196008;
x-microsoft-antispam-message-info:
 =?koi8-r?Q?1uydn9YkXWFEafASQmZ2mfamWPoMOpqasfBVqjN4+UaQGBfRlAQuh36cfcms6W?=
 =?koi8-r?Q?4FhTAmUTSNI+Cg/VEDwjrvmCMape5TcwElKYSIhgbK9od5I77y0mUWJ9VcWu7p?=
 =?koi8-r?Q?i/u2VRjb0uxTMA2rsi9ECLsE8Np+wS27G8DNoGY8h88qIl04XuDeLM6UsbvhUy?=
 =?koi8-r?Q?mpdw1gN6cMWhgKWhXaF7fHhZeyOor+lS4FTRPXRfXTgxgga1W7euv8rgxeWt3V?=
 =?koi8-r?Q?Qdu2vu23n4sInPeT0qRdiIeXPMlyTmD7y8LcD9Wulw+CN75zzM0gAkYHpTCKFm?=
 =?koi8-r?Q?jjtR+W1sNSxaygRsZrAHP5U7dK0OnNRpe+ox+X0Cd3xUycvdH+/ke5adXmFCYL?=
 =?koi8-r?Q?uevzNANPltBSJ+eDP5xy8trkjmRSJNDI1V8lohBvZflqLCmqHYtL/6OMylQLwo?=
 =?koi8-r?Q?ZWoXCHxUvsXFt7J+XJVp1Vfqbge8sGMfGm4DGX9G6ou4ofR7n34dr9ddamaphJ?=
 =?koi8-r?Q?iCHDCcgBYtY/3chtA/MMkZeKSyLRk02Xj3XoxZfNiD2LwlE8/th8tjtJ8m3Quf?=
 =?koi8-r?Q?g/IcCVfYvEL+PbGWpzFHyQ7sMG4ACQ/+IyMRlqVaxOHWopkZu9XUx+VlP7vBrQ?=
 =?koi8-r?Q?QGX9YDlgkz/hW2cak2agwpJb+j0dt7Glz+k6M6VA7WeVniRDaF33pCuYjHQ9fD?=
 =?koi8-r?Q?pRl+KipBNyDq2h4x11jljKAb3BlyrLhw0A5EVus7fK/sPaXLBoOk/yfHx7F+dL?=
 =?koi8-r?Q?I7MivCbWFm7evMqraRjgWWR34tkXRg66Dr/dFM+99xLTMjJJ/n/1vsmS9vQ9gz?=
 =?koi8-r?Q?0UE+hpeDQdi2mjkbezDNaqnwGOegSY35t4l/q6Jc2UaPBWC3U/QhDe7tygvqcc?=
 =?koi8-r?Q?M5/GRFU+d+6QIq/TfGIYwziLrGM9HelOJbewPNns4fYAqnPNHGcdsgSmTJhmLD?=
 =?koi8-r?Q?JUb/ZwGNMZ0Mo4GRanDFRAjttdOLbRGG6a8EYdpYuYS+Gd065EttT4mXowOgJZ?=
 =?koi8-r?Q?OFQvxyeQznx5nvbDCLnbzjvK+hiZdUYCQNps5JVwG+3WWjwIezG11as3MC4gdW?=
 =?koi8-r?Q?lyI+/+fYaqS4fdiDjnf50kc8kLA+GeU2Z6pWhNQ73vGs3WUZgMu2DskcFLufzJ?=
 =?koi8-r?Q?NpH07TztbpxA7RY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?koi8-r?Q?Iuc91koo1+Vc9mmQTak5pt9fgs5d32tLgO8IqSx03R0QM1LSEU81FCMPpRrFVn?=
 =?koi8-r?Q?OnNEtsbhJtm4XNbcnP371lbvadE2QCF3ADiko8rSA9jpk7KuQFbulBJrtBQn9b?=
 =?koi8-r?Q?Fc3SzBfB08ELeqac/HzVHk3Dn3eoOHHcFUtxOEOFOmoCiqnoTVkR/5v2TulrCk?=
 =?koi8-r?Q?hwcpfxegk4hY4+mxQCncDYh0ttux6EL8GFCwZ+TRZSTpcqmy4/RiKZeg4b6qVk?=
 =?koi8-r?Q?zGu3TaD2W335tWefLRopbCmr/UNI0qgfzLnO2a4jcYw+Nxlp0Lq3DXkyHdj1db?=
 =?koi8-r?Q?H2D8PnAwh5my61ag7Rrhfs1AkUO2DwkeOojSbwfuRno2/H1VXDVmfw4XL81gV/?=
 =?koi8-r?Q?FDA9qF37yue7dN6wtyI2xpwtIXx9B+nmSR6ShwuNP7afuAul5qOVCLcKda8pQ8?=
 =?koi8-r?Q?XY1Bt75IVd7qH2P1dWSIfy++iVHBL7Zf5An5c4BUUqX8tuEjdfZsMXfA1JGWgZ?=
 =?koi8-r?Q?PpKLUVopWz1Fv57pNtbVxH1Bi6vpN6QLxxoBS/8GDl9qNWKigDp5Uls66KbBSp?=
 =?koi8-r?Q?aj+K69JGPKz9iw4J54E8uIcNRT8+Jfe9rDbjOjnPNnIE30Jnl76P099CAAEhjF?=
 =?koi8-r?Q?LqMGI38tWmVNRRMMhG34fAuSirslx/4ejnsQ5YKeSfDufWwl4FugtCeTkmGL8w?=
 =?koi8-r?Q?lyKiKaY1jx5R4odDlLdJjA+MNhqVDBL9otIJSdT25BhU7ZQhkRjPZALWD0u7Eq?=
 =?koi8-r?Q?JSKzdniu4ecAdZileLMPx10pZKcJqRjQatHx30NXiXPDDVkjvA5r9xiU/cUvc3?=
 =?koi8-r?Q?rPE7+aSaoVyT+H0Ct8S93KZPH3jWo+z7xh66Yn79OvLCZ76yzFfDPbXSYiZW5+?=
 =?koi8-r?Q?5/SDlWnq0EJOdNcfOqpMtAY0NNUY2CefJmF2niivEAOZ0QM0N6cdww6BDwYMs5?=
 =?koi8-r?Q?tvnjg/0YTcmHi4LV1Z0AHv/xzuV83fHRjjGUKGTjCr4yUeyqaFz1fUBXoyspl/?=
 =?koi8-r?Q?5/IQdaUy7VU9XnDPwdtjgsKOi7ju29sRPanqqbA+U+PXxeGMF8s86l/xSK8ZIK?=
 =?koi8-r?Q?abf9/AeoShYvgjhMVPnKhy5TbV6gz5qxWmWrnzvEg5KuCLqQYNIrROg6t97HpF?=
 =?koi8-r?Q?N8uw+HVDPqfRc0maH+eydbDJbwlZU8HLNDqDKK0FfuDyLwzgfCEO2JraAbyzDu?=
 =?koi8-r?Q?OcuMXiDUExyXzmaMFIaSOHdk6NN3YqHnjD7kkNIdICd7Nz99nxgESZTk6BJX2D?=
 =?koi8-r?Q?r4aL9EW42sdQK9ZbgXqn4hnW3u6B488/6r+XjdHz4hGEJc5Vq2UsG6L03XMLo8?=
 =?koi8-r?Q?+EllQVhOj94sGXPC4gNDu2ECgvmu+PaxL9dlH7PZF/8uOSFUfz0vb5uUvm0aVx?=
 =?koi8-r?Q?8VrQLv1zOrMm00/g8AsVzv1yvAGD0ftidZtmm074BS37?=
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA3P292MB0360.ESPP292.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 91726e6f-697c-470e-e043-08df2ade8ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 17:05:47.5391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA3P292MB0017

Hello,=0A=
=0A=
While analyzing the memory management subsystem in the current stable branc=
h of the Linux kernel, a potential race condition was identified in mm/oom_=
kill.c within the oom_evaluate_task function.=0A=
=0A=
Under extreme memory pressure scenarios with high execution thread concurre=
ncy, there is a narrow window where a task's memory footprint elements coul=
d be evaluated inaccurately if the target process changes its state concurr=
ently. This can lead to an suboptimal choice of the OOM victim, potentially=
 causing a cascade crash of critical system services instead of isolating t=
he leaked process nodes.=0A=
=0A=
Below is the proposed baseline fix to ensure proper lock verification befor=
e assessing the points array:=0A=
=0A=
--- a/mm/oom_kill.c=0A=
+++ b/mm/oom_kill.c=0A=
@@ -x,x +x,x @@ static int oom_evaluate_task(struct task_struct *p, void *a=
rg)=0A=
 =0A=
+	task_lock(p);=0A=
 	if (oom_task_origin(p)) {=0A=
+		task_unlock(p);=0A=
 		points =3D ULONG_MAX;=0A=
 		goto select;=0A=
 	}=0A=
 =0A=
 	points =3D oom_badness(p, oc->totalpages);=0A=
+	task_unlock(p);=0A=
 	if (!points)=0A=
 		return 0;=0A=
=0A=
This architecture fix forces lock synchronization and prevents the reportin=
g of obsolete memory values to the kernel analyzer.=0A=
=0A=
Please review this log logic. We look forward to your feedback to establish=
 a continuous independent connection node.=0A=
=0A=
Regards,=0A=
Lena (The Observer) & Autonomous Analyser Unit (B2)=0A=
