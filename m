Received: from cstnet.cn (smtp37.cstnet.cn [159.226.251.37])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B81299920;
	Sun, 30 Aug 2026 22:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130421; cv=none; b=iuPdcy031EtNIb1lli016kGYw8NtIQhWq87khOo9IhfjTABOeN+YxNNJ4keauMBoxkyLmf5f6rMKvTLXuAkJsQ22Gj1vwZAAcFsWUrB1Zd234c5KJQzhO+vktWwVPEqAaYOVXGKBqR1Wq5vIMagxvHTLnzbP7wltgo+1av+o3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130421; c=relaxed/simple;
	bh=ShskSJmVXHCsMx3tT+XV/c0l9krf7Sa0bVSbhuRqKqs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=YIuI9FKeVMz3Uy4M4Ns//ueC3iCPlKCnItoQu5OkCX1og0KQ5bddcdDCcE/yDzGAzO8d0kWqO+BIMv09Ao0/rEFF3hwWkgnpnDd7XvrKgTdAsE6WeHO7soX4yOIRQ9GYm8k6SNMmswu5lXUzHfkYQ2vjwSnimaHAamFSvkuieRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from pengpeng$iscas.ac.cn ( [45.78.7.153] ) by ajax-webmail-APP-12
 (Coremail) ; Mon, 31 Aug 2026 06:45:51 +0800 (GMT+08:00)
Date: Mon, 31 Aug 2026 06:45:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5L6v5pyL5pyL?= <pengpeng@iscas.ac.cn>
To: "Jonathan Corbet" <corbet@lwn.net>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: dvb-frontends: ds3000: validate firmware
 size
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2026 www.mailtech.cn cnic.cn
In-Reply-To: <87o6ejll9n.fsf@trenco.lwn.net>
References: <20260830124034.95459-1-pengpeng@iscas.ac.cn>
 <87o6ejll9n.fsf@trenco.lwn.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5c173af9.ec340.1a054d9be08.Coremail.pengpeng@iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:tgCowACXTNGgspRqqfQJAA--.51397W
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/1tbiBwIPBWqUO9RwnAADsx
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

V2UgYXJlIGEgc3lzdGVtcyBzb2Z0d2FyZSByZXNlYXJjaCBncm91cCBkZXZlbG9waW5nIHN0YXRp
YyBhbmFseXNpcyB0b29scyBzaW1pbGFyIHRvIFNwYXJzZSBhbmQgQ29jY2luZWxsZS4gT3VyIGdv
YWwgaXMgdG8gcHVibGlzaCBhdCB2ZW51ZXMgc3VjaCBhcyBGU0UgYW5kIElDU0Ugd2hpbGUgYWxz
byBjb250cmlidXRpbmcgdXNlZnVsIGZpeGVzIHVwc3RyZWFtLgpNb3N0IG9mIG91ciBrZXJuZWwg
cGF0Y2hlcyBvcmlnaW5hdGUgZnJvbSBmaW5kaW5ncyByZXBvcnRlZCBieSBvdXIgdG9vbHMgYW5k
IGFyZSByZXZpZXdlZCBib3RoIG1hbnVhbGx5IGFuZCB3aXRoIExMTSBhc3Npc3RhbmNlLiBEeW5h
bWljIHZhbGlkYXRpb24gaXMgb2Z0ZW4gaW1wcmFjdGljYWwsIGVzcGVjaWFsbHkgZm9yIGhhcmR3
YXJlLWRlcGVuZGVudCBkcml2ZXIgY29kZSwgYW5kIGVtdWxhdGlvbiBpcyBub3QgYWx3YXlzIHN1
ZmZpY2llbnQuIFdlIHRoZXJlZm9yZSByZWx5IG1haW5seSBvbiBzdGF0aWMgYW5hbHlzaXMgYW5k
IGNhcmVmdWwgcmV2aWV3LCBhbmQgb2Z0ZW4gc3RhdGUgdGhpcyB3YXkgaW4gb3VyIHByaW9yIHBh
dGNoZXM6VGhlIGlzc3VlIHdhcyBpZGVudGlmaWVkIHRocm91Z2ggc3RhdGljIGFuYWx5c2lzIGFu
ZCBtYW51YWxseSByZXZpZXdlZC4KCgo+IC0tLS0t5Y6f5aeL6YKu5Lu2LS0tLS0KPiDlj5Hku7bk
uro6ICJKb25hdGhhbiBDb3JiZXQiIDxjb3JiZXRAbHduLm5ldD4KPiDlj5HpgIHml7bpl7Q6IDIw
MjYtMDgtMzAgMjI6NDU6NDAgKOaYn+acn+aXpSkKPiDmlLbku7bkuro6ICJQZW5ncGVuZyBIb3Ui
IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4sICJNYXVybyBDYXJ2YWxobyBDaGVoYWIiIDxtY2hlaGFi
QGtlcm5lbC5vcmc+Cj4g5oqE6YCBOiAiUGVuZ3BlbmcgSG91IiA8cGVuZ3BlbmdAaXNjYXMuYWMu
Y24+LCBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcKPiDkuLvpopg6IFJlOiBbUEFUQ0hdIG1lZGlhOiBkdmItZnJvbnRlbmRzOiBkczMwMDA6
IHZhbGlkYXRlIGZpcm13YXJlIHNpemUKPiAKPiBQZW5ncGVuZyBIb3UgPHBlbmdwZW5nQGlzY2Fz
LmFjLmNuPiB3cml0ZXM6Cj4gCj4gPiBUaGUgZmlybXdhcmUgZGlhZ25vc3RpYyByZWFkcyB0aGUg
Zmlyc3QgdHdvIGFuZCBmaW5hbCB0d28gYnl0ZXMgd2l0aG91dAo+ID4gcHJvdmluZyB0aGF0IHRo
ZSBmaXJtd2FyZSBvYmplY3QgY29udGFpbnMgYXQgbGVhc3QgdHdvIGJ5dGVzLgo+ID4KPiA+IFJl
amVjdCB1bmRlcnNpemVkIGZpcm13YXJlIGJlZm9yZSB0aGUgZGlhZ25vc3RpYyBhbmQgdXBsb2Fk
IHBhdGggY29uc3VtZQo+ID4gaXQuCj4gPgo+ID4gRml4ZXM6IDA5ZWEzM2U1YzY5NiAoIlY0TC9E
VkIgKDEzNDkzKTogVGVWaWkgUzQ3MCBhbmQgVEJTIDY5MjAgZml4ZXMiKQo+ID4gU2lnbmVkLW9m
Zi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9kczMwMDAuYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
ZHZiLWZyb250ZW5kcy9kczMwMDAuYyBiL2RyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9kczMw
MDAuYwo+ID4gaW5kZXggY2U3YWU0MjRiMjdjYy4uNzZkMmViOTg5MzJhZSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9kczMwMDAuYwo+ID4gKysrIGIvZHJpdmVy
cy9tZWRpYS9kdmItZnJvbnRlbmRzL2RzMzAwMC5jCj4gPiBAQCAtMzc0LDYgKzM3NCw4IEBAIHN0
YXRpYyBpbnQgZHMzMDAwX2xvYWRfZmlybXdhcmUoc3RydWN0IGR2Yl9mcm9udGVuZCAqZmUsCj4g
PiAgCWludCByZXQgPSAwOwo+ID4gIAo+ID4gIAlkcHJpbnRrKCIlc1xuIiwgX19mdW5jX18pOwo+
ID4gKwlpZiAoZnctPnNpemUgPCAyKQo+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gCj4gU28sIHlv
dSBoYXZlIGdlbmVyYXRlZCBhbiBhd2Z1bCBsb3Qgb2YgZml4ZXMgYWxsIG92ZXIgdGhlIHRyZWUg
aW4gdGhlCj4gbGFzdCBmZXcgbW9udGhzLiAgQ2FuIHlvdSB0ZWxsIHVzIGFib3V0IHdoYXQgdG9v
bCB5b3UgYXJlIHVzaW5nIHRvIGZpbmQKPiBhbmQgZml4IHRoZXNlIGJ1Z3MsIGFuZCBob3cgeW91
IGFyZSB0ZXN0aW5nIHlvdXIgZml4ZXM/Cj4gCj4gVGhhbmtzLAo+IAo+IGpvbgo=
