Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76933C1B4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492396; cv=none; b=uT533mZEiUPk962KTNEPUq/ZyrZ5CqPaj+BclF+i2HSmoKtAKmQmJjSZfq5Peii/JKMwus5mDMfaiuKWObzfOCLgw/wGb4B+FE10y8tl0K4H+MXex7X8g7oxTPyB/ostHDhQ4NPI5K9q5RbuzfYe9Jrbpc+TR1+vIMbbzq61UJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492396; c=relaxed/simple;
	bh=Jp96XiPKTcamQsTvuwBYBtrk9Zn8cDubgT6B+0WBg94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3JEvPIlDn3T4x+oYEalb+0M+5C+CxXp681C8KjqTjXv6zaRltFyi90BGDBc4+GE9pQBUiSgLzaG1nvz+aF2wMNHBhlRe+zmZ3fBImOjZo7x+a1auQF+/gX6c3sCTT80LwEVqHD7rny1lo3crqET3yHkKGDRl44ypAVgzEHY8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IF6jRfTc; arc=none smtp.client-ip=91.218.175.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IF6jRfTc"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jp96XiPKTcamQsTvuwBYBtrk9Zn8cDubgT6B+0WBg94=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789492390; v=1; x=1790097190;
 b=IF6jRfTcRmWvVffda//Ydix+eefert3Kjdx61GO12VgBJUqinihzwPDNlseb4Y0WrejOR/rh
 KGg4q8BcutnfYIG2iYGtXsp4tulQPfQ+kCIumW2t8OlyIRyvQ4Wqh564tmO+zWzfg9A90qryt+P
 QbEANCtFp9AWWSSkv7CBdcmg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 308bb04ad4d11440;
	Tue, 15 Sep 2026 17:13:10 +0000
X-Mizu-Trace-ID: 308bb04ad4d11440
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so151e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:13:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByglOokFxLtt6gcV5pj+F5rjq1bFe5xX3UfbdxMfNmCFrS8Ad2ePoxW2pdcXOj9AYG6y1H2I+0rm1qFVhs=@vger.kernel.org
X-Gm-Message-State: AFuF++m6eXxgppquqAQrY0A9kpEchsf6s2ZhPndSPDYxzKjXaBlxswTF
	QiHeOTN0gmwd5tUPj9djn/qEKXZqK3mBKKGBa+NcBiqOQipSD2VfLMAv0/YmNv41a4Wk8fYEoDO
	1T9oJxd4G3Z2wpgrM+5wi/jQTNozy/z9UJdsUTwdK
X-Received: by 2002:a05:6512:1194:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5b8b2d5785fmr187938e87.12.1789492389080; Tue, 15 Sep 2026
 10:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807164322.2970811-2-sebastianene@google.com> <20260807164322.2970811-14-sebastianene@google.com>
In-Reply-To: <20260807164322.2970811-14-sebastianene@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 18:12:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxAb1vDZW2zf0L3S4JmWMULuNPcO=8KkwZt6TasSvEukQ@mail.gmail.com>
X-Gm-Features: AcwNN1W6pe0lKiNtcjxGTo4pp5BEYRvaWFFOe0G_chQeibnLqZ86nTCgbdmtGNg
Message-ID: <CA+EHjTxAb1vDZW2zf0L3S4JmWMULuNPcO=8KkwZt6TasSvEukQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] KVM: arm64: Prevent the host from programming
 new GITS_BASER tables
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com, 
	maz@kernel.org, oupton@kernel.org, rananta@google.com, 
	Sascha.Bischoff@arm.com, suzuki.poulose@arm.com, will@kernel.org, 
	kvmarm@lists.linux.dev, android-kvm@google.com, bgrzesik@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nathan@kernel.org, perlarsen@google.com, seiden@linux.ibm.com, 
	smostafa@google.com, tglx@kernel.org, vdonnefort@google.com, 
	vladimir.murzin@arm.com, yuzenghui@huawei.com, zenghui.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

The GITS_BASER restriction is right, but the new range dispatch lets a
sub-word write through and the masking is incomplete. A few things:

On Fri, Aug 07, 2026 at 04:43:22PM +0000, Sebastian Ene wrote:

> diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
[...]
> +static void baser_write(struct pkvm_protected_reg *region, u64 offset, u64 value)
> +{
[...]
> +        value &= ~(GENMASK_ULL(47, 12) | GENMASK_ULL(9, 0));
> +        value |= (baser & GENMASK_ULL(47, 12)) | (baser & GENMASK_ULL(9, 0));

baser_write should force Valid[63] and the cache/shareability attrs
from the snapshot too, not just PA and [9:0]. As is, the host can set
Valid on a BASER that setup left invalid (pkvm_setup_its_shadow_baser
only mediated tables that were valid in the snapshot), which activates
a table whose L2s hyp never took, and it can change a table's
cacheability/shareability. (Sashiko)

> +        writeq_relaxed(value, its->base + offset);

offset is the raw trapped offset. pkvm_its_emulate_handler now matches
the whole GITS_BASER range (the num_registers change), but it still
doesn't require reg_size == access_size or offset aligned to
access_size, so a 4-byte write at GITS_BASER + 4 reaches baser_write
with offset 0x104. This writeq is then a misaligned 64-bit Device
write that alignment-faults to EL2 and takes hyp down. (Sashiko)

And forcing the address from host_state->tables[].val only points at
the right table once setup validates the snapshot against the hardware
GITS_BASER<n>, the same setup gap as the tables patch.

Cheers,
/fuad
