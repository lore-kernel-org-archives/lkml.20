Received: from mta1.migadu.com (out-253.mta1.migadu.com [95.215.58.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2514AA1E1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370373; cv=none; b=JvR0Mv1ti5LcC5Nleywyp0pfiGpQ5jguiS4WuCYkKjyjYRfQSnx5tw3KL9uDu+6dXgFdaR9A5GL9/rYH2yoGmIK1SHfAGqAvqdd0cOGngeitp6Vu7yjtFoCCisgrzTtTK/6ild7og0vv697wfLwa0adTUBixC9VbHv8GBzKHIgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370373; c=relaxed/simple;
	bh=IYj7GJMoI4iyh7cvdiMZ7m7A/3iJ5WzI14Ui9Zh8zRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dzy6djatv4DG7RKOX76Zlun+ENmket4edb8HsF2NaYc4YgFVyk5ruQLgKADv6OrqjYyGdZjteyw9cSeRYnKsoVfJAJLzQ3lDCvGKw+2ZXqn899cVJHv1YfdkpNF3yi32SMgn5G0IGA9FiZ73lWdljK0XEC5QUzvx3xH51ZVK60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ww8Rt6AZ; arc=none smtp.client-ip=95.215.58.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ww8Rt6AZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IYj7GJMoI4iyh7cvdiMZ7m7A/3iJ5WzI14Ui9Zh8zRE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791370339; v=1; x=1791975139;
 b=Ww8Rt6AZbPM6UbYQlVrmZVWN0sSCDD1/0jCSTHZkN671Vhc5hWsiZGnah45u7V7QB8/YGTX0
 qDYLhh6xiogOLI+ZPrdycW7NiBvd19xZ97x8D/Us0oEpV+P9i/V5mFiJ22uHHVhlxno+q06KGC+
 QNTenZ4bxcClcYH1itzVya0A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 07dbf839de49413f;
	Wed, 07 Oct 2026 10:52:19 +0000
X-Mizu-Trace-ID: 07dbf839de49413f
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so7426e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIKoBAOzvb2JN1O6qDDN2k2Vdntrj8x/+ZW93anmFLUl0qlqL6CzwxALCTrYhGcrOVLtCwDWRNUUkxUTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNTVBO2ws+UeYp7tGEnTGcOBdhfVLf7rfyBhZ7tJVARFtV2xfp
	cZFOrNWmCVkIczG/ueznNhHT1U+/brcwXXgH7w7LCVpBVdQZOPTPavmP6IRUSKxDq4K9fgKVyqk
	tc2YC8cOx8x2cXbJLkqpkLWvkGAneX0fN4Fp5O3Jo
X-Received: by 2002:a05:6512:a89:b0:5b8:f20b:350c with SMTP id
 2adb3069b0e04-5bcca123ca8mr312158e87.3.1791370334717; Wed, 07 Oct 2026
 03:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-3-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-3-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 12:51:38 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyb3-QoLa6P-dGXVdMh9E_vO3p8HceH3TH8h8gPJSd1Kw@mail.gmail.com>
X-Gm-Features: AclHuK9KvLpSDQrj6i2mZweuyXItR2scaGR6GbHNtuuSCxJB5qE1qI3r7GdrQYA
Message-ID: <CA+EHjTyb3-QoLa6P-dGXVdMh9E_vO3p8HceH3TH8h8gPJSd1Kw@mail.gmail.com>
Subject: Re: [PATCH v23 02/14] KVM: arm64: Disable Steal time accounting for
 protected guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 09:35, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check
> and proceed to configure the PVTIME as we don't do further check on the
> DEVICE_CTRL. Tighten this up by passing the KVM instance around wherever
> possible and catch things early.
>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Someone beat you to it. This is already in kvmarm/next as a5b0f36a045e :)

Cheers,
/fuad
