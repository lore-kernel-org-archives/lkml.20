Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D244B0E36
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687959; cv=none; b=AM2BEG38lkv36e7XyUy/3WT88nzDsNiCWCIGUR7Z5WfBNswbArAhSsuL0AZSKf2OUwt0h9tyk5zD6l7uLYR5a1vMreQB5AlLa7ZZmsK1agEuP29Jm4cHxnAwI5DHtskDOC2P6/CRzQfUNv9ToJu7hitss/wh0U6+Wu975Coedno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687959; c=relaxed/simple;
	bh=i5EAoq1Xc8k5Nb96NUryR385FSoC/JKqS1uOw/t3FNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTxhqzAxnwVq5wfIpZrLUiQM9O3uT9tCk4vd4akBVotzHynUVaLZtUC6ONcZKfBVSOPvl8+tqwLj8dxyVK38Wq+zGRoC6hCUxILTDK9Y4qHThYPJLR+4rOGKI8TUSnnHVV33PSi0zXGSmkOVpROxOoqa/Ln7SoMQrBz5zaX3o1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=g7sHcvFL; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="g7sHcvFL"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso181786a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1789687955; x=1790292755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLY3UmOqZzZ3us+Px/eqBPnv/fx2lVKt8ROnyv5E4d8=;
        b=g7sHcvFLN0JS/LhPhg5kNsY64AISQkLDazaArtEVQyvOnkdwjLtuquk2u3vzHLzdG5
         cIyL1MdVQAfh9j84LgLJcxsVk3zEMZr8T7/Yka73oCHu7XH9w9W5edSV5CdffHZCFWUv
         M4RWgYqh0TdmIRb5CPCIJpwDqq/8+7TPHJBwnJ+dfj+rpgkY/jbvFW452kWSxKG+zJkS
         jh/45NDRMX4rh8jPsBFsTho6LS7JW34zZA/ZD801rTjdfpB83mQz6UyNTivS3YX+oK5l
         H/TjLQjbkC271Y3XI6acIXrYZBMG346r4joIcwrCjCeMt3/OqwE5yiyvKoulN1omTLFf
         9B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789687955; x=1790292755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLY3UmOqZzZ3us+Px/eqBPnv/fx2lVKt8ROnyv5E4d8=;
        b=bL7ibfQ/zRL6r5bpfpS330BQ/RSoS8aYL+oLYaIQr2RUaD+TPjFzYK43Ck0NwACBVq
         0a8V7nW2slPuqaFpfDhuY5El/oqfLJZhi7Y4/TpkgRyCusw9GmW70tVMRaR07XkV4hXF
         ultTJAwEWhx+QSNlDc2v1XAbWxiSCWblniRGfFJbPYv6ruzrdsfnrMi1yV2ZcBJ2xM+5
         35NqIcgik4pkw3ZTvXhpiSZuCcYIr8R65hc0avm6z24uU4gSSMa8HmfViLnRY+CG4DrU
         LwWHR9IZvWCJiMLxW8+GIgKD0YGSg/ZAemiYWkn4V3y8ffDYI6awzjB9HBqutOKyeuWt
         ezQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjLnrnu9FWyvYtRPIcHXwQTiqGEocZJMBCEaUVgYUu2kHFpyxnf/Ihh7IhxzM/LsJWjzn63auhJwG7pAU=@vger.kernel.org
X-Gm-Message-State: AFuF++kn8JkkDweaoS7V8219vgTgV27Osz7DlWf2IqLAO+91S5/w5rrE
	8Xd34TxnDY+p7Q5cltzI64V0rp6sJgZMiN7FvZMpdGXUZSs0DrafccJacqEpFKbelAU=
X-Gm-Gg: AYBFou3IuhgVoO9/lZ00K5q8sW8+6x5ad5MvpYU+8Z52ZT8mfo0uDvNPWR7XvSlUDUV
	lugJLKvkSXswfhVbaXVpxMmATuwhyUeS39ThqZQoSdn6EWe9h8JKKLcoyQUb0kzYv244Fo2fADJ
	x4jkujlHjgoxG3ca+Ws//skIe7DB5PNyaY6rQ1GTyLCwZoXOSwOmYaMfFWsNLrkAujxv39c+si1
	mGir+AB7N/wTRR1PnXVDX5GOzoBy5h+fjU+kGMP+QyPacpcQ5pUWDkIEFkFcXHC9Wq90I5nIggv
	6S5eR8/36YPY6I6+g6YprAt1i157zJglaOC8dBMvQjwfM9YwKTdLvN5UnCEQKa2WBUzfvb2aoBT
	iZnp0G228gvh77QcwGh8FpwfgyZXmlv8SQ6wWF8S8I4OkrAHs7rTCE/KJGhYIx05iuqjUgQ3tbx
	iPBTd8zjLT6PIaCIvjOCs32wHakIeM9YSB+HEt7tmLP4fXab9TH5zN
X-Received: by 2002:a17:90b:4e85:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39e54d185a6mr1369298a91.9.1789687955043;
        Thu, 17 Sep 2026 16:32:35 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:47::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm7412912a91.4.2026.09.17.16.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 16:32:34 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [RFC net-next 1/2] bnxt_en: return status from bnxt_hwrm_tx_ring_free
Date: Thu, 17 Sep 2026 16:32:14 -0700
Message-ID: <20260917233218.1160001-2-joe@dama.to>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917233218.1160001-1-joe@dama.to>
References: <20260917233218.1160001-1-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hwrm_ring_free_send_msg() already reports failure to its caller,
returning -EIO when the firmware rejects HWRM_RING_FREE or never
answers it. bnxt_hwrm_tx_ring_free() discards that value.

Return it instead. No caller acts on it yet, so there is no functional
change; this only makes the failure observable so that the next patches
can recover from it.

Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index ca99f4b1a63c..ac7716dbf88d 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -7660,21 +7660,23 @@ static int hwrm_ring_free_send_msg(struct bnxt *bp,
 	return 0;
 }
 
-static void bnxt_hwrm_tx_ring_free(struct bnxt *bp,
-				   struct bnxt_tx_ring_info *txr,
-				   bool close_path)
+static int bnxt_hwrm_tx_ring_free(struct bnxt *bp,
+				  struct bnxt_tx_ring_info *txr,
+				  bool close_path)
 {
 	struct bnxt_ring_struct *ring = &txr->tx_ring_struct;
 	u32 cmpl_ring_id;
+	int rc;
 
 	if (ring->fw_ring_id == INVALID_HW_RING_ID)
-		return;
+		return 0;
 
 	cmpl_ring_id = close_path ? bnxt_cp_ring_for_tx(bp, txr) :
 		       INVALID_HW_RING_ID;
-	hwrm_ring_free_send_msg(bp, ring, RING_FREE_REQ_RING_TYPE_TX,
-				cmpl_ring_id);
+	rc = hwrm_ring_free_send_msg(bp, ring, RING_FREE_REQ_RING_TYPE_TX,
+				     cmpl_ring_id);
 	ring->fw_ring_id = INVALID_HW_RING_ID;
+	return rc;
 }
 
 static void bnxt_hwrm_rx_ring_free(struct bnxt *bp,
-- 
2.53.0-Meta

