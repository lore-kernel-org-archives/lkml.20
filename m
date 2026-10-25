Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792917315;
	b=U4vh9ec/efajF9E5aBhsi/j/1AD4E0mjcvgYnNVXdGqyE3SEPmEClC+r5a1e26sRnI8L
	 1UNhinZhxECSYYr6BU9z7cjDjh+vah2jTVeilE9Ib0c2PT35pZuTkIS3BIM7YdDU27cHI
	 +eUoFwA+MOxS4kaWtaEt1Uc2mvGZmOG3ehfsFynBpav3ibtPtQ8lTSrKyARc3Z0ThGHpN
	 cliayOKAixhGHCjkF1ZgrsObj1uG3SLjZWWjSiVIXVei2OVxznez/lWmgm+INg7GEUz67
	 Tvrgmr5lPUwUbLJsgMudOm8HZaqVXVBVZzQ6HK34Zt+8kPF4/aVYjGKF4hKH7Vbn5dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792917315;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Umtx2QekNJJOh/UY3thL10Al6ydHDa8XNgIJCQa01dk=;
	b=UlUvTDFpS7f84jMk9h5RSHRH9KuBOtCXXkDeNUtEGdSadsq53Z6Hd8pYKQKAhItfctq9
	 bQaSKebIxrYnyM8MhyPLvqbZxgcuZEDAgOkMk4hCH+XUFerokGgD4S26rwLpblbbJ55Ek
	 PTIjtc/oh81Mi8aJQxAFv71twnfFbgD2XV4kugbLpJnGoaMs9//qo3r7kIPhGfCdN+EEP
	 qOyPg1DWeOl88PgPZXKz47rVPh6rw8vMH0dgfFF6MBJC1FCnF/D/w49PsVWjEtzvus1ep
	 gE+w/INrrnCZKye4XAwROn/QKwiWBvirbreb3k2lT/hZ0j93LghC70s4qZeTZKpYrJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HwWbrWr5;
	arc=none smtp.remote-ip=91.218.175.48
Received: from mta0.migadu.com (out-48.mta0.migadu.com [91.218.175.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A74606A321
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HwWbrWr5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Umtx2QekNJJOh/UY3thL10Al6ydHDa8XNgIJCQa01dk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792917312; v=1; x=1793522112;
 b=HwWbrWr5kH39BlfikdLrFRyIbdJ1SbM/25MQ0oJN7Kxw2ZeucgCjJrW9BeMyajcuruWsvBXD
 UCCAlVmD2sJeqgj0zVacQGoE3ND93S850cPquuJy79YAKXFTU/bWuTf7/Q6YF9+dtyDBlBf0g2t
 rOrY2GFtgFC6soU5zT/EwhQw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 397e6e464de94714;
	Sun, 25 Oct 2026 08:35:12 +0000
X-Mizu-Trace-ID: 397e6e464de94714
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be58ad9600so5801e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:35:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzkEC8+0iXoAHXw+m0taKu62dgYi7eEJQuQG1unQ7eAV/+Ihch23GaBxusReax2ZwknfgQTSsCwXXAF9Jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtneJAa+y3TKFfDH1X34n5WLwcXVt9olFbLRUlP7DvHXU3aAXy
	XqFuk42O6cQ9YyIY9LY8xsbfhNwtdU8IGhc5c/F0ice8GL7bag6dBPmDX5e1WKjZBVgR174nns1
	3CiymgGjx7OCjtD7Gcf3+HzhtpvLOZeGee8pi80Ki
X-Received: by 2002:a05:6512:3a8a:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bfb79cfb9dmr89930e87.14.1792917307506; Sun, 25 Oct 2026
 01:35:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024161118.1007472-1-sashal@kernel.org>
In-Reply-To: <20261024161118.1007472-1-sashal@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 25 Oct 2026 08:34:31 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxKRThB+kp33nALkEejj2L8vDxE=SZYw+0KyHodYu0y8g@mail.gmail.com>
X-Gm-Features: AclHuK_kP_F3xF9Iyo3ZWQZWl_t2OJWVWAHcLTFVaYw38-o0EI2yWRjxxMOJhA0
Message-ID: <CA+EHjTxKRThB+kp33nALkEejj2L8vDxE=SZYw+0KyHodYu0y8g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: selftests: Skip ignored AArch32 ID regs in
 the failed-run test
To: Sasha Levin <sashal@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sat, 24 Oct 2026 17:11:18 +0100, Sasha Levin <sashal@kernel.org> wrote:
> test_idreg_frozen_after_failed_run() checks that changing a feature ID
> register after a failed first KVM_RUN is rejected with -EBUSY, and does
> so for every register in test_regs.
[...]

I reproduced this on the FVP AEM model configured with no AArch32 at
any EL and with PMUv3, under nVHE: set_id_regs fails on
ID_DFR0_EL1_PerfMon without this patch and passes with it. It also
passes on QEMU (which supports AArch32 at EL0) under VHE, nVHE and
pKVM.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
