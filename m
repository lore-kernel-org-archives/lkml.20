Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625933CF692;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719828; cv=none; b=R4x+D/KDSfuZyS9dCPwFYGROweV1wvyVhUHLxgHfcgAaLG/Kd8xLJhG66AovxKhLrAHrfYgpoUKLNwyh+ph3phJnt24qDwtUkQ8gROVFzMVdG9w8TggGyxlqJb58Ga/U58TIH7zBQIauaBYckK8sENXK0V82Iif7X+Se7LNz+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719828; c=relaxed/simple;
	bh=MLS3CfP65BeB4Vq9q2p9dx2GX03Sfxej/VHdxZD2j/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kw1b53vEbNg7MaaoKDD4Ei3S57vQ4QPaeqegJ7XYexc0TCudvsw+/IMYJ+q6YIBGlPtlm1wfnddY+4QVt2HTrMapTcqL1G3YshCstjm2k989frcjfkuVn+o0H26Zz8O8q37KzxXbYkn0KzAnkr54VcetGIYxsT8itfbRNVcEotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6vNQRCi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6vNQRCi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4191AC32786;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719828;
	bh=MLS3CfP65BeB4Vq9q2p9dx2GX03Sfxej/VHdxZD2j/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J6vNQRCi4tAu2qEGei0gS4gjV9SWH0Vcp4i/a3mMDk2vhWv3iZfhiouZsaUbiXHyG
	 62cuxj3DB52NmoDclEm+38rSmL2mK4qwfNBLx69t/bhJXAuufb1GpSC6KOjgIuJLYg
	 VYM8S9XonPmIRErX+GFfHtd2lRODP4zv2N7S3NDGrywgKsakeFXuDK3uY9Z3h9AsRB
	 PuuXnKgBzs/ToXAlN3gEB1yD1NLS1I61g90b0Rfuccx1RXcNoy92cGJRQA5LS87OdU
	 DBBZdHsGWfbZbJmVOUFoQ95/+WnNpL9Aj+cYpa5YptEoTU7C6kQLOvnPTM/42zXRQs
	 VkaDIAJD66WOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E18AC79FA0;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:39 +0200
Subject: [PATCH v2 16/22] thunderbolt: Add add_links to tb_nhi_ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-16-1f80085f93fb@kernel.org>
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
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=MLS3CfP65BeB4Vq9q2p9dx2GX03Sfxej/VHdxZD2j/I=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTcc/3nvmPkvR/JWjyJT51wU68uZVnFh8h2/PoWzVJ
 Xstc68XdZSyMIhxMciKKbJs329v+uThG8Glmy69h5nDygQyhIGLUwAm8uAoI8Os91IrOx6zlunv
 rJFNPH3A8WDgpk/+SzhZc/y8P07+8+wUI8NisW2WK05ucRbLqpBbZ7ybIeVqV5byd+OYV8u/mUn
 WTWUAAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

PCI NHI drivers discover device links through ACPI or PCI topology but
platform drivers, like the Apple Silicon one, can use neither of those
methods. Instead, add a callback so that platform drivers can discover
and add these links through e.g. device tree connections.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/nhi.h | 2 ++
 drivers/thunderbolt/tb.c  | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index e4964772a442..addb8bcb4849 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -65,6 +65,7 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @ring_configure: NHI specific hook to program the ring options registers
  *		    and enable the ring with the given flags. If not set
  *		    the standard USB4 NHI registers are used.
+ * @add_links: NHI specific hook to add device links to tunneled native ports
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
  * @reset_interface: Resets the host interface
@@ -85,6 +86,7 @@ struct tb_nhi_ops {
 	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
 	void (*ring_interrupt_mask)(struct tb_ring *ring, bool mask);
 	void (*ring_configure)(struct tb_ring *ring, u32 flags, u32 e2e_flags);
+	bool (*add_links)(struct tb_nhi *nhi);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
 	void (*reset_interface)(struct tb_nhi *nhi);
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index d2832323cc36..72418a07166e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3434,7 +3434,8 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 	 * before the PCIe/USB stack is resumed so complain here if we
 	 * found them missing.
 	 */
-	if (!tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
+	if (!(nhi->ops->add_links && nhi->ops->add_links(nhi)) &&
+	    !tb_apple_add_links(nhi) && !tb_acpi_add_links(nhi))
 		tb_warn(tb, "device links to tunneled native ports are missing!\n");
 
 	return tb;

-- 
2.55.0


