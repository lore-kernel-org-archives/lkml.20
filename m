Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436233ED11D
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792221728; cv=none; b=h5fhFgslFp2HQIBYmGnuppNZQz+nx+/SfGL2Z+oh786hWk36PdYATiIKpk/oGfe9ewzJC+2Rw45UVqHRkOwjyYuAAbxHLzJdt9ob2tUt4jYWn3l7vYKPCW4Hff/jkRxw2EfuotPf82+3gw0dMsD3AtoXfSQuLnYytO3y31XfCd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792221728; c=relaxed/simple;
	bh=4f6tJyPDIFkFXokkf4nuujJvmekxZFXlrwvk3ZH/79M=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=LJ3CzxqfzUM5tmsaVUWkJDN3wM9VBJwBNMgoasYkF235QLlGi7aSEVIOML+G7nS5wQchTaaxoV9XkYNSPTJ0hLlDp7aYXYkaAlWs6O9IqS60oZgDsHzQw4ET6mpG3Zj6UQAGoKbQMrjFmuPGFqGLj0Zi8zWFvq+RPudpLKa6I4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gsIqmvTc; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gsIqmvTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=4f6tJyPDIFkFXokkf4nuujJvmekxZFXlrwvk3ZH/79M=; b=g
	sIqmvTcHDtqH1A7uD9X6fM3MfaANDfRhI+F4kxpJ1rkcwa4aC5n5vU5f9LArYmdv
	m0qYIdOYqOvJMxjeyvYvge5OHUmk+6/71aKYbHTiLJG4XynP3Un8Dy1XpAyRz8N1
	C4yuCEuGTKkcOqWTWo1aEsgNNIltLouH7Q76Bc0GQQ=
Date: Sat, 17 Oct 2026 15:21:56 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH 1/2] regulator: core: freeze deferred disable work during
 suspend
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016100522.2582557-2-yaojiale02@163.com>
References: <20261016100522.2582557-1-yaojiale02@163.com>
 <20261016100522.2582557-2-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6Zvk8q4CmbZ+kdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHeMd81SH4TKM0zVmh/gU8zg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <242bbb5b.17ba.1a148bd21d3.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgBXr1IVItNqnPpaAA--.131W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRUdV2rTIhXxzwAA3i
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAxODowNToyMSwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5yZWd1bGF0b3JfZGlzYWJsZV9kZWZlcnJlZCgpIHNjaGVkdWxlcyBoYXJkd2FyZSBh
Y2Nlc3MgYWZ0ZXIgYQo+Y2FsbGVyLXByb3ZpZGVkIGRlbGF5LiBUaGUgcG93ZXItZWZmaWNpZW50
IHN5c3RlbSB3b3JrcXVldWUgcmVtYWlucwo+YWN0aXZlIGR1cmluZyBzeXN0ZW0gc3VzcGVuZCwg
c28gZGVmZXJyZWQgcmVndWxhdG9yIG9wZXJhdGlvbnMgY2FuIHJlYWNoCj5hIGJ1cyBhZnRlciBp
dHMgY29udHJvbGxlciBoYXMgYmVlbiBzdXNwZW5kZWQuCj4KPlVzZSB0aGUgZnJlZXphYmxlIHBv
d2VyLWVmZmljaWVudCB3b3JrcXVldWUgdG8gcHJlc2VydmUgdGhlIGV4aXN0aW5nCj5wb3dlciBw
b2xpY3kgd2hpbGUgZGVmZXJyaW5nIHJlZ3VsYXRvciBhY2Nlc3MgdW50aWwgZGV2aWNlcyBoYXZl
IHJlc3VtZWQuCj4KCkZpeGVzOiBkYTA3ZWNkOTNiMTkgKCJyZWd1bGF0b3I6IEltcGxlbWVudCBk
ZWZlcnJlZCBkaXNhYmxlIHN1cHBvcnQiKQoKPlNpZ25lZC1vZmYtYnk6IEppYWxlIFlhbyA8eWFv
amlhbGUwMkAxNjMuY29tPgo+LS0tCj4gZHJpdmVycy9yZWd1bGF0b3IvY29yZS5jIHwgMyArKy0K
PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPmRpZmYg
LS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9jb3Jl
LmMKPmluZGV4IDZhNDAwOGYzODdiNS4uMzE3ZjAyNjk2ZTQ3IDEwMDY0NAo+LS0tIGEvZHJpdmVy
cy9yZWd1bGF0b3IvY29yZS5jCj4rKysgYi9kcml2ZXJzL3JlZ3VsYXRvci9jb3JlLmMKPkBAIC0z
NDY1LDcgKzM0NjUsOCBAQCBpbnQgcmVndWxhdG9yX2Rpc2FibGVfZGVmZXJyZWQoc3RydWN0IHJl
Z3VsYXRvciAqcmVndWxhdG9yLCBpbnQgbXMpCj4gCj4gCXJlZ3VsYXRvcl9sb2NrKHJkZXYpOwo+
IAlyZWd1bGF0b3ItPmRlZmVycmVkX2Rpc2FibGVzKys7Cj4tCW1vZF9kZWxheWVkX3dvcmsoc3lz
dGVtX3Bvd2VyX2VmZmljaWVudF93cSwgJnJkZXYtPmRpc2FibGVfd29yaywKPisJbW9kX2RlbGF5
ZWRfd29yayhzeXN0ZW1fZnJlZXphYmxlX3Bvd2VyX2VmZmljaWVudF93cSwKPisJCQkgJnJkZXYt
PmRpc2FibGVfd29yaywKPiAJCQkgbXNlY3NfdG9famlmZmllcyhtcykpOwo+IAlyZWd1bGF0b3Jf
dW5sb2NrKHJkZXYpOwo+IAo+LS0gCj4yLjM0LjEK
