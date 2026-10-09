Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B9438A71E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516253; cv=none; b=QTnieeYdrHAjcp7nimGaWUBli6dAca2OZbZshT875JS7TuCaUHR0/3usDP8Fzp/tcFEBGgIuiBbJuD2KtoqEpEuw+eCf8PutZkFI2aAi0jKknoZtRgkpqVfxXA0ZQrdn4GG/W7nZvAtXxVeezIHh0s1btfXPffDKIAd5e9Aj7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516253; c=relaxed/simple;
	bh=HfQYL1ospi0oIvaNO9H+9UdWuav+d2TWanvWl6r/Q8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rbpDhUuigV05tn4mrM+Nr2ILIuVQGGgWFwB8AunmvJvbtSqhzUkoIVubwXJNR870UTDF6lhqnTyOTd9y86li62qeZwD5ziKCkSAPL7Z6A4I/b9wVoziTavYigG1yFF23m4DIUe9yxp8fyt5BhKEuUzRJqbj7EopRVzhEB9Ofn6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3/u3JFP; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3/u3JFP"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-350783faf89so2347757eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791516238; x=1792121038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4oOC1G3sbuDXwdYGrNRIiEKGDq7EtgjRVsujSOv4+4=;
        b=A3/u3JFPMjd5Sp/tikxJksHbvtyKiUcRu3rv4Wc0qlzkFsLJjCeNZaDVWu1GHkBn5d
         aMshgY/l80nvheTwpEaGJFA5g2dv16nRvjAuW6qsYSEKKjKIPRVcGqSr8hUblvcPsl8R
         6gI/0+BSHCI/+hrLI595e1aQ59Io5Zaqub5dgoIn3uhWV/E9nSxDjybldZHbIJdVsxVo
         39nB26zm0O4zKmZTbfwXYMUlYdQrNHLcFQsGLK4SJOB+GuSg3A2VnyVDoK0KDLpwUfzN
         7B+3VBewpzBKO4S6sP4nXl3kYU45mKnomWNUgZqKR/CWRK97gdK7Z81UMIzXYLXDhCoW
         XP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791516238; x=1792121038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4oOC1G3sbuDXwdYGrNRIiEKGDq7EtgjRVsujSOv4+4=;
        b=xx3fEw+zJyIEsdMeL8zQfsUPnh8NV2v6fV2QZHteD1+GCjIpOF2CrgbYkKboR4Lsho
         rfPkSou/238m1OeP6eL0pWwRL08tNB2t7HPo4ej4Fv8BlsF+/a8w4G793gbYOWapZUZt
         ueblUdTPZovIXBENCSojT1bPgNe5XoGTh21dUrnedIDaWRtdnM8o/QrzZzxTMy3V5FP2
         YEM+Ztur4AT28Rynxmx7ilL24AuLkNymq8LFdjfKrFXLK52ZfKK0TE4r24xISXN4TPYq
         xxh/KSeifutiIoAy8misVFWZWon9MOTjagCIp+vcNw+xkfEzbDMzto7QaKyooemklssY
         VjAw==
X-Forwarded-Encrypted: i=1; AKwUvBxrTDBI4WQzqUnLp919zw60EACsPgCJlOKooSCYLtuXv6ovlxd6XIyNAZS/lQu2wfbav1YtAsEa60FGFNs=@vger.kernel.org
X-Gm-Message-State: AFuF++n1YUk1eR0QcRtoGZj1RgTCu6gBUfxF4z5whkvx3775Ju867glO
	4SU2VGqeqHtl9bRRdjvUVKETxnlWde2Sjb0r0XOYLFtUJQYDitsgDGCo
X-Gm-Gg: AYBFou3KSEv+hgs0z0LNbSxRlCQyplCE63UGMf6S2x9zk9ta6yR1LJO6m7okcng6Hfz
	87hKVBZBXvl/rD8wHjlcQzjGzo6YOs/AVJrem5GzkUceSLcGvuyj137uauaPkvmj/oXC9zR4/uT
	0sEwZ+73ocNkwYGetm6DIhKW/qrW9LXd88wl5HVrGlFQ1aobTH46oEo6MMRIQohesQ0N8HGniPD
	hU5oNyG5D+/ID+8+ghaTVc1GD/j8Y2+7dGdBceB6qBjiJcn8sFoJZ/5QBVK6N9ErWXi78FOOxDc
	J0pmM9W5Ot1osNy6bAnOMLdp9DK59ZhjBPaO49tGVThSZQhFxL/9dUDalEjrqj3hcFWLrzPOQlu
	rbTLPJE2A13TpwG4ZzHyxlTyqG333nG7rRMRA0jSta2yEAIauob7uyvudEPHdF5iuu+8i/kepd/
	1dmEV3VUXGxqHqkBO33/Y20+bRNHR13lE+Zm7BoOGY4Nt3gyyl+iwQek8KQPhuWLLUm5w2tx+V1
	yp8NWWybahuGti34UHk4z7eQKY=
X-Received: by 2002:a05:7022:7f0b:b0:13e:5b2a:e65c with SMTP id a92af1059eb24-16a57b13034mr854781c88.3.1791516237602;
        Thu, 08 Oct 2026 20:23:57 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm3304742c88.16.2026.10.08.20.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:23:56 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pchelkin@ispras.ru,
	mihaildimoski@gmail.com,
	tristan@talencesecurity.com,
	rtl8821cerfe2@gmail.com,
	dawei.feng@seu.edu.cn,
	learn.rahul.rai@gmail.com,
	branislav.klocok@orava.sk,
	timlee@realtek.com,
	kvalo@kernel.org,
	briannorris@chromium.org,
	yhchuang@realtek.com,
	sgruszka@redhat.com,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] wifi: rtw88: pci: preserve the RX ring DMA address on cleanup
Date: Fri,  9 Oct 2026 03:23:39 +0000
Message-ID: <20261009032339.31786-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_pci_init_rx_ring() stores the coherent ring DMA address in dma, but
reuses it for RX buffer DMA addresses during error cleanup. If
initialization fails after at least one buffer has been mapped,
dma_free_coherent() receives the last buffer's DMA address instead of
the ring's.

Use a separate variable for the buffer DMA addresses so the ring is
freed with the address returned by dma_alloc_coherent().

Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f51444..10147375f3b2 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -298,11 +298,13 @@ static int rtw_pci_init_rx_ring(struct rtw_dev *rtwdev,
 
 err_out:
 	for (i = 0; i < allocated; i++) {
+		dma_addr_t buf_dma;
+
 		skb = rx_ring->buf[i];
 		if (!skb)
 			continue;
-		dma = *((dma_addr_t *)skb->cb);
-		dma_unmap_single(&pdev->dev, dma, buf_sz, DMA_FROM_DEVICE);
+		buf_dma = *((dma_addr_t *)skb->cb);
+		dma_unmap_single(&pdev->dev, buf_dma, buf_sz, DMA_FROM_DEVICE);
 		dev_kfree_skb_any(skb);
 		rx_ring->buf[i] = NULL;
 	}
