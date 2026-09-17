Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B75639B4A5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662636; cv=none; b=FKnxfpzLFNYGxyzTty+d+CTrHD/lJKRYp7IK6/qckvlt30e5lrJ8mTzpyQbx/d+UyIOr+uZpneD5uOF0eGeKItCJTAGyEW42bKYFf2f3fmYPGaEI3DL6rMimbHGcCP9a7liWYtAzSisiriD/WbEKh3ifVDgCQM6KrgkLYjtfNzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662636; c=relaxed/simple;
	bh=1uKQgdK2ZQ67pQ69htT9iF0krrGap0M3PIVWMzu37pA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WSK1RhMguDAqYuzyNv5WQY4/eWpmVwWB3amnR37tBld9SuU4fThR7X+j01wCK1syD91zOIRRoAJKtt1WZFKXjoEJbpMuBL3CgnQKnXCX0fpY+XRW0VIYLaLLpXp0jd3lLlJXlUib/AJK4k8Yk42q8GbOgAdi/rYFHodsSfJo0S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqMWM1TP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqMWM1TP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so13871625e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789662632; x=1790267432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=epvtes+QTuG/8pdcW3OWOMHUppdH8T7oJtRmUkiI2+8=;
        b=aqMWM1TPIyqazhICTpRfrGH6VWZ43iEOepqgEHCW0GmOJ7CnvhBlmFza3iajce7mfv
         MkURq553STUfSpkKMNPKGoNnlv6EGe3YgvUozgo+ckV/1SvEAJD7HLroDrGiVx6+Enq4
         1DVWly2htn88ghQ+EBELu+a1SicSmabI949ZpY/io215oeXuyTTmHPwrzl3aqIcv4NvL
         EtoIOK3zfhHd9Ur0ZU6dDnCqR7WC+GsWNQknTFV1OHwpnK9idNPq2kQvW2sAd7t+Q0P0
         JWtTT5JKZF6oiBsmdp10TQAMK1dPNgKn0NcJckoLJL9ezL/ugL6RVhkg4adoF10pYz53
         kTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662632; x=1790267432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epvtes+QTuG/8pdcW3OWOMHUppdH8T7oJtRmUkiI2+8=;
        b=YZgCNMZSqgrHrWhuCK7ODPGGAOr0BvBxHFCuxgCzmwbyg90wFtZmEaVMKQUSEjgZxT
         mt7UH/T7H1la0tEl1xtjQFtXJ9nkFr8PZ7C4uWwN07c7dmdPm8oEgfOkfyy6Ui96P6JE
         kzjlGtpurNGbV92X/MzQI7wvbBCpBFf8E/hqkpJH0Xu9vPuCGdtLo9ElLaWEQb5EgJdx
         RWc7l+iqJA2NIMVY7qf9mtoBT0WlBFu6Rdoc5gBYvGojkk9lkNFbMiyurccX4qrnUVZc
         ayInsQSH7S3VJVNFCN7YvMNqVgKoKPeO2bCWYrpaEQSY/WcuOvHN9hLnIhaYEihUBajh
         vmYg==
X-Forwarded-Encrypted: i=1; AKwUvBwsXXvGDcacVffWP3PXjfDpUvmatp1Jdy7zqjOF6r9KZ/iuXsP5xXwYUAS+aiosN2Hi7Jxfb8UaP24pWPA=@vger.kernel.org
X-Gm-Message-State: AFuF++n5h314a9YxpFlFEvEZRoZc/5r6RypTViY7MG22vkxE2R0X8FTQ
	J6NErhwq0MB7oLKAtDvrgn/5CaSA3xSqnDPO2VCbMu0LWlINJfVDJe97
X-Gm-Gg: AYBFou2FTIOzf0u0Yedxlk3JDGf2a37XRpBsT6MhVtgwNHc5ZdUhYxm1GtRoySPVzHL
	DfZgcnch2lkpByK6IsKrKABWXuej+BtLjFglyanlH4LmT93NNarZgmzH7P5NlbmGg4pYyHKSfND
	GZahBSn+EBBAOlO7NFefIA9pr0iTsJX6dXrGDQtzNI4Ho5ssQEM8wPY7T5tGNfVbNxHBLsYmnoT
	35KeKoEXD18i3e74HuNvuQItd7cN7CKLjqvZLOF3fy+sfZHXec9ZQRoRSuvb89KqD0L9bYZ2xOK
	sqZ2l/ky2fb+WtZTweYOg9mZxC07IUGd8Y1bMaZGufuXiOVlC0jNzqSPMApShHBGt/lb3Vw3ajw
	f9oWKTpYvyB3VnLdkWs7Tv13bq6DpVjU8r9QozY5uW/XPTXF3eqa3YatH/61uA1awSrLirnUbWt
	QnOj5/f4E0Zr54V5ZKoRyepC31v+gp6M+eDEyIYdRx2wtFGCUcuiNRDAmqf3zGTpE5ITnJvJWb0
	THrALHPE7GpzSmU1fxC
X-Received: by 2002:a05:600c:e549:10b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49f1d516934mr56467995e9.12.1789662632070;
        Thu, 17 Sep 2026 09:30:32 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbf515cfdsm77508595e9.11.2026.09.17.09.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:30:31 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Frank Li <Frank.li@oss.nxp.com>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v3] dmaengine: loongson1-apb-dma: avoid using iterator variable after list_for_each_entry()
Date: Thu, 17 Sep 2026 16:30:25 +0000
Message-ID: <20260917163025.7171-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ls1x_dma_tx_status() locates the descriptor actively being processed by
walking the LLI list and comparing the hardware reported next descriptor
pointer against each element's next-descriptor pointer.

A list_for_each_entry macro is used in the comparison phase, which at
the end of the loop leaves the lli pointer at the currently executing LLI.
However this also subsequently runs for a non-match lli, in which it
points at the head. This causes a type confusion bug which treats the
head, which is a ls1x_dma_desc, as a ls1x_dma_lli object. Additionally it
goes forwards and prints garbage via the dev_dbg.

Fix the type confusion bug by only allowing matched LLI descriptor chains
to print the current LLI and residue calculation, as failing to match
should be treated as an unexpected condition.

Found by the following Coccinelle check:

  scripts/coccinelle/iterators/use_after_iter.cocci

  drivers/dma/loongson/loongson1-apb-dma.c:461:6-9: ERROR: invalid
  reference to the index variable of the iterator on line 450

Compile test only; Hardware testing by Keguang Zhang.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C
---

v2:
- encapsulate residue calculation and dev_dbg inside the
  list_for_each_entry() macro. Treat non-matching LLI as an unexpected
  case.
- link: https://lore.kernel.org/all/20260729143247.6111-1-mahad.ibrahim.dev@gmail.com/


v3:
- Collect tags from Keguang Zhang.
- Repost patch in a new thread.
- Change chan2dev to the newer dmaengine_chan_dev.


 drivers/dma/loongson/loongson1-apb-dma.c | 27 ++++++++++++++----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 46b4bfef45e2..e62ab26c8327 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -441,22 +441,27 @@ static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
 
 			/* locate the current lli */
 			next_phys = chan->curr_lli->hw[LS1X_DMADESC_NEXT];
-			list_for_each_entry(lli, &desc->lli_list, node)
-				if (lli->hw[LS1X_DMADESC_NEXT] == next_phys)
-					break;
+			list_for_each_entry(lli, &desc->lli_list, node) {
+				if (lli->hw[LS1X_DMADESC_NEXT] != next_phys)
+					continue;
 
-			dev_dbg(dmaengine_chan_dev(dchan), "current lli_phys=%pad",
-				&lli->phys);
+				dev_dbg(dmaengine_chan_dev(dchan), "current lli_phys=%pad\n",
+					&lli->phys);
 
-			/* count the residues */
-			list_for_each_entry_from(lli, &desc->lli_list, node)
-				bytes += lli->hw[LS1X_DMADESC_LENGTH] *
-					 chan->bus_width;
+				/* count the residues */
+				list_for_each_entry_from(lli, &desc->lli_list, node)
+					bytes += lli->hw[LS1X_DMADESC_LENGTH] *
+						 chan->bus_width;
+
+				dma_set_residue(state, bytes);
+				return status;
+			}
+
+			dev_warn(dmaengine_chan_dev(dchan),
+				 "unable to locate current lli.\n");
 		}
 	}
 
-	dma_set_residue(state, bytes);
-
 	return status;
 }
 
-- 
2.54.0

