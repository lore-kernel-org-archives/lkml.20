Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933610;
	b=dFrMOd6pyjd4Mj/MxWIgNoCSdVhbb2yZlRAdZV6W+DsssNbaStHd2xMe65NJ8C0XONGi
	 BtvVaBGpfFNQKn3uQcAKmPlbfCYJybQyGzLcvqc4DfwfgWdnTHRKOV0eiCqXF8NqJMOpT
	 +LCpB+toBVD8vK0CRuXcQjPTABM2hyUYb2VIdytmNLr+65oaw1l9numRkwBLsamrEtXQe
	 3DqAn9CDJIl68FZXMTOqBzSw4eIQuTP7P8n+lfJ0Q95yhzqGlqECAWSG+ExgdfyXVL2Ki
	 JznHjf69ZAzp2zMBonRCfGg8LFcob2RtxG37LoIdmwz7RM7JiymEA0TeC3ifjiCC88Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=;
	b=r5o3ledaENqqMrcfDmpyBBGb5fF3IjfvUobCVcmUm8pUuFVwqiCKSR0+nomj1gYWNZ4d
	 8iZoFJNEMt+4yFEciZFhtewq3F+g50S9v7p/36hZGnJpY94O288hE8gP+Y0P7ezcAoQaX
	 AO5arbdKV7kjXZLbC7qSslLjs44DZyFjmT8odn6ydsmunaUufQ/RrpUEztbmw0lju/I9o
	 76vj4ewVsUUFYh0zdtycGQQ2BGX/GuuJUYN3P/0Eu4sUKQ7YhIA5AdB8i2WOMWEN5tCs/
	 gnzNeNuMkE5BLfWmBodPoiBf3SFFArmY+zc8v0AQkccvgE8OCXjiLgfx5QoX9r738FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B2V2B/k1";
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A5606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 891A5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2V2B/k1
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-483d290f398so3252794fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933609; x=1795538409; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=;
        b=B2V2B/k1ENbb5cOuJVzSrspC/eEsnIWd7CrCELRHJMLBanLffRr8bSll/DACeB8dp0
         3R4M8j3GmT+BmtoZdNBF496uEJ2ZyG4Kj+2MLbJB/dXpt1YUgPNp+gHAuPd7T7JcDIdA
         wMSFRqtMqsxM7EcEIQYeSq8XOOqXYZwArRxvoq4a2kikVjzbLSO+24bCK8VRxxcVP6V0
         nbW+8U5M6vNd6M9UqkvaVeFuWRxLYgCnK0kHqQDrj5MS9dBzY6TV9H6/VdmfC7osJSZx
         4RniRUfABrBHmj9yJQ/THGAiNnW8O93VBmzE83jnEWXYRZx+wK6ABAWLTEPDxJxWk/hM
         jAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933609; x=1795538409;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DV4b38CcVigt3fSdaqPuGNDysKZiLQAbgGKBk8RFyiw=;
        b=cBBoukFZkeWzj1HsTmn2xSIbjy6/oquhkRgg1772121LVYEG9eztLtMLshLdvqJzZA
         Du9LOKVgu3EP7q9jcskAim85ntZ9Ny6hJNCmfHp8+ba3ADm0aF3cEGIPMQWePy0M0hv2
         OY4xw05DsXfLlcKq+qXWHUgeKIJ0fNAdC6hG6rTLTGhY3HqpXiRBACW2aozUJSyiUVMf
         ktxZU9BvB594Cly3odySNqfg8qhZ+FQgJkAyw4ot+eeafN4dflfHdN1IyemVHR6p0BZx
         kT57UStCWxpQR5C9C0mrZB77qhdDDWd+aF/AZTQo+XeCUzlwzEfVRAlisX8xOna+obBi
         N/OQ==
X-Forwarded-Encrypted: i=1; AL+hErFloldXolPIoihoKrAZmSzh8xC08jLL/kC286k4MoTWfvz+4JGNcx4ItS5v7l4tHUZ5Ql6XMqI65SZQ6mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rb66CMhSw6c1LVhV+vxEdQehCsVN9qrBVAEG7eBzb1ekxE8FA
	JUoawHl6BUGIIVz26spoKLg/9YIoKH0B9VjT0R5S28WgGq9BcOeVdPwQ
X-Gm-Gg: AYBFou1b7i0Hkvq/58kA0gEdvN7DRYAOQ32LyMzePJtSt6QByfe0171S9aNA9VNUlee
	pPOB7tC1EbJyK3vbzI2r5wCRoHoUM5T8mOACVn2Ksf1c4Pp13CQ8PY9IZYMBPcG12c+53udCCMW
	57zGfEgzc9GU+UNwafnxcYYGn7zTc/gCHJzHe7HpnNzx1xywp7Oc9sR/3ZcF74oh4W1FN05Cqg7
	P7yQhinbfSEFHhnt9xMhLhkOvHtJRJq5j5cVzWmp0mvqwqW+e9TcJDu/0zzoxiWjRVjOonGo04s
	+bdnKqihpxsTpsz7plxKkzBrQqHoJu3nEZCJPY99bFiEsgMGc4c9oefcUX/HU9EXACqBPd+WKOp
	9Yj1XZ+ylslKkm0P6rZWJBTCXfoFHvPO1RPABwrGI9+M3AcsJ94M7p3nUI+Boznb9UxqDl7YXzz
	hxpJBdvKEe+d0foeaPcqguEv9fkksy5lAzIwzcVVnYr7/cUlFpr5PynOG8f/0H5QWz71yJSADV9
	rRGi6NX9/Ru1ydiznwznMYXJ6s6rbw/eo+McyS2yQmEOnglDHWK02DFP2e8aJ0EVx3OkBR8hvPC
	Nfg08ZcOpJw/a7In2Obko1446r+NTLEN+q86Ib5WP0HunWs7jXxD0FteDllGVtfxsQvyZOhnHiD
	muJP7hVD9/Vfa2DUiD/wPCJHOSeoDSh4jDlPqpzsLel4xY5lMPM3AaOTjCZoOD9ANd26NwEoaCM
	T43+H5AaT5CCuoYrV4Kvt4S9/iiNB6qLCbng2biqCBTM0mAS5XtLKsIw==
X-Received: by 2002:a05:6870:392c:b0:485:d31b:775b with SMTP id 586e51a60fabf-4afdf3e5cb1mr12548756fac.25.1794933609320;
        Tue, 17 Nov 2026 08:40:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70e175c93sm36148fac.16.2026.11.17.08.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:40:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 09:40:00 -0700
Subject: [PATCH net v2] net: stmmac: preserve RX checksum capability when
 offload is disabled
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-submit-stmmac-rx-checksum-capability-v1-v2-1-059f9499c386@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBREr0L+2m9slQquvIdhUeoHvlogbSEQw
 t0teAKT2cxkMm8W8OSYPNySBRyN7Llro5GHBEyj25qQn9GDPEklhEjRD6XlgD5Yqw26CU1D5u0
 Hi0b3uuQPhxlHgVQpdUmvWZbnEuJa76jiaSc9oKUAxS+Mey8yYWNstYZ96Ny8/xnFXv4bHRX5W
 qpKn1WWl3SvrebP0XQWinVdvyK8tL31AAAA
X-Change-ID: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offload
is enabled after programming the requested state. A zero return is
therefore expected when hw->rx_csum is zero.

stmmac_hw_setup() treats every zero return as a lack of hardware support
and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
then reopening the interface loses the saved capability. Subsequent
attempts to enable offload are rejected by stmmac_fix_features(), which
uses plat->rx_coe to filter NETIF_F_RXCSUM.

Only clear the capability if offload was requested but could not be
enabled. Keep calling rx_ipc when offload is disabled so that the hardware
is still programmed with the requested state.

Found while investigating RX checksum offload behavior on H616. Maxime
Chevallier reproduced the capability loss on AgileX5, CycloneV and
STM32MP1 and verified that this change fixes it.

Fixes: d2afb5bdffde3 ("stmmac: fix the rx csum feature")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Correct the Fixes tag to reference the mainline commit.
- Add Maxime Chevallier's Reviewed-by and Tested-by tags.
- Include the discovery and hardware confirmation context.
- Link to v1: https://patch.msgid.link/20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 25894771e9e9..e162976be2e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3723,7 +3723,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 	stmmac_safety_feat_configuration(priv);
 
 	ret = stmmac_rx_ipc(priv, priv->hw);
-	if (!ret) {
+	if (priv->hw->rx_csum && !ret) {
 		netdev_warn(priv->dev, "RX IPC Checksum Offload disabled\n");
 		priv->plat->rx_coe = STMMAC_RX_COE_NONE;
 		priv->hw->rx_csum = 0;

---
base-commit: 5e9b2ad9b8384cd3c417cd5e2c3bc7eee4a72791
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
change-id: 20261115-submit-stmmac-rx-checksum-capability-v1-ef6645788992

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

