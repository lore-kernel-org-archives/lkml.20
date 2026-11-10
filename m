Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322063;
	b=Z+9dYG26hnF5wl4cte4m3Q6id+Sv35CrLouYz5op1zL0EVKMcpyc7qMmNiwSphlYx8zi
	 Tg9thzQfltEWXq2P716TflvHogSp/ejcDr88L0HQfekKv2wSCJgwbMTNbNusWMx+avxjG
	 Qcn8T9aUk+7/1JSHYTm2rPMNAsbC0DoKucPAth8Q5zrpvPZ8YWb/KrvsFo0wwppJ7Iw4K
	 sFISrVrURKMXWFUWADenSN6rmBjPesfDrdLSeUQ5RVyDqcSljVFB3yP/rlbj4uEgda0SU
	 g89pmkSLA3AN+IXNVPttZCQCQLdjSfRbGabwJJcimlORkgtZfu+4HJFJ9oilyC1HAVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZFEAJe5RSOFhQbOQqwNvxFPxejburOXhpBzwnwwZqdo=;
	b=nF44hqtD7LgFKQLBRHxzlgQCySKp0VY43qUY5WpgGcx9v41YVvotfu54uDt48CUYFs9S
	 WHrq7oTJqmecHpkTV/XRuBQW5fXxZMNoSoM7/7cFMrHylzvIq6uy/5N/rXurA9mkuZ5UW
	 EBaskjkMfQAFu8MzTvj29TE3VEHG6FkvAmqEjGkS8nlf4LYO3ukgw/Poi2x++se1mYG7r
	 VgX9yY8vTz5qcRdrQUBijpsFtP/hoAQtpPqiyP/QZLM3UPayPgxz2ylznMvP7sgplv0yB
	 4eDVIKC5Y+9V/QLkxZJDHCOTswMfXxwxZJsyRDGTLJR4WSz8bFCW20TAE8l+XGbTJ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="f0p/9ton";
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7BC60A2619
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D7BC60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=f0p/9ton
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-980c4258105so1055870241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794322061; x=1794926861; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFEAJe5RSOFhQbOQqwNvxFPxejburOXhpBzwnwwZqdo=;
        b=f0p/9tono6w5KMbcB2YOWm+TL1bShXXnItauTtZcZIA3ZauQXIbiJ6XJ3s2djH87ip
         I++QPXZ24umXJMRImSi8/Qtd6+iFrcnT1HCa/uiivkfR0qrd/97rzFC1hadvLbEESsaB
         etu/IGSL3ldDcWfkSkPBixVVJFSZv3iv/bSMW1Rio9VCub4uYaphZ0lH5RCS/fOG3ABi
         /O6QwjFsFbHtDlsKHFz0JeXBwhyg7Z7sLtN8pt+pKSeElAl0i1sTmRS4FRBJVDtQlrzt
         EhBrv7K/eUdt9HAfk01RcYnkVOJY9hzzR0qNueqX0ulGGRpYW+6IC8NOTlwyCaBHLrkt
         cfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322061; x=1794926861;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFEAJe5RSOFhQbOQqwNvxFPxejburOXhpBzwnwwZqdo=;
        b=SHPQNZMFUxU7VAnzBXJmCmUzJBoTqTpP8hFvSLkMfd+OQeZoOo95NgN9V2QYx9VsEO
         /hhkC66i/1p/Ko/Fz2k7cc5KQd5rIHtoHIvNScxiON7g0+B8btPE41NibsFXD8KuxW+s
         kgOjHyqGL2tJ+5+82ks/CNqpLiVy6nzogAL0OzFEzLw68fRiyarR1NQ9gyYxFC+C3IcJ
         IlCeL9YUlAMAFO+3JlmAYvW8xWFe0XizCFv5BKdgd+nxKvvTELaWjHjtUoWkDuHiun0N
         rOV4+2I9bjtzkCwlwZL/yaR8AFusUgLsLnTG9qPXV3KMwaiisuRhfRUyuUYH3t/N0IIQ
         qRDg==
X-Forwarded-Encrypted: i=1; AL+hErHM9EjixqpzCB3e8BCLnyhdHepdFGrWYKtHsK2kks4bnQ1ImAKmnLrzSFoz+j58YwSiAPCITYMP/hjs054=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eiht/kgFyQtqmIYpYD5S/qctKeSzNmU7wrINVCBgPECPpWL2s
	ooqK0XrYd4rfdZmu3B69mPzcbszYUvj2tA/y+OPoQH8sIdY12P/zx7CUBRPkct5wP4o=
X-Gm-Gg: AYBFou3sEYyunrymbNxLDf+AJjZuWxs4K6JyUgJvWcHwUfjxp9/opLBGBl2D6bVn9QX
	z6DHfCll4AjTZrFe/679GZoSRu692UsiGU/0grwgHt0rIi2f/XxUezpJMxB7SFwGzMttyV1UH/l
	So4p7rq6MHEC6DH5xCMqnbnQUe3VcOe6EIiKSqAr4/jWoBsv9NcNpqBQeTRAL1d9RPYOCM/IpIy
	+pgdSL6AGzL/yLTybr8v15JBBK1Sv6vve669lp9Q8NPRd2BhuyQwZhpLq590Id0U+IPKqoYprc7
	h0IQRLhlm9CV1d7zbcpXZfz8GMU4P2Z6BrBhJFmO0IpnAM7kM5KIWnHoXbtFrNN2wfezsNdqYNP
	jl0bgt1n4cZtvQVlR4SiA5XXg/z947X08vlrJdarfSZb+rSnYFB6cKUFD5fSnIMPtEI2kBGdqOn
	ChgvUal1fyqc68rFdMgM47w14gCLxAUpiolxpSv4nZTFUXSbpUTqLBRHO/8PEOFAHLX2XQ8RxSf
	86DdAc1G1+dyf506MiZg/CLEwXptiu9yDYFOKdzFV3gnwdra423r++sf6GoRZg3CyEhZdZa77Xz
	XNIiHMmZJuKU0oFAojPkdRQ+T5EApOG3MOjzqa2keL9KToGTM6FkMGvKTqDvKW4kYO8sn29+Kt8
	9dGtAZ95ad0Ix7Q2+CYVqsj4ZcS2nLjnaax9u860z7VBzGag=
X-Received: by 2002:a67:e706:0:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d301c2b6b9mr1064638137.18.1794322061210;
        Tue, 10 Nov 2026 06:47:41 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2003b37csm1895903241.6.2026.11.10.06.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:47:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 04/19] liveupdate: Reference struct luo_file_set_ser
 via serialized pointer
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, maz@kernel.org, 
 will@kernel.org, David Matlack <dmatlack@google.com>, 
 Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, 
 loganodell@google.com, arnd@arndb.de, dwmw2@infradead.org, 
 baolu.lu@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>, 
 oupton@kernel.org, alex@shazbot.org, gle.com@google.com, 
 pbonzini@redhat.com, Andrew Morton <akpm@linux-foundation.org>, 
 kevin.tian@intel.com, joro@8bytes.org, kvmarm@lists.linux.dev, 
 linux-pci@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
 kexec@lists.infradead.org, kvm@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, skhawaja@google.com, sagis@google.com, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110050202.529473-5-tarunsahu@google.com>
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-5-tarunsahu@google.com>
Date: Tue, 10 Nov 2026 09:47:35 -0500
Message-Id: <179432205559.2329176.7688399969919556416.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=791;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=qYrWWLSjrMyi3btEEyRhgD14ybrNmyQeqN8ETOUOvP4=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8y6LmPCnN2SrnZCSda58BBnTZsMnjk7g+kA/g
 6Wo/AVJiseJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavMuiwAKCRC7dyhM23N6
 3qrED/9liUyRUpQr+Sv1ioZ2pUvLcetyB+2JoLxaB/0UYYNHqDXpwWtEHhSP3eAYwEET2WAzSzb
 cINjQ0UdR20OJBBxpWT+3R6jrxl6smFx5lA1+CtzCdBONdl5NiW3+NITRy2Ip//vGFZKdNjWFk/
 5Y0ii3L7iz6hVXT9R9y6mqGOo2TBCSa84xWnOGrVJ8ijAnCqgOeAMhmqVN+rkl/dWCvzMcCFZZP
 AYRuSxmCQaOa9GxsOttPL5pX10r/UbwioXQZu/aJ6RcG+ql2liIZFv1+3mcSyInleN3SlnUZOVi
 inOQM3Yp2D1a6ekPH7F6Uzb45X4qnnJ8DSfO2LkVSWgmzzpsKuXUePJ8Pe0a7FfO9mUYj5Fp9wg
 IxfJUyigWzzPN0aOcgePZcZBT4fLUlw+zQV3UGnfTiTzevMagmFWU2+B/s0Zt7u6TidXvFQsMFI
 6ZlD5aySuQGLYM3+UdGdp96SY6FEGgvqmSCG63zPbq7Y2WqSBl153diBep17zLt4CJ8n3Fd+YrU
 E2rPF9GR7k6MT1Qc2tSSvCCk+cTjcDt4Fm3op7Z6LrxP3BQDFa0Fh2afBgG5mCHbK8fSxd2uggj
 NuHbXeBNgQpe1vKYQQd97AUSoFlymseer2cfqgpdkxtIZwGdPAYPchrVuPHKx6mZDNkSz6VZZ49
 k5DwAzPXt9kz4Og==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Tue, 10 Nov 2026 05:01:47 +0000, Tarun Sahu <tarunsahu@google.com> wrote:
> struct luo_session_ser currently embeds struct luo_file_set_ser directly
> by value. Embedding struct luo_file_set_ser couples the session layout's
> size and field offsets to struct luo_file_set_ser, preventing either
> structure from appending fields independently across kexec.
> 
> Convert struct luo_session_ser to hold a DECLARE_KHOSER_PTR pointer to
> struct luo_file_set_ser instead of embedding it by value. Reserve space
> for both structures in each session block-set entry, placing struct
> luo_file_set_ser immediately after struct luo_session_ser, and bump
> LUO_ABI_COMPATIBLE from luo-v5 to luo-v6.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

