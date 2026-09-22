Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458647532E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056571; cv=none; b=K6wKxxX/AeIbmp+SsCauIwOGvr59xQczkoCY7jTnGQ3ln5Akq1g76E0/eYPRaizWYjg3jsN0iUt4iCUodL9qpIDr/Rt5PV7LG390TQ3ZHymuBQZN5WhMKLw3WX6JP8zZlhd2WrIIFltA8HH+pmqJ0rO6v3PHUiaoRmMIu0yRKgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056571; c=relaxed/simple;
	bh=xJE2RPRrjE2xFAxN8TN8qACvLhIFMu8U+G86uWfbeVY=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=GcedY5IDeqS3yIsvokQ5cOOICrSPPWv48+tukzlxxAOcex8AwVEVJTxiMZScHEiQlagISmYnnW1wWlzzpEw1yxZQyuQrQZ2WsNYySWR8UYIA/rWagfyJLLqbUYMxXa0TBfJnJC3moxSmNxkMfwVyZD9akejbMQr3iiw9OW2icUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Nny36gP+; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Nny36gP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=xJE2RPRrjE2xFAxN8TN8qACvLhIFMu8U+G86uWfbeVY=; b=N
	ny36gP+v9ZJQl+zq/gDKzcHFgplwMPRlOqq9ag8GDXOe9Ng7tYkdoCUPrT3BGuhP
	uAR2OY2V9j2dO1y2DRTEWVuLYpZdrqCLx2UFUJuBEe6PaXtWD93tTQy977gCU/aP
	kfScm6+nEJiETGdQjTHpLl9gL8OSzeLWQ2Xze03tvI=
Date: Tue, 22 Sep 2026 13:55:25 +0800 (CST)
From: CJ <firefly0158@163.com>
To: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org
Subject: [BUG] ocfs2: assertion failure in _ocfs2_free_suballoc_bits on a
 crafted image
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2SAvyeuU0p4yaQZekdmEsTju82UcS4ufQl245Xc9AFnzDx1CUeUEVoNEnL3u+GDDKJiQeYbxJT7up3XLtGzFpAit8hfctiXucOgtMbWw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <6a202941.4a55.1a0c7aeef7d.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iygvCgD3l1ROGLJqe0RMAA--.39495W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3Q1gEmqyGE3Y3gAA3p
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCgpJIGFtIHJlcG9ydGluZyBhbiBpc3N1ZSB0cmlnZ2VyZWQgYnkgYSBzeXprYWxsZXIg
cmVwcm9kdWNlciBvbiBMaW51eAo3LjMuMC1yYzIuIFRoZSBpc3N1ZSBpcyByZXByb2R1Y2libGUg
d2l0aCBIRUFEIGNvbW1pdApkZjI5MDgwOTBjZGEzNjhiMDFmZjQzNzA5ZjUxODkwMDc2YzU2MTU3
LgoKClRoZSByZXByb2R1Y2VyIG1vdW50cyBhIGNyYWZ0ZWQgb2NmczIgaW1hZ2Ugd2l0aCBjb21t
aXQ9IG9wdGlvbnMgYW5kIHRoZW4KcmVtb3ZlcyBhIGRpcmVjdG9yeSwgd2hpY2ggbWFrZXMgb2Nm
czIgZXZpY3QgdGhlIGlub2RlIGFuZCByZWxlYXNlIGl0cwpzdWJhbGxvY2F0b3IgYml0cy4KCgpX
aGlsZSBmcmVlaW5nIHRoZSBiaXRzLCBfb2NmczJfZnJlZV9zdWJhbGxvY19iaXRzKCkgcmVhZHMg
dGhlIGdyb3VwCmRlc2NyaXB0b3IgZm9yIHRoZSB0YXJnZXQgZ3JvdXAgYW5kIGNoZWNrcyB0aGF0
IHRoZSByYW5nZSBpdCBpcyBhYm91dCB0bwpjbGVhciBmaXRzIHdpdGhpbiB0aGUgZ3JvdXAncyBk
ZWNsYXJlZCBiaXQgY291bnQuIFRoZSBjaGVjayBmYWlscyBhbmQKQlVHX09OKCkgdGVybWluYXRl
cyB0aGUga2VybmVsLiBUaGUgY2FsbCBwYXRoIGlzIG9jZnMyX2V2aWN0X2lub2RlKCkgLT4Kb2Nm
czJfd2lwZV9pbm9kZSgpIC0+IG9jZnMyX3JlbW92ZV9pbm9kZSgpIC0+IG9jZnMyX2ZyZWVfZGlu
b2RlKCkgLT4KX29jZnMyX2ZyZWVfc3ViYWxsb2NfYml0cygpLCByZWFjaGVkIGZyb20gdmZzX3Jt
ZGlyKCkgaW4gdGhlIHVubGlua2F0CnN5c2NhbGwgY29udGV4dC4KCgpUaGlzIGxvb2tzIGxpa2Ug
dGhlIG9uLWRpc2sgZ3JvdXAgZGVzY3JpcHRvciBhbmQgdGhlIHN1YmFsbG9jYXRvciBjaGFpbgpk
aXNhZ3JlZWluZyBhYm91dCB0aGUgc2l6ZSBvZiB0aGUgZ3JvdXAsIHNvIHRoZSByZWxlYXNlIHJh
bmdlIGNvbXB1dGVkIGZyb20KdGhlIGNoYWluIGZhbGxzIG91dHNpZGUgaXQuIFNpbmNlIHRoZSBp
bWFnZSBpcyB1bnRydXN0ZWQgaW5wdXQsIHJlcG9ydGluZwp0aGUgaW5jb25zaXN0ZW5jeSBhcyBh
IGZpbGVzeXN0ZW0gZXJyb3IgaW5zdGVhZCBvZiBhbiBhc3NlcnRpb24gd291bGQga2VlcAp0aGUg
a2VybmVsIGFsaXZlLiBJIGhhdmUgbm90IGRldGVybWluZWQgd2hpY2ggb2YgdGhlIHR3byBtZXRh
ZGF0YSBzb3VyY2VzCmNhcnJpZXMgdGhlIGluY29uc2lzdGVudCB2YWx1ZS4KCgpUaGlzIGZhaWx1
cmUgd2FzIHJlcG9ydGVkIGVhcmxpZXIgYWdhaW5zdCB0aGUgbGludXgtNi4xIGxvbmd0ZXJtIHNl
cmllcyBhdApodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9M2I2NjRkOThh
NzdhMzI5YmU3N2UsIGFuZCB0aGUKcmVwcm9kdWNlciBiZWxvdyBpcyB0aGUgb25lIGZyb20gdGhh
dCByZXBvcnQuIEl0IHN0aWxsIHJlcHJvZHVjZXMgb24gdGhlCnRlc3RlZCBtYWlubGluZSBrZXJu
ZWwuCgoKUmVwcm9kdWNlcjoKCgpzeXogcmVwcm9kdWNlcjrCoCDCoGh0dHBzOi8vcGFzdGViaW4u
Y29tL3Jhdy85dlZBTlhnWgpjb25zb2xlIG91dHB1dDrCoMKgaHR0cHM6Ly9wYXN0ZWJpbi5jb20v
cmF3L0FaTXZxQm0wCmtlcm5lbCBjb25maWc6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29t
L3RleHQ/dGFnPUtlcm5lbENvbmZpZyZ4PTZhNWNiZDI2ODQwNmJmNDMKCgpLZXJuZWw6CgoKSEVB
RCBjb21taXQ6IGRmMjkwODA5MGNkYTM2OGIwMWZmNDM3MDlmNTE4OTAwNzZjNTYxNTcKZ2l0IHRy
ZWU6IG1haW5saW5lCmtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1yYzIKdGVzdGVkIHRhZzogdjcuMy1y
YzIgKGFubm90YXRlZCB0YWcgb2JqZWN0IDVlMDM2Y2UxMmRlOTFjNmZkNjc0ZGFkMzNiMTY5YzYx
NTBiZTJhN2EpCgoKTGV0IG1lIGtub3cgaWYgeW91IG5lZWQgbW9yZSBkZXRhaWxzIG9yIHRlc3Rp
bmcuCgoKQmVzdCByZWdhcmRzLApDaGFuZ2ppYW4gTGl1wqA=
