Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A23285058
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787809015; cv=none; b=fu0ImWtma5lrFeNebMMDAKkI4qWXn+muLCAtm7OH/dpNTLKfmOX7z8W3CQEISThmtHMWQpgRdHkzamusylMs0YX63L+rJAbXqy9E5Ux8wsZntYrftvRTjvwaEGywrv1sq5adDLFs2ByYMYyBoSk/Wr81ztHyOAWGmrFP0P+QJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787809015; c=relaxed/simple;
	bh=EO1L2TeQ17O2KPCvU6H8XkwQRS56pa00oW6MBI1UTjg=;
	h=Message-ID:Content-Type:MIME-Version:From:To:Cc:Subject; b=mWzFOUwUj77yybOcn0dJEed+5nDN9pOAaqJH8komlLbMf+A4YMmOvCHph0FJ86CgesWIA0BlBvDDkPGoclxG1yD6/XZKE6vv4zBaVgreS99T70bMl/MESY3w6h/QHT8VYA8kQHRwqAk7y5ukxFt9y7ykefyjITJBBi9eqaBQ/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=pQzD4pt3; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="pQzD4pt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787809009; bh=EO1L2TeQ17O2KPCvU6H8XkwQRS56pa00oW6MBI1UTjg=;
	h=From:To:Cc:Subject;
	b=pQzD4pt3zM/xp10Dk5IOIvrt/0SOS7M8GajVCHHinWF4ZDM4T6kUiJ5IMwa8Vhlrd
	 gykpngEtZUSWQOmqzeITpeXbRY7KC4VQ63OY+QOvMawLvt+oaFkPe1rTYqKzSQkm1/
	 L239YjuhkXnfi0hghR9jf3IUCU1NVdOeLLbHCtPA=
Received: from [192.168.137.1] ([2409:8a28:2472:b2a1:3000:48a1:cb6d:82ef])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8E6B34A2; Thu, 27 Aug 2026 13:35:38 +0800
X-QQ-mid: xmsmtpt1787808938tewbvhx7b
Message-ID: <tencent_DB8D234F4E3B341F73D78849C17E50D19B06@qq.com>
X-QQ-XMAILINFO: NxKoLLhE22aTcI+DdYyMDRRMdCLQc6wOvyI2oF2qpVI3VZ7zTmIY01s5sMJu8Q
	 632HICMZQChTRIYK8mYJ/vJQYCWb9jkgQbAnhvIt55Y7k6sPqovXjmNSQXUCKUFBSlZP/H46tsTR
	 gTcIlVBNLaPaoexLN2IxowC3IOFqxSPC/waqqWAB9M+gOE0RRrMDBN8UdrOGGRdBh2vPj2FK7JsI
	 MjflP+c38yNCEPdAwt2jbLX7F39DnF7QFrgCYo7mvLA20zHuv903fk07BEMkuReqizDyYQKui56K
	 ns0DoXJjHARcsKuk3pwf0mZvpzN3nUjQv2R2wLo2Gf9x/Vi9p6RZ8UgaIYiEGbHTq+4mFmbUJ+jl
	 ua/eHVdh2lM1zwprYQ7Ugkm/EFcb4W5DAN6uGDK/IfwJpPW0s9ZYqFXTuKDwRQkWm2bQgsrhp1Kf
	 znArRgW8SlhcBvdaejx4KqJq4Rvblmv8Hq80MTjuv34/Y6HYl1cQYI+ifVsDc4RMrTd8m8KyGRjY
	 HLaVeJQhszhCIj+GVgdHNuYvqnc1FHpPZ2fM9niYjIcxdfZTIWTW3c149Uxg8B83kcW6UTfRn1LN
	 /rWBHQA9ikS+TBRoAEXZ43S9b8nFxLEmfbuVlTSUdlZt1g+7tbXLRERwZfmcgw3H2Qlkk0E2YiM0
	 TmfsXrotPXnQHoE3Pdr+OsvHjyQ0A0NT6k7E7vLyDSzQbFOniPSiP1kAdMVkskf4v5tY7WRuYamT
	 hjYLdEgA07anaseVXjWrHBs2mGyiV4LTM5GY6Q082HIkuQ2TkmdaDJYMZYYNweqa4bxDOOEjlvzx
	 3WdryoHzxiXCkYQSPtaG8D+PEUkLSr1I9MPlxcuBpE0giwMoD6oXjgmZwevCekRkE/nqncUp4s7I
	 5U/QL2/tul6oX/xR/ozOrVoVLE3LiSzu5U/Bvr4nZMda4ZlXvAFOjeLKK53P8v/kU2fCQbx5RCxV
	 4rss+oTetz9yv90D61SlnpGeY9APPm5UVLF/MNdv7cW92LnLz3UGFolDqvKMxgQ2cdQw7U2zsTfd
	 p3c4jkw8dKZZmVRsOl
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
Content-Type: multipart/mixed; boundary="===============4210373017446004769=="
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: 3237174131@qq.com
To: linux-kernel@vger.kernel.org
Cc: tglx@kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH] scripts/spdxcheck: add friendly error message for missing ply
 module

--===============4210373017446004769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

RnJvbTogWGlhIFpob3hpbiA8MzIzNzE3NDEzMUBxcS5jb20+ClN1YmplY3Q6IFtQQVRDSF0gc2Ny
aXB0cy9zcGR4Y2hlY2s6IGFkZCBmcmllbmRseSBlcnJvciBtZXNzYWdlIGZvciBtaXNzaW5nIHBs
eSBtb2R1bGUKVG86IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IHRnbHhAa2VybmVs
Lm9yZywgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcKClRoZSBzcGR4Y2hlY2sucHkgc2NyaXB0
IHJlcXVpcmVzIHRoZSAncGx5JyBQeXRob24gbW9kdWxlLCBidXQgd2hlbgppdCBpcyBtaXNzaW5n
LCB0aGUgc2NyaXB0IGNyYXNoZXMgd2l0aCBhIHJhdyBJbXBvcnRFcnJvciB0cmFjZWJhY2suClRo
aXMgaXMgZXNwZWNpYWxseSBwcm9ibGVtYXRpYyBpbiBDSSBlbnZpcm9ubWVudHMgd2hlcmUgdGhl
IGVycm9yCmlzIG5vdCBpbW1lZGlhdGVseSBvYnZpb3VzLgoKQWRkIGEgZnJpZW5kbHkgZXJyb3Ig
bWVzc2FnZSB0aGF0IHRlbGxzIHRoZSB1c2VyIGV4YWN0bHkgd2hhdCBpcwpuZWVkZWQgYW5kIGhv
dyB0byBpbnN0YWxsIGl0LgoKU2lnbmVkLW9mZi1ieTogWGlhIFpob3hpbiA8MzIzNzE3NDEzMUBx
cS5jb20+Ci0tLQogc2NyaXB0cy9zcGR4Y2hlY2sucHkgfCA4ICsrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9zcGR4Y2hlY2sucHkgYi9zY3JpcHRzL3NwZHhjaGVjay5weQotLS0gYS9zY3JpcHRzL3NwZHhj
aGVjay5weQorKysgYi9zY3JpcHRzL3NwZHhjaGVjay5weQpAQCAtNSw3ICs1LDEzIEBACiBmcm9t
IGFyZ3BhcnNlIGltcG9ydCBBcmd1bWVudFBhcnNlcgotZnJvbSBwbHkgaW1wb3J0IGxleCwgeWFj
YwordHJ5OgorICAgIGZyb20gcGx5IGltcG9ydCBsZXgsIHlhY2MKK2V4Y2VwdCBJbXBvcnRFcnJv
ciBhcyBlOgorICAgIGltcG9ydCBzeXMKKyAgICBzeXMuc3RkZXJyLndyaXRlKCdFcnJvcjogJXNc
bicgJSBlKQorICAgIHN5cy5zdGRlcnIud3JpdGUoJ1BsZWFzZSBpbnN0YWxsIHRoZSBwbHkgbW9k
dWxlIChlLmcuLCBwaXAgaW5zdGFsbCBwbHkpXG4nKQorICAgIHN5cy5leGl0KDEpCiBpbXBvcnQg
bG9jYWxlCiBpbXBvcnQgdHJhY2ViYWNrCiBpbXBvcnQgZm5tYXRjaAo=

--===============4210373017446004769==--

