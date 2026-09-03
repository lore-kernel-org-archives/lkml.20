Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C0329C60
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405308; cv=none; b=WrmEODVJhzZ8esAHsJolhDBq501Ndo8Xb7yg5H9fGJQ8Va3nydR6/gWjfDRxW2+pDJKxH+A7q9R0mZVvzg1sqk+OKfcSyBjY1POgcbmfOy/e6gHorlizKhmMcihc2Cwsi2RUyHFJ4KMcJHY23jgLtCKCiRjRTA2WGCnX1P2Nu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405308; c=relaxed/simple;
	bh=HVaqmg8FV1YZ0q2hhsoEALM5vnRSY6kXKAfukQJc6dk=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=I1l30l0LIenZug9zqHT4uNRsSl09meYgptXtslwKD1lujm7uUbArsSIU/cn+q4/Z2x4SJF7i7r2aabkl8/z3D5tK0Sq+Krhtr1wC+OZi/ac9rO9BSKvZXVZyZd4YiZLREHuD3Tw/q9kw+8yY7IFDQY5oOvxscd+PFMsbSlA+xXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mc1CDzvj; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mc1CDzvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=HVaqmg8FV1YZ0q2hhsoEALM5vnRSY6kXKAfukQJc6dk=; b=m
	c1CDzvjINjEcW2elr9Tp7veyQoq7G4J/7Klzg1/ANOcz385GzSUHR51FbBW49IwM
	vUYquoZ5cTGtMl6FJ3giKQUQliYC6igTZ5j6yiF9LJTW846iHWIOtj6y89blipE8
	mRjMeaH65N3vieIi6CK1nm9IZTTkphh1WVwwdhJ5ow=
Date: Thu, 3 Sep 2026 11:14:28 +0800 (CST)
From: CJ <firefly0158@163.com>
To: jaegeuk@kernel.org, chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	syzbot+0b1e85354f790743db08@syzkaller.appspotmail.com
Subject: [BUG] f2fs: possible KASAN use-after-free in f2fs_iget on v7.2-rc3
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TCvibukot7iacYOkdnk8aj+g+UcCwufkj24Bfc+8GgRv84DoEfW1FPnbL6uekLwG0vT6TaBlX0txmU4J4jMFR5/diWdSgtB0CSgq1zQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <d1f8ae2.2f3a.1a06542c0ac.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kygvCgDXPzcV5phq5FI+AA--.6945W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC+hV-MWqY5hV0+QAA3t
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKSSBhbSByZXBvcnRpbmcgYSBwb3NzaWJsZSByZWN1cnJlbmNlIG9mIGEgS0FTQU4gdXNl
LWFmdGVyLWZyZWUgdHJpZ2dlcmVkCmJ5IGEgc3l6a2FsbGVyIHJlcHJvZHVjZXIgb24gTGludXgg
Ny4yLXJjMy4gVGhlIGlzc3VlIGlzIHJlcHJvZHVjaWJsZQp3aXRoIEhFQUQgY29tbWl0IGExM2Mx
NDBjYzI4OWMwYjdiMzc3MGJjZTViM2FkNDJhYjM1MDc0YWEuCgpUaGUgcmVwcm9kdWNlciBtb3Vu
dHMgYSBjcmFmdGVkIEYyRlMgZmlsZXN5c3RlbSBpbWFnZSBhbmQgaW52b2tlcwpvcGVuX2J5X2hh
bmRsZV9hdCgpIHdpdGggYSBtYWxmb3JtZWQgZmlsZSBoYW5kbGUuIFRoaXMgcmVhY2hlcwpmMmZz
X25mc19nZXRfaW5vZGUoKSBhbmQgZjJmc19pZ2V0KCksIHdoZXJlIHRoZSBpbm9kZSBhbmQgaXRz
IGV4dGVudApjYWNoZSBhcmUgaW5pdGlhbGl6ZWQgYW5kIHZhbGlkYXRlZC4KClRoZSBhcmNoaXZl
ZCB0YXJnZXQgY3Jhc2ggcmVwb3J0IHNob3dzIGEgdXNlLWFmdGVyLWZyZWUgcmVhZCBpbgpzYW5p
dHlfY2hlY2tfaW5vZGUoKSwgY2FsbGVkIGZyb20gZG9fcmVhZF9pbm9kZSgpIGFuZCBmMmZzX2ln
ZXQoKS4gVGhlCmFmZmVjdGVkIG9iamVjdCBiZWxvbmdzIHRvIHRoZSBmMmZzX2V4dGVudF90cmVl
IGNhY2hlLiBJdCB3YXMgYWxsb2NhdGVkCmJ5IGYyZnNfaW5pdF9leHRlbnRfdHJlZSgpIGFuZCBm
cmVlZCBieSBmMmZzX2Rlc3Ryb3lfZXh0ZW50X3RyZWUoKQpkdXJpbmcgaW5vZGUgZXZpY3Rpb24u
CgpUaGlzIGxvb2tzIGxpa2UgYW4gZXh0ZW50LXRyZWUgbGlmZXRpbWUgaXNzdWUgaW4gYW4gZjJm
c19pZ2V0KCkgZXJyb3IKcGF0aC4gQSBzdGFsZSBleHRlbnRfdHJlZSBwb2ludGVyIG1heSByZW1h
aW4gYWNjZXNzaWJsZSBhZnRlciBhIGZhaWxlZAppbm9kZSBsb29rdXAgY2F1c2VzIHRoZSBpbm9k
ZSBhbmQgaXRzIGV4dGVudCB0cmVlIHRvIGJlIGV2aWN0ZWQuCgpUaGlzIGFwcGVhcnMgcmVsYXRl
ZCB0byB0aGUgZm9sbG93aW5nIHByZXZpb3VzbHkgcmVwb3J0ZWQgaXNzdWUsIHdoaWNoCndhcyBv
cmlnaW5hbGx5IG9ic2VydmVkIG9uIExpbnV4IDUuMTU6CgpodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS9idWc/ZXh0aWQ9MGIxZTg1MzU0Zjc5MDc0M2RiMDgKClJlcHJvZHVjZXI6CgpzeXog
cmVwcm9kdWNlcjogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0xHQ2JZaXFMCgpjb25zb2xlIG91
dHB1dDogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0Z6U2VjRmJUCmtlcm5lbCBjb25maWc6IGh0
dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9QWnNGNTYyVgoKS2VybmVsOgoKSEVBRCBjb21taXQ6IGEx
M2MxNDBjYzI4OWMwYjdiMzc3MGJjZTViM2FkNDJhYjM1MDc0YWEKZ2l0IHRyZWU6IHRvcnZhbGRz
L2xpbnV4Cmtlcm5lbCB2ZXJzaW9uOiA3LjIuMC1yYzMgIzEgUFJFRU1QVChmdWxsKQp0ZXN0ZWQg
dGFnOiB2Ny4yLXJjMwoKTGV0IG1lIGtub3cgaWYgeW91IG5lZWQgbW9yZSBkZXRhaWxzIG9yIHRl
c3RpbmcuCgpCZXN0IHJlZ2FyZHM=
