Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010020.outbound.protection.outlook.com [52.103.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD623B3893;
	Tue,  8 Sep 2026 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899640; cv=fail; b=Kgh1xfjrKfQDglKAOu5LjofnOzILIB2HqT2C7/lbx42o67AOHIB2Qs5yD8S4ocTl4wYhWjECVva+BrPr3aQIPhArCowPCPgUmH1phhNSl+nxZWuB8mE/WSNYKKrz9CT4DgTFr19ZLzSqy7iX8VjHTCEcJivFBnait0gAYCOBrT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899640; c=relaxed/simple;
	bh=LoSJ9Gb1V5K65+YMz89D8gu/zwF3Tw1OPQZ3jyOaN8Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sMF+VoPgEDbFfBgMkKV67xbWLzccN3FwKVoxlCiwuORdfMefEiXLa4+ScgT/kM93IpKgThQskc00v5vAjuSgje/aQP4l/b91UTW49b0p7R45LvbD0FM9CHLGVUBPmvh7/lz0IlN95FlegqESCLJdQqm9LeMnQsRdDHzxaq41JcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CCHyXNSo; arc=fail smtp.client-ip=52.103.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CCHyXNSo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qY3isdA5VgPVgq70WLY0bpk3h0U2B8YMjAWfb4EW6AIeoQ84Hzw7rgTKQ5g4sK2caegxsrkKUyLE0XLKzQT1HiYOGKkHSsTFyZxdFGh+dXMVzIXqATSB7LG8H53obJR65iX7Zh64HoSwuicqHAjmmbwKXFYH/0/JGhd8KQmfCTCJ3SRxUrqp4fU8G/oTX7wgyoaA2RJ4Hi5pW6CCqRiLV5KwmB5BcgxEa1fKi2u3FvMWgZ10/Ee/6rTxoWw6G3T0hynSNRMVY1l7QO3oe19c0bV7THw2ExYYrSmA8wGvbP6taMFTQVPf4vEcVJYMzpkr0dMgcEsoEBMHi9ducHJoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pEYAoiEHpqTuSMX5W8hIfki7JJo3b851AIP0FZ6anM=;
 b=UCKRChWTD2hyZCVi0Zos95qmqUTRnVq3l56bFZTU8pdiUIKKxsnunsuOoG+5hnVvJ7tymKjoJh4y/tk0xie5JTX+fFg3F21iHiMLUSgkN1AV8UzDcLZwDBNJiv/kNu45fHdtlQHbnKnpiYMjvSDEYSZ53fXOQT34wnP34i/mu0E2+baLxNQyFbii9R0UW57iEaj28xW+8Fp3qIc70qX21Yc62vQa4/WceK6OcuRpdecHOIG70VxSgdUra5lSMKoorEvdY8e92vSt0F608JrIIizwyrK/2ecCS2XtdS2CumqUoG+3V1Z68dQXkHhSj2lc49vcZRlERaLdo/10EgUlqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pEYAoiEHpqTuSMX5W8hIfki7JJo3b851AIP0FZ6anM=;
 b=CCHyXNSoDjKzc2a3Wnb4hnmWhIFzuRlYhLlGKM5trMmOUA7zLFS030PrydZ0MA+Z5WmsaA/PoSsp4MNA+shmezMlfi/7UKqDvY8oyIUx2oHQVYXQIYk+xAZL6VejM/NVqqs/oqBUJK13gu8FSPKhVbFrwejbl442l5jVkMXeDr8LgJlMBdwJmZxNvpC6wcneeVaPrA4+Ot7onz6gEgHtOGa+bPLeJk15ZxP//r2lZXeD+myhZ2mZCdAAh6vU7c9H0cPITdanE4XBrITb8fz1916Hofgd5w//0JHhyylzDZXgmXynK5dS8XZZjHlq0kZq9XsKk65aEn5CPq4+UjlZAw==
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com (2603:1096:604:1d9::14)
 by OSCPR01MB14838.jpnprd01.prod.outlook.com (2603:1096:604:3aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 20:33:53 +0000
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542]) by OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 20:33:53 +0000
From: Keisuke Tsukuda <catnyaaan@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Alan Stern <stern@rowland.harvard.edu>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com"
	<syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com"
	<syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>, Keisuke Tsukuda
	<catnyaaan@outlook.com>
Subject: [PATCH v2 1/2] usb: gadget: composite: avoid warning on aborted
 delayed status
Thread-Topic: [PATCH v2 1/2] usb: gadget: composite: avoid warning on aborted
 delayed status
Thread-Index: AQHdP9FdKMRqOZWjYUatIlohkW4vJA==
Date: Tue, 8 Sep 2026 20:33:53 +0000
Message-ID: <20260908203348.95825-2-tkdkei@outlook.jp>
References: <20260908203348.95825-1-tkdkei@outlook.jp>
In-Reply-To: <20260908203348.95825-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9313:EE_|OSCPR01MB14838:EE_
x-ms-office365-filtering-correlation-id: ac1c533f-badc-4b7a-cf35-08df0de87f9e
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|25031999004|8060799015|8062599012|15080799012|31061999003|38102599003|24021099003|12121999013|8022599003|25010399006|1602099012|10035399007|3071699003|2607281247196008|102099032|4302099013|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dhS/MqtwdpGl3s64kuyYT1xFCrpuEmtuPENG75wl/1ZXYuL+uNtWG+zQbo?=
 =?iso-8859-1?Q?Wp078+0l/X+4QMhM8hivMl8JUTCLnHZeFmUMxkX1tvUVYyQ2d1rAEQsYDi?=
 =?iso-8859-1?Q?cWTm51qwOcFvN31iiBRz6B9cJGoOgN9MLZ3iaj3NoJznOg26o0bilkip1I?=
 =?iso-8859-1?Q?GNTm/MGXGcTyZbcP/0eDcurlg1Rzl9NpJlXLCXLPwj4AjG8LhCXdvwLp/A?=
 =?iso-8859-1?Q?2Z9lA/vgwb8TALIiElTb3Uv1bUiBOYzbnwMLm4zp70yl3C5Kbs+kKNRi5P?=
 =?iso-8859-1?Q?Pn3TePY6mj5gbqXsYD+MhL0V3bxS6RYJjtnYsRPWpXhKJNAdX65YQylGSs?=
 =?iso-8859-1?Q?LjGuvghh2BLfg7pW5ZM1NwkrQso8uiBJQRJXzXJIvp+VamKxkL3RMC3K8e?=
 =?iso-8859-1?Q?r9rySszeFqWoeHC85PHAEe9z2IrCuuF/nBjWMedOmiDvxJGQY+nkkhCU8G?=
 =?iso-8859-1?Q?1OhlmuMjiMfq5wlLZYAO9xaXSARt80bD7lrcV/DA4c6KiWDFoVkL6hm4bx?=
 =?iso-8859-1?Q?uwkUWFOZ5EgD9GqofnISQwYLmqbV1AHEOEnSaYScOp3plmxbKJU4F/j2uO?=
 =?iso-8859-1?Q?oD5vlDxO6sFQFGrdt8SIxhsMNkXpJKMID3aPqXrhIJbVr6Sjy/l5cwpSXR?=
 =?iso-8859-1?Q?enp+t4Yvj9VxCEbljPvsf4LUrcVjyV6RL2rIUl2FXUCqyKPiNFB8ZeQMsc?=
 =?iso-8859-1?Q?MRQIXYkIJDY4hm/9/hf62313myotxTWqmlNk+MHQ/+IjZ7ehPX7SWhQrqu?=
 =?iso-8859-1?Q?607Hq+7ThNRkqmzXfVONXjWBQat3sfYyijXVhB7kYNMyz0uZAFN/jMdYcq?=
 =?iso-8859-1?Q?Z0wTJXmzIuTzanHg5cLZTaGZJYRpZBlpTSxXM/XHyoLEZrbOZgIxjLcXu7?=
 =?iso-8859-1?Q?eFCbyYfkqgk9MR6RHt7H5h8Ew0HSjvFgoMz/VaxN23gqDOUOvqRfsonBrV?=
 =?iso-8859-1?Q?Ps9POvvVi1qJAcz7raf/xkPznMhca1+j89CIOROv4Nb3RLUe6+41jygrvi?=
 =?iso-8859-1?Q?wnveJ7YC0FfaR1Wd1TPGUzhZvhG+23KaIku1QnTZ07r5MTiATlsUZwr5fr?=
 =?iso-8859-1?Q?q7v8QKDwfBJD6aXR+uonL0BVqYGysah10OsAP2/v2Mgl49RJ2P5IXWMpVQ?=
 =?iso-8859-1?Q?mXW9h1Ll+cun3Fu8TJGEUEkxSSajE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?drrGcqkexgHxvj9sw8UEygqff2svAcW5XiqGtQQ7n1TYk4o5FQKdTlbfUV?=
 =?iso-8859-1?Q?HeKN3AAGok1YabWTpo71Rv7WRbSbBG6D0DBm4mVr4GNs0Pbn2924be751e?=
 =?iso-8859-1?Q?/55Lv1bWb2eglj9TNw7t23bYxr85g6NpMtKhzC/uUfhC6o52KRjfCOmU1L?=
 =?iso-8859-1?Q?zV1PV54mok33e9OuJmTa4DvVzEloR7Ho87V4alcKql0AtDsVOJFAIK1Ksg?=
 =?iso-8859-1?Q?8qtc/EeBCmTTn7DuMkjtuEdJjZlZgKQwgGPxs+PKf/vefW5gMSmXo44wrd?=
 =?iso-8859-1?Q?0/OHXHRvKfzwPa/7/o7/XWQWCnQi/lEyLJ4cv95JYqMgry75YDAVdYRbqY?=
 =?iso-8859-1?Q?CLTMwx+W8/YJYsmQDj286xUN2n6vApgmuLlFo565BnC1OX3iB+CMpSb2bi?=
 =?iso-8859-1?Q?Sin8yrAI5jmUOMhpFTqgws+Ie14bxNa02HyzmxveJhbK+McS9gHSeSbyOj?=
 =?iso-8859-1?Q?endqQpzhQJXwGICCE01ASsV43MFfJXenXvacHXoV0jHYId7sSUUzky3RHu?=
 =?iso-8859-1?Q?w9i4hCjGEWZhoyK3TAYRRR+EBglH7UX8JNfRAjJ2M/EHuPnftpYn7VaLCY?=
 =?iso-8859-1?Q?6AUbYrz+KlJAm+4/bY3bEIDr4jAQoR7OaE9PGquu7XuBhMceW/VmysTBaP?=
 =?iso-8859-1?Q?beP6CpwFxRWWWch4P9p/y4UqybM3GoeS0v9yHTkIXQpvXCk6NxccaUNZGF?=
 =?iso-8859-1?Q?A7bZ9Y0lrC/G90mVyzojJWV7S2DSudvlBH44g3uEkiMQg4rg3b7OW7nCs+?=
 =?iso-8859-1?Q?2oQfM8zahmc2OQOl6lfogfH1mIDz7Fr0uya/9AglQk8wGHDD6PR4iDSPAq?=
 =?iso-8859-1?Q?BQfHEnTSPS0gecQps7+6d1Sg49X0AcPlysVa8m+kbi4YX5W/spCVS2Fgpo?=
 =?iso-8859-1?Q?b2vKxP/q82IShT+mDV/6ZJWxghnSFgMhR/4LkzuFgbGjS4f5D+Y/+SBHN4?=
 =?iso-8859-1?Q?TVIVhalZG59R1nkUDL9M164OKJNCZXPxRJ9lH8JU4MuQyCxBnB70AqgDjr?=
 =?iso-8859-1?Q?EccdxfyGheO6JTuox1KKlTNdwQIYNoErB0AFlkYqc9uvIlRv9tdD/MPJ/d?=
 =?iso-8859-1?Q?9dpFvBDMYU+wSUNMTli/LoXU3M3wJ7rIKQE/aoGHZwvG8W1LSjKEJmNHyP?=
 =?iso-8859-1?Q?elSvGdM25sA7QrzMlROAXxQ+T0rrvKFqZEzRtJrHyPSms7ruQrw+mJiCfw?=
 =?iso-8859-1?Q?crPqjh9tqB3ktpuSSwZ6kqxsP24sdUV5UGzs7IssBpBaBnKmErlJKd+Vxe?=
 =?iso-8859-1?Q?pTptv77hBU78BtTmwQD0DFM/NqTnxWbudz7f39DybEOZK4sh1LQ2zIEYiR?=
 =?iso-8859-1?Q?1L7f/AxjyEaNvK1f1OCzP0e6M7iQl1Fsfsx4C8QC5Mp5weOG31jaQrvRTg?=
 =?iso-8859-1?Q?lzTpRbuYDz6VOCbdBRJAElVo4BU9ZxH8ctDfTVFeGOrHbSa3Zl/ac=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1c533f-badc-4b7a-cf35-08df0de87f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 20:33:53.4021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14838

A SET_CONFIGURATION request that disables the current configuration, or a=
=0A=
disconnect, can abort a control transfer whose status stage was delayed by=
=0A=
a function driver. The asynchronous function work can nevertheless finish=
=0A=
later and call usb_composite_setup_continue() after reset_config() has=0A=
cleared delayed_status.=0A=
=0A=
This is an expected consequence of aborting the old control transfer, and=
=0A=
does not require a kernel warning. Keep the diagnostic available under=0A=
dynamic debug and ignore the obsolete completion as before.=0A=
=0A=
Fixes: 2bac51a1827a ("usb: gadget: composite: reset delayed_status on reset=
_config")=0A=
Reported-by: syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com=0A=
Closes: https://syzkaller.appspot.com/bug?extid=3Da83a5a1ba9ff57935171=0A=
Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>=0A=
---=0A=
 drivers/usb/gadget/composite.c | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.=
c=0A=
index df39e34..1b22381 100644=0A=
--- a/drivers/usb/gadget/composite.c=0A=
+++ b/drivers/usb/gadget/composite.c=0A=
@@ -2740,7 +2740,7 @@ void usb_composite_setup_continue(struct usb_composit=
e_dev *cdev)=0A=
 	spin_lock_irqsave(&cdev->lock, flags);=0A=
 =0A=
 	if (cdev->delayed_status =3D=3D 0) {=0A=
-		WARN(cdev, "%s: Unexpected call\n", __func__);=0A=
+		DBG(cdev, "%s: Ignoring obsolete call\n", __func__);=0A=
 =0A=
 	} else if (--cdev->delayed_status =3D=3D 0) {=0A=
 		DBG(cdev, "%s: Completing delayed status\n", __func__);=0A=
-- =0A=
2.50.1 (Apple Git-155)=0A=
=0A=
