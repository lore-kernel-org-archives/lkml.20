Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9ED3EFFCE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372119; cv=none; b=INBNP7cysyg23cAdNLhnw01FQJTVOiBi1WuKHuwE4zWBU0EiJ1QoShz3SfQ0Yxm1J7RQiEYf4hArXuB11wFdaeiToWZeg1Zqe1zHTScK+aY8A1ht9IK4zODnXEORpH00PWzHI658ESvRHLRmJc7h7Dvjyr5ePPawXoICZj+u0wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372119; c=relaxed/simple;
	bh=ZyZdd7bSDjmQXqulrFgkH2xm2+rxBYNnFOVk22MIB+M=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=MEBrBv4z7RUG1HE4TzbvCS+oUTkGBnWZvETxWnwJtle2gQ7FkJf55N3XrBNcGm95qOBsfL5jWY51rkWOvhD7+ulhTgQI13KmZBm74dcJyglsNNbCumThkQ077LKYXdgeEgTzyS7xChNAHFI+oMfBoPGj3WQ6kDapaOv3Mj9/TPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XGYgy0QN; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XGYgy0QN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ZyZdd7bSDjmQXqulrFgkH2xm2+rxBYNnFOVk22MIB+M=; b=X
	GYgy0QNCn2FklwWMs9MNZLCvU0fX01obIj/ELskMiGZwg3rSrZfB4KYEdf249xgi
	grL6sIaWMMjsYKFnvcIrcKJe75YbRecfKoi3hfovabumLmPILNrCi9AIFvFToPUT
	gQgKJqOs+tD3SNPNUfGjfDlu66GBTJwtQ5HhnYthlM=
Date: Mon, 14 Sep 2026 15:48:06 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org, yun.zhou@windriver.com, mjguzik@gmail.com,
	brauner@kernel.org, ssrane_b23@ee.vjti.ac.in
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: kernel BUG in txUnlock at fs/jfs/jfs_txnmgr.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/+cvUgj4CWQYOkdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/K42C7nLsOLiET28JkgJWqQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <57a2fc08.6fac.1a09ee33943.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3_7y2pqdq8B4PAA--.18533W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3hZbDWqnprbjxQAA3l
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGksCgoKSSBhbSByZXBvcnRpbmcgYSBrZXJuZWwgQlVHIGluIHRoZSBKRlMgdHJhbnNhY3Rpb24g
bWFuYWdlciwgdHJpZ2dlcmVkIGJ5IGEKc3l6a2FsbGVyIHJlcHJvZHVjZXIgdGhhdCBtb3VudHMg
YSBjcmFmdGVkIEpGUyBpbWFnZS4gIFRoZSBpc3N1ZSBpcyByZXByb2R1Y2libGUKd2l0aCBIRUFE
IGNvbW1pdCBjZWU5Mzk1YWNkODA0M2JlMDY0NGIyNWMzNGJmYTg2NjIzZjJiOTM1ICh2Ny4zLXJj
MSwgTGludXgKNy4zLjAtcmMxKS4KCgpUaGUgcmVwcm9kdWNlciBtb3VudHMgYSBjcmFmdGVkIEpG
UyBmaWxlc3lzdGVtIGltYWdlIG9uIGEgbG9vcCBkZXZpY2UgYW5kCnBlcmZvcm1zIGZpbGUgb3Bl
cmF0aW9ucyB0aGF0IGZvcmNlIHRyYW5zYWN0aW9uIGNvbW1pdHMgb24gaXQuICBUaGUgZmFpbGlu
Zwpjb250ZXh0IGlzIHRoZSBKRlMgY29tbWl0IHRocmVhZCBqZnNDb21taXQsIG5vdCB0aGUgc3lz
Y2FsbCB0YXNrLgoKClRoZSBjb25zb2xlIHNob3dzICJrZXJuZWwgQlVHIGF0IGZzL2pmcy9qZnNf
dHhubWdyLmM6OTMzISIgd2l0aCBhbgppbnZhbGlkLW9wY29kZSBPb3BzIGFuZCBSSVAgaW4gdHhV
bmxvY2suICBUaGUgYXNzZXJ0aW9uIGF0IHRoYXQgc2l0ZSBpcwphc3NlcnQobXAtPm5vaG9tZW9r
ID4gMCk6IHRoZSB1bmxvY2sgcGF0aCByZXF1aXJlcyB0aGUgdHJhbnNhY3Rpb24gYmxvY2sgdG8K
c3RpbGwgYmUgcGlubmVkIGJ5IHRoZSBjdXJyZW50IHRhc2suCgoKT25lIHBvc3NpYmxlIGNhdXNl
IGlzIHRoYXQgdGhlIGNyYWZ0ZWQgaW1hZ2UgZHJpdmVzIGEgY29tbWl0IHBhdGggdGhhdCByZXR1
cm5zCmVhcmx5LCBzbyB0aGUgbm9ob21lb2sgcmVmZXJlbmNlIG9uIHRoZSB0cmFuc2FjdGlvbiBi
bG9jayBpcyBkcm9wcGVkIGJlZm9yZQp0eFVubG9jayBydW5zIGFuZCB0aGUgY291bnRlciBubyBs
b25nZXIgcmVmbGVjdHMgdGhlIGJsb2NrJ3Mgc3RhdGUuICBUaGlzIGxvb2tzCmxpa2UgYSBsaWZl
dGltZS9yZWZlcmVuY2UtY291bnRpbmcgcHJvYmxlbSBpbiB0aGUgdHJhbnNhY3Rpb24gbWFuYWdl
ciByYXRoZXIKdGhhbiBhIGJvdW5kcyBwcm9ibGVtLCByZWFjaGVkIG9ubHkgd2l0aCBpbmNvbnNp
c3RlbnQgb24tZGlzayBtZXRhZGF0YS4gIEkgYW0KcmVwb3J0aW5nIHRoZSBhc3NlcnRpb24gYW5k
IHRoZSBwYXRoIGFzIG9ic2VydmVkLgoKClRoaXMgYXBwZWFycyB0byBiZSBhIHJlY3VycmVuY2Ug
b2YgdGhlIHN5emJvdCBpc3N1ZSB3aG9zZSBleHRlcm5hbCBpZCBpcwozYzM4NjZjNzFkYTQ1ZWY2
MTIwMS4gIEl0IHJlbWFpbnMgcmVwcm9kdWNpYmxlIG9uIHY3LjMtcmMxLgoKClJlcHJvZHVjZXI6
CgpzeXogcmVwcm9kdWNlcjogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L25NSEhhUWdwCgpjb25z
b2xlIG91dHB1dDogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L3o2QXE0bXk2CgprZXJuZWwgY29u
ZmlnOiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvd0RCSGpVQkMKCgpLZXJuZWw6CgoKSEVBRCBj
b21taXQ6IGNlZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzUKZ2l0IHRyZWU6
IHVwc3RyZWFtIChsaW51eC5naXQpLCB0ZXN0ZWQgdGhyb3VnaCB0aGUgdjcuMy1yYzEgYW5ub3Rh
dGVkIHRhZyBvYmplY3QKwqAgwqAgwqAgwqAgwqAgwqBlNWUwNDcyNmNkZDA0M2UzMDk2NzcwNzFh
YjFiNjVhNGIxOGY0MjJiCmtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1yYzEgIzEgUFJFRU1QVChmdWxs
KQp0ZXN0ZWQgdGFnOiB2Ny4zLXJjMSAoTGludXggNy4zLXJjMSwgMjAyNi0wOC0zMCkKCgpMZXQg
bWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGRldGFpbHMgb3IgdGVzdGluZy4KCgpCZXN0IHJlZ2Fy
ZHMsCkNoYW5namlhbgoK
