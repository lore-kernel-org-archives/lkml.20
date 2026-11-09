Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232648;
	b=OIFFzs+CXsz9ISx9vyJpYSLNyb7L/exq2BcbkmEc+ArWcypax2HfJZjJdcBba92iezVd
	 BG9HWW61nc3o3Loxn3g7qwIQdcmBsZhPseA/JuvjMsSheMZZewah8Mn/hI1Ie+hTZiT49
	 J+0bqUlQQvAiebEewXzrPL9XSfkUUHNdMxjxbJmXkZi9MYIfKlzsqBEO2bYE89RpVdbws
	 APvyHbLLE8hwuyKn4x67QWdmh7r3XFtwp0r1Bdxq0V80CVM2dMSujjp83Nxlew+bjTd1n
	 h/s7lOvAtSQBes3kXlKxskMb+96FsdbP6xR0sz7LmczIbbkK1hSSPrV5vob/uzNonYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232648;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=PPoeluNgbq+9yJxldZuWjVFzwtKJDNM7QSMlkvUPquk=;
	b=sHzNcoEHVIgQMVnyTohu3gmkXDwbfNwk0PnveBQuIyaWd4772C2TxEK8EAYSL6zUJcTN
	 /HFI1esMRpLlyXsHc9IDeghLPa2haBhTbMQuRKlfk4k0pzh2Nov69CSbe5TWF4w2fxeWJ
	 5SlNbLYkkHPAZFpnBSc8S/9AbwSoZ8HUPCZqFuEQmXjyxcu3XvHxR8jeJF8Qn9e41gooN
	 UXHFi2+vJDlNOTIMnG26wnX0kwB2x6bHNeEEDNR9J4zOnKgtZ7tqE/UmnOa7YfRKlsKad
	 uUDxYoUsfw2nUILmJfiPCYFV//EywumM4heV3RX5w91OEPoJuVW/YMNoEmkntUnjSzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tm72Gp3h;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hWdpslIi;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F915606A323;
	Mon,  9 Nov 2026 13:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F915606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tm72Gp3h;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hWdpslIi
Date: Mon, 09 Nov 2026 13:57:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794232646;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPoeluNgbq+9yJxldZuWjVFzwtKJDNM7QSMlkvUPquk=;
	b=tm72Gp3h+OOUxlvJu+p80iYqnA9pjKgmwCWx4haeWAVP4rt632XuEtHaHWlO28kifVMQKi
	LK5mubGxxFrwLvv/WAQCcKN+o7PysD7/Hao3BitkExf0AewR54y0zDpkCdvjkKxfSi17el
	qhqOy3HvLV9jSzXfPWV50nhbFSu7N5JRvXcR22iT3PIGKLHSp7D+8IP3M6C4cK/nmaZUfW
	ookF7KV4wS604pA6Tj4EPCJWxdPJTVr8G+ID96fKcf8aWQ/KmKYgm8WsXiKzE1o2zZLrGA
	dKycFZXrfsXlwVFb2w188NCbi6jc1fy6zi4T1Bpt3S2s0XG3UBmPGqPCUTDLZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794232646;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPoeluNgbq+9yJxldZuWjVFzwtKJDNM7QSMlkvUPquk=;
	b=hWdpslIiBTPD1FUxQGiNDvPMX/h2eOJnNqEPDvCCRCKBmhJ/d/wQRAq8Fs8gUyjPQBnP3J
	Wzw881vLadHnHZDA==
From: "tip-bot2 for Li RongQing" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: irq/msi] PCI/MSI: Initialize MSI-X descriptors in the setup loop
Cc: Li RongQing <lirongqing@baidu.com>, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261109031411.2205-1-lirongqing@baidu.com>
References: <20261109031411.2205-1-lirongqing@baidu.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179423264426.2093942.2944631962342836278.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/msi branch of tip:

Commit-ID:     3f16c006f1f6aac0d99a85b387f0685fd1bb3a4d
Gitweb:        https://git.kernel.org/tip/3f16c006f1f6aac0d99a85b387f0685fd1b=
b3a4d
Author:        Li RongQing <lirongqing@baidu.com>
AuthorDate:    Mon, 09 Nov 2026 11:14:11 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 14:53:18 +01:00

PCI/MSI: Initialize MSI-X descriptors in the setup loop

msix_setup_msi_descs() uses a single on stack MSI descriptor for all MSI-X
entries.

Since msix_prepare_msi_desc() only sets can_mask for non-virtual
descriptors, a virtual descriptor can inherit can_mask =3D=3D 1 from the
preceding real descriptor.

As msi_domain_insert_msi_desc() copies the descriptor, this stale value can
cause pci_msix_write_vector_ctrl() to access beyond the mapped MSI-X table.

Clear the descriptor inside the loop to ensure each MSI-X entry starts with
can_mask =3D=3D 0.

[ tglx: Move declaration into the loop ]

Fixes: 3ece3e8e5976 ("PCI/MSI: Handle the NOMASK flag correctly for all PCI/M=
SI backends")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261109031411.2205-1-lirongqing@baidu.com
---
 drivers/pci/msi/msi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 8a0133a..4e8ec8d 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -636,11 +636,10 @@ static int msix_setup_msi_descs(struct pci_dev *dev, st=
ruct msix_entry *entries,
 {
 	int ret =3D 0, i, vec_count =3D pci_msix_vec_count(dev);
 	struct irq_affinity_desc *curmsk;
-	struct msi_desc desc;
-
-	memset(&desc, 0, sizeof(desc));
=20
 	for (i =3D 0, curmsk =3D masks; i < nvec; i++, curmsk++) {
+		struct msi_desc desc =3D { };
+
 		desc.msi_index =3D entries ? entries[i].entry : i;
 		desc.affinity =3D masks ? curmsk : NULL;
 		desc.pci.msi_attrib.is_virtual =3D desc.msi_index >=3D vec_count;
