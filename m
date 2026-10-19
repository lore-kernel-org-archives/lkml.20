Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA97498E00;
	Mon, 19 Oct 2026 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398713; cv=none; b=t4Mrvg5NVtgxh5ac0+tPMsoZaznhBKhSMrSNeZW4ASov62BBewZtGCeRNlhZkKHhclTK9/5He0Zl0TqyWSp4x0mkLZ+VHpuY5jmCMaQWDS1X39OUIUmp9HY4q3cpZwVM4xRWuvq0a+GCSp/kUJhN9OjlZ/GjI2CXKoOrVtlmATk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398713; c=relaxed/simple;
	bh=Leh50SvBY86fxbEEdSy2xlT0QS4Rh4SWeQrgAgheDaM=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ZRrr8lc9PwZAyxrYExV38XYldb+fB8OTyf6x4RP5koY9hDUDRBOeMKoaoX2WAAgNbEbJTmFdXZZAsR7+I8MNaRH6gAqeSutQ2eDOMqyBLqxcSsFxUbOy0ejMkxHxjc0jUygrnrta6IUDM82l2pUczhGQJB2xNtmCizpNhK6b5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qeR0rgIg; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qeR0rgIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Leh50SvBY86fxbEEdSy2xlT0QS4Rh4SWeQrgAgheDaM=; b=q
	eR0rgIg7W9TEZ4K+9f/yvAJLZGYZmfrm7IFJRc4y+/LnDluQJTZaUXnvBmdUGKVg
	/hDtDr4DoxJzKpppn87XzaM2fnAmO1fjhcByOHqzrYQ0zhf2wzXMhngm7jESjzSf
	pN6nV3UFZ38H/5Vocp/y4z4fSBYkzybZbarJ47Ku84=
Date: Mon, 19 Oct 2026 16:31:39 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Ming Qian" <ming.qian@nxp.com>, "Zhou Peng" <eagle.zhou@nxp.com>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH 2/2] media: amphion: handle debug runtime resume failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261019082754.1806443-3-yaojiale02@163.com>
References: <20261019082754.1806443-1-yaojiale02@163.com>
 <20261019082754.1806443-3-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP+St04i7yiaZOkcn08ShO49XMOyvfoi2YFTc+sEsgbPyy4KU3RyIkLM8cuONRuwiCKtbD1I7O9AZ4B6BQHFjNyDint8AoXvGzKGQg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <735f8b3a.7990.1a15349ad37.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgD3dwpr1dVq1epbAA--.1290W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Auf2WrV1Wt4QwAA3H
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xOSAxNjoyNzo1NCwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgZGVidWdmcyBjb3JlIHdyaXRlIGhhbmRsZXIgcmVhZHMgdGhlIFZQVSBwb3dl
ciBzdGF0ZSBhZnRlcgo+cG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGZhaWxzLiBUaGUgZGV2
aWNlIG1heSBiZSB1bmF2YWlsYWJsZSBhZnRlcgo+YSBmYWlsZWQgcnVudGltZSByZXN1bWUsIGFu
ZCB0aGUgZmluYWwgcnVudGltZSBQTSBwdXQgZG9lcyBub3QgbWF0Y2ggYW4KPmFjcXVpcmVkIHJl
ZmVyZW5jZS4KPgo+UmV0dXJuIHRoZSByZXN1bWUgZXJyb3IgYmVmb3JlIHRha2luZyB0aGUgY29y
ZSBsb2NrIG9yIGFjY2Vzc2luZyBWUFUKPmhhcmR3YXJlLgo+CgpGaXhlczogZjQ0NTAxNGEyMjkx
ICgibWVkaWE6IGFtcGhpb246IGZpeCBhbiBpc3N1ZSB0aGF0IHVzaW5nIHBtX3J1bnRpbWVfZ2V0
X3N5bmMgaW5jb3JyZWN0bHkiKQoKPlNpZ25lZC1vZmYtYnk6IEppYWxlIFlhbyA8eWFvamlhbGUw
MkAxNjMuY29tPgo+LS0tCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9kYmcu
YyB8IDYgKysrKystCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9k
YmcuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfZGJnLmMKPmluZGV4IDQ5
N2FlNGU4YTIuLmZmZjRkZjRmNDUgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L2FtcGhpb24vdnB1X2RiZy5jCj4rKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhpb24v
dnB1X2RiZy5jCj5AQCAtMzgyLDggKzM4MiwxMiBAQCBzdGF0aWMgc3NpemVfdCB2cHVfZGJnX2Nv
cmVfd3JpdGUoc3RydWN0IGZpbGUgKmZpbGUsCj4gewo+IAlzdHJ1Y3Qgc2VxX2ZpbGUgKnMgPSBm
aWxlLT5wcml2YXRlX2RhdGE7Cj4gCXN0cnVjdCB2cHVfY29yZSAqY29yZSA9IHMtPnByaXZhdGU7
Cj4rCWludCByZXQ7Cj4rCj4rCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoY29yZS0+
ZGV2KTsKPisJaWYgKHJldCA8IDApCj4rCQlyZXR1cm4gcmV0Owo+IAo+LQlwbV9ydW50aW1lX3Jl
c3VtZV9hbmRfZ2V0KGNvcmUtPmRldik7Cj4gCW11dGV4X2xvY2soJmNvcmUtPmxvY2spOwo+IAlp
ZiAodnB1X2lmYWNlX2dldF9wb3dlcl9zdGF0ZShjb3JlKSAmJiAhY29yZS0+cmVxdWVzdF9jb3Vu
dCkgewo+IAkJZGV2X2luZm8oY29yZS0+ZGV2LCAicmVzZXRcbiIpOwo+LS0gCj4yLjM0LjEK
