Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792546279;
	b=D4wItD6C5Cl5WXbDLCD8VZuDmCEgZ/xYXzGxCXBRhSzqZuCoQvpQFoZ8ZvJckX3gVqyQ
	 nU/JtrmvI0H51okbYjbjv/IW9opYmcO7aiHDNkXB0nxud2WI4rRBQNBjLGwBS0/Ks+H1+
	 e46igisWuUTEu1SMjHTlAW0hSGsTULaDLAIa+JjfwGJ8oqblc3k7cUDs2fB0Geq/idBsO
	 Py4UDR+Gsc7Ihu23QRjQn+7pYICs2541ubXA7kph6td3OR4xz8G0AuaFZJUNXkdgB21TB
	 QRgiM3757FGEQOaHvhKe/UFOE5MxwaD4BAD1LxSWmGsyKn1LqiKDKvpwkKFC+1CtveQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546279;
	h=DMARC-Filter:Received:X-Originating-IP:Date:X-CM-HeaderCharset:From:
	 To:Cc:Subject:X-Priority:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	 X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam;
	bh=37mEmZ2kuAIZnGixdO+VWrkP6WNItUUTvWC50ph2N/Q=;
	b=UOLtJaL1K9AYU10vujVN9aIHhAsY7y342cTWiH5CnXc9mxmkt4L8uG9gu+qjZvbvXgkC
	 Pp6fL4nvoJ/bqWMA8Y2awMoXqRM8mDug76HGFHUHBw1AM8+UQRUhEI2CW59FmVKBjAxGO
	 jzHjBhlBjRsA0dXrN6o+V5p91eNmImyD8Cbm1RX5upahXR4oT16bSrJepFGblNfArK5Fc
	 wkONkgl8QJ9BTrIo8zO9E/YRmbWpQsPMEOa6n/eApkmi/Zp5PC2AX1laZurMGZ00qlHfc
	 DLKSEjFL/ZxbZTHsh7NfQue2bbfg4Oa1wL/Bex+DmK5ODoLxOn9VIrcgVzp2t4/SoTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mails.ucas.ac.cn;
	spf=pass smtp.mailfrom=mails.ucas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.23
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE4A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.ucas.ac.cn
Received: from xujiakai24$mails.ucas.ac.cn ( [36.110.52.2] ) by
 ajax-webmail-APP-10 (Coremail) ; Wed, 21 Oct 2026 09:30:37 +0800
 (GMT+08:00)
Date: Wed, 21 Oct 2026 09:30:37 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiakai Xu" <xujiakai24@mails.ucas.ac.cn>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Peter Zijlstra" <peterz@infradead.org>, 
	"Ingo Molnar" <mingo@redhat.com>, 
	"Juri Lelli" <juri.lelli@redhat.com>, 
	"Vincent Guittot" <vincent.guittot@linaro.org>, 
	"Dietmar Eggemann" <dietmar.eggemann@arm.com>, 
	"Steven Rostedt" <rostedt@goodmis.org>, 
	"Ben Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, 
	"Valentin Schneider" <vschneid@redhat.com>, 
	"K Prateek Nayak" <kprateek.nayak@amd.com>, 
	"Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] sched/mmcid: Bound the CID allocation busy wait
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2026 www.mailtech.cn cnic.cn
In-Reply-To: <87mrs8bhp4.ffs@fw13>
References: <20260918013454.1850369-1-xujiakai24@mails.ucas.ac.cn>
 <20260918104349.GL776954@noisy.programming.kicks-ass.net>
 <877bjiem45.ffs@fw13> <87mrs8bhp4.ffs@fw13>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <4e6dda6c.4dd0b.1a15c14eb2d.Coremail.xujiakai24@mails.ucas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:tACowABnbay9Fdhq2I4UAA--.3563W
X-CM-SenderInfo: 50xmxthndljko6pdxz3voxutnvoduhdfq/1tbiBgkGE2rXdVSB-QA
	Bs7
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWkCw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiBPbiBUaHUsIE9jdCAxNSAyMDI2IGF0IDIyOjM3LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4g
PiBPbiBGcmksIFNlcCAxOCAyMDI2IGF0IDEyOjQzLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+
IFRoZSBzdGFsbCBtYWtlcyBubyBzZW5zZSBiZWNhdXNlIG1tX2dldF9jaWQoKSBpcyBpbnZva2Vk
IGZyb206Cj4gPgo+ID4gICAxMDk2NyAgICAgICAgICAgICAgICAgLyogRmlyc3QgdXNlciA/ICov
Cj4gPiAgIDEwOTY4ICAgICAgICAgICAgICAgICBpZiAoIW1tLT5tbV9jaWQudXNlcnMpIHsKPiA+
ICAgMTA5NjkgICAgICAgICAgICAgICAgICAgICAgICAgc2NoZWRfbW1fY2lkX2FkZF91c2VyKHQs
IG1tKTsKPiA+ICAgMTA5NzAgICAgICAgICAgICAgICAgICAgICAgICAgdC0+bW1fY2lkLmNpZCA9
IG1tX2dldF9jaWQobW0pOwo+ID4KPiA+IHdoaWNoIG1lYW5zIHRoaXMgaXMgdGhlIGZpcnN0IENJ
RCB1c2VyIG9uIHRoZSBNTS4gU28gaG93IGNhbiB0aGUgYml0bWFwCj4gPiBiZSBleGhhdXN0ZWQ/
Cj4gPgo+ID4gSSBoYXZlIGEgc3VzcGljaW9uIGJ1dCBpdCBkb2VzIG5vdCBhZGQgdXAgKHlldCku
Cj4gPgo+ID4gVGhpcyBpcyBhIHR3byBDUFUgVk0uIEFzc3VtZSB0aGF0IHRoZSBwcm9jZXNzIHdo
aWNoIGludm9rZXMgZXhlY3ZlKCkgaGFzCj4gPiBtb3JlIHRoYW4gdHdvIHRocmVhZHMuIFRoYXQg
bWVhbnMgdGhlIE1NQ0lEIG9mIHRoZSBwcm9jZXNzIGlzIGluIHBlciBDUFUKPiA+IG1vZGUuIHNj
aGVkX21tX2NpZF9leGl0KCkgaWdub3JlcyBhIG1vZGUgY2hhbmdlIHdoZW4gdGhlIGxhc3QgdXNl
ciBnb2VzCj4gPiBhd2F5IGFuZCB3aXRoIHR3byBDUFVzIHRoZSB0aHJlc2hvbGQgdG8gc3dpdGNo
IGJhY2sgaXMgd2hlbiB0aGUgdXNlcgo+ID4gY291bnQgZ29lcyBiZWxvdyBfT05FXy4gU28gdGhl
cmUgaXMgcHJvYmFibHkgc3RhbGUgc3RhdGUgdGhlcmUsIGJ1dCB0aGUKPiA+IGxhc3Qgb3V0Z29p
bmcgdGFzayBzaG91bGQgaGF2ZSByZWNsYWltZWQgdGhlIHBlciBDUFUgQ0lEIGFuZCBkcm9wcGVk
IGl0LAo+ID4gYnV0IHRoZSBvdGhlciBDUFUgc3RpbGwgaGFzIGl0IGFzc2lnbmVkIHRvIGl0LiBT
byB0aGF0IGZpcnN0IGFsbG9jYXRpb24KPiA+IHNob3VsZCBzdWNjZWVkLi4uCj4gPgo+ID4gSSds
bCB0cnkgdG8gd3JpdGUgYSB0cml2aWFsIHRlc3QgcHJvZ3JhbSB0b21vcnJvdyB3aGljaCBjcmVh
dGVzIGVub3VnaAo+ID4gdGhyZWFkcyBhbmQgZG9lcyBhbiBleGVjdmUoKS4KPiAKPiBIbW0uIFRo
ZXJlIGlzIHN0YWxlIHN0YXRlLCBidXQgdGhlcmUgaXMgYWx3YXlzIF9PTkVfIENJRCBhdmFpbGFi
bGUKPiBiZWNhdXNlIHRoZSBsYXN0IGV4aXRpbmcgdGhyZWFkIGRyb3BzIHRoZSBwZXIgQ1BVIENJ
RC4KPiAKPiBBcyB0aGUgbW9kZSBpcyBUUkFOU0lUIHRoZSB3aG9sZSBzY2VuYXJpbyByZXNvbHZl
cyB3aGVuIHRoZSBuZXcgZXhlYwo+IHNwYXducyB0aHJlYWRzIG9yIHNjaGVkdWxlcyBhcm91bmQu
IFRoYXQganVzdCB3b3JrcyBieSBjaGFuY2UsIGJ1dCBJCj4gY291bGRuJ3QgZmluZCBhIHdheSB0
byBleGhhdXN0IHRoZSBiaXRtYXAgZm9yIHRoZSBpbml0aWFsIGFsbG9jYXRpb24uCj4gCj4gU28g
SSByZWFsbHkgbmVlZCB0byBzZWUgdGhlIHJlcHJvZHVjZXIgZm9yIHRoaXMgc3BsYXQuCgpIaSBU
aG9tYXMsCgpVbmZvcnR1bmF0ZWx5LCBJIGRvbid0IGhhdmUgYSByZXByb2R1Y2VyIGZvciB0aGlz
IGlzc3VlLgoKQmVzdCByZWdhcmRzLApKaWFrYWkKCj4gCj4gVGhlIHBhdGNoIGJlbG93IGNsZWFu
cyB1cCB0aGUgc3RhbGUgZGF0YSBhbmQgZml4ZXMgYSBjb25zaXN0ZW5jeSBpc3N1ZQo+IHZzLiB0
aGUgYWxsb3dlZCBDUFVzIGFjY291bnRpbmcuCj4gCj4gVGhhbmtzLAo+IAo+ICAgICAgICAgdGds
eAo+IC0tLQo+IC0tLSBhL2tlcm5lbC9zY2hlZC9jb3JlLmMKPiArKysgYi9rZXJuZWwvc2NoZWQv
Y29yZS5jCj4gQEAgLTEwODgwLDYgKzEwODgwLDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtbV91
cGRhdGVfY3B1c19hbGxvd2UKPiAgCSAqLwo+ICAJbWMgPSAmbW0tPm1tX2NpZDsKPiAgCWd1YXJk
KHJhd19zcGlubG9jaykoJm1jLT5sb2NrKTsKPiArCS8qIE1pZ2h0IGhhdmUgcmFjZWQgd2l0aCBl
eGl0KCkgKi8KPiArCWlmICghbW0tPm1tX2NpZC51c2VycykKPiArCQlyZXR1cm47Cj4gKwo+ICAJ
bW1fYWxsb3dlZCA9IG1tX2NwdXNfYWxsb3dlZChtbSk7Cj4gIAl3ZWlnaHQgPSBjcHVtYXNrX3dl
aWdodGVkX29yKG1tX2FsbG93ZWQsIG1tX2FsbG93ZWQsIGFmZm1zayk7Cj4gIAlpZiAod2VpZ2h0
ID09IG1jLT5ucl9jcHVzX2FsbG93ZWQpCj4gQEAgLTExMDE5LDYgKzExMDIzLDMzIEBAIHN0YXRp
YyBib29sIHNjaGVkX21tX2NpZF9hZGRfdXNlcihzdHJ1Y3QKPiAgCXJldHVybiBtbV91cGRhdGVf
bWF4X2NpZHMobW0pOwo+ICB9Cj4gIAo+ICsvKgo+ICsgKiBzY2hlZF9tbV9jaWRfZXhpdCgpIGRv
ZXMgbm90IGhhbmRsZSB0aGUgbW9kZSBzd2l0Y2ggZm9yIHRoZSBsYXN0IHVzZXIKPiArICogYmVj
YXVzZSBmb3Igbm9ybWFsIGV4aXQoKSB0aGF0J3MgYSBwb2ludGxlc3MgZXhlcmNpc2UuIEJ1dCBp
ZiB0aGUKPiArICogcHJvY2VzcyB3aGljaCBpc3N1ZWQgZXhlY3ZlKCkgd2FzIG11bHRpdGhyZWFk
ZWQgYW5kIHRoZSBsYXN0IGV4aXRpbmcKPiArICogdGhyZWFkIHN3aXRjaGVkIGJhY2sgZnJvbSBw
ZXIgQ1BVIG1vZGUgdGhlbiB0aGlzIGxlYXZlcyBzdGFsZSBzdGF0ZQo+ICsgKiBhcm91bmQuIFRo
ZSBpbmRpY2F0b3IgZm9yIHRoYXQgaXMgbW1fY2lkOjptb2RlIGhhdmluZyBNTV9DSURfVFJBTlNJ
VAo+ICsgKiBzZXQuCj4gKyAqLwo+ICtzdGF0aWMgdm9pZCBzY2hlZF9tbV9jaWRfY2xlYW51cF9l
eGVjdmUoc3RydWN0IHRhc2tfc3RydWN0ICp0LCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiArewo+
ICsJaWYgKGxpa2VseSghbW0tPm1tX2NpZC5tb2RlKSkKPiArCQlyZXR1cm47Cj4gKwo+ICsJV0FS
Tl9PTl9PTkNFKG1tLT5tbV9jaWQubW9kZSAmIE1NX0NJRF9PTkNQVSk7Cj4gKwltbS0+bW1fY2lk
Lm1vZGUgPSAwOwo+ICsKPiArCXVuc2lnbmVkIGludCBjcHU7Cj4gKwo+ICsJZm9yX2VhY2hfcG9z
c2libGVfY3B1KGNwdSkKPiArCQlwZXJfY3B1KG1tLT5tbV9jaWQucGNwdS0+Y2lkLCBjcHUpID0g
MDsKPiArCj4gKwliaXRtYXBfemVybyhtbV9jaWRtYXNrKG1tKSwgbnVtX3Bvc3NpYmxlX2NwdXMo
KSk7Cj4gKwo+ICsJbW0tPm1tX2NpZC5ucl9jcHVzX2FsbG93ZWQgPSB0LT5ucl9jcHVzX2FsbG93
ZWQ7Cj4gKwljcHVtYXNrX2NvcHkobW1fY3B1c19hbGxvd2VkKG1tKSwgJnQtPmNwdXNfbWFzayk7
Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHNjaGVkX21tX2NpZF9mb3JrKHN0cnVjdCB0YXNrX3N0
cnVjdCAqdCkKPiAgewo+ICAJc3RydWN0IG1tX3N0cnVjdCAqbW0gPSB0LT5tbTsKPiBAQCAtMTEw
MzUsNiArMTEwNjYsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZF9tbV9jaWRfZm9yayhzdHJ1Y3QgdGFz
Cj4gIAo+ICAJCS8qIEZpcnN0IHVzZXIgPyAqLwo+ICAJCWlmICghbW0tPm1tX2NpZC51c2Vycykg
ewo+ICsJCQlzY2hlZF9tbV9jaWRfY2xlYW51cF9leGVjdmUodCwgbW0pOwo+ICAJCQlzY2hlZF9t
bV9jaWRfYWRkX3VzZXIodCwgbW0pOwo+ICAJCQl0LT5tbV9jaWQuY2lkID0gbW1fZ2V0X2NpZCht
bSk7Cj4gIAkJCS8qIFJlcXVpcmVkIGZvciBleGVjdmUoKSAqLwo+IAo+IAo=
