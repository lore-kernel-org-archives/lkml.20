Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530144;
	b=NCLJBf/Zr3DrRWRt12jhfvZWYJllPMuGcFTAOOEqL555XveqS0KlKTSYcBdKJWwbCo4c
	 CSHu3AdUyIQl7nBloey+b7IpDk1lp85mjBsH9rnnxyomOmoHNBKqcZuL926I5TOKYgDaz
	 AxgYl1oeGU59c8NOmh6p8tH1ZrjJOLOkKEpiPvan00HFU29rx8jbBMMVzMsmJB4J9OweS
	 6OK12r+ze1ujl8c1Vcnn0FPmE3v2yDep46BTXxRXrSqcBWh6kdgHCh09il+ej8e8f6Qdk
	 BDQ1rtFcX4llfolhTEMtD9KOg8nGlU7OHREoA/MbBdTM4LSp7LESqEMOL6aMi1rqESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
	b=gdeszzo3JXFlPbHTtL92qe1AgHSMUkSkTCt2M52zovaRhSBRNUjGe9E9HY5tiZ75QOCv
	 RZJFMMG4jstl7TEGCaStB5nHiIbn4C4SEZ2IAbCxwJb86h32V2Syg8NGlV5wavJC4CaaX
	 sT9jDkZ52MfkGMwpS3q8ixc8xJuhkbRMHFpfiPcq3/8rLiOB62o7aP1CJftNcXwu3PrUO
	 zs8oMplBXjh0QnGMXzCCAIV3PC0wk7NbUs5HJ8RWoFC8SI0gan9UIuAeMnxH0KcliuzCk
	 dkucgzHk2OCtqMEmTXIgp8D2+DIRvuQb3Pck8Xq+dvxHafKNV3gh2tVOOUu1frUIuEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9kFqplF;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07DF606B7C8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F07DF606B7C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b9kFqplF
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491aaed7565so134978f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530142; x=1795134942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
        b=b9kFqplFB4ksjcPB11g7wrzFIgvzhQf4VQ4LwRLiHJrvjQT+Z84PDUc7IV2LD5JEPl
         ZmMlqSn9Zfs6NtZ5wlylT9/0/DhKh8W90+YzWktylsMglqS0lxW/g71dgzPKRJ8jt9IY
         JLK24g9M5vDKhDWDxa1bRSz4655xxriCK1KUYGW1mNMUcX6vzl47Gp8Mlw5DtFUJ/RsJ
         wO5PfU4yhMpc3rzSJg2zZFSD5xQTCBEGbrzXzByK8OhXHaWtE/RXDBYwZNv77HkmOBcv
         l+X3FQNWyF7m1Vg8n7ekhqOs8ngNSPfEAOWc8Dwzx2HOPa01dBCIlB9bWvkjlDMsCdRs
         OrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530142; x=1795134942;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/VnFgYINlRlhY1yu2VcR+eAdnoCreCST0T9Cq05K6U=;
        b=uu45V0rwrFtNkDPCm8oXS14C+N+lCYAcVXVYv11Mi8TdVl8FrBIZWpVfn7EZQSPNnR
         AuO+CCmGBk3ckQZcTT1kkwoXcN54/VzK921XOln7/8ezNnfGadHxMSkz+PoeB/NifuNV
         t+ByMFKrOxeCtDQ6KUEXHkXVeC7BxMdLPlkGTiWdb32/cxcf4TpItdHYoLosK0uxFtDz
         VAI0ljABFcxvXVQk7XBSulbPLmB7K5Ay9JieoyxkTfiYUbTBAFUCuZq7isjKcXpK9yRt
         BkuAykm1RmMVdOHKWe+cN6xfptN1fWsZakVn7ma+aDmhk0wFQjvls/RdGjCp4eDy4vmg
         nNCw==
X-Forwarded-Encrypted: i=1; AL+hErFYaZYIvDz5nkp8KWFPUQxmpNtePxDANWsn7bxs9p1DwbHobRB7tByG3mkdvyhv9ccswO3oWhO7Y8z2JII=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5lh3xzywAp58PQkzzRkZBXBjBzBksObJmosxtXtghsjskw9ES
	mWaK3gpbz6nrvtACb63vkmvQFJFF32/o9l54yaUoYPIRu8wj1rKaR3VH
X-Gm-Gg: AYBFou3B7r8DPgBytTGmFak3VRZ4EtlwdL32+iDu/JisHHmftFu+rGRawFHZObCpwgt
	UA9Qj5G4NyrGl7TNmZOP98KDGdO1fNxqTLsnxQkb8C90uemBDi2/NcMbzyFj6b15tRyE8/W6iLQ
	tHPGJ33CxItGjkAIL1rGmbF4LbSe8yljDYHzIB3FDuh7Nti0cNfEC6eLxBWc6B5KYPChmmGpJJP
	Bxi2I6c6HLNnLFMowx8tIbSTQW5YtgD3HccfYcfx2tziaLplqPd9DXvy4mRRhT9bp+AhtnhpaN5
	OTxcjH/2//muuDPcKPxVhJ/WavzSP4pIH+wwB1PpFvVbi4kVJdfAYIN/hejOKjxWicAEtT2Czmd
	lt9imsMbvioQ1oLWn3itqa6nShfPT1js/dbAbeLLiG59rZIfYpTfunbXXotyEkIwqzyyIozdcug
	LIpLzcCq+0vU09pDUgg1J2RHR4Ce2+MHdwjndPzDGO7IGCfXwptimDjCag5DcNsHvw16Y64auSE
	O4PgLqqkRL9/KdfGZwRGCchegkUv91eCuKY+E8Qjf1VLTDsjTd+eQu9Vzx6JnN5FRXeQYN4X7IT
	8m7ygyYbmAkkt7QLYMxs3QiAgjSKOlrFDYLG1ql8s83AHHrkx9mU3UteUWb4YZMhxcRw5La+6zh
	kTklcsLLZ8pYeE+ggmA55rdXxCfkf9JoKbHhD92y5wNepE8XwczLK6Ob7e2D/prH3PEU5E+CC5m
	XLNWN2yMmSGH0yGW+5
X-Received: by 2002:a5d:6f05:0:b0:48e:d27:bef2 with SMTP id ffacd0b85a97d-49c723fc07dmr1853264f8f.21.1794530142217;
        Thu, 12 Nov 2026 16:35:42 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm2251812f8f.45.2026.11.12.16.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:41 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Fri, 13 Nov 2026 00:35:40 +0000
Message-ID: <20261113003540.3660753-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-5-ghahramani.navid@gmail.com> <P2sItgLkRqGZa4OOeZAnJw@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Stefan,

Stefan Dösinger wrote:
> This would be easier to review if it were split in 3 patches, one yaml per
> patch.

The next version will have one binding per patch.

> Afaiu this makes "syscon" optional. Why do you need syscon? Why might you not
> need syscon?

It turned out I don't need it, so I dropped syscon from crm2 in my
tree. All I have found in crm2 so far are the PCIe clock gates and
resets.

> I think you should be the maintainer alone here, I don't have the hardware to
> do proper testing of patches.

OK, I will be the only maintainer there.

> I think splitting those into different bindings is still a viable choice.

The next version will have separate bindings for lsp0crpm and
lsp1crpm.

> You can drop the phy child node and just add "#phy-cells=1".

Will do. topcrm gets #phy-cells = <1> and no PHY child nodes, and once
topcrm is an MFD the PHY driver will use device_set_of_node_from_dev()
like you described.

> I'd suggest to rename clock/zte,zx279128s-crm.h to clock/zte,zx279128s-clk.h.

Will do.

> Do they all need to be exported? You only need those that will be used for a
> clock = <&topcrm ZX279128S_TOP_SOMETHING> handle.

No. The next version will only export the clocks that device tree nodes
use, mostly gates, and the PLLs stay inside the driver.

You also asked on the RFC whether lsp0crpm really has no resets. I have
not tested that yet. I will try your method on the router, clearing the
bits, seeing what breaks and then checking whether the device kept its
state, and I will reply with what I find.

Best regards,
Navid
