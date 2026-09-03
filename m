Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB13FF1AD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419229; cv=none; b=fbNaq5T41EEurL+PveM7m7E/5hzmlfmT3NaybiBjhDTFy7t7PfkSfHWV1b+nhozTMnIQtTAN95hqfYS134g6Z7rtqwZy1xyBpscqqTQbQkDGIlvIozzxBGANSxLdA4kT9P+bZO+TelpuzUWFUYrItPh/qIl0gpnHCOHgqDrrnQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419229; c=relaxed/simple;
	bh=7TQtVdnqzwhSxfsXW1nvkeQ+DNy+m818Y5Yp8ga0+mQ=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=dZWSstFQW42hlBMI1HrH9M0lxB0/HwpaQZOVOtAjZOBf9n5oCG6LanhEuwA/7ShivMeXYknza4Zdqpz8vreHOnoNj9Oiwi1mirJGOtaWzX6D9A8KZSOjxiRnSI57eCFfVCMosphvVwNGOA4Cd1RsIamaoSbwLaEWfgyTajSEFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ACfNj8go; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ACfNj8go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=7TQtVdnqzwhSxfsXW1nvkeQ+DNy+m818Y5Yp8ga0+mQ=; b=A
	CfNj8go5esFKb0OgKTFFbcAxgcvB0C/yNlNakvgeZ8XjPgGO+I0swvEjoeTiZ8r1
	l6KNDKYJNuutHpV2zitxMLNO9lKtpgFSW6cKhDuJ1OIkWWHpLM8/RIFfuuMUq9gk
	wqP2dvAkYk76kLBKSWQ22T9gBMGielIvBB5kwNd3kY=
Date: Thu, 3 Sep 2026 15:06:34 +0800 (CST)
From: CJ <firefly0158@163.com>
To: aivazian.tigran@gmail.com
Cc: linux-kernel@vger.kernel.org,
	syzbot+5b2e10c67416270b15c0@syzkaller.appspotmail.com
Subject:  [BUG] bfs: WARNING in mark_buffer_dirty from bfs_get_block
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TCviatkki4iOcZukdnk8aj+g+UcCwufkj24Bfc+8GgRv84DoEfW1FPnbL6uekLwG0vT6TaBlX0txmU4J4ZkWErJ8K5XYPceep7cIwjA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7bd0e4e9.56b2.1a066173def.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kygvCgD3X+p6HJlqGoc+AA--.7649W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3Rom12qZHHqM0QAA3+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgoKSGksCgoKSSBhbSByZXBvcnRpbmcgdGhhdCBXQVJOSU5HIGluIG1hcmtfYnVmZmVyX2RpcnR5
IHJlbWFpbnMgcmVwcm9kdWNpYmxlIHdpdGggYQptaWdyYXRlZCBzeXprYWxsZXIgcmVwcm9kdWNl
ciBvbiBMaW51eCA3LjItcmMzLiBUaGUgdGVzdGVkIEhFQUQgY29tbWl0IGlzCmExM2MxNDBjYzI4
OWMwYjdiMzc3MGJjZTViM2FkNDJhYjM1MDc0YWEuCgoKVGhlIHJlcHJvZHVjZXIgd3JpdGVzIHRv
IGEgZmlsZSBvbiBhIGNyYWZ0ZWQgQkZTIGZpbGVzeXN0ZW0gYW5kIGVudGVycwpiZnNfZ2V0X2Js
b2NrKCkgdGhyb3VnaCB0aGUgYnVmZmVyZWQgd3JpdGUgcGF0aC4KCgpiZnNfZ2V0X2Jsb2NrKCkg
cmVhY2hlcyBtYXJrX2J1ZmZlcl9kaXJ0eSgpLCB3aGljaCB3YXJucyBhYm91dCB0aGUgc3RhdGUg
b2YKdGhlIG1ldGFkYXRhIGJ1ZmZlciB3aGlsZSBzZXJ2aWNpbmcgdGhlIHdyaXRlLgoKClRoaXMg
bG9va3MgbGlrZSBCRlMgbWFya3MgYSBtZXRhZGF0YSBidWZmZXIgZGlydHkgYmVmb3JlIGl0cyBz
dGF0ZSBoYXMgYmVlbgp2YWxpZGF0ZWQgb3IgaW5pdGlhbGl6ZWQgY29ycmVjdGx5IGZvciB0aGUg
bWFsZm9ybWVkIGZpbGVzeXN0ZW0gaW1hZ2UuCgoKVGhpcyBpc3N1ZSB3YXMgcHJldmlvdXNseSBy
ZXBvcnRlZCBhdDoKCgpodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NWIy
ZTEwYzY3NDE2MjcwYjE1YzAKCgpSZXByb2R1Y2VyOgoKCnN5eiByZXByb2R1Y2VyOiBodHRwczov
L3Bhc3RlYmluLmNvbS9yYXcvVlViYUp6TEIKCgpjb25zb2xlIG91dHB1dDogaHR0cHM6Ly9wYXN0
ZWJpbi5jb20vcmF3L3NGbmFnemJUCmtlcm5lbCBjb25maWc6IGh0dHBzOi8vcGFzdGViaW4uY29t
L3Jhdy9CMGYzZEM3SAoKCktlcm5lbDoKCgpIRUFEIGNvbW1pdDogYTEzYzE0MGNjMjg5YzBiN2Iz
NzcwYmNlNWIzYWQ0MmFiMzUwNzRhYQpnaXQgdHJlZTogdG9ydmFsZHMvbGludXgKa2VybmVsIHZl
cnNpb246IDcuMi4wLXJjMyAjMSBQUkVFTVBUKGZ1bGwpCnRlc3RlZCB0YWc6IHY3LjItcmMzCgoK
TGV0IG1lIGtub3cgaWYgeW91IG5lZWQgbW9yZSBkZXRhaWxzIG9yIHRlc3RpbmcuCgoKQmVzdCBy
ZWdhcmRzCgo=
