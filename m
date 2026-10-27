Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082462;
	b=lyt0O3W8O77/XK812u+bwEe32Lu/r3rQ4Pjw758O2F9RQ/J8CfIGTRrx4AQeLWCy/jH9
	 tVPHX+atD6b0dEu+5Q6bgD+SkEIgj7SgsQW8GI/S2a2AsVIq2adUZid1hyIRmRiBl+yi2
	 9Ka6HvZH6zw4/xfmLU2ZyIXrQMazbGZPjzA7dT4fqA0zJ78OElgp1ZlMCeGVjha4GsNuB
	 Dj0krPonFnGAQfvYE8v/e/J5MYQWngwTHqe29JFoJf7q4l7suOWiZye5qOBdNVowG7rvj
	 c+10qhU76twutCgOi1htqkq/J6rHrJOgYZIZN5NcDoR6u/QGV3W27rWWyjy5W3Lp7wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082462;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:In-Reply-To:References:X-NTES-SC:Content-Transfer-Encoding:
	 Content-Type:MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=PkREbf7o91Oz7jSmK3YYzzIbuGDLc897mU0cSUNirZk=;
	b=KnI3+Tlpm9I8z0Hn0m5HAp8a91QrOMQsTOhoy5Sz1yRzU7mwwGrV5NXDFOQi/5a72IgM
	 Pt29FAnRPJoV9ft+2vVJsRtLbqL1brWr+oSzObtrRX5XGibN0u6BpQSj/jiKuUr5xqfdC
	 myzPeT08/mW+37kuprrNxwQbjGL7zo3hV+QXRTnzwN55YFHdO3Nk67F4iqJDLJW+wwGh4
	 epkmw7bIPzGe6b5Eq7jotOshPNo7SoSD4e5g9VsyGLRhYeyDovJjWaW0bfIQTB/BaSsIa
	 TpIfrpUkcIDmMSCWJ4ZyIK2Ei4RcWRd8z3E8ybj2lE876WBLJkxzxZEDZyPJ5zoD+Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TGk8LFIj;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7B606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD7B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TGk8LFIj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PkREbf7o91Oz7jSmK3YYzzIbuGDLc897mU0cSUNirZk=; b=T
	Gk8LFIjmYuJklifhoxUxORDY5OxhQW3zED0+GsQ7Ze815IsLD3RcOJ9vNHSZbZmv
	t0wqluUoMm8hvFWcCYQo8jyId6tPo9IIjUxTUTmjccSA1tMQkEfQSuDGtzR4onKa
	Mji5hKFVWxFNKtjajzZ1+4fuViWGGzYGHnG5bB+nGw=
Date: Tue, 27 Oct 2026 14:27:28 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH 1/2] regulator: core: freeze deferred disable work
 during suspend
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <atubBdUBEejAyR9n@sirena.org.uk>
References: <20261016100522.2582557-1-yaojiale02@163.com>
 <20261016100522.2582557-2-yaojiale02@163.com>
 <atubBdUBEejAyR9n@sirena.org.uk>
X-NTES-SC: AL_Qu2SAfyTvUwv7iKfYOkcn08ShO49XMOyvfoi2YFTc8EFhwzy3T8rZFVlLHfY28mULw+2ux6vQhhcw+doWoNAVkmI19odHeBnbwjCsGsnyg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <7e49a67a.4fae.1a17c0ad99b.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gigvCgD333lQROBqAfRgAA--.1465W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BD3MmrgRFBE9wAA3I
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0yNCAwMTozNjowNSwgIk1hcmsgQnJvd24iIDxicm9vbmllQGtlcm5lbC5vcmc+
IHdyb3RlOgo+T24gRnJpLCBPY3QgMTYsIDIwMjYgYXQgMDY6MDU6MjFQTSArMDgwMCwgSmlhbGUg
WWFvIHdyb3RlOgo+Cj4+IHJlZ3VsYXRvcl9kaXNhYmxlX2RlZmVycmVkKCkgc2NoZWR1bGVzIGhh
cmR3YXJlIGFjY2VzcyBhZnRlciBhCj4+IGNhbGxlci1wcm92aWRlZCBkZWxheS4gVGhlIHBvd2Vy
LWVmZmljaWVudCBzeXN0ZW0gd29ya3F1ZXVlIHJlbWFpbnMKPj4gYWN0aXZlIGR1cmluZyBzeXN0
ZW0gc3VzcGVuZCwgc28gZGVmZXJyZWQgcmVndWxhdG9yIG9wZXJhdGlvbnMgY2FuIHJlYWNoCj4+
IGEgYnVzIGFmdGVyIGl0cyBjb250cm9sbGVyIGhhcyBiZWVuIHN1c3BlbmRlZC4KPgo+PiBVc2Ug
dGhlIGZyZWV6YWJsZSBwb3dlci1lZmZpY2llbnQgd29ya3F1ZXVlIHRvIHByZXNlcnZlIHRoZSBl
eGlzdGluZwo+PiBwb3dlciBwb2xpY3kgd2hpbGUgZGVmZXJyaW5nIHJlZ3VsYXRvciBhY2Nlc3Mg
dW50aWwgZGV2aWNlcyBoYXZlIHJlc3VtZWQuCj4KPlRoaXMgaXMgZ29pbmcgdG8gaGF2ZSBhIGZ1
biBpbnRlcmFjdGlvbiB3aXRoIHRoZSBvbmx5IGN1cnJlbnQgdXNlciBvZgo+ZGVmZXJyZWQgZGlz
YWJsZXMsIERBUE0uICBJZiBhIERBUE0gc3VwcGx5IHRoYXQgdXNlcyBkZWZlcnJlZCBkaXNhYmxl
cwo+aXMgYWN0aXZlIGF0IHN5c3RlbSBzdXNwZW5kIHRoZW4gaXQgd2lsbCBkaXNhYmxlIGl0IHVz
aW5nIGEgZGVmZXJyZWQKPmRpc2FibGUgYnV0IHNpbmNlIHRoZSB3b3JrcXVldWUgaXMgZnJvemVu
IHF1aXRlIGVhcmx5IG9uIGluIHN1c3BlbmQgdGhpcwo+d2lsbCBzaW1wbHkgcmVzdWx0IGluIHRo
ZSBkaXNhYmxlIG5vdCBoYXBwZW5pbmcgdW50aWwgYWZ0ZXIgdGhlIHN1c3BlbmQKPmhhcyBjb21w
bGV0ZWQgd2hpY2ggaXNuJ3QgdGhlIGRlc2lyZWQgb3V0Y29tZS4KPgo+U2luY2UgaWYgd2UncmUg
c3VzcGVuZGluZyBpdCdzIHJlYXNvbmFibGUgdG8gYXNzdW1lIHRoYXQgdGhlIHN1cHBseQo+d29u
J3QgYmUgYm91bmNlZCBvbiBhZ2FpbiBxdWlja2x5LCBvciB0aGF0IGlmIGl0IGlzIHdlIGNhbiBy
ZWFzb25hYmx5Cj5wYXkgdGhlIGNvc3Qgb2YgZnVsbCByYW1wIHVwLCB3ZSBzaG91bGQgcHJvYmFi
bHkgYXJyYW5nZSBmb3IgdGhlIGRpc2FibGUKPnRvIGJlIHByb2Nlc3NlZCBpbW1lZGl0ZWx5IGlm
IHdlJ3JlIGluIHN1c3BlbmQuICBJbiBhZGRpdGlvbiBpZiB0aGVyZQo+YXJlIGFscmVhZHkgcGVu
ZGluZyBkaXNhYmxlcyBpdCdkIG1ha2Ugc2Vuc2UgdG8gZmx1c2ggdGhlbSByYXRoZXIgdGhhbgo+
bGV0dGluZyB0aGUgd29ya3F1ZXVlIGZyZWV6ZSwgZm9yIHNpbWlsYXIgcmVhc29ucy4KClRoYW5r
cyBmb3IgeW91ciByZXZpZXcsIHRoaXMgaXMgdXBkYXRlZCB2ZXJzaW9uLApodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjEwMjcwNjIwMDcuMjIyNjU0OC0xLXlhb2ppYWxlMDJAMTYzLmNv
bS8=
