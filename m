Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA245505D4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956457; cv=none; b=m+g8VkhdauxA5zTehB6+7rnZAMvlaihnJffJ7omZqbxZB6xW0pr9w4FRJPJRyjdiLcnu+hoH6HCNV7nG6CIfXkrHOpbJDvqOB+aze+vuEp22eR7SEePsnC/C1AyYpwPfwlmSocOptJkxTkJHcrmgyWqovVWB/zK2tIqoR9SZw1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956457; c=relaxed/simple;
	bh=vd+z64yYMDOdR0OIYTpsYsjv0KiOe8KWY0gyD1raOhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jrpsFjpZScAaG2gKhW78J4hyCNNuvNFdOl7ybJ4vR5wPSUSsv1mmNYNcHHd+Lok3R8T5iEZU0+Nnbmf9WJuItOgVEa053QO6FHBecYF7ycLYvrfN8VcxPhEWbnLCH7dBQ358CVzWCp8RdVMPbz/gztTToK+X+6I/zVd9tmBOOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqUNk0sm; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqUNk0sm"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so1433585e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788956454; x=1789561254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mWIg2sOePVQ5eOCne4aTRq59EeTij+H6YHGybcSN6I=;
        b=fqUNk0smU8HKyVJpSegJfNWjhb/PWPnm3WTaEz6rPZaea2cKe/ShfoR3jRD1aW1VOg
         JoB5QPqgZQ1SkT4wZtnzGtuyXahozWcC+cASat0oyMyIgPFflfVELJ4MnHbIuMQmYiIE
         Sql75o0kl8QrRji9ZP5g3UW2FqXG946JexB6pvyGZUiVcJqelSg9JWq/j2ACELZU+Qf+
         VFh0QZ8oLphsi/xf9FYAEusQfU5E59EdqENCIoHnoZLfc69STWmMHbLzaIVXTKxEbse7
         WeBXuLJnPOw/OSfwIsgjNeMNi9QagotdxAhPfvV7/4BdKMAKKQPHDLZgWzT3NSeldfdW
         mfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956454; x=1789561254;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+mWIg2sOePVQ5eOCne4aTRq59EeTij+H6YHGybcSN6I=;
        b=MDgYdM9IrbvKAYHr2lgxl1GkiXnEp8xexyMw2gMkhaM9tWbnyRwoMHQxT10dclQqx+
         0ZBv/R6uS1UPBGcHbchC7/ZWRJuwQLY2Hesc333IN2rUpiGiYM9BRmsWUnFL6V7uc0Tk
         m+b6BK3nPde7SqA6QwrF12UIeMWgSA/8cyQInCtwk263LYyTOG+NPIxva4lLzefh2cx4
         SoHRra9YeJrIIaehCj75+zr5Yy5bj08f3/tyS0IMZQ4bpI97Iw5cyzrpQkNtyyZRnqFs
         gHkqBsDyFWdqhvn9rOdsvzS8Nnax+wmMex/+ydhVr2eBIeBoA8nmXi1wI9VOs6WTHHG2
         yIIQ==
X-Forwarded-Encrypted: i=1; AKwUvByPQK3nxVfQO8I5ZaWtpuZdlpipQded5bX8RAQ6PbKNrf76E4AJqq9mdaG/lOrHKDnD9oxL4skusozGP+o=@vger.kernel.org
X-Gm-Message-State: AFuF++lvKkICqxY8MFWNR/YusT78xmLmePl5a93oh/KtlVmnVcvONOjQ
	qZRN5Z1DE9pnapwVdb2qdf3k2Ej/RMMmU6dQ3igMqMSNFkz7NaQ/YeqD
X-Gm-Gg: AYBFou1TCwbTf3+hnbNfnFMS8QbsfUpheplz7tJv2zi3YamULzIw9AR7hjytaljdfsc
	taI1B+DVoD3+Tg9/cR7hiPZ2C8Q4ZcsYf2n+TvyyAw5RMIy7bFJ4wYf8aI2xgaPd7tdAjCKkju4
	bS5Eh49ZjvUpulkZ0Ji0Ji+P2R3UqvOSXXCiTOr/GT7eIfPuOpWT5i5AIsekPI/55QKd1Yz///o
	jYafXsIXbc5oRAKYGGMqCfLRd6AhSHM1p+AeHAK81pDphKKyvgUZkrntYYM333lO0A/TgwAABPg
	+5j6gW4i5krWwIFgmdKnI2KuWMcuG44sP1ZHTwjmZxgMYslzVFTO+jjZCFIDoSu7ozyCm3dswxQ
	L3dtxTSawBrNIgJwrC+RUtIShxx3fK5z1chrPzVa4XrfOSxn2ZbF+TO54iKq6z98Vrwf233giIj
	LA4NfPSxs8zcptPDeGtHa6rVdMuwNmJ6Uw1HsETJ6E+usbkOAkWTdIMMosW006jMGgmPnx
X-Received: by 2002:a05:600c:4fce:b0:49d:24fa:8fc9 with SMTP id 5b1f17b1804b1-49d258cda59mr7298055e9.5.1788956454095;
        Wed, 09 Sep 2026 05:20:54 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm49340906f8f.12.2026.09.09.05.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:20:53 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] nfc: llcp: fix -ENOMEM on connect with zero-length service name
Date: Wed,  9 Sep 2026 15:16:22 +0300
Message-ID: <20260909122029.34081-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When service_name_len is 0, kmemdup() returns ZERO_SIZE_PTR which
passes the NULL check, causing nfc_llcp_send_connect() to attempt
building a zero-length service name TLV and fail with -ENOMEM.

Fix by setting service_name to NULL directly when service_name_len is 0.

Fixes: d646960f7986 ("NFC: Initial LLCP support")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/nfc/llcp_sock.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index 5558d8a4d48b..220cd38e253c 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -734,12 +734,16 @@ static int llcp_sock_connect(struct socket *sock, struct sockaddr_unsized *_addr
 	llcp_sock->service_name_len = min_t(unsigned int,
 					    addr->service_name_len,
 					    NFC_LLCP_MAX_SERVICE_NAME);
-	llcp_sock->service_name = kmemdup(addr->service_name,
-					  llcp_sock->service_name_len,
-					  GFP_KERNEL);
-	if (!llcp_sock->service_name) {
-		ret = -ENOMEM;
-		goto sock_llcp_release;
+	if (llcp_sock->service_name_len == 0) {
+		llcp_sock->service_name = NULL;
+	} else {
+		llcp_sock->service_name = kmemdup(addr->service_name,
+						  llcp_sock->service_name_len,
+						  GFP_KERNEL);
+		if (!llcp_sock->service_name) {
+			ret = -ENOMEM;
+			goto sock_llcp_release;
+		}
 	}
 
 	nfc_llcp_sock_link(&local->connecting_sockets, sk);
-- 
2.55.0

