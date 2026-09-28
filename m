Received: from mta0.migadu.com (out-98.mta0.migadu.com [91.218.175.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75724E50C5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623073; cv=none; b=gdTwV4/9Fx04aT5+piJjkNEx9RIIhelnjAYK6ne0gf84hW6opIEf5E7UGHoG3lGqOOBCfAjquDLgCiziw6VY8pcG46HAA7cwzpMybwK5jCO+bWr3sb7p1LC8+J25GbkmC3pM6oaqtZPyl6KAccwpfBbhL35u/5x5cMKLsZ5pGOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623073; c=relaxed/simple;
	bh=4aE+Hss1/Jbe7wEGLMDMGvYVtcJjmEg9Q79wOsQKUHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ik7isB0YgrG9Qaj5zR6NqfG0AgWdi5RQXW3q+8ISy/QAs9REwird/zRAyNR+YHAyoca47zLY/6zGCGUCfnmn0hYFqB0IQ22qots/ewnOI9I20dI+ENkSMZIXLPg7w/Vqrn0WmR2hGOVKLYESjR+iWplB9C/GHvldhmJD36UmB3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CHlOtJ29; arc=none smtp.client-ip=91.218.175.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CHlOtJ29"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4aE+Hss1/Jbe7wEGLMDMGvYVtcJjmEg9Q79wOsQKUHY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790623068; v=1; x=1791227868;
 b=CHlOtJ29EzckI7PS3I+50FRTRrGnMMz9ZlW3Ppc4c2d6mYSHk79CHjLzO1rtyk57aI6fpZZZ
 xz1ZADabqeAUG2cRt6JQ6V0PZxj3h7W3GjApUeQjUTBwOTos1I2/5+61/4AhcjNh3yjJz3vXnCj
 2BG0TtYAkyk5u8fD58QHt/Ks=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0e126511511cb06e;
	Mon, 28 Sep 2026 19:17:38 +0000
X-Mizu-Trace-ID: 0e126511511cb06e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8c42da963so1655e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzgcG7Xt452z/Hut87+mspc5wAC/sGLzirWWLCZInvIklNHt+1k/okX4zc4l2WImwR40otwDZJe6g2qFv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYYe7d/8Npz0AbnfU1964N1wd40pmUmP6HTcYSHcFdhAZl54X6
	Rok3xH/KnNbbKoOebMoceyhkTWvilPMHfT6kaeoGYqzzjkPw0me78rSb7bEDF5Kske1ngGh6h7r
	uFW7DMJw1A1Dw2ZyIgIsyB+L7zbXYHosCuso8QREY
X-Received: by 2002:a05:6512:65db:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5ba2e78e166mr10617e87.9.1790623057450; Mon, 28 Sep 2026
 12:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
 <20260928064643.3265087-2-fuad.tabba@linux.dev> <arqeRSIoEwurSrya@kernel.org>
In-Reply-To: <arqeRSIoEwurSrya@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 20:17:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy1rqqBGW_jiBwjdg1b6hphE1KwqvS1i5SDM040d5Cbjg@mail.gmail.com>
X-Gm-Features: AclHuK_rws_wTRAdrWEqO4myn_hhtXgz82YRIViNS-gJjlNQ2cw7YcPYJoEgtSM
Message-ID: <CA+EHjTy1rqqBGW_jiBwjdg1b6hphE1KwqvS1i5SDM040d5Cbjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: Don't WARN on an unsupported TLBI OS
 from vEL1
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Mon, 28 Sep 2026 18:05:09 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> So the FGUs don't actually require any hardware support, they're just a
> representation of our UNDEF emulation that can be applied even on
> non-FGT. That's actually the way we had them wired before the whole
> config.c rewrite.
>
> Can you look into reinstating the FGUs?

Will do. The FGT entries never make it into the xarray without
ARM64_HAS_FGT, so the FGU check in triage_sysreg_trap() has nothing to
match on those CPUs. v3 drops that gate and leaves handle_tlbi_el1()
alone.

AFAICT that skip has been there since the FGT forwarding
infrastructure went in, before the FGUs existed, so I'll write it up
as making the FGUs work on non-FGT hosts.

Cheers,
/fuad
