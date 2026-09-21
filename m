Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21978255E43
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789952805; cv=none; b=QVwa/HlpLqCMcQrWUM3rcvWUsKDzIj4QuxdzK0eujsUFqSrwQSxDK1aU2yB273oPKePSalusUpvMxUL9zDZ9AWgoJVcwnGLZlvCL0AlrIz+e2fF1E6R1jw+S6vv1951u3slPFwTHE40/OF9nTzqEdPyFJC6FG1zFssnDfnu8Jyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789952805; c=relaxed/simple;
	bh=5wYXwIr+TzGIg09KWztp1SmcY207s1v9qTz2vNDmYMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=BcD7Ru0HTkcbc6PSeS2lii+V6iiCdVeHfPOHSGGPSOWCjN4aM30DVPmRwliPJBHeGqBydoUAKJDwzPJK0lQvLCDEAd/OMQAbFWdSmulrp4UmWZY13jKBFkZY2JMU0cNAD3vnUm/N882Q5qtyvKuRzJ4KFzJvvMxY7NNlxCCve90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CTA5a1+I; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CTA5a1+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=5wYXwIr+TzGIg09KWztp1SmcY207s1v9qTz2vNDmYMk=; b=C
	TA5a1+I/Tvoccl8TZ/rDLf5l31DQHUCHadYcxkZ2yJdd9zKyIigwlnAU+gMJB7mn
	IvxrqNBDydQwIy+HSdHpOmYfR69v/094sPoYNVNr5urKCjlLy+la4YHfSIO2Kzrg
	uyKlBQlwSfWgp+PuVHCEES7Ry5yaLgP5h2kjNLOd78=
Date: Mon, 21 Sep 2026 09:06:08 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Johan Hovold" <johan@kernel.org>,
	"Hao-Qun Huang" <alvinhuang0603@gmail.com>,
	"Kees Cook" <kees@kernel.org>, "Martyn Welch" <martyn@welchs.me.uk>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re:Re: [PATCH] staging: vme_user: kill fake VIRQ tasklet on exit
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <2026092012-deuce-untitled-2254@gregkh>
References: <20260920170223.2068463-1-yaojiale02@163.com>
 <2026092012-deuce-untitled-2254@gregkh>
X-NTES-SC: AL_Qu2TC/WevU8t7iWdYOkcn08ShO49XMOyvfoi2YFTc+sGlyXh2i4+WVt7EWHG1e2fEw6OgDWQUj9P7+9nZYNHAPFlGTGvyNXq3/YkZzBgCQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7e5a20ba.c3c.1a0c17fba33.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:jSgvCgD3_zkBg7BqS2lKAA--.35194W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgGn4WqwgwFlaQAA3d
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLApJIGhhdmUgY29uZmlybWVkIHRoYXQgdGhlIGJ1ZyBpcyBzdGlsbCBwcmVzZW50IGluIHRo
ZSBsYXRlc3QgZGV2ZWxvcG1lbnQgdHJlZS4KClRoaXMgYnVnIGlzIGluIHZtZV9mYWtlIGl0c2Vs
Ziwgd2hpY2ggaXMgYSBzb2Z0d2FyZS1lbXVsYXRlZCBWTUUgYnJpZGdlLiAKCk5vIHBoeXNpY2Fs
IFZNRSBoYXJkd2FyZSBpcyBpbnZvbHZlZCBpbiB0aGlzIHBhdGgsIHNvIHJlYWwtaGFyZHdhcmUg
dGVzdGluZyB3b3VsZCBub3QgZXhlcmNpc2UgdGhlIGNvZGUgdGhhdCBpcyBmYWlsaW5nIGhlcmUu
CgpUaGFua3MsCkppYWxlCgoKQXQgMjAyNi0wOS0yMSAwMzozNDoxMSwgIkdyZWcgS3JvYWgtSGFy
dG1hbiIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPk9uIE1vbiwgU2VwIDIx
LCAyMDI2IGF0IDAxOjAyOjIxQU0gKzA4MDAsIEppYWxlIFlhbyB3cm90ZToKPj4gZmFrZV9pcnFf
Z2VuZXJhdGUoKSBzY2hlZHVsZXMgaW50X3Rhc2tsZXQsIHdoaWNoIGlzIGVtYmVkZGVkIGluIHN0
cnVjdAo+PiBmYWtlX2RyaXZlciBhbmQgcmVjZWl2ZXMgZmFrZV9icmlkZ2UgYXMgaXRzIGRhdGEg
YXJndW1lbnQuIGZha2VfZXhpdCgpCj4+IGZyZWVzIGJvdGggb2JqZWN0cyB3aXRob3V0IHdhaXRp
bmcgZm9yIGEgcGVuZGluZyB0YXNrbGV0IHRvIGNvbXBsZXRlLgo+PiAKPj4gVGhpcyB3YXMgcmVw
cm9kdWNlZCBvbiB2Ni4xOC41MiB1bmRlciBRRU1VIHdpdGggdGhlIGZvbGxvd2luZyBzZXF1ZW5j
ZToKPgo+Ni4xOCBpcyBOT1QgdGhlIGxhdGVzdCBrZXJuZWwgcmVsZWFzZSB0byBiZSBkb2luZyB0
ZXN0aW5nIG9yIGRldmVsb3BtZW50Cj5mb3IuCj4KPj4gICAxLiBMb2FkIHZtZV9mYWtlIGFuZCB2
bWVfdXNlciB0byBjcmVhdGUgL2Rldi9idXMvdm1lL2N0bC4KPj4gICAyLiBJc3N1ZSBWTUVfSVJR
X0dFTiBpb2N0bHMgc28gZmFrZV9pcnFfZ2VuZXJhdGUoKSBxdWV1ZXMgaW50X3Rhc2tsZXQuCj4+
ICAgMy4gQ29uY3VycmVudGx5IHVubG9hZCB2bWVfZmFrZSBiZWZvcmUga3NvZnRpcnFkIHJ1bnMg
dGhlIHRhc2tsZXQuCj4+ICAgNC4gZmFrZV9leGl0KCkgZnJlZXMgdGhlIGVtYmVkZGVkIHRhc2ts
ZXQgYW5kIGZha2VfYnJpZGdlLCBhZnRlciB3aGljaAo+PiAgICAgIHRhc2tsZXRfYWN0aW9uX2Nv
bW1vbigpIGFjY2Vzc2VzIHRoZSBmcmVlZCB0YXNrbGV0Lgo+PiAKPj4gS0FTQU4gcmVwb3J0ZWQ6
Cj4+IAo+PiAgIEJVRzogS0FTQU46IHNsYWItdXNlLWFmdGVyLWZyZWUgaW4gdGFza2xldF9hY3Rp
b25fY29tbW9uKzB4ZWUvMHg2ZjAKPj4gICBSZWFkIG9mIHNpemUgOCBieSB0YXNrIGtzb2Z0aXJx
ZC8zLzM2Cj4+IAo+PiAgIENhbGwgVHJhY2U6Cj4+ICAgIDxUQVNLPgo+PiAgICBkdW1wX3N0YWNr
X2x2bCsweDQ4LzB4MTIwCj4+ICAgIHByaW50X3JlcG9ydCsweDE5MS8weDU4MAo+PiAgICBrYXNh
bl9yZXBvcnQrMHgxMzkvMHgxNzAKPj4gICAgdGFza2xldF9hY3Rpb25fY29tbW9uKzB4ZWUvMHg2
ZjAKPj4gICAgaGFuZGxlX3NvZnRpcnFzKzB4MTU5LzB4NGMwCj4+ICAgIHJ1bl9rc29mdGlycWQr
MHgxYy8weDMwCj4+ICAgIHNtcGJvb3RfdGhyZWFkX2ZuKzB4Mzg1LzB4NzAwCj4+ICAgIGt0aHJl
YWQrMHg1YzYvMHg3MzAKPj4gICAgcmV0X2Zyb21fZm9yaysweDE1YS8weDM4MAo+PiAgICByZXRf
ZnJvbV9mb3JrX2FzbSsweDFhLzB4MzAKPj4gICAgPC9UQVNLPgo+PiAKPj4gVW5yZWdpc3RlciB0
aGUgYnJpZGdlIHRvIHJlbW92ZSB0aGUgdXNlcnNwYWNlIGVudHJ5IHBvaW50LCB0aGVuIGtpbGwg
dGhlCj4+IHRhc2tsZXQgYmVmb3JlIHRlYXJpbmcgZG93biB0aGUgYnJpZGdlIHJlc291cmNlcy4g
VGhpcyBlbnN1cmVzIGFueSBwZW5kaW5nCj4+IGNhbGxiYWNrIGhhcyBjb21wbGV0ZWQgYmVmb3Jl
IGl0cyBzdG9yYWdlIGFuZCBkYXRhIGFyZ3VtZW50IGFyZSBmcmVlZC4KPgo+V2hhdCBhYm91dCBv
biB0aGUgcmVhbCBoYXJkd2FyZT8gIEFzIHBlciBvdXIgcHJldmlvdXMgc3RhdGVtZW50cywgdGhh
dCdzCj50aGUgb25seSB3YXkgd2UgY2FuIHRha2UgTExNLWZvdW5kIHBhdGNoZXMgZm9yIHN0YWdp
bmcgZHJpdmVycy4KPgo+dGhhbmtzLAo+Cj5ncmVnIGstaAo=
