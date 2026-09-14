Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9612A416CFA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376850; cv=none; b=G9QrRAitOjxZYVUP15soZAINxsJWNaVobYVHt+nl6GDSUNCXah4GigWXXLP6ykE6BCmk6SwjEhWup0vcIz47gaVx/h45LyO8CJb1iLenc1s7rz7gKuWJDwNEge15BcUG+utBYb1f2dZkZw4M/I8uKo6GK0eyX9b1srQPGh4h7pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376850; c=relaxed/simple;
	bh=HQebeJDAVSkYeXPJk6ETtagDk5v4/yXalgNXqMonCIo=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=UthxshCoabhTG9lP057zjxlLaW9JydjwI/UYF85mXdPPPuFx+SFsSkNZYVIjaZwcQOrGHEKTeQd2LezNCBIA8tDeIpUCDVGARJl14Mp6ZzKgACZL1ABINVd8Ozc1h0xlG9J5aAsFynpUXnJ/CgQpzXUagH+ljT/+aAMSECAHKMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nrT7Icjl; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nrT7Icjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=HQebeJDAVSkYeXPJk6ETtagDk5v4/yXalgNXqMonCIo=; b=n
	rT7IcjlMM+COHC7Cy8CXU97v1OMiiStMGcHItXpxitHyI7nZzRQ4YTfA6PrhYl5n
	hkxti4fPMHnuy/RDg9RnYxTSCI/gww7NuyLWtUrCjdJtcGsvHuVoHUiFmIDEuEqx
	/NatHOvfhNVWYt3hqx/SSBw2vwaAJxaqfPrrvNEI2k=
Date: Mon, 14 Sep 2026 17:07:03 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org, yun.zhou@windriver.com, kees@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: [BUG] jfs: KASAN use-after-free in dbAllocBits
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/+cuUAp5SiYYukdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/X88lrhoNErzgZiMP3R0l1A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1b673213.898c.1a09f2b820a.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3_643uadqS0IPAA--.18906W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3RcAsWqnuTd2cgAA38
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEgbWVtb3J5LXNhZmV0eSBmYWlsdXJlIGluIHRoZSBKRlMg
YmxvY2stbWFwIGFsbG9jYXRpb24gcGF0aCwKdHJpZ2dlcmVkIGJ5IGEgc3l6a2FsbGVyIHJlcHJv
ZHVjZXIgdGhhdCBtb3VudHMgYSBjcmFmdGVkIEpGUyBpbWFnZS4gIFRoZSBpc3N1ZQppcyByZXBy
b2R1Y2libGUgd2l0aCBIRUFEIGNvbW1pdCBjZWU5Mzk1YWNkODA0M2JlMDY0NGIyNWMzNGJmYTg2
NjIzZjJiOTM1Cih2Ny4zLXJjMSwgTGludXggNy4zLjAtcmMxKS4KCgpUaGUgcmVwcm9kdWNlciBt
b3VudHMgYSBjcmFmdGVkIEpGUyBmaWxlc3lzdGVtIGltYWdlIG9uIGEgbG9vcCBkZXZpY2UgYW5k
IHRoZW4Kc2V0cyBhbiBleHRlbmRlZCBhdHRyaWJ1dGUsIHdoaWNoIG1ha2VzIEpGUyBhbGxvY2F0
ZSBuZXcgYmxvY2tzIGZvciB0aGUKYXR0cmlidXRlJ3MgZXh0ZW50LgoKCktBU0FOIHJlcG9ydHMg
YSB1c2UtYWZ0ZXItZnJlZSB3aXRoIGFuIDgtYnl0ZSByZWFkIGluIGRiQWxsb2NCaXRzLiAgVGhl
IGNhbGwKcGF0aCBpcyBkYkFsbG9jQml0cyAtPiBkYkFsbG9jRG1hcCAtPiBkYkFsbG9jIC0+IGVh
X2dldCAtPiBfX2pmc19zZXR4YXR0ciwgc28KdGhlIGZhaWxpbmcgcmVhZCBoYXBwZW5zIHdoaWxl
IHRoZSBhbGxvY2F0b3Igd2Fsa3MgdGhlIGRtYXAgc3RydWN0dXJlcyBpdCBpcwpzdXBwb3NlZCB0
byBiZSB1cGRhdGluZy4KCgpPbiB0aGUga2VybmVsIHdoZXJlIHRoaXMgd2FzIGZpcnN0IHJlcG9y
dGVkIHRoZSBzYW1lIGFsbG9jYXRpb24gcGF0aCB3YXMKcmVwb3J0ZWQgYnkgVUJTQU4gYXMgYW4g
YXJyYXktaW5kZXgtb3V0LW9mLWJvdW5kcyBhdCBmcy9qZnMvamZzX2RtYXAuYzoyMzA2LAp3aGVy
ZSBpbmRleCAyMDAwIHdhcyBvdXQgb2YgcmFuZ2UgZm9yIGEgczY0WzEyOF0gYXJyYXkuICBUaGUg
dHdvIGtlcm5lbHMKdGhlcmVmb3JlIGV4cG9zZSB0aGUgZmFpbHVyZSBkaWZmZXJlbnRseTogYW4g
b3V0LW9mLWJvdW5kcyBpbmRleCBvbiB0aGUgb2xkZXIKb25lLCBhIHJlYWQgb2YgYSBmcmVlZCBv
YmplY3Qgb24gdjcuMy1yYzEuICBPbmUgcG9zc2libGUgZXhwbGFuYXRpb24gaXMgdGhhdCB0aGUK
b3V0LW9mLWJvdW5kcyBhY2Nlc3MgY29ycnVwdHMgb3IgY29uc3VtZXMgYWxsb2NhdG9yIHN0YXRl
IGFuZCBhIGxhdGVyIGFjY2VzcyBvbgp0aGUgc2FtZSBwYXRoIGxhbmRzIGluIGZyZWVkIG1lbW9y
eTsgSSBhbSBkZXNjcmliaW5nIHRoaXMgYXMgYSBsaWtlbHkgcmVjdXJyZW5jZQpyYXRoZXIgdGhh
biBhIGJ5dGUtaWRlbnRpY2FsIG9uZSBiZWNhdXNlIHRoZSBmYWlsdXJlIGNsYXNzZXMgZGlmZmVy
LgoKClRoaXMgYXBwZWFycyB0byBiZSBhIHJlY3VycmVuY2Ugb2YgdGhlIHN5emJvdCBpc3N1ZSB3
aG9zZSBleHRlcm5hbCBpZCBpcwo3NmM5NjBhODM5ZGViNDlhODZlYy4gIEl0IHJlbWFpbnMgcmVw
cm9kdWNpYmxlIG9uIHY3LjMtcmMxLgoKClJlcHJvZHVjZXI6CgoKc3l6IHJlcHJvZHVjZXI6IGh0
dHBzOi8vcGFzdGViaW4uY29tL3Jhdy95RGNFUlU0OAoKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8v
cGFzdGViaW4uY29tL3Jhdy9XTkd2THJjZgoKa2VybmVsIGNvbmZpZzogaHR0cHM6Ly9wYXN0ZWJp
bi5jb20vcmF3LzlFYlZiaGhjCgoKS2VybmVsOgoKCkhFQUQgY29tbWl0OiBjZWU5Mzk1YWNkODA0
M2JlMDY0NGIyNWMzNGJmYTg2NjIzZjJiOTM1CmdpdCB0cmVlOiB1cHN0cmVhbSAobGludXguZ2l0
KSwgdGVzdGVkIHRocm91Z2ggdGhlIHY3LjMtcmMxIGFubm90YXRlZCB0YWcgb2JqZWN0CsKgIMKg
IMKgIMKgIMKgIMKgZTVlMDQ3MjZjZGQwNDNlMzA5Njc3MDcxYWIxYjY1YTRiMThmNDIyYgprZXJu
ZWwgdmVyc2lvbjogNy4zLjAtcmMxICMxIFBSRUVNUFQoZnVsbCkKdGVzdGVkIHRhZzogdjcuMy1y
YzEgKExpbnV4IDcuMy1yYzEsIDIwMjYtMDgtMzApCgoKTGV0IG1lIGtub3cgaWYgeW91IG5lZWQg
bW9yZSBkZXRhaWxzIG9yIHRlc3RpbmcuCgoKQmVzdCByZWdhcmRzLApDaGFuZ2ppYW4=
