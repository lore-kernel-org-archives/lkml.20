Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732934;
	b=rNtwymZfXvjF79S7Rrn+236w7qRb5O4ueMacqgjranz/EKoEbLlP4ust6l8YztqPokjS
	 0tam5YJalh9qF1rdb+l6qo1CGhc75ZYctJidrFn3SacjBd0098ykT/vsmBN3+knASsh3G
	 b4mU8D6FTKeMeHNdgnywwb4iYqUUJ+E/lh272k6vQSvr3vday/x+NVNqfiWryXm4v87dR
	 7WTFQvw819Tg3To6L6uj/BkhpjLuD3PeykC1Jx21MuuVAsgVgA7BZCXHbcUk6zjveyTXJ
	 qvM/2y/fH8joGquQ6r3QqPS68Mdhi8vXKv9r/TusjoPcjjKTDRlo7mzVE8P70HrkTGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732934;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=yRNBCNleXapj6/D9Dy5JVT8U1O3DIrFP6P/UGlFxQWo=;
	b=qTADzW7VdOaW3y+07lr3CiXCXfhydXMCHLnTI0x3v3LkRK3Ty0Hg6suoft0gWoBrnCwW
	 w239m0zNoJNVjRj6rfvJ/SE9lYtnxM2Uq6jx1Ylrxg1HXubJ3191C0oVrEd2oMOo4jL/o
	 Vn6/EykUeDGn9AuoIGZKZmWLuNL+y+/x6CJaTXJ5BIvCuXLSn1I2oof0nOB6YTiBKM5XM
	 6+9N17AEBCeK6u/lHp5/f602PCvk7yI8DXCZtce4zYEYBceanbKaKaVksF2djOW3aoEVS
	 QtknFmmE1di7XjuKt/jfB0l4bTYT7uxSH1IL0kIdiiG67ZHxEZYB683sVjVB4hifvgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k7QRZwec;
	arc=none smtp.remote-ip=95.215.58.245
Received: from mta1.migadu.com (out-245.mta1.migadu.com [95.215.58.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78238606D807
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78238606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k7QRZwec
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yRNBCNleXapj6/D9Dy5JVT8U1O3DIrFP6P/UGlFxQWo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793732930; v=1; x=1794337730;
 b=k7QRZwecMPnx/QNoipPrtAdaySBRx3hl/uQlIte0h3pc6j81BpJEyvmJMLgjW27PEHJq3fn7
 GkuylPGVP2vVQAAVeS8Oy4wl+cJyPCsgsCg66qoNrR9SUQFmRC8N3yFoJZsBgcarJPO7eHERG1h
 Rmgtj6Y4C/A9hI8OmLBMy01o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 22604391e50f1ba4;
	Tue, 03 Nov 2026 19:08:50 +0000
X-Mizu-Trace-ID: 22604391e50f1ba4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so1072e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw+slOm4DJgLyElkeZEW6+YDJv26I72MS838pzVU5aRETSjLYqa3Ycrx2hT5rl2V1N3Pm5x/C4/ttrC6Tw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1MIIAaYUYt4xERleYenAqIv113RUQ7UtxQ7MFbd0yLUOY8bSK
	z+hs20u6WsHzf5r4+LeoRCCcnyFX0GY1agj1Cr/V98r8rcVJJDeCPLkHMxG1qrjAb8pNrVnRrsY
	IPEOmuHScdUm9NBjlEl4FHQKDuHfKBeTIJOZa58QK
X-Received: by 2002:a05:6512:6c8:b0:5bf:c9c6:ae92 with SMTP id
 2adb3069b0e04-5bff406f902mr12922e87.7.1793732925312; Tue, 03 Nov 2026
 11:08:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev> <auoT0b1LxuDlZOnc@kernel.org>
In-Reply-To: <auoT0b1LxuDlZOnc@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 19:08:08 +0000
X-Gmail-Original-Message-ID: <CA+EHjTynpZOE5s4U_Ls4WHdhHqTTo5Vp8YqKxK3EwxBT3O2XVg@mail.gmail.com>
X-Gm-Features: AclHuK8AbjAuWLo00Tzpop7EQF-bwBMdIvmJij4-h9aVeKs-eFdilzti7zR-K-4
Message-ID: <CA+EHjTynpZOE5s4U_Ls4WHdhHqTTo5Vp8YqKxK3EwxBT3O2XVg@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: arm64: Stop stage-2 teardown scaling with the
 IPA size
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Tue, 03 Nov 2026 17:03:13 +0000, Oliver Upton <oupton@kernel.org> wrote:
[...]
> I don't see why optimized destroy walks for CCA and pKVM is
> fundamentally incompatible with driving them from a loop that
> reschedules. Non-preemptible kernels are still very much a thing, I'd
> rather not undo the fix we took for that exact use case.
>
> So unless I'm missing something completely obvious, I'd rather that CCA
> and pKVM do teardowns from that loop.

In v2, pKVM's teardown will run from that loop.
kvm_pgtable_stage2_destroy_range() will return where its walk stopped
(Suzuki's suggestion) and pkvm_pgtable_stage2_destroy_range() where
the next mapping starts, so stage2_destroy_range() resumes from there.
That replaces the pKVM path in patch 1 and the lookup in patch 2, and
I'll drop patch 3 and the Fixes: tags.

Thanks,
/fuad
