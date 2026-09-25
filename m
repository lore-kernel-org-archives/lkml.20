Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8023BCD19
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359090; cv=none; b=BLLJ4ERoBLOVLIxagq6NvOJkK3VJps7fACjjkabBXiBYNTdZwYGW67/OSwoyYnNdIqFHNwcYBGjADjb1ISqCQv0qla54tpNztdXzAEmDs2qTyqsxxi2Zl4degyi92R0kKd9JdFofDzca3VYbz3606wMPaGxK7PDb9hQljvAmPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359090; c=relaxed/simple;
	bh=dy3kayxY7ahbDZ1Ym1aZTstg6nWrbiHbpjNTJMoYFg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTQ79pGKP3FI6GYf0y9JsYdyJ+QCpJmZI1zWZCiO65auZNAeUbdHlgnH13L+C1MJlRzqTV9bCNIXR1K5ls/QD8gwEk99+xps6saAgk2FheDSqreW6veV8ANdQpbiPFJIlSflNSoaB4dO65dXQ+cJNYn5YWPKIYrPtYNxqyV23HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnRfbVjM; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnRfbVjM"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-805440319deso742805a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359088; x=1790963888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xplQ4+Yy+zxL1uKzZFCMDOeucDaFR1YF5s1Y1HL0co4=;
        b=KnRfbVjMcq9tDGSwxZgARgnE02MNZOSKJnxUWT3m5/9H3Q8ylNMZzcJbL5EwWJ+jcv
         MLAMlt0C3rzg87/1tZQB4gUB+Mn+bYDMBxGtT4RfknhE3x0HjTNEuiACD5/imCgWJdTJ
         eCqTK+l18MhABBCazHyf+/fc9yTg0Gx26XUUx0GqE1GdwflGbsAKI14MRyFhnoTAdSt3
         RirupmNFzjXvu3dW+zVIGegj+DiDuTWsDNelNYDZ61LP6cgfpyJxFtYq6ZKNs0zf/cyU
         jZwwP+COe6xoHXXSW0Jf/WkE8IkQGkCsLEk3ULWsn0EpiguHS5GgCdDvZAOyCEPzgvan
         S9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359088; x=1790963888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xplQ4+Yy+zxL1uKzZFCMDOeucDaFR1YF5s1Y1HL0co4=;
        b=FbFZitb4YgJ9TXz6mj+84Ztc87aroj+eJ0puVkPNVAC25yL6rYDIrd5BWyFVXLW/d1
         tCd4kKm8ug6BAVo+msIRr2muYTp5YWyyXcPVvQZ78fVBLxjQDrPskrZyHqnmtCmjzG0X
         MacwMB5PKArRd6eP5fOC8s2FczV9WjAo1OLjoCMV8xDBfihsRKnaxrmjZFQlwwzvZZ00
         7Tux7DTumcoOW8P4cidUYDZJHR0sKQZIOV0laVvgsBn3z8Cmm7jqr26RhXf6DF5GqPlK
         /MVfHMBzT7tx0Kyej6Rx5qIP82uIT+4SvNoliQiYeQbU+LlLeutje7OQCo2wD2m6csU3
         oduQ==
X-Forwarded-Encrypted: i=1; AKwUvBzthLbvOU2UhbokKzkz5ZxPZTntascecIi5vV2RI0+fXj5mMn4uSTrdjpwzHAGNih6MIEYN2wFE/cjcIg0=@vger.kernel.org
X-Gm-Message-State: AFuF++kSeLUg8SCx1lczrNDlA2UYBBWrVYd+GXY49W4aY/uHPZfDD6Ug
	sQr7zNpSuLE81hXq1w+g6sMW01l+aAmAJow1SQhSb155aAVT6+OAg2t2++o+D3EOmI8=
X-Gm-Gg: AYBFou1vmTHMu89JBgItt9bdDvzLx0RP48zElS5+KYKcPzcLsljVE7ecFRIFyI5a3cw
	YvvGdqcnCTl9Fgt1rR2uZIVtFBdKEObVs3CsqgkD7bmxO601ig882AeWfzwFXQi0GSBKcrTFlmh
	k5dQrMmdChZiIwh662/cN8IbqvWzsqUaVS8P+iAruMJKY6b3wvoUDySnuYusb18k32dZGZTRTPH
	oGpkDiuPCQt67t6h37TAlM8+YZEQyCFxHZAZlFM8HMmIVPQe+JMtjruLcnVLx2OBULMOhSsNud4
	txoXmF3RheBEWtZW8RMBa80GJO3IUTdO/xNfT+JwMTPj6Bizx86LJ1nDvwZr5ivAWbNuJoXixB+
	UGCuDl8iYErSFHE7nyIF5XlKJJCkQxMFUrHT3Q/vgQawshZjlyvLcui6uvaIZ6rwSnHTsM/2t9O
	rZct4c8fA1cKgAgezIxtLcXxE1FOzScXIjSA3KRpOJrgQqGR/oCFylFOp+9BqWbv70keM+FkwHb
	KM=
X-Received: by 2002:a05:6830:2992:b0:80c:4d85:9aae with SMTP id 46e09a7af769-81784686d37mr7362881a34.15.1790359088158;
        Fri, 25 Sep 2026 10:58:08 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e92c1f66sm2744647a34.19.2026.09.25.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:58:07 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <rishik.yechuri.code@gmail.com>,
	Gabriel Windlin <gawindlin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses around prframe->u.hdr.list
Date: Fri, 25 Sep 2026 12:56:26 -0500
Message-ID: <20260925175627.227374-1-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed redundant outer parentheses around prframe->u.hdr.list in a call
to list_del_init()

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3c82012fd..71362a4ec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1796,7 +1796,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
-	list_del_init(&(prframe->u.hdr.list));
+	list_del_init(&prframe->u.hdr.list);
 
 	list_add_tail(&(prframe->u.hdr.list), plist);
 
-- 
2.43.0

