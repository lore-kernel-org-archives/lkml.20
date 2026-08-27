Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD02874FB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787809936; cv=none; b=DbZPxo6ghoIyTK29VSZ/hpN2Am4BmqQ9ofldyTWas+rGry4a4fDrjtvxGpbhMJ5s8Holagd1ir/K+ExkQNGkYpqJmNIDLFk9oGNxA5pKj1KpQZ0PEVLoFQvvu3YMF+CmAX56tSEde+gyA5RG9aSDjOi/TGY81ILaEEp4qutNfAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787809936; c=relaxed/simple;
	bh=RasxDujglw7nh+5bbVv20kwFUdrsinTVr8bS4wt5qOM=;
	h=Message-ID:Content-Type:MIME-Version:From:To:Cc:Subject; b=PizZByNORKw9KPHYOymXouDeQvGnxkjZ/KUCzzD3pWHIG9U6Q6ZvpUmyvMB/xfgNjnNtpubPDGfwbJQ28zG81ju6GylRpM9ETuFvp/CaOjOvNdTXNoR5dS7NYI20erFXAj8gYjJe6TO70mspUL4bX/zT02B/Eixfg+JlbF0z5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=L37StuFX; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="L37StuFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787809923; bh=RasxDujglw7nh+5bbVv20kwFUdrsinTVr8bS4wt5qOM=;
	h=From:To:Cc:Subject;
	b=L37StuFXdH/iwXrNwuWMMZTj+MuP0tV62yRlBO+8WNLXlXYieWVBaOXyMBV52srdb
	 B/DFIQa4agk9/CnDQ1v0tKuhRqoFRgSzm/SX27teA3l2cJZEKl5MnGoisVmck6JrDC
	 J8FHbFgv/bkngCKBqx6TVoxaCLfyRNdQQbZM0BQw=
Received: from [192.168.137.1] ([2409:8a28:2472:b2a1:3000:48a1:cb6d:82ef])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id CADA2C30; Thu, 27 Aug 2026 13:50:45 +0800
X-QQ-mid: xmsmtpt1787809845t4lyjkyfq
Message-ID: <tencent_4F73DEA0B9989946C80BA28272DFA61C1F09@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvTSskAZHf+fzUjd5PLlcl7TrGlnVUo+EqDsiLjcQHA5hGVlVmoQz
	 Jt1z9C2VWfQOjbZGecNDxPY+ta6vH7fzr+DVccf5Z1SHMiwdbOClwHmJuOskcmBsv6piFcmukoHA
	 K/Nyn+EL3YPiVoli1OmnUpliYhK5UNvSsYZxnnpAnsC7KrSOUBxLPRIxwezpo7mmD4aXHZgkm+/Z
	 6IqwsRIs6ZGkEjfgTIjsOEFKoA8ocGNX5f1gyc1BUmdMIIeei7BOBJ3xJwukdF0HmBHyY0mjm2u2
	 BQN5K8FE3VUpQ2NBxJf3mPmaVj+Q84Romqk0v3GNvuiTv5pbFQZrRajNQ2vaRfUhSQ+hsBBcAwzd
	 VXp6bBz9dskCw9FiXtwIdlaHo2+kacprNjGfiBB23/dB9k7Fit3SazUp5DtT1J5DNCveHHfYCPB8
	 HKMbkPP3hpld32ayaIY+pTgTXMKO41ahWXsUf9v0E15F9NSeKEhp7Vm60uXBB8LDrfDcQZ7Jm201
	 sUMjj+nhxNep9+1rRlX2GP0uFgHW7K6J+fmrcu7IMPhfuCUHiDftQEk2vrHnEAwptx1vHwMI1dc5
	 X7P6n47AWPzZbAZwUnTJx5rx4h6eTXqtgqECdsefVP92HdMd9DgVpArBeNB984yxUYR4CWmPDjAQ
	 putNEAZt1n1CvfCVEcPPPx+UrYejbpaYdikoAkQMjlZRlLuw4dfm/zeyGbddQ9+trXQWAzbj/dNO
	 KolMomvImIIXRWuGyC6dZnHohoeIMwsJL7BdivgAR0eXoqye3Tyi0ZMtUXklDu4VmkvxQAsPhczh
	 mMQr0GYREizEh3kB+WK0HmEIHDfYT2rSGz44HwvWiC5KDAu6J3wkztGg3IMXdlNmJiovAKe1qvSR
	 J+IHqE9FfYKpu8WI9jM8SCp9HCsMk6v1ohvUydFjj+ttAt0wyFYQHHSUSpzTZFJcsbZ/qCyQvFkD
	 9Mzk5JQrPLnJ+2Kh8Qy5IVgDcnV/4QvivwXPGqWz3WQdaTrEi24I+ke/Y4oFN0m9HeF6F/YQ7HW/
	 zWQsTL80cmZ4Bqoc1tnZWR1efibNo2SW5v8wrAfVFBR7tnd6Ugaf/vJWTl9z4=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: 3237174131@qq.com
To: linux-kernel@vger.kernel.org
Cc: tglx@kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH v2] scripts/spdxcheck: add friendly error message for missing
 ply module

Q2hhbmdlcyBzaW5jZSB2MToKLSBSZW1vdmUgZW1haWwgaGVhZGVycyBmcm9tIHBhdGNoIGJvZHkK
ClRoZSBzcGR4Y2hlY2sucHkgc2NyaXB0IHJlcXVpcmVzIHRoZSAncGx5JyBQeXRob24gbW9kdWxl
LCBidXQgd2hlbgppdCBpcyBtaXNzaW5nLCB0aGUgc2NyaXB0IGNyYXNoZXMgd2l0aCBhIHJhdyBJ
bXBvcnRFcnJvciB0cmFjZWJhY2suClRoaXMgaXMgZXNwZWNpYWxseSBwcm9ibGVtYXRpYyBpbiBD
SSBlbnZpcm9ubWVudHMgd2hlcmUgdGhlIGVycm9yCmlzIG5vdCBpbW1lZGlhdGVseSBvYnZpb3Vz
LgoKQWRkIGEgZnJpZW5kbHkgZXJyb3IgbWVzc2FnZSB0aGF0IHRlbGxzIHRoZSB1c2VyIGV4YWN0
bHkgd2hhdCBpcwpuZWVkZWQgYW5kIGhvdyB0byBpbnN0YWxsIGl0LgoKU2lnbmVkLW9mZi1ieTog
WGlhIFpob3hpbiA8MzIzNzE3NDEzMUBxcS5jb20+Ci0tLQogc2NyaXB0cy9zcGR4Y2hlY2sucHkg
fCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9zcGR4Y2hlY2sucHkgYi9zY3JpcHRzL3NwZHhjaGVj
ay5weQotLS0gYS9zY3JpcHRzL3NwZHhjaGVjay5weQorKysgYi9zY3JpcHRzL3NwZHhjaGVjay5w
eQpAQCAtNSw3ICs1LDEzIEBACiBmcm9tIGFyZ3BhcnNlIGltcG9ydCBBcmd1bWVudFBhcnNlcgot
ZnJvbSBwbHkgaW1wb3J0IGxleCwgeWFjYwordHJ5OgorICAgIGZyb20gcGx5IGltcG9ydCBsZXgs
IHlhY2MKK2V4Y2VwdCBJbXBvcnRFcnJvciBhcyBlOgorICAgIGltcG9ydCBzeXMKKyAgICBzeXMu
c3RkZXJyLndyaXRlKCdFcnJvcjogJXNcbicgJSBlKQorICAgIHN5cy5zdGRlcnIud3JpdGUoJ1Bs
ZWFzZSBpbnN0YWxsIHRoZSBwbHkgbW9kdWxlIChlLmcuLCBwaXAgaW5zdGFsbCBwbHkpXG4nKQor
ICAgIHN5cy5leGl0KDEpCiBpbXBvcnQgbG9jYWxlCiBpbXBvcnQgdHJhY2ViYWNrCiBpbXBvcnQg
Zm5tYXRjaAo=

