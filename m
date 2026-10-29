Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301642;
	b=RFBz4dvnpjcVsD5HHLfU+kegqVnmOmo6yZNNhpph0MHDBjAa3N8UGDQZHRhM4kUtc5nP
	 CHHBR4/tJ3cWDNkWrLwxwdRbRl0pGAoNwO/vRczTb+NbYMMu2nGRZDfHKpKg1HJZJ1r0n
	 lONr5TUTgxB20SfKzEq5VsrtzvTgz3Tsn8I/b84jF1OFn6KA2YEplj6+aSO36mSCG6q5M
	 i0jUARNtxNcPOLm0T/PbX6bG7SX3A68wYFSOtnG8V7l3+AbWkK/TjNUTbGTthqO822vcW
	 v1Nxzr5Tg7BwqDPBfJx23veeYVorQ8BNnmvKeGVDg5jWPyoidpJEAR7mGWfMi5XdVMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uJqHWAWYs20QmlFZO2Jbc5pcUFuSp3a25Mlpnz8BX2E=;
	b=KNgrmGjGFikesWRappVUernI/OiUF5M/lT4jVxL7X6QjXC+tAyWUxdpG36ElFT3Q4/bw
	 anVZu+sRxCLyl8J9ljHYGJVqI0QROxoUcPN9KDpCE7os8zro0UOyrJjxP+hJpuZ+A8TzL
	 AH4YDns5L5dD6sLL/u0w15QUwwrLByk9bxrDoPuqt8ZJEqZsmJzi7URxJNewsXI/rCAaZ
	 YEVOD87xgpwY+HXpRIpWIacLpbddH1COZqIgFCEsCWhLlC6Ngeu7Z3wspk07rZKV1aEod
	 PkfbgNriCTjy8nb/PIyRyVHsO/be63AvTcVP7ju8ximqXG1n1oIGGqis3XSdVYcuBLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEgQ5Ebs;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A32606A333
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A32606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEgQ5Ebs
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67989a2f9bfso1907915d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793301641; x=1793906441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJqHWAWYs20QmlFZO2Jbc5pcUFuSp3a25Mlpnz8BX2E=;
        b=TEgQ5Ebs2QXPP4igGJnoTaxhZKp07UcjkF2eZiy6XE3wWw6gnMngFPJuvVcQbDAH8V
         P/DE71rVaQBQa1D5LUEGpq2+WFKZQ6M0M2q1fXBbwi7XVU3pzNLeZHS67nixJOwETAZu
         oj0tIY4zS8iyWTRnsksxo9pe+SWWpQ31JINLG+WHMqYOq3z0l1O8GYpbG8rD79B24m8i
         NqrLRlnbtTZIMRuwogmOsUAtq07CId2qcqO5dt8VqLF4NrAF+4usXpLBN1UGVc44BVpn
         gOpOg98yIOQFo4I4fhxj/zZM6JGaIRN8x4UMhs31Derlm1NTDINN/eAgWTj1qrovOoV+
         z0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301641; x=1793906441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJqHWAWYs20QmlFZO2Jbc5pcUFuSp3a25Mlpnz8BX2E=;
        b=TbBa5JGkpnRZwjUaTsyKPge8kQxzH2YTPGUTYOPQUzi810WYQr0UwVAclaVJoLWfzY
         KnQwWNOHxFmeivRRx9PTR/QMvRTiFzJcO/npADtBXHjeVRThJY76nH0jYLqLjAjQuDyU
         EtFNDp78eJ3VGbarXafvsLqCoJ42d6mLCbWH2qHNqebVUXnkclXW7f7kyUO63SCuaVM3
         F3zy+Q3SZAv/xXAEGPE4XvFSoo/Ekqu42n4nFX5KXQQyS1bfwi7XACP7/wbhFYOJbbIo
         gZcwgarZuyjTOiFu+ratNuJRVlJx55HKXSBLah463dJQVKP1UFBIxBcAP1Xh4FvqEsj2
         QwEg==
X-Forwarded-Encrypted: i=1; AKwUvBzad+dKPhPdFyoFQpRNKZ48523P1QYkveZO0+N/J/Y3iexYbX1Cigr4Ge5atfXpWEfipKJ/L23HcAeRb4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0EDGP8TXyH1h54xkL7bxWWiBR4LCfQMInVBtkG0ONR8pLFvDC
	psD24hxMzrIq0sqXRpqY5j3Kerm04FTzGZVsOfX+iapSVwLzX5bRE9Yh
X-Gm-Gg: AYBFou3VSDugM/PZunbH98r15m2DjvsQrExxvizK0+sGkbwuSvnroAxiHeeN5arXujK
	pt62DHsi55z9gvD30FtWRu3el4NtwWv4wLJt+cbl0CAkfMIdKe+/oZcWM+RhZFJdoTHguoisoIT
	oBb0LpES8OCRTAlqFCh7hJ6MNKKZ1NTjipGrHfkDiZKgG66jcsOJ0tiqxP7gleoKiOdl0AZdr4l
	0W/7NimjX4FfW3C2jIvnl2bwkunu3t6dVbYXIUicupSZjPDZNgG/ijK4Rx2eRhA8+Gfd/5EbJt0
	lpKZ9pN/CvvSAIpo1LvVwizGRyn5LOJ5hz7juORgBN/p23ZfyDKjL0gx6nbLtP9ATSuF0t/SKgD
	JhC5NJybtWPDH7Mtf5lBJL78J241OSuE3xih3MV54whtRSamACOWtc78ACIWPKic8ZgzzMW1SPs
	ns+dhFEXeSyHV+XlifqMajppcq3u7m7aNSRKivU8NlBguQFca7e4aXaEkAAghVhUIBM1Q2JewxB
	3buThKdoQPvxVMPx1uhhQd48hj8J6T0Rj0zt1TCUeVnGaPkAJuiOdYUgrtQtFefeCrO9fGXjrhi
	XPMufCRO5+13LfsmOxT5Wb+Fqvst
X-Received: by 2002:a05:690c:6602:b0:8b0:a957:80a2 with SMTP id 00721157ae682-8b1b5cc61f9mr38215067b3.41.1793301640787;
        Thu, 29 Oct 2026 12:20:40 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:43::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b4ab040asm750707b3.14.2026.10.29.12.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:20:40 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Alex Williamson <alex@shazbot.org>,
	kvm@vger.kernel.org,
	Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
Subject: [PATCH v2 3/5] PCI: Add pcie_capability_user_read_{word,dword}()
Date: Thu, 29 Oct 2026 12:20:27 -0700
Message-ID: <20261029192032.1325629-4-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029192032.1325629-1-thepacketgeek@gmail.com>
References: <20261029192032.1325629-1-thepacketgeek@gmail.com>
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

pcie_capability_read_word() and pcie_capability_read_dword() use the
kernel config accessors which don't check block_cfg_access, so they
can't be used for reads on behalf of userspace that should wait for a
reset (or other pci_cfg_access_lock() holder) to finish.

Add pcie_capability_user_read_word() and
pcie_capability_user_read_dword() helpers, which provide the same function
using the user config accessors.

These are for use within the PCI core, so they are declared in
drivers/pci/pci.h and not exported.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
Tested-by: Nikita Vetoshkin <nikita.vetoshkin@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 drivers/pci/access.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.h    |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/pci/access.c b/drivers/pci/access.c
index 18a206bb2a94..ff5a16236758 100644
--- a/drivers/pci/access.c
+++ b/drivers/pci/access.c
@@ -490,6 +490,56 @@ int pcie_capability_read_dword(struct pci_dev *dev, int pos, u32 *val)
 }
 EXPORT_SYMBOL(pcie_capability_read_dword);
 
+/*
+ * Same as pcie_capability_read_{word,dword}(), but using the user config
+ * accessors.  Returns 0 on success, negative values indicate error.
+ */
+int pcie_capability_user_read_word(struct pci_dev *dev, int pos, u16 *val)
+{
+	int ret;
+
+	*val = 0;
+	if (pos & 1)
+		return -EINVAL;
+
+	if (pcie_capability_reg_implemented(dev, pos)) {
+		ret = pci_user_read_config_word(dev, pci_pcie_cap(dev) + pos,
+						val);
+		if (ret)
+			*val = 0;
+		return ret;
+	}
+
+	if (pci_is_pcie(dev) && pcie_downstream_port(dev) &&
+	    pos == PCI_EXP_SLTSTA)
+		*val = PCI_EXP_SLTSTA_PDS;
+
+	return 0;
+}
+
+int pcie_capability_user_read_dword(struct pci_dev *dev, int pos, u32 *val)
+{
+	int ret;
+
+	*val = 0;
+	if (pos & 3)
+		return -EINVAL;
+
+	if (pcie_capability_reg_implemented(dev, pos)) {
+		ret = pci_user_read_config_dword(dev, pci_pcie_cap(dev) + pos,
+						 val);
+		if (ret)
+			*val = 0;
+		return ret;
+	}
+
+	if (pci_is_pcie(dev) && pcie_downstream_port(dev) &&
+	    pos == PCI_EXP_SLTSTA)
+		*val = PCI_EXP_SLTSTA_PDS;
+
+	return 0;
+}
+
 int pcie_capability_write_word(struct pci_dev *dev, int pos, u16 val)
 {
 	if (pos & 1)
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 77efa4c5c960..7c5a2ebc5706 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -128,6 +128,8 @@ extern struct mutex pci_rescan_remove_lock;
 bool pcie_cap_has_lnkctl(const struct pci_dev *dev);
 bool pcie_cap_has_lnkctl2(const struct pci_dev *dev);
 bool pcie_cap_has_rtctl(const struct pci_dev *dev);
+int pcie_capability_user_read_word(struct pci_dev *dev, int pos, u16 *val);
+int pcie_capability_user_read_dword(struct pci_dev *dev, int pos, u32 *val);
 
 /* Standard Capability finder */
 /**
-- 
2.53.0-Meta

