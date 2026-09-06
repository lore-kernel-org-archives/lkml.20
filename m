Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D253CC327;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719828; cv=none; b=S1Ma/tP34NiNIP0giv7mCEneqTol+lwgdBl1mQ5p0V78L+XgPGGKvFGw9p508b7/HFLBF53zA4iWOzslXT651c8ByobNuWTEcW6zYYeWKdS8ejXCyl21X2p9hIezm2J/FBUjf6NoGP7zysRDsS1IpWdhcx07ANJkEDQZVrEU9hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719828; c=relaxed/simple;
	bh=JhMORvwjpL+vSOXSZRgQ34FsUDioPUDXHqRnLjyFxTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtDlHlRtMA2qMUpOLT3vL63F3d1TxhmqZlT9ZlIao+MguUjH2NLXHStL7XEtNn9lne88YsldOF9W+xj3ZB/VnrW0YbnpSzzTXiDUoqSbgJzDTOUBDFSJr6Azk3vU8uYBMqIjeeaOLBKWBKGsIhtQU1vfaaPNsoOeMlqh0FxZIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJLhjAbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJLhjAbN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0911EC4AF12;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719828;
	bh=JhMORvwjpL+vSOXSZRgQ34FsUDioPUDXHqRnLjyFxTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kJLhjAbN/lnM+vW/3yBm2RV0TQrIrWFYS3Ky61E7RBYMCQKuBKbH+9dIXoKzkQ3tV
	 0Krbvw84Xk+ursQiufPbX0JY+YkcMbX90oooSQRGOJ6FmZyfEQUbMiIDNkRLRIyHz4
	 gqmWGDIHndsRjA04xwY+SsVuXZaOuQKDQf1qa2v7aIFiLvQOdi95iJ+pl/52dj1Y1M
	 1JRad26ejpYWP/xuQ6qxZu44Jmm2ojB+I1Gj74WUzUtC3nOSfDKB8iybuEXxnXgQQO
	 9tXYISd+Jfa+82/uL2DhmJuaKKK6/wtpwuXBYPHODKMpIIGQOjGwphy97iDcOnKpWA
	 W0pcFOp2jvvFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37E3C79FA0;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:35 +0200
Subject: [PATCH v2 12/22] thunderbolt: Add ring_interrupt_active to
 tb_nhi_ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-12-1f80085f93fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=JhMORvwjpL+vSOXSZRgQ34FsUDioPUDXHqRnLjyFxTw=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTYc6Di2y31B1ZZp04ac3vlqF31cFbWjLvyTSuHTNR
 K+Q0MX7O0pZGMS4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATiXnP8N/tw420F0kTZkwz
 lN60Q1c4PUqiMHxZd5H/pf0LFZeLJ/YyMnxbcCzvxK4Fr8zj1Bf9Mrvz0iNIor9vaWNt78YfL56
 98eIAAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The Apple NHI enables and disables ring interrupts differently. Add an
optional tb_nhi_ops hook to override ring_interrupt_active which falls
back to the standard USB4 method when it is not set.

Signed-off-by: Sven Peter <sven@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/thunderbolt/nhi.c | 12 ++++++++++--
 drivers/thunderbolt/nhi.h |  4 ++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 6a97dcd57deb..fc54ff7edfb9 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -149,6 +149,14 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 		nhi_mask_interrupt(ring->nhi, mask, index);
 }
 
+static void nhi_ring_interrupt_active(struct tb_ring *ring, bool active)
+{
+	if (ring->nhi->ops->ring_interrupt_active)
+		ring->nhi->ops->ring_interrupt_active(ring, active);
+	else
+		ring_interrupt_active(ring, active);
+}
+
 /*
  * nhi_disable_interrupts() - disable interrupts for all rings
  *
@@ -724,7 +732,7 @@ void tb_ring_start(struct tb_ring *ring)
 	}
 
 	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
-		ring_interrupt_active(ring, true);
+		nhi_ring_interrupt_active(ring, true);
 	ring->running = true;
 err:
 	spin_unlock(&ring->lock);
@@ -785,7 +793,7 @@ void tb_ring_stop(struct tb_ring *ring)
 		goto err;
 	}
 	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
-		ring_interrupt_active(ring, false);
+		nhi_ring_interrupt_active(ring, false);
 
 	ring_iowrite32options(ring, 0, 0);
 	ring_iowrite64desc(ring, 0, 0);
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index f72d6b274501..4884c3f5a2b2 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -52,6 +52,9 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @post_nvm_auth: hook to run after Thunderbolt 3 NVM authentication
  * @request_ring_irq: NHI specific interrupt retrieval hook
  * @release_ring_irq: NHI specific interrupt release hook
+ * @ring_interrupt_active: NHI specific hook to activate/deactivate the
+ *			   interrupt of a single ring. If not set the
+ *			   standard USB4 NHI registers are used.
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
  * @reset_interface: Resets the host interface
@@ -67,6 +70,7 @@ struct tb_nhi_ops {
 	void (*post_nvm_auth)(struct tb_nhi *nhi);
 	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
 	void (*release_ring_irq)(struct tb_ring *ring);
+	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
 	void (*reset_interface)(struct tb_nhi *nhi);

-- 
2.55.0


