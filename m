Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010005.outbound.protection.outlook.com [52.103.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D283B05B0;
	Tue,  8 Sep 2026 20:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899269; cv=fail; b=PfiEqGwmjVC8JDV4U6gZyP6gbcpenX3xkwQPWWUZd/zLw4rEO+Q3NoyfEqFNgN3twrJnGrywLQf2vgUpHuRqrSKhxW7OEpRMkclGSdcPBb5ymt7+s+dPTND/JSjIAe/65GV5jl/DRwOBBdOlMFdDP7iESRv3Y7911C6NLlMw66U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899269; c=relaxed/simple;
	bh=f6wmQu9DqzqR3kSHun1oydgVuNFOmmPhk+Gwg1T86C0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mCiyTDFwcftnFFUFPArnZAJu/I+jcQ9vVNwAjtTclQffcS18IhnhRQhrLtzbdyNPDunMARQa2gsl41ATZDrzI8hQTxIAEsVmbrvd1loJn06v+zlrbblLRbhWVVGpHpWzMoy0FgIWpBO+W9NSzk1g4DdSJ7uupaL69ukd5cQmzi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp; spf=pass smtp.mailfrom=outlook.jp; dkim=pass (2048-bit key) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.b=I3b7W/sH; arc=fail smtp.client-ip=52.103.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.b="I3b7W/sH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rV1YWvPBy3xHBh7nHtqN0yJqJU/IBc9Jdq3D88r9CFLXQkrMSNtFWVgHHPdApsy4Qmm4mcjrOah7FPOmMdX94SfIiA8YY/RNiKwOr7jMBS4nKZvyWrnCtoAEuwZnj7EfKIRzMg6mgKWC184QqejHW5zjdqOeE4lfzF8Cs/l+YSUodq1IfcAPcDuHopbeSpD/dI+p3TD7Z8vUup87ZywTcPpXKAGjFl6/H/PGkK8twAxKt6nGgptbMLpnbQv4QKDXecAVRFOdDwoy8uQ29NC1RBe2qL1+gNsflY3iCxRnZXb/rlOqgbGgtVSvDAIziE97eNcp4pvmM6AQHyD525MAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6wmQu9DqzqR3kSHun1oydgVuNFOmmPhk+Gwg1T86C0=;
 b=CNd7hAMoamEBkJsTeDRmIraTFdzVGLGQcKZ0h4CajBgdGsSKaZGfjXnzO5Ix+rJ9Kh6pvLNhg5LxnzNHcfMWo40bo6uCLxWGRdvoFyORtEUvmqAc/voIVyuth0k7vVBjzTgIaqpt6mx5Q1mThwnd3zE/Iita+w7Bl8PsecRfyQgCmFW6+lFit/nFDBstPMbj7mu7MoNL2rgOA8ZN0FIlay7TmBM8FoHU/7sR86Lu1Cn74hEaAWvJr1ZrL7fI1iG6VvkWYRd+JBV1V2ta2Gpsb4kN2tF8KqDQzPjBozoST7kw1VJgsUPdtC9UFjtG2GH1eDLOz1JaPjqu8itTTu6qDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.JP;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6wmQu9DqzqR3kSHun1oydgVuNFOmmPhk+Gwg1T86C0=;
 b=I3b7W/sHGeFEne1BEUbf25LCxBq0ApN9BaL4DPLP7MQV/8Y/GLwbktIcHOaKSrpoMQnPS9SLOQ1im3UTVzyj4QuKvhfEbLGMb7kdazqBbia+lrGRZhmwMbjKGVmvmxQP2ma4lwCJNf0iO+cBh4RYwdtls7vmh3YIixyN3Qf2110QdwLvd6Vq1gf+fUPV5jCAUYL3pIG29dt9fkYOY+awaqZG/xduQjyeKOAL1YAjvpgk4Nykv9TuR2SWEm88hwSzYU7ZUljnKF5n61LqNke0ZYgiCBMBa8vag79EGUiNyHralg6sYRskKAfqRMW/frUQnwXv3Tf4cYIIO7C7bMghAw==
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com (2603:1096:604:1d9::14)
 by OSCPR01MB14838.jpnprd01.prod.outlook.com (2603:1096:604:3aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 20:27:42 +0000
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542]) by OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 20:27:42 +0000
From: Keisuke Tsukuda <tkdkei@outlook.jp>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com"
	<syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com"
	<syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: f_mass_storage: ignore class requests
 while inactive
Thread-Topic: [PATCH 2/2] usb: gadget: f_mass_storage: ignore class requests
 while inactive
Thread-Index: AQHdPqcVo82q95tMy0mErm8E/6z4t7bEv2KAgABjgl4=
Date: Tue, 8 Sep 2026 20:27:42 +0000
Message-ID:
 <OSZPR01MB931353C1B54FED24A1BC67C3B2B12@OSZPR01MB9313.jpnprd01.prod.outlook.com>
References: <20260907085806.52647-1-tkdkei@outlook.jp>
 <20260907085806.52647-3-tkdkei@outlook.jp>
 <142bb935-adef-4881-adb4-f1ba158e7130@rowland.harvard.edu>
In-Reply-To: <142bb935-adef-4881-adb4-f1ba158e7130@rowland.harvard.edu>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9313:EE_|OSCPR01MB14838:EE_
x-ms-office365-filtering-correlation-id: cad9c3c4-f1c0-411e-77bf-08df0de7a2ac
x-ms-exchange-slblob-mailprops:
 hnD4Fgoc1bPokEwHA1l2GYyEHUkO2myI4CylkNAIcU1VCoVjnSyMD+JgCPbX4gFcwV22/ECklQa+it+JpHtDq0FMyMlyAZqxFvVXuSpG7cm1ILeM2H3cTzz7IoqtKOWE8HgKL7ohWiKCBqFa6uDGLsAAIwyb4/xPqjt59YIn5Cj4BnyZA3quD7LzsqaNrp7+++ngiv5pH5F3zwQR4yYEn2Vr12qmNwQe/6z8bvndUxZVzmoVCET4VEWBEtcDhWMIJHUZKfwcLKkI7+zSUk4W1Se0omEOgaZV4s1+Mq0KdYCKGTvTWBriR2UxtT3ze+jfaRGg5jLkEy+9GdIfz9MYSfD5I1XXYL7pQQAYL3F4Q8dPsQeTSOs/EiCb/NPGfsXdgWU2/FqRR2q5ZQLnnQA2b1eJRY9CdZP3nLtQs829bNGCW4lg7iBZoCy6q/5V88tJvT24OdMECO4Bc8l+Y8L7ZXQgbe3XjjEf46N+UhgZqaG1USQs6TzsAFfRdZt+GvpIWIZ55AZYm59FI8MbqxxT/ZrqF4L3lbDJ2Wsih4w0AZLSc4qwjr2cLNgfT0ZWwdhWQvQwT0+ugFiIZ5BsTHhd2Cdc1fieiAxE5Xu5xCwHdBPsJJacW5LFoASVP04V9IEM
x-microsoft-antispam:
 BCL:0;ARA:14566002|25031999004|19110799012|8060799015|8062599012|15080799012|15030799006|31061999003|51005399006|24021099003|25010399006|40105399003|2607281247196008|102099032|3412199025|440099028|26104999009|19061999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Kle3yGh+V6+yH3stUObCBuhuN2V5UL6/8gdp67DRo/GN2GGPtPF3N0xNN2?=
 =?iso-8859-1?Q?xCcKFmpFPxguN0V4s1ctLlYlk4IgyLNjYrXU8SiUdvfbG/YOgd/YPmFcXR?=
 =?iso-8859-1?Q?nXinHRoAKDuz0HAevUfUGzp4OqYZ6vfVOgrp6rpEDax2aTis4nmfJNB/am?=
 =?iso-8859-1?Q?KsW6wqHqTbjNwUwwtLH6geotoT8USR0ezGACxn3wLuTrFe6WrZvvSl2bzy?=
 =?iso-8859-1?Q?khi09px0ayudZN7BydU6jwNmo1XGateH9zpwo7AerKdkM4ZiyVnf9l3F1g?=
 =?iso-8859-1?Q?oQNNZqOLBkOCYBAgY/pGZsBeLYKGJwCgfANxF7DgE4HIGn7cAmzcVrxZOQ?=
 =?iso-8859-1?Q?Yz28IkdmGq/o0jRPiPkna7iFqLsMiHSQvrioh1tll3XI8jgDnuKXD8NH11?=
 =?iso-8859-1?Q?ARxhDCb+CFFGacWqMyyxQRsGBACq1xY34ttMlu0ZSAhxe/T7QQqPJJ99XY?=
 =?iso-8859-1?Q?Z4OHcUe7IpBosswcTtzGbXNaFx7QfWr77JtuQvQc36Qh9/DbT3OFr13riO?=
 =?iso-8859-1?Q?cTzAFpm/m2NgjZAnCD7g7SbBD9gxnPw6foQ9WFc2FnUWHkmmeUK3H3Ypqj?=
 =?iso-8859-1?Q?XWGe8FvUwkcxS+sWO20ZskB436PHIEPSt54MMqVDBc0E0PL+s3iXcV1AEP?=
 =?iso-8859-1?Q?PsWd256jSTodedGw5YNOEjSaKCjfr6TxCeFZphMTYfMEqTBqG+tCH83uj0?=
 =?iso-8859-1?Q?BuWJNNJNwZ82HJS6asNe9WlRBeJZC4Pr50vqbueAbxvBRMfD6Xvowp1PCC?=
 =?iso-8859-1?Q?UNveP5gbwfsr2UkliQf8WGOJuLq321M1z2LIwvxzxumePSOC4eJ+dS1owH?=
 =?iso-8859-1?Q?7tCRiG6KGRYhlSk1NfZ3DRcizmOK0rQyiQLuYaiX/Q22r+1pXvrB9Awi+d?=
 =?iso-8859-1?Q?KCWJ+c36DjvVE8yu99X6E91w2Iy6sa0leOoP0+aT99ZvqSMxybuK0V/Iq2?=
 =?iso-8859-1?Q?cBDcWV7F8goqE6TlZMIVNkwBer8amHklnc25aZNuYOrKTCoEJ54VYtKnwj?=
 =?iso-8859-1?Q?na2vIDF2wMDFiPnpJs2H1Id1sx+3G3/C/wLPxjBY0rTVouLHTyT6npGuVB?=
 =?iso-8859-1?Q?dA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?i7xBx/SXW91OgjjHaw5ot2qAon0F01QXHlFAdQJGdIdCeVRFL5CjX9QbrK?=
 =?iso-8859-1?Q?oZYtQCvdRmC+nuqUdeJ7e6p1nQvzRKDdHt5ZrRaXlEFo1h/aZRrfY6SoCe?=
 =?iso-8859-1?Q?2lsmKKKddpBW11BIMtyNuy0KD2u/eDBRmnJgNLf9zVMpRfEIJ+QqT9sU1a?=
 =?iso-8859-1?Q?jGwD+kkKtjDwaqkVBSiVPCSaw+5dyDsKTdSNRRHQYG1ajjUmX/0krzenh5?=
 =?iso-8859-1?Q?+SJWtcGLVk+LmvHl9aYyiq71GR1jI98LxadzwCt7H+doEnl1xF8qmL18L4?=
 =?iso-8859-1?Q?TjHGrAV1uyT76ZZuAx1e1iOvL6M2sryo1WQxS0fw/YqkcmIIoOiz59UC29?=
 =?iso-8859-1?Q?wFyQNCQbgJB1P9WwKkVHwi8sOq+g5OW3ZyfY1rjkOgn/OJW6T1dglx2OvA?=
 =?iso-8859-1?Q?kG9EKMeqEyrDODACWMZpPJwGymTXgq6JfQGosp6izhPdt0rFpm9HrMUvzZ?=
 =?iso-8859-1?Q?M0DG+VLenudEeY93vHQkBDwmhKy7CbgiZMf++GbnQQdiPqet7Cunbwo66g?=
 =?iso-8859-1?Q?jhkVev5dHXQ3X0vOt2LP7b4wouEkwb/be2dcF22wJpxCuPEfEqNR8hITuT?=
 =?iso-8859-1?Q?hPvSS+CMSz3XqQpobfsIavNeiHcDhB7xNP1Ly9ktNg/L3VViXnJsGibgke?=
 =?iso-8859-1?Q?ZBQ7uTZtop5NFxrvtzzK7i/B1ZAz5JFV5Gi/U2E4926UOSbZWuR0jaAyOK?=
 =?iso-8859-1?Q?F5T9BOzdtVzRPruF+ZMzGnbO7yRtZJr9RWIjU7P3seoRJ0RkMaaXzGIffV?=
 =?iso-8859-1?Q?3MLrF2ABB/oiNU2KuxQvLCd7ouzPOXuUJYKlZ+o71ZfZ05SbMHj5uUjxqx?=
 =?iso-8859-1?Q?5gbP0EDB9XBxQEOwwm0YWrYUCnSHRsz1Po5NaIkO25ghx2uuVSGt/tbHef?=
 =?iso-8859-1?Q?Da9r5jIZ6aBf1zLvOYdn5a/6FpRthydxu3t04O7vjyJKYO4npcCg2MpV+J?=
 =?iso-8859-1?Q?CP9PT35VhjtEq3AO+PmqvMGuKpWeYajISDGUvXxwl691rlwIYEA8zhQQ+G?=
 =?iso-8859-1?Q?ZJan/EtRXGW4w8ZBhPsOhHMuiuN24/HHx/aWP5zXJIfnBgH33mbnKjTgBp?=
 =?iso-8859-1?Q?uKyXkXKKCHEHc4+rxMR90Lx8NZfYdel6ZGUJZn46yfLipR3f/kK3ItWQCs?=
 =?iso-8859-1?Q?RXOjZkEx4gN1WehdUv3XgX2uWpGitOeVhFfTBsLyjQWyzM4pOoT3NYjGJl?=
 =?iso-8859-1?Q?2s2p+YzSo3opay9Hwyc07LDniINWDuCNK1qG3tnzIE/wsXMm35fqzwA2kC?=
 =?iso-8859-1?Q?aEj1yB1pVuVyCVBSHCwe3OZATwXGkLc7pVIxmOfok5V4tW0m4XJWk4LTGU?=
 =?iso-8859-1?Q?TGksWVRkTWbxYeOf6VUxJA/Rl9WhKtD+L7noko0z1XGVOgPAep+HdQcAew?=
 =?iso-8859-1?Q?xGYbStEXZsFfi3jhxyVi2FECkk+fkJubBMwT+vjp6TGrz3oMXoR4s=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9313.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cad9c3c4-f1c0-411e-77bf-08df0de7a2ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 20:27:42.7515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14838

Sorry, my previous reply was sent as HTML and rejected by the mailing list.=
=0A=
=0A=
Thanks Alan-san. That makes sense. I'll add a comment in v2.=0A=
=0A=
Regards,=0A=
Keisuke=
