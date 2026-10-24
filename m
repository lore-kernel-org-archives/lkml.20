Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792820901;
	b=PlV4nMW5j2ZSWwERFbC4i26EmKtA1HKodo8lrPu0Tk0JamVRzZqZl7jSJIUmEIRFtfK0
	 8Wi01WqM9uXA2vn2jhHN+sX7l3cJTx4epAyKppB/4bUeUq6lBwrX5lAH6oVCe4tLJtRwt
	 2z9eRj+V7na9RQlRlfR7KLF6upHWF4ACyktdNYaa+0U4ZhoLg9U4gLXvsTYtE1KxhYZWD
	 nyhDl92OuDO6wjyK58d5/taf9ft8CkIPNXvau78/9cqaCVsEG+ggF3aFjGVPHcsgc+N1G
	 ANaX421jxAnDx/bZUPvBIWBS9secLYGYUZLLNqN2yiAsezATllBzP36KkpS/xkVqanQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792820901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6qMiNAXonRcpqrHA/noomKNgnzoBcCy6IIUuJqY3UOc=;
	b=VDjEtKH4WIs+FhXRbXMALfHzkxyg4beGIGRwHVtBR62LaiAGRge0+NQmJedq5iOCsywO
	 0Oaxox4EEhFwZpnWCkS+/lDndL3VmUxv5UylEfgk4baIeJe41W6nHF5QnWBRvaNRbs0tJ
	 BX7FsplW7yYWIMqGmB5Ym9uqzn2/sJZgNSU4euUTl9gXcbpp416L5fg4UIOhRx3SbItNj
	 jFWvMLYWFExqRX9UrohZbutyDOBvGxlzLIC6dpRMiQGBHSNpCQbYfD2Qq+2hzqebryGEY
	 SF4t3V7VM8H/hAnRHSR9MaxAqbVbos74Fcs7hFR4HKVWUldzW40DidxwaV5cVpBxzXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eHXQ75jb;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831A8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eHXQ75jb
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so13756215e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792820900; x=1793425700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qMiNAXonRcpqrHA/noomKNgnzoBcCy6IIUuJqY3UOc=;
        b=eHXQ75jbOsfxPG3i87e1VO0X3uwPAbBy91TM+fOWXtit2BQpXi9n3dTFCKtKvViCf2
         9Uj1tpZjyGw6WXmVGREnAdblX53nevh2tQe3n/LmE2SBvMO5inlY3/Tp3TjtYzCBzhy0
         R6xnpOvuRt56mZrPbYtPR1DZFp5BJOzucSElqaYBf8MnLWnS4A/KSfPEbAdjuyTX/0xM
         z+ke58s5zokAoOJAFlvEtUb4KXCiEnvZFizByPnR4fKsZ4iJRgcuP6RlCv1I74H0f5oL
         BSOUj3ays7QEJTYf6EmD7rPAS983u/xtjFClZtqAGMvJtXFilpeTwfyrf80K7mFcnfPP
         nzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792820900; x=1793425700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6qMiNAXonRcpqrHA/noomKNgnzoBcCy6IIUuJqY3UOc=;
        b=Qx351rqgCcT9TSGiRqPczTSm3PwbUfxJQzOAT1Es9AS/GaEV6wT5nAKYnt1KM4/9fS
         cAGQWrPwf5GseJqdoQv+9Iu5n+0ditR/4Qv7rKG9VHS5QE3sZvkvhMZBrVV+GBiDQNxL
         DVWj3uf+IFlVeD6GNwGkPQbXxMlh5NP2gMeZ2Cdzs4Pti0K9Wjut8EgdQEmLgJIykvAy
         5JXnSjrvfJoYAX73hxKvq0hAUEr0QyPewOEvMYynZa1ZM+53dcVCXOcNffLaqtWZzd/J
         eeQ81A+S6pbd4c6PxYQf7grFZ8U1icAmZEVxK3gNi/pOtvIjRLnQ6Y0pcw22dNqoXUem
         ltgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFaNEzAnNHZG1PdGcBE149WWKjCDqA3luK+GQ81EzOxYAxGYsiuyvofFE/MxQPQ8xWFfFzgIIzCOfk8So=@vger.kernel.org
X-Gm-Message-State: AFq9FYISAdcbSXfhKe2BGYmlV33WtAKvEBxKFo2jeZQcOt6yU0e7eXe9
	dIiwaxe+8FA83ka1loPwknA0FLa7EzDFWfAPiyz4DhFrMc66usss4bf6
X-Gm-Gg: AYBFou3RRz2pAr5wDh+yhdIMSs1ZMyROCJJZzeMOSnHLE/V+SdPc+GvvFdLSbKYAhW2
	g7hoyWzRtE5jj4BcLM4/cNMe1Nf4n6HZ7TFdvsV8Esloztz1o91hFhKjerz2RLEbIREh7HxmfIX
	hSs8bWJh/OORBzwtREYS//lw6LOlRP6ho4dGDIUUmxVKzsBoTLkuks/VPPJrtB7GLjlDJoKH77p
	eR+93OCMkVL0iz/GkZ5oZAL4ruIzVvaGq0mvYLPdeFWajzIqFBAUXMr36fkWEKwnEsvli5P7Fq5
	RMOp9U1Xo1O6gA+6IDvAqN3eozcqyITn06AhYVuB40HQqXVi2+DJbRNouSPoQX5MD2wOAqGVtFQ
	zp0v/+b52Zy8cDkulX9GDmbmFEVAFtFb6Hr2kcs4TRo4H1HTqw0yDiE0eFeV/0IIUrELfzVwUgQ
	L984ukiqX4Wnij8cvRpAxCZ+MYkT1KJlFAeCRmA+WTq15tf1bH+yJRLrUJc7OoPgeVMJzz+XZxF
	GjKUi4bhQaF0qcQzVTYz8Rj5HygePFNhsB5k/qC3Ljedvy4R0/P5txIkNyND+VTJZOHjzpEdn7Q
	kNs=
X-Received: by 2002:a05:600c:1987:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a35ac3a7b1mr13113545e9.2.1792820899903;
        Fri, 23 Oct 2026 22:48:19 -0700 (PDT)
Received: from Sheldon ([185.4.35.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm30737725e9.12.2026.10.23.22.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:48:19 -0700 (PDT)
From: Victor Carreras <vicajilau@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Victor Carreras <vicajilau@gmail.com>
Subject: Re: [PATCH] PCI: Disable ACPI wakeup on MSI MS-1592 and MS-1594 dGPU root port
Date: Sat, 24 Oct 2026 07:48:18 +0200
Message-ID: <20261024054818.21654-1-vicajilau@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <atsWqqpFptswGQKy@wunner.de>
References: <atsWqqpFptswGQKy@wunner.de>
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

On Fri, Oct 23, 2026 at 10:11:22AM +0200, Lukas Wunner wrote:
> This is x86-specific but drivers/pci/quirks.c is used by all arches.
> It should rather live e.g. in drivers/acpi/x86/utils.c.

Thanks for the review, Lukas. I have moved the quirk to
drivers/acpi/x86/utils.c in v2 (and dropped clearing
adev->wakeup.flags.valid so pci_acpi_setup()/pci_acpi_cleanup() power
dependent tracking remains balanced).

Best regards,
Victor
