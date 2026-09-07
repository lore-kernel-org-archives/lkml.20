Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011008.outbound.protection.outlook.com [52.103.66.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D0442118;
	Mon,  7 Sep 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771528; cv=fail; b=YG7YMzzYP/JNfTjDamYTXTuUwvSIXa31VuPxjE/nE2b+z1MhD9AQ2rG9o2BnZ0ecCnOy5QpXuC0KYSqgnnm5Ws8winGGM8uEPKa/0uosGS6vQnbjhkx0H2xSCyWqPxnMnr2XXZ5mVSeXvEWQ9kKvd+67l2a0xJbFhFW1oBhLIn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771528; c=relaxed/simple;
	bh=LoSJ9Gb1V5K65+YMz89D8gu/zwF3Tw1OPQZ3jyOaN8Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uwq/FLd5YYqeb1XUbYYd/tRKOo6wuzN/Sqteb53etYs6TSYDJ/WsgjL1alhWzqBYc/Z7kyDn2w3e4pb3f1Qeia6bLFeaCJDM5+iE6ZYkFl913hknSrJiaSMJubJc8eKgOJpgol2199IuElM7GD0YzIUB4ca7U9yQgXxwr8umlPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WR+PTWuu; arc=fail smtp.client-ip=52.103.66.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WR+PTWuu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piEdwR4xWORRhocHJOr9CR5BrqA3XT7ZIrNTb5GqDSFPIuWdGRguieXrzBXV2s2UgoYamKql1phyjwxt7NMvZOreLweJS4qUQsCry/ccNwqAXYagsCAH5MRLcrv8639eKfd3IDHCh0JZAbKzbWKciuDasTRFvU1xYDWRu9ZHGb+a5AzuCtBMKEKmsP/2pJDGDMTG0GHwhybOBth9WrT1wiQMbZqIQGpoYESpmy86h2i+MrlLxTTDIs/Va1vJAkEdv0aepXO6su8mfjlmIlmKsMH+/jHt3ieXvRQhkPQ0gg4bPZaTmuZaMQeWcWoqVIkaZJc39nT423aE9T9mIhozUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pEYAoiEHpqTuSMX5W8hIfki7JJo3b851AIP0FZ6anM=;
 b=ZiUfU42gUpPfMCpq0qnksexGVx/68PZ6uriKz2jGGaPMWqLeryknm0RzHXf10fRr9lfI9E766DSVdQ3x1uSjnL+3KiDwCYpAmZEPEb30dgi6Ywev9FNJM2OseHtHbaMglPkJdt+oaxEd4dX2urQKb/+wFm0gPq7zXgDpWM8gHTLKm7+P9X3gxiWA1cygJEuayY/TivDZ+pI5L7CWIyJfmmkj8dzs2EiG0g2lea/7El/sLc7DOrh+XhQTS8TmyWsLVx2BkZyRt6rdu926xt+hCZP3ow4yiaMykqe9J3+DoFfYnskeVH3V/yHszgETgfmFj/D6jWqP8HailR/fuzuazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pEYAoiEHpqTuSMX5W8hIfki7JJo3b851AIP0FZ6anM=;
 b=WR+PTWuuua7ELHzp8mddmPQ8sRNSgoTUAraXqxUFjZbTNLTQAWog2wBrzknALaPhs0W5rA2Ct86nNM2JAYahAiSIArPT2V+b2Vst3pZNtbqSV5mpEecXAohXW6OXxzyuD2Js9GWIHFKEL1sKVaih+YorlCRDqUvnuHgn2idYud5wx2sLBrRimZDXnNNyKg/1DKF9ahuh44HjxwgrbHxFLqQ8JVLlp+15xQ0479R4dnpbUWLqKZtVQ/OgyDM4DsfsYBDfDPXaFoOi7FDLER6ReMNOBkpLm+Qia4Q2EG+sScLxU/ZrQ82tIx7bayZ8kGbOTpIxcw7OZC4squ/0KuDcaw==
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com (2603:1096:604:1d9::14)
 by OSAPR01MB7277.jpnprd01.prod.outlook.com (2603:1096:604:11c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 08:58:41 +0000
Received: from OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542]) by OSZPR01MB9313.jpnprd01.prod.outlook.com
 ([fe80::90bf:9b82:54c3:1542%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:58:41 +0000
From: Keisuke Tsukuda <catnyaaan@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com"
	<syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com"
	<syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>, Keisuke Tsukuda
	<catnyaaan@outlook.com>
Subject: [PATCH 1/2] usb: gadget: composite: avoid warning on aborted delayed
 status
Thread-Topic: [PATCH 1/2] usb: gadget: composite: avoid warning on aborted
 delayed status
Thread-Index: AQHdPqcUos1wsYxns0WlUwiu1rxwtA==
Date: Mon, 7 Sep 2026 08:58:41 +0000
Message-ID: <20260907085806.52647-2-tkdkei@outlook.jp>
References: <20260907085806.52647-1-tkdkei@outlook.jp>
In-Reply-To: <20260907085806.52647-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9313:EE_|OSAPR01MB7277:EE_
x-ms-office365-filtering-correlation-id: d0133743-6e1c-411f-7a60-08df0cbe36dc
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|8060799015|31061999003|15080799012|12121999013|38102599003|24021099003|25031999004|8022599003|19110799012|25010399006|1602099012|10035399007|2607281247196008|3071699003|102099032|3412199025|4302099013|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?002ru4OU1v0v3Fie5sbiAAGbOtoQ4+DLa7R9KpUy5vPpOepdLgEN/bRI2E?=
 =?iso-8859-1?Q?85Tma72ZabXfMelGjJhSn+86fMsfcXsIGVtLrNAe6h99F+xit6XJ6OfHJ/?=
 =?iso-8859-1?Q?zAoO5E73SHdpUhCoFpda+QmG4toq0lZ8xc8UmThQQ6KbnoZXGV/UeYQMCT?=
 =?iso-8859-1?Q?4uuqg9LC9GFrG3j61uUgoTqR1ugsFIM7heikyO9umed8Gg0PaFHPGNYKuM?=
 =?iso-8859-1?Q?3R8eLpd///5aR7wNv3EFrbwC1udYai/iUf2RPw4liwrSS+/U572naarKn/?=
 =?iso-8859-1?Q?qGOELujZv6EeSZ3H4MA4rs/ODGBftzf0gC5hFckna+jQzHWQI1N8LqZX2w?=
 =?iso-8859-1?Q?vP0sumIABKuWI3UF2PpRS0II1GVtPPzhb5lVPJLveK5RptndbvJZn+C4uj?=
 =?iso-8859-1?Q?BVQC5FUatFWEp/4rRD2oA9UDWoaWG++E6ajLczT3o63B92t1pkvR/bh/B/?=
 =?iso-8859-1?Q?LOjSyiv2nMuGaJSxGTYDLhxkZUaKwLd1QFPsb6HMiWjBwAgB1zHU531L5U?=
 =?iso-8859-1?Q?7ldQNd7891qVpgFHXqLmvNb33LfaRy/kSKYFAwDAr8daiqgZDI7E55dtIX?=
 =?iso-8859-1?Q?d0fVhghGxK7LDEK22xM9rblRrfOJYr3+s3Ne7E9I30XivVf3/GjL2hsYgw?=
 =?iso-8859-1?Q?qg/4zHETApIVK2Of71IBVqogrRsYKREPlUJsnyeHmYLnDiDmPa0WODRGgQ?=
 =?iso-8859-1?Q?DVbEDZfVYcGaE5TLWq5w6b3ZdAe4uV+oekXoVpCovQfhOsASDrPvi7l7SI?=
 =?iso-8859-1?Q?KJfDWLpA8kZy1lo/4oB7o4OkSDzbcWQn27FOXvUxNQ6XR+74x9eBqbS3cw?=
 =?iso-8859-1?Q?Mo5E9Q5Okwuqtw9ZVJkCuWLAtAjPP0oNcREHae78YSkW0NqtSj5pWDa62e?=
 =?iso-8859-1?Q?Jda+SXitLi4pm/0rfUyybbaD+3A4nZpWFHey1FEY6NX8QMdD75AOg+4673?=
 =?iso-8859-1?Q?+zO+pvX9+47b+1UDyk5v38nDcwrlU2cD8VL+QK9cclKNjCEekCsvqwNpP7?=
 =?iso-8859-1?Q?OmHo4jtp+Y8XR7Ndh0bnWDJfZIQgAH8fmrTUjEMo67Ov2qII/SPVT+YAaZ?=
 =?iso-8859-1?Q?RzQsduYZe0+f2NCy2wGg6XCOj2kBVfO11BbOvH9LE4SXrWg/lsypSSct2F?=
 =?iso-8859-1?Q?e8x38Fgs5Qv9XF7JMNPT5YxiFn4Z0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MO0zduMIuUCIZqTSggQXx7tuEuSmWE73snrAU/TjATUrUfF55RY/4Cldpu?=
 =?iso-8859-1?Q?a+PIhBbGYBYhXv4qkqj4EHVVNYYRXB5tY2hr5uW0j5/i5+PG3RestU/yUy?=
 =?iso-8859-1?Q?ayAA8CnoeFHZ9O0EGwWLa8mS0pu+F2XFmN+SC5XG/+u5OVLXfWSur4qNX6?=
 =?iso-8859-1?Q?iSqFcKykR3vacQRctwYHWe1kJ/9v/RPWXV8HeGoclOAEwKZuKN12QwK3FW?=
 =?iso-8859-1?Q?I7IUPo6oeQ1QiUurGjOjMJX5BXTaXYYDNYrS59S0flD9GzACq12Wtr3xpA?=
 =?iso-8859-1?Q?sduwu9gKeSKR7MLlyAEaBGtb5jcuogg0h2HetJT2p95pN1XM2m1eI6igfg?=
 =?iso-8859-1?Q?W7TBuGczhT4bPAUEtX2gG4JFEMFw6lQ7CcsL/DW9+oi3+qHtUyIG3Xax7p?=
 =?iso-8859-1?Q?orUbHJ8ANM3wyRperGUliBskVj0X0Kfc9Qzg4KUXvrr5835hhYOf45qvBs?=
 =?iso-8859-1?Q?3kKDfuvb82wKKHvHkb7pkYsLjjSWM9ND/Jcq6d1Nuuu+G1KXeBtqDS9I9Z?=
 =?iso-8859-1?Q?HXMqfFnJ+kIJPygtfj6mp+JUdcsE52dlwQ86HW/N65NENds+NtiMEXFwg5?=
 =?iso-8859-1?Q?gKvjWPW6aDfTF2a0TOmm3FT2tU7j4532573HbOOfe1l3yWXe9/XHhM3Yr3?=
 =?iso-8859-1?Q?/VnjlfzeWrewlUgGd+jWXCRmXQoYButnKRAwG6NE34GoJ/xplXOJznbn3x?=
 =?iso-8859-1?Q?Lnq26e4H+NHDbWn0gisCV/BVC2/Us+uV5nN/mlDyAVAp0z4F21S+vWcdMV?=
 =?iso-8859-1?Q?KDTpAF1tpb7OvkxQXbhIvMELA7GAN7L3TC0O5QW1pIW8CNQWEYgvrqLLqd?=
 =?iso-8859-1?Q?Cjs/qsDTagLTl2s/iVEmH3+KgySEPXf9gVtLApH4gKJbCJEshVjJ6JLjER?=
 =?iso-8859-1?Q?TeQtPkl8S3D46Nc6VXeZeDt9MNNCiMDT/qr9F6wF5dFWyfIhNuEJHZb8DC?=
 =?iso-8859-1?Q?pHarKsFAUy6e+ZCcLk7Yvaq30yc9Qwksn0yCD9b+RB4AWRR87G3apMwxtV?=
 =?iso-8859-1?Q?rqregkSynUaQO0ZeDULV+hXy5zsjPBKIraLkIINS2dvj0PWaHo3vHDFG1f?=
 =?iso-8859-1?Q?fG1vbY+Blaybj4EAGLxog5/keAH/rckGobUrJoyx/jTaA10V7V90+myjbV?=
 =?iso-8859-1?Q?j6uF/ZSQ517p9LMyNz3fUMY4OTEmbbCSM4AobIQAP+WlN0z2s/OhGB2oeJ?=
 =?iso-8859-1?Q?WqvANlYBcD2hkQBYsrio6uL266lz8isl+3cuHIOS24Xm8drA6f3hbyyAyL?=
 =?iso-8859-1?Q?8eEThw7PYEvL0fVmsS/7lt/K40kgLB97+Iln3kITVoJFuFOB90RwY9kY28?=
 =?iso-8859-1?Q?nsNXiR0eDwyG7CW3028GZO9jc5V9nxSYqsbNLz6rYjXgTwygIt/PMPEWWa?=
 =?iso-8859-1?Q?i5Vxv1XaD53jmbeTgTB5x+f6V/b9rRQ6NXHuO064mQZXKRkgi+bpo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0133743-6e1c-411f-7a60-08df0cbe36dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 08:58:41.3544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7277

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
