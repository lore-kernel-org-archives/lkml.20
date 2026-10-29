Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262805;
	b=hFcdXJwIR25wya8p3k180QLAr2q5/4s5rNtA0ZnNMo/XycR0yCJeJOvBjUwKeYL9qbTQ
	 yZ1U+RiB/K3ZU8A9NrzrudyATsHL2ByPLt4YLx+Negv7efCoqwZVCTqa7KzRslEathOXi
	 TuAyXkAQvgYhdwMiA1c6dVN4ykt3vDCoTcw250SuCctaPPIR6o+oWrfNfthI2SouIPfTc
	 P2pHznecS0mv5RgZsICS2aoleoXy7m2ccw6FYrDBdV3s+Eki9Q8/ApnX6XFqxXTgtC3uV
	 O286gFd+eIs+pr0mlPKrRZgXPtYY77ZBM+abotaZjMr3SmFFAs/Y3YUqnRxrBhObbsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262805;
	h=DMARC-Filter:Content-Type:Content-Transfer-Encoding:Message-ID:To:Cc:
	 Subject:X-Priority:X-Mailer:X-Originating-IP:MIME-Version:Received:
	 From:Date:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ugUIMCjMxxqgsLH2sZshzVPxfok+Qgx/R9/1tAMlkvE=;
	b=dXETjKNL6SU89nRhXhaMOOYSO7WaXvFRzww0mZF3Eofkp7/jG9nDYEwEDf6WC4zENyT7
	 GuyLVP/icZ/ioyUtbAr0Vj5Scd8h0/nP6c6Zer0e/RFknHiXBAeEgFLgeiK6D5lZXZUJs
	 ZIZa6by/yltAti3m5WX7VgljRDVERqrpDQ1T2cqXDNLLlR8CIAtV8SGTQL/+3R3GwGfD1
	 SI4Suh8NzpC8LhzJCbTi33xTyoD+oV8vL9PRgr0GErB9fskuuZ0FNww4UgegM4ExPelco
	 Tgye+4WBCWI289jkIhjKAw2T9Dgd+RQZT0w0Hpg9ckHkQXS7YrAcb+BqeyEnVpP0q2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hdu.edu.cn;
	spf=pass smtp.mailfrom=hdu.edu.cn;
	dkim=pass header.d=hdu.edu.cn header.i=@hdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gNB2O+kf;
	arc=none smtp.remote-ip=103.209.128.52
Received: from mail-m12852.netease.com (mail-m12852.netease.com [103.209.128.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F0E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F0E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hdu.edu.cn header.i=@hdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gNB2O+kf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ACEAWQCGLEhWF5vMItAIpqoW.1.1793262795047.Hmail.242270054@hdu.edu.cn>
To: zack.rusin@broadcom.com
Cc: gregkh@linuxfoundation.org, bcm-kernel-feedback-list@broadcom.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	security@kernel.org
Subject: =?UTF-8?B?cmVqZWN0IFBSSU1FIGV4cG9ydCB3aXRob3V0IFRUTSBiYWNraW5n?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 242270054@hdu.edu.cn( [218.75.123.175] ) by ajax-webmail ( [127.0.0.1] ) ; Thu, 29 Oct 2026 16:33:15 +0800 (GMT+08:00)
From: =?UTF-8?B?5r2Y54Wc5p2t?= <panyuhang@hdu.edu.cn>
Date: Thu, 29 Oct 2026 16:33:15 +0800 (GMT+08:00)
X-HM-Tid: 0aa186cab927d45akusy85d7ca4c12f59
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSkgaVkIeGk8YS0xJQ04fSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVTE5VSklIVUpMTllXWRYaDxIVHRRZQVlPS0hVSk
	tJQkNDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=gNB2O+kfFOfjbORRt2JXDQSLKH++NkmqYSe2MK7LgW3K+hN65Jn3dK/hKCTx2jsE2sj5qnqrOGPrPYi1O2oOZneK9ZyP1q1blFKGVfWleC6xcbhw+AnZdrgAEglPfNqLRP3R6n0/kt2aiGdbu3pGhdHuCkJKL6VA5sh4tek+81M=; c=relaxed/relaxed; s=default; d=hdu.edu.cn; v=1;
	bh=ugUIMCjMxxqgsLH2sZshzVPxfok+Qgx/R9/1tAMlkvE=;
	h=date:mime-version:subject:message-id:from;

SGVsbG8sCgpHUFQtNSBhc3Npc3RlZCB3aXRoIHRoZSBpbml0aWFsIGFuYWx5c2lzIGFuZCBkcmFm
dGluZyB0aGUgcHJvcG9zZWQgZml4LiBJIGFtCnJlc3BvbnNpYmxlIGZvciB0aGlzIHJlcG9ydCBh
bmQgcGF0Y2guCgpXaGlsZSBmdXp6aW5nIHRoZSB2bXdnZnggUFJJTUUgaW1wb3J0IHBhdGgsIEkg
b2JzZXJ2ZWQgYSBrZXJuZWwgTlVMTCBwb2ludGVyCmRlcmVmZXJlbmNlIGluIHZtd19nZW1fb2Jq
ZWN0X2dldF9zZ190YWJsZSgpLiBUaGUgdXNlcnNwYWNlIG9wZXJhdGlvbiB3YXMKRFJNX0lPQ1RM
X1BSSU1FX0ZEX1RPX0hBTkRMRS4gVGhlIGNhbGwgcGF0aCB3YXM6CgogIF9feDY0X3N5c19pb2N0
bCgpCiAgICAtPiB2bXdfdW5sb2NrZWRfaW9jdGwoKQogICAgLT4gdm13X2dlbmVyaWNfaW9jdGwo
KQogICAgLT4gZHJtX2lvY3RsKCkKICAgIC0+IGRybV9wcmltZV9mZF90b19oYW5kbGVfaW9jdGwo
KQogICAgLT4gdm13X3ByaW1lX2ZkX3RvX2hhbmRsZSgpCiAgICAtPiBkcm1fZ2VtX3ByaW1lX2Zk
X3RvX2hhbmRsZSgpCiAgICAtPiBkcm1fZ2VtX3ByaW1lX2ltcG9ydF9kZXYoKQogICAgLT4gZG1h
X2J1Zl9tYXBfYXR0YWNobWVudCgpCiAgICAtPiBkcm1fZ2VtX21hcF9kbWFfYnVmKCkKICAgIC0+
IHZtd19nZW1fb2JqZWN0X2dldF9zZ190YWJsZSgpCgpUaGUgdm13Z2Z4IGNhbGxiYWNrIG9idGFp
bnMgdGhlIFRUTSBidWZmZXIgb2JqZWN0IGFuZCB1c2VzIGJvLT50dG0gYXMgdGhlCmVtYmVkZGVk
IGRtYV90dG0gbWVtYmVyIG9mIHN0cnVjdCB2bXdfdHRtX3R0LiBJbiB0aGUgY3Jhc2hpbmcgcGF0
aCwgYm8tPnR0bQp3YXMgTlVMTC4gY29udGFpbmVyX29mKCkgY29uc2VxdWVudGx5IHByb2R1Y2Vk
IGEgTlVMTC1iYXNlZCB2bXdfdHRtX3R0CnBvaW50ZXIsIGFuZCByZWFkaW5nIHZtd190dC0+dnNn
dC5zZ3QgZmF1bHRlZCBhdCBvZmZzZXQgMHg4ODoKCiAgQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDg4CiAgUklQOiAwMDEwOnZtd19n
ZW1fb2JqZWN0X2dldF9zZ190YWJsZSsweDJmLzB4YTAKICBSQlA6IDAwMDAwMDAwMDAwMDAwMDAK
ICBDUjI6IDAwMDAwMDAwMDAwMDAwODgKClRoZSBmYXVsdGluZyBpbnN0cnVjdGlvbiByZWFkcyBm
cm9tIFtSQlAgKyAweDg4XTsgd2l0aCBSQlAgZXF1YWwgdG8gemVybywKdGhpcyBtYXRjaGVzIHRo
ZSByZXBvcnRlZCBhZGRyZXNzLiBUaGUgY2FsbGJhY2sgcmVxdWlyZXMgYSB2bXdnZnggVFRNCnRy
YW5zbGF0aW9uIHRhYmxlLCBzbyBpdCBtdXN0IHJlamVjdCBhbiBvYmplY3Qgd2l0aG91dCBiby0+
dHRtIGJlZm9yZQpjb250YWluZXJfb2YoKSBhbmQgbWVtYmVyIGFjY2Vzcy4gVGhpcyBwYXRjaCBy
ZXR1cm5zIC1FSU5WQUwgaW4gdGhhdCBjYXNlLgoKVGhlIHBhdGNoIGJlbG93IGlzIGFnYWluc3Qg
dGhlIExpbnV4IDcuMyBzb3VyY2UgdHJlZTsgaXQKYXBwbGllcyBjbGVhbmx5IGFuZCBwYXNzZXMg
Y2hlY2twYXRjaC5wbCAtLXN0cmljdC4KCkFzc2lzdGVkLWJ5OiBPcGVuQUkgQ29kZXggKEdQVC01
KQpTaWduZWQtb2ZmLWJ5OiBZdWhhbmcgUGFuIDwyNDIyNzAwNTRAaGR1LmVkdS5jbj4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nZW0uYyB8IDggKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9nZW0uYwppbmRleCAzOWY4YzQ2Li5kZDFlNmI3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9nZW0uYwpAQCAtNzAsOCArNzAsMTIgQEAgc3RhdGljIHZvaWQgdm13X2dlbV9vYmpl
Y3RfdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiBzdGF0aWMgc3RydWN0IHNnX3Rh
YmxlICp2bXdfZ2VtX29iamVjdF9nZXRfc2dfdGFibGUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmopCiB7CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IGRybV9nZW1fdHRtX29mX2dl
bShvYmopOwotCXN0cnVjdCB2bXdfdHRtX3R0ICp2bXdfdHQgPQotCQljb250YWluZXJfb2YoYm8t
PnR0bSwgc3RydWN0IHZtd190dG1fdHQsIGRtYV90dG0pOworCXN0cnVjdCB2bXdfdHRtX3R0ICp2
bXdfdHQ7CisKKwlpZiAodW5saWtlbHkoIWJvLT50dG0pKQorCQlyZXR1cm4gRVJSX1BUUigtRUlO
VkFMKTsKKworCXZtd190dCA9IGNvbnRhaW5lcl9vZihiby0+dHRtLCBzdHJ1Y3Qgdm13X3R0bV90
dCwgZG1hX3R0bSk7CiAKIAlpZiAodm13X3R0LT52c2d0LnNndCkKIAkJcmV0dXJuIHZtd190dC0+
dnNndC5zZ3Q7Ci0tIAoyLjM0LjEKClJlZ2FyZHMsCll1aGFuZyBQYW4KMjQyMjcwMDU0QGhkdS5l
ZHUuY24K
