Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7979C4AF678
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442211; cv=none; b=WKYAqVGFc8vsWIB385jy7UQ0JVp9EWLN3lGHwZ/3sRmaReYvIIx6wBkOjrrB5swkxjBzkhkNZr49TiHYfJfZx1eMSN10TXI2H3R5jkI8eijFe74M/3MFOBGBygE/dlhJPpf1014g1zc/7lqeGis7PRJd8zjldl83dIwrRyiv3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442211; c=relaxed/simple;
	bh=AmGHWtrC5H4xJECjnfDRuZu9bz3fUrw6VQMjZ6QD6kg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ATx1Getvt8BVdJgigkzD//N6kwDDavpRvP7Da6NNwp+EKyWgE3tIteBrJb0l4ThEHreNYfDUtLeXZHzFTHKUPaCzQHuNtOplA8DAiGi5jPKya+K6r0qVmYGfLnTDbSg40ONC3zcv6Nz794FX+fqnceq9hE7yJYs/T+/48ymDYfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com; spf=pass smtp.mailfrom=ugreen.com; dkim=pass (1024-bit key) header.d=ugreen.com header.i=@ugreen.com header.b=WQYQxHbr; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ugreen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ugreen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ugreen.com header.i=@ugreen.com header.b="WQYQxHbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ugreen.com;
	s=pkvm2402; t=1788442171;
	bh=R43W7MuJGL1NXYGp7NV6Dw632Mrx2QKuL9HqsHZp3Es=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=WQYQxHbrMPBbjpSqJ932h8fDWbZRiW1lf23Ea5OH68gWAMponvgbKuUN8PH4dSaeV
	 quLI+C2+V+yO09vYFOxEkAjXj/B5iYXHlOyNZ+59M0Vg0jtnMsDqHCUTEHVo3atU1m
	 folxdYOaRSdd/3fcv92QYe3kWfVAUYlN4TJGONAY=
X-QQ-mid: esmtpgz14t1788442167ta2ee8a81
X-QQ-Originating-IP: OByhbH33HbXY2YdtrZ/GLppTBNZM0NreN2O1cMQ1gOM=
Received: from debian12.. ( [27.46.123.65])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 21:29:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1819407133002552589
EX-QQ-RecipientCnt: 3
From: Haowen Bai <calvin.bai@ugreen.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Haowen Bai <calvin.bai@ugreen.com>
Subject: [PATCH] mailmap: Update Haowen Bai's email address
Date: Thu,  3 Sep 2026 21:28:54 +0800
Message-Id: <20260903132854.1930923-1-calvin.bai@ugreen.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:ugreen.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MINmIRMoInNGqZ6oomR3RNvov+IQWDRAQXOjkFFBMtM+xmtBJuHzLskn
	E224psOyRH97QGHbhhHuMkon2wXdVFbkUfxhG9k5vLPxu3bJFCQPjFDgEkkuQL1TY9OKbaq
	QAl5vS+3INED6DJeQLO0YPl91OGyiJrxev0HLE0bxOsCQkTltybMeu9CC5Je2SKMM8t9nAz
	FcB6jK4jHQFI8KjKpeKlLX58rQio3CHJ4gKgc30cmERZaV6aW4hm/YU403CuAjf/WJckbak
	Kgq2yLAP+IavCGKfdJBnEQY1MkuPXRUsBgHjhDnxAIP9tZXOPK0b0bMt9KT/FYws2H1dTTi
	bb9a3FeVMVXHEfNXbo2HC1prMLfAQH0GzKV5AXV6pf1WxV1okit/nzxgk0rH9FDRm5XyskX
	RVwQIKZ63Z9YCvAAQp/6yHpvOek3NgyP51hJuMbnNVJlhi7lRzXB1J9qXfQE4+XfmagArEe
	VfgJ0czvQidcnzxoO7509LEFOr+sXAHPmhpyVVDYrbMNloZ8lfpsWHitElt0Sa8fWGmrBg2
	N83gBLvePQpW00Ry1bVqMA+Z5pdoZKeSpc1N7lyjvLGZESjBIzyXxzWpdMaf+F/eUrOqb6x
	Gcb2Gehbodsce8WCRaFuIwq7JW7GQpPDi+prqRTxwB7b5i39hEn1JLn1TEv8rqTe/JOXyDA
	zVLFh7D9Q9C7VdJQSMyLtFjgj8YMarg7+dmkVw2V54hv18pwBKTnWuUTM8ujy53JN0BZ46x
	NrErvEZmDbY7avJcvZ6B8bIkQjoUuJFnZupvN9HZ7nm2T2errOkaVAhEd2/EY/YKD5cLW/c
	v+vo74WS+5n5+YqaVqW+0pI+BlhISbGEZMMV9zYt3nCIRxXEKvv9wBORiHPg+MlMs8T9cT9
	5JCDwP4m/UHtwG4RwZqq/C+bW1tmfak3213B+T82oh904ACkvZmfEW8EjR3UE6iAvn7q5+Q
	d7F9cmxXKNO4dpFA3oB8hVdVoYvA/cGY8midw3Mv4tuc2InJLzwFLKypLerSDBbeGN8Giw2
	Fe0jYw+9HioScdmMv6
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Map Haowen Bai's former Meizu and current Ugreen addresses to
baihaowen88@gmail.com as the canonical public address.

Signed-off-by: Haowen Bai <calvin.bai@ugreen.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 6803f3bd2865..2199ce4e220a 100644
--- a/.mailmap
+++ b/.mailmap
@@ -352,6 +352,8 @@ Hans Verkuil <hverkuil@kernel.org> <hverkuil-cisco@xs4all.nl>
 Hans Verkuil <hverkuil@kernel.org> <hansverk@cisco.com>
 Hans Verkuil <hverkuil@kernel.org> <hans.verkuil@cisco.com>
 Hao Ge <hao.ge@linux.dev> <gehao@kylinos.cn>
+Haowen Bai <baihaowen88@gmail.com> <baihaowen@meizu.com>
+Haowen Bai <baihaowen88@gmail.com> <calvin.bai@ugreen.com>
 Harry Yoo <harry.yoo@oracle.com> <42.hyeyoo@gmail.com>
 Harry Yoo <harry@kernel.org> <harry.yoo@oracle.com>
 Heiko Carstens <hca@linux.ibm.com> <h.carstens@de.ibm.com>
-- 
2.39.5

