Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78E49AA48
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417472; cv=none; b=kG19GQWABj2WlIEQy4qITfc1zH+6ItsEmxiK2s9MVFJswUb42rm44DWPuKidFWMSLks2DDoR5j01i9H4jtEbp0cjJMXxVr5sCxjSkpYI2KTSl3GxxlG5JoVlFrQ2pM5o8ajLNjmSlw8J+eqUH7cgoPpSZCLgbAVEWzLSX/1uMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417472; c=relaxed/simple;
	bh=g4Or46i4/ZLxYMues/wUC6wr09LRWlxJuvhV/1mJnxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1OXDdfYIHLDa7Vg2h5YB3jLvg4v+jXYB+VSKrDQLuoUeunxSiadu8PK74ME12i37UnvX6lnHUeJzokd4yjnRXvDfwZBSXkgZhifs8rzvvmYKePaY06BuGrceyp/h2GzaIH9Ce2EeJ+96yUMJSomK4rOMRDbNU66l4LXrZ3K4qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=bW5iPM5/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="bW5iPM5/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-486fa798933so1762641f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789417468; x=1790022268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=;
        b=bW5iPM5/fQnvVep0bmW1dvE1RGCKZkfSUzGLI+O0Lsi2aLnD7BTl/FHyq6uFMNe+ah
         ExiiD4ZBK3GiXsNHNBRVhy86Tt8MSdaWi9YG3YivdVwfGZemjKZGwbwx6DmjfRZLqnSE
         lur6L6xjWXFuyILiFYXCqv1Es59ITH/LyjMoQpwvo7hhXgXyiFHMBvZgPfyRpKGy8W0d
         owOqApQdxauQIXrEs3wfiVKNEreta7VxUPIDvyRwpO1ERGYezYRCHNLAdLDYq8jaoyCP
         nhVMbr4cUbOBAOXtw0ubKtnDt9QxH00SUqSQ60AUpEOXiQREPJeqRTJTTG/eP9fGLy/a
         kmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417468; x=1790022268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=;
        b=PpsVaErM7+RQA+vv+iC87h9qMb6AyhdF9JY+oKzPcCHBqyzq/pK5T3NFHOCSvxC889
         UAVz9eUIjUGAeNIkCzJWR3urdaOP3MZyLyJj3KT7FnjbXb/b4H7t2Cey69RPqxPeRjRr
         OyAZ4p4P/bDEct3m6TB1irf5vWKJvKiyCDVqxkFCL2qD2EOQbYL0+6x9WGxYuW9Qzo3w
         d2eBQyTlSRG9X1CFTJAfP8GCjUPiTJIy0lehHKlp/hGblajChi61DxsjGgTagApuwKSR
         QZU8qnMFfJaMe/ADEw+0IJNL0EfURzeyOBMe0eshWLHCwzxwKjq106cNUBjzhgItYdIc
         jYWA==
X-Forwarded-Encrypted: i=1; AKwUvBxwj8Zz80q0mOAJOiOZuRLcEE3y3efcOad9WlRgQpKYfBcMn2MQ+FNozrCSjTgtlOKRedVzZ7JaPl3MExY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxiaVUikTHBFCLIXNIE71U4/t45feWTg9yonqPufUq3veNlk3t
	InPzHwzj1m57pM0lvuq+MJw/fWtJ41rLURjlRsEuBCn4LT9ze+COUHCPRKCHeSDBno8=
X-Gm-Gg: AYBFou35kp6YW8lUyRMOIBMRYE4oXYntP3YINBwLfJ7ZiCo79RuFerjt1fD+C4yRzuI
	KkD1gN/NBprzs1B6HvzHgbvx7YHViSr5y4cc3sStGfuGnZ/hGmo2siz7LDQX9JkEmd9k/dDiPlL
	W0ZHrFnMyNs6nq70gvrZCcn/QJs0GiFZwelM2etWQ1rl9ad3FKBwNNseSKFvjYyXtYNj8ZsjyXB
	d6w42mZr4sYWnSdKiZjlJlVzEXKQG43tXL/wcTmckzS+XNlQcI91/e7WS6SMBcrHQ5XFQ89gvXr
	hOJrhFWKEgzGgvoSxQZ2enj/bpDpxt3Bn+N9oAfoJ4onYY+9Ix2mvHAM4DPAOw5VsoxVv7rUzCQ
	qOyeyiKrbKFZzznAlBNK8uoXzBlB12aa1gz2BABN6+2UHOVbDZmEDZ5Pc+DmJjvCbedMlwHLhYJ
	3zVlUUwFlf3guQ3EcyQE4X2p5juEjOYogQqoBtKPF8hUHvITrrBg==
X-Received: by 2002:a05:6000:471a:b0:486:f506:2fa8 with SMTP id ffacd0b85a97d-48702ac2429mr5519268f8f.18.1789417468530;
        Mon, 14 Sep 2026 13:24:28 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29328458f8f.28.2026.09.14.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:28 -0700 (PDT)
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
Subject: [PATCH net 1/2] net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
Date: Mon, 14 Sep 2026 23:24:20 +0300
Message-ID: <20260914202421.2737079-2-f@lex.la>
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

The core and io supplies are only requested for ID_MT7530: both the
devm_regulator_get() in probe and the regulator_enable() in
mt7530_setup() are guarded by the switch id, but mt7530_remove()
disables them unconditionally. On an MT7621 or an MT7531 both pointers
are NULL, so rmmod or a sysfs unbind calls regulator_disable() on NULL.

Fixes: ddda1ac116c8 ("net: dsa: mt7530: support the 7530 switch on the Mediatek MT7621 SoC")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
Assisted-by: LLM
---
Found by accident on a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44) while
looking for a way to tear a DSA port down at runtime:

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
  Unable to handle kernel access to user memory outside uaccess routines
    at virtual address 0000000000000078
  pc : regulator_disable+0x14/0x48
  lr : mt7530_remove+0x1c/0x80
  x0 : 0000000000000000
  Call trace:
   regulator_disable+0x14/0x48 (P)
   mt7530_remove+0x1c/0x80
   mdio_remove+0x20/0x40
   device_release_driver_internal+0x1cc/0x220
   unbind_store+0xac/0xb0
  Kernel panic - not syncing: Oops: Fatal exception

The oops itself is a process-context oops that kills the writing task. It
became a panic and a reboot because OpenWrt's generic kernel config sets
CONFIG_PANIC_ON_OOPS=y and this target does not override it, not because of
anything local to this bench. With CONFIG_REGULATOR=n the stub
regulator_disable() returns 0 and nothing is dereferenced at all -
NET_DSA_MT7530 neither selects nor depends on REGULATOR - so the severity is
config-dependent, and the commit message states the mechanism rather than an
outcome.

x0 is the regulator pointer and regulator_disable() reads regulator->rdev
straight away, so the NULL comes from the field never being assigned rather
than from an error pointer: with CONFIG_REGULATOR=y devm_regulator_get()
hands back a valid pointer or an ERR_PTR, and on anything but ID_MT7530 it
is never called at all.

The same shape applies to MT7621, which mt7530_of_match also binds. The MMIO
driver is unaffected: it makes no regulator calls at all, though it does still
carry the include.

The id test is used rather than a NULL check because the driver already
says "these supplies belong to ID_MT7530" that way in the other two
places it matters: the devm_regulator_get() pair in mt7530_probe() and the
regulator_set_voltage()/regulator_enable() pair in mt7530_setup(). A NULL
check would be a third spelling of the same condition.

Tested on the board above. Without the patch the unbind panics as shown; both
pointers come out of kzalloc and are never assigned on an MT7531, so the fault
is structural rather than timing-dependent. With this patch plus the unrelated
teardown fix described below, the same unbind runs to completion: mdio-bus:1f
leaves /sys/bus/mdio_bus/drivers/mt7530-mdio/, lan1-lan4 disappear, the kernel
prints "DSA: tree 0 torn down", and uptime does not reset. The kernel under
test was identified by the sha256 of its ELF notes section, read from
/sys/kernel/notes on the running board and computed in advance from the image
that was flashed.

dmesg is not silent across that unbind. It gains one WARN - a single cut
here/WARNING/end trace block - from sysfs_remove_link() under
dsa_user_destroy() reaching an already-removed netdev directory: "kernfs: can
not remove 'phydev', no directory". That is a DSA teardown-ordering defect
rather than a regulator one, and in this run it fired on the first unbind
after boot. dmesg is where it shows: pstore gained no new record across the
run, but pstore records only oopses and panics and could not have caught a
WARN.

That run needed one unrelated fix on top, deliberately kept out of this patch:
mt7530_remove_common() frees the MDIO IRQs before dsa_unregister_switch()
hands them back, and the board dies in handle_nested_irq() a few hundred
milliseconds later. With this patch alone, the panic moves from
regulator_disable+0x14 to that second defect, and mt7530_remove is reached at
+0x24/0x90 rather than +0x1c/0x80 - which is the point: the NULL dereference
is gone and execution now gets past it. That second defect is being handled
separately.

Not tested: the ID_MT7530 branch, which must still disable both rails. There
is no MT7530 or MT7621 hardware here, so the disassembly stands in for it -
before the change mt7530_remove() falls from the priv NULL check straight into
ldr x0, [x19, #40] / bl regulator_disable; after it, ldr w0, [x19, #72]
(priv->id) / cbz w0 gates both calls, and ID_MT7530 is 0. Built with W=1, no
warnings; checkpatch --strict clean.

 drivers/net/dsa/mt7530-mdio.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 784dd58a7158..de42f70afcfa 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -227,15 +227,17 @@ mt7530_remove(struct mdio_device *mdiodev)
 	if (!priv)
 		return;
 
-	ret = regulator_disable(priv->core_pwr);
-	if (ret < 0)
-		dev_err(priv->dev,
-			"Failed to disable core power: %d\n", ret);
+	if (priv->id == ID_MT7530) {
+		ret = regulator_disable(priv->core_pwr);
+		if (ret < 0)
+			dev_err(priv->dev,
+				"Failed to disable core power: %d\n", ret);
 
-	ret = regulator_disable(priv->io_pwr);
-	if (ret < 0)
-		dev_err(priv->dev, "Failed to disable io pwr: %d\n",
-			ret);
+		ret = regulator_disable(priv->io_pwr);
+		if (ret < 0)
+			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
+				ret);
+	}
 
 	mt7530_remove_common(priv);
 
-- 
2.53.0

