Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E93E5A0C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221961; cv=none; b=kARmpkTxQ6tb8KixwKm/ynfxK8uHOw9ALstewvE1s2VqDHZzsJ+13reuZC5jQiB+XTMrjhY03aMsmDvm+r9E1jHTBi3IIahyDHUv0TdQnJXge+yTmD/At/nzBLYmrygKDyTZs4gzfHLU8QqG3SMmbsiqrUkRFoh3/DvM2xhV4Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221961; c=relaxed/simple;
	bh=ewuZS2LJoV706wzysln/YWmht6PjItoyLpPQRx9kbB0=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=CZfpqagSq2Au080yJA6a2UZJMOom5a1jghnr5PaPEgFTW7oE+ydrlA36CN2vAEqygEbB2nYOCZyvb0Og1OB+EM6eFQapqJFozVmLqEmLeIudALxauEIfO6sweqdyrtxb//2zQB2+/ueFlOakvW7e3w2CWTqiaFDQUXwQ3WO6vMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lvs9pdhp; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lvs9pdhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ewuZS2LJoV706wzysln/YWmht6PjItoyLpPQRx9kbB0=; b=l
	vs9pdhpXAxF45CzbDkGjtggXjVH3zOSWw0nYR1CpOfZdZNWQXUPvqLLVHRYF8q2x
	OoTsJJJUfGYOaYJ/X2x37YXh9HgWyC2rKsSTt9gDCZ3LUpWSD+zY3FGw8HFz1FRb
	20eSKNT798uA/vTFXOEy1Xp5K6pYpurxX6As+Wmx4w=
Date: Sat, 17 Oct 2026 15:25:20 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH 1/2] riscv: validate RINTC entries before use
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141249.2791819-2-yaojiale02@163.com>
References: <20261016141249.2791819-1-yaojiale02@163.com>
 <20261016141249.2791819-2-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvkEp5ieYZOkdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHbCwH52DkjYoSYRnetF+bJw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <37a131ae.17f0.1a148c03dc7.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgDnX2XgItNq3vpaAA--.127W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQBQimrTIuD8GAAA3I
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAyMjoxMjo0NywgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgUklOVEMgcGFyc2VyIHJlYWRzIHRoZSBmbGFncyBmaWVsZCBiZWZvcmUgY2hl
Y2tpbmcgdGhhdCB0aGUgTUFEVAo+ZW50cnkgY29udGFpbnMgYSBjb21wbGV0ZSBSSU5UQyBzdHJ1
Y3R1cmUuIEEgdHJ1bmNhdGVkIGZpcm13YXJlIHJlY29yZAo+Y2FuIHRoZXJlZm9yZSB0cmlnZ2Vy
IGFuIG91dC1vZi1ib3VuZHMgcmVhZCBkdXJpbmcgZWFybHkgQ1BVIGRpc2NvdmVyeS4KPgo+TW92
ZSB0aGUgZXhpc3RpbmcgQkFEX01BRFRfRU5UUlkoKSBjaGVjayBhaGVhZCBvZiB0aGUgZmlyc3Qg
dHlwZWQgZmllbGQKPmFjY2Vzcy4KPgoKRml4ZXM6IGNlOTI1NDZjZDYzNyAoIlJJU0MtVjogc21w
Ym9vdDogQWRkIEFDUEkgc3VwcG9ydCBpbiBzZXR1cF9zbXAoKSIpCgo+U2lnbmVkLW9mZi1ieTog
SmlhbGUgWWFvIDx5YW9qaWFsZTAyQDE2My5jb20+Cj4tLS0KPiBhcmNoL3Jpc2N2L2tlcm5lbC9z
bXBib290LmMgfCA2ICsrKy0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPmluZGV4IGE5ZGUyZGFlODA0Yy4uOWMzNDEz
OTgwNThjIDEwMDY0NAo+LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jCj4rKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPkBAIC03Niw2ICs3Niw5IEBAIHN0YXRpYyBpbnQg
X19pbml0IGFjcGlfcGFyc2VfcmludGModW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFk
ZXIsIGNvbnN0IHVuCj4gCXN0YXRpYyBib29sIGZvdW5kX2Jvb3RfY3B1Owo+IAlzdHJ1Y3QgYWNw
aV9tYWR0X3JpbnRjICpwcm9jZXNzb3IgPSAoc3RydWN0IGFjcGlfbWFkdF9yaW50YyAqKWhlYWRl
cjsKPiAKPisJaWYgKEJBRF9NQURUX0VOVFJZKHByb2Nlc3NvciwgZW5kKSkKPisJCXJldHVybiAt
RUlOVkFMOwo+Kwo+IAkvKgo+IAkgKiBFYWNoIFJJTlRDIHN0cnVjdHVyZSBpbiBNQURUIHdpbGwg
aGF2ZSBhIGZsYWcuIElmIEFDUElfTUFEVF9FTkFCTEVECj4gCSAqIGJpdCBpbiB0aGUgZmxhZyBp
cyBub3QgZW5hYmxlZCwgaXQgbWVhbnMgT1Mgc2hvdWxkIG5vdCB0cnkgdG8gZW5hYmxlCj5AQCAt
ODQsOSArODcsNiBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNlX3JpbnRjKHVuaW9uIGFj
cGlfc3VidGFibGVfaGVhZGVycyAqaGVhZGVyLCBjb25zdCB1bgo+IAlpZiAoIShwcm9jZXNzb3It
PmZsYWdzICYgQUNQSV9NQURUX0VOQUJMRUQpKQo+IAkJcmV0dXJuIDA7Cj4gCj4tCWlmIChCQURf
TUFEVF9FTlRSWShwcm9jZXNzb3IsIGVuZCkpCj4tCQlyZXR1cm4gLUVJTlZBTDsKPi0KPiAJYWNw
aV90YWJsZV9wcmludF9tYWR0X2VudHJ5KCZoZWFkZXItPmNvbW1vbik7Cj4gCj4gCWhhcnQgPSBw
cm9jZXNzb3ItPmhhcnRfaWQ7Cj4tLSAKPjIuMzQuMQo=
