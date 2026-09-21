Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BE846C82A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984314; cv=none; b=a3CH9YA+XymEOKPdndbMz1ya/8eMElgCdQbBAvMwKiS6skaT2d2BI6g473CArB9jKv9527wDofQrzXc8li2Ec3yGaff+QrF6w5+cuUK8CD0trU4d23dAkIAS1+ydiXvoaXHh5EVlWKf3dUF65HSS3kIYfvqQLOTBmmFnqkI7aLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984314; c=relaxed/simple;
	bh=+O8gyn2Mqkan+W4ZBHc1wagKKlf2Rmp8YBIp3cohN9M=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=ISSRfauyKS6RhrM5KdZXtw8JNd3X/rrND7oC1dT+uLDYoDrUmdMT1NP0sw/JTyI0VhUj1ATjlVl2L4hEecrq0nYMymK1USsXkwQ4ysetSCgLa+n2xaKtFBxPGtwP9V2IQZj8p9JK4I1IcjCn2Oi/f2ByMbnHqXYIsuJqv+K243A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QxYuVVm/; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QxYuVVm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=+O8gyn2Mqkan+W4ZBHc1wagKKlf2Rmp8YBIp3cohN9M=; b=Q
	xYuVVm/Qnf8bpGPTIQ6OVH1Qim61WXmWd8zhvJiRQQJRP9Ottz6crWL/HER+Ypv5
	SeLTwi7A3CY0eHnhYURMi+bT5aavt+ymLWMB2V6GK8CiUS/wqiQ7VyjWnkxgIId2
	bYuZsYqSDJMnr+OKMkFSyqmhPSa7G7y11MM2Z17bj8=
Date: Mon, 21 Sep 2026 17:51:22 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: assertion failure in dbFindBits on a crafted image
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/WTu0oj5CeeY+kdmEsTju82UcS4ufQl245Xc/sEuADE1wYGfV5FGUX59tmTLwSKmzOZcTJQ8uBIdIhWZNPDzsZlUsFVz117JdituQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <437bdf1f.9505.1a0c3609896.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cSgvCgDXf1Ib_rBqcVlLAA--.44248W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3RqMPmqw-hqvlwAA3z
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGFuIGlzc3VlIHRyaWdnZXJlZCBieSBhIHN5emthbGxlciBy
ZXByb2R1Y2VyIG9uIExpbnV4CjcuMy4wLXJjMi4gVGhlIGlzc3VlIGlzIHJlcHJvZHVjaWJsZSB3
aXRoIEhFQUQgY29tbWl0CmRmMjkwODA5MGNkYTM2OGIwMWZmNDM3MDlmNTE4OTAwNzZjNTYxNTcu
CgoKVGhlIHJlcHJvZHVjZXIgbW91bnRzIGEgY3JhZnRlZCBKRlMgaW1hZ2Ugd2l0aCBlcnJvcnM9
Y29udGludWUsIHVzcnF1b3RhIGFuZAppbnRlZ3JpdHkgb3B0aW9ucywgdGhlbiBjcmVhdGVzIGEg
ZGlyZWN0b3J5IGVudHJ5IG9uIGl0LiBDcmVhdGluZyB0aGUgZW50cnkKbWFrZXMgSkZTIGV4dGVu
ZCB0aGUgZGlyZWN0b3J5LCB3aGljaCBhbGxvY2F0ZXMgYmxvY2tzIGFuZCB3YWxrcyB0aGUgYmxv
Y2sKYWxsb2NhdGlvbiBtYXAuCgoKRHVyaW5nIGFsbG9jYXRpb24sIGRiRmluZEJpdHMoKSBzY2Fu
cyBhIDMyLWJpdCB3b3JkIG9mIHRoZSBhbGxvY2F0aW9uIG1hcApsb29raW5nIGZvciBhIHJ1biBv
ZiBmcmVlIGJpdHMgYXQgdGhlIHJlcXVlc3RlZCBhbGlnbm1lbnQuIE5vIHJ1biBpcyBmb3VuZAph
bmQgdGhlIGxvb3AgcnVucyBvZmYgdGhlIGVuZCBvZiB0aGUgd29yZCwgc28gdGhlIEFTU0VSVChi
aXRubyA8IDMyKSBpbnNpZGUKZGJGaW5kQml0cygpIHRlcm1pbmF0ZXMgdGhlIGtlcm5lbC4gVGhl
IGNhbGwgcGF0aCBpcyBkYkFsbG9jKCkgLT4KZGJBbGxvY0FHKCkgLT4gZGJBbGxvY0N0bCgpIC0+
IGRiQWxsb2NEbWFwTGV2KCkgLT4gZGJGaW5kQml0cygpLCByZWFjaGVkCmZyb20gamZzX2NyZWF0
ZSgpIGluIHRoZSBta2Rpci9vcGVuIHN5c2NhbGwgY29udGV4dC4KCgpUaGlzIGxvb2tzIGxpa2Ug
YW4gaW5jb25zaXN0ZW5jeSBiZXR3ZWVuIHRoZSBvbi1kaXNrIGFsbG9jYXRpb24gbWFwIGFuZCB0
aGUKZXh0ZW50IHRoZSBmaWxlc3lzdGVtIGJlbGlldmVzIGl0IGNhbiBzYXRpc2Z5OiB0aGUgYWxs
b2NhdGlvbiByZXF1ZXN0IGFza3MKZm9yIG1vcmUgY29udGlndW91cyBmcmVlIGJpdHMgdGhhbiB0
aGUgbWFwIHBhZ2UgY29udGFpbnMuIFNpbmNlIHRoZSBpbnB1dCBpcwphbiB1bnRydXN0ZWQgaW1h
Z2UsIHR1cm5pbmcgdGhlIGFsbG9jYXRpb24gZmFpbHVyZSBpbnRvIGFuIGVycm9yIHJldHVybgpy
YXRoZXIgdGhhbiBhbiBhc3NlcnRpb24gd291bGQgYXZvaWQgdGFraW5nIHRoZSBrZXJuZWwgZG93
bi4gSSBoYXZlIG5vdAp0cmFjZWQgd2hpY2ggbWFwIGZpZWxkIGlzIGluY29uc2lzdGVudCB3aXRo
IHRoZSByZXF1ZXN0LgoKClRoaXMgZmFpbHVyZSB3YXMgcmVwb3J0ZWQgZWFybGllciBhZ2FpbnN0
IHRoZSBsaW51eC02LjEgbG9uZ3Rlcm0gc2VyaWVzIGF0Cmh0dHBzOi8vc3l6a2FsbGVyLmFwcHNw
b3QuY29tL2J1Zz9leHRpZD0zMDZiMjc4MTZkY2Y4NDJiYzgzZCwgYW5kIHRoZQpyZXByb2R1Y2Vy
IGJlbG93IGlzIHRoZSBvbmUgZnJvbSB0aGF0IHJlcG9ydC4gSXQgc3RpbGwgcmVwcm9kdWNlcyBv
biB0aGUKdGVzdGVkIG1haW5saW5lIGtlcm5lbC4KCgpSZXByb2R1Y2VyOgoKCnN5eiByZXByb2R1
Y2VyOsKgaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L3JYYk1aZWg2CmNvbnNvbGUgb3V0cHV0OsKg
aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3LzNNZHNqRFBuCmtlcm5lbCBjb25maWc6IGh0dHBzOi8v
c3l6a2FsbGVyLmFwcHNwb3QuY29tL3RleHQ/dGFnPUtlcm5lbENvbmZpZyZ4PTY4YWE1YTNhZjFj
Yjk1M2EKCgpLZXJuZWw6CgoKSEVBRCBjb21taXQ6IGRmMjkwODA5MGNkYTM2OGIwMWZmNDM3MDlm
NTE4OTAwNzZjNTYxNTcKZ2l0IHRyZWU6IG1haW5saW5lCmtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1y
YzIKdGVzdGVkIHRhZzogdjcuMy1yYzIgKGFubm90YXRlZCB0YWcgb2JqZWN0IDVlMDM2Y2UxMmRl
OTFjNmZkNjc0ZGFkMzNiMTY5YzYxNTBiZTJhN2EpCgoKTGV0IG1lIGtub3cgaWYgeW91IG5lZWQg
bW9yZSBkZXRhaWxzIG9yIHRlc3RpbmcuCgoKQmVzdCByZWdhcmRzLApDaGFuZ2ppYW4gTGl1
