Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BBB3FFFA5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419440; cv=none; b=V6XQ5GgFGQnUMX+PYGxa1cpSWoPBne+Ho7UdLKkvvTrBH5tRBPQheETwgREEIXn07J6FB6Q31jiS317bKB5MEvNgDBcRHv+0CFgTkzNGNUF37bhXdrWNpUixFWx/fw9JzscTKQPNeyRDT+A80UpCqukkRvTDH2nB1qxK/si5LDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419440; c=relaxed/simple;
	bh=QxIleihkQmMf0V7OUSipLhp8KNZ/V/c7pmgpcjbtpGQ=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=NdWvd0PsWaT83g8jSrSUx/kL9uPD5VATl/OMikMcVpZ02tyYuRghw7sJ6BCN1q/Y4ZV+XNO/b35LDqxKLC2newBbuvcSg4NzwSAFuh8ra6InOwafou89CEOmul6EInozr6jjTRBO3Gi130gHGeLp3+3soZqB/gVxmCxJKbTZ3OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TlWn/Ci+; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TlWn/Ci+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QxIleihkQmMf0V7OUSipLhp8KNZ/V/c7pmgpcjbtpGQ=; b=T
	lWn/Ci+Wm/2Ne2aAcasn67dhWxYjkiPxAuIp9G3Gl4zegvH4CZ6DsztR26//Cut7
	0k0LB6ovjW+0JFESi/qb7qPZg5YaG35t/pJf7/8vukzqMWGmNjLUEW0REZ46n89d
	8/tqLY7cMpCfxzv1Djq2BfXWqnNrm+DZGdNbUwMhgo=
Date: Thu, 3 Sep 2026 15:09:54 +0800 (CST)
From: CJ <firefly0158@163.com>
To: rpeterso@redhat.com, agruenba@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	syzbot+5c0ca4a146e6115b14f7@syzkaller.appspotmail.com
Subject: [BUG] gfs2: allocation warning in gfs2_ri_update
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TCviatksi4imaYekdnk8aj+g+UcCwufkj24Bfc+8GgRv84DoEfW1FPnbL6uekLwG0vT6TaBlX0txmU4J45jmp8IML7x6ZiNNwKvax6Q==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <73b862eb.57a1.1a0661a4d73.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kygvCgDnb91CHZlqZYg+AA--.7556W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3QNYCmqZHUOgaQAA3o
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIHRoYXQgV0FSTklORyBpbiBnZnMyX3JpX3VwZGF0ZSByZW1h
aW5zIHJlcHJvZHVjaWJsZSB3aXRoIGEKbWlncmF0ZWQgc3l6a2FsbGVyIHJlcHJvZHVjZXIgb24g
TGludXggNy4yLXJjMy4gVGhlIHRlc3RlZCBIRUFEIGNvbW1pdCBpcwphMTNjMTQwY2MyODljMGI3
YjM3NzBiY2U1YjNhZDQyYWIzNTA3NGFhLgoKClRoZSByZXByb2R1Y2VyIG1vdW50cyBhIGNyYWZ0
ZWQgR0ZTMiBpbWFnZSBhbmQgcHJvY2Vzc2VzIGl0cyByZXNvdXJjZS1ncm91cAppbmRleCBkdXJp
bmcgZmlsZXN5c3RlbSBpbml0aWFsaXphdGlvbi4KCgpDb3JydXB0ZWQgcmVzb3VyY2UtaW5kZXgg
ZGF0YSBjYXVzZXMgZ2ZzMl9yaV91cGRhdGUoKSB0byByZXF1ZXN0IGFuIGludmFsaWQKb3IgZXhj
ZXNzaXZlIGFsbG9jYXRpb24sIGxlYWRpbmcgdG8gYSBwYWdlIGFsbG9jYXRvciB3YXJuaW5nLgoK
ClRoaXMgbG9va3MgbGlrZSBpbnN1ZmZpY2llbnQgYm91bmRzIHZhbGlkYXRpb24gb2YgcmVzb3Vy
Y2UtaW5kZXggdmFsdWVzCmJlZm9yZSB0aGV5IGFyZSBjb252ZXJ0ZWQgaW50byBhbiBhbGxvY2F0
aW9uIHNpemUuCgoKVGhpcyBpc3N1ZSB3YXMgcHJldmlvdXNseSByZXBvcnRlZCBhdDoKCgpodHRw
czovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NWMwY2E0YTE0NmU2MTE1YjE0ZjcK
CgpSZXByb2R1Y2VyOgoKCnN5eiByZXByb2R1Y2VyOiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcv
bXlUdnljWnkKCgpjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3L1FqRWtS
U3d6Cmtlcm5lbCBjb25maWc6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy90dTFTM2pzOQoKCktl
cm5lbDoKCgpIRUFEIGNvbW1pdDogYTEzYzE0MGNjMjg5YzBiN2IzNzcwYmNlNWIzYWQ0MmFiMzUw
NzRhYQpnaXQgdHJlZTogdG9ydmFsZHMvbGludXgKa2VybmVsIHZlcnNpb246IDcuMi4wLXJjMyAj
MSBQUkVFTVBUKGZ1bGwpCnRlc3RlZCB0YWc6IHY3LjItcmMzCgoKTGV0IG1lIGtub3cgaWYgeW91
IG5lZWQgbW9yZSBkZXRhaWxzIG9yIHRlc3RpbmcuCgoKQmVzdCByZWdhcmRzCgo=
