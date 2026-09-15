Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DC12AE76;
	Tue, 15 Sep 2026 07:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457029; cv=none; b=CFHQiGuAVKvJTIBAXibIwt6sqj2nsjV96Q0oO9MLFGWedPzdNjHJs425kzH9m2+nWUFbr8lcO/213YaDKNO1m0UXHYF2Gt5owSnShdGrysqYRQmMB1++Nt9X0VRneq8HMmzGtxeZkzngRXEGvApPnvF7/9bcKQuvVuZGRBo9wQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457029; c=relaxed/simple;
	bh=3ceQ+/tETlo+vA+fGLUIQq4DIKWPDCbXSIzpeEpFnjc=;
	h=Date:From:To:Cc:Subject:Content-Type:MIME-Version:Message-ID; b=TkM873GBjLsBXLy8pE+MQulCQra1N2V6puVx/lnKvbxqWcAJw19i0rdJhr/R1UrOt6mGXDs7ewBrKrAd5N0ihNLMp9QeJUN9Fj9UUEL9uH+wfJf6i0r99AWuCGiQHucqvAWvu9HqE7W7EPxZOfa4nccNejqhIY2a5Pb5UjrdRuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dzbkyUvH; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dzbkyUvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=3ceQ+/tETlo+vA+fGLUIQq4DIKWPDCbXSIzpeEpFnjc=; b=d
	zbkyUvHWsNf1QssGTCqKoGIWaVmW8gOx+M+xyk0UX0LiIDjAowU2H1diKpYw2gJ2
	gPm49tvrR7963Rc78lCIfIRAhDIw7K8OCPPSJTBNQBywdT+tSWdD8ssD/5z9FPvo
	5ohuKlxa5zWyT7jAScwnX+nzxm/tcNnX89yhSfNWbs=
Date: Tue, 15 Sep 2026 15:23:33 +0800 (CST)
From: CJ <firefly0158@163.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [BUG] media: dw2102: general protection fault in
 su3000_i2c_transfer
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/ieuEgq5SOeZekdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/jatSp04pi74X/ye/RxWX7g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <34c9eb18.63fd.1a0a3f31a7b.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:hygvCgD3N8Z28qhqvv8PAA--.21433W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC3haeUGqo8nZIFQAA3d
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhpLAoKCkkgYW0gcmVwb3J0aW5nIGEgZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0IGluIHRoZSBk
dzIxMDIgRFZCIFVTQiBkcml2ZXIncyBJMkMKdHJhbnNmZXIgcm91dGluZSwgdHJpZ2dlcmVkIGJ5
IGEgc3l6a2FsbGVyIFVTQiByZXByb2R1Y2VyLiAgVGhlIGlzc3VlIGlzCnJlcHJvZHVjaWJsZSB3
aXRoIEhFQUQgY29tbWl0IGNlZTkzOTVhY2Q4MDQzYmUwNjQ0YjI1YzM0YmZhODY2MjNmMmI5MzUK
KHY3LjMtcmMxLCBMaW51eCA3LjMuMC1yYzEpLgoKClRoZSByZXByb2R1Y2VyIGNvbm5lY3RzIGEg
c3ludGhldGljIFVTQiBkZXZpY2UgdGhhdCBtYXRjaGVzIHRoZSBkdzIxMDIgZHJpdmVyLApvcGVu
cyB0aGUgSTJDIGRldmljZSBub2RlIHRoZSBkcml2ZXIgcmVnaXN0ZXJzLCBhbmQgaXNzdWVzIGFu
IEkyQ19SRFdSIGlvY3RsCndpdGggYSB0d28tbWVzc2FnZSB0cmFuc2Zlci4KCgpUaGUgY29uc29s
ZSBzaG93cyBhIGdlbmVyYWwgcHJvdGVjdGlvbiBmYXVsdCBmb3IgdGhlIG5vbi1jYW5vbmljYWwg
YWRkcmVzcwoweGRmZmZmYzAwMDAwMDAwMDIgd2l0aCBhIEtBU0FOIG51bGwtcHRyLWRlcmVmIGlu
IHRoZSByYW5nZSBbMHgxMC0weDE3XSwgYW5kIFJJUAppbiBzdTMwMDBfaTJjX3RyYW5zZmVyLiAg
VGhlIHBhdGggaXMgdGhlIEkyQyBkZXZpY2UgaW9jdGwgcmVhY2hpbmcgdGhlIGRyaXZlcidzCnRy
YW5zZmVyIGNhbGxiYWNrLCB3aXRoIHRoZSBudWxsIGRlcmVmZXJlbmNlIGhhcHBlbmluZyBvbiB0
aGUgdHJhbnNmZXIncyBwcml2YXRlCnN0YXRlLgoKCk9uZSBwb3NzaWJsZSBjYXVzZSBpcyB0aGF0
IHRoZSBkcml2ZXIgcmVnaXN0ZXJzIGl0cyBJMkMgYWRhcHRlciBiZWZvcmUgdGhlCmRldmljZSBz
dGF0ZSBpdCB1c2VzIGluIHRoZSB0cmFuc2ZlciBjYWxsYmFjayBoYXMgYmVlbiBzZXQgdXAsIG9y
IGxlYXZlcyB0aGUKYWRhcHRlciByZWdpc3RlcmVkIGFmdGVyIGEgZmFpbGVkIGluaXRpYWxpemF0
aW9uLCBzbyBhbiBJMkMgdHJhbnNmZXIgY2FuIGFycml2ZQp3aGlsZSB0aGUgcHJpdmF0ZSBzdHJ1
Y3R1cmUgaXMgc3RpbGwgTlVMTC4gIFRoaXMgbG9va3MgbGlrZSBhIGxpZmV0aW1lIG9yCm9yZGVy
aW5nIHByb2JsZW0gYmV0d2VlbiBhZGFwdGVyIHJlZ2lzdHJhdGlvbiBhbmQgZGV2aWNlIHNldHVw
IHJhdGhlciB0aGFuIGEKcHJvYmxlbSB3aXRoIHRoZSBJMkMgbWVzc2FnZSBpdHNlbGYuICBJIGFt
IHJlcG9ydGluZyB0aGUgZmF1bHQgYW5kIHRoZSBwYXRoIGFzCm9ic2VydmVkLgoKClRoaXMgYXBw
ZWFycyB0byBiZSBhIHJlY3VycmVuY2Ugb2YgdGhlIHN5emJvdCBpc3N1ZSB3aG9zZSBleHRlcm5h
bCBpZCBpcwpkOGE3ODA5M2Q3YjBiYjA4MGU2Ny4gIEl0IHJlbWFpbnMgcmVwcm9kdWNpYmxlIG9u
IHY3LjMtcmMxLgoKClJlcHJvZHVjZXI6CgoKc3l6IHJlcHJvZHVjZXI6CnN5el91c2JfY29ubmVj
dCgweDMsIDB4MjQsICYoMHg3ZjAwMDAwMDAwODApPUFOWT1bQEFOWUJMT0I9IjIxMDEwMDAwZGIx
Njg5MjA0MDIwMDBkOTJjYTkwMTAyMDMwMTA5MDIxMjAwMDEwMDAwMDAwMDA5MDQiXSwgMHgwKQpy
MCA9IHN5el9vcGVuX2RldiRJMkMoJigweDdmMDAwMDAwMDA0MCksIDB4MSwgMHgyNjAzKQppb2N0
bCRJMkNfUkRXUihyMCwgMHg3MDcsICYoMHg3ZjAwMDAwMDAxYzApPXsmKDB4N2YwMDAwMDAwMDAw
KT1bezB4MTkwMCwgMHgwLCAweDAsIDB4MH0sIHsweDEsIDB4MCwgMHgwLCAweDB9XSwgMHgyfSkK
Cgpjb25zb2xlIG91dHB1dDrCoGh0dHBzOi8vcGFzdGViaW4uY29tL3Jhdy9qWmtLejNqaQprZXJu
ZWwgY29uZmlnOsKgaHR0cHM6Ly9wYXN0ZWJpbi5jb20vcmF3LzZnZWZYS1ZkCgoKS2VybmVsOgoK
CkhFQUQgY29tbWl0OiBjZWU5Mzk1YWNkODA0M2JlMDY0NGIyNWMzNGJmYTg2NjIzZjJiOTM1Cmdp
dCB0cmVlOiB1cHN0cmVhbSAobGludXguZ2l0KSwgdGVzdGVkIHRocm91Z2ggdGhlIHY3LjMtcmMx
IGFubm90YXRlZCB0YWcgb2JqZWN0CsKgIMKgIMKgIMKgIMKgIMKgZTVlMDQ3MjZjZGQwNDNlMzA5
Njc3MDcxYWIxYjY1YTRiMThmNDIyYgprZXJuZWwgdmVyc2lvbjogNy4zLjAtcmMxICMxIFBSRUVN
UFQoZnVsbCkKdGVzdGVkIHRhZzogdjcuMy1yYzEgKExpbnV4IDcuMy1yYzEsIDIwMjYtMDgtMzAp
CgoKTGV0IG1lIGtub3cgaWYgeW91IG5lZWQgbW9yZSBkZXRhaWxzIG9yIHRlc3RpbmcuCgoKQmVz
dCByZWdhcmRzLApDaGFuZ2ppYW4KCgo=
