Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [118.143.206.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AE73A984F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.143.206.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762359; cv=none; b=nnJp+YSn//bFtrsy9dDVdvB37Xt/qUjCjFLNW/86PyV5fsAvHPYbgcUYprK+c2pvA7xo3+owbQRFAs4O0CCw31JMpPczeRp6AOlXp4+IXyZhhAWItmPWW0ftPB9NA8WRLF4rctu05117hD60xf0atFPdNLozDSyisOLLao5p54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762359; c=relaxed/simple;
	bh=gH9fAhqrupTFLY2A9c/3iBOKFUWtQXhPwQUY8XXTh6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XSHBCP2In8lyKZXorQGCxR2GC/4fw2LBFr2J99svM+Q0IcqlFvRzpAx48BwDvlUdk/pnfYOT1Odl5WYwd0GHLftQiwCs2NXPpam6ik41wcqun/RIROXYynVem6zt/o9GWhswjcIetFh1UU3RZDt9ikwp+KdDEQHYhMW/45rMypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=118.143.206.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: ABga19qYS12lR3Izhhx/kQ==
X-CSE-MsgGUID: E/KmHheSTfmzwmRRfGVBCA==
X-IronPort-AV: E=Sophos;i="6.25,266,1779120000"; 
   d="scan'208";a="161776485"
From: =?utf-8?B?5YiY5pyv6auY?= <liushugao@xiaomi.com>
To: Thomas Gleixner <tglx@linutronix.de>, =?utf-8?B?5pyx5oG65Lm+?=
	<zhukaiqian@xiaomi.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	=?utf-8?B?J+W8oOWYieS8nyc=?= <zhangjiawei8@xiaomi.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?546L6Z+s?= <lingyue@xiaomi.com>, =?utf-8?B?54aK5Lqu?=
	<xiongliang@xiaomi.com>, "isaacmanjarres@google.com"
	<isaacmanjarres@google.com>, Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>, =?utf-8?B?5qKB5Lyf6bmP?=
	<weipengliang@xiaomi.com>, =?utf-8?B?57+B6YeR6aOe?= <wengjinfei@xiaomi.com>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtFeHRlcm5hbCBNYWlsXVtQQVRDSF0gdGljay9i?=
 =?utf-8?Q?roadcast:_Plug_clockevents_replacement_race?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbRXh0ZXJuYWwgTWFpbF1bUEFUQ0hdIHRpY2svYnJvYWRjYXN0?=
 =?utf-8?Q?:_Plug_clockevents_replacement_race?=
Thread-Index: AQHa7MK0Vqp0kbQNSkKwEnDO0Z5mtLa3v96ggAlCo9CAA5Y6AIACsIKQ
Date: Mon, 7 Sep 2026 06:24:43 +0000
Message-ID: <cecc2fe0ba9d4ada96b68a12cef0612d@xiaomi.com>
References: <042520850d394f0bb0004a226db63d0d@xiaomi.com>
 <87o77m1v9r.ffs@tglx> <b07f9746a58d46919b1600b22f5dff05@xiaomi.com>
 <835d5847-1aa0-4852-89c7-6a6996b3eb65@linaro.org>
 <bc1a086b932f454f9379c49221983675@xiaomi.com> <87o775uh0y.ffs@tglx>
 <87frrs8lsg.ffs@tglx> <87cymdsu0r.ffs@tglx>
 <6eb4fac303f4457f9686510664e79bff@xiaomi.com>
 <e52a3bfe9e444c14bc6281b1075c1fb2@xiaomi.com> <87jyoz4cs5.ffs@fw13>
In-Reply-To: <87jyoz4cs5.ffs@fw13>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVGh1LCBTZXAgMDMgMjAyNiBhdCAwNjozMywgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOg0KPiBJ
dCB0b29rIHlvdSBtb3JlIHRoYW4gZnJpY2tpbmcgVFdPIFlFQVJTIHRvIHRlc3QgYW5kIHZhbGlk
YXRlIHRoYXQNCj4gcGF0Y2ggYW5kIG5vdyB0aGF0IHlvdSBmaW5hbGx5IGNhbWUgYXJvdW5kIHRv
IHRha2UgY2FyZSBvZiBpdCB3aXRob3V0DQo+IGZvbGxvd2luZyB0aGUgZG9jdW1lbnRlZCBwcm9j
ZXNzIHlvdSBleHBlY3QgbWUgdG8gbWVyZ2UgaXQgd2l0aGluIGENCj4gY291cGxlIG9mIGRheXMg
YW5kIHByZWZlcnJhYmx5IGV4cGVkaXRlIGl0IGFuZCBwcm92aWRlIHlvdSB0aGUNCj4gZXhwZWN0
ZWQgdGltZWxpbmUgYmVjYXVzZSB5b3UgaGF2ZSBhIGJ1c2luZXNzIGNhc2UuDQoNCllvdSBhcmUg
cmlnaHQuIFRoZSBkZWxheSBpcyBlbnRpcmVseSBvbiBvdXIgc2lkZSwgYW5kIEkgc2hvdWxkIG5v
dA0KaGF2ZSByZXF1ZXN0ZWQgZXhwZWRpdGluZyBvciBhIHRpbWVsaW5lLiBJIGFwb2xvZ2l6ZSBm
b3IgdGhhdC4NCg0KVGVzdGVkLWJ5OiDliJjmnK/pq5ggPGxpdXNodWdhb0B4aWFvbWkuY29tPg0K
DQpJIHdpbGwgbWFrZSBzdXJlIHRvIGZvbGxvdyB0aGUgZG9jdW1lbnRlZCBwcm9jZXNzIGFuZCBy
ZXNwb25kIG1vcmUNCnByb21wdGx5IGluIHRoZSBmdXR1cmUuDQoNClRoYW5rcywNCg0KCeWImOac
r+mrmA0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IFRob21hcyBHbGVpeG5l
ciA8dGdseEBsaW51dHJvbml4LmRlPiANCuWPkemAgeaXtumXtDogMjAyNuW5tDnmnIg25pelIDU6
MTkNCuaUtuS7tuS6ujog5YiY5pyv6auYIDxsaXVzaHVnYW9AeGlhb21pLmNvbT47IOacseaBuuS5
viA8emh1a2FpcWlhbkB4aWFvbWkuY29tPjsgRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5v
QGxpbmFyby5vcmc+OyAn5byg5ZiJ5LyfJyA8emhhbmdqaWF3ZWk4QHhpYW9taS5jb20+DQrmioTp
gIE6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IOeOi+mfrCA8bGluZ3l1ZUB4aWFvbWku
Y29tPjsg54aK5LquIDx4aW9uZ2xpYW5nQHhpYW9taS5jb20+OyBpc2FhY21hbmphcnJlc0Bnb29n
bGUuY29tOyBGcmVkZXJpYyBXZWlzYmVja2VyIDxmcmVkZXJpY0BrZXJuZWwub3JnPjsgQW5uYS1N
YXJpYSBCZWhuc2VuIDxhbm5hLW1hcmlhQGxpbnV0cm9uaXguZGU+OyDmooHkvJ/puY8gPHdlaXBl
bmdsaWFuZ0B4aWFvbWkuY29tPjsg57+B6YeR6aOeIDx3ZW5namluZmVpQHhpYW9taS5jb20+DQrk
uLvpopg6IFJlOiDlm57lpI06IFtFeHRlcm5hbCBNYWlsXVtQQVRDSF0gdGljay9icm9hZGNhc3Q6
IFBsdWcgY2xvY2tldmVudHMgcmVwbGFjZW1lbnQgcmFjZQ0KDQpb5aSW6YOo6YKu5Lu2XSDmraTp
gq7ku7bmnaXmupDkuo7lsI/nsbPlhazlj7jlpJbpg6jvvIzor7fosKjmhY7lpITnkIbjgILoi6Xl
r7npgq7ku7blronlhajmgKflrZjnlpHvvIzor7flsIbpgq7ku7bovazlj5Hnu5ltaXNlY0B4aWFv
bWkuY29t6L+b6KGM5Y+N6aaIDQoNCk9uIFRodSwgU2VwIDAzIDIwMjYgYXQgMDY6MzMsIOWImOac
r+mrmCB3cm90ZToNCj4gQ291bGQgeW91IHBsZWFzZSBzaGFyZSB0aGUgZXhwZWN0ZWQgdGltZWxp
bmUgZm9yIG1lcmdpbmcgdGhpcyBmaXggaW50byANCj4gdGhlIG1haW5saW5lIGtlcm5lbD8gV2Ug
aGF2ZSBkb3duc3RyZWFtIHByb2R1Y3RzIGRlcGVuZGluZyBvbiB0aGlzIGZpeCANCj4gYW5kIHdv
dWxkIGFwcHJlY2lhdGUgaXQgaWYgdGhlIG1lcmdlIGNvdWxkIGJlIGV4cGVkaXRlZC4NCg0KSnVz
dCBmb3IgdGhlIHJlY29yZC4gSGVyZSBpcyB0aGUgdGltZWxpbmU6DQoNCjIwMjQtMDYtMjY6IElz
c3VlIHJlcG9ydGVkDQoyMDI0LTA4LTEyOiBQYXRjaCBhdmFpbGFibGUgYWZ0ZXIgc29tZSBkaXNj
dXNzaW9uDQoyMDI2LTA4LTI4OiBDb25maXJtYXRpb24gdGhhdCB0aGUgcGF0Y2ggd29ya3MNCjIw
MjYtMDktMDU6IFJlcXVlc3QgZm9yIHRpbWUgbGluZQ0KDQpJdCB0b29rIHlvdSBtb3JlIHRoYW4g
ZnJpY2tpbmcgVFdPIFlFQVJTIHRvIHRlc3QgYW5kIHZhbGlkYXRlIHRoYXQgcGF0Y2ggYW5kIG5v
dyB0aGF0IHlvdSBmaW5hbGx5IGNhbWUgYXJvdW5kIHRvIHRha2UgY2FyZSBvZiBpdCB3aXRob3V0
IGZvbGxvd2luZyB0aGUgZG9jdW1lbnRlZCBwcm9jZXNzIHlvdSBleHBlY3QgbWUgdG8gbWVyZ2Ug
aXQgd2l0aGluIGEgY291cGxlIG9mIGRheXMgYW5kIHByZWZlcnJhYmx5IGV4cGVkaXRlIGl0IGFu
ZCBwcm92aWRlIHlvdSB0aGUgZXhwZWN0ZWQgdGltZWxpbmUgYmVjYXVzZSB5b3UgaGF2ZSBhIGJ1
c2luZXNzIGNhc2UuDQoNCklPVywgdGhpcyBjb3VsZCBoYXZlIGJlZW4gZml4ZWQgVFdPIFlFQVJT
IGFnbyBpZiB5b3Ugd29sZCBoYXZlIHBhaWQgYXR0ZW50aW9uLg0KDQpTZXJpb3VzbHk/DQoNClRo
YW5rcywNCg0KICAgICAgICB0Z2x4DQo=
