Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02193FB055
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418346; cv=none; b=F6O+VN5x/vouuO1r5UQ4UE2jxy/JGrZk4sdhWhq90jdEt/5CS9ZjGsq6YA26BM8S3TXseIgO1Re8jHI1bu75qBY4lzuFc0H78ehtEK24Pd9ZVrb5WRaiykO0eUFP0Fc8ipff7F2WWO4CMWPfce3W99YRIlGz8Wv54gUQqE6jm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418346; c=relaxed/simple;
	bh=juDibPFdV4XeXyvEQkdMQXjUe3swBYMVBGeVShAtfic=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=ZSrl5AagAwr1yDNJ5SHzIEahV8MSvwkbhQ6svopKERCa+KhVWzq3WOHfmIUatHIHRg76v6gergP45BWmr1KPELiYiNa3j82JbgHMOOyKfk2xjUBKF+nzMx4t0D0hdwnFX4Al0hJ06ebTxXR6V4r1JDH+sA5koSmnnLZtmcHoBCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BiQ6Dp9U; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BiQ6Dp9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=juDibPFdV4XeXyvEQkdMQXjUe3swBYMVBGeVShAtfic=; b=B
	iQ6Dp9UvVff9Pq2R/xTT47HxScpObjO41d40RPxdda5wOSaq3AQa7vQbGp0n5+cH
	euEy18yNPVstiOMKjMJym9FEgCn5gMAK91q61/UBZ8o+6KPOReV7myA/ldySIhz8
	xNYRwpveVqEI2kkbVAqmDB8wY2NuSpmHqKawzvl7vU=
Date: Thu, 3 Sep 2026 14:51:30 +0800 (CST)
From: CJ <firefly0158@163.com>
To: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org,
	syzbot+1782a3a587bc53dc10cf@syzkaller.appspotmail.com
Subject:  [BUG] ocfs2: possible deadlock in ocfs2_write_begin_nolock on
 v7.2-rc3
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TCviat0oi5iWeZOkdnk8aj+g+UcCwufkj24Bfc+8GgRv84DoEfW1FPnbL6uekLwG0vT6TaBlX0txmU4J4EHgR+H3MM9dULc0RvYkGyA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4a9f1b94.5284.1a066097387.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kygvCgD3X+ryGJlqm4E+AA--.7584W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC+hJD9GqZGPJn-gAA3f
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpIaSwKCkkgYW0gcmVwb3J0aW5nIHRoYXQgcG9zc2libGUgZGVhZGxvY2sgaW4gb2NmczJfd3Jp
dGVfYmVnaW5fbm9sb2NrIHJlbWFpbnMKcmVwcm9kdWNpYmxlIHdpdGggYSBtaWdyYXRlZCBzeXpr
YWxsZXIgcmVwcm9kdWNlciBvbiBMaW51eCA3LjItcmMzLiBUaGUKdGVzdGVkIEhFQUQgY29tbWl0
IGlzIGExM2MxNDBjYzI4OWMwYjdiMzc3MGJjZTViM2FkNDJhYjM1MDc0YWEuCgpUaGUgcmVwcm9k
dWNlciBtb3VudHMgYSBjcmFmdGVkIE9DRlMyIGltYWdlIGFuZCBwZXJmb3JtcyBmaWxlIGFuZCB4
YXR0cgpvcGVyYXRpb25zIHRoYXQgZW50ZXIgdGhlIGJ1ZmZlcmVkIHdyaXRlIHBhdGguCgpMb2Nr
ZGVwIHJlcG9ydHMgYSBjaXJjdWxhciBkZXBlbmRlbmN5IHdoZW4gb2NmczJfd3JpdGVfYmVnaW5f
bm9sb2NrKCkgc3RhcnRzCmEgdHJhbnNhY3Rpb24gd2hpbGUgdGhlIGlub2RlIGFsbG9jYXRpb24g
c2VtYXBob3JlIGlzIGFscmVhZHkgaGVsZC4gVGhlCnJldmVyc2UgZGVwZW5kZW5jeSBpcyBlc3Rh
Ymxpc2hlZCB0aHJvdWdoIE9DRlMyIHJlZmNvdW50LXRyZWUgYW5kIHhhdHRyCmhhbmRsaW5nLgoK
VGhpcyBsb29rcyBsaWtlIGFuIGluY29uc2lzdGVudCBsb2NrIG9yZGVyaW5nIGJldHdlZW4gdGhl
IGlub2RlIGFsbG9jYXRpb24Kc2VtYXBob3JlIGFuZCB0aGUgZmlsZXN5c3RlbSB0cmFuc2FjdGlv
biBsb2NrIGluIHRoZSBPQ0ZTMiB3cml0ZSBwYXRoLgoKVGhpcyBpc3N1ZSB3YXMgcHJldmlvdXNs
eSByZXBvcnRlZCBhdDoKCmh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD0x
NzgyYTNhNTg3YmM1M2RjMTBjZgoKUmVwcm9kdWNlcjoKCnN5eiByZXByb2R1Y2VyOiBodHRwczov
L3Bhc3RlYmluLmNvbS9yYXcvQ2g5RTdnQWkKCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3Bhc3Rl
YmluLmNvbS9yYXcvMDJaajJnTGIKa2VybmVsIGNvbmZpZzogaHR0cHM6Ly9wYXN0ZWJpbi5jb20v
cmF3L1JMU21SazVqCktlcm5lbDoKCkhFQUQgY29tbWl0OiBhMTNjMTQwY2MyODljMGI3YjM3NzBi
Y2U1YjNhZDQyYWIzNTA3NGFhCmdpdCB0cmVlOiB0b3J2YWxkcy9saW51eAprZXJuZWwgdmVyc2lv
bjogNy4yLjAtcmMzICMxIFBSRUVNUFQoZnVsbCkKdGVzdGVkIHRhZzogdjcuMi1yYzMKCkxldCBt
ZSBrbm93IGlmIHlvdSBuZWVkIG1vcmUgZGV0YWlscyBvciB0ZXN0aW5nLgoKQmVzdCByZWdhcmRz
LApYaWFueWluZwo=
