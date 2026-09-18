Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299004AA56F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732802; cv=none; b=istzB7+/Qg67xzpvYwtZY9KndCqEH3iE+p7Fy5iU4yxEWVNmX/PbUm5CaTGSq2r4F2n7udIfx+L0kU9+JrpIw4mP0GVzSTbOs1A6CwHLD+A2bSuYTEufW6CMbzu//eRdjs74fiCnLPBWrP0bkzWxyPhyf1cFj84tiPPBx5j8a0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732802; c=relaxed/simple;
	bh=txhqtuEPWi7nD3urKElDbbpKMOAPkwNT8dosnT1pZE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gi796guVSDDEcUhlcum7ifk9U2JBuxsuOKcivzF6bJIkrtDebkuq1k989lG045Is+dJmYcXl+faoNckfexzPGl5i0hbbJ5Fb/9CuYypIAd3X5Ia+IjJ8cgxW4FNOeFmcj2vZ1/E9vLrac6ehenLu6ETZw6Vodggddn7wtmmDkk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCiSmCRR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCiSmCRR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91a931f66so4117385ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732800; x=1790337600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYcJRra+LcCNHLwBdH8ymzEfMxOB7CWtfUUDK8cCiZQ=;
        b=mCiSmCRRXRTw81ytFymGzhKFcq+EM6p0FTeNRtVASeu7qaMcuILfgl42DAChfoB3RS
         S4mBT0fvnmc8ny+pLciMQ9F3Lkb4Rq4mmMi+5dX5vQTbZH6si3lSEcDnOAyP3sY6hNkr
         g2/H04cnZ7fW7XFYqV16nBQAkJoHRW26WiE4O5hnmzqseDTThD419+1VtdvEwc7yAawJ
         OY7SgH3n7YjJ1oJl4u2/yZ45ki4huvPd5vVQmohnmYb0E5vVjG3KK/RUuTkcEUFVP1VC
         NDgewBmjmiwr8dkCyXc+VG9SwrYp7jwo90Avt/NUGaEL+nMXyDCS1kSC2VIpIHgj2FT4
         GEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732800; x=1790337600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYcJRra+LcCNHLwBdH8ymzEfMxOB7CWtfUUDK8cCiZQ=;
        b=idfzpFnDxSjPw4jHN9nu59nU+0S5CseIMe8GjMhRhF68Kx6vRxLjc5a9PvQiKdpllf
         iHDkY0VZetDhYXjp6z3ieUZS9llB++P0fmb5AmELVAoFr4TIcVyOuf23R3ma0993+3xd
         1CinTHwOK6d19SUm/VU7R31rXNMfmhqxbq+Md/OEQxM+3nkZ9aZTC576iRYeEV3Ymvdm
         cSJViqAxKlENsUVI8gNMm6+Hi7UB33RunPGNP+Y15UlO/0pqAi6VJkER/bDBCuGUPOBQ
         zEcbkCCZzS/6kPN8OKz13kxuFCrNYErRGiPngqwUEp0ROU3EUq4P3g7phyWVcpTYyswx
         kQQA==
X-Forwarded-Encrypted: i=1; AKwUvBzG40f0P4H0KNxwJgkMRM7ZRE11Ho9LnxDK4oTLThkslLJwKa6lAeSDe6AHJNJ91qqB93Aa33FNKgwBkUc=@vger.kernel.org
X-Gm-Message-State: AFuF++n8WrEbsjhaKRlEkUCJ3kxLmTYd4iWfWJmZkeEXLE9ohdxkISJp
	kKUG/x8DqYNv0gBdc974QJI7D1Cw8wZI00AKWWuAJv3E51uUyjERv/h/
X-Gm-Gg: AYBFou21yVotCDlp72KxAHAF/qfEjtsi6+BUejBLafmNoFtiZCwmHmAy86E5s4Y0gWw
	7tetInFkbDt8HHW8e66GSzi5Isos5Bs6k9wUy6epWNrAaodHjid4FJuCJnPh7Zb1tPnF6v9X6T7
	wJ8IAETQ+7EouVN3gaOlH3U+PrxuyTpN0xRxSUs2JcPxAia7UTRd3aD9eyhlXDFU2N1oZcbPe1B
	a592K9Nk602lj1Hk1f2XV+HoGrAaljbfVeglhrFnMNKPsk6oa3R7q68ERlUOiwBZTG4JPi68S1N
	K09RZpgUy3trsIXHUMKvD9DxHuNbYapvU6SIZdhcGoJV+NHlT2yc+mb7APigsCH+I9F03+OoGHX
	ff9C+J/GCW/UVSWEp/N76xseYf97arODJz548ze+bEuNUO83xWfsQlFB+N9rbba9x4nTzzMXDK1
	dknQdfvRkAj9MkVQ3QW8PIisQrYrUf8Wq/3CuNgf9fRn+egoaGBe+b162UZnNkXFvwhcKd+xC78
	UNdO7MLUOpe35dp7BQ=
X-Received: by 2002:a17:90b:4b87:b0:39e:345b:3323 with SMTP id 98e67ed59e1d1-39e54fb121dmr4831022a91.22.1789732800428;
        Fri, 18 Sep 2026 05:00:00 -0700 (PDT)
Received: from kernel ([103.219.206.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2876a52esm4179626eec.20.2026.09.18.04.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:59:59 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: clabbe@baylibre.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] crypto: amlogic: Fix IRQ handler return value and fallthrough logic
Date: Fri, 18 Sep 2026 17:29:50 +0530
Message-ID: <20260918115950.9121-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In meson_irq_handler(), when an interrupt matches a flow but the status
register is empty, the driver prints an error but doesn't return. It
falls through the loop and incorrectly prints an `unknown irq` message.

Fix this by returning immediately. For empty status registers, return
IRQ_NONE instead of IRQ_HANDLED to avoid masking spurious interrupts and
allow the kernel to detect interrupt storms. Also use
dev_err_ratelimited() to prevent console lockups during an interrupt
storm.

Additionally, the handler returned IRQ_HANDLED for genuinely unknown
interrupts. Return IRQ_NONE instead for unhandled interrupts.

Cc: stable@vger.kernel.org
Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
I have addressed the IRQ specific issues in this v3. The other
pre-exisiting issues mentioned by Sashiko are already addressed in my
separate patch.

Changes in v3:
- Revert accidental clock management changes that were squashed into v2.

Changes in v2:
- Return IRQ_NONE instead of IRQ_HANDLED when status register is empty
  to avoid masking spurious interrupts.
- Use dev_err_ratelimited() to prevent console lockups.

Link to v2: https://lore.kernel.org/all/20260918110504.7207-1-raizudeen.kerneldev@gmail.com/T/

 drivers/crypto/amlogic/amlogic-gxl-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..09d3ccd92b80 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -37,12 +37,13 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
 			}
-			dev_err(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
+			dev_err_ratelimited(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
+			return IRQ_NONE;
 		}
 	}
 
-	dev_err(mc->dev, "%s %d from unknown irq\n", __func__, irq);
-	return IRQ_HANDLED;
+	dev_err_ratelimited(mc->dev, "%s %d from unknown irq\n", __func__, irq);
+	return IRQ_NONE;
 }
 
 static struct meson_alg_template mc_algs[] = {
-- 
2.53.0

