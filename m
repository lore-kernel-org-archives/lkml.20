Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C2A49B1EA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295288; cv=none; b=KAWqLBmfAEsVSKGCUgOuFWLLtoC0v0qTg61TRvX0JhUrXd2pJy2ka2x8YJVDIvkRuFC8wwDqhRCMkZYbfxggm0UnarAJ1OO9Xgyg3PxsXYQ4AQ3zkmeR2xpDEeDTeLhA+g3b6F89QjMrSs42auD9bLTzg+lRk1KO2MwYzlJUVso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295288; c=relaxed/simple;
	bh=4I1DukrCS35B88zO6iruti94ZVm9wd5gNKVwfpFupb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHtyFg5iA/pGFBICGBSGlL9N4LlSe92+tLBOOg5O3GkEE5rK9hyUj/50UqbuYPFRz6lkyPQqBjPqPOf9aGJSnaDVSgCDd0swf+qpsrCd0+H5uhUIUw+XnobYcSv+zvFstM+lhdxFJnqisy3JiXj8mmuxLMCbjUoIJpn4YA9aKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoVNxz6I; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoVNxz6I"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482e067e908so284269f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788295285; x=1788900085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H47NzTGKEo5jxThIouZ6Of+htbmdYJ+s/sP3vnCuWlA=;
        b=NoVNxz6IFk4rFTkyunlsLtJlfX3c3eKd2mKdMsxn0kjo97MmhKXGCNmBphdSWHfWeU
         k7lDUjSueitiVYEpeQSne5N9PG5C7cvgUkcgZmOHh4RQ4TovAmFL0uBpbqUblnHIJaNg
         nq+HXA6k4AdIh6mpdLApryneGdRqGIXe2TPFkuW/jxKwZkCOnRX4eqvLgwkic9939QoN
         OzAvH5DsaSgd9PDIqeLTF2BIogXHQnd6n33YocH3RIpsYRWk4YQcMp4cJKhquVvsHigQ
         OePwQlh3Tb/AP+6o5eLt+bXMCsOBx2f1DlQRnaYQ1nWgfcII0DFXcNB5OiCa9cdWhWo1
         A9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295285; x=1788900085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H47NzTGKEo5jxThIouZ6Of+htbmdYJ+s/sP3vnCuWlA=;
        b=Rk2BSpznqRA2JPsPFngaw8gEuJH1W4Af5pCRS0PmbCW5vWB5Mahz2SANRUB8qJPRIQ
         5QEDijePxe5MiumkJySipfEkUyBhB0NusNf0dnoO9Al8zejl58miikE1C8XZ6eG4ReGm
         cXgo0BazXoSE55m5DoXbvEcMH1gEP0T6DW9HAT2j3MDk+VrXk1yCj6WcT8sb+Ayi+wGz
         WQhVB5y+qrR2kPxfNIYuOj8QRnLaGwF7VpTR1LMjgXmgxeU+cuU3j9Voy4/GEXcVtFf6
         ohlfTuKwPS+E699PcBtRvkVMgIk7S0Y2iNsRCMLmyXw8sPdpjaMX1Nq+25dscndRT+ck
         D/dg==
X-Forwarded-Encrypted: i=1; AKwUvBw5Ij19Gyl1QZ1oG99x07bagN95rfr94Odm/unVQ/SPeMdFjIeFIX2Bk2b5kgIk9FPUVuveyaH7kaa9gAc=@vger.kernel.org
X-Gm-Message-State: AFuF++kMMhKjmRDnH9NsIt9iAqHEVoOKX3gAZXuh7HJ5bGQYOEsRbcsE
	4R44N1CnyaJCsGWC6WjPYOKnBWTTyIyJyGu2X3Ymc03lMPm5p0Taer18
X-Gm-Gg: AYBFou3xU6po2Nn/DejjVs59gXJ/oxPoVTf/pO1zS8bqU2EbNISJN6qkIk7fUeOSZUy
	EZr+J95tcskOHcM4ZcizB1UXabcW2ZJN8MxCdfcp2KsmAAmACSSgSEVJq/NQCnr/8x8I8hMjZJD
	o5B+n1az/Gz5kW67JWszaortJ8CbViulHdYdrkADNiWtPvjxsG54yIeCJ7/9piwJg+ro4cD2bYr
	dKCw4YT+PsCehMKdE4vffyU8FLPGZ+Hcoo98lL0mbvfRsRsfYHkQHjMFbz+jtj+gHzfgwj04wLf
	w7SflLWUTpgpZbI7VjVofg/cSxT/ylwS+Gconurr5I4nq0Z8eDg0iQg3fzw5rJJaLErqqUlU6PC
	rbVmAuxjzv63/D1cpP2n/pot0fcxHjicKQYqv2M/6Vic2CTgjJDaqfhlML8Oj5wLGnhtpzu5ZmN
	/vuOOfSymzB8UOVqMnHUIoTCEXXQy7Fo1goFrx7tbBLfl4TsNS7wiBYc3JPHUQzmNu3iGpB8cX7
	CN0cTye8fzdpiJ8HNohrQDvPop7fqp++S1oPK0MyrYsP3KVhJgoY9fJSjZA9/2MwAA6bms=
X-Received: by 2002:adf:e18e:0:b0:47f:e721:1f77 with SMTP id ffacd0b85a97d-48488f0f80dmr24176f8f.13.1788295284572;
        Tue, 01 Sep 2026 13:41:24 -0700 (PDT)
Received: from cdev ([2a02:8071:68c3:bd00::8998])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm1511223f8f.34.2026.09.01.13.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:41:24 -0700 (PDT)
From: "Vladimir V. Kondratyev" <vladimirkondratyev2@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Vladimir V. Kondratyev" <vladimirkondratyev2@gmail.com>,
	Sergey Lebedev <lsa.uz@pm.me>
Subject: [PATCH] Bluetooth: btintel_pcie: fix stale cache in set_dxstate fallback check
Date: Tue,  1 Sep 2026 22:37:44 +0200
Message-ID: <20260901203818.112189-2-vladimirkondratyev2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260507203426.128975-1-vladimirkondratyev2@gmail.com>
References: <20260507203426.128975-1-vladimirkondratyev2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btintel_pcie_set_dxstate() falls back to checking the controller state via
btintel_pcie_in_d3/d0() when the alive interrupt is missed. However, these
helpers read boot_stage_cache, which is only updated by the interrupt
handler. As such, if the interrupt was missed, the cache is stale and the
fallback check always fails, exhausting all retries and returning -EBUSY,
causing suspend to abort.

The fix involves re-reading the hardware register before the fallback state
check, consistent with btintel_pcie_resume().

Fixes: e57362f4911b ("Bluetooth: btintel_pcie: Add support for _suspend() / _resume()")

Signed-off-by: Vladimir V. Kondratyev <vladimirkondratyev2@gmail.com>
Tested-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/bluetooth/btintel_pcie.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index fda474406003..7fca8eea6e01 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -2778,9 +2778,13 @@ static int btintel_pcie_set_dxstate(struct btintel_pcie_data *data, u32 dxstate)
 					  BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0);
 
 		/* A hardware bug may cause the alive interrupt to be missed.
-		 * Check if the controller reached the expected state and retry
-		 * the operation only if it hasn't.
+		 * Refresh boot_stage_cache from hardware since it is only
+		 * updated by the interrupt handler, then check if the
+		 * controller reached the expected state and retry the
+		 * operation only if it hasn't.
 		 */
+		data->boot_stage_cache = btintel_pcie_rd_reg32(data,
+							       BTINTEL_PCIE_CSR_BOOT_STAGE_REG);
 		if (dxstate == BTINTEL_PCIE_STATE_D0) {
 			if (btintel_pcie_in_d0(data))
 				return 0;
-- 
2.55.0

