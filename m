Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12649EC4A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417474; cv=none; b=pAebfNzZfca2stoH1wjhTL2LhYnBWC7SzUl3Rt831Bs94/8QFNOnSkY66qGUuEeaN9xbBIS0KVwAJV1aaj3kJ9VtXOH50MDutbDgm8NH9TOJZ0Vrf/VYHwW+LwztKC5M9Hb6x6g92hWmwIgU+L44pRvV/DpallReKepYo9zpzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417474; c=relaxed/simple;
	bh=x+jz7UKcqq0rDrzoYYBYh3A5KCcmjzm/9GvSwZsW/zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wxr/ZEkhpJHVhxsjGVuqkNcuMnMGtq80onsIY3hZCxk0VICWx7/mlWV+/c75jBTkXp7epxVI/b0oSAgHQYYyisQJd6/yHIn2PLCZ1pI8u/CxXl+mhYKuY8qTeDJnQhlVavPmA5t7iw+EGN7BuEm3vdztbfBEfdI1S3F0eXaqfUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=BkXgEy3d; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="BkXgEy3d"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so1083911f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789417470; x=1790022270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szNLjYOWpVIGeVzTm6wu2jNgdA0Q8lKnYCuvZd0lPlE=;
        b=BkXgEy3deTn5FchhgyrNMfNOPPOLEQdxlXU4rt01af/u5VGJYHwUQ7lSVmztHlY1dl
         1ebwYqYoAvWimTJw4al3OC6PUZ4dH4tVj/l1aLwbDTQjAHzfw1A/ObJrvAOK1gRKg2ED
         w3lRhFbaDH2DFWn4jsIah7VG7IHEafN9ZsgIE3zySBHfMAzLJ1dNKD7UiAiLpLd1GCM3
         Bs3rl8L3RTLy2zOzKkTlZLKPBrTr7IxoYpnTt0Wx3Uz+W+flgwci+IKGExCW7awVkIx9
         hYqG+B7TtmCmhsvfUBuwzAhIENDUYIjacoqqsFWNSyH6C1Bn+qF1TjxbIeuev/0S6F7R
         FlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417470; x=1790022270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szNLjYOWpVIGeVzTm6wu2jNgdA0Q8lKnYCuvZd0lPlE=;
        b=uy1w8NdWsQkuFg0oPAhcNGwq25MP7WubUDlwvJ8nnwawwA6rPUOpX7E/OHbed0sGGK
         /2zT5GEiny5T0BEwXlx1xhBT4I5V9T7Xhn3mbBjabeJr1JJO5Kfl248t2kWQYZLk1FiL
         UiHM3QpjGIdFQDhySWDfnvbAULWa4QivejRIP7ufZ9dsjbnjm/q9+pRNjO5S4iXEBywL
         r83kI52mgZ1hQW0PHpfjy4287YOuRnJ6IoetA0PUSiUwejJyrPP2lQDQI2b76mkn6L1/
         L4c5igqT3Q/amfS3La/CXAs1UadF/sSZSJfcEdGNpmGpdq3P/9ENtk07SnWX/VkjldiF
         khWw==
X-Forwarded-Encrypted: i=1; AKwUvBzA3fPudFIhCt89SuY9QY1DEjf+1jlja8a2HMTQL92mSu2nG91H/J5SFp2jbMr87mUWMfIjGAqfxJ9t38A=@vger.kernel.org
X-Gm-Message-State: AFuF++m4zpaAqclTxoUdX8CTAZfo3lEO9ReZrhbhH1vo2kqOc6GQmTTV
	+uYQH1pLlByQYVwwJuJwhLz596uAtHGenuyffhSJsudEIt29zPl9Ihp7hR4Cdyd36/c=
X-Gm-Gg: AYBFou35XKCvNbm6b+YEpkAmC1rc0/tZmt3JDQPon15AD3BTIcU2DvUf+vZrzLaVNSC
	sq9ET3U6x9edxY0ZDe0POBcVrI6ovxwxFVprQOH0cdqpWoqz4uh318WIVjZnDElf/M+2Te50rRi
	QyyAIW7QKytV2/6D1zC19xYBuVgguMZG/ehCEfdqwM4+i77Lk7XDfHuAQPevUEnvz5rBW4SrXD2
	H3jprWQZU68wqRsTB0L3y2LgLxuXXKVr4cpTu584KNNTqOQX1jD0Q8KVj5ep11ZrPFxMgUfad4W
	7pHapRMVv7rMQ9iFLkgGaEkhutWKh+7zYd7ovFwG7X7NZg6tBWPPruFXpQ4R/188zer5oAUyKAZ
	w4yU0z66hSK7rGx30UmgZ/GGrUAlvGeKTFb9dY2Md4rxY4DPzXmv+/Ktybe4gnjYi7NUhAUuNZW
	JiljWGcs8r7eqfKqLjpwhk8NVBab1C0MQpb3tyxK7yqnHJeyVLTQ==
X-Received: by 2002:a05:6000:4282:b0:485:95b7:fe8 with SMTP id ffacd0b85a97d-48702b1665bmr5620151f8f.25.1789417469778;
        Mon, 14 Sep 2026 13:24:29 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29328458f8f.28.2026.09.14.13.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:29 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net 2/2] net: dsa: mt7530: unregister the switch before freeing its MDIO IRQs
Date: Mon, 14 Sep 2026 23:24:21 +0300
Message-ID: <20260914202421.2737079-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914202421.2737079-1-f@lex.la>
References: <20260914202421.2737079-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt7530_remove_common() disposes the per-PHY interrupt mappings first and
unregisters the switch second, but phylib only frees those interrupts
inside dsa_unregister_switch(). Unbinding the driver therefore frees
descriptors that are still in use, and the switch's own regmap-irq thread
takes a nested interrupt on one that is already gone.

Fixes: ba751e28d442 ("net: dsa: mt7530: add interrupt support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
Assisted-by: LLM
---
Found on a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44) directly behind the
regulator fix in patch 1: with that one applied the unbind stops faulting in
mt7530_remove() and reaches the teardown, where the kernel says what is wrong
in words before it dies.

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
  remove_proc_entry: removing non-empty directory 'irq/81', leaking at least
    'mt7530-0:02'
  WARNING: CPU: 0 PID: 4629 at remove_proc_entry+0x1d0/0x1f0
  ...
   mt7530_remove_common+0x1c/0x30
   mt7530_remove+0x24/0x90
   mdio_remove+0x20/0x40
   unbind_store+0xac/0xb0

  Unable to handle kernel read from unreadable memory at virtual address
    00000000000000ac
  pc : handle_nested_irq+0x28/0x168
  Kernel panic - not syncing: Oops: Fatal exception

The WARN comes from unregister_irq_proc() under irq_free_descs(), fired for a
mapping that a PHY still holds. The captured record shows one, for
mt7530-0:02, and already carries the W taint bit, so at least one earlier WARN
fell outside the ramoops window. 294 ms later the switch's own regmap-irq
thread - PID 627, Comm irq/53-mt7530 - takes a nested interrupt for a mapping
that is already gone: irq_find_mapping() returns 0, irq_to_desc() returns NULL
and handle_nested_irq() locks desc->lock without checking, which is the read
at +0xac in the trace. Both timestamps are from the same ramoops record.

Reach is wider than the board that found it. mt7530_remove_common() is called
from both front ends - mt7530-mdio.c and mt7530-mmio.c - so it covers the MMIO
parts as well, which have no regulators at all and never meet the defect patch
1 fixes.

What decides whether a given switch is hit is not the irq_domain but whether
the PHY interrupts are mapped on it. Either mt7530_setup_mdio_irq() created
those mappings, which it only does when the devicetree has no mdio node under
the switch, or OF created them from per-PHY interrupts properties when it has
one. A switch with an irq_domain and neither is left alone: irq_find_mapping()
returns 0 for every port and irq_dispose_mapping(0) returns at once. The
teardown is guarded on the domain alone, so it walks that loop either way.

Tested on the board above, with both patches applied. Two unbind/bind cycles
back to back: each unbind removed mdio-bus:1f from the driver directory and
took lan1-lan4 with it, each bind brought them back, and the two cabled ports
relinked at 1Gbps/full. uptime went from 167 to 183 across both cycles without
resetting, and
pstore gained no new record. dmesg carries one unrelated WARN, from
sysfs_remove_link() under dsa_user_destroy() - a separate DSA
teardown-ordering defect, handled on its own - and it fired once, on the first
unbind, not on the second.

Not tested: any MMIO part - there is no MT7988, EN7581, AN7583 or EN7528
hardware here. The object file was checked instead:
after the change mt7530_remove_common() calls dsa_unregister_switch() first
and only then tests priv->irq_domain and calls mt7530_free_mdio_irq().
Built with W=1, no warnings; checkpatch --strict clean.

 drivers/net/dsa/mt7530.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3e61eb3c2b1e..90fd04665ebf 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3593,11 +3593,11 @@ EXPORT_SYMBOL_GPL(mt7530_probe_common);
 void
 mt7530_remove_common(struct mt7530_priv *priv)
 {
+	dsa_unregister_switch(priv->ds);
+
 	if (priv->irq_domain)
 		mt7530_free_mdio_irq(priv);
 
-	dsa_unregister_switch(priv->ds);
-
 	mutex_destroy(&priv->reg_mutex);
 }
 EXPORT_SYMBOL_GPL(mt7530_remove_common);
-- 
2.53.0

