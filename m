Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F853603EF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458453; cv=none; b=Rgfa9vXxQwdxqUTu425Ek54LsRILLaEx2aKcx/h9/fzQ4X7+L8N0WPv/hTec5ipeFEhLZPon07X0r6FQ8sS6Z9bZWj4cmswzDtsnTZUUbJgsBVHz/qu4/Ad+O/dh8wF4FBwuCNDFXLo+/zKYrWIK6LxkzwVvhSMtaSLSLon0Op4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458453; c=relaxed/simple;
	bh=pAJjx3QnJCX1mELlGgD5uZdSDxFvdQQuOaoh6/peGZs=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=aKz/FgPiYooPYFERkCDUdIzj6r44it5jbi1ZeZvqpcNsw39IKAFYiVbGE4R1nw/8QRylcCBYHjNc6BHaKkeis5F/lHxfkIGxrA/oJrhPt+BRSx3DcJbTnm3SitlVIQhAQi+tH5VzDfRnY6WNGWw3qJUuSzK1+PY1y70LXZ5aDq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G0+HpQZg; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G0+HpQZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=pAJjx3QnJCX1mELlGgD5uZdSDxFvdQQuOaoh6/peGZs=; b=G
	0+HpQZgrHU0Ywim2oa4/FwhA9o9BxClwvkRO+YB63dml1ibjfbkSj5SBqWhsuEgH
	BrcOpveGbcWLJoFaeaC+NCdfBa5f/yfLqhcBIHyfpzOWiUEbVjL4J8yerUPJJOsf
	uNMu2VcySHQXZgVLw1Rxwd1cHOqhtKCToCmO4wov78=
Date: Tue, 15 Sep 2026 15:46:59 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org, yun.zhou@windriver.com, mjguzik@gmail.com,
	brauner@kernel.org, ssrane_b23@ee.vjti.ac.in
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: kernel BUG in txAbort at fs/jfs/jfs_txnmgr.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/iet0wq7yORZOkdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/KP4bhtjTHz0nYxCN3VrmNA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1190e5d0.6c73.1a0a4088ec9.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3v6_z96hq7QoQAA--.21632W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3hP+sGqo9-PH1gAA3U
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEga2VybmVsIEJVRyBpbiB0aGUgSkZTIHRyYW5zYWN0aW9u
IGFib3J0IHBhdGgsIHRyaWdnZXJlZCBieSBhCnN5emthbGxlciByZXByb2R1Y2VyIHRoYXQgbW91
bnRzIGEgY3JhZnRlZCBKRlMgaW1hZ2UuICBUaGUgaXNzdWUgaXMgcmVwcm9kdWNpYmxlCndpdGgg
SEVBRCBjb21taXQgY2VlOTM5NWFjZDgwNDNiZTA2NDRiMjVjMzRiZmE4NjYyM2YyYjkzNSAodjcu
My1yYzEsIExpbnV4CjcuMy4wLXJjMSkuCgoKVGhlIHJlcHJvZHVjZXIgbW91bnRzIGEgY3JhZnRl
ZCBKRlMgZmlsZXN5c3RlbSBpbWFnZSBvbiBhIGxvb3AgZGV2aWNlIGFuZApwZXJmb3JtcyBvcGVy
YXRpb25zIHRoYXQgbWFrZSBKRlMgYWJvcnQgYSB0cmFuc2FjdGlvbi4gIEJlZm9yZSB0aGUgYWJv
cnQsIHRoZQpmaWxlc3lzdGVtIHJlcG9ydHMgdGhhdCB0eEFib3J0J3MgZW50cnkgbG9va3VwIHdh
cyBjYWxsZWQgd2l0aCBpbmRleCAwIGFuZCB0aGF0CmEgcmVhZF9tYXBwaW5nX3BhZ2UgY2FsbCBm
YWlsZWQsIHNvIHRoZSBhYm9ydCBpcyBydW5uaW5nIG9uIGFuIGFscmVhZHktZmFpbGluZwpwYXRo
LgoKClRoZSBjb25zb2xlIHNob3dzICJrZXJuZWwgQlVHIGF0IGZzL2pmcy9qZnNfdHhubWdyLmM6
Mjc5OCEiIHdpdGggdGhlCkludGVybmFsIGVycm9yOiBPb3BzIC0gQlVHIGNsYXNzIGFuZCBSSVAg
aW4gdHhBYm9ydC4gIFRoZSBhc3NlcnRpb24gYXQgdGhhdCBzaXRlCmlzIGFzc2VydChtcC0+bm9o
b21lb2spLCBzbyB0aGUgdHJhbnNhY3Rpb24gYmxvY2sgaXMgZXhwZWN0ZWQgdG8gc3RpbGwgYmUg
cGlubmVkCndoZW4gdGhlIGFib3J0IHJ1bnMuCgoKT25lIHBvc3NpYmxlIGNhdXNlIGlzIHRoYXQg
dGhlIHBhZ2UtcmVhZCBmYWlsdXJlIHBhdGggdGFrZW4gYmVmb3JlIHRoZSBhYm9ydApyZWxlYXNl
cyB0aGUgdHJhbnNhY3Rpb24gYmxvY2sncyBwaW4gYW5kIHRoZW4gc3RpbGwgY2FsbHMgdHhBYm9y
dCwgc28gdGhlCnBpbm5pbmcgaW52YXJpYW50IG5vIGxvbmdlciBob2xkcy4gIFRoaXMgbG9va3Mg
bGlrZSBhIHJlZmVyZW5jZS1jb3VudGluZyBwcm9ibGVtCm9uIGFuIGVycm9yIHBhdGggaW4gdGhl
IHRyYW5zYWN0aW9uIG1hbmFnZXIuICBJIGFtIHJlcG9ydGluZyB0aGUgYXNzZXJ0aW9uIGFuZAp0
aGUgcGF0aCBhcyBvYnNlcnZlZC4KCgpUaGlzIGFwcGVhcnMgdG8gYmUgYSByZWN1cnJlbmNlIG9m
IHRoZSBzeXpib3QgaXNzdWUgd2hvc2UgZXh0ZXJuYWwgaWQgaXMKZGNjYzJkNzczYmE5OTA0ZGI4
ZWEuICBJdCByZW1haW5zIHJlcHJvZHVjaWJsZSBvbiB2Ny4zLXJjMS4KCgpSZXByb2R1Y2VyOgoK
CnN5eiByZXByb2R1Y2VyOiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvZEtrUVFURjAKCmNvbnNv
bGUgb3V0cHV0OiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvN2pobVJxOTEKCmtlcm5lbCBjb25m
aWc6wqBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvcTNZaWVtVmgKCgpLZXJuZWw6CgoKSEVBRCBj
b21taXQ6IGNlZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzUKZ2l0IHRyZWU6
IHVwc3RyZWFtIChsaW51eC5naXQpLCB0ZXN0ZWQgdGhyb3VnaCB0aGUgdjcuMy1yYzEgYW5ub3Rh
dGVkIHRhZyBvYmplY3QKwqAgwqAgwqAgwqAgwqAgwqBlNWUwNDcyNmNkZDA0M2UzMDk2NzcwNzFh
YjFiNjVhNGIxOGY0MjJiCmtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1yYzEgIzEgUFJFRU1QVChmdWxs
KQp0ZXN0ZWQgdGFnOiB2Ny4zLXJjMSAoTGludXggNy4zLXJjMSwgMjAyNi0wOC0zMCkKCgpMZXQg
bWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGRldGFpbHMgb3IgdGVzdGluZy4KCgpCZXN0IHJlZ2Fy
ZHMsCkNoYW5namlhbgo=
