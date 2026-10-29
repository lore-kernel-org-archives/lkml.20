Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261976;
	b=GbEaG1kPUt8N4zo9aL0ndUCkpkp5DIkbFjSDChbzhpPZY2ZeGgSNfsPBY7CpgWTrxZul
	 ZUqURisORgOBlI+xKNOweCIgE15KDGl9ZuI3nfQ0paeWSM/3WojN+hO89KFfYStSpdcdc
	 PFuDNnuA30u7/gcTLEldJVgH8TA7mm29S6VbcfhDPHxY3COY9yPwS9CRJtZTbKHsLS4xD
	 VqVxs6ADaT/llozP8ZrKuC46wfNRwBfkxhfoty0OPwkvggKbd3yKZYFST7Ky3KLZXYALQ
	 fd13Bopnd0dpF++xKgQYRoTkGDK3nJLJ345oa5bgr1Tox0hXk1/yZnyMQPC+1dIMxuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261976;
	h=DMARC-Filter:Content-Type:Content-Transfer-Encoding:Message-ID:To:Cc:
	 Subject:X-Priority:X-Mailer:X-Originating-IP:MIME-Version:Received:
	 From:Date:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=N410HI7U1qibEUOQj2NPQwYjw8uFNvgtaX0HyQyiGEg=;
	b=SadIw8OVodPIRNPuGA6W/jQQDm+shMNoRuJZimJeytNpmsqk+vAclz4M99ctWZyBpp3z
	 PTtfUW1PEIaaOF4QJ4PRi7qHF22SxBbGvKlrAg5okPPbBQCGNzh7pCVvFktH1P8c3mNSk
	 hRqS6bVEx8EGupNQ72F2FVnQ7EMsqtqF5+Ng+QqhXitIlpw8GA3823K5kHPeQz1e55Xhb
	 3d2cXkaECJdUk++En9tLQQkbSo97PWUT3CGs9YvBuxN8FAMzEDf9Tn1qVQQUXWvz3i22J
	 El2GqsnMlo40E/rCigabLOXHeuUMQG5PzMyyzbJcyeBkbkQqIwyCgQeGJKbuTDR9D/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hdu.edu.cn;
	spf=pass smtp.mailfrom=hdu.edu.cn;
	dkim=pass header.d=hdu.edu.cn header.i=@hdu.edu.cn header.a=rsa-sha256 header.s=default header.b="X/fq+jut";
	arc=none smtp.remote-ip=154.81.10.224
Received: from mail-m10224.netease.com (mail-m10224.netease.com [154.81.10.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865A8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865A8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hdu.edu.cn header.i=@hdu.edu.cn header.a=rsa-sha256 header.s=default header.b=X/fq+jut
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AD6AfwDkLPJWAKFimg*tgar*.1.1793261964318.Hmail.242270054@hdu.edu.cn>
To: zack.rusin@broadcom.com
Cc: gregkh@linuxfoundation.org, bcm-kernel-feedback-list@broadcom.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	security@kernel.org
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vdm13Z2Z4OiB1bnBpbiBCT3Mgd2l0aG91dCByZXZhbGlkYXRpbmcgcGxhY2VtZW50?=
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
Received: from 242270054@hdu.edu.cn( [218.75.123.175] ) by ajax-webmail ( [127.0.0.1] ) ; Thu, 29 Oct 2026 16:19:24 +0800 (GMT+08:00)
From: =?UTF-8?B?5r2Y54Wc5p2t?= <panyuhang@hdu.edu.cn>
Date: Thu, 29 Oct 2026 16:19:24 +0800 (GMT+08:00)
X-HM-Tid: 0aa186bac03bd45akusy7a6b56a312e12
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEJDVkIaQktCTR9OGh1JSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSkNVTE5VSklIVUpMTllXWRYaDxIVHRRZQVlPS0hVSk
	tJQkNDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=X/fq+jutDqdpd7dNfe1D/0S52k8onamBZvxWSjRQGfDau2XrsnSv3sLIef0RkmQNj+YLylyn5XU+uQpEGtyE++qu5sNFnvXAEGUDpDJR1zKeGur6VWCBVjfueU2xTohd9cfVmrXO/7zvFnzlVGVk8k6QaS4Jn0wMUv4SvAbLGAc=; c=relaxed/relaxed; s=default; d=hdu.edu.cn; v=1;
	bh=N410HI7U1qibEUOQj2NPQwYjw8uFNvgtaX0HyQyiGEg=;
	h=date:mime-version:subject:message-id:from;

ClVucGlubmluZyBhIGJ1ZmZlciBvYmplY3QgZG9lcyBub3QgY2hhbmdlIGl0cyBtZW1vcnkgcGxh
Y2VtZW50LgpQbGFjZW1lbnQgcmV2YWxpZGF0aW9uIGlzIHVubmVjZXNzYXJ5LiBDdXJyZW50bHkK
dm13X2JvX3Bpbl9yZXNlcnZlZCgpIGNhbGxzIHR0bV9ib192YWxpZGF0ZSgpIGZvciBib3RoIHBp
biBhbmQgdW5waW4Kb3BlcmF0aW9ucyBhbmQgdHJlYXRzIGFueSB2YWxpZGF0aW9uIGVycm9yIGFz
IGltcG9zc2libGUgd2l0aCBCVUdfT04oKS4KCkR1cmluZyBQUklNRS9HRU0gY2xlYW51cCwgdm13
X2dlbV9vYmplY3RfdW5waW4oKSBjYWxscwp2bXdfYm9fcGluX3Jlc2VydmVkKHZibywgZmFsc2Up
LiBUaGUgTGludXggNy4zLWJhc2VkIFFFTVUgcmVwcm9kdWNlcgpjb25maXJtZWQgdGhhdCB0dG1f
Ym9fdmFsaWRhdGUoKSByZXR1cm5lZCAtRUlOVkFMLiBUaGUgZm9sbG93aW5nIEJVR19PTigpCmNy
YXNoZWQgdGhlIGtlcm5lbCBkdXJpbmcgcHJvY2VzcyBleGl0LsKgCgpUaGUgcmVsZXZhbnQgcmVw
b3J0IGV4Y2VycHQgaXM6CgrCoCBbwqAgwqA3Mi45MTYxNDddIFtCT19QSU5fVFJBQ0VdIGJlZm9y
ZS12YWxpZGF0ZSBwaW49MCBvbGRfbWVtX3R5cGU9MCB0YXJnZXRfbWVtX3R5cGU9MCBmbGFncz0w
eDEwCsKgIFvCoCDCoDcyLjkxNjIwMV0gW0JPX1BJTl9UUkFDRV0gYWZ0ZXItdmFsaWRhdGUgcmV0
PS0yMiBvbGRfbWVtX3R5cGU9MCBuZXdfbWVtX3R5cGU9MCAuLi4KwqAgW8KgIMKgNzIuOTE4ODQx
XSBrZXJuZWwgQlVHIGF0IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmM6MzQyIQrC
oCBbwqAgwqA3Mi45MTg4OTJdIE9vcHM6IGludmFsaWQgb3Bjb2RlOiAwMDAwIFsjMV0gU01QIE5P
UFRJCsKgIFvCoCDCoDcyLjkzMzI5Ml0gQ1BVOiAxIFVJRDogMCBQSUQ6IDM0NiBDb21tOiByZXBy
b192bXdnZnhfYm8KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBOb3QgdGFpbnRlZCA3LjMuMC1kaXJ0
eSAjMiBQUkVFTVBUKGxhenkpCsKgIFvCoCDCoDcyLjkzNzkxMl0gUklQOiAwMDEwOnZtd19ib19w
aW5fcmVzZXJ2ZWQrMHgzNmQvMHgzODAKwqAgW8KgIMKgNzIuOTQ3MjM1XSBSQlA6IDAwMDAwMDAw
ZmZmZmZmZWEKwqAgW8KgIMKgNzIuOTkwMjU0XSBGaXhpbmcgcmVjdXJzaXZlIGZhdWx0IGJ1dCBy
ZWJvb3QgaXMgbmVlZGVkIQoKVGhlIHJlcHJvZHVjZXIgY3JlYXRlZCBhIGR1bWIgR0VNIGJ1ZmZl
ciwgZXhwb3J0ZWQvaW1wb3J0ZWQgaXRzIFBSSU1FIGZkLApwZXJmb3JtZWQgR0VNIGZsaW5rL29w
ZW4vY2xvc2Ugb3BlcmF0aW9ucywgYW5kIGV4aXRlZC4gRHVyaW5nIGV4aXRfZ3JvdXAoKSwKdGhl
IGNhbGwgcGF0aCB3YXMgdm13X2dlbV9vYmplY3RfdW5waW4oKSAtPiBkcm1fZ2VtX21hcF9kZXRh
Y2goKSAtPgpkbWFfYnVmX2RldGFjaCgpIC0+IGRybV9wcmltZV9nZW1fZGVzdHJveSgpIC0+IGRy
bV9nZW1fc2htZW1fcmVsZWFzZSgpIC0+CnZtd19ib19waW5fcmVzZXJ2ZWQoKS4KClRoZSBmaXgg
c2tpcHMgdHRtX2JvX3ZhbGlkYXRlKCkgd2hlbiB1bnBpbm5pbmcuIFZhbGlkYXRpb24gcmVtYWlu
cyBvbiB0aGUKcGluIHBhdGggYmVmb3JlIHR0bV9ib19waW4oKS4KCkFzc2lzdGVkLWJ5OiBPcGVu
QUkgQ29kZXggKEdQVC01KQpTaWduZWQtb2ZmLWJ5OiBZdWhhbmcgUGFuIDwyNDIyNzAwNTRAaGR1
LmVkdS5jbj4KLS0tCsKgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYyB8IDEwICsr
KysrKy0tLS0KwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jCmluZGV4IDljN2E3M2MuLjE0ZDI4ZTIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYwpAQCAtMzA4LDYgKzMwOCwxMSBAQCB2b2lkIHZt
d19ib19waW5fcmVzZXJ2ZWQoc3RydWN0IHZtd19ibyAqdmJvLCBib29sIHBpbikKwqAgwqAgwqBp
ZiAocGluID09ICEhYm8tPnBpbl9jb3VudCkKwqAgwqAgwqAgwqAgwqByZXR1cm47CsKgCivCoCDC
oCBpZiAoIXBpbikgeworwqAgwqAgwqAgwqAgdHRtX2JvX3VucGluKGJvKTsKK8KgIMKgIMKgIMKg
IHJldHVybjsKK8KgIMKgIH0KKwrCoCDCoCDCoHBsLmZwZm4gPSAwOwrCoCDCoCDCoHBsLmxwZm4g
PSAwOwrCoCDCoCDCoHBsLm1lbV90eXBlID0gYm8tPnJlc291cmNlLT5tZW1fdHlwZTsKQEAgLTMy
MSw4ICszMjYsNSBAQCB2b2lkIHZtd19ib19waW5fcmVzZXJ2ZWQoc3RydWN0IHZtd19ibyAqdmJv
LCBib29sIHBpbikKwqAKwqAgwqAgwqBCVUdfT04ocmV0ICE9IDAgfHwgYm8tPnJlc291cmNlLT5t
ZW1fdHlwZSAhPSBvbGRfbWVtX3R5cGUpOwrCoAotwqAgwqAgaWYgKHBpbikKLcKgIMKgIMKgIMKg
IHR0bV9ib19waW4oYm8pOwotwqAgwqAgZWxzZQotwqAgwqAgwqAgwqAgdHRtX2JvX3VucGluKGJv
KTsKK8KgIMKgIHR0bV9ib19waW4oYm8pOwrCoH0KCi0twqAKMi4zNC4xCgpSZWdhcmRzLApZdWhh
bmcgUGFuCjI0MjI3MDA1NEBoZHUuZWR1LmNu
