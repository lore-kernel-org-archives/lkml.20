Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC0838F636
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222176; cv=none; b=NEEaQsVg2TyHjVFCoX5AOO9BWsyoX9FWsY480G3SBOvi4G5qUg9GOOPQVsLr0z10J1G8Dbh0dDoQVyD9i/qqA3Ogk0jzmQsxpdh9AVdRjV9M/PRrK4HPrinOYdUOjuaAmJSu2ncKThKSoNwnfvln20gh8DAqO9+3M3ckRexNS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222176; c=relaxed/simple;
	bh=HKyrajglvkZym7GVxjZbY9UdP4w2Ty0ujD/pRoAfYBE=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=T0xj17Kl3P6ReKApQEvW8NDy1Zr11ikRZb7sXVJCAUCoIezWCK50xoA1LFQXnNEs3XE5ImUCRzzaPh6Oq8A4w1x+HQBBeZOyO5FsWO7wZhJOK5urgTNsEdmFOw1sDjtW8x1Ms5cQn4ah+hT/fJUXZngq4c2Za8F2jOFlVydxsH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oRm7JJB4; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oRm7JJB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=HKyrajglvkZym7GVxjZbY9UdP4w2Ty0ujD/pRoAfYBE=; b=o
	Rm7JJB4txNDoYAuBRgHgDpgCcjD6vBF81b/9PmMeC5Ve4Fqw4sxFqhJwJ0Dmcy2/
	ck7NQYzUwAaizmUmfZn6vsTDXL5j7IWCDxv9QSQXyjCpWaSQQVGs2JU/HkcHnOmH
	KQ7F9n0ectGaQWLkURK73mGI8WU0vPGdDqBLzkDbs8=
Date: Sat, 17 Oct 2026 15:29:10 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
	"Radu Rendec" <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 2/6] irqchip/gic-v3-its: validate MADT ITS entries
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141357.2793046-3-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
 <20261016141357.2793046-3-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUku5iSZbekdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JH46+Glb8VrgXrm+pkFOCPxQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <626e9340.182e.1a148c3bf1f.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgD3X4bGI9NqMPtaAA--.138W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQaJw2rTI8YH7QAA33
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAyMjoxMzo1MywgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgTUFEVCBJVFMgY2FsbGJhY2sgcmVhZHMgdGhlIHRyYW5zbGF0b3IgYmFzZSBh
ZGRyZXNzIGFuZCBJRCB3aXRob3V0Cj5jaGVja2luZyB0aGF0IGZpcm13YXJlIHN1cHBsaWVkIGEg
Y29tcGxldGUgZ2VuZXJpYyB0cmFuc2xhdG9yIHJlY29yZC4gQQo+dHJ1bmNhdGVkIGVudHJ5IGNh
biB0aGVyZWZvcmUgY2F1c2Ugb3V0LW9mLWJvdW5kcyByZWFkcy4KPgo+UmVqZWN0IGluY29tcGxl
dGUgSVRTIGVudHJpZXMgYmVmb3JlIGFjY2Vzc2luZyB0aGVpciB0eXBlZCBmaWVsZHMuCj4KCkZp
eGVzOiAzZjAxMGNmMTk3MzIgKCJpcnFjaGlwL2dpY3YzLWl0czogUHJvYmUgSVRTIGluIHRoZSBB
Q1BJIHdheSIpCgo+U2lnbmVkLW9mZi1ieTogSmlhbGUgWWFvIDx5YW9qaWFsZTAyQDE2My5jb20+
Cj4tLS0KPiBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My1pdHMuYyB8IDMgKysrCj4gMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlw
L2lycS1naWMtdjMtaXRzLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My1pdHMuYwo+aW5k
ZXggZTk4MDdhZjIzNTM3Li40ODVhNzkwZTQ4NTYgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL2lycWNo
aXAvaXJxLWdpYy12My1pdHMuYwo+KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMtaXRz
LmMKPkBAIC01NzI1LDYgKzU3MjUsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBnaWNfYWNwaV9wYXJz
ZV9tYWR0X2l0cyh1bmlvbiBhY3BpX3N1YnRhYmxlX2hlYWRlcnMgKmhlYWRlciwKPiAJaW50IGVy
cjsKPiAKPiAJaXRzX2VudHJ5ID0gKHN0cnVjdCBhY3BpX21hZHRfZ2VuZXJpY190cmFuc2xhdG9y
ICopaGVhZGVyOwo+KwlpZiAoQkFEX01BRFRfRU5UUlkoaXRzX2VudHJ5LCBlbmQpKQo+KwkJcmV0
dXJuIC1FSU5WQUw7Cj4rCj4gCW1lbXNldCgmcmVzLCAwLCBzaXplb2YocmVzKSk7Cj4gCXJlcy5z
dGFydCA9IGl0c19lbnRyeS0+YmFzZV9hZGRyZXNzOwo+IAlyZXMuZW5kID0gaXRzX2VudHJ5LT5i
YXNlX2FkZHJlc3MgKyBBQ1BJX0dJQ1YzX0lUU19NRU1fU0laRSAtIDE7Cj4tLSAKPjIuMzQuMQo=

