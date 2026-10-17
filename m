Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70BE430794
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222414; cv=none; b=EA/RYiqN34lt2p3LDXvsbr7ElxfGGgzxbDU5nKVtExG1K0ez+waOXoMAYbNUVZ6sLaONDh3MxcvoXqM8CLDsGsiYkFjX2VCIEPPOOFCCEBk1NzFZ0kUOjTlOT2+cp3P+gIGnrRFBMLeWTkpk5fUEjalaP1YzBAcrkGiruAVz59Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222414; c=relaxed/simple;
	bh=2XhehFDAN9ARTDiCzl9nkIP857yYw1nUyciOPYQvQAg=;
	h=Date:From:To:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=MDGAlQ3g1A+LWdDmf6YANoxWp31mYyWx2Ij6XowBgd13++TjofcahvdHqQ2JdNBMwQe62nhNiZr/9XAfN/IZvyumZkBOdlHcpwxyHpCrnE0r0xhc8jij59TX/iZ/dUsAvAgllb1COPwwkcp7bvWPtWNGri98DhW/hdroa1H2S9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kJk4w3Tr; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kJk4w3Tr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=2XhehFDAN9ARTDiCzl9nkIP857yYw1nUyciOPYQvQAg=; b=k
	Jk4w3TrDHMpWF2q7Y1M3zTYboxxKCoG99xWp2r42v7AMJdwKCDBcfG0EEQSVbAQN
	roi6ec5R2X9pZ1CkuU97lXdDUWSEYyOX0C2HaT64GkxAXGw34JhiSqQyq+JU9V/G
	fUsGO22E2XXUpdUxMPxA5psVEiU46LmZcbox4VBEKU=
Date: Sat, 17 Oct 2026 15:33:04 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re:[PATCH] x86/boot: validate SRAT subtables before parsing
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20261016141424.2793636-1-yaojiale02@163.com>
References: <20261016141424.2793636-1-yaojiale02@163.com>
X-NTES-SC: AL_Qu2SAP6ZvUsj4iKcbOkdnEkQgO0/WsS1vfQu2Y5Wc+wEgCbN4z0YdHxaDHHN8e6DOSarnDiOagNHzNRcb4JHfx5kbNsivdqFh2W+CR5NUQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6dc1f951.1875.1a148c75084.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgD3T3ewJNNqmvtaAA--.860W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzRDE-mrTJLAV-AAA3j
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0xMC0xNiAyMjoxNDoyNCwgIkppYWxlIFlhbyIgPHlhb2ppYWxlMDJAMTYzLmNvbT4g
d3JvdGU6Cj5UaGUgY29tcHJlc3NlZCBib290IFNSQVQgd2Fsa2VyIG9ubHkgcmVqZWN0cyB6ZXJv
LWxlbmd0aCBzdWJ0YWJsZXMuIEl0Cj5jYW4gYWR2YW5jZSBiZXlvbmQgdGhlIHRhYmxlIG9yIHJl
YWQgbWVtb3J5LWFmZmluaXR5IGZpZWxkcyBmcm9tIGEKPnRydW5jYXRlZCByZWNvcmQgd2hlbiBm
aXJtd2FyZSBzdXBwbGllcyBhbiBpbnZhbGlkIGxlbmd0aC4KPgo+VmFsaWRhdGUgdGhlIFNSQVQg
aGVhZGVyLCBlYWNoIGdlbmVyaWMgc3VidGFibGUgcmFuZ2UsIGFuZCB0aGUgZml4ZWQKPm1lbW9y
eS1hZmZpbml0eSByZWNvcmQgYmVmb3JlIGFjY2Vzc2luZyB0eXBlZCBmaWVsZHMuCj4KCkZpeGVz
OiAwMmEzZTNjZGI3ZjEgKCJ4ODYvYm9vdDogUGFyc2UgU1JBVCB0YWJsZSBhbmQgY291bnQgaW1t
b3ZhYmxlIG1lbW9yeSByZWdpb25zIikKCj5TaWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2pp
YWxlMDJAMTYzLmNvbT4KPi0tLQo+IGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9hY3BpLmMgfCAx
OSArKysrKysrKysrKysrKysrLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQv
YWNwaS5jIGIvYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL2FjcGkuYwo+aW5kZXggYWVkMjc2MDRj
MTFmLi4zMTBkZGI5MjQzYjggMTAwNjQ0Cj4tLS0gYS9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQv
YWNwaS5jCj4rKysgYi9hcmNoL3g4Ni9ib290L2NvbXByZXNzZWQvYWNwaS5jCj5AQCAtMjg5LDE0
ICsyODksMjIgQEAgaW50IGNvdW50X2ltbW92YWJsZV9tZW1fcmVnaW9ucyh2b2lkKQo+IAkJcmV0
dXJuIDA7Cj4gCj4gCXRhYmxlX2hlYWRlciA9IChzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgKil0
YWJsZV9hZGRyOwo+KwlpZiAodGFibGVfaGVhZGVyLT5sZW5ndGggPCBzaXplb2Yoc3RydWN0IGFj
cGlfdGFibGVfc3JhdCkpCj4rCQlyZXR1cm4gMDsKPisKPiAJdGFibGVfZW5kID0gdGFibGVfYWRk
ciArIHRhYmxlX2hlYWRlci0+bGVuZ3RoOwo+IAl0YWJsZSA9IHRhYmxlX2FkZHIgKyBzaXplb2Yo
c3RydWN0IGFjcGlfdGFibGVfc3JhdCk7Cj4gCj4tCXdoaWxlICh0YWJsZSArIHNpemVvZihzdHJ1
Y3QgYWNwaV9zdWJ0YWJsZV9oZWFkZXIpIDwgdGFibGVfZW5kKSB7Cj4rCXdoaWxlICh0YWJsZSA8
IHRhYmxlX2VuZCkgewo+KwkJaWYgKHRhYmxlX2VuZCAtIHRhYmxlIDwgc2l6ZW9mKHN0cnVjdCBh
Y3BpX3N1YnRhYmxlX2hlYWRlcikpIHsKPisJCQlkZWJ1Z19wdXRzdHIoIkludmFsaWQgdHJ1bmNh
dGVkIFNSQVQgc3VidGFibGUgaGVhZGVyLlxuIik7Cj4rCQkJcmV0dXJuIDA7Cj4rCQl9Cj4gCj4g
CQlzdWJfdGFibGUgPSAoc3RydWN0IGFjcGlfc3VidGFibGVfaGVhZGVyICopdGFibGU7Cj4tCQlp
ZiAoIXN1Yl90YWJsZS0+bGVuZ3RoKSB7Cj4tCQkJZGVidWdfcHV0c3RyKCJJbnZhbGlkIHplcm8g
bGVuZ3RoIFNSQVQgc3VidGFibGUuXG4iKTsKPisJCWlmIChzdWJfdGFibGUtPmxlbmd0aCA8IHNp
emVvZigqc3ViX3RhYmxlKSB8fAo+KwkJICAgIHN1Yl90YWJsZS0+bGVuZ3RoID4gdGFibGVfZW5k
IC0gdGFibGUpIHsKPisJCQlkZWJ1Z19wdXRzdHIoIkludmFsaWQgU1JBVCBzdWJ0YWJsZSBsZW5n
dGguXG4iKTsKPiAJCQlyZXR1cm4gMDsKPiAJCX0KPiAKPkBAIC0zMDQsNiArMzEyLDExIEBAIGlu
dCBjb3VudF9pbW1vdmFibGVfbWVtX3JlZ2lvbnModm9pZCkKPiAJCQlzdHJ1Y3QgYWNwaV9zcmF0
X21lbV9hZmZpbml0eSAqbWE7Cj4gCj4gCQkJbWEgPSAoc3RydWN0IGFjcGlfc3JhdF9tZW1fYWZm
aW5pdHkgKilzdWJfdGFibGU7Cj4rCQkJaWYgKHN1Yl90YWJsZS0+bGVuZ3RoIDwgc2l6ZW9mKCpt
YSkpIHsKPisJCQkJZGVidWdfcHV0c3RyKCJJbnZhbGlkIG1lbW9yeSBhZmZpbml0eSBzdWJ0YWJs
ZS5cbiIpOwo+KwkJCQlyZXR1cm4gMDsKPisJCQl9Cj4rCj4gCQkJaWYgKCEobWEtPmZsYWdzICYg
QUNQSV9TUkFUX01FTV9IT1RfUExVR0dBQkxFKSAmJiBtYS0+bGVuZ3RoKSB7Cj4gCQkJCWltbW92
YWJsZV9tZW1bbnVtXS5zdGFydCA9IG1hLT5iYXNlX2FkZHJlc3M7Cj4gCQkJCWltbW92YWJsZV9t
ZW1bbnVtXS5zaXplID0gbWEtPmxlbmd0aDsKPi0tIAo+Mi4zNC4xCg==
