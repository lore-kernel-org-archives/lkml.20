Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE954CCDE5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486937; cv=none; b=kS9T9kxzegXpnFYnehiO+cGQE4W1DZwapgF3i3/jY8pjk9MUH2a29tZHnpy+/Xkmb4pFtKQuBtFs/tTpJWhOSGsVnIx93ZfY8rZ9sh+mpdUZWqGs4ZDVlWMZzZdPc3q7apdYeUyvDi8f+0fLvl6jzUCSWRIRBorJ2cNYTuuOTxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486937; c=relaxed/simple;
	bh=ZgwDVtQnY1nLTpS0A1GIpWM6lUVR1xvZ2v2mrPk76SE=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=vE7B2A2DwLU+7fQK5GHt7iSiDzzuae6HP418RYC2IfH5AzsexK2IYI3X64FCuRVin81hxOh42WMw1Kg1HIfcZr2qUygY2jbKMQ/NHr4qh6FGeb8Qh0VB/ZDRDWizA7q2LPbaOo71uykLKBvoKXlWRxbPB2MzAxPKE+QjAV7xsfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gm6RUVY9; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gm6RUVY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ZgwDVtQnY1nLTpS0A1GIpWM6lUVR1xvZ2v2mrPk76SE=; b=g
	m6RUVY93M5GvYVZnk6Vn+GsEaVu43fFP7kJ3K6XTeQDco3LiWMjDzS7CN1qOaghw
	ZQjM3JU0dPp3AQKtf6/tFEYCzbtNIzpNns5gtjH2g/4Fg9aaqoGfuJuP6rzjfkpN
	/99qFzhsFVpTOyZTnDLWYFagqr5UsFOJCLnPPnc9yg=
Date: Fri, 4 Sep 2026 09:55:04 +0800 (CST)
From: CJ <firefly0158@163.com>
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	syzbot+6ca45cc69eba4e310924@syzkaller.appspotmail.com
Subject: [BUG] jfs: WARNING in dbAdjTree from dbJoin
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TCviTuUEr4iOeZ+kdnk8aj+g+UcCwufkj24Bfc+8GgRv84DoEfW1FPnbL6uekLwG0vT6TaBlX0txmU4J4fnsTSiBTfJuMH49KmoPoRw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5fdd200b.18c7.1a06a206a31.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kygvCgDXPzf4JJpqbAo_AA--.9314W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3RiIOmqaJPip4QAA3T
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIHRoYXQgV0FSTklORyBpbiBkYkpvaW4gYXBwZWFycyB0byBy
ZW1haW4gcmVwcm9kdWNpYmxlIHdpdGggYQptaWdyYXRlZCBzeXprYWxsZXIgcmVwcm9kdWNlciBv
biBMaW51eCA3LjItcmMzLiBUaGUgdGVzdGVkIEhFQUQgY29tbWl0IGlzCmExM2MxNDBjYzI4OWMw
YjdiMzc3MGJjZTViM2FkNDJhYjM1MDc0YWEuCgoKVGhlIHJlcHJvZHVjZXIgbW91bnRzIGEgY3Jh
ZnRlZCBKRlMgaW1hZ2UgYW5kIGZyZWVzIGJsb2NrcyB3aGlsZSB0cnVuY2F0aW5nCmFuZCBldmlj
dGluZyBhbiBpbm9kZSB0aHJvdWdoIHRoZSBsYXp5LWNvbW1pdCBwYXRoLgoKCmRiSm9pbigpIGNh
bGxzIGRiQWRqVHJlZSgpIHdpdGggaW5jb25zaXN0ZW50IGRtYXAgdHJlZSBzdGF0ZSwgdHJpZ2dl
cmluZyB0aGUKc2FtZSB3YXJuaW5nIHBhdGggcmVwcmVzZW50ZWQgaW4gdGhlIHNvdXJjZSBhbmQg
dGFyZ2V0IHJlcG9ydHMuCgoKVGhpcyBsb29rcyBsaWtlIG1hbGZvcm1lZCBidWRkeS10cmVlIG1l
dGFkYXRhIGlzIG5vdCByZWplY3RlZCBiZWZvcmUKZGJKb2luKCkgYXR0ZW1wdHMgdG8gbWVyZ2Ug
YW5kIGFkanVzdCB0aGUgZG1hcCB0cmVlLgoKClRoaXMgaXNzdWUgd2FzIHByZXZpb3VzbHkgcmVw
b3J0ZWQgYXQ6CgoKaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPTZjYTQ1
Y2M2OWViYTRlMzEwOTI0CgoKUmVwcm9kdWNlcjoKCgpzeXogcmVwcm9kdWNlcjogaHR0cHM6Ly9w
YXN0ZWJpbi5jb20vcmF3L1lQa3FHQkxVCgoKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGVi
aW4uY29tL3Jhdy9uNkR6eFQ1NAprZXJuZWwgY29uZmlnOiBodHRwczovL3Bhc3RlYmluLmNvbS9y
YXcvZWc5U0FiOXEKCgpLZXJuZWw6CgoKSEVBRCBjb21taXQ6IGExM2MxNDBjYzI4OWMwYjdiMzc3
MGJjZTViM2FkNDJhYjM1MDc0YWEKZ2l0IHRyZWU6IHRvcnZhbGRzL2xpbnV4Cmtlcm5lbCB2ZXJz
aW9uOiA3LjIuMC1yYzMgIzEgUFJFRU1QVChmdWxsKQp0ZXN0ZWQgdGFnOiB2Ny4yLXJjMwoKCkxl
dCBtZSBrbm93IGlmIHlvdSBuZWVkIG1vcmUgZGV0YWlscyBvciB0ZXN0aW5nLgoKCkJlc3QgcmVn
YXJkcwoK
