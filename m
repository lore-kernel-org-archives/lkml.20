Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834500;
	b=Dkie2+SKX7zjuOb3l4H01cdQrXaXrpkmg+hN0TPa+lnF5UaiJgo776gc6vC+efGLXGvj
	 TVJbupRwC1hb158+E3tKYI++ig2b3Mdh9nZy/piNrdHwPjxJeOPrOmrSjJIttzUK9i7vz
	 ksDMj+qMZD9V3LhxBC8vokNLHX0SX309S3ZxeKSaTKdk6gokvcwPZNq+J8ppwnXPUvSHx
	 H+8wZvJZi7kLcnrCtQnE+BJgGQ0V0U/Pd6lFzLk3K9tctkch5m8GqvHP/g8+wpoSI66Yh
	 PdtlqQpBEYIpiYfgRFjpKJaqAf6oxl4726AZ3Qj4LMMeJF0tQy/YEoiUkLjzm3oUeFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:To:Cc:Message-ID;
	bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=;
	b=QtT6HP8Vb731qXCS8WZ1hqQQiklIlUsbXmCGAXoJJbT5rkpj2gj3srJGrkNIl8du5KEL
	 Ywkh04JQabueRLgiLFbCwtCsG1psPFFG7LSoegC4xz3y2GKNozAmPDwXrDcHTP3xO/Hf+
	 FaeCr9p3tcQivmnQdAwEUTVv6IWF1ADqDuW3egn/TbcmpBtv0sIIxnggsz/T3/6wWHx8u
	 vWIhTImVaAQNvg554ATzmsnXv33TYMTFLj0FCG4oacC9ZiBtXvkCE/OLBLoPGmnhmtMEs
	 gYC8orZGpKj/T5sm7kwjDtHD7nFpXg0CT4oLmxMi+DpLPVuMB8UVKUOLukkANq6rzJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Un7tTl7i;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB929606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB929606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Un7tTl7i
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e977109392so19219285ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794834499; x=1795439299; darn=vger.kernel.org;
        h=message-id:cc:to:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=;
        b=Un7tTl7icJ39KMFA/lBIRbrpAX70Zt+VEQWARqvvnZR3k2brwNKYku4YvriCV8S2S3
         vjUccF6TuZuRjdZbfqZE96Jdzk5EnFovkKO9+cgNOjEk2WnUbk58hzrG9MbHQ8GI4+U8
         fFwU9jSrp79CAnX9FbHnTunP2vQN1MaZjQxax5i3bdpX0IJbUemyFq9ykr5xKoTRyYHM
         2U8JFb/GqFo70Fo4lvI8qeCkID9c4WdKQ+LXQRusMNKJTie6slH924/gCsqAV7IMwSf6
         jcw5vNcvSsExNna/k427OUEPVwH1Er5kUts5XaLDy0YIFTQ9VpxDQWXEOOftOntZShZC
         t4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834499; x=1795439299;
        h=message-id:cc:to:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG+GBh1fpgsQkz9UV4Ps5a8YglcFFYNsAq1Nml020MQ=;
        b=yEFPuXnyCYDXLroWHsJaMCXnrnscb3oYFaGU4qcmicf5gzRW9lCD8oJDAN6AiV0P/P
         S8bQsHq9xB8iRHX96yKBHHanBslPcAUxxAs0V34I2pJwfhGOeLYE3XYcG4mBMAhn+/ig
         PNOLEjKk8rrwSeoqOy3sdVg+mXAaDemqC2GgRlBCsQwOcofxfhFWsxKCocfVXOud7LNq
         tlfZ6iMwWFYBeq7dklWpM02g/qX46yeMAnanOWEsQkx5OjGUcOP/05gdna8cKPc32szY
         EHMIIT3awaoaVgd65yIZ7wyT4Ll0L7lvY+zrQCj+LfnhDEtiDbLwwRptf2PDNBO2jcKQ
         5qYw==
X-Forwarded-Encrypted: i=1; AL+hErH4+OhRVGgKrihqxSxkPfURvss0c/1czHEu+spPlOzAn8jbyfkMF5jCvJIFCL1YIjcBUaRc3g3p6ML//Kw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A1qgLiy6RenQl2l24wYyur5OtkZm2wVqfRUTe6sB+vgj/Voy/
	ubuiIk1wmGSKORgeH6MDoOetoBdfDiZxyoiVE+jonXSohbDWqb6GmLH5
X-Gm-Gg: AYBFou0d16iaab3qD2Y/KhXBT1LxdASOG4a5/LSu9v9gxP3OIITnHGQ0tkjKOWfQ7qt
	ZY7oIp8C65IDh63mSvqOYc+G2qoO1863ETB4Gj7NTSaK57G1SvSHYawW4tcLj/FjfhBfC08K/Wn
	mrhZQ8xeFAUreQcjib7wsADxc8GUjdLrqger4nRYhVNUMO+Q+ftosJ9w2TEsV2bp1DhU+l/7gEQ
	1oRPro3Z42AOdWksGo0owXc/vHYctnTGEqKOGF+X1/q8MyJ3NsvJUCcuPfwrFi+PK0J7g07+axx
	uzbcsTIkAsYhF2nLq6tcMOTTgMdDwlScnXksE/YCqtf26O27OwrWCi0NSc87pKp/0BSbTEo17zs
	lSDAZ8jUR1CTOAkG3pADNqEwHrX0MVa/VSUAFW+XtD/fZXy+v7s/H5W6UfKTwoMtA0dinQI+cTh
	HT1LVZUfq8UmWvFb1C0eDOPa5oEcwVOMudQz0SB2o3/2nKeVJBeCkKJMrfuDoK33x0Pe1aDJiJ0
	wy20y6Oq+12D69fHG65ajKX8YXDsLKY5KjOzq4h3pzkuit4FYlCkcoaz7dt/1eSYI1tsr+xCRmM
	5rFCzRPpkvnYj9mgfg==
X-Received: by 2002:a17:902:cec1:b0:2e9:787c:8e68 with SMTP id d9443c01a7336-2ee0d36b42cmr109539545ad.0.1794834498913;
        Mon, 16 Nov 2026 05:08:18 -0800 (PST)
Received: from v2_send.eml ([2a09:bac5:4306:dc::16:229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad50dsm38280985ad.7.2026.11.16.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:08:18 -0800 (PST)
From: Haoran Wang <haoranwangsec@gmail.com>
X-Google-Original-From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Date: Mon, 16 Nov 2026 21:08:02 +0800
Subject: [PATCH net-next v2] net: sparx5: check DT port reg against chip port count
To: Daniel Machon <daniel.machon@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Message-ID: <20261116210802.2718-1-haoranwangsec@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
portno, which sparx5_create_port() later uses to index the fixed-size
sparx5->ports[] array:

    sparx5->ports[config->portno] = spx5_port;

The value is never validated, so an out-of-range 'reg' (runtime overlay,
corrupted or attacker-controlled DTB, kexec-supplied or bootloader
fixed-up DT) turns probe into an out-of-bounds write.

Skip port nodes with an out-of-range 'reg', as lan966x does in
lan966x_probe_port(). The bound is the per-chip port count from the
match data (sparx5->data->consts->n_ports), so lan969x, which shares
this probe path and has only 30 ports, is bounded correctly as well.

Found by a scripted scan of of_property_read_u32() call sites used to
index fixed-size arrays, followed by manual review. Verified at runtime
on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
malicious DT overlay, the unmodified in-tree driver performs the store.
reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
with a later NULL oops. With this patch all three are skipped. The PoC
and full logs are posted in the thread. Not tested on real hardware,
QEMU virt (cortex-a57) and compile testing only.

Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
---
v1 -> v2:

- Check against sparx5->data->consts->n_ports instead of SPX5_PORTS,
  so that lan969x (30 ports), which goes through the same probe, is
  bounded correctly as well (Daniel Machon).
- Document how the issue was found, the runtime verification and the
  test setup, as requested by the patch bot.

 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 08a398a..1647067 100644
--- a/a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 			dev_err(sparx5->dev, "port reg property error\n");
 			continue;
 		}
+		if (portno >= sparx5->data->consts->n_ports) {
+			dev_err(sparx5->dev, "port %u: reg out of range\n",
+				portno);
+			continue;
+		}
 		config = &configs[idx];
 		conf = &config->conf;
 		conf->speed = SPEED_UNKNOWN;
