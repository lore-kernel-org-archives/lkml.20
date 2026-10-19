Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A43346ADB;
	Mon, 19 Oct 2026 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398685; cv=none; b=ZLKdLNO54ohcT/QjAmQrC/wu2VWdCVITktbwlbaHiCcWQX89yV++oN7BG6++fQ3b+cNayNfnv/bdGBKiS7Vv5l0wUGUsGbWcyNiEcn5ksFsieqhwn17axtDWd4VZHjr5Eicftz5Uj7se9ibCI+kytjXoV41eKvDD0Sdi7APSpuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398685; c=relaxed/simple;
	bh=IaDoVIhFumhvjvfFsGDYQfKMeoHMs8XG9grWqugVlfY=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=CP4vU5MR/Vf0R95dFZjYsvT+FaBAUG7aTKtdJr49a1cDMKPIdGpXvU1usKzZC0KK56FfmWDDE4N39wYArQXmtaqd11uf6xwPl4kATdY5yV5LtwXqgXgAwG1AM0bh9eZhuWD/ShWNJAEdk25+iiny7PemyQAd6xu419xGkhNz+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Lb/oag14; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Lb/oag14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=IaDoVIhFumhvjvfFsGDYQfKMeoHMs8XG9grWqugVlfY=; b=L
	b/oag14J+si+qWoAvcKx9Qhwr4XOHkyJechbW/wfe3XLlf0dW1ZMEJyB+0oKub6X
	yBiUAzRIUHf4QaX77Nwqu3v/V/HKxyvsyCIJ97PPZnRmvpLJ/65niurymCyprMY7
	ZH8yNT3zAHA2Z4ynHfJUOk57i7RqSERULs17nXxumg=
Date: Mon, 19 Oct 2026 16:31:09 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Ming Qian" <ming.qian@nxp.com>, "Zhou Peng" <eagle.zhou@nxp.com>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 1/2] media: amphion: handle core runtime resume failures
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261019082754.1806443-2-yaojiale02@163.com>
References: <20261019082754.1806443-1-yaojiale02@163.com>
 <20261019082754.1806443-2-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP+St04t7yafbekcn08ShO49XMOyvfoi2YFTc+sEsgbPyy4KU3RyIkLM8cuONRuwiCKtbD1I7O9AZ4B6oLgdbofoj73BjULeu0ccng==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <14fa9461.7966.1a153493777.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgD3XyNN1dVqnupbAA--.1242W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8A2Y0mrV1U105AAA3A
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xOSAxNjoyNzo1MywgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgY29yZSByZXF1ZXN0IGFuZCByZXN1bWUgcGF0aHMgY29udGludWUgd2l0aCBW
UFUgc3RhdGUgYW5kIGhhcmR3YXJlCj5hY2Nlc3MgYWZ0ZXIgcG1fcnVudGltZV9yZXN1bWVfYW5k
X2dldCgpIGZhaWxzLiBBIGZhaWxlZCBydW50aW1lIHJlc3VtZQo+bGVhdmVzIHRoZSBkZXZpY2Ug
dW5hdmFpbGFibGUsIHNvIHRob3NlIGFjY2Vzc2VzIGNhbiBmYWlsIGFuZCB0aGUgbGF0ZXIKPnJ1
bnRpbWUgUE0gcHV0IGRvZXMgbm90IG1hdGNoIGFuIGFjcXVpcmVkIHJlZmVyZW5jZS4KPgo+Q2hl
Y2sgdGhlIHJ1bnRpbWUgcmVzdW1lIHJlc3VsdCBiZWZvcmUgYWNjZXNzaW5nIHRoZSBWUFUuIFJl
bGVhc2UgdGhlCj5jb3JlIGxvY2sgYW5kIHJldHVybiB3aXRob3V0IHRvdWNoaW5nIHRoZSBoYXJk
d2FyZSB3aGVuIHJlc3VtZSBmYWlscy4KPgoKRml4ZXM6IGY0NDUwMTRhMjI5MSAoIm1lZGlhOiBh
bXBoaW9uOiBmaXggYW4gaXNzdWUgdGhhdCB1c2luZyBwbV9ydW50aW1lX2dldF9zeW5jIGluY29y
cmVjdGx5IikKCj5TaWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4K
Pi0tLQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfY29yZS5jIHwgMTMgKysr
KysrKysrKystLQo+IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9j
b3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24vdnB1X2NvcmUuYwo+aW5kZXgg
YWQ1NGYwMTRkOC4uM2Q3MTQ0MjgwNyAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vYW1waGlvbi92cHVfY29yZS5jCj4rKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhp
b24vdnB1X2NvcmUuYwo+QEAgLTM3Miw3ICszNzIsMTIgQEAgc3RydWN0IHZwdV9jb3JlICp2cHVf
cmVxdWVzdF9jb3JlKHN0cnVjdCB2cHVfZGV2ICp2cHUsIGVudW0gdnB1X2NvcmVfdHlwZSB0eXBl
KQo+IAkJZ290byBleGl0Owo+IAo+IAltdXRleF9sb2NrKCZjb3JlLT5sb2NrKTsKPi0JcG1fcnVu
dGltZV9yZXN1bWVfYW5kX2dldChjb3JlLT5kZXYpOwo+KwlyZXQgPSBwbV9ydW50aW1lX3Jlc3Vt
ZV9hbmRfZ2V0KGNvcmUtPmRldik7Cj4rCWlmIChyZXQgPCAwKSB7Cj4rCQltdXRleF91bmxvY2so
JmNvcmUtPmxvY2spOwo+KwkJY29yZSA9IE5VTEw7Cj4rCQlnb3RvIGV4aXQ7Cj4rCX0KPiAKPiAJ
aWYgKGNvcmUtPnN0YXRlID09IFZQVV9DT1JFX0RFSU5JVCkgewo+IAkJaWYgKHZwdV9pZmFjZV9n
ZXRfcG93ZXJfc3RhdGUoY29yZSkpCj5AQCAtNzYwLDcgKzc2NSwxMSBAQCBzdGF0aWMgaW50IF9f
bWF5YmVfdW51c2VkIHZwdV9jb3JlX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gCWludCBy
ZXQgPSAwOwo+IAo+IAltdXRleF9sb2NrKCZjb3JlLT5sb2NrKTsKPi0JcG1fcnVudGltZV9yZXN1
bWVfYW5kX2dldChkZXYpOwo+KwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGRldik7
Cj4rCWlmIChyZXQgPCAwKSB7Cj4rCQltdXRleF91bmxvY2soJmNvcmUtPmxvY2spOwo+KwkJcmV0
dXJuIHJldDsKPisJfQo+IAl2cHVfY29yZV9nZXRfdnB1KGNvcmUpOwo+IAo+IAlpZiAoY29yZS0+
cmVxdWVzdF9jb3VudCkgewo+LS0gCj4yLjM0LjEK
