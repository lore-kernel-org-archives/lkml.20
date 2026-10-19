Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445490;
	b=w0neYgFKgLs9KagFYE6uYOMPcTKq4xAfaCszAYuH4iwAEj84OTTjB4Cw0NYcQYxPpAmp
	 08yD91kBsesEDz/NmO51wicCqlovjtn8F5JeiNOgcJr94pIDXWiBidIZpdXDGOtqZ9A38
	 pxyFaYQI4JTyBH0m8jdYZA/os6KSgKd9cocYOhneEQeBmPzd8AricK3gssmrjLeiRvtRl
	 1FIqwYQpvUX2TexnSRwZU0KQly8YWu+qD72zgWkk1WQ+M2Fcip332uChH4Trbc4nA1WFZ
	 3tCqCmByIl3TQ1hHfz/0FhEukON2UzgaR4vRG6fNoKh0yDAA61dryC4Wj64JApidz2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4ZTUYHR3qxY+N6QVtGUbGLJTaBCbudf2foNyHLXy9bs=;
	b=xMxD0hyEpRWz1RCVb2rzdfEoO48q/EBVmC0G1wdw5tLIHD/UAy1ldhPMOPoF10Az0nho
	 PXpdUDrPcw93t6xVylf+9nEjx/C1e9LIYe8dfmd15Xiw7w6kn9cZJ0tdRIpuphBK7Qv3U
	 h7ogiBO0lkunxCSelaPTMhqOwR07feAHuAvuQYFaaP7aqROFST0jTUlQcKmfDaQuC3gnc
	 17shvJRdWTlZTJXhDYvst/8nkGZHWAF6xiFsLPh2fGTVswSG2QZfVzEMOSSULb/IMomqd
	 juzyCWqxR1J9ARfJnFBi3VFXe9CJ1o2xIRjdI7uPcKnOjivFRi8ApO5Z4s5jyu7K5ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fTGbCHtl;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B260A2631
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1B260A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fTGbCHtl
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so478975a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792445489; x=1793050289; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZTUYHR3qxY+N6QVtGUbGLJTaBCbudf2foNyHLXy9bs=;
        b=fTGbCHtl7/pVGZcjxi7uoftX+2e6F45qd5tt19lqtKG+FGjpr8PlrfR2ocvjxjuqUR
         77nZirHaaxn+EPfFdfPfE7+TT1PKCz3sqU4xPYfDplnaEZmpJy8HGq9jLOEyKpmx9ESH
         GWROZ/HnI/mkOBFAzE5YYTFf0J/5yMXXSOWgO4pStm+Hteh1MbUrHjwC0rMNkLx/TohC
         OTHPnrzDpXaXmXOAARxJcaVAIlsMy4/ZAlm2UQw5T8EHU2JRzFwEh56RdvZ9i4+bwvCa
         9xjot83w8qtJnpZS3FVT7RV25DqHVw6ebIf9fIysVC/VCFFqwhjMghsNfKp+h1Ipb33F
         pQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445489; x=1793050289;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZTUYHR3qxY+N6QVtGUbGLJTaBCbudf2foNyHLXy9bs=;
        b=Syi602QmJL6rMf3EzEAEQAhBMm9blG4O7CkPbBwWwD0wAAMN3F5D0nZR3RV8Gjsl7U
         SNDQRloDWlCH/k3EqezqfZjlWxPwBH0BmdH4S5noouXxln+t1OWWSNzp5ropL778Tqd0
         2NgZ+Erd4ZFacIK1CrG/veq9olhJroRYalfhGhbDsdvW1ljRJ1r6K0Wo4qMM/+wqAlPz
         xcDltt3kIdpM9e05A2OF9MRruOvQOBkhyXuvB5CttIHMiY0rjkdA3rHFJTipYpk6ieRs
         0A+2OuDSFM3TZznhoZjWJ0Gqde+yAlICEObBkAIFCRBYJAL7ulyrOoBt6iJH931Lvpro
         f1Kg==
X-Forwarded-Encrypted: i=1; AKwUvByvxq06UeVLH0dUzdAAbUMycZkFtmYaD2uBs5+9z0zNL0mqpn7phHdL1v3AmTmEmeJZO7qx2wIrjY1rBiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKqf4q/82IFuR9A3U/1/9887mAb45ZXgogI3p81d8xEAoCDARN
	NLfiaRLSm5XLPtfHtp11EJFz/zq9LE6FQhML8K30YWOjd2PPRAUvkBQrcjwP/eYDrZR0cYf3Fbl
	llPhyPyedbwXGEQ==
X-Received: from pgmo24.prod.google.com ([2002:a63:5d58:0:b0:cc7:a971:1982])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:2983:b0:3dd:a195:dd55 with SMTP id adf61e73a8af0-3e2260eb858mr6959751637.55.1792445488899;
 Mon, 19 Oct 2026 14:31:28 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:30:53 +0000
In-Reply-To: <20261019213054.3157159-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019213054.3157159-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261019213054.3157159-10-dmatlack@google.com>
Subject: [PATCH 09/10] PCI: liveupdate: Don't realign resources of incoming devices
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	David Matlack <dmatlack@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Logan Gunthorpe <logang@deltatee.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Skip pci_reassigndev_resource_alignment() for incoming preserved devices
and log a warning instead.

When the "pci=resource_alignment=" kernel parameter matches a device,
pci_reassigndev_resource_alignment() disables Memory Space Enable, marks
the device's BARs as unassigned so they get reassigned, and disables
bridge windows. Doing this to a device preserved across Live Update
would disrupt any memory transactions targeting the device and change
the addresses of its BARs out from under anything still accessing them,
such as its driver, peers performing P2PDMA to it, or VMs whose vCPUs
keep running during kexec.

Assisted-by: LLM
Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e5b960ca26e6..853c84a2c782 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6750,6 +6750,16 @@ void pci_reassigndev_resource_alignment(struct pci_dev *dev)
 		return;
 	}
 
+	/*
+	 * Reassigning resources disables decoding and moves BARs and bridge
+	 * windows, which would break devices preserved across Live Update that
+	 * are still performing memory transactions.
+	 */
+	if (pci_liveupdate_is_incoming(dev)) {
+		pci_warn(dev, "Can't reassign resources of device preserved across Live Update\n");
+		return;
+	}
+
 	pci_read_config_word(dev, PCI_COMMAND, &command);
 	command &= ~PCI_COMMAND_MEMORY;
 	pci_write_config_word(dev, PCI_COMMAND, command);
-- 
2.56.0.212.g129ede20d9-goog

