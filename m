Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790252;
	b=5OlwrXPJmD/EorZMcNwPikVtIP9gArD+zNzTt9odAdsRVtK5i7K3BpqRHtDDT1o6nHgP
	 Tv0cu+tMmGXW/GEiAlijxGcV5gn8hNQt5IBoJlDhPcGtUFIyVNEDKFPhsvhx/uboowHQk
	 P8ONZfHLCs4KLRkzzJl8FLZyrH1BYPdrHOlXe5A7zUCk7nBq4cE1N17LObeXhn0B9oBnZ
	 5/dftLOTezcgAUoo7ZzZR+Y8CUyCb71/SRPbjzyy7lvOj6A+fJUrpHerQemBLrFDLkuYM
	 OvIo3Lk89mZEL3x7cBG7leB4ociykMMFWyLkBBGapOpUh9HIqI/48HwwAImyiIsXzZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=W8Tbj15l65wdrQ6nP1bdM5KDmeBZZQ0e1b03QxB4foY=;
	b=LIMsnkUn8WbwHN0Pm9VqfW1CqoFbx//KAwD1kn777EMo5LJf8IlldeWA7OKQ5nKkFwhN
	 cR/6A2/0LIP5lZZBhzFufCdVaJ/aMcuY+vtyn4tlZq68fXg6e/oSDfUtbfUHWfD37lgN7
	 s4UTeQFUxS0utuEjOv+cX++0Iz/BUxU1CU/qMJW9yCmA4t7DzkgPI0BPH+cKCcVD0I1U9
	 epVxDNlc0u9LvqrUbukcb1C9hKNNR7Fu+nMPLMPmeSkquw6ppgLik85Uz+GYqDyBYGBXU
	 lVhMXUplb4+FdmEztOfV17hPyvIwXrWY7tBeGY25YG9cWt7u5RYBb+1NrA6HBF/Jz0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6kxLp6+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15066606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15066606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6kxLp6+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so5333285e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790250; x=1794395050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8Tbj15l65wdrQ6nP1bdM5KDmeBZZQ0e1b03QxB4foY=;
        b=x6kxLp6+6OdHly5ZjwbVKxcP5nNxoiBGXacIlAc0bItDupUMHNN3wxAKO/SK6wXwCv
         ZS8bJuOyDtL/3ETRewTitB5b0bLZZrkIYmBtGfiaMr/Oe1fzEX6qhI8e5c+nEb8+aRMv
         fg+JZuc2M6ooueTPGzkXHedrOHw+nOdusL1FhG++ekipJH7kjXjZs0zzZLisCBD424xv
         tLooMNYvxFRoLV/CKo7KTneOEm2fE2H/TBcSDQVu1ewGGKpvyDo8geX54Zvv7a40I5z4
         TyqkhgvcOfqRMaG4InFMSmGtqEO0ss2/15WUXwuW1yeG9Efa1TQ3q4jOfrIJeYUxFkva
         6dpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790250; x=1794395050;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W8Tbj15l65wdrQ6nP1bdM5KDmeBZZQ0e1b03QxB4foY=;
        b=kSD6yupYSRssTpQxMv/ZavybH4yOuGN8MDrjidoX556zuh0WRtVpYGCrKg8nOBwpAZ
         7LNNnXnL/H2eKNKl0RzmmmjkNyq2SEHl8VYMXeuMdOqXALOb6M+8NcPNjiJlkuqfsNy4
         YCc4EcBDk+8thLEJBJ//JqvHYqunzT7iuCcftcqhsAHHwHhJHQMnST8utOAAA8s+1CZL
         QxMoa1TuouZSb9qPZbBK6Sm7ERVep8yVIiO99OQo1Foz41ufspqE2SnNt6ySVNn+lPNw
         USxR2XSAAMDj4nrEELlBPKCMSoLBJOE9O+k2k1RZ0v4mLvViONumYOfCcPFSeh0JJHNF
         Zt9A==
X-Forwarded-Encrypted: i=1; AKwUvBzbKsLNRjWKMlCjKyIJ7phUgiHoYFIocVvzXaJwdg8tn0OSh4JeFUcuTbnGMQlWwHaQ6pT+ux0TMFJrszo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MrhvtZ4eWKnNeWD8sHINg5dGdBWFePvEic4WvhNR2NqAiMvZz
	L8ZJdLUEp5pOGLvJ/HMd6j7xmmUVyX3dmgBtdgM5QEpATxYNn8QNQ4M=
X-Gm-Gg: AYBFou0LvJVZxN2O6J3VvycapodPSjz/3zN55J6uyCAJrFMJ9PgUO49EIzCj1QJyGet
	t57GJ06nu/qgmbxP6x+Nq+yTb/fzDvYaXaLBh+2neeOdoqaq8oTvVGVg6XHTLDB4PGFdDHVWc1L
	J8xO+lMBDilpfkcv8nXbrn6ewcoUsFzalLYpj9sYi8y6DyXsLMgREA+CfYZ+dxkHK/XFvGh1M54
	BvBRsJJJDZE7RJS/Pau5Pn9gI/L/Emmo7CPnTkvuPEJek3973vMAh389Vel45r5GKYDRhV7u916
	Fvyp3nRK4LF8TtBrerK1eBRA3Fsl2seDKgWlFdTex4QvAFThBD8+1QZ5815Dw/jqj74AjPxTSlq
	mcY/dzvwcq5Uk3UupsWKfrRXNBkgeGZGtnBNJgjqvZiunvZN7D2QpEQmI/z4KhYZdZRxEJ1Sl5V
	XlBZl3jj38dSSoeE2wL0gzy0w/1iGoipJ8tx4RXV5K098M7+yFEa7F3Y+tMkD+NqNr9qiW5c2Nl
	TnZeFY/Iyw2VsRx/CWs+lmQ5g0/h/bEg9Nhba8Ckq4612w02Ls5iEb5J5InEQCgF1Yxf+q3eYcU
	FX0uUwUVbCY=
X-Received: by 2002:a05:600c:674f:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ac1228a434mr377260735e9.0.1793790250163;
        Wed, 04 Nov 2026 03:04:10 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c748105sm43888435e9.6.2026.11.04.03.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:04:09 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
	linux-wireless@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 wireless] wifi: wfx: validate num_tx_confs in rx_helper before use
Date: Wed,  4 Nov 2026 11:04:08 +0000
Message-ID: <20261104110408.986252-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rx_helper() reads num_tx_confs from a firmware multi-transmit
confirmation and uses it to update tx_buffers_used before the message
is dispatched to wfx_hif_multi_tx_confirm(), which iterates over the
tx_conf_payload flexible array.  Neither path checks that the message
is large enough to hold the claimed number of entries.

Add a struct_size() check in rx_helper() before num_tx_confs is first
used, so that both the buffer accounting and the subsequent iteration
operate on validated data.

Fixes: 9bca45f3d692 ("staging: wfx: allow to send 802.11 frames")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Moved validation from wfx_hif_multi_tx_confirm() in hif_rx.c to
  rx_helper() in bh.c, where num_tx_confs is first used for buffer
  accounting, so the check fires before any side effects (Jérôme Pouiller)
- Used struct_size() for overflow-safe payload length computation

 drivers/net/wireless/silabs/wfx/bh.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/silabs/wfx/bh.c b/drivers/net/wireless/silabs/wfx/bh.c
index 0071659bc9c98..d4c904324edb7 100644
--- a/drivers/net/wireless/silabs/wfx/bh.c
+++ b/drivers/net/wireless/silabs/wfx/bh.c
@@ -99,11 +99,23 @@ static int rx_helper(struct wfx_dev *wdev, size_t read_len, int *is_cnf)
 
 	if (!(hif->id & HIF_ID_IS_INDICATION)) {
 		(*is_cnf)++;
-		if (hif->id == HIF_CNF_ID_MULTI_TRANSMIT)
-			release_count =
-				((struct wfx_hif_cnf_multi_transmit *)hif->body)->num_tx_confs;
-		else
+		if (hif->id == HIF_CNF_ID_MULTI_TRANSMIT) {
+			const struct wfx_hif_cnf_multi_transmit *body =
+				(const struct wfx_hif_cnf_multi_transmit *)hif->body;
+			size_t needed = struct_size(body, tx_conf_payload,
+						   body->num_tx_confs);
+
+			if (le16_to_cpu(hif->len) < sizeof(*hif) + needed) {
+				dev_err(wdev->dev,
+					"invalid num_tx_confs %d for msg len %d\n",
+					body->num_tx_confs,
+					le16_to_cpu(hif->len));
+				goto err;
+			}
+			release_count = body->num_tx_confs;
+		} else {
 			release_count = 1;
+		}
 		WARN(wdev->hif.tx_buffers_used < release_count, "corrupted buffer counter");
 		wdev->hif.tx_buffers_used -= release_count;
 	}
-- 
2.47.3

