Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F161332B13F;
	Thu, 17 Sep 2026 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632041; cv=none; b=cR+hbVV5Q7V1MD241P9bkwcXWkc5Eme9Eno8SWlGRnX2oTeZUvd6rw+jscmfMew9KP3iql+Be48wV9GMLNvSC/zG9K2Lx+i1Atye82JOZEyysl14d2hAyTjonp+hkPaiOkVpsF4Yonm94eDkVqwelAIU3F5GaPsy91RjYqLdFzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632041; c=relaxed/simple;
	bh=hqr0qEEdqIoe2AJI1B4LOV2ycNVlGo3yYJ71z0899z4=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=NhuAnxwvvv9ZiYCOrQ39F+36uMM/uCrsh4Wdrnr7r3EaG7gyenWUV27qKLlLerZzFyjxgH5qWnjhOUvoEwSUQ/BGlxXE0OV6BKaNVCxhHPMhBt4BIXN1R2wuu21HWJYCSvWYCyptfDGZjaROv5YzMavtktuG1bpjvNqq5qWaiiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Hh5xRLfq; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Hh5xRLfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=hqr0qEEdqIoe2AJI1B4LOV2ycNVlGo3yYJ71z0899z4=; b=H
	h5xRLfq+lo+2hJJIXnJIU6Kz3YHGLx9NW3svT4JKvw9R4NMZ4VRqfehHeZGWja1N
	ivJKqO9q8GzUHC7XzqKX5cXjXGOLUTL3NultZySUKBYMWN44AXV7YezZw7Bxu1zN
	rXNXXld9+4SyDqSLQMm7VGHNtKQqxm6/iIlWuUsqZo=
Received: from localhost (unknown [::1])
	by gzsmtp6 (Coremail) with SMTP id TSWEB_0014CB51000021B66AAB9E01;
	Thu, 17 Sep 2026 16:00:01 +0800 (CST)
Received: from firefly0158$163.com ( [120.227.56.131] ) by
 ajax-webmail-wmsvr-40-135 (Coremail) ; Mon, 14 Sep 2026 17:31:30 +0800
 (CST)
Date: Thu, 17 Sep 2026 16:00:00 +0800 (CST)
From: CJ <firefly0158@163.com>
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu, kees@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG] usb: dummy_hcd: general protection fault in set_link_state on
 unbind
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/+ct0oi5ieRZ+kdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/tPLxOpq2AVH9/wlRiZpYCg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <34667d49.9099.1a09f41e473.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:QSgvCgBHtcwFnqtq5PMfAA--.59364W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3RJwImqnvvL0wQAA3p
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==


CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEgZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0IGluIHRoZSBk
dW1teV9oY2QgbGluay1zdGF0ZSBoYW5kbGluZywKdHJpZ2dlcmVkIGJ5IGEgc3l6a2FsbGVyIFVT
QiByZXByb2R1Y2VyLiAgVGhlIGlzc3VlIGlzIHJlcHJvZHVjaWJsZSB3aXRoIEhFQUQKY29tbWl0
IGNlZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzUgKHY3LjMtcmMxLCBMaW51
eCA3LjMuMC1yYzEpLgoKClRoZSByZXByb2R1Y2VyIGNvbm5lY3RzIGEgc3ludGhldGljIEhJRCBV
U0IgZGV2aWNlIHRocm91Z2ggZHVtbXlfaGNkIGFuZCB0aGVuCnVuYmluZHMgdGhlIGR1bW15X2hj
ZC4wIHBsYXRmb3JtIGRldmljZSBieSB3cml0aW5nIGl0cyBuYW1lIHRvIHRoZSBkcml2ZXIncwp1
bmJpbmQgYXR0cmlidXRlLiAgVGhlIGZhaWx1cmUgaGFwcGVucyBkdXJpbmcgdGhlIHRlYXJkb3du
IHRoYXQgZm9sbG93cy4KCgpUaGUgY29uc29sZSBzaG93cyBhIGdlbmVyYWwgcHJvdGVjdGlvbiBm
YXVsdCBmb3IgdGhlIG5vbi1jYW5vbmljYWwgYWRkcmVzcwoweGRmZmZmYzAwMDAwMDAwMDAgd2l0
aCBhIEtBU0FOIG51bGwtcHRyLWRlcmVmIGluIHRoZSByYW5nZSBbMHgwLTB4N10sIGFuZCBSSVAK
aW4gc2V0X2xpbmtfc3RhdGUuICBUaGUgcGF0aCByZWFjaGVzIGl0IHRocm91Z2ggdGhlIGdhZGdl
dCBkaXNjb25uZWN0IGFuZAp1bmJpbmQgc2VxdWVuY2UgKHVzYl9nYWRnZXRfZGlzY29ubmVjdF9s
b2NrZWQgLT4gZ2FkZ2V0X3VuYmluZF9kcml2ZXIgLT4KZGV2aWNlX3JlbW92ZSkgd2hpbGUgdGhl
IGR1bW15IFVEQyBpcyBiZWluZyByZW1vdmVkLgoKCk9uZSBwb3NzaWJsZSBjYXVzZSBpcyB0aGF0
IHRoZSBsaW5rLXN0YXRlIGhlbHBlciBydW5zIG9uIGEgVURDIHdob3NlIHByaXZhdGUKZGF0YSBo
YXMgYWxyZWFkeSBiZWVuIHJlbGVhc2VkIGJ5IHRoZSB1bmJpbmQsIHNvIGl0IGRlcmVmZXJlbmNl
cyBhIE5VTEwKcG9pbnRlci4gIFRoaXMgbG9va3MgbGlrZSBhbiBvcmRlcmluZy9saWZldGltZSBw
cm9ibGVtIGJldHdlZW4gdGhlIHBsYXRmb3JtCmRyaXZlcidzIHJlbW92ZSBwYXRoIGFuZCB0aGUg
Z2FkZ2V0IGRpc2Nvbm5lY3QgcGF0aC4gIEkgbm90ZSB0aGF0IGQ1ZTVjZDM2NTRkMgpmaXhlZCBh
IHJlbGF0ZWQgZ2l2ZWJhY2sgbGlmZXRpbWUgaXNzdWUgaW4gdGhpcyBmaWxlIGJ1dCBkb2VzIG5v
dCBjb3ZlcgpzZXRfbGlua19zdGF0ZS4gIEkgYW0gcmVwb3J0aW5nIHRoZSBmYXVsdCBhbmQgdGhl
IHBhdGggYXMgb2JzZXJ2ZWQuCgoKVGhpcyBhcHBlYXJzIHRvIGJlIGEgcmVjdXJyZW5jZSBvZiB0
aGUgc3l6Ym90IGlzc3VlIHdob3NlIGV4dGVybmFsIGlkIGlzCjgzZTM5YjgyMTU4NzA2NGJkN2Ez
LiAgSXQgcmVtYWlucyByZXByb2R1Y2libGUgb24gdjcuMy1yYzEuCgoKUmVwcm9kdWNlcjoKCgpz
eXogcmVwcm9kdWNlcjoKc3l6X3VzYl9jb25uZWN0JGhpZCgweDMsIDB4MzYsICYoMHg3ZjAwMDAw
MDAxNDApPUFOWT1bQEFOWUJMT0I9IjEyMDEwMDAwMDAwMDAwMTBkODA0ZGQwMDAwMDAwMDAwMDAw
MTA5MDIyNDAwMDEwMDAwMDAwMDA5MDQwMDAwMDEwMzAwMDAwMDA5MjEwNTAwMDAwMTIyMDUwMDA5
MDU4MTAzMDAwMiJdLCAweDApCm1rZGlyYXQoMHhmZmZmZmZmZmZmZmZmZjljLCAmKDB4N2YwMDAw
MDAwMDAwKT0nLi9teXN5c1x4MDAnLCAweDFmZikKbW91bnQoMHgwLCAmKDB4N2YwMDAwMDAwMDgw
KT0nLi9teXN5c1x4MDAnLCAmKDB4N2YwMDAwMDAwMGMwKT0nc3lzZnNceDAwJywgMHgwLCAweDAp
CnIwID0gb3BlbmF0KDB4ZmZmZmZmZmZmZmZmZmY5YywgJigweDdmMDAwMDAwMDEwMCk9Jy4vbXlz
eXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvZHVtbXlfaGNkL3VuYmluZFx4MDAnLCAweDEsIDB4MCkK
d3JpdGUocjAsICYoMHg3ZjAwMDAwMDAyMDApPSdkdW1teV9oY2QuMFx4MDAnLCAweGIpCgoKY29u
c29sZSBvdXRwdXQ6IGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy8xQ05WZk1IdwprZXJuZWwgY29u
ZmlnOiBodHRwczovL3Bhc3RlYmluLmNvbS9yYXcvMTlZdlRTRXAKCgpLZXJuZWw6CgoKSEVBRCBj
b21taXQ6IGNlZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzUKZ2l0IHRyZWU6
IHVwc3RyZWFtIChsaW51eC5naXQpLCB0ZXN0ZWQgdGhyb3VnaCB0aGUgdjcuMy1yYzEgYW5ub3Rh
dGVkIHRhZyBvYmplY3QKwqAgwqAgwqAgwqAgwqAgwqBlNWUwNDcyNmNkZDA0M2UzMDk2NzcwNzFh
YjFiNjVhNGIxOGY0MjJiCmtlcm5lbCB2ZXJzaW9uOiA3LjMuMC1yYzEgIzEgUFJFRU1QVChmdWxs
KQp0ZXN0ZWQgdGFnOiB2Ny4zLXJjMSAoTGludXggNy4zLXJjMSwgMjAyNi0wOC0zMCkKCgpMZXQg
bWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGRldGFpbHMgb3IgdGVzdGluZy4KCgpCZXN0IHJlZ2Fy
ZHMsCkNoYW5namlhbg==
