Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC41546EF93
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231299; cv=none; b=XQB2z6qnLVgtmUVFs5Y+Wmg9+5xqiD3MD3WneEPDuBBtJT4zl6q+jmv9+qjfacVqghNBkZ/gDE1CSo+AZJ5pVvB29wx1jL/LoRFysKCdUPMzELM8hUpDaCFh+nz64IgSP5y0J/c/f7+CsrdlbH27tKsppTUA/b9uOnd+K1RXTKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231299; c=relaxed/simple;
	bh=YbawAVaqfEsj2FEViDCMZVjK5TKuFAvjwsulFA3xoQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=NPeoz0AzaFO5hthijED9pfzKRX1fe9l8s55RFfW62NzdOcnimSbQSxjppVXcMttXjhQO+1GcTxrpMUu51W41U/PlAXRSsEcvGzCLZIJ5PD0ZrTdh0+ymFUOaDXl79F3ii8Ro7jtUheSxq1Y7ky5IbLf9f7ltdVw/vhc+hD1SQAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=hzWDSTaa; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="hzWDSTaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=YbawAVaqfEsj2FEViDCMZVjK5TKuFAvjwsulFA3xoQ0=; b=h
	zWDSTaaL7Cmk3RjO85542uQkwpa3SrBx1rbDwQGFGXvCfnWr9i1iTw79WtMW52w/
	xF8F8et0Wn/i35GUgHO8NELAsvINR9ft7hxlH4q8LwncSDzFvCTusCq/XNGMo8gx
	pSidfkU9z7/uqIJXPE6NlBE4sjh5H87i3IdtdqC9jw=
Date: Sat, 17 Oct 2026 18:00:47 +0800 (CST)
From: "Nanzhe Zhao" <nzzhao@126.com>
To: "Jaegeuk Kim" <jaegeuk@kernel.org>
Cc: "Nanzhe Zhao" <nzzhao.sigma@gmail.com>, "Barry Song" <baohua@kernel.org>,
	"Nanzhe Zhao" <zhaonanzhe@xiaomi.com>,
	"Juan Yescas" <jyescas@google.com>,
	"Daeho Jeong" <daehojeong@google.com>, "Dev Jain" <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	"David Hildenbrand" <David.Hildenbrand@arm.com>,
	"Pengfei Li" <lipengfei28@xiaomi.com>,
	"Bo Zhang" <zhangbo56@xiaomi.com>,
	"Kalesh Singh" <kaleshsingh@google.com>,
	"Ryan Roberts" <Ryan.Roberts@arm.com>,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re:Re: [f2fs-dev] [PATCH v5 00/16] f2fs: support & optimize large
 folios for writable files
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 126com
In-Reply-To: <atFFXafuVyyimmUk@google.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
 <atAO6ykqwGgZq77y@google.com> <atA24UMtAqkmz_R8@google.com>
 <63e416aa.2fb2.1a13d9f3491.Coremail.nzzhao@126.com>
 <atD9Csw1-lj5_SR_@google.com>
 <atFFXafuVyyimmUk@google.com>
X-NTES-SC: AL_Qu2SAP6Yvkov4SGaY+kdmEoVj+o8Xsaxs/8g2YJSc8gOtgfUwzsQWHZeElbTwO69ABq9sQGSYCZS08NTWLJTHKNy3WMTlzx+bywRu/+17A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <15373a26.1e3d.1a1494e8d1a.Coremail.nzzhao@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cSkvCgD3V6tPR9NqOWVRAA--.41986W
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsQ90RGrTR0+9fgAA38
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKSGkgSmFlZ3VrLArCoMKgCsKgIEkgYW0gdHJ5aW5nIHRvIHJlcHJvZHVjZSB0aGUgZmFpbHVy
ZSBpbiB5b3VyIGxvZzogc2QgMDowOjA6NDogUmV0cnlpbmcgdW5hbGlnbmVkIHdyaXRlIGZvciB6
b25lIDI2Mzkg4oaSIGNyaXRpY2FsIHRhcmdldCBlcnJvciDihpIgc2RlOgrCoCB6b25lIDI2Mzk6
IEFib3J0aW5nIHBsdWdnZWQgQklPcyDihpIgZjJmc19zdG9wX2NoZWNrcG9pbnQgKGtlcm5lbCA2
LjEyLjgxLWFuZHJvaWQxNi02KSBhbmQgZ290IHR3byB0d28gcXVlc3Rpb25zLgrCoMKgCsKgIDEu
IEtlcm5lbCBiYXNlbGluZS4gQ291bGQgeW91IGNvbmZpcm0gdGhhdCB0aGUga2VybmVsIHlvdSB0
ZXN0ZWQgaGFzIEJhcnQgVmFuIEFzc2NoZSdzIHpvbmVkIHdyaXRlIHBpcGVsaW5pbmcsIGkuZS4g
bXVsdGlwbGUgaW4tZmxpZ2h0CsKgIHNlcXVlbnRpYWwgd3JpdGVzIHBlciB6b25lLCB3aXRoIHRo
ZSBvcmRlciBrZXB0IGJ5IEJMS19GRUFUX09SREVSRURfSFdRIGFuZCB0aGUgcGVyLXpvbmUgZnJv
bV9jcHUgaW4gYmxvY2svYmxrLXpvbmVkLmM/IEFuZCB0aGF0IGl0CsKgIGRvZXMgbm90IGluY2x1
ZGUgdGhlc2UgdGhyZWUgZm9sbG93LXVwIGZpeGVzOgrCoMKgCsKgIC0gIkFORFJPSUQ6IGJsb2Nr
OiBQcmVzZXJ2ZSB0aGUgc3VibWlzc2lvbiBvcmRlciBvZiB6b25lZCB3cml0ZXMiCsKgIC0gIkFO
RFJPSUQ6IGJsb2NrOiBQcmVzZXJ2ZSB0aGUgb3JkZXIgb2Ygem9uZWQgUkVRX0ZVQSB3cml0ZXMi
CsKgIC0gIkFORFJPSUQ6IGJsb2NrOiBSZXN0b3JlIHRoZSB3cml0ZSBwb2ludGVyIG9mZnNldCBj
aGVjayIKwqDCoArCoCBJbiBBT1NQIHRoZXkgYXJlIDA1MGRlNTcwZiwgYzYxNmY3YzFhLCBkNTA2
MDFkMGYgb24gYW5kcm9pZDE2LTYuMTIsIGFuZCA2MDY4ZWQ5ZjAsIGQ3ODZmODYwOSwgZjA4NDMw
ZjgwIG9uIGFuZHJvaWQxNy02LjE4LiBUaGUKwqAgc2ltcGxlc3QgY2hlY2sgaXMgd2hldGhlciBS
RVFfWk9ORV9TRVJJQUxJWkVEIGFuZCB3b3JrX2J1c3koJnp3cGx1Zy0+YmlvX3dvcmspIGFwcGVh
ciBpbiB5b3VyIGJsb2NrL2Jsay16b25lZC5jLiBUaGUgb3V0cHV0IG9mIGdpdCBsb2cKwqAgLS1v
bmVsaW5lIC0tIGJsb2NrL2Jsay16b25lZC5jIHdvdWxkIGFsc28gZG8uCsKgwqAKwqAgMi4gVGVz
dCB3b3JrbG9hZC4gSWYgdGhhdCBpcyB0aGUgY2FzZSwgY291bGQgeW91IHNoYXJlIHRoZSB0ZXN0
IHdvcmtsb2FkIHRoYXQgdHJpZ2dlcnMgaXQ/wqAgU28gZmFyIEkgaGF2ZSBub3QgYmVlbiBhYmxl
IHRvIHJlcHJvZHVjZSBpdCB1c2luZyBudWxsX2JsayB0byBzaW11bGF0ZcKgCnpvbmUgZGV2aWNl
cyB3aXRoIHFlbXUgYW5kIGFuZHJvaWQxNy02LjE4IGdraSBrZXJuZWwuIEFueSBzdWdnZXN0aW9u
cyB3b3VsZCBiZSBtdWNoIGFwcHJlY2lhdGVkLgpUaGFua3Ms
