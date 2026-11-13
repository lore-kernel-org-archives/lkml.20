Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541074;
	b=JurmR4RlkNXd8wUnS2pMp2jqsCO+z8i9s6DcPBOfe4nzSAZjlq25xbMZU28LdFY2osuR
	 MgaO+YM2/wq78nxCSl3wlvnsv9Chuv+sNFtFjiPl9F4q3FPLQ5hQC7NO9HgxWi1sDT1il
	 /dbu529XsFHQaVVzRHd/Ro126n/IzNcO/lKnjAwr3wl7wXQp5/8olGDKN86NiQ2/vZtbT
	 TKUaoqdNZB8klhxW6tGLRgWdiVW1suXIxBGxF8p6zFhEWt30TJJ3pSap6oOxq7ZDuK6dI
	 j9g4VUw1A0zi2lbDCcXPcDqq090Wyajr3h6GNr3+hHlKqf+7T7SKJw8tT/dJT7gOk+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541074;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:X-NTES-SC:Content-Transfer-Encoding:Content-Type:
	 MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=dBSa9wToYXHY0IzG4sk9Sdw3kS5bMYAyTF79x898KtE=;
	b=F7tuB79a144LA3WL8EYMnwB1FGCJnNfY8L3cS+C70M71J1GlB2CtppEq/NDPypMSKiE9
	 ynR/wC63IfeFEhfrI0COK1pJhimE8gxtXirUT4Ls6p22GkGcZozJuKjMMofpNWz+lvAzz
	 FQCGvZKqpB6essbNuHBukU4SlpmS+TdELbovPG2DDxS+cochaaQeMHZBFlpQHbnD0Qp15
	 jtq6p7e78clI7/6pfyuCAh1RrY+AhKmrvBfbjWJ6+/AvokhkzswOSrP6mQLhMUPW3pozq
	 pw8D0Fmve9XI7YEkZzhB+U9nsL03ZXXkioy0ga294Sc0peMXPVAQhaTP3/3HyC8WdPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KvyWsCdV;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F22606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F22606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KvyWsCdV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=dBSa9wToYXHY0IzG4sk9Sdw3kS5bMYAyTF79x898KtE=; b=K
	vyWsCdVKGxunZvGvVyPZU+y2BnLSAQBoYmaws2GZYu973BC+XBbNaiz0TeAystU7
	PPZmvrRLwSSqKD/EfvAyppFTTmsHTAsMbtocaElPrzS0Hh83z7ycizMAxHyhKZ5r
	0kZx8I+KRp9nr0H4iS1ve2D5pPp0kTYwU3PkG1ztA8=
Date: Fri, 13 Nov 2026 11:37:39 +0800 (CST)
From: CJ <firefly0158@163.com>
To: aivazian.tigran@gmail.com
Cc: linux-kernel@vger.kernel.org
Subject: INFO: task hung in bfs_lookup on v7.3-rc2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2SBvmfvkgu7yORY+kdmEsTju82UcS4ufQl245Xc98Fnj/m0QAgUkVjHWLvy8SkMRGyrhS9cglw1fpzYbByNeYZh/0EH5iYNYEcffC57w==
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
Message-ID: <2ba22cd7.31ed.1a1d2fb7d4d.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3X7cDhvZqcVo2AA--.1689W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC+QP5q2r2hgMpggAA3a
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEgaHVuZyB0YXNrIGluIGJmc19sb29rdXAuIEl0IGlzIHN0
aWxsIHJlcHJvZHVjaWJsZSBvbgpMaW51eCB2Ny4zLXJjMiAoSEVBRCBkZjI5MDgwOTBjZGEzNjhi
MDFmZjQzNzA5ZjUxODkwMDc2YzU2MTU3KSB3aXRoIGEgc3l6a2FsbGVyIHJlcHJvZHVjZXIuCnN5
emJvdCBvcmlnaW5hbGx5IHJlcG9ydGVkICJJTkZPOiB0YXNrIGh1bmcgaW4gYmZzX2xvb2t1cCIg
b24gbGludXgtNi4xCihodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9MzI5
YzQwMDJkYWQwMDU1YjQzMmIpLiBUaGUgdGFyZ2V0IGNvbnNvbGUgc2hvd3MgYSBtYXRjaGluZyBm
YWlsdXJlIHNpZ25hdHVyZS4KCgpUaGUgcmVwcm9kdWNlciBtb3VudHMgYSBjcmFmdGVkIEJGUyBp
bWFnZSBhbmQgcGVyZm9ybXMgYSBkaXJlY3RvcnkgbG9va3VwIHdoaWxlIGFub3RoZXIgcGF0aCBo
b2xkcyB0aGUgZGlyZWN0b3J5IGxvY2suCgoKT24gdGhlIHRhcmdldCwgdGhlIGtlcm5lbCByZXBv
cnRzOgrCoCBJTkZPOiB0YXNrIHN5ei4wLjExOjkwMzQgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDE0
MyBzZWNvbmRzLgoKClRoZSBkaWFnbm9zdGljIHBhdGggaXMgYmZzX2xvb2t1cCAtPiBkX2FsbG9j
X3BhcmFsbGVsIC0+IF9fZF9sb29rdXAgLT4gbG9va3VwX29wZW4uClRoZSBzYW1lIGJsb2NrZWQg
b3IgZGlhZ25vc3RpYyBmdW5jdGlvbiBwYXRoIGlzIHByZXNlbnQgKGJmc19sb29rdXApLgoKCk9u
ZSBwb3NzaWJsZSBjYXVzZSBpcyBsb2NrIG9yZGVyaW5nIGJldHdlZW4gY29uY3VycmVudCBCRlMg
ZGlyZWN0b3J5IG9wZXJhdGlvbnMuCgoKVGhpcyBpcyBhIGZvbGxvdy11cCBmb3IgYW4gZXhpc3Rp
bmcgc3l6Ym90IHJlcG9ydCBhbmQgZGVzY3JpYmVzIGFuCm9ic2VydmVkIGZhaWx1cmUsIG5vdCBh
IGJpc2VjdGVkIHJvb3QgY2F1c2UuCgoKUmVwcm9kdWNlcjoKwqAgc3l6IHJlcHJvZHVjZXI6IGh0
dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9iNlhLUXF5TgoKCmNvbnNvbGUgb3V0cHV0OiBodHRwczov
L3Bhc3RlYmluLmNvbS9yYXcvREUycDg1eDMKa2VybmVsIGNvbmZpZzogaHR0cHM6Ly9zeXprYWxs
ZXIuYXBwc3BvdC5jb20vdGV4dD90YWc9S2VybmVsQ29uZmlnJng9ZmY5M2VjYzA4NWQ4NDM2ZQoK
Cktlcm5lbDoKwqAgSEVBRCBjb21taXQ6IGRmMjkwODA5MGNkYTM2OGIwMWZmNDM3MDlmNTE4OTAw
NzZjNTYxNTcKwqAgZ2l0IHRyZWU6IGxpbnV4LXN0YWJsZQrCoCBrZXJuZWwgdmVyc2lvbjogNy4z
LjAtcmMyCsKgIHRlc3RlZCB0YWc6IHY3LjMtcmMyCgoKTGV0IG1lIGtub3cgaWYgeW91IG5lZWQg
bW9yZSBkZXRhaWxzIG9yIHRlc3RpbmcuCgoKVGhhbmtzLgoK
