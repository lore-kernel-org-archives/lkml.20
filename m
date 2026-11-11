Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378756;
	b=w9Ty2unvH4WpA51apoRyupfA/5SvheH8YE/s5VDiEn4/UqCX/5l8tkw6hZ155G+RzVHR
	 aUAnp6SkwYDyhBN82hMS5Lm1fUBo955Qdf2BmHytIcGm95BmbQriiu2uPXjzLWsykPnMu
	 quQXeL0etnkT5L0XQdjGwPQUmWf4FDu3annDFyPzaEt1FASswtMisxIly9LiqaDPOrgx3
	 Hw5cDqu7E/23HjYTCAcljmfLBDRkb15szjqe2J/vsKTCtXt3XEoH/hOH90e7LHzGAbcuZ
	 Pz8LfKfHGMWaGxYGV8cFRB72bRG7tN0ly/ghJwx926QV68s6Z2TmnbgrN/SmdDdWTAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iG+inULdiX/9F1jgHvoIofo1nPKwdx5Mas8WwwOmeh8=;
	b=j5caopgHNmEBk9Cl7Sg01c7jEkYpiMpuHv1YAXeCGFTsAp29J1mgAvrJ5ZQHjkgu8yjN
	 3gH4ihmRQ5aIZMvirw+NGM07RZW8bdQMNYsQoEo9N9kGJEm8uXldQ6KIzA5upp6NQGFjX
	 ecnqqtw+8ws42NS0W7cUgbkvYbrUdnlt/ldv06LnjSAm2dGvp3wnySfnd3hgtqfXW8M3m
	 Mtrck44TrCDbbDuk6ZMBytHG9uQCkP5B/Vgz3fCSoS0JQ/6M0gy0vUPBF0zWaNJiYbZFq
	 WJsXIFT7+6naDFelHXGH4CJ/fpHf3tTaQOP+2x68HXABukWlQvUYYfHz/Z8SISTBktA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHlREPoq;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4E6606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F4E6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tHlREPoq
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1474683f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378754; x=1794983554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iG+inULdiX/9F1jgHvoIofo1nPKwdx5Mas8WwwOmeh8=;
        b=tHlREPoqa3VREtd/3FqXEUOQP7wEvLpOjRoM9iujAcGnu2x208KdouZARqXfWc8LUp
         xQPFMmdwxe0xffIOTCemDQi04ZE3O+U7kC7Az5oHwzwHT0Kb/PNDdI8MkPRuIC165xZi
         J9LjxfJQyt7jUVlixwSoVo4Au61L8iJDi0e7wUe4P5RENdlkHX28QizsvyhSScqj7GLA
         9uTuUbaAnv7tzNWvwEHBoa9OD9fTDDsYS71kqMeeJ5Z3BL5Sq6qoectk/JdgJLn9+rnC
         iiHX7XhC2ap7sdO9RGcsPVuCZ+FTEamoYDxeG8NQ80Ij2fqXLNBF/mvJnCFJybSK73Rb
         FWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378754; x=1794983554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iG+inULdiX/9F1jgHvoIofo1nPKwdx5Mas8WwwOmeh8=;
        b=cJhTGd81XgsSPgyRK4Vi90MI4rV5bPUTL9biTC1oG1L6RqGIXhxFykm5h5CPbpUY8k
         NBhdnikCyzi1YUwo4mSR2AYObUzo34FodCsvKnATziuukmG+5SZ5RRdNP52QpPhIOpfd
         k1UkwCUmUdsCwaUIk8/gMRDLZHYHminNW9AjBEzDw5Zag7S56AIHxQ6SX0KGhP7HYZoS
         BbYrLJOBW26GjvxlLTXnVxCioOFcLvuYrNrxS1ps62eFs4uv3pZOt/q0kQI3U5L8APUY
         U3fQSTeqdk49jR916zX+bR2X2wjaG6VY4xmH2p9kJdd3ntKg/M5zxCvU9RdZu3/eRUof
         Ur9A==
X-Forwarded-Encrypted: i=1; AL+hErE0Pcj9dJ+tjmMPgqTsvXIBqXkMfdRP3jFozi/5stUE2ce0xjqedswXMd6/dl6MCSJ02FA7XlZgEyMIDDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hba/Gn9tKPFDsbyyhPDAlkeNCw/OSb13A+hW/OnKLMKeWH1iu
	NM6nQc2jMIHSETj9/RwBeVAmMsiBbZGDJOFWSEQJilq1lTHY8DKpA3Kv
X-Gm-Gg: AYBFou22gKlDz1NBg2cA0tXSFWmb+IH3oen5CKYBOYtear+NTp7IaoUUG9Xz1K8z0yB
	z0gVT1Vb202h4jKXjrAkt1qu1cDqWZVzgciDbu/DM7nNesoZ+vvPiiktvCbkFTmts+QUq71301Z
	TLIDpczdaz6Uoj8lSHr8vn8p+Uol/u4Y271szTYlOuduPvzi3QzCNxf5LrvHmKlSdF8WV/qlFCq
	mC1THKo4n9zWDA31NDC+uqwdZ1HssQ5XSX+6NcGwzg3Ey0jhbRwgVJzHKKtMt+31TYhdhbchML5
	mistoL5nPKJkJyrmbgyO0g1PkwSwZKb6MXIz8tasjm7kDSxpOQKMUcOgf6vXwta76lUJZPgHdkN
	9JvOMyCfaBaaLhc7q+QDfSFCF/kHR16gE1fUiMMOFp4K225ia1LG6StAs8d2bIXHN0BlcDGfjvt
	A5ThagNu8sJbXLjGG6QDaHwkhZDcXpEvWw2wcJC1w8W8s7zo+SVa+8Esns35ijabVlJlk0+YOUy
	MBPdXxySqR7b3cav3qTJMEXxVOK+UVSgSlIwqPl2vZSHuGD0Pnm5Vt+8COVZzeTNiRpoxVw2CfY
	MN/R9Gh+1/CloM9jayQ/R9vxWUnIK+n3aIlFLyFIOKr6GU/2U3Af3EVKIW7spE9yN+w9PBUVgQ=
	=
X-Received: by 2002:a5d:64e3:0:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-499c903d741mr1957954f8f.23.1794378754237;
        Tue, 10 Nov 2026 22:32:34 -0800 (PST)
Received: from Sheldon ([185.4.35.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c027sm8981259f8f.24.2026.11.10.22.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:32:33 -0800 (PST)
From: Victor Carreras <vicajilau@gmail.com>
To: rafael@kernel.org,
	hdegoede@redhat.com,
	bhelgaas@google.com,
	lukas@wunner.de
Cc: mika.westerberg@linux.intel.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ACPI: x86: Disable wakeup on MSI MS-1592 and MS-1594 dGPU root port
Date: Wed, 11 Nov 2026 07:32:27 +0100
Message-ID: <20261111063227.14511-1-vicajilau@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAJZ5v0iqOoS8t-5PFeLPuaJrpeByx2Yr-dnpYU2fT6yTb6-7=A@mail.gmail.com>
References: <CAJZ5v0iqOoS8t-5PFeLPuaJrpeByx2Yr-dnpYU2fT6yTb6-7=A@mail.gmail.com>
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

On Mon, Nov 9, 2026 at 8:32 PM Rafael J. Wysocki wrote:
> Please see Sashiko's feedback on this one and let me know what you
> think about it:

Hi Rafael,

Sashiko is right, v2 does not work as intended. Clearing can_wakeup in a
final fixup is undone by pcie_pme_can_wakeup() when the PME service
binds, and in any case acpi_pci_wakeup() and acpi_pci_propagate_wakeup()
only look at adev->wakeup.flags.valid, so _DSW on PEG0 still gets
evaluated, both for the root port itself and when wakeup is propagated
from the dGPU below it.

v3 follows the suggestion: it clears adev->wakeup.flags.valid from a
DECLARE_PCI_FIXUP_EARLY quirk, which runs in pci_setup_device() after
pci_set_acpi_fwnode() and before device_add() calls pci_acpi_setup(),
so pci_acpi_setup() and pci_acpi_cleanup() stay balanced and both
paths skip PEG0. With v3 and the SSDT workaround removed, the root port
and the dGPU reach D3cold on my MS-1594 and the touchpad keeps working
across repeated D3cold cycles. I'm sending it as a reply to this thread.

Thanks,
Victor
