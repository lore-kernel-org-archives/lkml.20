Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F643D3314
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374047; cv=none; b=YuNSKQMKxMIwBJ52qE8LvmF9xj9y5PcPenRVXxaw4b3LuXQe0R2VFDop3tngL2M8ms2irWJxnqQOIkED0y2fSL3yaDgkeGwFGp152f6m4qfhOe3NWV6LQaWUwJbv6SZU8CQFRCFHjL58+yGIIzN2aISYgFApw3fCXWttbDKjsSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374047; c=relaxed/simple;
	bh=Y2M3C3Qm/rkMgvXchYRauWiFqIscj5B5fRKV8vWWMbU=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=XmSjeLsFw+5e5N0/p8+gKu3aEnHor1V2qouhjvOi+6ZqnElvGagn2o384snBDuoptdUsVKsYTAMuLhysdPZ9HW9lazVJ7L2HMilWy1kRnDjRSMeSzxz/aIZGbQueUQY3wQedpqQiJFmphWSHjnYNX12t/WsZ0VyZWeiw6APEFsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ItDMRtuQ; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ItDMRtuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Y2M3C3Qm/rkMgvXchYRauWiFqIscj5B5fRKV8vWWMbU=; b=I
	tDMRtuQDwpx6ah7bDSkSYCtbUu0nzipH3WxobRxZPwkS9qqPlSmEroqGv0tmMcNc
	AI/7EMLlFRbZWYguNL0SXKFw3Bh2akNlxjCjJOFeWXKPYf5O+m0SfBnwkmloiGz9
	n+et3az6OODgGwA7penRIlg5CtMs++3eUtqjVEVnMw=
Date: Mon, 14 Sep 2026 16:20:08 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org, zheng.yu@northwestern.edu
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: KASAN slab-use-after-free in dtSplitPage
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/+cu0gr7iOQbekdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/IXQGT/Ub38VtI/5vt14xxQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <63f1d46b.7a22.1a09f008c52.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3P8A4rqdq_CwPAA--.18660W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3hg+72qnrjiPwQAA3C
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGksCgoKSSBhbSByZXBvcnRpbmcgYSBLQVNBTiBzbGFiLXVzZS1hZnRlci1mcmVlIGluIHRoZSBK
RlMgZGlyZWN0b3J5IEItdHJlZSBjb2RlLAp0cmlnZ2VyZWQgYnkgYSBzeXprYWxsZXIgcmVwcm9k
dWNlciB0aGF0IG1vdW50cyBhIGNyYWZ0ZWQgSkZTIGltYWdlLiAgVGhlIGlzc3VlCmlzIHJlcHJv
ZHVjaWJsZSB3aXRoIEhFQUQgY29tbWl0IGNlZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2
MjNmMmI5MzUKKHY3LjMtcmMxLCBMaW51eCA3LjMuMC1yYzEpLgoKClRoZSByZXByb2R1Y2VyIG1v
dW50cyBhIGNyYWZ0ZWQgSkZTIGZpbGVzeXN0ZW0gaW1hZ2Ugb24gYSBsb29wIGRldmljZSBhbmQK
cGVyZm9ybXMgb3BlcmF0aW9ucyB0aGF0IGZvcmNlIGEgZGlyZWN0b3J5IHBhZ2Ugc3BsaXQuCgoK
S0FTQU4gcmVwb3J0cyBhIHNsYWItdXNlLWFmdGVyLWZyZWUgd2l0aCBhIDEtYnl0ZSB3cml0ZSwg
d2l0aCB0aGUgcmVwb3J0CmF0dHJpYnV0aW5nIHRoZSBhY2Nlc3MgdG8gZHRNb3ZlRW50cnkgaW5s
aW5lZCBpbnRvIGR0U3BsaXRQYWdlIGF0CmZzL2pmcy9qZnNfZHRyZWUuYy4gIFRoZSB3cml0ZSBs
YW5kcyBpbiBhbiBvYmplY3QgZnJvbSBhIHNsYWIgY2FjaGUgdGhhdCBoYWQKYWxyZWFkeSBiZWVu
IGZyZWVkIHdoZW4gdGhlIHNwbGl0IG1vdmVkIGVudHJpZXMgYmV0d2VlbiBwYWdlcy4KCgpPbmUg
cG9zc2libGUgY2F1c2UgaXMgdGhhdCBkdFNwbGl0UGFnZSBrZWVwcyB1c2luZyBhIGRpcmVjdG9y
eSBwYWdlIGJ1ZmZlciBhZnRlcgp0aGUgc3BsaXQgcGF0aCBoYXMgcmVsZWFzZWQgaXQsIHNvIHRo
ZSBlbnRyeSBtb3ZlIHdyaXRlcyBpbnRvIGZyZWVkIG1lbW9yeS4gIEluCnRoZSBvcmlnaW5hbCBy
ZXBvcnQgdGhlIHNhbWUgYWNjZXNzIHdhcyByZXBvcnRlZCBhdCBhIHNtYWxsZXIgb2Zmc2V0IGlu
c2lkZSB0aGUKc2FtZSBmdW5jdGlvbjsgdGhlIG9mZnNldHMgZGlmZmVyIGJlY2F1c2UgdGhlIGZ1
bmN0aW9uIGlzIGxhcmdlIGFuZCB0aGUgYnVpbGQKZGlmZmVycywgYnV0IHRoZSB0aXRsZSwgdGhl
IGFjY2VzcyB0eXBlIGFuZCB0aGUgaW5saW5lZCBjYWxsZXIgYXJlIGlkZW50aWNhbC4KVGhpcyBs
b29rcyBsaWtlIGEgcGFnZS1idWZmZXIgbGlmZXRpbWUgcHJvYmxlbSBpbiB0aGUgZHRyZWUgc3Bs
aXQgcGF0aCByYXRoZXIKdGhhbiBhIGJvdW5kcyBlcnJvci4gIEkgYW0gcmVwb3J0aW5nIHRoZSBz
YW5pdGl6ZXIgZmluZGluZyBhbmQgdGhlIHBhdGggYXMKb2JzZXJ2ZWQuCgoKVGhpcyBhcHBlYXJz
IHRvIGJlIGEgcmVjdXJyZW5jZSBvZiB0aGUgc3l6Ym90IGlzc3VlIHdob3NlIGV4dGVybmFsIGlk
IGlzCjYzYzQwYTNlZjQ1ZmNlOTQ0NzM5LCB0aXRsZSAiS0FTQU46IHNsYWItdXNlLWFmdGVyLWZy
ZWUgaW4gZHRTcGxpdFBhZ2UiLiAgSXQKcmVtYWlucyByZXByb2R1Y2libGUgb24gdjcuMy1yYzEu
CgoKUmVwcm9kdWNlcjogCgoKc3l6IHJlcHJvZHVjZXI6aHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3
L1NkazF2WTl3Cgpjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L0xtRFFt
bXlGCgprZXJuZWwgY29uZmlnOiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvUVNLU0ZEN3UKCgpL
ZXJuZWw6CgoKSEVBRCBjb21taXQ6IGNlZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNm
MmI5MzUKZ2l0IHRyZWU6IHVwc3RyZWFtIChsaW51eC5naXQpLCB0ZXN0ZWQgdGhyb3VnaCB0aGUg
djcuMy1yYzEgYW5ub3RhdGVkIHRhZyBvYmplY3QKwqAgwqAgwqAgwqAgwqAgwqBlNWUwNDcyNmNk
ZDA0M2UzMDk2NzcwNzFhYjFiNjVhNGIxOGY0MjJiCmtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1yYzEg
IzEgUFJFRU1QVChmdWxsKQp0ZXN0ZWQgdGFnOiB2Ny4zLXJjMSAoTGludXggNy4zLXJjMSwgMjAy
Ni0wOC0zMCkKCgpMZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGRldGFpbHMgb3IgdGVzdGlu
Zy4KCgpCZXN0IHJlZ2FyZHMsCkNoYW5namlhbgoKCgo=
