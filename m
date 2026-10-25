Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792886926;
	b=gKa4jBxMm+K4klhR2b+QUFj2XQLQH79WK3u406XJ5CxJaXJUrTB8BcmVGIeN21Y3wT9c
	 CPGOp9/MQo1Zh5U5n1JhmRcPEkyeP2FLGYrybf2D/ABjGdSc6rExD5eW1WlKFjq0P1xij
	 TMqv66zYSUqGjbbkWIqc4BZIMWSbHKsl/gW8CZ2cZlozXrQZwI9Xx+WtzHqMhALBayXz7
	 2OgEMB0dVbTfIpj2DpDKcGYaUSFy92HtKoX2+IVFXcbTo6Rrjww+O7rFG4cjBy84+ebBw
	 S8gnHMfWV+Ej+iC4/QEq9nsS8a7/Rq6PLK0EpHNDOSDkUx46HmgZGEN0IA5Muhh0DZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792886926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7dfyKzdRYvknKA9F2M27XwH3fnlKeDPMr9i7eMgXHCA=;
	b=d9Jf3ZSuqVJv2z0PDBfrv68Lj+LDyEDAiGXZLBOuAxEdNVwzsORssqefKFxTsvSL3tdW
	 dcPPazIFuNR7Yf9q5/Wlpsilyv8N4etZzQyHUrZyOi0HCWcLEEixJ52oXvvPdWRL+tcw0
	 e39WRiXStdscIs331mpBAX0mP3wB/ILGpGkj7IT5LKC52A+fcXPjDyOQ0zH+yLwiYBWgR
	 o+YQu7BDpWivzzrJS+2o370uhqJXC85k7mLG6+2wyPveqmuoSgoJyRL4QvcCfWFiaxq3P
	 4Mglmng65ZXg4ozbZGDDi26KSFPJ4+W8UlBSb3MPzlYFCRXlniR/QZOdus76frK8I9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="flQ/kmWx";
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B8606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 00:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=flQ/kmWx
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso15449367b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792886925; x=1793491725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dfyKzdRYvknKA9F2M27XwH3fnlKeDPMr9i7eMgXHCA=;
        b=flQ/kmWxxS03rLrKqQnRfDvryWFwFlCQaR5t76gjicE2KsEMIM1ydWBjjg/nqxu3JP
         uZoMPXTe9rwgH36lRyIt4ho86CnjIXzro2RDGYQrRi2hVG70954xOW8OiMTthyBoRWln
         HjjLn2Td6zAliuFtCsDA77Hnb/mREkD7X8eWx6CifezkSf96B/41m10JFm+Psu4j/EbB
         aUic8/rXqZkxYwCsiSabO4lYZJwhLZG1UqJKIvtczTCH0TLGEo3OLSpHitSM3Gpdegz4
         O5+YhXa8oxuTXDgi/pgoHtnu412azpP5XDu7oaferVAhlXWFiGDhlgq1ujnE0WcJgmgZ
         0UNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792886925; x=1793491725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7dfyKzdRYvknKA9F2M27XwH3fnlKeDPMr9i7eMgXHCA=;
        b=SPWMsVQq7brLUr84CwCTr3et/P0wKZHX4Ka8P9xf7/yFo03cOH0RtY1B/C9FnX1l7S
         5na1qj4pkxkWO31wV5ocG31oYfjdXr7EODkaDPJi/oJ6OZ9KP9Vk5MfGg8zcFGwtgI9k
         KSUmchRSlNbbrOCW1nYizFRCOULJmc+np5HZnQoeIQnp260JgXS6H2uYYZE+qFnORoNS
         7IrjBeMwseQYyI5GN3HG2UhAYDiRWt8bUYIvUR4wAYzzaLkbXSMKyLBgRPJ7m/45gUtH
         SJFff+Ps/CszwN8Jrag9I0u8QN2QycObANXZs4r60JmoJdqGrSsBIe2Ycwu0wWgHoZmB
         sP4g==
X-Forwarded-Encrypted: i=1; AKwUvBzYBAfbfltY4DUek5SgDNxuscx/Bxv4YSWDu5TSDKV1sKC2qzJfS111SJ+ZRltrruBAHe+nS0AvfbEs7fk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGwYlPXuCvs/mkojHNTX2RQmhuQlmlQ+fEJtNOZtXzux+7GDJD
	T2wP3Yx+md6PpHmKVTkYF3hnLUXj3BS+L6RCZ5aMt46XMOUzdjrS9r5T
X-Gm-Gg: AYBFou1yP1cUo2eY3bS85gVYu6ZVKi+EOJIU7hXw4UbHUrIp92SUlmfErnpdOHlIpxn
	STMBWJcegMR6jBUMYNkzJShC8jSheQSbTfJN70o5Ki69GNI3arGVSpXw08JHgO4m1ny7jBp4gkG
	7bfS7wadEhxgxTGeR0tZA4OWLpbcOdjg1uX8N/lBeACc50JHJ5B+cvEFhDSeej58Y6zG+8XqmwY
	XbRzFSMvl2bBKWJDm2oONsjCzhcmeDXDk7U6lxp5/lbOST+3vTxuNdC1PaHZDAAI+ysVn4dnhjc
	sZTjpAU8mtsiOAyH0t6bquoFz5S4wgriW4YwLNxbqAkrTfnw0i9iAp6Wn4aWMmIFgXxqX5gI908
	5no87PiWC95wQgyLktBireZ6FbcHgRo0TZtHNU3UwsUYfSdcoC9C81eS39LSMBG7vyDzrXxmrcw
	snLXsj8CAWNZjr6lOp886T3HlRqtn6/C0iwblXiIFacyJAwUlqCusNQaS7AgMHm9Bo4WyYP7/8i
	xwVOGcYXjKs1vosu4z9MQDF+KmQnVmstqK9a/HGWg2gI+IPVxtbjZUd
X-Received: by 2002:a05:690c:a909:20b0:8b1:4267:3ed8 with SMTP id 00721157ae682-8b166cb48f8mr17793027b3.65.1792886924758;
        Sat, 24 Oct 2026 17:08:44 -0700 (PDT)
Received: from gmail.com ([2a03:2880:1fff:41::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166ded0aasm14148067b3.8.2026.10.24.17.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 17:08:43 -0700 (PDT)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kbusch@kernel.org,
	Nikita Vetoshkin <nekto0n@meta.com>
Subject: [PATCH 3/5] PCI: Add pcie_capability_user_read_{word,dword}()
Date: Sat, 24 Oct 2026 17:08:31 -0700
Message-ID: <20261025000836.58294-4-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025000836.58294-1-thepacketgeek@gmail.com>
References: <20261025000836.58294-1-thepacketgeek@gmail.com>
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
Tested-by: Nikita Vetoshkin <nekto0n@meta.com>
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

