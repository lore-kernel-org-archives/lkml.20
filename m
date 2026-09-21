Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E146DFF4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986505; cv=none; b=s42FdlyuKAd1jFhPdsHe9tNzPuYWEud9dWsAAq7nSF0Q2qbvZ1PANdBXHAp5eRQjmhyqqcB/zbzka8OZTpe+KsgARr4jSRbOASzO4b3tykB+5BFKHLyqclpoovNBx/AKcGrNgTyNXU2Dndsq3gFJiFhMeFawDeaZ5Brpc4QGO/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986505; c=relaxed/simple;
	bh=ZcTkq3Mv7E+BhVTask9heU+/2u/rSMpv73i3lcyi5r0=;
	h=From:To:Cc:Cc:Cc:Cc:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type; b=Xk+NUhNXl1v+Grvoqp/YpHm7RmzXQKcRBOiXsL5bhL3GlWox9etUasq8sKTjv/KVxRj7AVxClyrb9At0RREI85x9GLPKiRuFGTXp/Wsz1B1hJRctLR9Mid1fziVQFGZS+XN7PYX9pfigLYFC0+Vgb+SOIXtu61RBQNQayjWucR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GyMDbD6c; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GyMDbD6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=ZcTkq3Mv7E+BhVTask9heU+/2u/rSMpv73i3lcyi5r0=;
	b=GyMDbD6cAaZQpoXBgecHydyBn6REQSW7AD8UZvYCKhSW5Tin2RA/Kv6nUjRKhF
	qkJ4+FQHIKwvF7mD/38V0Mv8tUaWjS8GXGp04xeHyjE85U6/uFsEbWfy+822o0we
	Iu9YzP300PKvTmP8NAwB/uwadwLiqDk6p5+zA3VgnSt0c=
Received: from LAPTOP-EGO65D59.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCHwJOvBrFqGae3CA--.37646S2;
	Mon, 21 Sep 2026 18:28:00 +0800 (CST)
From: Lin Junzhe <m18667909625@163.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org
Cc: m18667909625@163.com
Subject: Re: [PATCH] printk: fold consecutive duplicate messages
Date: Sun, 21 Sep 2026 18:30:00 +0800
Message-ID: <20260921183000.1-m18667909625@163.com>
In-Reply-To: <875wzzoxcd.fsf@jogness.linutronix.de>
References: <20260921050304.73440-1-m18667909625@163.com>
 <875wzzoxcd.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-CM-TRANSID:_____wCHwJOvBrFqGae3CA--.37646S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar13GFWrKry5JFy7XFWrKrg_yoW8tryrpF
	ZIgrs5Kr4DGF18uwn7Zw18W34S9ws3KrZrGrn5J34Fva909Fy29r4Sqw4Yv3ykKr48ua9F
	yF1jq3ZrCFWvkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUyyxNUUUUU=
X-CM-SenderInfo: bpryllixzqmlisv6il2tof0z/xtbC-RG0umqxBrEk4wAA3J

SGkgSm9obiwKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCj4gQ291bGQgeW91IHByb3ZpZGUgc29t
ZSBleGFtcGxlcyBvZiBjb25zb2xlcyBiZWluZyBmbG9vZGVkIHdpdGgKPiB0aGUgc2FtZSBtZXNz
YWdlPyBEb2Vzbid0IHNvdW5kIGxpa2UgYSByZWFsIGNhc2UgdG8gbWUuCgpSZWFsIGNhc2VzIEkg
aGF2ZSBzZWVuIGluIHRoZSBmaWVsZCBhbmQgaW4gYnVnIHJlcG9ydHM6CgoxLiBHUFUgZmF1bHRz
IChub3V2ZWF1KTogYSBtaXNiZWhhdmluZyB1c2Vyc3BhY2UgcHJvZ3JhbSBvciBhIGR5aW5nCiAg
IEdQVSBjYW4gdHJpZ2dlciBhIHN0cmVhbSBvZiBpZGVudGljYWwgZmF1bHQgcmVwb3J0cyBmcm9t
IHRoZQogICBpbi10cmVlIG5vdXZlYXUgZHJpdmVyLCBlLmcuIHJlcGVhdGVkICJmaWZvOiBmYXVs
dCBhdCAuLi4iIGxpbmVzCiAgIHdoaWxlIHRoZSBvZmZlbmRpbmcgY29udGV4dCBrZWVwcyBiZWlu
ZyByZXNjaGVkdWxlZC4gU2ltaWxhcgogICBzcGFtIGV4aXN0cyBmb3Igb3RoZXIgR1BVIGRyaXZl
cnMgd2hlbiBhIGZlbmNlIG9yIHNjaGVkdWxlcgogICBsb29wIG1pc2JlaGF2ZXMuCgoyLiBGYWls
aW5nIHN0b3JhZ2U6IGEgZHlpbmcgU0FUQSBkaXNrIHByb2R1Y2VzIGVuZGxlc3MgaWRlbnRpY2Fs
CiAgICJhdGExLjAwOiBmYWlsZWQgY29tbWFuZCIgLyAiYXRhMTogU0Vycm9yIiBzdG9ybXMuIFRo
aXMgaXMgYQogICBjbGFzc2ljIGRtZXNnIGZsb29kIHRoYXQgYnVyaWVzIGV2ZXJ5dGhpbmcgZWxz
ZSBvbiBtYWNoaW5lcwogICB3aXRoIGEgc2VyaWFsIGNvbnNvbGUgYW5kIG5vIHN5c2xvZ2QuCgoz
LiBVU0IgcmVzZXQgbG9vcHM6IGEgZmxha3kgY2FibGUgb3IgcG9ydCBtYWtlcyB0aGUgVVNCIHN0
YWNrCiAgIHJlcGVhdGVkbHkgcHJpbnQgdGhlIGlkZW50aWNhbCAidXNiIFgtWTogcmVzZXQgPHNw
ZWVkPiBVU0IKICAgZGV2aWNlIG51bWJlciBOIHVzaW5nIDxoY2Q+IiBsaW5lLCBzb21ldGltZXMg
Zm9yIG1pbnV0ZXMuCgo0LiBJUlEgc3Rvcm1zOiBhbiB1bmhhbmRsZWQgbGV2ZWwtdHJpZ2dlcmVk
IGludGVycnVwdCBwcmludHMgdGhlCiAgIGlkZW50aWNhbCAiaXJxIE46IG5vYm9keSBjYXJlZCIg
cmVwb3J0IGZvciBldmVyeSByZXRyaWdnZXIKICAgdW50aWwgdGhlIElSUSBpcyBkaXNhYmxlZC4K
CkluIGFsbCBmb3VyIGNhc2VzIHRoZSBtZXNzYWdlcyBjb21lIGZyb20ga2VybmVsLXNpZGUgcmF0
ZWxpbWl0cyBvcgplcnJvciBwYXRocyB0aGF0IHJlcGVhdCBhdCBsaW5lIHJhdGUsIGFuZCBvbiBz
eXN0ZW1zIHdoZXJlIHRoZSBvbmx5Cm9ic2VydmFibGUgb3V0cHV0IGlzIHRoZSBrZXJuZWwgY29u
c29sZSAoc2VyaWFsIGNvbnNvbGUsIGVhcmx5IGJvb3QsCm5ldGNvbnNvbGUpLCBubyB1c2Vyc3Bh
Y2UgZGVkdXAgZXhpc3RzIHRvIHNhdmUgdGhlIGxvZy4KCj4gcHJpbnRrIGlzIE5NSSBzYWZlIGFu
ZCBsb2NrbGVzcy4gSXQgbmVlZHMgdG8gcmVtYWluIHNvLgoKRnVsbHkgYWdyZWVkLCBhbmQgdGhh
bmsgeW91IGZvciB0aGUgY2xlYXIgc3RhdGVtZW50LiBNeQppbXBsZW1lbnRhdGlvbiB0YWtlcyBh
IHJhdyBzcGlubG9jayBpbiB2cHJpbnRrX2VtaXQoKSwgd2hpY2gKdmlvbGF0ZXMgZXhhY3RseSB0
aGF0IGludmFyaWFudCAtLSB0aGUgaW5fbm1pKCkgZ3VhcmQgb25seSBhdm9pZHMKdGhlIGRlYWRs
b2NrIGJ5IGRpc2FibGluZyB0aGUgZmVhdHVyZSB3aGVyZSBpdCB3b3VsZCBiZSBtb3N0CmRhbmdl
cm91cywgd2hpY2ggaXMgbm90IGFjY2VwdGFibGUgZWl0aGVyLgoKR2l2ZW4gdGhpcywgSSBzZWUg
dHdvIG9wdGlvbnM6CgphKSBJIGRyb3AgdGhlIHBhdGNoIGVudGlyZWx5OyBvcgoKYikgSSByZXdv
cmsgdGhlIGlkZWEgYXMgbG9ja2xlc3MgcGVyLUNQVS9wZXItY29uc29sZSBzdGF0ZSBhdCB0aGUK
ICAgY29uc29sZSBvdXRwdXQgbGF5ZXIgKG9yIG9uIHRvcCBvZiBuYmNvbiksIHNvIHRoZSBwcmlu
dGsKICAgZmFzdCBwYXRoIHN0YXlzIGxvY2stIGFuZCBOTUktc2FmZS4KClBsZWFzZSB0ZWxsIG1l
IHdoZXRoZXIgKGIpIGlzIHdvcnRoIGV4cGxvcmluZyBvciB3aGV0aGVyIHRoZQpjb25zZW5zdXMg
aXMgdGhhdCBkZWR1cGxpY2F0aW9uIGJlbG9uZ3MgaW4gdXNlcnNwYWNlIGFuZCAoYSkgaXMKdGhl
IHJpZ2h0IG91dGNvbWUuIEVpdGhlciB3YXkgaXMgZmluZSB3aXRoIG1lLgoKQmVzdCByZWdhcmRz
LArmnpfmv6zlk7IKCi0tCkFzc2lzdGVkLWJ5OiBBSSBjb2RpbmcgYXNzaXN0YW50IChkaXNjbG9z
ZWQgcGVyIGtlcm5lbCBBSSBndWlkZWxpbmVzKQo=

