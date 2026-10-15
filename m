Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAA93A9612
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093789; cv=none; b=axUNa36DrP07LO1N7j1x6g0YD5P7h6x9YxTp+M4lSBF8xdGYG9Joj2ErS2gpBXtEUNX+/dbtDHudJ+k/jEN0vrgUmzvSlACSu5ThPEasnmTWePKrXjbzl2H7KKhV5e1+jReP0j6hOPDTEMqR49eR+UOMfK7uyrIHJL+5IJjcYUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093789; c=relaxed/simple;
	bh=lt0aaY5L6+HzuSlLyKVL+nE1UrL+fC+kf8+i1evj5BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ta9752XHtEMnoWMRzJQzo6Vi7a7+PNTh/Qb/Yh97+hFOP+mQPqI68K5uUEiby3Hjwl3Rxue+Rol8J0ubVDt8c9fA05LRlKlwQ0UMVuHFloQGuU8iFJLQ060/uAi/zgYJfuLIa8Tm/sz3pjh7kIx19eCKSvKaR+tTQJAcd8c7B58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idGhZESb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idGhZESb"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso194503266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093786; x=1792698586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fy8lkGKobQCb50zP/q0nA2f/wP9XA9UQk+HvRGjW/tI=;
        b=idGhZESbXAGCwGYCM1FKqO35bhO18YG1924+dXSVRgOL4ai9mI4/SpXE0p1azI0xi7
         2F3OxAmJPE3+nB6XUpOsjOkrkWkNKVjr/cDaGVr1Esgj+P6huqnYNzR3vyBM7OzITjb7
         Sw28wPFaXRkHP2P1A7RCy3dhc4A2UMWbdprX46FGwyg8MH9TCJL/cmsFLOfhGv8+H4mx
         eTOtyBFPtYB1LABBIjaC6DKpIORdJhsfcQkb3w6RR18DaQUqfD+4k7e5RTGTA8aSaQm0
         aKOoAaeBOa7GaEq5A5enyW3UggGnrqJQAy0b2Me5RJcWQSe9nq/KNOTelPxrhKx8ZkRt
         ZSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093786; x=1792698586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fy8lkGKobQCb50zP/q0nA2f/wP9XA9UQk+HvRGjW/tI=;
        b=dnTpLwbYlvOTYpI51cLq1N+LfMz2L9Pomo1oXnOIOjqWMIVsMvsuWwH1tHG0bs/Ewo
         oNwyK2PUbRPLRSLK2ihVcd1URjuuz6wjzngaWXYElnOZbLxwfCTLYPaPUY5s6IH0xZVb
         IeNmH9YuvKtSpCT6+qVNO7/9qeOs9qDx037P7BXJbZw0TG0S43fhkzDSzBiS+7HlQ2NQ
         B0VKd/T2O/n3OwMLplx4SWhbDx+mEPxXEEG/eXUoUt50ONA9xVg2Pd8j8xUC/ny5qexx
         BJ5+9k+sSWdX6/nU9iRkC0HMFqE3q20ZBjjE7NGdF7gMTWch3z19IZWcpshhts+JPYxR
         cW3g==
X-Forwarded-Encrypted: i=1; AKwUvByMO1A4QRndMn2mtoUW7HlNks0ukkxuHxMKG1k+TRi7tHM2z3XYmjKrAmoONueqKCeaWtZ942fetk+P1OU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMIk+qKpl2SthNiutQ1qGf9UllA0jSKzxUfAf8g0bJ7xP+ZNaQ
	bC9T/Id62i3KvulHFfNviAhLJAl/8vI1J9+6IBqlaTiTy5R4xVVD8wny
X-Gm-Gg: AYBFou2L4P8in0okqtM51FZls/1HwiSx2KcoVwNAGuxX2cHiTTjREzowy+XqarcvVCv
	OJRUo2k1pHE1ESiSlzwUpncfsGsiNZMVFTvBCAF2jHwtnx1A+0dWEy4jBLgASvy7ckgSRjLhYay
	aAdNNAP+RxV+0Z17RiP19fKY0QzeeGGv3ar9Ub/lM2Th14MUKs/P9q268hE0NSWXdeFBY0SStfz
	cY6TqG9DQk1p8t7/ZTQp7rJI5mVceMBEnr8UBKcJms7iBbBmq+hxuTumryi5R0gp6/Pe9E+27CR
	W2b3Wq/eeh2aUJE9shT3J2FWss0rvxEZZZ5u+SVJMa1/0zNm9v8H00PfZargPM+Ii4N8nfhtZ7S
	ub4gVkh6bUOOjxfegKNVNNaGuAhxlvHSpoIRV124TZguZe3rpdvKtwS16AIxyoa5OBPWRnSLPx3
	pWER9JoOawEVo6ChobnlrbJjLHXJ19TJXFp6C1E6pmrNh2E1bkxWLABGjiZS6XGH4TrzULnQX92
	S4U3leGecjgcabbgHuFZyyU2g/rCcJWyMSHsNOk+MjB48yNZrHut6dPKTgFjOSp3S555PDcHA==
X-Received: by 2002:a17:907:7294:b0:c29:63f2:99bb with SMTP id a640c23a62f3a-c31aa0d3641mr1974240166b.47.1792093786134;
        Thu, 15 Oct 2026 12:49:46 -0700 (PDT)
Received: from DESKTOP-DIIS71I ([5.18.140.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9e44sm55521a12.32.2026.10.15.12.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:49:45 -0700 (PDT)
From: Rand Deeb <rand.sec96@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: deeb.rand@confident.ru,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	shda@confident.ru,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH v2] ata: libata-core: Ignore forced transfer modes the host does not support
Date: Thu, 15 Oct 2026 22:49:35 +0300
Message-ID: <20261015194935.1497-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The libata.force parameter can force a transfer mode (pio0-6, mwdma0-4,
udma0-7) for a port or device. ata_force_xfermask() applies it in
ata_do_set_mode() right after ata_dev_xfermask() has limited the device
masks to what the host supports. It replaces those masks with the forced
mode without checking the host masks, so a mode the controller does not
support is passed to the driver's ->set_piomode() or ->set_dmamode().

Several PATA drivers rely on the host masks to keep the mode number in
range when indexing their timing tables. ata_piix, pata_efar,
pata_it8213, pata_oldpiix, pata_radisys and pata_rdc declare ATA_PIO4
and ATA_MWDMA12_ONLY, index a five-entry PIO timing table with
pio_mode - XFER_PIO_0, and index a three-entry needed_pio[] table with
dma_mode - XFER_MW_DMA_0. Booting with libata.force=pio5, pio6, mwdma3
or mwdma4 makes them read past those tables, use the values read as
further indices into the timing table, and write the result to the
controller's timing registers.

Make ata_force_xfermask() skip, with a warning, a forced transfer mode
that is not in the port's PIO, MWDMA or UDMA mask, and keep looking for
an earlier matching libata.force entry, as it already does for entries
that do not apply to the device. With libata.force=pio4,1.0:pio5 on a
PIO4 host, device 1.0 now gets pio4 instead of pio5. Forcing a mode the
host supports still works as before, including a mode that
ata_dev_xfermask() removed for the device or cable.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 332673257056 ("libata: implement libata.force module parameter")
Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---

Notes:
    v2:
    - Skip the unsupported entry and keep searching instead of returning,
      so an earlier matching entry still applies, e.g.
      libata.force=pio4,1.0:pio5 (Sashiko AI review).
    - Rewrite the check and the warning as suggested by Damien.
    - Update the commit message to match.
    v1: https://lore.kernel.org/r/20261014125916.1975-1-rand.sec96@gmail.com

 drivers/ata/libata-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 92233fb25..578071eea 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -434,6 +434,7 @@ static void ata_force_link_limits(struct ata_link *link)
  */
 static void ata_force_xfermask(struct ata_device *dev)
 {
+	struct ata_port *ap = dev->link->ap;
 	int devno = dev->link->pmp + dev->devno;
 	int alt_devno = devno;
 	int i;
@@ -458,6 +459,17 @@ static void ata_force_xfermask(struct ata_device *dev)
 
 		ata_unpack_xfermask(fe->param.xfer_mask,
 				    &pio_mask, &mwdma_mask, &udma_mask);
+
+		/* Make sure that the port supports the specified xfer modes. */
+		if (!(pio_mask & ap->pio_mask) &&
+		    !(mwdma_mask & ap->mwdma_mask) &&
+		    !(udma_mask & ap->udma_mask)) {
+			ata_dev_warn(dev,
+				     "FORCE: ignoring unsupported xfer_mask %s\n",
+				     fe->param.name);
+			continue;
+		}
+
 		if (udma_mask)
 			dev->udma_mask = udma_mask;
 		else if (mwdma_mask) {

base-commit: 045958acaa75205b31578cb22c4345e28dd2e4bf
-- 
2.39.5

