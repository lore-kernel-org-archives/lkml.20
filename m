Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746532;
	b=BS0p/rNwsNACUkU8mNyZ1Eb4GSVl8U47s5CRQ9mXDYfYw+cFXYkB55meBFIOU2tZjBu7
	 8jAoycqD+o39uOVO8RxaxqQ8Q+DeR3WldjoFl1kQY2pjAEm6UScR2ECpUhiVGvrbygRVc
	 LzfJgL7uGjCOUfpuXsqiEKfnfctqmeNMlyS4gC627Fob8ZYbG1eXcBao2CF1AvgtF0tZh
	 foRJeX5Otu9kIfjU5acapVS4TpaSggMTHsz84eeFz78jx7R52Ovp4mVOOGjMn9NXEdZe6
	 XuK1MhG67LObrsdL+7JJ75b8gc7dzJCMTKlq4/hpKEiptwLN/9b0OmdlyWVgN8MMDgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746532;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=aHdZ+oKwe6OINwv5V856+JzJxIwxr2tU0lqEBlQhC6Y=;
	b=EeuBqUc//g2ZiZDmMbkEWMYB32qPDLuHdpZ1LnhMoGwpIPLntpKHcCMeHTa73VhOBmDs
	 GPaOrkimFz+0AyiOll4ZRyExJxVOZr14jE2JT5JWsHQh0pbnaUhQiHdep3fshYy+yBMLF
	 FSNbqYYV//EOheFvTYT0MAjRbn96QT3L2kecTiH6xa/k6dco0KPpsOlwh7+yEVKPk5Q5+
	 vQdMdHawHXVuTIhTK/quWgOu7oIiahA45ziPcj6WR2zIUkegPqfMpL5FG98V9lxjGhWAo
	 j1ZwByLCFe3IgA0J782flvy0rSRwiTTPcU6zNlCCXlRtfjVju3ElhIjrP/IA9aMtClg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U3qlEApq;
	arc=none smtp.remote-ip=95.215.58.170
Received: from mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AB3606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40AB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U3qlEApq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aHdZ+oKwe6OINwv5V856+JzJxIwxr2tU0lqEBlQhC6Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792746529; v=1; x=1793351329;
 b=U3qlEApqUFeFlgq+MT9YrAvkgmuKrevpIXSxFRoURhJHzcjFvr7YOM/FY1tnJ6+rhclCTokZ
 Yq2z9teKlE6Z1na/6dKFF5mZm+N/SurlIcxs4WLDd1FNHsP7MGPVUI8Edlt/2paKLch3CLuKUAH
 LiYItzkN2x8B5tFqOHHKMirc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f6ff7b1a76b1490f;
	Fri, 23 Oct 2026 09:08:49 +0000
X-Mizu-Trace-ID: f6ff7b1a76b1490f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be58ad9600so6444e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByoKIhmLO1nC6i/oAX14DebjJLvHpovOrhfx5l0qQ0WCQrj1L2vvvp5x3CakuMi9QGdSFAlYYpLJIE3hPw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ8P/Lvb0UOQ844UUjyfhihSPG7UGQpCzXybkEZbl9IKjhOXm9
	GP2GhcODwGInoJvGCn/sa+AgIoQBcbnNgA9BxsHo/7Ptcc6mkuGOodFYqNFk1bDbX7biG8B/6yA
	IdDjqHIsRNP0IFhi2weABvMfjbfpWGUR6U14qPM6E
X-Received: by 2002:a05:6512:3f03:b0:5bf:a49c:ddde with SMTP id
 2adb3069b0e04-5bfb06b5140mr90492e87.10.1792746528071; Fri, 23 Oct 2026
 02:08:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org>
In-Reply-To: <86fqxwzul7.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 23 Oct 2026 10:08:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
X-Gm-Features: AclHuK8By_xwbQyrvckEGFfA4cAUoxoiGOv41Z9xRvku379045c1KVkkaVcFF80
Message-ID: <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Fri, 23 Oct 2026 09:31:32 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Why settle for the least capable option? Context switching ACCDATA_EL1
> is easy enough, can be gated on guest features, and avoid the
> userspace horror story.
>
> I'd rather see that.

Context switching it means accessing ACCDATA_EL1 at EL2, which traps
to EL3 unless SCR_EL3.ADEn is set. booting.rst doesn't require ADEn
today, and TF-A only sets it when built with ENABLE_FEAT_LS64_ACCDATA,
which defaults to off. On such a host, KVM traps to EL3 the first time
it switches ACCDATA_EL1 for a VM, and every VM has LS64_ACCDATA by
default. The cap leaves the register alone, and the fine-grained trap
takes priority over ADEn, so it works whatever ADEn is set to.

Should we keep the cap as the fix for stable, and post ACCDATA support
on top? If you agree, I'd rebase your patches 3, 4 and 8 from [1], add
a booting.rst requirement for ADEn and EnAS0, and lift the cap and the
compat.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20240815125959.2097734-1-maz@kernel.org/
