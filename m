Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D03C1D40
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696241; cv=none; b=TbPbCfvfvh2MVPDa+LVMYWGaYg7SoRhp3POMkiLNyu8SLCcLV1sJQQQDhWgmWKq7iRaS4X4w5SZpSufEbjJa9FehTNiWLnOuPxq3lt7MNAdW5fnwKF6nSeV1WAlNOfHM0eEc1D21lnh9EKjcZ1EAr59yP9ZAuyuczM3x7MNuUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696241; c=relaxed/simple;
	bh=PoHYO0hdDohsYjdTrbgcgq/IxEKr0IITzByOC/p8KS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHTLR/CGmdQ6Lhy61Xi3araLn365GS/n2lB3qJ4HqwLqPEvc6bNBwWMSmmU3MZaiTJyPk+9nojZbK69Zdg1sm2SQgj42RUcQFR6KKsHGMmtn8Uj3P5//GiyKXniO5qddAE6CyOoXI798O9N6mRRgvqN/KxnM8LQgvnJjmh6ZV8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=OK8Nvozg; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="OK8Nvozg"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso83090f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696228; x=1790301028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/pJjVbQRyxDdtGD6rF0s7b+fzIsts7a1HewX1aTncg=;
        b=OK8NvozgVaJfm2ugF6ZGYJpXdYwKnJyTOwCmKyZLCDv+cpspg6KAFZqheHcY5dGvFM
         K02E2bQ90eiwghdsL8UiSf2UKva04rMTu4UQDMemB6ykj64kIkw2/KsGDINDuqT5qg/p
         xuVzaXH2yWdHw/b46X0J08UxVA7ixGvDPCEDRapTxAxkurtwGyCGkgX5kixy9zcuveAs
         rCxeSRGIZ34ArGRFYht/gOx7mRrpr9NYRNRrpJGiMtcwdikxQKEadxBCiJFkneVoKgyP
         fLV5gRVL5kCfugmnwNBp+M/YY86K73/6+eytyb7Crv66U6sDWXOgKU99LNb2kd1Yf/Fg
         QHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696228; x=1790301028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m/pJjVbQRyxDdtGD6rF0s7b+fzIsts7a1HewX1aTncg=;
        b=DtFVbxzVy2wClN2mIaxHigj+cZcHQorMNniH8+b7fmvlWlbmb9a1r1qfXmCIxSY3gU
         kP8SoD/I6SaBjdkboflSqlPDDVZoAaFmS0t3d+GddCRUx4NproudGix1IdHzt4Eia8oN
         3Df9P4WoJ0C0g86Cwqpge/3jzO0hO2nWoaXRnY5pXpeIw8Oh4Bma1ZiGq2/5bW9LhSgI
         I+7qoudFOsGQamhP/QvgYr+BUqfI8dPxKePmU8oFDv3fUDkYvfGeCyttFIds9de39h2g
         2KgDRG3xVFvT640gzVdqbEXWJdupgYGhSbnpw+D7WFdvQ32sfG3O/1Qx1R9AXCsPt8Y7
         mLxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWefFcyFeEia3LPgoKtr2CLnobqb9AsXLF2WLtTVCMHgu7fjIP1yFDeFHjKJOs9ubUyb/Eq6OhMKWOmBo=@vger.kernel.org
X-Gm-Message-State: AFuF++mFtZBJkys9NArCsfU+scUrqOwB16p65vifgdjMHr76W6KaZb/s
	2jv3EHWcgTj6sP6h/mxri1rhStiziwx3Jz0eweKb53KeE/dmqYGVE9M9tWgynIlzKM0=
X-Gm-Gg: AYBFou3wbSYYaerEw41ou1zQmLxUBSzuABI640ObT/siPuRNZgeKy0YVOAy6w3qxiku
	3G+ROjTu8RmKcVzje6Losw2PPXBNftPjfFuxZGZs0T7UUFwM8aVUJ43UJH7bTaM6l0EItF41Yt5
	V4t9B1xHvcGOPZKXiNFwUCJ48R5Oh9Dt+Ld2ObiWrDxtElMlQzaWDI+5aK/x4iiFchmBWfDofz/
	cpodBp31vc9AB8hGonnKnDhGrZq29C3a1ruvgzq69/P2aTQsiU6yakNQaj0w44XcN7u03VrG6jj
	TASCiucLdPOJM+aIxWfqv12zFzA2uXzVGVo4EpPlWtRpgPYwiBkn1ZBfjIaIo8aYOCazRkvl3XZ
	iRlnRAboOpN3xfFliJApv9Z0fEp9GHZNnUzxXR/MMdml9uh7K536KuwTxkW9XfCu9EtJmkdPAxX
	EOzmkdxldEHvy55wbNuLLLILGS2pK8ZMqCeShKjnQnvVekl16K6g==
X-Received: by 2002:a05:6000:2689:b0:487:c45:3957 with SMTP id ffacd0b85a97d-4871e370c61mr2016513f8f.25.1789696227840;
        Thu, 17 Sep 2026 18:50:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff57926sm70569f8f.14.2026.09.17.18.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:27 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	gerg@kernel.org,
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
Subject: [PATCH net v2 1/2] net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
Date: Fri, 18 Sep 2026 04:50:19 +0300
Message-ID: <20260918015020.2518315-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918015020.2518315-1-f@lex.la>
References: <20260918015020.2518315-1-f@lex.la>
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
are still NULL from devm_kzalloc(), so rmmod or a sysfs unbind calls
regulator_disable() on NULL.

Fixes: ddda1ac116c8 ("net: dsa: mt7530: support the 7530 switch on the Mediatek MT7621 SoC")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Found by accident on a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44) while
looking for a way to tear a DSA port down at runtime:

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
  Unable to handle kernel access to user memory outside uaccess routines
    at virtual address 0000000000000078
  pc : regulator_disable+0x14/0x48
  lr : mt7530_remove+0x1c/0x80
  ...
  x0 : 0000000000000000
  Call trace:
   regulator_disable+0x14/0x48 (P)
   mt7530_remove+0x1c/0x80
   mdio_remove+0x20/0x40
   device_remove+0x68/0x80
   device_release_driver_internal+0x1cc/0x220
   device_driver_detach+0x14/0x20
   unbind_store+0xac/0xb0
   ...
  Kernel panic - not syncing: Oops: Fatal exception

The oops itself is a process-context oops that kills the writing task. It
became a panic and a reboot because OpenWrt's generic kernel config sets
CONFIG_PANIC_ON_OOPS=y and this target does not override it, not because of
anything local to this bench. With CONFIG_REGULATOR=n the stub
regulator_disable() returns 0 and nothing is dereferenced at all -
NET_DSA_MT7530 neither selects nor depends on REGULATOR - so the severity
is config-dependent, and the commit message states the mechanism rather
than an outcome.

x0 is the regulator pointer and regulator_disable() reads regulator->rdev
straight away, so the NULL comes from the field never being assigned rather
than from an error pointer: with CONFIG_REGULATOR=y devm_regulator_get()
hands back a valid pointer or an ERR_PTR, and on anything but ID_MT7530 it
is never called at all.

The same shape applies to MT7621, which mt7530_of_match also binds. The
MMIO driver is unaffected: it makes no regulator calls at all, though it
does still carry the include.

The id test is used rather than a NULL check because the driver already
says "these supplies belong to ID_MT7530" that way in the other two places
it matters: the devm_regulator_get() pair in mt7530_probe() and the
regulator_set_voltage()/regulator_enable() pair in mt7530_setup(). A NULL
check would be a third spelling of the same condition.

Tested on the board above. Without the patch the unbind panics as shown;
both pointers come out of devm_kzalloc() and are never assigned on an
MT7531, so the fault is structural rather than timing-dependent. With this
patch plus patch 2, the same unbind runs to completion: mdio-bus:1f leaves
/sys/bus/mdio_bus/drivers/mt7530-mdio/, lan1-lan4 disappear, the kernel
prints "DSA: tree 0 torn down", and uptime does not reset. The kernel under
test was identified by the sha256 of its ELF notes section, read from
/sys/kernel/notes on the running board and computed in advance from the
image that was flashed.

dmesg is not silent across that unbind. It gains one WARN - a single cut
here/WARNING/end trace block - from sysfs_remove_link() under
dsa_user_destroy() reaching an already-removed netdev directory: "kernfs:
can not remove 'phydev', no directory". That is a DSA teardown-ordering
defect rather than a regulator one, and in this run it fired on the first
unbind after boot. dmesg is where it shows: pstore gained no new record
across the run, but pstore records only oopses and panics and could not
have caught a WARN.

That run needs patch 2 on top, a different defect in the same teardown:
mt7530_remove_common() disposes the per-PHY interrupt mappings from .remove
while the regmap-irq chip that owns the domain is still live, and the board
dies in handle_nested_irq() later in the same teardown. With this patch
alone, the panic moves from regulator_disable+0x14 to that second defect,
and mt7530_remove is reached at +0x24/0x90 rather than +0x1c/0x80 - which
is the point: the NULL dereference is gone and execution now gets past it.

The disable stays where it is, ahead of mt7530_remove_common() and so ahead
of the register writes dsa_unregister_switch() makes on the way down. On a
real MT7530 that is teardown talking to a switch whose rails are already
off, which is a separate and pre-existing ordering question, not addressed
here; moving it would change when the supplies drop, which is more than a
NULL-pointer fix should do.

Not tested: the ID_MT7530 branch, which must still disable both rails.
There is no MT7530 or MT7621 hardware here, so the disassembly stands in
for it - before the change mt7530_remove() falls from the priv NULL check
straight into ldr x0, [x19, #40] / bl regulator_disable; after it, ldr w0,
[x19, #72] (priv->id) / cbz w0 gates both calls, and ID_MT7530 is 0. Built
with W=1, no warnings; checkpatch --strict clean.

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

