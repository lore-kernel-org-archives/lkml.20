Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333124;
	b=4EmASgyp3jDauY1l0b3p9zKtM25VFwJL+dJap3VRebENO5rG+OXdUHGiFluFELMzSYco
	 bYemjaH3240kLiSZ8VF0SpF9SyeKqpCeVVBPwAgP2AvNAWTvauorXORX1Vz0aiYEqVl/G
	 Pu7CDLuzolYG4yjlvAZWnSQT1gX/xEI13d4G47c94wFmyeZq9fLviMVP5jHNiVcaBuwZq
	 /RyBYlqscnPsxVIsxBmIwYPwcIKWAIxU5izFJCBdnackvorNY4GquzPHq5CsODmd9qsXP
	 uuXFeZlkq35wIOvSlCS3vfLn9Fbj7yhIY8iI/JbPiEUxkJYdtikaG3zNWdhjVeyId2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WuksYLyMaEMm2HbqRs5Yxt96t5m3C7Tw90Zl9efnSF4=;
	b=QHW/hzw3H0v6vB+AEkKouJ0OFfKTCpZflJ0rGroA2Zy7S6W3DJBhUkcoZJGj2MGEL7a1
	 jxRUU+imc+/DPaMU9Pez27TtuP8Ccw7YY3byjWH6AXOdKomPgS8ir92H5c9GlHndRupE/
	 wF3bOrOeI38tr1t5hLh3b5wcnm7ttgNj553irW8TB74zIYUKT0f6hpAwl4gnRje0ZxTEd
	 2pgBkCOQnh3/FpVmHFXp28LTv0sGWuUPFSMStVvN61QfZSJzqRW0ScCfCsx9Uq8iqvuf7
	 3BUYaBmyOsQb+HjHbanNmN1coyG3FotixVzZ0d270Z/SF3cjUzZzaT+qFO3U+CCDK+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IYqpa7XZ;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A4606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 665A4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IYqpa7XZ
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2edd25534afso1706585ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794333124; x=1794937924; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WuksYLyMaEMm2HbqRs5Yxt96t5m3C7Tw90Zl9efnSF4=;
        b=IYqpa7XZ9FXuF7RFmZfem2i/qAMPkUgqOU0xEeiZROhcUObt7ylDU/9PEjrr4UpTZZ
         Zi67ogD6Be817Yv7d30fzln/bmhfL2sazvRFPIcjU17xvjwya9BeLKPfiB2lP5uZpTl5
         t0/tjGIbNQr4b1u4TNIh1c8H158eNp6SOs+TJSPCDQr1NApKgZnzj4e9RPnOLvehcGdI
         0qFTXbdZfpRjyX9N8HNJvPifUNGNcMHlkV+tcxON0vV8JR9e62P0hCWI07b/ptOAua4n
         ZcKFYQZY/etuxDivMa0pYnurNyl9YBNnSt0beLBtBfKHAzHRAWdSgIKFeBpOvJ/g7N1y
         evqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333124; x=1794937924;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuksYLyMaEMm2HbqRs5Yxt96t5m3C7Tw90Zl9efnSF4=;
        b=fhzRWXmclJzWBnxh59EEK8kdN51PmRDYr7+tfAj4mH4Fq8ZXK7RNUxeRrijuipiO/Y
         uzoK2DV2us47NhKYnfWk4jsIl0Zhj3FKBa0Tt4JaTRg3I69mtpf2Ic8PwSdm/SzahPUA
         XfdJO/sq2XNbGVjOrPmoizi21Yk7YXLYIe1IeFz1Ro8dG7j1LduCSeixSwo4BO3iV88P
         8dctDH8nRbUH4GvcRfysrJJRvcYehuOFS5SN0PLftRj9WHjrv4MNFrxa5HpnG4bu/rmj
         dq3L0jDnwuVCgJ9oWvHN7s+n072uxNTRfRo75jN1jKkRaSmg4WbvfHUkDOWIdl4njr7L
         DPHw==
X-Forwarded-Encrypted: i=1; AL+hErGObZEU38XdvQgYXBqzuO+cq4AJJGkgQKKTeHAAY1JxT06rOxC+u4DNJ0d9GH9KEt+BZ20M2J8I04x4xj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z93/ZALOj/PSNo1Se5eIYkIPwb8FlyH1zFYNZxAGJS6v7Jf8bt+
	8HjtsBBtv02uiBQUiO7syHSuUdYj8BVwgd1C556t+E0vSoZ8QYSgcpl88a9YZq4IoePvnJImQGa
	uU5vDoI8ooSxMvfYb/BgPKG6rm5BqMdSFDg==
X-Received: from plzu6.prod.google.com ([2002:a17:902:82c6:b0:2eb:809:b8ac])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e851:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2edb91f89d9mr32092425ad.59.1794333123478;
 Tue, 10 Nov 2026 09:52:03 -0800 (PST)
Date: Tue, 10 Nov 2026 17:52:02 +0000
In-Reply-To: <81a1fed9c86e3954b1807f7425f98d210503a28f.camel@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-hotplug-nullref-v1-1-6e21c2e89ea4@google.com>
 <sashiko-outbox-168676@kernel.org> <20261109215339.1841223-1-rathodpriyank@google.com>
 <avLsH4a-l_uxlWfU@wunner.de> <81a1fed9c86e3954b1807f7425f98d210503a28f.camel@linux.ibm.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110175203.1307769-1-rathodpriyank@google.com>
Subject: Re: [PATCH] PCI: pciehp: Fix NULL pointer dereference in pciehp_configure_device()
From: Priyank Rathod <rathodpriyank@google.com>
To: Lukas Wunner <lukas@wunner.de>, Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Ricky Wu <ricky_wu@realtek.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 10, 2026 at 04:43:52PM +0100, Niklas Schnelle wrote:
> On Tue, 2026-11-10 at 11:04 +0100, Lukas Wunner wrote:
> > Are you actually observing a crash in practice because of a missing NULL
> > pointer check?
>
> FWIW we (s390) do not use pciehp we use our own s390_pci_hpc for
> hotplug. I'd be interested if this comes out of a real issue or just an
> LLM worry too though.

Hi Lukas, Niklas,

No crash was observed in practice -- this came from static inspection,
and even reproducing it in QEMU requires patching QEMU's pcie-root-port
to bypass its Function 0 hotplug checks in addition to
hypervisor_isolated_pci_functions() returning true.

Since this isn't reachable on unmodified hypervisors and Terry's pending
patch removes ctrl->dsn and those lines altogether, please consider this
patch withdrawn.  Thanks for the pointer and clarification!

Best regards,
Priyank
