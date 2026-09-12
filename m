Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010016.outbound.protection.outlook.com [52.103.7.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30E390615;
	Sat, 12 Sep 2026 03:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789183725; cv=fail; b=ggXvFXoMSoCcKqXLpEmYpxHOHiXVPmeN4xit15ChoYBlX/9jkfkqfRhNJ/oDaanXj+UJWSNldI7ilHCwRXwi5sQgJYwcrn0qb7e2uxZfD9Mgmrqq9iDhUBcQ8srBZB9brL1IMlz+WZ/ri7UIXosSnsQNeRcGB0bXYptqauVPVio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789183725; c=relaxed/simple;
	bh=Do6BaRzxXn53tV/ACopwEsi7RiV2REGUGQ72wS78kWY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HBhbmMKbtj4zqBMJkKzGVRUVu7Ay6j7DzZSDlSd9wgVhSXDrXO2Kp0GHVOO6/8wYWiKr6UvJnuaVeBWDhF/Kd8TqCoiQa1LK/+gX/zzHI2+XAzhEBzgNEHEdE5Wa756KuNB4DYF8Zji9VBtMdcGbmekXIM7aqFSAz3N9VcJ4Z0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=vCKW+UZn; arc=fail smtp.client-ip=52.103.7.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="vCKW+UZn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mb/OXuz4ObwZNClC16NvjS+qVCch/KDNQmuwU8GkNYXdnYZi2bDi99rTY5OkGckKoV4yIAzatOY50Bu/j+BpMI4F4Ixn69Yu+nDrUwOyVY5Cm1qGItAf3gYC/DA616myAvXDsO94JVj0/FAdTy8KJvCgLmThbpx2x/XrYuzeW5v3RXmZ7LdknCuw6+oYArlPzuRhC5q9xzSS5YATmMcNwclbvWguml6MGVT9tFlAKpn6pyC9HhpDIKoXsm7nqcPgpI0XqFuTGi9wXiMDQZLVo+6szcnjJtMbmTbUZAb+v8R+sJsTFQibjGJTd0liSLMWZ2eMRpSyJbYrnnLpzImJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E2o7UBzvm02AMwFY43jyjDaQO0FtLU33qLl9WSWBeY=;
 b=mcg58bNGbppbZOkN3MoNhIyQcjmMezGM2pbDerDydLjarnR7u9POlbNlmZFP3OVfXzHuZ2V+vf8qwdiDGP+3QpUls8y/iO2+nWG2BUeKOvp9nas6lkUcvMThJPZQzXHj2mXJcE06+f/yQwJIOkNGqgIPJLUhRQeW/I0/ywZBSBfb4LeCUZ+lU87VxdRO7kfNpm7qfQ3f+UdeRxkAGAdeGIipi26l4D/iMxU5WyI9svkHgCTdKKf4ljY2BKuJJQ0ENxkhIdzcokyRGw6+TClRN0bcS9HriDlK1T+aCiZdc+SbLjglFrCb4tB7PWPrw8LqFo4PzcapdL9EggopotUmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E2o7UBzvm02AMwFY43jyjDaQO0FtLU33qLl9WSWBeY=;
 b=vCKW+UZnBIn+5DuOeO0MHWllYUy2Vm0lgsG+93SiB10BdvZh8Uyuq4X//5Z6OLobCuNyqcpJzM9jwl8mnb7yMgSHpkL34S3M1tJQbkiS0IJ/iFCjRyWpKKX8sfYEPkiWtX2Qz2VeJrHwkxHVp6jrukvttlMN9ffFPbk/As58/jqCAuu+BGONEz0+nDuiI+FqlfW5ihXv2pkUP5oVtPQ4DpnUarjrzUYJOZXSof6ITe5opofThAxtHYTdfs3JNaluoHAWGXV8j+vVFhHeO6IuEZktQMuuLmqe5yd7ZCI+RRSlXm8m3tdK1tB4XznbWxBvBbTeqrcg60W+Y5nUdE0Dfw==
Received: from MN2PR15MB3472.namprd15.prod.outlook.com (2603:10b6:208:3a::26)
 by IA0PPFE8C6306E2.namprd15.prod.outlook.com (2603:10b6:20f:fc04::b4f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 03:28:42 +0000
Received: from MN2PR15MB3472.namprd15.prod.outlook.com
 ([fe80::5d1a:2222:aba3:3a3c]) by MN2PR15MB3472.namprd15.prod.outlook.com
 ([fe80::5d1a:2222:aba3:3a3c%4]) with mapi id 15.21.0382.012; Sat, 12 Sep 2026
 03:28:42 +0000
From: Nicholas Hobson <nicholas.hobson@outlook.com>
To: "clemens@ladisch.de" <clemens@ladisch.de>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: usb-audio: keep MIDI input running for Roland TD-11
Thread-Topic: [PATCH] ALSA: usb-audio: keep MIDI input running for Roland
 TD-11
Thread-Index: AQHdQmZVIwtJj8RLZUqwYeeUMoaLJQ==
Date: Sat, 12 Sep 2026 03:28:42 +0000
Message-ID:
 <MN2PR15MB3472557AF39DC3A4CA9E753FF8BD2@MN2PR15MB3472.namprd15.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR15MB3472:EE_|IA0PPFE8C6306E2:EE_
x-ms-office365-filtering-correlation-id: d76bddf5-5c4f-4fef-fd29-08df107df19c
x-microsoft-antispam:
 BCL:0;ARA:14566002|39105399006|20031999006|24021099003|24071999003|41001999006|12121999013|15030799006|19110799012|8060799015|4140399003|8062599012|15080799012|25010399006|25031999004|37011999003|31061999003|440099028|3412199025|102099032|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?XuPilHJsBgmh5H6nlHTKfmajalQt++3Aj2PNK5jl0pVREhkOF4pQ03Yp6A?=
 =?iso-8859-1?Q?BLVvEgNwHPGSR6l02VnD1V2LSd2Ji7/fOUYCtJH77ldXtc8V4Bx4CtwfsN?=
 =?iso-8859-1?Q?Z//qjqlopPTRKkykChY7LP+j2hL0Lm9xsmJMdjWdaHq+BbofCg2/9ifBxk?=
 =?iso-8859-1?Q?DWkYeVNfdweBANWONIS8YgQEDrdMF2BOzPvgDNW47XYFO4pRXGV1M/DMVt?=
 =?iso-8859-1?Q?LTTuMibuZ75Ia77ASZScZgr+a5Vo9GupJfAvBepckrVrXD2vQMpqt72DJe?=
 =?iso-8859-1?Q?/pWPa6P3T2oY42dvbJY07on3Z+kWMcYREabjdEhCi5d1k+5xeCZmkANhdw?=
 =?iso-8859-1?Q?YjFjsGmBItPizmQm7jDtuSgNWDd2HMyUFkTtN7FAifTiR9tvL94agsrzFO?=
 =?iso-8859-1?Q?lh1N9lTKpOIzqzWMDwRidgPaVuDbmuyHtzOYeTb1x/Tii4Vz4fvP1IO03/?=
 =?iso-8859-1?Q?kiwslAawsiI5m73PzIRmKN9/BtKhqiynBixgTufRpZt4kq9FJ4lZjjQoVm?=
 =?iso-8859-1?Q?FUKeiqRAoiDhY7qCLKvrH/B/Wg0C3XunWsajRMIGm+Z9NCA5/59gVO6HIv?=
 =?iso-8859-1?Q?mPxtNe9wXfva7z6NsAvVkbc1Ztlk0JWkn2u3Z902jNXbqKgEbdX3By7mQF?=
 =?iso-8859-1?Q?q2JQrYtjhpA4sB645F+yRZtZsuMnaYN3FvN1HEio7+CfED49m9muM/zNWD?=
 =?iso-8859-1?Q?+Q3qElk8LPxGk3kmROLrSGWBcNYsrhrAwv8ZaXY4CLf3NqdfYuc08QIjdk?=
 =?iso-8859-1?Q?FEnmGq+wtH7Oy/KAsNOIU76K9A2pKBUTva4s8Z/0ApA/IBmzAsNfs/hoNt?=
 =?iso-8859-1?Q?CRoXCgbTFLgQdXcT5TzSfW/IkpGR+VucJIX7mMyrFjHFDqUyGAmErKzP1b?=
 =?iso-8859-1?Q?UyTWcLi3YQQwhE8uTiJUR03RtzPurNczqFqJkkoNGNiu24QN20Yl0BKq7y?=
 =?iso-8859-1?Q?lVhQQBaOMFAydjREohWuFfTTUIdRQhryuVw20byC8P7U+aPSz1vfeM0Ab1?=
 =?iso-8859-1?Q?nIfdF4TnrSmx5PhW6CGnDCg7fDfMFmgtkRty3wGWCVu6KQFaRdthy/Wdz2?=
 =?iso-8859-1?Q?gBkXKZtWGpLsoYERjlrYfFxjtfMTCL+Zk6L34sbTUWRY6XHh8DMsod/b8t?=
 =?iso-8859-1?Q?P2YKg5p8XX2nOSy6+yC3+EAQAOSx0N0lkMBaPbSgQAYjzY7hokbg6SX+E4?=
 =?iso-8859-1?Q?/gQdH8Dz/pA82Ee4J9Ynjv1kuf5ZpJOa8RM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?m6uch7S3dPV/LdSn6hcNE6B0NqQVF/svkM5x0cb4sil9nxCejT3NrzonAF?=
 =?iso-8859-1?Q?AoEoOIox/76rcgVYujZ2ZgaAdGPKtTZ8Nc9+xKHFCHxWlmFNGjxl/YY6MZ?=
 =?iso-8859-1?Q?yoVl3iuN6/plBvbn1PEQfN9YFYO2oOMrMObkFM1FZ9Tyh2CHmfU8UJq7NX?=
 =?iso-8859-1?Q?CcsR7y1uHeGQwZktSP+3NCWaPjM4JQLJdCRW4Sp1gT2KZNLEB2CzQwGlr6?=
 =?iso-8859-1?Q?ZhgEvDSOrTiAIWci0C9eOZ55yqMMcJKu6AeMl0LI1+viuWaGtOUOmHl3uQ?=
 =?iso-8859-1?Q?iPRYcN8ZkKBOIDFc/nL8Z6XRjsjdZU5DNPR71VA1RB3UNwrSaGMZYkzbuu?=
 =?iso-8859-1?Q?7/nUbahU4kZ16ttdAq3Ybi/9IlbO53y1og5d661Haim6LTSnQ78KhEXwsN?=
 =?iso-8859-1?Q?KJECDg9/PJkzlZ/j7615MqyHTBvGx9VESDg5jxZPimMuxcVU8nYPrReWAe?=
 =?iso-8859-1?Q?hbM7uvw85tJUejOq1PN7uFmT1NTb6ijNGSDNb/UZLnoWdlROSqDZsiCqAv?=
 =?iso-8859-1?Q?uFmHEFbOnPioRNZs1Xn4FbKffkFz83WWIxo9DWg4QjW6Mkrweecras+7I2?=
 =?iso-8859-1?Q?el86alZ+yhklQuWdhqaOB2zT2ofJcO/ZP9Jwo5CSnnA8zlIpzfduy156bw?=
 =?iso-8859-1?Q?8KYNBpjgokgOOQ1Gy4eda/Jvq4LB/9JNZ9A4fPx68nPD/oMU/7Tqbdbf3c?=
 =?iso-8859-1?Q?gi2Td+Ns8NudWQ0rGhbcRNzG7oGg2VWAXTsZNLAErCQKUnKHrnyxVXr1Ul?=
 =?iso-8859-1?Q?REEeu0oF73xO+9u+kBS6n86mccUh9H/lnncqg1fhJ1px6rIbV8f5s1sS8c?=
 =?iso-8859-1?Q?neoCLmJbNY/AKO5mbCzMMEj/KqtghbYXocxcuTrghWJPMVav9xQ8vqbqzP?=
 =?iso-8859-1?Q?D5uLyDSonRvF15UZ4B24edIaLz4/jGxuZMSW5vNkLopyI2Dp+4mGzAcCI6?=
 =?iso-8859-1?Q?QxejwA/r/s9NkkQ+I6Ug9qKXJVFsOqRiWnPaWlXdRaV2aCQA9trhXcKss1?=
 =?iso-8859-1?Q?/jTSCG6PODjU5R1XrjuZL+7hDvFOl6Q3CaMOrmRrd9QtMDmYRbgxQnWVjQ?=
 =?iso-8859-1?Q?KxgBGiJgHuFWu2Q6CUwM3hebmgw6l46mZmhDrLtjHUo8bheW8Y2NOARFFl?=
 =?iso-8859-1?Q?Vr+aA50QJubJYo13XC7yBkjq9L3MNGxc+L1MZNLt2zSyICE3mYTI8QrcoG?=
 =?iso-8859-1?Q?WNw6KLjlsrOsAIPycZLSEMC1uunZB21Ip1kMwKkE7rBP5MqA++MM9HJ5KR?=
 =?iso-8859-1?Q?C6eL4HuKvE0shE1yO/z2mAYbIVrjMgob55eYKYzejIqlWQsonmWDrCKxIn?=
 =?iso-8859-1?Q?yAAV8ktnr88zyloSX8VHL2lp1dbQjadiT38sQgUZKGDyl4YbFb2TBFextE?=
 =?iso-8859-1?Q?TFvKQrzaBbMW/E+KgBDWbjrxCjxNShGytX6nA/jyGUNpQE7XpMiz1x0bve?=
 =?iso-8859-1?Q?Fcmfpvttwyof/4wS?=
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
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3472.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d76bddf5-5c4f-4fef-fd29-08df107df19c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2026 03:28:42.0206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFE8C6306E2

From cbb4e446c3278aa99b34e622ac7ccef3e6d98d5b Mon Sep 17 00:00:00 2001=0A=
From: Nicholas Hobson <nicholas.hobson@outlook.com>=0A=
Date: Fri, 11 Sep 2026 21:58:09 -0400=0A=
Subject: [PATCH] ALSA: usb-audio: keep MIDI input running for Roland TD-11=
=0A=
=0A=
The TD-11 hands MIDI handling off to the host once connected via=0A=
USB. If no MIDI input port is opened on the host, the device itself=0A=
becomes unusable as a standalone instrument until its input is=0A=
serviced, independent of anything happening on the computer.=0A=
=0A=
Add a per-device keep_input_running flag, set for the TD-11 in=0A=
snd_usbmidi_detect_roland(), and check it alongside the existing=0A=
opened[1] check in snd_usbmidi_input_start()/snd_usbmidi_input_stop()=0A=
so that input is started at device creation and never stopped for=0A=
these devices, regardless of whether a client has the input port=0A=
open.=0A=
=0A=
Signed-off-by: Nicholas Hobson <nicholas.hobson@outlook.com>=0A=
---=0A=
 sound/usb/midi.c | 13 +++++++++++--=0A=
 1 file changed, 11 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/sound/usb/midi.c b/sound/usb/midi.c=0A=
index 7e5b1b133..353217b36 100644=0A=
--- a/sound/usb/midi.c=0A=
+++ b/sound/usb/midi.c=0A=
@@ -113,6 +113,7 @@ struct snd_usb_midi {=0A=
 	unsigned int opened[2];=0A=
 	unsigned char disconnected;=0A=
 	unsigned char input_running;=0A=
+	unsigned char keep_input_running;=0A=
 =0A=
 	struct snd_kcontrol *roland_load_ctl;=0A=
 };=0A=
@@ -1172,7 +1173,7 @@ static int substream_open(struct snd_rawmidi_substrea=
m *substream, int dir,=0A=
 			snd_usbmidi_input_start(&umidi->list);=0A=
 	} else {=0A=
 		umidi->opened[dir]--;=0A=
-		if (!umidi->opened[1])=0A=
+		if (!umidi->opened[1] && !umidi->keep_input_running)=0A=
 			snd_usbmidi_input_stop(&umidi->list);=0A=
 		if (!umidi->opened[0] && !umidi->opened[1]) {=0A=
 			if (umidi->roland_load_ctl) {=0A=
@@ -2262,6 +2263,10 @@ static int snd_usbmidi_detect_roland(struct snd_usb_=
midi *umidi,=0A=
 	struct usb_host_interface *hostif;=0A=
 	u8 *cs_desc;=0A=
 =0A=
+	/* TD-11 becomes unusable if input isn't serviced continuously */=0A=
+	if (umidi->usb_id =3D=3D USB_ID(0x0582, 0x0151))=0A=
+		umidi->keep_input_running =3D 1;=0A=
+=0A=
 	intf =3D umidi->iface;=0A=
 	if (!intf)=0A=
 		return -ENOENT;=0A=
@@ -2469,7 +2474,7 @@ void snd_usbmidi_input_start(struct list_head *p)=0A=
 	int i;=0A=
 =0A=
 	umidi =3D list_entry(p, struct snd_usb_midi, list);=0A=
-	if (umidi->input_running || !umidi->opened[1])=0A=
+	if (umidi->input_running || (!umidi->opened[1] && !umidi->keep_input_runn=
ing))=0A=
 		return;=0A=
 	for (i =3D 0; i < MIDI_MAX_ENDPOINTS; ++i)=0A=
 		snd_usbmidi_input_start_ep(umidi, umidi->endpoints[i].in);=0A=
@@ -2644,6 +2649,10 @@ int __snd_usbmidi_create(struct snd_card *card,=0A=
 	if (err < 0)=0A=
 		goto exit;=0A=
 =0A=
+	/* start input for devices that need continuous servicing */=0A=
+	if (umidi->keep_input_running)=0A=
+		snd_usbmidi_input_start(&umidi->list);=0A=
+=0A=
 	usb_autopm_get_interface_no_resume(umidi->iface);=0A=
 =0A=
 	list_add_tail(&umidi->list, midi_list);=0A=
-- =0A=
2.55.0=0A=
=0A=
