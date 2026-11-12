Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794451292;
	b=bNQGLgatb1Ljut0FuePJrMcihs6vOSiiEfuRTw9n2UW+BuYswf/fWW0v+29YFWdD6yB4
	 stypwJ2xPxwjemLPOdkVTN0ZKKC5A1jY5AwsjScVhs/++8C57WscrRz/tfcH6lyAVI5oF
	 We6KYuu2ijOwDL5hLIY4KR1U+6WbH9LzO8y/a4L1BRbdB+TCQ7/lSuwXrN5vchC0hW9kL
	 okzY8hrb1LYGIIaDPILSlHjN+Yi0GScoIlm7I0KWoZd0JvX0NfeaGCwBZM17MxNkPANqd
	 2hxta/xJ6S4mHwYQclYceFwljtV2KCoI1EE0dbyHxAXXqr8BMPUYcsMT9vx4hh9DStQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451292;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PeN0ZKbeuu4kaH7lfK3ligvhaB2XWVA3N5srhCDi5ZI=;
	b=rasREEjrym4rngc6V2sRgD/J+Mgzn9EDNk6z85SussmW28/VLMR5OgWSMhFTTcSQmxxn
	 Kf3FmhgH057wXushdZgRUB2MDvY4AJK41NO9akNlaPcrVo9/qETn0qVi6osLuyksE8xLe
	 DMpN8YaRCfmaw9hYsZz7c+LvwomtF3B0mnVPe5nsIaeKANvq538nZUTYQs7W8Pl41EtJw
	 7eZ9WpgiyZIyhzPs6qinKsOxHfTcy+J9RaJVKSF8WPHTdXKiAri7suZQAakQQQ6kGnGND
	 PYk00ou/9nXT06AbZLvJ6gBmM29JRlXMQYsu/pVvWyFBsrMxnkWSvuF5qxc0jHg54vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.jp;
	spf=pass smtp.mailfrom=outlook.jp;
	dkim=pass header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b="YzWQb/n5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.30
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011030.outbound.protection.outlook.com [52.103.43.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA0F606A321;
	Thu, 12 Nov 2026 02:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA0F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.JP header.i=@OUTLOOK.JP header.a=rsa-sha256 header.s=selector1 header.b=YzWQb/n5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImDXVcB0ugebTbHBG/EeK5WbAeiOJ1aJxFIyIjY3neqOY6Of7NBfphITpeWVuQV+6mdTF9bGVecvgp46GmYmJvJ0bmLBAAikpiOLgipa8Wvfzq4C2ts4PSjaA1gINbRl0ZJvyutAXRrFgxYHvtaFT3ENkXwQl9OWjS+RU5GazSY+Tq4mti2xeCPRbCRLk+y3pyb2s91jyPkjH5gL1TlJGJrkYo8CvCe0e5IlKaHXtbkX/gy2LywLnn8eNxNjFVh3N7Trc9J4crhgxg8+gsQZobNjdJfJbgGsPeoDBX136R0YfnBMfAxlpeju21tmCg9h/TowcXqxFTOKQNFtXFgdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeN0ZKbeuu4kaH7lfK3ligvhaB2XWVA3N5srhCDi5ZI=;
 b=ZUazewHPp+rLwpbn4bi7V94kHwPuX0Fjozi7naaDFvrZ8xfGEE7GUQaM6DVihpnjHoYpVnloI9UOEPMURB9krSOhxN+hZ6eh521WGl2z5S5msZBEs5m92UuTLrq88Fb6YiHhPyvBhoIlW2MTuluRorP7vDnLXJPR7D4o87z5td5gVigbeBqZ5kJNsbxnBtGH+j/1m8TLrg07k44mu27dttOLPNcmh+nVKaS1awEIa8I3yOwflNyRHOTjSeYFp+7HYyLAHu6AZ0dtd6TCNo4ymPSN4zbvk3vCSRSaoKCMQfiNEIxanY+KekCXd0rFoeV+Tzv9C8rsFHJwdppw8z7YTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.JP;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeN0ZKbeuu4kaH7lfK3ligvhaB2XWVA3N5srhCDi5ZI=;
 b=YzWQb/n5M+dTbkHkh0OEIO2ZmC9UrfqQLB6eomQyQlKomb8dOsI3h9VNPCDwYrm9CpyAghtAiq+NuAIEOwt+Gh0YdtYPwPbEwabG0zWqAwy0uSgF2zscd5w8DwcHEc9wvs++E6Co/AxQKRs2ku4c2thWFaxaOkPoSM8VAWbHxXoS9C2Sdqf1OaG44+Ep5jGBtq2WDF0Au9tFvU2wlR6cJVMBDdJVpi+iWZeoPu7B+hy4X4j3inKw7jYYh99uVQU/suH3vGcW/zgTE0tSOtvSnF4aE3H4ySFREmEGHyL2jY07UJ6N+NgO4/RptBIl0LONSr6IwCBsf8ewTSAOOT5gEA==
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 (2603:1096:604:388::11) by OS9PR01MB17912.jpnprd01.prod.outlook.com
 (2603:1096:604:447::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 02:41:25 +0000
Received: from OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b]) by OS7PR01MB14363.jpnprd01.prod.outlook.com
 ([fe80::eeff:dfdb:bd3b:591b%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 02:41:25 +0000
From: Keisuke Tsukuda <tkdkei@outlook.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sven Peter
	<sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] usb: roles: wait for role callbacks on unregister
Thread-Topic: [PATCH] usb: roles: wait for role callbacks on unregister
Thread-Index: AQHdck9PU/KUKHcnBUmIhlWYOi7Giw==
Date: Thu, 12 Nov 2026 02:41:24 +0000
Message-ID: <20261112024101.83321-1-tkdkei@outlook.jp>
Accept-Language: en-US, ja-JP
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB14363:EE_|OS9PR01MB17912:EE_
x-ms-office365-filtering-correlation-id: ac355f8e-7a53-4716-4029-08df406671d2
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|15080799012|25031999004|22121099003|24021099003|39105399006|41001999006|19110799012|8062599012|8060799015|38102599003|4140399003|25010399006|12121999013|26104999009|440099028|3412199025|102099032|40105399003|53005399003|12091999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?beI0xg4H32hdWjsXnU1zMTM/8dLsTxtNPQUHtEzgmmhEAlWEKxR9wLAF4V?=
 =?iso-8859-1?Q?hSpcot/o2lX3Bu4oA+k7cGZmiPA99HioyWLQ9WCbj6EUOFiz8lqnSyzvzV?=
 =?iso-8859-1?Q?+qYDdYks1sK5fAJxuvawD5KKszxyf1TMiNCq2OVuNZBhywDv+0a7JuqFKE?=
 =?iso-8859-1?Q?fVJ3d3m1GEAkiqdlsGhFrznAFp6GAxSAygH6BsJL9DIK186XBsiH8+KAtB?=
 =?iso-8859-1?Q?lUFTaHrFTO9E493WnTVF1Nil3NavbIVfHKb7ALkKMRywCn3cibtKdupdM4?=
 =?iso-8859-1?Q?TffHXrV7zg0OMo0TMyCOi0VjU+crC+6TvE8KmlQetLvAW5sRJjFojQIzsy?=
 =?iso-8859-1?Q?g0eX94l7EAXNzrXFys1zQTyUb6duo0fJaNqdx7OBLD9jRjA2sXusC6xcyk?=
 =?iso-8859-1?Q?IMZ5ExBKSGjWIa01iVnek4uPVI0t96U+a0XTIBk+8rMlYtbNdAbDBCqyXM?=
 =?iso-8859-1?Q?c7G/WVhvftuPpW9JzvCvzpy5T0yHEb08adYJzHFU6CUBR35MZt9pFEXOii?=
 =?iso-8859-1?Q?BCDXc1QCW50WPUfCUW8PBKW9zcACtDmX0RLpgFsDyhEnA2FXiQtI7inKQM?=
 =?iso-8859-1?Q?RCruGSoQdOt27J4V0H7oWG+QaANttSSjbkHXOFmBFQsDGaafEo2IooEPuS?=
 =?iso-8859-1?Q?Geaw4C7fK1ID5qOFCIOaQCQ+AuIqi0unZhrGjO6lBceyPMNQLiMkEpZnUj?=
 =?iso-8859-1?Q?z7XU1uvEyVHh9Z++MelpAffQtRzH63OA4XsUN0OByVfPUHV82ljjeg/0Ln?=
 =?iso-8859-1?Q?lFa85NA8MtdvVTm+2dfJv7nFMlbGHCWt2QMASzTgXSJNb97zwQZm5voUP7?=
 =?iso-8859-1?Q?Nq94c7edal9ez7dlFWr+SdjELmDTJ32FKsZbu5aQ73r37pVGOXAHUjgc2G?=
 =?iso-8859-1?Q?yr5zEVM6tXFRi7LMfY4bFXRu/a/A4ewX6mYaxJsh8Q+fYejqIF10OBpEqp?=
 =?iso-8859-1?Q?iJUoj3wS8An1Sq4lPM3tBwHN6/1A6/DX2dKTGCjuYVWz0Iok/z/eMwc1Xt?=
 =?iso-8859-1?Q?HJGeTOLmA57bK5j4wXQsJvFnolguJtpa+uNZv3LDdoUWJJoDMrJyFNVd4V?=
 =?iso-8859-1?Q?4CTqoDl9Rd1Qh7DNd0uZXaj6rAX5BU0tsyWednTcsW+lVZ+ljkxrGHLqx7?=
 =?iso-8859-1?Q?4rlcsKjzH/vSaEM0fU3ji60af5HgEPwpCxq7d+5w6fnsaNNRUjgwm7pf9z?=
 =?iso-8859-1?Q?uZhqQQ89c4aa5nInVWppAW4J6vrHNbcm7Hc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UUANG0gReFAEGXfvFd2KHGEUy6Jy64U+L/C1W5z9EjDJ6vZJeNbqS1FV5G?=
 =?iso-8859-1?Q?+2bvq0yYQg/uTaE/bC4+DwOUWm24IqgJMMuGJMEkxCHhHI3kF+aSivUlge?=
 =?iso-8859-1?Q?xtiKYunuKgw6v8QcAQokfd6VzW7onpHD0cOriv5iPVLZcuaYc3v8SnvtZ3?=
 =?iso-8859-1?Q?o+nPdg6BCLx+XlklDP4tP1rzbMitxIBLqeBaVNRKApbb5j5cCaY8pubgBq?=
 =?iso-8859-1?Q?hub5QC0ET42ek5nuRwXukNRY6akPPm3cm0JaU+hURC1uSOmQ4d6pUJaBzK?=
 =?iso-8859-1?Q?5pcJv+lKBqvJ6hpmuvHew4VKnnKIw1VVOArQvfK2/hIFd/XiJd6VVppZk3?=
 =?iso-8859-1?Q?w/jZ4s/hxFxXk6asMxj+vdX/ebXBw/PQeUsioHkmNHbyKjpLvf9CaezTAf?=
 =?iso-8859-1?Q?xUlN8T1+2xmRerG5iJNLzz9d/Ea6hsNYMjAqoI12hcKdsabvorAkxs0LQw?=
 =?iso-8859-1?Q?/GRp9UzVkTf4BoOe3r2u/5Le0c/8JfTlWK4MVPl5QW7XuuQnRNfTguj0RF?=
 =?iso-8859-1?Q?zxil6obO2glJT5hBOERiDjifAsSRj0whM+0KbHwSNyT31Pc76hAENwlgjl?=
 =?iso-8859-1?Q?3HxxgTM45TQnCa7IViyEkNqxLbuQsvZkrJJqos07d5xaS42t+b6QDiwSDe?=
 =?iso-8859-1?Q?pfGuLHW0FaP9osMe5zs/be7f3vLQS1McL0Qele0na/dxUIhE4aKkyJbo12?=
 =?iso-8859-1?Q?Il44xhIYIzix8fCYlPIKKpH8ZrthpLo4j79El9BYnh0xpxcqdNxDlU3NIi?=
 =?iso-8859-1?Q?ghGnD25zBBUAAsnhK97S0rBsASXjXsnYUcFhJD5D7JncwRnVh4F2sjuEAy?=
 =?iso-8859-1?Q?G3XAVPRKgyLAeAXJJPrCndCyGDDOPqbK9SZiqTr5q5qnt1PT4l/wx2gy1E?=
 =?iso-8859-1?Q?WzgCO8yhh6jnrMnu/YSnr6+xMxCcGEw2xUANxMwaiSzdbScCr4ApkTWKxe?=
 =?iso-8859-1?Q?TvsZEHK++mpyc5h7Pxe3Zy90j/NhkPEcRUuSHn0AjiEy+6ZFwBwnaKKgyx?=
 =?iso-8859-1?Q?9AQEpfThY+YdwvLisinwcO74hI0IdmYqLPR7GumpBvGt6tHXwNbLmIOfy9?=
 =?iso-8859-1?Q?HuXerGrzn7IsvmVKOjnQC/5CHQ8njGmpqoE3BsdNawpBOs+uSWAd2NwpbB?=
 =?iso-8859-1?Q?goFB3VA9DIP3VV44oG14kpBtcPS4YUTD3peke49pNUJY0h4i7nX+hkCc8J?=
 =?iso-8859-1?Q?rkDyIcgrFJQKbS9XmFkAtUcZsLzrjmP2sEAJvAxJ3mdAPrCczXH5X+MtWg?=
 =?iso-8859-1?Q?n4iWHld+LIMCVV+DhzR4q+tPMWRKH7LTQwXqyCnSJ3HjF1UfEl3XIu0JQK?=
 =?iso-8859-1?Q?/fazbzGDkXjqmbAeyX7LcZuI9LJBtseP82cJmlwyr/SDcNN0x0HA6EBxIQ?=
 =?iso-8859-1?Q?u+WkIJMEEIui1aeaPiYhKtalYIaIwC4+ttJPxJlr0c9x1ZpmFJxts=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB14363.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ac355f8e-7a53-4716-4029-08df406671d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 02:41:24.9800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17912

usb_role_switch_set_role() and usb_role_switch_get_role() check the=0A=
registered flag before taking the switch lock. If a provider is=0A=
unregistered during a role request, unregister can return while its=0A=
callback is still running. The provider may then free memory used by=0A=
the callback, causing a use-after-free. A caller that passed the check=0A=
can also enter a callback after unregister returns.=0A=
=0A=
Move the registered checks under the switch lock and clear the flag while=
=0A=
holding the same lock on unregister. This waits for active callbacks and=0A=
rejects callers that acquire the lock after the flag is cleared.=0A=
=0A=
The Apple DWC3 remove path currently holds its private mutex around=0A=
unregister. Its role callbacks take that mutex under the switch lock, so=0A=
waiting on the switch lock in unregister would reverse the lock order.=0A=
Unregister before taking the Apple mutex.=0A=
=0A=
Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")=0A=
Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>=0A=
---=0A=
Tested on ARM64 QEMU with Linux 7.3.4 and mainline 7.4-rc2=0A=
(067c5c24cef2), with KASAN and lockdep enabled. Synthetic providers=0A=
trigger KASAN use-after-free reports in both set and get callbacks before=
=0A=
this change. With the change, unregister waits for the callbacks and=0A=
neither test reports KASAN.=0A=
=0A=
A lockdep test modeling the Apple callback/remove lock order warns for the=
=0A=
original order and not for the new one. Apple DWC3 hardware was not tested.=
=0A=
=0A=
 drivers/usb/roles/class.c     |   18 ++++++++++++++----=0A=
 drivers/usb/dwc3/dwc3-apple.c |    4 ++--=0A=
 2 files changed, 16 insertions(+), 6 deletions(-)=0A=
=0A=
diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c=0A=
--- a/drivers/usb/roles/class.c=0A=
+++ b/drivers/usb/roles/class.c=0A=
@@ -79,10 +79,11 @@=0A=
 	if (IS_ERR_OR_NULL(sw))=0A=
 		return 0;=0A=
 =0A=
-	if (!sw->registered)=0A=
-		return -EOPNOTSUPP;=0A=
-=0A=
 	mutex_lock(&sw->lock);=0A=
+	if (!sw->registered) {=0A=
+		ret =3D -EOPNOTSUPP;=0A=
+		goto unlock;=0A=
+	}=0A=
 =0A=
 	ret =3D sw->set(sw, role);=0A=
 	if (!ret) {=0A=
@@ -90,6 +91,7 @@=0A=
 		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);=0A=
 	}=0A=
 =0A=
+unlock:=0A=
 	mutex_unlock(&sw->lock);=0A=
 =0A=
 	return ret;=0A=
@@ -107,16 +109,21 @@=0A=
 {=0A=
 	enum usb_role role;=0A=
 =0A=
-	if (IS_ERR_OR_NULL(sw) || !sw->registered)=0A=
+	if (IS_ERR_OR_NULL(sw))=0A=
 		return USB_ROLE_NONE;=0A=
 =0A=
 	mutex_lock(&sw->lock);=0A=
+	if (!sw->registered) {=0A=
+		role =3D USB_ROLE_NONE;=0A=
+		goto unlock;=0A=
+	}=0A=
 =0A=
 	if (sw->get)=0A=
 		role =3D sw->get(sw);=0A=
 	else=0A=
 		role =3D sw->role;=0A=
 =0A=
+unlock:=0A=
 	mutex_unlock(&sw->lock);=0A=
 =0A=
 	return role;=0A=
@@ -423,7 +430,10 @@=0A=
 {=0A=
 	if (IS_ERR_OR_NULL(sw))=0A=
 		return;=0A=
+	/* Wait for in-flight set/get callbacks before unregistering. */=0A=
+	mutex_lock(&sw->lock);=0A=
 	sw->registered =3D false;=0A=
+	mutex_unlock(&sw->lock);=0A=
 	if (dev_fwnode(&sw->dev))=0A=
 		component_del(&sw->dev, &connector_ops);=0A=
 	device_unregister(&sw->dev);=0A=
diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c=
=0A=
--- a/drivers/usb/dwc3/dwc3-apple.c=0A=
+++ b/drivers/usb/dwc3/dwc3-apple.c=0A=
@@ -487,9 +487,9 @@=0A=
 	struct dwc3 *dwc =3D platform_get_drvdata(pdev);=0A=
 	struct dwc3_apple *appledwc =3D to_dwc3_apple(dwc);=0A=
 =0A=
+	usb_role_switch_unregister(appledwc->role_sw);=0A=
+=0A=
 	guard(mutex)(&appledwc->lock);=0A=
-=0A=
-	usb_role_switch_unregister(appledwc->role_sw);=0A=
 =0A=
 	/*=0A=
 	 * If we're still in DWC3_APPLE_PROBE_PENDING we never got any cable conn=
ected event and=0A=
