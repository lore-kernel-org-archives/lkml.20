Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793418127;
	b=kE8ohKeTk1p3fuWwdI9NtPDmUljx/FD1LoKJlrIq+p/O7NonxmhFQxgFxcWU7lOYZ0uD
	 AOAb+B/Dnh5+flCuMWQKoYnz6cknDCy6KZ5X8MEs+qrTsa/DlMMlI0f1a+y/pk2pN2U4I
	 aOKWuZCtJcri970k+zMmjeyAL/p/TZo4MvYseuOZaT9RrbmN088Vf7TpZptzv7qR566BO
	 q1rhUOmB/EmoIX0dfexrhRM1CDrKiqts537Mu7jRadWfYaesmSJPNpu/eE3v1j81+mHPA
	 dAwsjlMKrKnCaFRZG3EpUd1ziT0UTJltrmkzZrXTR3LJBq1s8dbR9l184SS9jdhQ7Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793418127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QDtA+So1//UVPjtoxC/QdiNqck5HolvlgMVETd7cnIU=;
	b=T+Fzjs8rEcTtUIw9BkYGRLQIPggTcslSHYnB1jg0K/q1TDwqXYWEL2zK8mfaoUErpvz/
	 ZgUF5LOxRsEczk2F9FtsM9+D8Zcy9b7/fGdy1/ul59+f0xjszZcS5pT2HGpcP8yLkIrGK
	 zBqiyyD1eZehkSl1Q0CehFC4PzkksEkTojzshCO8NHe0Jhizlf39l106BTmcColdimEEE
	 KlnPt89AHRWyPyhCvaxfNt48r42BSEO8GFqjcNBgmBL7HuIyNJIJkCzrJOglID/eJt2dm
	 0HhEy2mxQlT/AzC47W2o2EJZd0hdxqzWbQE36fnI/AvOajtMwouKLLWrUiutIO7pQiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kP+opc6I;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BFFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kP+opc6I
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369f33df08eso2760956eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793418127; x=1794022927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDtA+So1//UVPjtoxC/QdiNqck5HolvlgMVETd7cnIU=;
        b=kP+opc6IGf8YURkCpVxS45pdPMVFUM3u1RR1SiwUhdAHqOm5OnE6G9+8Q0gu921esf
         wEppsxFvL9MR6aYmRp0MmKNIHI0tH8lPtXXU29V7mHddNMfv8KBmSyeeL9qJKXXzS9PT
         jjnEaHYddeMyUPoOo/0CbumGBLJDxImQB9s3o9zJ/bJ9w8FZYTNbp4Y1quYwyxCdINnS
         MMeBGHL6ylfCFA64VCLfxYGolgJiyc/kzEKSd627hG8vddkERIPhIdnLtQ6BH0G4px2W
         NfurF7+K2Uih9TpNbOuu0pOQ+LrcUF0fAUzdj7DM0fwUDDO7sqnS5yLZ1ST92vS7q7WB
         pl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793418127; x=1794022927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDtA+So1//UVPjtoxC/QdiNqck5HolvlgMVETd7cnIU=;
        b=rQ8L3WNQ5JlDswpWilAdIW/Ucr4QhFaClW67P4CJwicbJY7K6K9p7DfhQJqsJt3Isn
         kn64FF/G8ftmFF8O7aXPHtzU1VjaPPKgTHrbvJYD2HpHwEh7koF1aiO70sO7Cm918bfk
         kGrjqE7vJt2iaj+z1j0HplWO5BvDfCFWDPO0PgWvi7EmgThWzJvg1obHC0KinalyjYM/
         UrM4SxA6dYAV6DUXKAj/KM27sTiFL5cz71iTMlJNkpFpnqR3vFg+ZV6GXMHk5IKzaLba
         /hSd5WJirlLOl1LYYi9ab/1ByMvkSsTiegsvhBb4KRDUfMvvKK+VFF8PqGFci5pNIy99
         1JRg==
X-Forwarded-Encrypted: i=1; AKwUvBwF7xQpVuF2tFtaroyFHWNSPcAezislyek2agNgOUxBRloRQaZeUkqUu287k0gQsoxI0s7Gj9kcvcV26zw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYZPPZm9PKGM/jwBe4tPlGqyQR5uRJIU0W+2tdgH8g9BsdRaa5
	/ye6FXZlSj4BCy5ESag/qzTRnLt9cnsmy2MVfqUFSvrbQkZdPhDCsG41
X-Gm-Gg: AYBFou1Y4yO5j2QvPJfTXBRmrBrhqt0mEqYKryv0wjRwsNc1MhhO15qoXGzBw8m0Eq7
	TuLGO7DOH816UDqBNRWKdgO0jX+vnGPu4JcK2ss/HbgvP3XMM6m/AFxsGl9OVNIZNw3I3xuFwVA
	Hve+k/bsGDe2X5DmfPt8eXYIgrdjzigLkwdFU4rN3y3iHANu+mgsL9ZyRKxwUFqZCSyZsfJZ4JY
	1V4i/h4Zw8yG2jEEcQCtimzxeVON4JscDqVIs7Lln/UdcKlmVIgwu1OGqYReWUQSnY5Mrbx3FMo
	r2SNkjYMtQq+mswcdplROk9l6EcLw0prT+L56KEz6RHeJ80lwu1rP8cax3R605dokL3r1teH7ac
	gmS+Xozn5whAgn79QGTM+GdTzf2oMiLndfmZZKdJ8piVuYb18P7jC1fCzFWpYPyzonmtjq7kLJB
	6R6FCWKmLYT8osVE4IMx58JOY0PJNwmKO1IT8gM0KkCnWOBFcca7KhtQd6YMDi26wgdVwssA5Zf
	ynLuHvM4meLqoYg54q+uAuUYxwfrswOly31Wr6+h/T81RBlg7UHPJKp8MHFS+6nPslA/jENLCyh
	xarPKBKG1cz3r5OlGf8a0dEH3yD0ro1UcKNRNeYmiOcKpqlL04lBsTQ/hQSKGEfngaA=
X-Received: by 2002:a05:693c:400f:b0:369:f72d:1010 with SMTP id 5a478bee46e88-36a423af96fmr6556347eec.18.1793418126563;
        Fri, 30 Oct 2026 20:42:06 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm14255325eec.2.2026.10.30.20.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:42:06 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: Do not cache Immediate Readiness from a failed config read
Date: Sat, 31 Oct 2026 12:42:01 +0900
Message-ID: <20261031034201.161511-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

pci_imm_ready_init() uses PCI_STATUS even if pci_read_config_word() fails.
The failed access leaves an all-ones response, whose Immediate Readiness
bit is set. A later FLR then skips the wait even after config space has
become accessible again, so early config restoration can be lost.

Leave imm_ready clear when the read fails or returns all ones. Keep the
existing fast path for a valid status that advertises Immediate Readiness.

Fixes: d6112f8def51 ("PCI: Add support for Immediate Readiness")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
An arm64 QEMU kernel used the PCI core enumeration and FLR paths with a
synthetic endpoint. With one injected initial PCI_STATUS read failure,
the baseline cached imm_ready=1 and restored config immediately; the
endpoint dropped the writes. The change kept imm_ready=0, waited 103 ms,
and restored the config value. No physical endpoint was tested.

 drivers/pci/probe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 27008e2ea5af..eb4e17ebd055 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2642,7 +2642,10 @@ static void pci_imm_ready_init(struct pci_dev *dev)
 {
 	u16 status;
 
-	pci_read_config_word(dev, PCI_STATUS, &status);
+	if (pci_read_config_word(dev, PCI_STATUS, &status) ||
+	    PCI_POSSIBLE_ERROR(status))
+		return;
+
 	if (status & PCI_STATUS_IMM_READY)
 		dev->imm_ready = 1;
 }
-- 
2.55.0
