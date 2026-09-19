Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D331F986
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789852018; cv=none; b=UU48iRjfi9BsiLBsrWHbyNjYt4WGcpVFpSRpBkRe9uggOBxoD88oZ/4rVSQApYWURlq735uUDRFzq2e835ZegWynDqhGAMGIn+YRsObhFv+ii91eW27LRD1qMEuyCcXIWIGy9Ce7H8dZajHGUfaZsnS6rChNsx79aYsHsbAi2Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789852018; c=relaxed/simple;
	bh=h4gCh7+gf9dBQ20pLGZSlVWw1BBURRtxvsR22Ob9Z+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RpQoHPomAOAU0FqE/v7NSWb1wWxerrckqwNXnGcvbiD2hwhTWrmLaXlCVSETBR3FOsU0EW6BkeOMIlhgbeJGqA7MsHrJ4yGDgIbh3D1istH4vdDYCGHnK6nOSlHh7pa1wVdMHctlkSRfV3Nao+QXAmIv55A2k0GHyLIX7C+ruZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=xiSC+rVv; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="xiSC+rVv"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.112.72.190])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 8C5E61203BC;
	Sat, 19 Sep 2026 18:06:51 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1789852012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V288YaWq3/cQhnXnpHTQyeEcPrLIENu6Ur1t4kgf8Os=;
	b=xiSC+rVvI5eBn7CCofhK17ElwIUpaxgmqLx8UfDhFvuxrW+DIaJf2oN4zQvmZQn47kIYT4
	k0DHRfrOaM2P26nNDTedDT7dmv5wJkT5GOkMv8i3VwwL+rdKWhs4xfI5eogELUl3c4GRmU
	4WMnX5d4sABmEReUPJDfTxibOLGzSNPa3WSJ9RG1TRlYOeUNPC+psxkOi9xI9if5yK9amY
	/cDThqUCOKilP6leGYjCYVdlZp6nz9fSUILtqZZE+IaI5JnPvmydlteNzmFfk2cKaNHNsD
	JiPCHu5SfY1IL82lBmnblWoBRSWTfiWwoVKsA7QOpsrhGxJrCbpweMWnAl5LGA==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Subject: [PATCH v2] staging: rtl8723bs: return bool from check_pending_xmitbuf
Date: Sat, 19 Sep 2026 18:06:44 -0300
Message-ID: <20260919210645.25796-1-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_pending_xmitbuf() returns only true or false. Use bool as its
return type to accurately describe the function's behavior.

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
Changes in v2:
- Add missing "staging: " prefix to commit message

 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 95350fd6a94fc..634320e53aabe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2469,10 +2469,10 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 	return pxmitbuf;
 }
 
-signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
+bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
 {
 	struct __queue *pqueue;
-	signed int	ret = false;
+	bool ret = false;
 
 	pqueue = &pxmitpriv->pending_xmitbuf_queue;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 873807fcd0dd0..7d429300323f9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -456,7 +456,7 @@ void enqueue_pending_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmit
 void enqueue_pending_xmitbuf_to_head(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 struct xmit_buf *dequeue_pending_xmitbuf(struct xmit_priv *pxmitpriv);
 struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpriv);
-signed int	check_pending_xmitbuf(struct xmit_priv *pxmitpriv);
+bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv);
 int	rtw_xmit_thread(void *context);
 
 u32 rtw_get_ff_hwaddr(struct xmit_frame	*pxmitframe);
-- 
2.43.0

