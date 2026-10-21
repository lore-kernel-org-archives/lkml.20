Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554355;
	b=HL6/32KHywkm2t2ndHhESr/3GS7E/CXPrj2EPPE351n8x650h4o7aC/0WsMD6Zcr1Vet
	 kMnPv6G9s1WvR/QnhaAT5xI9sNJHH5F322PAK0jxHj9gx+VpsvLoIUJgiRWIeAWLgPPny
	 JXTwHvQg/NArbvbjIszm6fRJqemMIxxsT1X/hWVPZ69mNKKdQKLsLLYlUB6sxvvrfVt+U
	 UEJzURaT7q/rcpkQgvnloMDedv4T3K8aaqzjlKfsW/qCjrEEL+KG3EhtS6nB0y6azinHv
	 1rOgEg9s8sNvtOQBW9R//bqJHhCEqKfqYUnWRpioKtrQzHsHZvlIxX0Rnww6Pwnwr+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554355;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pvmV7Nb3hIaOqh9siBveei2J+IXn32DOfBJ3bIJBeT4=;
	b=gGlDbhMRajmtlPimpVTJq28oCvym71Zc9N+biqybJiNh4x/lNZnHC6xcSU/Fq7kfZ6B3
	 4NQ4idbaFdX4XxhaV3Ik0u77OgHANHaeG+OK9Xd6sjyrcJQsUJwTuHmP2Q0a8POcD9/3H
	 Sj9wFyJ2Asb3FDidiwwwTYHgD1MxPLrsJt7rSRCSMpZ6DBHDy5tEP2IVcHqI39tg+iEB2
	 K0gHf0XZd7tiuYp0HS58neovO1n1jbahiQ53WLs1Uap/VAgPWjHidtDD2ndOwo/qYfAHL
	 putOzSu+VqIVlZI2Z0PPJFkcA2kJUTB1TVz2X1P4kakaYJMf24vgGytNPQovlpjs8tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=YauFBGyZ;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4E5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=YauFBGyZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792554349; bh=pvmV7Nb3hIaOqh9siBveei2J+IXn32DOfBJ3bIJBeT4=;
	h=From:To:Cc:Subject:Date;
	b=YauFBGyZ4PlnhOlb6g5n7gTrkbYk4MvPXuGcc1HC2nYBWvFXG5cJz9GzCQufFoWp2
	 7A/e2pS7Mk+wQP7ILOmf/dPQ6Jww+Z7TsnlKoWl7aWuTz3DcnENXSEFiwFuV2ityO5
	 QO7WcKEfBCb0oSCHCPlGqXV265tZ+JLNRUCcyR0g=
Received: from Liujunyuan.. ([183.95.73.181])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id B67BB832; Wed, 21 Oct 2026 11:45:39 +0800
X-QQ-mid: xmsmtpt1792554339tdm1xcpfz
Message-ID: <tencent_FE0C25ACDF20A06CBFD0651E7C4ECD7E5009@qq.com>
X-QQ-XMAILINFO: MFkgsonL4eTuewEom+dEv5zIIb5SSGFcmfTxZjVvVx4fnnbLzdlmWEyi7ID2fL
	 CG9PV+6zVkHvxk2LGIyOUP9OeoKEEONu2HqWHYttGkiR/LD2IpspyUytET+eBv6hxFgedE74yxQl
	 2CiNTk2ITAMDo+1zUjNsMtkeHM8r0vmi58L17ap4//OLGw5q5o2s49iDE80C8lbF/ErNJlVKgvfm
	 AZwf+KZE9fgdM41qK5lu1fy4nm4uSD7MssFHTZvuJuX3xVcyHzt1yX5OPX5ncq+Sb591tz9opbmp
	 YtOtgJSCO1b2xlqSI3pST+JybU6tlSRrH8W3Xh4NssDNrZrihF85tsQD510u0v29WzEPBz3C0V/h
	 V+X8j3PJIhwe6LSFnIHCGIHkE0W5qJvPHy4k9v9+KvZ6zz/xGlXMTwWIf4CPPb+13ei5z5Sq4HDS
	 6MRW6PjbO/eHuXmOPVub7pWOMjdqWec9ceDpszcDY/gnLsKwbFRDmrhPGcj3Q8Ds8gKOj3fn8lzu
	 dmoJR7Fp4oMY5FFkt0LRXoP15Ck3nJb/2505X6M+ovWXKss8ztwfpMggThPNYGhWDyYPqyApSg4O
	 gVAT+x5wVYkw36S4K4uqeW2dDMX8CGhou5H4rnFEk7NEgY+V/weZNSUGk4FBqFgbxi1TugzSBXzp
	 F84hqhayfIE3X9BGvSEbC0kkBW5nf5DSoonLjQiay2pi+ctn7PMokLlL2XRyiw5C76cv/rPKkLf5
	 bBiZvqniMpc0sYSMqe8vKw+9XVFiyLo2dFapEwDQHI1orliMX9otJdBOFpXeVFkHXEFpOzkO8eQu
	 iCTbMRUn/CvdB7Nv3sq8aZObWEmTWwaObXws+quTLCqID4QMI9thyc1V0P+9z80N3x6uPtx+w3cH
	 nmHWssGN1y6coyYt0lGxqfpVL3RKn2W4itrwpdAEpAuRUM9DqE6R8QyQ7XmI4wmBoyz9G5sIdC8Q
	 k7xJQsZuVHLbxK7hXuVIEJBZn9Cp/YRpPm1k14XOszJaXaiI23vHp1qGa+4oEK0tB6Rz7Oa/1+j7
	 Ng/r+xqcaeClotIdQcgpvuagfV6is=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: LiuJunyuan <2058432396@qq.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	LiuJunyuan <2058432396@qq.com>
Subject: [PATCH] staging: vme_user: handle zero image size in read/write
Date: Wed, 21 Oct 2026 11:41:38 +0800
X-OQ-MSGID: <20261021034138.14525-1-2058432396@qq.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vme_get_size() can return zero for an unallocated image. The existing
image_size - 1 checks underflow in that case and can allow an invalid
position to proceed, wrapping the subsequent count calculation. Check
image_size and *ppos directly instead.

Signed-off-by: LiuJunyuan <2058432396@qq.com>
---
 drivers/staging/vme_user/vme_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index a472a38ef613..58566c01003a 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -213,7 +213,7 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
 	image_size = vme_get_size(image[minor].resource);
 
 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if (*ppos < 0 || image_size == 0 || *ppos >= image_size) {
 		mutex_unlock(&image[minor].mutex);
 		return 0;
 	}
@@ -255,7 +255,7 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
 	image_size = vme_get_size(image[minor].resource);
 
 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if (*ppos < 0 || image_size == 0 || *ppos >= image_size) {
 		mutex_unlock(&image[minor].mutex);
 		return 0;
 	}
-- 
2.43.0

