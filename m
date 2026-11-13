Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541683;
	b=k3awmEohQqcPGpDAwkonRNodBgPDg1LLcqZssG/wrtLZ2YNoM93m7gfCIZo9ww6NMpYE
	 R/llQQko0XYeTz9K97zeTG6TYELQOvncC4mT8GjLlN4oZVtPTTLK6G07HhzOJhN859rRt
	 k0W1Q8nM+Ur1tGFx2TEIPD/hEuRCE3P3n0brYpWlNdYAaYvT33EP+30HG+mSRb0Y3oqOy
	 D19we53AYiJEPFdsbnLiPQb3F8D8Zk90b8aXryuT1xhHW6OnqGzAGKp4AZCyy9C1A6Pj6
	 L/hkCBEebqt/yjoWEVBcGyBK5sEAdwwwEhi1Pl1/+WFr8uiFX9q/MBt+gwANJP8L/sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541683;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:X-Priority:
	 X-Mailer:X-NTES-SC:Content-Transfer-Encoding:Content-Type:
	 MIME-Version:Message-ID:X-Coremail-Locale:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=1LqCBd9c7mRu6DcuxkfC61cv1R8HOtdJaHzWaHAAbSg=;
	b=zmwWGFNzGyev8xQNFDpLmHzh1mEScpnRjqpwKqs2Vjx5+ftRLVmljoYkly595ANHwXKZ
	 Vx1Bisx0osc5HYn6bxrH8qSPNvw5LHt+WTddKVzK3u1muTfp8NQie/vZVjjJDqY0Ubr1k
	 fRcH3DGxitpr6nhrRCKoEYD/FfAD1ZNyrEoyiYvvG1E7QYTCWjZp7Rxo6/35dtZ4vW0fk
	 NV8lYjnfA3xIRhRtXQqiGI+QUMulEeZEFKtnJXblY2HQ8pSimifAwa6WYZGXe94UgrZeZ
	 hQoZ8cKCXg+QOVzdAwK1KxSXG+P5SWeKL2hCq3+0sQQvIpnGNnqN9HBo+jDkB+3SQlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PZOwlTN2;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB84606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB84606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PZOwlTN2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=1LqCBd9c7mRu6DcuxkfC61cv1R8HOtdJaHzWaHAAbSg=; b=P
	ZOwlTN2dOIqm10Ji2fHOJ+n7409+2Tqjsy63pcFUrdYWgYpQVg5uxiibDOOqiAN4
	5cA6L/uwsqa29IgwivI3YbxIorVL/MLU+itKQLrv8Q9noavfUYeS5lEG2wW4+HpL
	zN2RXN2T+B/9gs/W9JBC1jnWHHL2j3tqMCqeieHsbI=
Date: Fri, 13 Nov 2026 11:47:22 +0800 (CST)
From: CJ <firefly0158@163.com>
To: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com
Cc: ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org
Subject: kernel BUG in ocfs2_reserve_suballoc_bits on v7.3-rc2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2SBvmfvk4v5CSYbOkdmEsTju82UcS4ufQl245Xc98Fnj/m0QAgUkVjHWLvy8SkMRGyrhS9cglw1fpzYbBy3fS9sil+8ORfBQxB7asxLg==
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
Message-ID: <14bb82fe.33fe.1a1d30462b6.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgDX_75KiPZqcl02AA--.1742W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC+QqMPmr2iEphSwAA31
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEga2VybmVsIEJVRyBpbiBvY2ZzMl9yZXNlcnZlX3N1YmFs
bG9jX2JpdHMuIEl0IGlzIHN0aWxsIHJlcHJvZHVjaWJsZSBvbgpMaW51eCB2Ny4zLXJjMiAoSEVB
RCBkZjI5MDgwOTBjZGEzNjhiMDFmZjQzNzA5ZjUxODkwMDc2YzU2MTU3KSB3aXRoIGEgc3l6a2Fs
bGVyIHJlcHJvZHVjZXIuCnN5emJvdCBvcmlnaW5hbGx5IHJlcG9ydGVkICJrZXJuZWwgQlVHIGlu
IG9jZnMyX3Jlc2VydmVfc3ViYWxsb2NfYml0cyIgb24gbGludXgtNi4xCihodHRwczovL3N5emth
bGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NDg3ZTM5MzA0MTI5MzIxZGQyNTMpLiBUaGUgdGFy
Z2V0IGNvbnNvbGUgc2hvd3MgYSBtYXRjaGluZyBmYWlsdXJlIHNpZ25hdHVyZS4KCgpUaGUgcmVw
cm9kdWNlciBtb3VudHMgYSBjcmFmdGVkIE9DRlMyIGltYWdlIGFuZCBjcmVhdGVzIGEgZmlsZSwg
cmVhY2hpbmcgdGhlIG1ldGFkYXRhIHN1YmFsbG9jYXRvciB3aGlsZSByZXNlcnZpbmcgYmxvY2tz
IGZvciB0aGUgbmV3IGlub2RlLgoKCk9uIHRoZSB0YXJnZXQsIHRoZSBrZXJuZWwgcmVwb3J0czoK
wqAgT29wczogaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMxXSBTTVAgS0FTQU4gTk9QVEkKwqAgUklQ
OiBvY2ZzMl9yZXNlcnZlX3N1YmFsbG9jX2JpdHMKCgpUaGUgZGlhZ25vc3RpYyBwYXRoIGlzIG9j
ZnMyX3Jlc2VydmVfbmV3X21ldGFkYXRhX2Jsb2NrcyAtPiBvY2ZzMl9jYWxjX3hhdHRyX2luaXQg
LT4gb2NmczJfbWtub2QgLT4gb2NmczJfY3JlYXRlLgpJdCBzaGFyZXMgNSBrZXkgc3RhY2sgZnJh
bWVzIHdpdGggdGhlIG9yaWdpbmFsIGtlcm5lbCBCVUcKcmVwb3J0LCBpbmNsdWRpbmcgb2NmczJf
cmVzZXJ2ZV9uZXdfbWV0YWRhdGFfYmxvY2tzLCBvY2ZzMl9ta25vZCwgb2NmczJfY3JlYXRlLCBw
YXRoX29wZW5hdC4KCgpUaGlzIGxvb2tzIGxpa2UgdGhlIHN1YmFsbG9jYXRvciBoaXR0aW5nIGFu
IGludmFyaWFudCBmYWlsdXJlIHdoaWxlIHJlc2VydmluZyBtZXRhZGF0YSBibG9ja3MgZm9yIGEg
bmV3IGlub2RlLgoKClRoaXMgaXMgYSBmb2xsb3ctdXAgZm9yIGFuIGV4aXN0aW5nIHN5emJvdCBy
ZXBvcnQgYW5kIGRlc2NyaWJlcyBhbgpvYnNlcnZlZCBmYWlsdXJlLCBub3QgYSBiaXNlY3RlZCBy
b290IGNhdXNlLgoKClJlcHJvZHVjZXI6CsKgIEMgcmVwcm9kdWNlcjogaHR0cHM6Ly9wYXN0ZWJp
bi5jb20vcmF3L0h3dERybWF6CgoKY29uc29sZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGViaW4uY29t
L3Jhdy9QM25LQ2V0ZwprZXJuZWwgY29uZmlnOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS90ZXh0P3RhZz1LZXJuZWxDb25maWcmeD1iMWFkYzBiZmRlMmQ4YTRhCgoKS2VybmVsOgrCoCBI
RUFEIGNvbW1pdDogZGYyOTA4MDkwY2RhMzY4YjAxZmY0MzcwOWY1MTg5MDA3NmM1NjE1NwrCoCBn
aXQgdHJlZTogbGludXgtc3RhYmxlCsKgIGtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1yYzIKwqAgdGVz
dGVkIHRhZzogdjcuMy1yYzIKCgpMZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGRldGFpbHMg
b3IgdGVzdGluZy4KCgpUaGFua3MuCgo=
