Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293791;
	b=CTeBiytnTPDuzoR7TWtJm9wiJMxcj34eWugEJFYwDh9dO//92biznZ00C4oxZ64mJF/q
	 spcX65t+0rFsXrCyjG6eQzH79JRzUsHmlYfORcaGzV4iKbUNrnxjlLljbvp8AlRcfoRrg
	 uK3OW/2V7rVqqQfvd+I5dFE4AECfhEq7Z4K7l4Ffj8eR+/ZiDJQ0d9Tg8g13aeNY5vIGs
	 HhWciPp4l+fqjt4bQz53yPJS/9FnTHQNVlmZNE/MhTfZI75YQ+8ramK8Qe+MW6XpahqX5
	 M7hVmMZBClV96hYdDYOgAicSW417grH4XkGUQz9tRfZa1kEvZ2TZ2MQZke7i8qf4NKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293791;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:X-NTES-SC:Content-Transfer-Encoding:Content-Type:
	 MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=FOMZoBbAD/J3v9VoY7exJncum3EXe33D3cVs9nnXvOA=;
	b=YWrLk/uCoSfN1/jVd0F69vUsAVNzzqebx39o9G8xUvA/IgWMUu+c5V2UecdmEh6RWcf4
	 atVDffwkMhakt755DphjTesv8Kf3m9IovyOA0GmztSnUYeOdz7Ch9AVqk9CVDHPeyFxao
	 wad29pDAFe8Y0pnYBSBEg9/EhnIWwKAZb20WqVvwwgVSmC2J0/+HdmDUkKfoNeUJVkN10
	 Kp1KHCH8ElPJDpmCfybYkjPY7fdlrLn4V8uG4IwYDLSQXYIka83AbeJg+VwluVFZI9SkJ
	 con07Ki8lS39/qQtMEMXO/E57Yh4p2pmi+OoNF1EM0I+YUR3pLGXa16cEy5eOcyt2fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BSNcRqGR;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D40606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D40606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BSNcRqGR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=FOMZoBbAD/J3v9VoY7exJncum3EXe33D3cVs9nnXvOA=; b=B
	SNcRqGRp0c0Qk8PbSz5x9rTJs4y4MY7G6DnjWT+SHCEP+SKu9V4z0+6H56MTwHgz
	dau5MhrqB2A5eeUist4b+ehuZNQUXxUQidUE4OaISIowG8pAhEF2H9d7agWS4Dza
	8D2SOLO3geBXnIvAysdy2/bwWjFKaxmJP278rGKNbs=
Date: Tue, 10 Nov 2026 14:56:19 +0800 (CST)
From: CJ <firefly0158@163.com>
To: rpeterso@redhat.com, agruenba@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: task hung in gfs2_glock_nq on v7.2-rc3
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2SBv6SvE8s7ySfZukdmEsTju82UcS4ufQl245Xc+0Gpx/uxxgFbWVuH1zqy+aKERKnoRu9TDlC8s9YbKt+QtEdThgDzNkn1Mhnsu6W7g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <6c2d989e.53e9.1a1c43e4c1c.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kigvCgD3XwQTwPJqUxdrAA--.335W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3ROLPWrywBMYRgAA3t
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCnN5emJvdCByZXBvcnRlZCAiSU5GTzogdGFzayBodW5nIGluIGdmczJfZ2xvY2tfbnEi
IG9uIGxpbnV4LTUuMTUuIFRoZSBzYW1lCmZhaWx1cmUgaXMgc3RpbGwgcmVwcm9kdWNpYmxlIG9u
IHY3LjItcmMzIHdpdGggdGhlIHJlcHJvZHVjZXIgYmVsb3cuCgoKVGVzdGVkIGtlcm5lbDoKwqAg
TGludXggdjcuMi1yYzMKwqAgSEVBRCBhMTNjMTQwY2MyODljMGI3YjM3NzBiY2U1YjNhZDQyYWIz
NTA3NGFhCgoKT2JzZXJ2ZWQgZmFpbHVyZToKQ2FsbCBUcmFjZToKPFRBU0s+Cl9fc2NoZWR1bGUr
MHgxMzc5LzB4NGFiMApzY2hlZHVsZSsweGQyLzB4MjYwCmJpdF93YWl0KzB4MTUvMHhlMApfX3dh
aXRfb25fYml0KzB4YzkvMHgxOTAKb3V0X29mX2xpbmVfd2FpdF9vbl9iaXQrMHhkNy8weDExMApn
ZnMyX2dsb2NrX3dhaXQrMHhhZi8weDI0MApnZnMyX2dsb2NrX25xKzB4YWRjLzB4MWNhMApfX2dm
czJfbG9va3VwKzB4MTA1LzB4MjkwCl9fbG9va3VwX3Nsb3crMHgxNWYvMHgzNDAKbG9va3VwX3Ns
b3crMHg1MS8weDgwCnBhdGhfbG9va3VwYXQuaXNyYS4wKzB4NjE5LzB4YmIwCmZpbGVuYW1lX2xv
b2t1cCsweDIxMy8weDQ4MAp1c2VyX3BhdGhfYXQrMHg0MC8weDYwCmtzeXNfdW1vdW50KzB4Yjcv
MHgxMzAKX194NjRfc3lzX3Vtb3VudCsweDU0LzB4ODAKZG9fc3lzY2FsbF82NCsweGM0LzB4NmEw
CmVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UKUklQOiAwMDMzOjB4N2Zk
M2E4ZGFmZWJiCjwvVEFTSz4KCgpUaGUgY29uc29sZSBkb2VzIG5vdCBpZGVudGlmeSB0aGUgbG9j
ayBvciBwYWdlIG93bmVyLCBzbyB0aGlzIGlzIGEgcmVwb3J0IG9mIGEgc3RpbGwtcmVwcm9kdWNp
YmxlIGhhbmcgcmF0aGVyIHRoYW4gYSBiaXNlY3RlZCByb290IGNhdXNlLgoKClRoaXMgaXMgYSBy
ZXBvcnQgb2YgYSBzdGlsbC1yZXByb2R1Y2libGUgZmFpbHVyZSwgbm90IGEgYmlzZWN0ZWQgcm9v
dCBjYXVzZS4KCgpSZXByb2R1Y2VyOgrCoCBTWVogcmVwcm9kdWNlcjrCoGh0dHBzOi8vcGFzdGVi
aW4uY29tL3Jhdy93MFV3TXJwQgoKCkFydGlmYWN0czoKwqAgY29uc29sZTogaHR0cHM6Ly9wYXN0
ZWJpbi5jb20vcmF3LzFOU2ZmM1l5CsKgIGtlcm5lbCBjb25maWc6IGh0dHBzOi8vc3l6a2FsbGVy
LmFwcHNwb3QuY29tL3RleHQ/dGFnPUtlcm5lbENvbmZpZyZ4PTc4Y2UxYWQzZDkxYmMzNzUKCgpU
aGFua3MuCgo=
