Received: from cstnet.cn (smtp87.cstnet.cn [159.226.251.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C09C4BF951
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643089; cv=none; b=aTQpKxLUQY+wZSIP6k+5kLOGs8kXKXVAPhDqq+j797DayY8MElDkuiv/SOCM6M7ClzGoCVQvbvL6VNQ/erid6EseuJK5pU/txBDnq94np7KjR9TsO4XpxzUkB2jD++OsLfsiYlmNnAaj4ki0iLeof8e/6ErpToQQVpG1SSwzR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643089; c=relaxed/simple;
	bh=xP4Naa38yL8XQeryAfAjR/RGUvqfM5rNT4lB2jDiZ/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=YrltOZ4vu4/s32Zhz2J2CROLyPKRMjHJZbtvhx1qPYaUr02LUggrUF8Jp0okwkxXPLSEQN68+OWfVIZy3DmlTnNeafVvoNxJZPxUrOeT/R1ZOfa5vPjFFSE79XiLequm9gARJJWhrkC7prH25G8yXsKzW7pxO3sRAILlgJqGUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=semi.ac.cn; spf=pass smtp.mailfrom=semi.ac.cn; arc=none smtp.client-ip=159.226.251.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=semi.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=semi.ac.cn
Received: from huanggaobin23$semi.ac.cn ( [159.226.228.11] ) by
 ajax-webmail-APP-17 (Coremail) ; Thu, 17 Sep 2026 19:04:30 +0800
 (GMT+08:00)
Date: Thu, 17 Sep 2026 19:04:30 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?6buE6auY5b2s?= <huanggaobin23@semi.ac.cn>
To: "Jonathan Cameron" <jic23@kernel.org>
Cc: jic23@kernel.org, djbw@kernel.org, iweiny@kernel.org, dave@stgolabs.net, 
	dave.jiang@intel.com, alison.schofield@intel.com, 
	vishal.l.verma@intel.com, ming.li@zohomail.com, icheng@nvidia.com, 
	linux-kernel@vger.kernel.org, anisa.su887@gmail.com
Subject: Re: Re: [PATCH 2/2] cxl/mbox: bound the Get Supported Logs entry
 count by the payload
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2026 www.mailtech.cn cnic.cn
In-Reply-To: <20260916014247.247c4333@jic23-hlaptop>
References: <20260914125701.1160136-1-huanggaobin23@semi.ac.cn>
 <20260914125701.1160136-3-huanggaobin23@semi.ac.cn>
 <20260916014247.247c4333@jic23-hlaptop>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <f1bcfb0.e6d7.1a0af0a1dc2.Coremail.huanggaobin23@semi.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:qgCowABHMRA+yatqqyIPAA--.51260W
X-CM-SenderInfo: xkxd0wxjdruxrqstq2xhplhtffof0/1tbiCRQNDGqrq01k9wABsp
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiBTaW1pbGFyIHRvIHByZXZpb3VzLiAgU28gZmFyIHdlIGFyZW4ndCB0cmVhdGluZyBidWdneSBk
ZXZpY2VzIGFzCj4gc29tZXRoaW5nIHdlIG11c3QgaGFyZGVuIGFnYWluc3QuICBXaGVyZSBpdCBp
cyBzaW1wbGUgdGhvdWdoIHdlIGNhbgo+IGRvIHNvLgoKU2FtZSBmcmFtaW5nIGFzIDEvMjogdGhp
cyBpcyBoYXJkZW5pbmcsIGFuZCB0aGUgRml4ZXM6IHRhZyBpcyBkcm9wcGVkIHdpdGggdGhlCmNv
bW1pdCBtZXNzYWdlIHNheWluZyBzbyByYXRoZXIgdGhhbiBsZWF2aW5nIGl0IHRvIGJlIGluZmVy
cmVkLgoKVGhlIHBhdGNoIGlzIG5vdyBwb3N0ZWQgb24gaXRzIG93biBhcyBbUEFUQ0ggdjJdIC0t
IHRoZSBldmVudCByZWNvcmQgcGF0Y2ggZnJvbQp0aGUgdjEgc2VyaWVzIGlzIHdpdGhkcmF3biwg
YmVjYXVzZSBBbmlzYSBTdSBoYXMgdGhlIHNhbWUgZml4IGluIGZsaWdodCBmcm9tCjIwMjYtMDgt
MzE6CgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkxNzEwNDYwMy4yNjU4NTI5
LTEtaHVhbmdnYW9iaW4yM0BzZW1pLmFjLmNuLwoKPiArCSpsZW4gPSBtYm94X2NtZC5zaXplX291
dDsJLyogYnl0ZXMgYWN0dWFsbHkgcmVjZWl2ZWQgKi8KPiAKPiBibGFuayBsaW5lIGhlcmUuCgpB
ZGRlZC4KCj4gKwlnc2xfaGRyID0gb2Zmc2V0b2Yoc3RydWN0IGN4bF9tYm94X2dldF9zdXBwb3J0
ZWRfbG9ncywgZW50cnkpOwo+IAo+IAlnc2xfaGRyX3NpemUgPSBzdHJ1Y3Rfb2Zmc2V0KGdzbCwg
ZW50cnkpOwo+IAo+IE5vdGUgdGhlIHNpemUgaXMgdG8gbWFrZSBpdCBjbGVhciB0aGlzIGlzbnQg
YSBwb2ludGVyIHRvIHRoZSBnc2wgaGVhZGVyLgoKQWdyZWVkIG9uIGJvdGg7IGl0IGlzIHN0cnVj
dF9vZmZzZXQoZ3NsLCBlbnRyeSkgbmFtZWQgZ3NsX2hkcl9zaXplIG5vdy4KCj4gKwltYXhfZW50
cmllcyA9IGdzbF9sZW4gPiBnc2xfaGRyID8KPiArCQkgICAgICAoZ3NsX2xlbiAtIGdzbF9oZHIp
IC8gc2l6ZW9mKGdzbC0+ZW50cnlbMF0pIDogMDsKPiAKPiBJJ2QgZXJyb3Igb3V0IGZpcnN0IG9u
IGl0IG5vdCBiZWluZyBiaWcgZW5vdWdoIGZvciB0aGUgaGVhZGVyLgo+IE5vdGhpbmcgZWxzZSB1
c2VmdWwgaXMgZ29pbmcgdG8gaGFwcGVuIGFuZCB3ZSBrbm93IGl0IHdpbGwgcmV0dXJuCj4gYW4g
ZXJyb3IgYW55d2F5LgoKRG9uZS4gIFRoYXQgcmVtb3ZlcyB0aGUgdGVybmFyeSBhbmQgdGhlIHVu
ZGVyZmxvdyBpdCB3YXMgZ3VhcmRpbmcsIHNvIHRoZQpjb21tZW50IGFib3V0IHdyYXBwaW5nIHdl
bnQgd2l0aCBpdDoKCglnc2xfaGRyX3NpemUgPSBzdHJ1Y3Rfb2Zmc2V0KGdzbCwgZW50cnkpOwoJ
aWYgKGdzbF9sZW4gPCBnc2xfaGRyX3NpemUpIHsKCQlkZXZfZXJyKGRldiwKCQkJIkdTTDogcmVz
cG9uc2Ugb2YgJXp1IGJ5dGVzIGlzIHRvbyBzaG9ydCBmb3IgdGhlIGhlYWRlclxuIiwKCQkJZ3Ns
X2xlbik7CgkJcmV0dXJuIC1FSU87Cgl9CgoJbWF4X2VudHJpZXMgPSAoZ3NsX2xlbiAtIGdzbF9o
ZHJfc2l6ZSkgLyBzaXplb2YoZ3NsLT5lbnRyeVswXSk7CgpJIHVzZWQgLUVJTyBiZWNhdXNlIHRo
YXQgaXMgd2hhdCBjeGxfaW50ZXJuYWxfc2VuZF9jbWQoKSByZXR1cm5zIGZvciBhIHBheWxvYWQK
c2l6ZSBtaXNtYXRjaDsgc2F5IGlmIHlvdSB3b3VsZCByYXRoZXIgaGF2ZSAtRU5YSU8gYW5kIEkg
d2lsbCBjaGFuZ2UgaXQuICBUaGUKY2FzZSBpcyByZWFjaGFibGU6IG1pbl9vdXQgaXMgMiBhbmQg
dGhlIGhlYWRlciBpcyA4IGJ5dGVzLCBzbyBhIHJlc3BvbnNlIG9mIDIKdG8gNyBieXRlcyBsYW5k
cyB0aGVyZS4KClRoYW5rcywKR2FvYmluCg==
