Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2690A41A4F9
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221641; cv=none; b=lmXdoXp9ExrO21ncGRufw3R/S/Nk30qwZd8QjBJYtyPci6HS7X1oFROzBUDdlDrjSCRvW8AzY4KC/hYjC+YCzINsWoVzsNvLDPNlMxodW9YWPsBMXS/rSYNDGhOYIit/tC1zVx6bApePwPm+Ghn89ZfR0tIcaWRs1IlEMQjnNd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221641; c=relaxed/simple;
	bh=wK8zhpbKf03va39fLgZs7nlEQWK7EIsFXJx69/DDCyE=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=l+Tz0V+bUn4njzs/dVThYiI3lCl8Vv2SviYSmE+0EpGEqai3pgaloPYexdY4NqnIMAYOtTLA+WRanfDo57z7YUfhbnqiuFWhBhdb7PZ1YQi73yzn4eUUKlnduDbQukqSQVPIb3h9n3ci42NfEYUF1eVf66SxmClwk7Svhaxsdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=X1Pnis5A; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="X1Pnis5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=wK8zhpbKf03va39fLgZs7nlEQWK7EIsFXJx69/DDCyE=; b=X
	1Pnis5AcuX2taFW48lw9jUk6msB3Pm1nsDtw3IivpOT3gMB6EmC6NZB8vk7ggosL
	7jPRKaM32UUA6QCs2UzrrT2blVu1SeHCv/X0u2Y5nZ0ogMWfq5DQVhZ43toEiw70
	/f5bakpt8NDGVTIoG7TIR8XhVVvtpGaJD/6HCTY+6Q=
Date: Sat, 17 Oct 2026 15:20:25 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH 2/2] mfd: tps65010: queue I/O work on freezable workqueue
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016100503.2581955-3-yaojiale02@163.com>
References: <20261016100503.2581955-1-yaojiale02@163.com>
 <20261016100503.2581955-3-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6Zvk4p4yKRYukdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JH/ks/6Tfh3fVMat4grsz6vQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <18acd2b2.17aa.1a148bbbbdc.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgD3_3K5IdNqhPpaAA--.132W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRkGQGrTIbnsdgAA3p
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAxODowNTowMywgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgVFBTNjUwMTAgZXZlbnQgd29ya2VyIHBlcmZvcm1zIFNNQnVzIHRyYW5zZmVy
cyBhbmQgY2FuIHJlc2NoZWR1bGUKPml0c2VsZiB0byBwb2xsIHRoZSBjaGFyZ2luZyBzdGF0ZS4g
VGhlIHBvd2VyLWVmZmljaWVudCBzeXN0ZW0gd29ya3F1ZXVlCj5pcyBub3QgZnJlZXphYmxlLCBz
byBwZW5kaW5nIHdvcmsgY2FuIGFjY2VzcyBhbiBJMkMgYWRhcHRlciBhZnRlciBpdCBoYXMKPmJl
ZW4gc3VzcGVuZGVkLgo+Cj5Vc2UgdGhlIGZyZWV6YWJsZSBwb3dlci1lZmZpY2llbnQgd29ya3F1
ZXVlIGZvciBldmVyeSBzY2hlZHVsaW5nIHBhdGguCj5UaGlzIHByZXNlcnZlcyB0aGUgcG93ZXIt
ZWZmaWNpZW50IGJlaGF2aW9yIHdoaWxlIGZyZWV6aW5nIEkvTyBhY3Jvc3MKPnN5c3RlbSBzdXNw
ZW5kLgo+CgpGaXhlczogNzJjZDc5OTU0NGYyICgiW1BBVENIXSBJMkM6IGFkZCBpMmMgZHJpdmVy
IGZvciBUUFM2NTAxeCIpCgo+U2lnbmVkLW9mZi1ieTogSmlhbGUgWWFvIDx5YW9qaWFsZTAyQDE2
My5jb20+Cj4tLS0KPiBkcml2ZXJzL21mZC90cHM2NTAxMC5jIHwgMTAgKysrKystLS0tLQo+IDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1n
aXQgYS9kcml2ZXJzL21mZC90cHM2NTAxMC5jIGIvZHJpdmVycy9tZmQvdHBzNjUwMTAuYwo+aW5k
ZXggOGExNDRlYzUyMjAxLi5iMDM4ZDY3ZmY3MTUgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL21mZC90
cHM2NTAxMC5jCj4rKysgYi9kcml2ZXJzL21mZC90cHM2NTAxMC5jCj5AQCAtMjMwLDcgKzIzMCw3
IEBAIHN0YXRpYyBpbnQgZGJnX3Nob3coc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICpfKQo+IAlz
ZXFfcHJpbnRmKHMsICJtYXNrMiAgICAgJXNcbiIsIGJ1Zik7Cj4gCS8qIGlnbm9yZSBhY2tpbnQy
ICovCj4gCj4tCXF1ZXVlX2RlbGF5ZWRfd29yayhzeXN0ZW1fcG93ZXJfZWZmaWNpZW50X3dxLCAm
dHBzLT53b3JrLAo+KwlxdWV1ZV9kZWxheWVkX3dvcmsoc3lzdGVtX2ZyZWV6YWJsZV9wb3dlcl9l
ZmZpY2llbnRfd3EsICZ0cHMtPndvcmssCj4gCQkJICAgUE9XRVJfUE9MTF9ERUxBWSk7Cj4gCj4g
CS8qIFZNQUlOIHZvbHRhZ2UsIGVuYWJsZSBsb3dwb3dlciwgZXRjICovCj5AQCAtMzg4LDcgKzM4
OCw3IEBAIHN0YXRpYyB2b2lkIHRwczY1MDEwX2ludGVycnVwdChzdHJ1Y3QgdHBzNjUwMTAgKnRw
cykKPiAJCQkmJiAodHBzLT5jaGdzdGF0dXMgJiAoVFBTX0NIR19VU0J8VFBTX0NIR19BQykpKQo+
IAkJcG9sbCA9IDE7Cj4gCWlmIChwb2xsKQo+LQkJcXVldWVfZGVsYXllZF93b3JrKHN5c3RlbV9w
b3dlcl9lZmZpY2llbnRfd3EsICZ0cHMtPndvcmssCj4rCQlxdWV1ZV9kZWxheWVkX3dvcmsoc3lz
dGVtX2ZyZWV6YWJsZV9wb3dlcl9lZmZpY2llbnRfd3EsICZ0cHMtPndvcmssCj4gCQkJCSAgIFBP
V0VSX1BPTExfREVMQVkpOwo+IAo+IAkvKiBhbHNvIHBvdGVudGlhbGx5IGdwaW8taW4gcmlzZSBv
ciBmYWxsICovCj5AQCAtNDM2LDcgKzQzNiw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB0cHM2NTAx
MF9pcnEoaW50IGlycSwgdm9pZCAqX3RwcykKPiAKPiAJZGlzYWJsZV9pcnFfbm9zeW5jKGlycSk7
Cj4gCXNldF9iaXQoRkxBR19JUlFfRU5BQkxFLCAmdHBzLT5mbGFncyk7Cj4tCXF1ZXVlX2RlbGF5
ZWRfd29yayhzeXN0ZW1fcG93ZXJfZWZmaWNpZW50X3dxLCAmdHBzLT53b3JrLCAwKTsKPisJcXVl
dWVfZGVsYXllZF93b3JrKHN5c3RlbV9mcmVlemFibGVfcG93ZXJfZWZmaWNpZW50X3dxLCAmdHBz
LT53b3JrLCAwKTsKPiAJcmV0dXJuIElSUV9IQU5ETEVEOwo+IH0KPiAKPkBAIC02OTQsNyArNjk0
LDggQEAgaW50IHRwczY1MDEwX3NldF92YnVzX2RyYXcodW5zaWduZWQgbUEpCj4gCQkJJiYgdGVz
dF9hbmRfc2V0X2JpdCgKPiAJCQkJRkxBR19WQlVTX0NIQU5HRUQsICZ0aGVfdHBzLT5mbGFncykp
IHsKPiAJCS8qIGdhZGdldCBkcml2ZXJzIGNhbGwgdGhpcyBpbl9pcnEoKSAqLwo+LQkJcXVldWVf
ZGVsYXllZF93b3JrKHN5c3RlbV9wb3dlcl9lZmZpY2llbnRfd3EsICZ0aGVfdHBzLT53b3JrLAo+
KwkJcXVldWVfZGVsYXllZF93b3JrKHN5c3RlbV9mcmVlemFibGVfcG93ZXJfZWZmaWNpZW50X3dx
LAo+KwkJCQkgICAmdGhlX3Rwcy0+d29yaywKPiAJCQkJICAgMCk7Cj4gCX0KPiAJbG9jYWxfaXJx
X3Jlc3RvcmUoZmxhZ3MpOwo+QEAgLTEwNTIsNCArMTA1MywzIEBAIHN0YXRpYyB2b2lkIF9fZXhp
dCB0cHNfZXhpdCh2b2lkKQo+IAlpMmNfZGVsX2RyaXZlcigmdHBzNjUwMTBfZHJpdmVyKTsKPiB9
Cj4gbW9kdWxlX2V4aXQodHBzX2V4aXQpOwo+LQo+LS0gCj4yLjM0LjEK
