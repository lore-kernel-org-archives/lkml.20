Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7101C457E50
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980810; cv=none; b=YxqO94bSoeWhtau8rG6kMmIW12qAvxIlOOKJFD7RkBAMh0Nwchwi/CuK6aXJkhvTLJfZkhWdoo4VsSC1YVfWs6K/bIHP+21LLk7d2bVmHMST4GD52QEVNk21cjjzMA+qwsw28JNBObDWs72N/fd8b7WlEbmiCIresKzi3TLUyaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980810; c=relaxed/simple;
	bh=BPFQ6qwZlRI0RSR6K8QZz2CsmVQcQDW90E8os4JRzYc=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=jJb43VK8WpFGPVJ+yG3Z1eKEEGTUNfClUGQCASMw84+utXs6t+/KP3bIfxgZbFlPonVb1qyDn6+H4TtMgsb5f1nOXPCKSiIELVq3MSjD9L1nGdhYh19I2SMKE81G+81hHIUI0bp9DI6mblUmfVPxbmwJZoItLlUNrXpUmf+MjkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GYfksDKF; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GYfksDKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=BPFQ6qwZlRI0RSR6K8QZz2CsmVQcQDW90E8os4JRzYc=; b=G
	YfksDKFLe50JdzIUPChsMMtaTiv6toqTpfejeowrEcZEyC3srmpWbD60pcsfSTWS
	JR3j2KeI9gjkOtOzWSvcXRaqO4XF9vVxVFVS5oHpxz5N0EVCMZS/wbje5RhPLCay
	uSdpgI6fJIX8lAhTBM5/Wsoj9a//z0ZO+o6wvjp90Y=
Date: Mon, 21 Sep 2026 16:53:15 +0800 (CST)
From: CJ <firefly0158@163.com>
To: rpeterso@redhat.com, agruenba@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [BUG] gfs2: WARNING in gfs2_check_blk_type on a crafted image
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/WTv08i4yeQZukdmEsTju82UcS4ufQl245Xc/sEuADE1wYGfV5FGUX59tmTLwSKmzOZcTJQ8uBIdIhWH2rB2tWbabAoNqAEPH9mCg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <40b1fda4.85ed.1a0c32b638e.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:cSgvCgBnD1J78LBq9ENLAA--.55397W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3hsh0mqw8HtxPQAA3r
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGFuIGlzc3VlIHRyaWdnZXJlZCBieSBhIHN5emthbGxlciBy
ZXByb2R1Y2VyIG9uIExpbnV4CjcuMy4wLXJjMi4gVGhlIGlzc3VlIGlzIHJlcHJvZHVjaWJsZSB3
aXRoIEhFQUQgY29tbWl0CmRmMjkwODA5MGNkYTM2OGIwMWZmNDM3MDlmNTE4OTAwNzZjNTYxNTcu
CgoKVGhlIHJlcHJvZHVjZXIgbW91bnRzIGEgY3JhZnRlZCBHRlMyIGltYWdlIGFuZCB0aGVuIGNh
bGxzCm9wZW5fYnlfaGFuZGxlX2F0KCkgd2l0aCBhIGhhbmQtYnVpbHQgc21hbGwgZmlsZSBoYW5k
bGUuIE5vIG9yZGluYXJ5IGZpbGUKb3BlcmF0aW9uIGlzIG5lZWRlZDsgdGhlIGZhaWx1cmUgY29t
ZXMgZnJvbSByZXNvbHZpbmcgdGhhdCBoYW5kbGUuCgoKUmVzb2x2aW5nIHRoZSBoYW5kbGUgcnVu
cyBnZnMyX2ZoX3RvX2RlbnRyeSgpIC0+IGdmczJfbG9va3VwX2J5X2ludW0oKSAtPgpnZnMyX2lu
b2RlX2xvb2t1cCgpIC0+IGdmczJfY2hlY2tfYmxrX3R5cGUoKS4gVGhlIGJsb2NrIGFkZHJlc3Mg
dGFrZW4gZnJvbQp0aGUgaGFuZGxlIGNhbm5vdCBiZSBtYXBwZWQgaW50byBpdHMgcmVzb3VyY2Ug
Z3JvdXAsIHNvCmdmczJfcmJtX2Zyb21fYmxvY2soKSByZXR1cm5zIGFuIGVycm9yIGFuZCB0aGUg
V0FSTl9PTl9PTkNFKCkgaW4KZ2ZzMl9jaGVja19ibGtfdHlwZSgpIGZpcmVzLiBUaGUgd29yayBp
cyBkb25lIGluIHRoZSBjYWxsaW5nIHRhc2sncyBzeXNjYWxsCmNvbnRleHQuCgoKVGhpcyBsb29r
cyBsaWtlIHRoZSBibG9jayBudW1iZXIgaW4gdGhlIGZpbGUgaGFuZGxlIGJlaW5nIHVzZWQgYmVm
b3JlIGl0IGlzCmNoZWNrZWQgYWdhaW5zdCB0aGUgcmVzb3VyY2UgZ3JvdXAgaXQgY2xhaW1zIHRv
IGJlbG9uZyB0by4gQmVjYXVzZQpvcGVuX2J5X2hhbmRsZV9hdCgpIGlzIHJlYWNoYWJsZSB3aXRo
IHVucHJpdmlsZWdlZCwgdXNlci1zdXBwbGllZCBoYW5kbGVzLAp2YWxpZGF0aW5nIHRoZSBibG9j
ayBhZGRyZXNzIGFnYWluc3QgdGhlIHJlc291cmNlIGdyb3VwIGdlb21ldHJ5IGJlZm9yZSB0aGUK
bG9va3VwIHdvdWxkIGJlIHRoZSBndWFyZC4gSSBoYXZlIG5vdCBkZXRlcm1pbmVkIHdoaWNoIGZp
ZWxkIG9mIHRoZSBoYW5kbGUKY2FycmllcyB0aGUgb3V0LW9mLXJhbmdlIGJsb2NrIG51bWJlci4K
CgpUaGlzIGZhaWx1cmUgd2FzIHJlcG9ydGVkIGVhcmxpZXIgYWdhaW5zdCB0aGUgbGludXgtNi4x
IGxvbmd0ZXJtIHNlcmllcyBhdApodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0
aWQ9MTdiMWQ2ZTQzYmY2N2RjZmM5YzcsIGFuZCB0aGUKcmVwcm9kdWNlciBiZWxvdyBpcyB0aGUg
b25lIGZyb20gdGhhdCByZXBvcnQuIEl0IHN0aWxsIHJlcHJvZHVjZXMgb24gdGhlCnRlc3RlZCBt
YWlubGluZSBrZXJuZWwuCgoKUmVwcm9kdWNlcjoKCgpzeXogcmVwcm9kdWNlcjrCoMKgaHR0cHM6
Ly9wYXN0ZWJpbi5jb20vcmF3L1Y3QmFOTVJkCmNvbnNvbGUgb3V0cHV0OsKgaHR0cHM6Ly9wYXN0
ZWJpbi5jb20vcmF3L2hza3Q3UUtwCmtlcm5lbCBjb25maWc6IGh0dHBzOi8vc3l6a2FsbGVyLmFw
cHNwb3QuY29tL3RleHQ/dGFnPUtlcm5lbENvbmZpZyZ4PWUxZTkwNjY4MTAzMDcyOTkKCgpLZXJu
ZWw6CgoKSEVBRCBjb21taXQ6IGRmMjkwODA5MGNkYTM2OGIwMWZmNDM3MDlmNTE4OTAwNzZjNTYx
NTcKZ2l0IHRyZWU6IG1haW5saW5lCmtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1yYzIKdGVzdGVkIHRh
ZzogdjcuMy1yYzIgKGFubm90YXRlZCB0YWcgb2JqZWN0IDVlMDM2Y2UxMmRlOTFjNmZkNjc0ZGFk
MzNiMTY5YzYxNTBiZTJhN2EpCgoKTGV0IG1lIGtub3cgaWYgeW91IG5lZWQgbW9yZSBkZXRhaWxz
IG9yIHRlc3RpbmcuCgoKQmVzdCByZWdhcmRzLApDaGFuZ2ppYW4gTGl1wqA=
