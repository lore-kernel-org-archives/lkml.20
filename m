Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0394F799E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063319; cv=none; b=kpmDFSeTrpOnyvo8lERQ5DQbE5sAM8KvovH1GqW12TzCfItKtbmpsaU/OMbfk1AbFUvhgglvjNviLJZXp7moPyX4LPn5lcrJqGwFj0C8lXyCs1zxBGilzFfnHoz5V3NA4o7ruLh+V35wdlAQ01Rk6CK60pMQuZtfRIbqrCeZyIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063319; c=relaxed/simple;
	bh=6LRLl4jVPEFVAXY2BRqgZpy/X6yETBthjrFMUB4zjSo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=UOxiaSz1OV2ztbabAM8XyFFi8Ij8/wCxN20HvmFLHy9eys+YHgp0Cs7qzOD0fbxBmcrrFpUWjczyVitgnzjRzyT+Bk4i5eeJbiV/jOsaK95JQPAgmlJklJvs8+eiNnWjSVrzwwDuING40zKpDzEgQTY4uf791RYLK3ZhJvMdSXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=L/9wNE0O; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="L/9wNE0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=6LRLl4jVPEFVAXY2BRqgZpy/X6yETBthjrFMUB4zjSo=; b=L
	/9wNE0OnMg/TLFGeJV8jpxj88Kkaa9uuY+5zf0UnawavR8yDYW5N1k7BqZ0RvcNJ
	SejKs9EUu+Rc3iJyMlZD/2ilBpV83S8Tcgv6SrHdr3NHZBnQYO9TU5DXXiZ3bT1H
	RQNXA4EG5cbhCgnyMy4+0A6ylXn/go6Z44hsUbDh0A=
Date: Thu, 15 Oct 2026 19:20:40 +0800 (CST)
From: kensanya  <kensanya@163.com>
To: "Christoph Hellwig" <hch@lst.de>
Cc: justin.tee@broadcom.com, nareshgottumukkala83@gmail.com,
	paul.ely@broadcom.com, sagi@grimberg.me, kch@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	TanZheng <tanzheng@kylinos.cn>
Subject: Re:Re: [PATCH] nvmet-fc: skip hostport ops when the LLDD has no
 host handle
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261015061449.GA14497@lst.de>
References: <20261014075303.277735-1-kensanya@163.com>
 <20261015061449.GA14497@lst.de>
X-NTES-SC: AL_Qu2SAPydvEov5iWYZ+kcnkcTg+k8WMW1ufsg2Ydec/4EswX9+hASWlF5LWX1/+uDGhqFqgmybiFH5+hjQKhGNmqyOAipXo4kMzfWuftYFw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7273ecea.964a.1a13f4af93f.Coremail.kensanya@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:dSgvCgD3_ysJt9BqTehZAA--.5112W
X-CM-SenderInfo: 5nhq2txq1dqiywtou0bp/xtbC6gm+mmrQtwnzMQAA3B
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNSAxNDoxNDo0OSwgIkNocmlzdG9waCBIZWxsd2lnIiA8aGNoQGxzdC5kZT4g
d3JvdGU6Cj5PbiBXZWQsIE9jdCAxNCwgMjAyNiBhdCAwMzo1MzowM1BNICswODAwLCBrZW5zYW55
YUAxNjMuY29tIHdyb3RlOgo+PiBGcm9tOiBUYW5aaGVuZyA8dGFuemhlbmdAa3lsaW5vcy5jbj4K
Pj4gCj4+IG52bWV0X2ZjX2FsbG9jX2hvc3Rwb3J0KCkgcmV0dXJucyBOVUxMIHdoZW4gdGhlIExM
REQgcGFzc2VzIGEgTlVMTAo+PiBob3N0aGFuZGxlLiBUaGF0IGlzIG5vdCBhbiBFUlJfUFRSLCBz
byBudm1ldF9mY19hbGxvY190YXJnZXRfYXNzb2MoKQo+PiBrZWVwcyB0aGUgYXNzb2NpYXRpb24g
YW5kIGxlYXZlcyBhc3NvYy0+aG9zdHBvcnQgTlVMTC4KPgo+QSBOVUxMIGhvc3RoYW5kbGUgZG9l
c24ndCBtYWtlIG11Y2ggc2Vuc2UsIHNvIHdoeSBkbyB5b3Ugd2FudCB0byBoYW5kbGUKPnRoYXQ/
CgpIaS4KCm52bWV0X2ZjX3Jjdl9sc19yZXEoKSBvbmx5IHN0b3JlcyB0aGUgaG9zdGhhbmRsZSBp
biB0aGUgaW9kLiBJdCBkb2VzIG5vdCBjYWxsIApudm1ldF9mY19hbGxvY19ob3N0cG9ydCgpLiBU
aGF0IGZ1bmN0aW9uIHJldHVybnMgTlVMTCBmb3IgYSBOVUxMIGhvc3RoYW5kbGUsIAphbmQgbnZt
ZXRfZmNfYWxsb2NfdGFyZ2V0X2Fzc29jKCkgc3RvcmVzIGl0IGluIGFzc29jLT5ob3N0cG9ydC4g
ClRoZSBhc3NvY2lhdGlvbiBpcyBzdGlsbCBjcmVhdGVkLCBzbyB0ZWFyZG93biBjYW4gTlVMTC1k
ZXJlZmVyZW5jZSBpdCBpbiBudm1ldF8KZmNfaG9zdHBvcnRfcHV0KCksIGFuZCBpbiBudm1ldF9m
Y194bXRfZGlzY29ubmVjdF9hc3NvYygpIHdoZW4gb3BzLT5sc19yZXEgaXMgc2V0LgoKbnZtZXRf
ZmNfaG9zdHBvcnRfcHV0KCkgbmVlZHMgdGhlIHNhbWUgY2hlY2suIE5vIGhvc3Rwb3J0IGlzIGFs
bG9jYXRlZCBhbmQgCm5vIGtyZWYgaXMgdGFrZW4sIGJ1dCBudm1ldF9mY190YXJnZXRfYXNzb2Nf
ZnJlZSgpIHN0aWxsIGNhbGxzIG52bWV0X2ZjX2hvc3Rwb3J0X3B1dChhc3NvYy0+aG9zdHBvcnQp
LCAKd2hpY2ggZG9lcyBrcmVmX3B1dCgmaG9zdHBvcnQtPnJlZiwgbnZtZXRfZmNfaG9zdHBvcnRf
ZnJlZSkuCgpCZXN0IHJlZ2FyZC4KVGFuWmhlbmcu
