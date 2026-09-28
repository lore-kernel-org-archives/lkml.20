Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA7D4EB858
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611999; cv=none; b=Wyfb93LKaXCBs2vIvj8HjWs4GE9xfv6Jgjj7vsDIaM4i7azkoJwT+lNhfsIGWcBxp/Wuq7tSR9mEbkHUMXtvedTx81fXDEfa7BLfwZ8cipVbx772j80XBInUpXCruMEzeoMaiHqfGzqI/iR+ROObHmWJQwv7mtHIx5Xx33Zezlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611999; c=relaxed/simple;
	bh=VCYMxlYVrU0ZRUnBfl0gDlG7/5tTg9Tcf8QxOVlz+MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AN+wSldhZDzYMU8As6Sqp9ojxwTIpBnb1im0ueS9l40GQqfFECboroYWc9Z+Lc328+24loGURnELrJDpTYYaIhgmwcyT/MeLF/E31++l+0AMMZzNnT1R2iaK1NBUW1A9DjzjXiYsQiMMljJ78wVxAjGzc5cGxA5YMQFDRjy9aqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lWXKit2Q; arc=none smtp.client-ip=91.218.175.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lWXKit2Q"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VCYMxlYVrU0ZRUnBfl0gDlG7/5tTg9Tcf8QxOVlz+MI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790611994; v=1; x=1791216794;
 b=lWXKit2QyuiTLg1n7b/yRXOq6zlZWnaowdPBZg60VdbgqJct7/vl2MOtku++BZTm7QLCZLNo
 2VR6d2+9ey5RHYwSMKcFBirDygFRO76XFtJUBg3sTbEPCqhVp7KHIrjhx780utLdXPq4hWrPL/3
 G4yb4N9uRXqYF56mw2XI+EAQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 79d0b05bb869dc64;
	Mon, 28 Sep 2026 16:13:14 +0000
X-Mizu-Trace-ID: 79d0b05bb869dc64
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso11776e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:13:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzob3HhUcCrNjGVFvmzfaXXs67T9SHKdvmEDrQAh66fdRbhnxYZoUkObkKOYLvqIYLh7siNuV5Jin8F5e8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfFC13P2chEERc+HOYaDmjo42tfp3CGFGjGtbn0tPfk+uiIEeV
	RfsQ/NZ9hfnh0m9eV63V/O9/NA5QUjzGO0vGwROoqPiDPgyHW63r+mke/fMK62m3tbYhRyHHy6p
	KcV/+fG5DyU0XGkt6ZfELGoUcWWlLrziHqF4Yzme/
X-Received: by 2002:ac2:4650:0:b0:5b8:f142:cf3 with SMTP id
 2adb3069b0e04-5b8f1420dc7mr105362e87.11.1790611989788; Mon, 28 Sep 2026
 09:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev> <86cxtx4bbp.wl-maz@kernel.org>
In-Reply-To: <86cxtx4bbp.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 17:12:33 +0100
X-Gmail-Original-Message-ID: <CA+EHjTymQqcARDNHHDvkjFvEuf1C78NsvPJwcnaH4bOu-m9tQw@mail.gmail.com>
X-Gm-Features: AclHuK-OWctusFN_TR3hIpHHx8_H0y3i7Oz0Ee1onONuAo5w9l_i54qFA-ucEZA
Message-ID: <CA+EHjTymQqcARDNHHDvkjFvEuf1C78NsvPJwcnaH4bOu-m9tQw@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] KVM: arm64: Nested stage-2 walk error handling
 and other small fixes
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Mon, 28 Sep 2026 16:58:34 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > retiring with the fault in PAR_EL1. Reporting the unreadable descriptor
> > as a Data Abort instead, for the stage-1 walks too, is a separate
> > change I'll send later.
>
> Why later?

The loop fix is small and stops the hang. The Data Abort change
replaces the SEA-in-PAR_EL1 reporting at the four walk sites in at.c
and nested.c and has to stop the PC advancing past the AT. I haven't
done it yet, and I didn't want to hold the hang fix for it.

[...]
> My definition of a series is "an ordered set of changes that have a
> common theme or form a progression towards a precise goal". This is
> not a series, but a patch dump.
> </rant>

Sorry about that. When you asked me a couple of weeks ago to group
related patches rather than post them one at a time, I took it past
"related" and put everything small I had into one series.

I'll split it. The nested AT walk fixes with their selftest as one
series, with the Data Abort change in it if you'd rather have them
together, the SMCCC filter WARN on its own with Oliver's change, the
three documentation fixes as one series, and the two selftest leaks as
one.

Sorry again :)

Cheers,
/fuad
