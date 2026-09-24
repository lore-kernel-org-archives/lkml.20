Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6674A1DEC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263940; cv=none; b=fNX0vAxKgbnLitcM8kDq53YFNH2s+9uu94phqkxXvyxNAnnGq7mXsdwlHIIg24b+yu7bi/e05LCyzpEL9T5XGn2QtD+ccYZDlMRaYsfHcJHbwy/7DMPMkTYEc8QrA288tSqlo4KrecBbKOiTBKh7qgpQcsVkpOqPPmeYdTiPWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263940; c=relaxed/simple;
	bh=HUaeZlhO61JgbXjOA8WN1ozig6mqvIPFhhyVRtlOL+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fqe9YCoup2nHrFItQexhNeVyR7EVFngKAHDhVhwVNjmt7tRkeQn6mv6hENUWsMJyLjLFz4uT88nHALoGHNdugdG31lGTrJ1o5/2ahBw0IjpNxgh06mszGjIbiSZs9dFI0kF+6SmlJjrQjMG0KvQAFlR3y+4qRPvs30STTvqUCUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=B5zlPv/E; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="B5zlPv/E"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672f4b7091dso25456d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790263935; x=1790868735; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=le41I7oDew/uulFg5A4QwL0jscocCjtan7pOx9jg2ZE=;
        b=B5zlPv/ER3sekwvg1LxytO10IC49bidnBeBHL6Fe6c+wu3bH4c8VtktON7xzwdWZ2t
         aPIv3nhBRw3RNNVpPNk2MCF46MDaH6qJtXv8nCeD6ihqTQTnyc84ckHqUgW/p3aY1K/r
         j1IPo5vKkCaFbBBxHN0OrfK0EOzKNoXVLZqlkWH1/s8ATu4wREDdCLpP1ApLcl9+Y3UY
         5GDu9e+NTB/YW92pvhWA+SfwX7Yic7jbNroMLUAop/Q0SoMXLWHPSZiXo2ZnuK9+/0kL
         NWqi9/BrdgF8i984TOUCvNGiAwbqCsnxDe7NjUEJMvB2V6XchmSkSzQxOfA4Ho2NCYSj
         6Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263935; x=1790868735;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=le41I7oDew/uulFg5A4QwL0jscocCjtan7pOx9jg2ZE=;
        b=sQrbVb4KE3FWcwTKyHl1nPp6PwVAnhSypNbmiA5O5QlNAN4Vc6zGYP1nIs+H56kj0B
         WhIVM0VQzZ0pSPHrlYv7cs+SsTa7QjFt30PaDr9Cn9gb0aslb87m95blsHfewfNOmx4g
         9GAXynouUKwGNXPF3RinOeKQxcuQvDvHaKV64sRLcpw/pYDD1d7y8TxZlsrCK61+6FIY
         mGzM6HG+Trj/ie9q1SppEKqwTnOvIPy1g68Uy3hPrZ0J7bTQhrkFHFOMfsPOQwMcVdtL
         rRR2KQCPt+tC+e00mFH6EmA4FlRVbx4u2ZzaXlEC+v921224FrrCXuRfUUw65u2GBKvj
         EdIg==
X-Forwarded-Encrypted: i=1; AKwUvBzMh+y/plX1tpW8fc06w9pWrL5u6tz9lHdSp7BhqpkOKSZH/Uahje6XHb9svVe4cjsYFJG81aQXoxOAwJE=@vger.kernel.org
X-Gm-Message-State: AFuF++mEvs8llM6NwG8JCb/63pj3gTlS6SfD5mW2IZb7eaDVmALZDnO/
	jKqo7hBH4irQRdB36/ByoxKy7J2hhlm9Z8Vu3TUpS3k8hooNZ4/GFtJ0J8CnhlgXqF0=
X-Gm-Gg: AYBFou0GoNQuQiyo83YS0N5id8UzmMG0FqKO2YHkUiKg7vOPpW8MLNkQpqEs8aMmyUQ
	V4jPESr2zdjlOGju1ToLjFKA37dVwdpxp3CoN83qBl0tjjiJW8xGNJuIv/20TBo2BBbUHndselE
	umAsNPFriKdfXWibOuVBvOUcCZRAwqSAdd0PFzJNmhOjHjZ4VFnTqomGSneJ7lkMrrVmOVh162F
	hLna58dW310CGaYza++SSHTYiS6VZoKMQKGoCh05V/ah/DoEeA0+KLXMNf643mXyPnpbl0seXRr
	LA36K8hvgxZGUVJ59tIfVqKkazT9F/Fepc8zlYqwygigJzL/dzyUMpXg1Xb/nJI28DatzztU+pm
	ByQhQO7Samkjnj+do3XC+dLGgq1rHJE8o5JUAgHSZVjQbenmVINWyXN/6pOG3IBDhOzmFoc84tB
	kxMmIULE9BbyjVE7NiYh15jk+mcG8NuVaeQdJu4GjZFxht97wxz7a4QMG8/vAnDLDKJZcK3cyrk
	3oYz5nbigMMDpfU5p0PLXxI8vlwXUQ8xyHK7TwVg4CQOc5yOVLimhUv9K8=
X-Received: by 2002:a05:690e:4081:b0:66f:bfd2:6b80 with SMTP id 956f58d0204a3-672ed243db0mr1760528d50.4.1790263935531;
        Thu, 24 Sep 2026 08:32:15 -0700 (PDT)
Received: from [10.200.24.109] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d8099876sm2083828d50.9.2026.09.24.08.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:32:14 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 24 Sep 2026 10:31:51 -0500
Subject: [PATCH] clk: tenstorrent: Fix refcount leak on shared gate clk
 enable failure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAGZCtWoC/yWNQQrCMBBFr1JmbSDGUtSriIRJ8m1HSpRMFKH07
 o26+Iv3F+8tpCgCpXO3UMFbVB65wX7XUZw4jzCSGpOzbrAn1xuuM+cq6keu8DpxQfLIHGb4m3x
 MPCbbFoYDJ2qWZ0G7f4XL9c/6CnfE+tXSum7ihQg2gwAAAA==
X-Change-ID: 20260924-atlantis_gate_shared_enable_fix-c8d0c8db63ad
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Drew Fustini <fustini@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1

atlantis_clk_gate_shared_enable() increments the refcount for the number
of clks requesting the shared gate clk to be enabled always. It should
only do this when the enable for the gate took effect in hardware. It's
possible to end up in a situation where the gate enable failed, but the
refcount is incremented anyway, so subsequent requests by other clks
that share the same refcount get ignored and the gate enable is never
retried.

Update this function so that the refcount is not incremented when the
gate clk enable fails in hardware.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/AS8P251MB00013BD9A093C06D2D60E10EC8B42%40AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/clk/tenstorrent/atlantis-prcm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
index 6d4386eeb7dae..c8663b973749c 100644
--- a/drivers/clk/tenstorrent/atlantis-prcm.c
+++ b/drivers/clk/tenstorrent/atlantis-prcm.c
@@ -397,22 +397,21 @@ static int atlantis_clk_gate_shared_enable(struct clk_hw *hw)
 
 	scoped_guard(spinlock_irqsave, gate->config.refcount_lock)
 	{
-		need_enable = (*gate->config.share_count)++ == 0;
+		need_enable = (*gate->config.share_count) == 0;
 		if (need_enable) {
 			regmap_set_bits(gate->common.regmap,
 					gate->config.reg_offset,
 					gate->config.enable);
-		}
-	}
 
-	if (need_enable) {
-		if (!regmap_test_bits(gate->common.regmap,
-				      gate->config.reg_offset,
-				      gate->config.enable)) {
-			pr_warn("%s: gate enable %d failed to enable\n",
-				clk_hw_get_name(hw), gate->config.enable);
-			return -EIO;
+			if (!regmap_test_bits(gate->common.regmap,
+					      gate->config.reg_offset,
+					      gate->config.enable)) {
+				pr_warn("%s: gate enable %d failed to enable\n",
+					clk_hw_get_name(hw), gate->config.enable);
+				return -EIO;
+			}
 		}
+		(*gate->config.share_count)++;
 	}
 
 	return 0;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260924-atlantis_gate_shared_enable_fix-c8d0c8db63ad

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

