Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B072B52189F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804866; cv=none; b=cLglKDGU+0jWkIXS8t+jfi/opDtP2AMXYhk5GioT7gGGHfuNP18xBMtRY2w/4C9Q4b2xTB3nFw08iBR2xGGKEunBl9MnZ27gWrpi0Fv+HnKh63QZFn0FzVoZkXRRM4Vmk9BKvtl3razp7BZo4JE7mkH8+qinfm0Za9T+LMJVhyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804866; c=relaxed/simple;
	bh=3Yu3IkCZbSo9RNlOXRScWTtHidQBLUVTZg24zE+kHKw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WTK7K5G1HB/D6FPFx902bekhmfHWVzM8urUWpLhXqd4OdGRQTgsTg3NHIiLVLTRuXnvVJJr8lym9LAbIkxtykzTD2LRTWqobvo2FVHgmOYue7hsOm1AwJZdt8D1kVkhc4oHW82nTalqWp8CUSZaFUKqTCCyjHN1OPOSni9UFtNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ta8HeOGv; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joshwash.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ta8HeOGv"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8484f12cso56225525ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790804864; x=1791409664; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gh40TVa6IvM/Fh6GhOPih6pz2RWuBxxGlDlIZav33u4=;
        b=Ta8HeOGvwDM6359ilxpMbSZygAiauDL1adbBVc8oI+NqOP/e2Sfn91FaaBOCi/JBwx
         L6ciZQ9qmvVU+7o525uVK4XUJ5t+AqA34rUx8y53PLZDW4x1rph4thTVwZOAjZuanU/Y
         fkVLRZv4hDxzy8fgGmSbW7jGBNt3zBN/jOmdMr4sI2Q7W/UHr4fjc33UPitO2PG9XKDP
         eNIdtgsbzCzNG0GCaQ31+rErhOWP28UWpcvienWOK90ZP5xntg3SDIPCMXzuFMZAFXlb
         aywkMaL/sJ/4q+bSGqpOKQeshiUfAjBUewDFWpLCYeYzpS7mIPuhakfYw9pHRtYXRlgJ
         /KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804864; x=1791409664;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gh40TVa6IvM/Fh6GhOPih6pz2RWuBxxGlDlIZav33u4=;
        b=EeMDQSxWiMvCfhSzRjmBvYVrfxFrbMRsRNL/jaBnmKyC1RwtBpUK8qsO/uOGgqNrpc
         HDnRmEykLLKBkuYloag0MXnJzI59gR5YR4/rJmePF6lDWpmZti6cVfTP5SKXxqYGJP+M
         p2cxHzzUQHPTZOjv8HZNkF6oW9aePiPL9pYs0u0K0r3UhDj32UV0PAaU3bUtBqc9yUFw
         Gz1Z1VBIZl3wNaFAXNiFdZacF3AzL8Ad53cZWretrZ5HUL8BoLEn7C+PStO06iPo2ALi
         yL8MoFR+GscVdPgtOJoRh2pFbbl5W1Q6hPCbFu1QwbbN1cGF/hoR6YJPREaYm7phoFiO
         v/Xw==
X-Forwarded-Encrypted: i=1; AKwUvBz1aQWnciE8lroEpY467lzxbgBwWN/Q9wG7g1mw28NBTHlp/4xN2yoroV3hViLpKedQ8U/HJk7+F4psOYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHraRmrGBDMguXe/Xy4+l++2DB9uoaald2tx1bjQOCtypVgF3P
	x/ed6D8qZZoqNbaVtEfvsFRbbb7gwWfJGXXTxD4Cl87TOVFZHd6l1Lt35RRWkHcWJeMZ1QJfAkC
	SGZcxknee1aWp8g==
X-Received: from plsc13.prod.google.com ([2002:a17:902:b68d:b0:2df:4aa4:16d0])
 (user=joshwash job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3c43:b0:2e2:d989:c273 with SMTP id d9443c01a7336-2e2e4b96b3cmr23197395ad.53.1790804863483;
 Wed, 30 Sep 2026 14:47:43 -0700 (PDT)
Date: Wed, 30 Sep 2026 14:47:34 -0700
In-Reply-To: <20260930214735.3288780-1-joshwash@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930214735.3288780-1-joshwash@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930214735.3288780-3-joshwash@google.com>
Subject: [PATCH net v3 2/3] gve: fix XSK buffer leak on error descriptor
From: Joshua Washington <joshwash@google.com>
To: netdev@vger.kernel.org
Cc: Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When the error bit is set in the RX completion descriptor, the buf_state
and its attached buffer should be freed. In the case of AF_XDP ZC, the
XSK buffer was not freed, leading to a leak.

Fixes: c1fffc5d66a7 ("gve: implement DQO RX datapath and control path for AF_XDP zero-copy")
Cc: stable@vger.kernel.org
Reviewed-by: Jordan Rhee <jordanrhee@google.com>
Reviewed-by: Tim Hostetler <thostet@google.com>
Signed-off-by: Joshua Washington <joshwash@google.com>
---
 drivers/net/ethernet/google/gve/gve_rx_dqo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
index a2c4a08ce68d..82ed5e48b00a 100644
--- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
+++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
@@ -842,7 +842,12 @@ static int gve_rx_dqo(struct napi_struct *napi, struct gve_rx_ring *rx,
 	}
 
 	if (unlikely(compl_desc->rx_error)) {
-		gve_free_buffer(rx, buf_state);
+		if (buf_state->xsk_buff) {
+			xsk_buff_free(buf_state->xsk_buff);
+			gve_free_buf_state(rx, buf_state);
+		} else {
+			gve_free_buffer(rx, buf_state);
+		}
 		return -EINVAL;
 	}
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

