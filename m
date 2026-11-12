Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481256;
	b=AMkum1KgG9/Z7s2kUwudjLbvjTw2p66+jgXLDqwaoknkESFE1vLmJWjkHBJj3HEqVR2f
	 SXe6z+APEBlTFgKKYOZGZFUyYJjZpRBPu9LwwZ1hI8UAvnM+pzMgxiM9JHt4Dd5Iqc3HK
	 EhkcYKZ2LgYJ5RMWeX3msVNbJusd+PmrUs0ekF7ut9I4/imjHRLxpxwbyrT2Dvl8KJUoF
	 EJ6RsqR7nZZseobNnluyjKhdDgPbez2z7ZHB6TXEIxZIq98B8ED5aNE9BzMWNDbyx59zc
	 e/JzQG1lwdSL168IxxMYGvpsA/HIjI9r1WHay59govLD+FxOkX2KM8DLUKtNL3nx/3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=;
	b=W0poStqsnPzFSgJnGCfoNSPFqHMdqPaLXcVUJpHex6BpUqQpaAoDB0t70awbQhZIUMXL
	 T+HpY7J2Fit8AWce8ezi4gpt5ub+wMZFlgA2bMxsbY8g/9IfpvwcJIL9s7Sa4bJFWBIZr
	 kBnymKT9vPU4b16PyxNpHcXuNIm0GPzm4uGdfdv4a3jBjD7UbmB3bWwOLM+Ndc9KkyANN
	 mJECEPElMRA2DNu9XeougulI7DwiOWYTgF07n9AgWdONL9dpg1TM4nQ/JecbBPX1hhH3+
	 r/l50bpl1Qlte1e71JRcj9GN5u2DkOTFjM7MKp1WvCbJ69MxUvmx0qvwPrpkppqKkMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdhJ9fGj;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363C606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E363C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdhJ9fGj
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4922dbcee23so2414862f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481254; x=1795086054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=;
        b=NdhJ9fGjjWuPw5JCs1r/oejGbZ+48guIbj3iM1cXzfO1FBxNy79Qpadu88znt2na57
         V6XPIUY06/H5QzbGEmPkL1DUrcNXNc/Y2yucfPvuGHutInK6TDGftWz3UMnPDiNmpRcR
         F7tpYNqFC7KshAm6zpTPOpeB1SvBS/9TjnI0YpIWDAM2SvfGshqw2GCWDPRUCemU4weL
         qY+FeDonC/qBSaFr7omXLZVGWReOIAfiOVBF/kmTNMu6u7YKdOXXlllgE+vdUMYv0PQ1
         tFBFsTdVaAb91uK1iVhRN8+8sy0C8o/UtQpejG0LVSO0pi8rv5BUeVzXUHr2juJzDRHG
         ndZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481254; x=1795086054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxR2EBq9n9MMl+IaJG5vLkugwr4h5iXfkxMLdL3JqDs=;
        b=EMpgKihPW83bg6KtazIyjOCPdSZJdtON4NCg6scNULZHpB4rCUrCICmnU1xqT2fokK
         n0LJYywGS4cqKQmvpq9GTOk1d8Keywb0dmxRp5obmW9qU8eeq9GSIXkxnKqlRZhqEtJL
         J7rQ6mZWiccSYkLKuXfGC8OSU/wPn+TPcDhu/Cf9b2fJxKC2NqkfR9/dGVolxmBE0unu
         CArsb3PRXt9tseoshjg5N0hNbjr3HaYM0qUW9+K9G2WtksR5LsZg7Zex+1q0TWvF9pmF
         H9SAKEynao3EWSUGVz6XV8H/YrU9A2jx7TPsuIdBElkmXYr8QpVS61GJ5wdTWPGp0SGO
         nZfw==
X-Forwarded-Encrypted: i=1; AL+hErGmRzaOzNnBOUgOEy9pzz54sBzj4onIEDa/OCAiqdjzTXoY7/iwu9TfBN550xJN00kpyFJciu8WdOty+a0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b89JNyEM8TPAmg/LnjPUUAhKXJFeLhNci2480WombO8O7sZ0x
	1ll3iDA+JfCJbv/3PDchXnARabfGxLLFAqC60hBcKeCzAAqN6ZlLtN1P
X-Gm-Gg: AYBFou2HWkbUkKSl9264mBWsw+fQTXAh2l5PPFxvjkXf34PDYA6k2VKh8KRBoS1Bt7i
	ZOVtR7Gszq0rS0oBz+8zo5O+tkFsLSX0+UG4M1AgpTt5VZVs4PlFzTevh7Kn6dFtT7Za1CVTQj9
	A/bJ/RpMfzpf2fd+DRwkKSwcPdgfDshfhM7vYP9nIMd7XMuTOeJ3ZtZsi1gyAKZaiaZppQuHNU6
	6Pc3Gs8vGbA4GX6ABYO99mgPmXYqsoZ7vUYBLQOv9ITsh9OVLFx88563bWL06t52wfRBdWJF9st
	C91IMRh61ukPtxolQRzhV94NTWGAB0d/buznoeBH09iengxin/qK6Xn8VNfmUTbpGueLgloWbpV
	NgkkJpKOSZ8wiJfpwSYqBVihvoEhj5M2u+6oXBSJYoK6AjriuEVLIQ56/jvw1wff50FKa28uxcf
	dA3+B+UDKBUmxWAV0HTc7VY7vNAdb7tMEFI8i3N73PNIQj8L05Dj2PJ2SgNUCLSOR9xTg4YxyzF
	f0JSI8qHeTLrWAbTGPDOLlKLUW+j1oMREHr9MHGJAZ6WxFhtwbFKgBzm12vvKS23LJ6XDOQp/kh
	TqcVcmGWxO1x/stHyPUWtuQJ8hUJRt4WsRygQs22bYeEoUApXeTQTmyf
X-Received: by 2002:a05:6000:4011:b0:492:e1a6:90f9 with SMTP id ffacd0b85a97d-499c72712e8mr9950467f8f.18.1794481254158;
        Thu, 12 Nov 2026 03:00:54 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f1772dsm16217812f8f.31.2026.11.12.03.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:00:53 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] wifi: ath12k: disable and enable the CE interrupts only once
Date: Thu, 12 Nov 2026 13:00:05 +0200
Message-ID: <20261112110008.1229-2-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath12k_pci_ce_irqs_disable() calls disable_irq_nosync() each time it is
called, and ath12k_pci_ce_irqs_enable() calls enable_irq() once, from
ath12k_pci_start().

Without WoWLAN, ath12k_core_suspend_late() disables the CE interrupts
and powers the device down, and ath12k_core_resume_early() boots the
firmware again. If the firmware crashes during that boot, before
ath12k_pci_start(), ath12k_core_reset() disables the interrupts a
second time. The start that follows the reset enables them once, they
stay masked and the HTC control response is never seen:

  ath12k_wifi7_pci 0000:01:00.0: Service connect timeout
  ath12k_wifi7_pci 0000:01:00.0: failed to connect to HTT: -110
  ath12k_wifi7_pci 0000:01:00.0: failed to start core: -110
  ath12k_wifi7_pci 0000:01:00.0: failed to reconfigure driver on crash recovery

The device is dead until a reboot.

Make ATH12K_FLAG_CE_IRQ_ENABLED guard both functions, as
ATH12K_FLAG_EXT_IRQ_ENABLED does for the ext interrupts.

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index 4bb14a95aec9..c92821153706 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -398,7 +398,8 @@ static void ath12k_pci_ce_irqs_disable(struct ath12k_base *ab)
 {
 	int i;
 
-	clear_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags);
+	if (!test_and_clear_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return;
 
 	for (i = 0; i < ab->hw_params->ce_count; i++) {
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
@@ -739,7 +740,8 @@ void ath12k_pci_ce_irqs_enable(struct ath12k_base *ab)
 {
 	int i;
 
-	set_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags);
+	if (test_and_set_bit(ATH12K_FLAG_CE_IRQ_ENABLED, &ab->dev_flags))
+		return;
 
 	for (i = 0; i < ab->hw_params->ce_count; i++) {
 		if (ath12k_ce_get_attr_flags(ab, i) & CE_ATTR_DIS_INTR)
-- 
2.43.0

