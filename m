Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C4D3CAA47;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719828; cv=none; b=obgu/fNMRgQgd8dfaiQlnVuoWDvGCdtDH8nU7gldfnGM8iHEkT40uGnFdA84+54HKoG0ZZjh1GgsmpeVJLsViU5AXqFmAbGQUun5spE4TUsRYv+Y4U3nNVQ7klCjZ9obIkwYsHAjRMu2cZW1IzJe98fMJPjLpOuyRYQptpSKZK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719828; c=relaxed/simple;
	bh=pqtln2usNi6swABEnkmItz3rmeApDprpV00ba9Y2o4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvCBTzxd71jSUXzyiMkOrOiTfZBxxc3lNLELPIgRkxSxU6rSQGC5ebAFkV3IoqmpwU/rT48grYOO678QS2UdEcwSVV3nuXB7ZyJuhpEftGyvoXlBHl/W+kjShkh1CsIDYWwyMm7BG8ijJ2+7rXkX2clA3PIXKmN5QGzM2itMV3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOZMAjbI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOZMAjbI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5E4CC4AF10;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=pqtln2usNi6swABEnkmItz3rmeApDprpV00ba9Y2o4U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fOZMAjbIX0884jjl+kMa1vf2JcyE437gyJ0WtLbS8E5+aQEP1PVQk5vEtLROy3lX9
	 UpvgcTC2hPmyG0Rjw1GqWyJPfcQYcr+d5UFCuX8J6KVigRim3MiHWvU06sCYCkw21u
	 tIU+3wV/77x4ltaxFOC4FP9JGi8sukM6c7WfuoPvvgLSmQhSjEBzAE/En4yDLQaEbx
	 95Gv7f6xnP67PQv7wcAnEFLww5v2ZE1BTSiADFpm4leNrVzCAdhcfhvnzn9ePjxKzQ
	 zo5JTNHb0ARS7YbTd+1PW16WeJJbLzFCRaUUFj0HXVlK5nsODv+kKhJFcNC8XRKbXu
	 8iftJN/X3hicw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24F8C79FA3;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:32 +0200
Subject: [PATCH v2 09/22] thunderbolt: Allocate ring HopID before
 requesting the ring interrupt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-9-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=pqtln2usNi6swABEnkmItz3rmeApDprpV00ba9Y2o4U=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTfvfJHSebPS66FR+0uz22qYPSQqxzA955cyc3u/pM
 pbt8d/RUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhIyX+G/zkGbVnfJaVSv516
 XFy/6YkxV5+4zKuXZVKM3wNPTxX/Ks7I8H/PzPwJszvEb50wWnWj/8W+ws8VcjkLn61cv8941YS
 Ha1gA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The Apple NHI has one interrupt per ring and request_ring_irq picks it
based on ring->hop which is still -1 at this point for rings allocated
with an automatic HopID. Allocate the HopID first and release it again
if the interrupt request fails.

Signed-off-by: Sven Peter <sven@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/thunderbolt/nhi.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 5809809f64d4..6a97dcd57deb 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -534,6 +534,16 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 	return ret;
 }
 
+static void nhi_free_hop(struct tb_nhi *nhi, struct tb_ring *ring)
+{
+	guard(spinlock_irq)(&nhi->lock);
+
+	if (ring->is_tx)
+		nhi->tx_rings[ring->hop] = NULL;
+	else
+		nhi->rx_rings[ring->hop] = NULL;
+}
+
 static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 				     bool transmit, unsigned int flags,
 				     int e2e_tx_hop, u16 sof_mask, u16 eof_mask,
@@ -581,19 +591,18 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	if (!ring->descriptors)
 		goto err_free_ring;
 
+	if (nhi_alloc_hop(nhi, ring))
+		goto err_free_descs;
+
 	if (!(flags & RING_FLAG_NO_INTERRUPT) && nhi->ops->request_ring_irq) {
 		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
-			goto err_free_descs;
+			goto err_free_hop;
 	}
 
-	if (nhi_alloc_hop(nhi, ring))
-		goto err_release_msix;
-
 	return ring;
 
-err_release_msix:
-	if (nhi->ops->release_ring_irq)
-		nhi->ops->release_ring_irq(ring);
+err_free_hop:
+	nhi_free_hop(nhi, ring);
 err_free_descs:
 	dma_free_coherent(ring->nhi->dev,
 			  ring->size * sizeof(*ring->descriptors),

-- 
2.55.0


