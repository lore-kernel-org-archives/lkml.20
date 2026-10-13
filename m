Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36D652BE3C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914058; cv=none; b=h1yCfE207Ej0UGHTugtsL4wtRvkp80AC6FfCtad6T4iYt64r6o9ztkoPtl/s0Hs7B3kLuV4G5jdweXdKDA6OM7VU+a6fxjBJ6bV2zWrKnuzb6m0AFxRBeXicF9h0k0qaWCMWlUEEEGaBgUqmYIaHmPgNThP3WwhXB6Bpjc7QftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914058; c=relaxed/simple;
	bh=0E6bGmEo1GwhFi1se4trHegbmcoiealEmKFcFtFcwB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hrYl7utTMJZ8xPpahPqSbZq+BlS3Wn7HHiWKMfremjMfJuVkRk9Y51KjZo0Lkml1iIapsM198mHMOFjLdhNzP3IpLraHzaLNYudfZw6l4RN1mqgoOTpxxoDU06g3SBLL+kA1nbmI5NYMbG7qlbXrFI6WN32OeDhpiuX9oM7WwI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZJQpuVm; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZJQpuVm"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6dcf573c429so2119876eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914055; x=1792518855; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AoNTFArShrIuErsfoUzGL9W/LuOVl703X8/dX7lKLJs=;
        b=nZJQpuVmLIblfd0MZMstN6RSp/LPMXj+IlHWCEmIYjKpfbEmjNTwt+JhMSVccHpMqf
         ab/qL4ATwbTkf+50Bv74dgSv/hoWNEgNrECasxaUCdnK+3Wqnn1Lwh08UAA543w2vIJU
         sx3CF78z28e9zYs9QhC78OshFMUSEHY1CcCzbbbftYEN44yORFyC5NV7Z5o4aaSYTULF
         51+a5wYhj50wPloxApLrQx1kLmE+OfvZG/bUtbBOETos/ACuQ3JPggSS+/b5SfFeg96l
         H7OxrVASQ1tId14jy29K1t7/QAIOFYonye9RGXpBZuGtwERbrckckF1rh+wPlGB8vZMK
         /mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914055; x=1792518855;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AoNTFArShrIuErsfoUzGL9W/LuOVl703X8/dX7lKLJs=;
        b=0zLHHQnsM2d9sWpNLxzn0X7HJrtnKLetmhx0yif6/yT87yTSizg5wOS/hPxrPJIJzO
         bxidAwm+rlVhhisG9+HdIc5qq6Xeia/wdWP85ynG+dv9/RvCIL9qLF+jQt0GSqZA4WDp
         mmKgZ6NDWzpns+7AzOmZeZx88cDhc9JNqyXP3YReRiSbLtI6xE006qPkIWfibF0Ya3Eb
         fjmqbF+1RbQK1Tk+6bmo/qGK7lwEk0xjftH1+FwruvFOZ2HuDNw9FZPI6E8tJk1/iaEm
         D+02xSyVBd60vPkz32ctSE3D0AvyjLB7dU2FwfMPiTWGKInIfyyqj+fWU11joe+oxVBI
         l5cg==
X-Forwarded-Encrypted: i=1; AKwUvBwiYo0KzrEtxL70XfHdRh6a7SmSrmhHbynowCLm5OdDxPkO8tAjMqg2cpC2ttL284J5Gbe0jEAihdf/4GY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1y58N4lME+vtWjTWK8SoG1922q2BJsCFbarlXtCi1ZhjZlCRm
	pbasDuNB+XYCePtS2bUpnhe4EpbllLq5jXAN49u+NjvKTqSN6Mg2yCLS
X-Gm-Gg: AYBFou00659263KcSNjwvRjbh8OxQGxzBObmTOqAr242kHVLNbsav0xdA417ggZyakh
	vWxNXFL4Za1uq7BWcmhlHkzU3oJ7/SyoaMax6Z/o9d60wYXo2Fnoq0c6e4/hSbxb5EIqlRiZrPJ
	mF77RYiATa6OktDTzSfMqZRzGqqgapCSL7EhrQmZ8XQVv4aMNfrzbbH2xHXg1TrVarPLf5qDwOv
	76xH//AN+oj98MSwoBv+3Y8fXC6P+CiUfaEm22yqMwAKMktOBXrssCrB+v3EyEGePNkDrQMysdp
	kx3YEYs3Td6gN1dPqCWKwSNiMj4GM5iXHIqKGXv7BF6+6/t3nuDPIQG/qBc4Uewj/YHyFTpNToX
	ijKwFYC9vTkCzmsFEjudFQU02mzLfsh4PxVqJ4C6W/cHtvj1CrzeP2vCincpMd/sXOIMtl++LeU
	4b45RJwx9jX7fVar5/8Zxb5ySty+OV/irOloqWsDGRgAF3Ud04Uyt7z48H4Axt0fqokuZNig8ox
	KYEd6gA9xtPPTC8mB7eelQGY5ILf/W4XVSrvNsa9d9hj1Sb25j1UzVp1+IliJosX+5yzYbHCyun
	4YmVGCC4fVCPEpXhSm16jnukU8GOJNRByTaaX7e3Tv0wiklb3U4sk0syvMeG9kiLNQqHn2FVUM4
	1Vs00LaHa1D5usHNamDiKgYHq56C2zr4K
X-Received: by 2002:a05:6820:a292:10b0:6f5:467a:aed2 with SMTP id 006d021491bc7-6f5467ab923mr3853137eaf.5.1791914055335;
        Tue, 13 Oct 2026 10:54:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfcabc34sm277356fac.15.2026.10.13.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:54:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Oct 2026 11:54:13 -0600
Subject: [PATCH net-next v2] net: stmmac: leave the datapath running for
 normal-size MTU changes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-stmmac-mtu-fastpath-v2-1-1e4ce8137689@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OwW7DIBBEf8Xac6kWg2PIqf9R5bDgJUYqdgLES
 hX534vcnnscPc2beUHhHLnAuXtB5i2WuC4t9G8d+JmWK4s4tQw99ie0CkWpKZEXqT5EoFJvVGd
 xMkYqpkk5i9Cat8whPg/rJyxcxcLPCpdfkvn+aDP1DzsqLPyaUqznDgc3oLQOZXBWa+XQEmuel
 KYgpRrIIBntzeGaY6lr/j6ub/KQ/ftyk0KKMI0qqNF4HOXHNVH8em/jcNn3/QcZJUMJDAEAAA=
 =
X-Change-ID: 20260930-stmmac-mtu-fastpath-68813ead3b90
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolai Buchwitz <nb@tipi-net.de>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

When both MTUs are at most ETH_DATA_LEN, the receive buffer size and MAC
receive limit do not change. Update the MTU without restarting the
datapath.

This also avoids rebinding a live AF_XDP pool to a temporary RXQ. XDP
rejects jumbo MTUs, so all supported XDP MTU changes take this path.
Jumbo transitions still use the existing reopen path.

Found by source review while working on the stmmac MTU/resume recovery
series. The fast path was tested on Allwinner H616 with sun8i EMAC1 and
an AC300 PHY. The AF_XDP scenario was identified by inspection.

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Target net-next and drop the Fixes tag as requested by Jakub Kicinski.
- Clarify the standalone commit message and how the issue was found.
- Add Nicolai Buchwitz's Reviewed-by.
- No code changes.
- Link to v1: https://patch.msgid.link/20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 56d89a696272..50eaee656cfb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6257,7 +6257,12 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	if (netif_running(dev)) {
+	/* Normal-size frames use the same buffers and MAC receive limits.
+	 * In particular, do not disturb a live AF_XDP pool: XDP does not
+	 * support jumbo frames, so it never needs the ring replacement below.
+	 */
+	if (netif_running(dev) &&
+	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
 		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
 		/* Try to allocate the new DMA conf with the new mtu */
 		dma_conf = stmmac_setup_dma_desc(priv, mtu);

---
base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
change-id: 20260930-stmmac-mtu-fastpath-68813ead3b90

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

