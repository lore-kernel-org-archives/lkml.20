Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A192599A21
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096273; cv=none; b=l58CjWZTLCcJUz8UrZ6iI6dWcpCH3i9b+oGTpIYjLxO5I6iIwMAzJ/EeVkfuUaa418+KzMbx6f8ej29Fmdc46aVOn1OmPrI56n7KAehm8oDn7XHPaDkgPdKUPmDUjfVY0TggAWxpfTq/N3DyBJLMg0eHomKe4gNbEayzXmOjMgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096273; c=relaxed/simple;
	bh=lxbQ5/ioUInLVRx+yE+3nEiJw2cFSJvFb89VFYTZ8Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIcXvGtm6U+0XhWVNhomKrmwyzhJj9DOeyrnHSSc1BappcX9zKlWN0nXUPlOqMRekG9o1wLVsJl0dMsHXs8KTVOoa17HsjP185yfDgaFTlt8KWq5vjCfeP3wP54w1PyvA8shk794W1MsHHcI635V4MYEoK4zZN8zxefFOyKZbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwYGqggl; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwYGqggl"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1517bda04a0so4136223c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792096270; x=1792701070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oL+BJV/AvgUD6fnBEkb0OUbDdDNxy3pH+PTZKDhfTUo=;
        b=KwYGqgglOTq+ClQCPyg/H0coyc1+ERH7WQuQcGon7xVAIBwRGL36vtRH6cjSGwD7wg
         KsXG/RnrMU+GcDCCM4HFNoiHED1xZDGRBZaupFh2ZwQO7QsN4DiG7VtyBXsW3F/eGqgS
         hUe/3DF1/L3K9qFyfWrspciGEWnslsiiC6hxl0jU0iyVcc3q0yfAG3SPgy31+AyRPg4U
         5TSd6xkCmbFg7iHpU0Z/bg8mMbPN40CNq00erAp2nvSxhcVxn2NMbqklOqbk6YCvCvuJ
         yqaind2xuxHz4N8IwdRDj/JcDtgOzvY3HjOXYeV+q9LozuHgNKR7TJGU5KiJeYYEI+4b
         k0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096270; x=1792701070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oL+BJV/AvgUD6fnBEkb0OUbDdDNxy3pH+PTZKDhfTUo=;
        b=EVG6u1E3CVRVpS8YEYhV3VWaFTTqtPm2fMgvjPmss+9vRaAX/DVNumcX+jXWZcocNb
         AUzQVyuPGGEbH+StEg4RQdQK9HVEHTSv/30+8BSMCBGRRb3l7Pl54g7ZTkPiCd1c3TOj
         PsRDiyQyvEF/bZz5o45ThcOpI5u4Ffk+LMR6u948QFrQxFlC6B/VKxPlhmPUJHb6SrK/
         EBG+ECRMW3GAdaLN7UH8wlkTgVdlszjCFwJVtJnr1YAcx5qBwN5ZqnqMMPub8891p9Uy
         HoxseqvO6JImbUXq17CRmXmhnvJNF7p4xb7DOvRObl6px36G95bdU4lriTY0bSmI2tBl
         zXug==
X-Forwarded-Encrypted: i=1; AKwUvBzQzlpmjQqxpttNE+fL2xO4DbvFmx+8bh0eAnUHphnJHXoDC2b5qECQpK9jWAJMAFux3A18RRNXsd5dDcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBRtc6c9l0lNlO90X4AgwRpL0SoSGOk+Go2zOYHvwPqT+GIsSx
	aHXSWXfRTuGZu5sy7NRzgEKillBuZMkU0xGtyiV2P1Mf1D6P7iqSfGtA
X-Gm-Gg: AYBFou26qPNlIWAl+W80dsw44tklVlftnjtZ8wxXLWIoqXO7UAD0g6llZHu5t3kU/aE
	Zdg453fKwYu2cawLmbMh1fynWA/PwPyy8Lhnt5slgBfEoStIGWCg3vEpQ822Vonodlh+l4Fs+Nb
	ynMB0tNHcTVRb/fFaP553s8kOUjqIC7I0qzslzjiW7PaIfq3tMWAZrPR6HmXjuh4Q5V9yLZZolJ
	DKBsrAIy8p13Crmlc2jY1lsHIGRCxWwaep5CM/mUPCjWvyTeTeI1AroJAwy7WcP21JosSeAUEtO
	gzZ3/VP/nw0rjFxvlsEE61KUcsZCn1YiboyTw+w1Rfs5ExXhyOKGNd0PNtp+XPGDGFqZywHCQoN
	9GIHE9jN6GYaqetF5FPmkuR2encZFKzVKoiUc/xmK5xEBFetZZkeRnL7aWyCQlJvT1KoYzsDWk+
	q4lLDlLXm5n7+ie63NuWfbyETJBSZGSqN6tzPvP0yk8XQOCTP7rX7aQJkVjMEzul61yXKiJBFgW
	0kTJTv563153CwNp6io
X-Received: by 2002:a05:701b:2086:20b0:149:1b5b:1f25 with SMTP id a92af1059eb24-16a5adfc081mr27862952c88.15.1792096270067;
        Thu, 15 Oct 2026 13:31:10 -0700 (PDT)
Received: from eldorado (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm54204c88.9.2026.10.15.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:31:09 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MIPS: Cobalt: Include legacy IDE ports in the PCI I/O window
Date: Thu, 15 Oct 2026 13:31:05 -0700
Message-ID: <20261015203107.545047-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cobalt PCI I/O window starts at 0x1000, excluding the VIA IDE
controller's fixed compatibility-mode ports at 0x170, 0x1f0, 0x376 and
0x3f6. These resources cannot be claimed under the host bridge window.

Since pcibios_enable_device() was converted to pci_enable_resources(),
the unclaimed IDE resources cause device enable to fail with -EINVAL:

  pata_via 0000:00:09.1: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
  pata_via 0000:00:09.1: probe with driver pata_via failed with error -22

Lower the PCI I/O window start to 0x100 so the fixed IDE resources can
be claimed. Keep the reserved ISA resources below 0x100 outside the PCI
window.

On Qube2, the relevant I/O resources change as follows:

                         Before             After
  Host bridge window     1000-ffffff        0100-ffffff
  IDE BARs 0-3           Outside window     Inside window
  IDE BAR 4 (DMA)        1420-142f          0820-082f

With the fix, both pata_via hosts initialize and the ST380012A 80 GB
hard disk is detected as sda. The MIPS64 kernel reaches a root shell and
passes all eight boot-smoke checks.

Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/cobalt/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cobalt/pci.c b/arch/mips/cobalt/pci.c
index 85ec9cc31d66..293c02e151d3 100644
--- a/arch/mips/cobalt/pci.c
+++ b/arch/mips/cobalt/pci.c
@@ -24,7 +24,8 @@ static struct resource cobalt_mem_resource = {
 };
 
 static struct resource cobalt_io_resource = {
-	.start	= 0x1000,
+	/* Include legacy IDE ports, but exclude the reserved ISA ports. */
+	.start	= 0x100,
 	.end	= 0xffffffUL,
 	.name	= "PCI I/O",
 	.flags	= IORESOURCE_IO,
-- 
2.53.0

