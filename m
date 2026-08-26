Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A071C4519A5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756019; cv=none; b=Cd/d66js2fJA4jGwSxM5582q/I9XOAFWMHa2Qi5p74IX4NOoefZ9ykvvlU+8j7pJ8efYO4u6I2qzyzGPmxtln57OEPd3JVXYLtYnBMTodVr4JCLW33m6AcfZWmuTDb+BxGoJyhLxMgPaQZAiBnoT0a/0PZlJrSzjA/YO8rtrTcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756019; c=relaxed/simple;
	bh=Qh5oFzqEgC68rJYAnFkNnVvmgSrtr1xEmmujkXh+YvI=;
	h=Message-ID:Content-Type:MIME-Version:From:To:Cc:Subject; b=mBrUljOtBMeFfCDL/dNf0yqDewQaAOeBtfQO0+eFegcz/vYAdnAPtp5/4fGSesZ3v68wnNi1tamBcudR8U+DT4MuC8cY1kDqNw74QpUs3zAy5GkcTnix9b1iTLsyhiUSM5XrG6UDbdTMerAxQYcGQfxcBF2JANXheFGQ6EWawJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PK/RPdBk; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PK/RPdBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787756003; bh=Qh5oFzqEgC68rJYAnFkNnVvmgSrtr1xEmmujkXh+YvI=;
	h=From:To:Cc:Subject;
	b=PK/RPdBkMeLrj+NWzET9JDMUUknWQXIifkuZMDdNdVUNBzRhSqWxv8kJwBqjI4Ndt
	 7XHnzuhpaNcsg36YjwB8GxPuSgiJ0A2j41vffoIUG8/ao04fgClgqZTjK+KxNlkdTx
	 TzCUUdJpI9ZiqF/gWS76qbmk8JkoB6YFoMwcDrQA=
Received: from [192.168.137.1] ([2409:8a28:2472:b2a1:65be:c2ad:391d:36d8])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id D54292D2; Wed, 26 Aug 2026 22:53:20 +0800
X-QQ-mid: xmsmtpt1787756000tepzo32f7
Message-ID: <tencent_0D1CF77320A0C199EB46300A4E82DADEA209@qq.com>
X-QQ-XMAILINFO: Mfa2ogpi8We7L/ELQyOvC68Pwo1p8pXyxxprzchfgZ3+SJRpUGuLAHPJO9T3rN
	 KLwv0pEc6cVlVF51V4I72BmAzgAbio6kYQSXuXBoyazI8E+fvXpXlHWVnIVOIkPzLgMnGssiharl
	 wlg1+fWbAhZcur84M7FvKE0bGWtxNoN5U+jVzBcBb+IM8PmcNIPgvyfU/aK3iTmndM1saEpfmwAX
	 RlSxhDi8SHpO/RLope3o4GKwEreRNWOBj5e3NJ02KObJiouVDQkCxX6j3nK6y1/NcSry7BdPYA6o
	 z6drtVKVVuno7cYnvcktVOg77KeEykYszWPYfe/37jLmsJMb2th9eTLGdrdZdJ0O9eDWS8HIIgce
	 +r+mC3NJYYzohNJXpHIvbc/Y7dEURmMmrQ8yVjrmA6doWkc1BmCpotMW9OLw8/l05YHuzkuKcvzV
	 KyHH443pJcozHbzlr2ruKupQ8B3ATwt+7AU46HFdhoUdVzoRGnkfhtnQuRj/nwlm7rmm3dN+9Eje
	 IEPRP4ivNItoAxddlHw6kxPA/BtHhBYFXUUUETDzG7mXJ8Y1lT7jvkOJQEOZIiiroV6Vl388+Pc4
	 QR8EDlDDcTFQD2FreEmUUjxT0Kak4uqtuQFX4Ss5M3fnlI0R5RBu/G2MeVz9QkIyiBDxFrRFELvP
	 PR/NXi05emHPd1UOCE4W75pY/D2lMzAOE9jynWPbwzqnV0DIYUtRaKcwTT1mwJ9c0gr9ZBb07Za8
	 oJtIz09XWr8FWVpEEr87kdTHAZni+fHeN2K8wAalyMfs9SbJFOyoRCr16T+1DzD1IacDiRkCFJT3
	 NV+eHyBWNKektP00PZpkY/ndWFpLaeMVYHfThhqUJRTW+ozSPoG7dqjHWMMAkJlPmvZq2RqDq2AZ
	 Xgx7kIEL3Axob5V9iQhmKfWih3ARCo/FJJ29viNYeDzZpKbnkD+A9tsJqWYRf5cbxnlcC0mI2h6F
	 0pmaFVGVUl2VrNvncso8p1MhX3kzTCxTAuBD43IBdLNTjiqOgMXbc5TgKHWk/hokTC6mY6wvsR+7
	 XjHpKu58wfdxkUYpsw
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
Content-Type: multipart/mixed; boundary="===============2902541553207561063=="
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: 3237174131@qq.com
To: linux-kernel@vger.kernel.org
Cc: tglx@kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH] scripts/spdxcheck: fix file descriptor leak in
 read_spdxdata()

--===============2902541553207561063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGkgYWxsLAoKVGhpcyBpcyBteSBmaXJzdCBrZXJuZWwgcGF0Y2guIFBsZWFzZSBsZXQgbWUga25v
dyBpZiBhbnl0aGluZyBpcyB3cm9uZy4KClNpZ25lZC1vZmYtYnk6IFhpYSBaaG94aW4gPDMyMzcx
NzQxMzFAcXEuY29tPgo=

--===============2902541553207561063==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-scripts-spdxcheck-fix-file-descriptor-leak.patch"

RnJvbTogWGlhIFpob3hpbiA8MzIzNzE3NDEzMUBxcS5jb20+ClN1YmplY3Q6IFtQQVRDSF0gc2Ny
aXB0cy9zcGR4Y2hlY2s6IGZpeCBmaWxlIGRlc2NyaXB0b3IgbGVhayBpbiByZWFkX3NwZHhkYXRh
KCkKVG86IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IHRnbHhAa2VybmVsLm9yZywg
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcKCkhpIGFsbCwKClRoaXMgaXMgbXkgZmlyc3Qga2Vy
bmVsIHBhdGNoLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55dGhpbmcgaXMgd3JvbmcuCgpTaWdu
ZWQtb2ZmLWJ5OiBYaWEgWmhveGluIDwzMjM3MTc0MTMxQHFxLmNvbT4KLS0tCiBzY3JpcHRzL3Nw
ZHhjaGVjay5weSB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9zcGR4Y2hlY2sucHkgYi9zY3JpcHRzL3Nw
ZHhjaGVjay5weQotLS0gYS9zY3JpcHRzL3NwZHhjaGVjay5weQorKysgYi9zY3JpcHRzL3NwZHhj
aGVjay5weQpAQCAtNzIsNyArNzIsOCBAQCBkZWYgcmVhZF9zcGR4ZGF0YShyZXBvKToKICAgICAg
ICAgICAgIGV4Y2VwdGlvbiA9IE5vbmUKLSAgICAgICAgICAgIGZvciBsIGluIG9wZW4oZWwucGF0
aCwgZW5jb2Rpbmc9InV0Zi04IikucmVhZGxpbmVzKCk6CisgICAgICAgICAgICB3aXRoIG9wZW4o
ZWwucGF0aCwgZW5jb2Rpbmc9InV0Zi04IikgYXMgZjoKKyAgICAgICAgICAgICAgICBmb3IgbCBp
biBmOgogICAgICAgICAgICAgICAgICAgICBpZiBsLnN0YXJ0c3dpdGgoJ1ZhbGlkLUxpY2Vuc2Ut
SWRlbnRpZmllcjonKToKICAgICAgICAgICAgICAgICAgICAgICAgIGxpZCA9IGwuc3BsaXQoJzon
KVsxXS5zdHJpcCgpLnVwcGVyKCkKICAgICAgICAgICAgICAgICAgICAgICAgIGlmIGxpZCBpbiBz
cGR4LmxpY2Vuc2VzOg==

--===============2902541553207561063==--

