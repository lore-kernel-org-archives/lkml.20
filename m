Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD43FC5C9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418956; cv=none; b=kgnkb4iPGjFvspnP9qX9VmP2Y9bDa8x6T139nI3/yceuctfv+70UH3Dlg9dSdyaiSWPRmpYislB/qIb342R9vvV9mLiwh1/q4BL+TV3d/EhncAKLF7gDnaA6nwZHkgnO52VykBWQq/b5wrlyntWu09JPKUkEd/hqmvtUCReUmY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418956; c=relaxed/simple;
	bh=SotAirYs3BmbdbKpWC2BAMc4+T2PuifjXLdUL4tjGpY=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=qmiIKWobvMkZb8oymWIpk7Vn26r6BFoMtJomy+uUQsIMRdUgcTjpczgGwFoIWnRot6HCkPfIZAxy+noWc0m8oJt/wYy1h9hlfp6ajVd0cOfeV6Svbljqjf68HARIOKtiHnPGohNfR49QnmZxfmeMRDbi/LQPmquorK6n3Q1nl6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=K9k+KcZP; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="K9k+KcZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=SotAirYs3BmbdbKpWC2BAMc4+T2PuifjXLdUL4tjGpY=; b=K
	9k+KcZPNUE6UEVZBEwwJAvMIe6xCso9e6wSUxmtKVe8RvcRoJbwxPrjjwX4Y9RsU
	aznSL9G8dKDe3GdLhB8hbbKl7dV33b4bwMKCFE5gi6KC8slWSPP99A0Mxej8EvAE
	LPVwFYP0/o+UdELbGPsVdffBzxCs2GmC4w2sbYmx1M=
Date: Thu, 3 Sep 2026 15:01:24 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	syzbot+50ede9e39602b45e19f9@syzkaller.appspotmail.com
Subject:  [BUG] jfs: kernel BUG in dbFindBits on v7.2-rc3
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TCviat0Aj4iGfbOkdnk8aj+g+UcCwufkj24Bfc+8GgRv84DoEfW1FPnbL6uekLwG0vT6TaBlX0txmU4J4gqVNeNpKGEpyeveGcKEOsQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <714a38e2.5550.1a06612825a.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kygvCgD3X+pEG5lqZoU+AA--.7628W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3QTYimqZG0Rt+gAA3w
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIHRoYXQga2VybmVsIEJVRyBpbiBkYkZpbmRCaXRzIHJlbWFp
bnMgcmVwcm9kdWNpYmxlIHdpdGggYQptaWdyYXRlZCBzeXprYWxsZXIgcmVwcm9kdWNlciBvbiBM
aW51eCA3LjItcmMzLiBUaGUgdGVzdGVkIEhFQUQgY29tbWl0IGlzCmExM2MxNDBjYzI4OWMwYjdi
Mzc3MGJjZTViM2FkNDJhYjM1MDc0YWEuCgoKVGhlIHJlcHJvZHVjZXIgbW91bnRzIGEgY3JhZnRl
ZCBKRlMgaW1hZ2UgYW5kIGNyZWF0ZXMgYSBmaWxlLCBjYXVzaW5nIGJsb2NrCmFsbG9jYXRpb24g
dGhyb3VnaCBkYkFsbG9jKCksIGRiQWxsb2NBRygpLCBhbmQgZGJBbGxvY0RtYXBMZXYoKS4KCgpU
aGUgYWxsb2NhdG9yIHJlYWNoZXMgZGJGaW5kQml0cygpIHdpdGggaW5jb25zaXN0ZW50IGRtYXAg
bWV0YWRhdGEgYW5kCnRyaWdnZXJzIGEga2VybmVsIEJVRyBmb2xsb3dlZCBieSBhIGZhdGFsIGV4
Y2VwdGlvbi4KCgpUaGlzIGxvb2tzIGxpa2UgbWlzc2luZyB2YWxpZGF0aW9uIG9mIGNvcnJ1cHRl
ZCBKRlMgZG1hcCBzdGF0ZSBiZWZvcmUgdGhlCmFsbG9jYXRpb24gc2VhcmNoIHJlYWNoZXMgYW4g
aW50ZXJuYWwgaW52YXJpYW50IGluIGRiRmluZEJpdHMoKS4KCgpUaGlzIGlzc3VlIHdhcyBwcmV2
aW91c2x5IHJlcG9ydGVkIGF0OgoKCmh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9l
eHRpZD01MGVkZTllMzk2MDJiNDVlMTlmOQoKClJlcHJvZHVjZXI6CgoKc3l6IHJlcHJvZHVjZXI6
IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9TUGlSbnVRVQoKCmNvbnNvbGUgb3V0cHV0OiBodHRw
czovL3Bhc3RlYmluLmNvbS9yYXcva2lUbUVpd3MKa2VybmVsIGNvbmZpZzogaHR0cHM6Ly9wYXN0
ZWJpbi5jb20vcmF3L1MwWDVTcVI3CgoKS2VybmVsOgoKCkhFQUQgY29tbWl0OiBhMTNjMTQwY2My
ODljMGI3YjM3NzBiY2U1YjNhZDQyYWIzNTA3NGFhCmdpdCB0cmVlOiB0b3J2YWxkcy9saW51eApr
ZXJuZWwgdmVyc2lvbjogNy4yLjAtcmMzICMxIFBSRUVNUFQoZnVsbCkKdGVzdGVkIHRhZzogdjcu
Mi1yYzMKCgpMZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGRldGFpbHMgb3IgdGVzdGluZy4K
CgpCZXN0IHJlZ2FyZHM=
