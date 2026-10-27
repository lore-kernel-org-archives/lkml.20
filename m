Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113102;
	b=kpeb245u9Fq5O4y8PFge9uO8NoZhvYtOQ1i7etTf2tx7II0TWpLCtPq6xkSSO2MBdpYY
	 YbapzT/nR+U0UkZYsmw+JfGWYrYuyYK27IqGC+r+iY1z9+tLReT0gB8ptvbV9jMmDbuoo
	 5nMej8HUOHzVpSW6jqsxpRHILnl+VkJmkw9+8vxiNDumyBLWt9B+eJgCQu3XsDhextaKq
	 t4Chv002qaPEUSae8F8ZLf9/Qed8ZEYcFvGdkUTcY2rkZS6T85dxBW7XdDIaCQfryaO7j
	 6kf2TTw8XMEmgUPKM4U/asDvJLObhRv/opBk3IDyR3TbVHO9iZGQMstkfJJkRoKz3Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113102;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eLkrvupW/KmWxnLh/+P+Jcl9GNOC46NVQmQ39zYMcUs=;
	b=whcdcrtCnR+P81Cv5KQJrBDgGVIsWS1NUmsT/huLxiJxt/BuB64AhOmL4UvOmjGd+Y27
	 TzqRRnHf8ziKPHQGCWRJIBohr1PFjOvbJADpVlMH1q5fWiTswdkhqj+xtQHq1bOHzbMxF
	 2t8Bv1ig24TDRVsEgk/QkxjJcd+vcrpjMI1nTX+fyBWl88QbEhgkcj4yPIDV/s33mzzin
	 44UloGRxoPzSPfYr7E8Y4oh+fjGzaqVUvX3NeZevDmHdkwV8FTgZ6REzQmCqqZ3Nu89mh
	 URRm3p0BnMaYRwlnWzce30xXXD6t43ofI7RgV5iGFVYL8HPpHi4Q+16CKOqWBqz+heA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="eN/jVnLD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74260A2621;
	Tue, 27 Oct 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=eN/jVnLD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE221F01825;
	Tue, 27 Oct 2026 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113101;
	bh=eLkrvupW/KmWxnLh/+P+Jcl9GNOC46NVQmQ39zYMcUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eN/jVnLDW1C/xeuL0LfRHp1ZP9QeSNv4PvJlWhpErMi+PYzp+kx4nXfc00Ur4qIgu
	 l4CjDoSBZTdAKEKnQP2TfuajXuXR4iKRloQlQQoSGNfoXzwpRhvX5rvx4TTDuAZaFz
	 GYqlQfVMBiColfchlr7E6eytudaKpNXxR/6skj9g=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:50 +0100
Subject: [PATCH 10/19] usb: host: ehci-orion: fix the probe without DT
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
Message-Id: <20261027-llm-usb-v1-10-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, Elad Nachman <enachman@marvell.com>, 
 stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=Enm5jSUrXpywtO4aksabSqm+Hl9QO2KP++ClfBwtzTo=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr9/fGj3sXdPLq1/cKXzeP50edElZUcL3344fLqNQ
 14j2zQpsCOWhUGQiUFWTJHlyzaeo/srDil6GdqehpnDygQyhIGLUwAmUlnDMD/2tZp/pfHX37MO
 JjRciNr0OLY95BPD/IgtKx3vef80FtG1FNNcH3Yt/pfgJgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

The Orion5x, MV78xx0 and Dove board files register the controllers as
platform devices called "orion-ehci" (arch/arm/plat-orion/common.c),
which are bound by name. of_device_get_match_data() returns NULL for
them, and ehci_orion_drv_probe() dereferences it to get the DMA mask.

Use the 32 bit mask, as before, if there is no match data.

Fixes: c63fe1cc7093 ("usb: host: Add ac5 to EHCI Orion")
Cc: Elad Nachman <enachman@marvell.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/ehci-orion.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index eaaa49712a8c..2071c3d6e582 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -218,7 +218,7 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 	int irq, err;
 	enum orion_ehci_phy_ver phy_version;
 	struct orion_ehci_hcd *priv;
-	u64 *dma_mask_ptr;
+	const u64 *dma_mask_ptr;
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -236,7 +236,9 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 	 * set. Since shared usb code relies on it, set it here for
 	 * now. Once we have dma capability bindings this can go away.
 	 */
-	dma_mask_ptr = (u64 *)of_device_get_match_data(&pdev->dev);
+	dma_mask_ptr = of_device_get_match_data(&pdev->dev);
+	if (!dma_mask_ptr)
+		dma_mask_ptr = &dma_mask_orion;
 	err = dma_coerce_mask_and_coherent(&pdev->dev, *dma_mask_ptr);
 	if (err)
 		goto err;

-- 
2.56.0

