Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023136.outbound.protection.outlook.com [40.107.159.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9373B3C0F;
	Sun, 20 Sep 2026 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789925399; cv=fail; b=eXKuULEOYW4RHp4RCSgspT9RituXUFvP731O8/jEsNLwaXPlbOOnYje3Y8Cjb1ilj7JpDKu+0HZfTaJq1TgwJ9SvVXfybLCSTBCl/U4KVMFWtFrenmD4MWYEcOSx+Yljaim8UwaxeXgr4TmWfeeHkhYBDl+6fCgDu6wdzlXS+UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789925399; c=relaxed/simple;
	bh=wmbPpeVtM+H3y4sCKCSD316LJMqeVxm5DqktYjqOiwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GdQq302W9IUo63/WzS56qJp5xiRAt94i5Nw8oqj0R6Ms1/H7Ie5VpJDi7VsnM/4HukU9Oo6Bt08cTaQn2dxU9y6RUsoo7FCtH4g7K50QmId8nfpxPDgKNRmuGvOfFbuMCJ2JOBkt/PBnWvUo8IwoWl61hF2q33DpyYD6CiGnBKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it; spf=pass smtp.mailfrom=studio.unibo.it; dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b=ZQ2K3pkA; arc=fail smtp.client-ip=40.107.159.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b="ZQ2K3pkA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFAbEyJyKoAva4rzTkyZOuYIe7XCO3kjGNfUFCFzH7PzywyPq6PmQPwOhSrinZpoBwKXp03DOgs0Zjg0+yWVRaqreJAtrklvz+fXT9j3uXoqoUfCf+HjQtrgRGvgJTRA3Dh9KFZPW5Ny0pBntXzh+B3RjiWazIThvQd/oBzLJQXg9tn4GMk3/yWI/yIZ5I529flxyQv/slPBWVQQ0G/wJrq7sSQzNNJvX5IeIaZRqQu0aztUeatdYruNUbsYangWQMJEFIp8zSK9KZn2s462iHf51Zj8OE/SLFvdGf4OMWNyxL9OGnQzihOGrBXJYQe3kAgASNYOGfP6jEaRryzskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrESV+PUdp3XD715C3QRuhj5w1nHoByFj9KOofee8As=;
 b=NyLHYgheNKtHPJMvn3DzLHF8ZPAKM4QgSCtJI21mKUZZhme8gsw4eYPhZTLYhKgPKmKa4ObMTlzwCD6URLG4xrckSq2JZ1XPWaUEdE2UtSa4y9GQC6o14AWHSA25/+vYvphbV8KOZ0joS/rCdHQGT8XfH/rQomxBpuDmIBezXqScb/7iOlYe1fnQnYUrs+vEydsvl8gKas6YGWbvcpbRPUtIVj7cXa7xS1lxY3LrTA6viZHoZgH4beW31B8qpun38vIM5r2LedL5sD45VXG0gYdhoDGHoIKhFsnpVqYdQaIx692GiQXJoyJtveatPsf+CQtsuorC3CQr9oizX34Btg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studio.unibo.it; dmarc=pass action=none
 header.from=studio.unibo.it; dkim=pass header.d=studio.unibo.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio.unibo.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrESV+PUdp3XD715C3QRuhj5w1nHoByFj9KOofee8As=;
 b=ZQ2K3pkAOHS+5xG/Dg9pDg6VhwlMo8EuW9KkmFPr92T/tI2CRqq0ipOjrdYhklbhsHPNaum+88ZHzUA294PsUXnRjDpFjRyxdUkDGs8VM/R0obJr+Kn++bliQUO9tiv6OAup/BFdhFgZhygKF0JxsPecW2howrxSxF5GHgvB8TrbpVjhKNiZ0VULWv7nkryofXoK/rxfWV96m6Zmu5Fpyqq7mrIx9ZC0DlLvRnKKsF6CRx/R9CgJcYknubDujAeVCh9o56P0tm9KWHmAasPkZSuFnpebvWc3ttKNY7Kkd3efdZnP4tSVdzkoolRZLM8bTpy9G7bR2bKabTbVAw1zMA==
Received: from DU4PR01MB12163.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:620::18) by GV2PPF6C7B6021B.eurprd01.prod.exchangelabs.com
 (2603:10a6:158:401::597) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 17:29:49 +0000
Received: from DU4PR01MB12163.eurprd01.prod.exchangelabs.com
 ([fe80::bffd:753f:fbcc:c402]) by
 DU4PR01MB12163.eurprd01.prod.exchangelabs.com ([fe80::bffd:753f:fbcc:c402%6])
 with mapi id 15.21.0428.015; Sun, 20 Sep 2026 17:29:49 +0000
From: =?iso-8859-1?Q?Nicol=F2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo=2E?=
 =?iso-8859-1?Q?it?= <nicolo.giuliani6@studio.unibo.it>
To: Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Gregory Clement
	<gregory.clement@bootlin.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: R: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Thread-Topic: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
 board
Thread-Index: AQHdSG9FPSJli8/cuky5AOQ9f1roMbbWeggAgACufWSAAGwuAIAAJQrx
Date: Sun, 20 Sep 2026 17:29:49 +0000
Message-ID:
 <DU4PR01MB12163D0B16328F734DDABC5A680852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
 <6b935e31-169a-4cd1-b385-62dc659c1256@lunn.ch>
 <DU4PR01MB12163AE447B65B21A7D585A0D80852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
 <feea5596-f4ef-42af-b9f7-6bf170620532@lunn.ch>
In-Reply-To: <feea5596-f4ef-42af-b9f7-6bf170620532@lunn.ch>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=studio.unibo.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU4PR01MB12163:EE_|GV2PPF6C7B6021B:EE_
x-ms-office365-filtering-correlation-id: 784017f7-f731-451f-2ec6-08df173cc599
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|786006|1800799024|23010399003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 lb9fR3+Bzzu/9Hw/0tUk4/yaUDzyi0JrJhzsdmmnBxyfobQJxbn+QLOeBjwFNOhq0GjPu9kr439cVbvA8Dl8zE1Tbbs0HgvPVcCQUF77PHU7Py8qZCiWlKVlOPARbTKtetgrJ8M/l6C3OPfZYXuvbV7ulicyllUTgCpsgYyGOXnfbA4CXPl7AGNEyjWU1fZvSFAR2pAYZcWK+rY2pDKv3HCEv+6t+XFtvh4FOPzTiZyo/e+/AhDw0DvNo2HvAKm3T4sCkErqYhktqJKWkFZmgyiH0EPy0tbT/TP9lIKfmXcJLg8ZN9B3cAteboUz5aEyzXQQXApYSEZOHafduwMvRJ88hktcMtZZse6d39y5+tBhU1yEAEUgHFP7kCCebodRnxGzmqT58MbwM2S5nNo3r88hvf/xEXUoV+kndBs8hZxm1ZE6OW5AGNcHLxTP+kfJ9pBgJGuFelx9wfmxObzwhve7TqwiOR6sf3iLZiR/+a9SZlnBqSXEhXuM701fLsyqKXwyHPzxaRq0SuB2U+4mZq+S7a74CAskTZaV7xFSrZSSvZiqcuvGvl3NqQkAwFh16G4A8NXOSMzVapxyyM6/1VtiMqxj92WY0GIDXIIGasqUlJCvywcbXP74kIbImmuTX4OvYRuFERbp0bXpbTwe8kXd1WXuHTzlEuGGE8sUFoUix1UW7/XTaaLFOKZBgVH4kBxo3xPcUR64+4mzNy1A1sM8ZKEKobknJKnfkQGWr4E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR01MB12163.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(786006)(1800799024)(23010399003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Q3JSlUghwyEmxq43Nu2oyL3J/aD0tyrlGyjXvZok/JV/QoqUpv+gQCLeSd?=
 =?iso-8859-1?Q?6RUk7ZFn9tRiGvENULDBz9zP0eLd4vxHD/P3MzrY4ONSGTCX+cdlEcsPOg?=
 =?iso-8859-1?Q?/+5if/v9IOKH2ONnOfSodPAp/vsIS+HUHfShhoZlWbFEkcnstQa+0qJp+2?=
 =?iso-8859-1?Q?2L1XnNSWd+UClTEdZv1wAAUz2rzENuEUQ0+bfpoZqqyW+CYa9svvXMpY57?=
 =?iso-8859-1?Q?ZIBf/mn6u7n4Q/0sj8ViA7pKJfXgdPXe3M2fVynie3vUdrj2u/7b2SuzbP?=
 =?iso-8859-1?Q?DbdvD7RS/u5hBRuNSeKsyQisVlmU29iZvvIK0D3EtLpfJL1B46tA9NE/Lh?=
 =?iso-8859-1?Q?KyEkiMEkua6jIOW9zxVXSbmR3glwcPmhfPfVVoPPiVr3br69o9c2nxV/iB?=
 =?iso-8859-1?Q?ybLVWbS6gFao9VAvfO7X0eNVfkaI+3ShC0CFkzFfc+017qRt+RukbqVoVB?=
 =?iso-8859-1?Q?Tc3rNw5qd7OkxWSOEFdU/JifSnLHA0HauadbWwDayINWnd7M9xcbByBspE?=
 =?iso-8859-1?Q?kBCODJ7z1ph8MUL5zEWEIo4/IVbv0+NwN421jJ05uPn3rqYlqfpf3aVa2p?=
 =?iso-8859-1?Q?byP7FYk1e5GiPmYWxPlUTGfQ0VV3brsHhQ816fuYV6mPbXyX6tJQMzPwEp?=
 =?iso-8859-1?Q?YErNqk5J7RKpzpvamohhyRqDoUTtyP7dr8p/D2hOnAzhYJQQ5I0STM8T9f?=
 =?iso-8859-1?Q?i3ybGIuY3HdDadaACxYwbOsT0ArA4e7KCv7AmKgb0hGEmSmwK805Q3Cy8D?=
 =?iso-8859-1?Q?v0GGaC+ZjwiotSBVwSh8hBMioDrLRyx6Y9cXzhKdxS8eIDObcseEK4ERw7?=
 =?iso-8859-1?Q?v70a5sUSU5cKayUFZ5Q9gQBa/8KB9o84UCu6DXWGxH6p+kYs8wO3TMJLcl?=
 =?iso-8859-1?Q?FRGFzhQ8pH6CfGvcMT2TvND3TYcWQbFbeThsPzSsvy/opcN4Ru34cHmBnP?=
 =?iso-8859-1?Q?acEh8V5kwssYBn2mKTaOSQQX35mv23oq0wrXZsRZD2eoGxgDDRYWbv/yll?=
 =?iso-8859-1?Q?7gFjZXtYOR1A87j4+PBET07SdVyjHTjP/lw3CFoO/OFHj67QoP+3lmTsPi?=
 =?iso-8859-1?Q?uUksRg0Pt+jXvLzzjx8UK5ReshHq2ZFF4hZ0jMwKP+QNPsfCawt6qumtKS?=
 =?iso-8859-1?Q?gbz3cVCzRWgP9u5GT7K/FPzlsLdme2SLulYbNgoTpYHndtr1vd8JHNf061?=
 =?iso-8859-1?Q?YuuvuWFWCn+CTBLUj0HBORymvUOYj3U5pjEiR9o5NFVy8evZZwXYQC931q?=
 =?iso-8859-1?Q?fYaiJsLN+N6pujvhMVa280AAqGvN/ljEuyI9+BaOlUbBQ2C7JEJ43aiV4J?=
 =?iso-8859-1?Q?aoLrBKnuXD0YCUFL1+iklLTkzA00/caAJx5w7EAoRVodT2lO0lEaKA+6zs?=
 =?iso-8859-1?Q?xF2vuHXIRVcFv9FSZ2WGSegBoD6xKNBpRApApiTzqkUnbDdFGCXDgxjNZd?=
 =?iso-8859-1?Q?dETgLy+gvt9fvCKWP83VvaDBe9P4gBlH6TMVjukTd+vkhYm3DubX3unGbH?=
 =?iso-8859-1?Q?1b7QCRVy3gQzDPfujE/oMqfamSA8BMx9RxWoPEAiMLUB9Q0ryGIWGn2fr9?=
 =?iso-8859-1?Q?gK8QK+vc9K14rtn204urtoloIdN5phY9jC4AKm9XQaJ6dT/dSTasDrl6r3?=
 =?iso-8859-1?Q?MINZGuRELVqfRcGIvBY+EeeCh61KejG0X68YU3cvYE6jS+svawa3Jac8IA?=
 =?iso-8859-1?Q?01PqXctlvInDAqIpdMjdLOoz9T/TCH3maXvhR/0LjB2YXJxrJkAriusUPi?=
 =?iso-8859-1?Q?8WY6fXGStHXLTGMKrHD7HkOV4+0Fv11Ek158dEK+43lN7+JaQoLrg8ncEp?=
 =?iso-8859-1?Q?FRlCJuWt/a4JkzIoPesbmOwb6rE0NzE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU4PR01MB12163.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784017f7-f731-451f-2ec6-08df173cc599
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2026 17:29:49.0329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xzmxyt40RWdtzNg5YrVrB4EikH74rb7z/S5Lz75qqQ6VtQVOGA3Jo69LsFHL8s7mYldGXiQ7WGOZqvavwC4cX1l+1TXAm2H4zPpt9ME58cn0rijgrYU4ZWcP08RQ6Tf9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPF6C7B6021B

Hi Andrew,

On the reset:

> So please fix the driver to accept that the 88E6193X is much slower
> than any other Marvell device.

I don't want to guess here. Before I send v2 I will measure how long the sw=
itch needs after a reset done only by the driver (re-probing the driver on =
a running board, so that no boot loader reset comes first) and report the n=
umber in this thread. If it is longer than what the driver waits, I will se=
nd a driver patch and keep reset-gpios in the device tree. If it is not, re=
set-gpios goes into the device tree with no driver change. Either way the c=
omment about the boot loader reset goes away.

On the LEDs:

> Doesn't the 88E6193X have LED controllers of its own? Why do you need
> additional LEDs?

It does, and the vendor firmware also programs the switch's LED control. Th=
e GPIO expander is a separate set of per-port lines that the vendor firmwar=
e uses for the speed indication. I have not verified which physical LED eac=
h of them lights, so v2 has neither LED nor expander nodes. I will come bac=
k with LED nodes only once I know what is wired to what, and I will use the=
 switch's own LED controller wherever it can do the job.

Thanks,
Nicolo Giuliani

________________________________________
Da: Andrew Lunn <andrew@lunn.ch>
Inviato: domenica 20 settembre 2026 17:14
A: Nicol=F2 Giuliani - nicolo.giuliani6@studio.unibo.it
Cc: Rob Herring; Krzysztof Kozlowski; Conor Dooley; Gregory Clement; Sebast=
ian Hesselbarth; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; =
linux-arm-kernel@lists.infradead.org
Oggetto: Re: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU bo=
ard

On Sun, Sep 20, 2026 at 08:48:20AM +0000, Nicol=F2 Giuliani - nicolo.giulia=
ni6@studio.unibo.it wrote:
> Hi Andrew,
>
> Thanks for the review.
>
> > The reset line of the switch (CP GPIO2 pin 17) is deliberately not give=
n
> > to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
> > seconds after a reset before it can be used, much longer than the drive=
r
> > waits, so the probe would time out.
> >
> > The obvious question is, why is your 88E6193X special?
>
> I don't think it is.

So please fix the driver to accept that the 88E6193X is much slower
than any other Marvell device.


I saw the probe time out when I started the kernel with kexec from the vend=
or Linux, so nothing had reset the switch before the driver did. When the b=
oot loader resets the switch first, which is how the board normally boots, =
probing with reset-gpios works on this board (Linux 6.18). I have not been =
able to test a driver-only reset yet, because the boot loader always resets=
 the switch first, so I cannot say what made the difference. I have not che=
cked whether an EEPROM is attached. v2 describes reset-gpios and drops the =
comment.
>
> > +&cp0_i2c0 {
> > [...]
> > +     gpio@20 {
> >
> > Which port?
>
> It is the LED expander of the eight RJ45 ports (two pins per port). Nothi=
ng uses it yet, so I dropped the node from v2. It can come back together wi=
th the LED nodes.

Doesn't the 88E6193X have LED controllers of its own? Why do you need
additional LEDs?

        Andrew
