Received: from mta0.migadu.com (out-135.mta0.migadu.com [91.218.175.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13A443A98
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196510; cv=none; b=ET+9YRgiTzp2yloZt0aNM3Ydv393IuFNFTsae1o/fST//6byJGSSZjJA5U4scTCYaHN0ztOn6nwA0xSF2yluv9H3z2HVRjo4z5pSr0dGmLnlB27UnvC6U2FcLhxXiRm97UzbZ2LqI86R1S+ZBuuRLiIcFkeUazcpGFocVXi97jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196510; c=relaxed/simple;
	bh=sV3EdOxAQTAmg19Y3zgY7THPUvOZZFHhczWUDB6Dz3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdqLvMXOgsYp6C5Yoo1RjdvtsxOH5ZiAL8RvOGBryQEgq+DQ22l2609fZFaj7o5kpRIAJ9MtRkWL94YBATyPreG7Lx4pHkQsMY9eDv9BbFLyA6sBYBlL6O80ceBB2JMODa5Gu++MAHg5BUJvK1s+/9DY06JyDglCRM9s0yKYAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T5zWd35a; arc=none smtp.client-ip=91.218.175.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T5zWd35a"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sV3EdOxAQTAmg19Y3zgY7THPUvOZZFHhczWUDB6Dz3M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791196505; v=1; x=1791801305;
 b=T5zWd35aZXKsb9nyBEGa8vqsR2Fj7FH48neDFVqfCRr7EGRwJjUcqx72PsxraioFx6vnEwEV
 M+mA2i8vYD2jO6FQcUtz6WhIB912b1JHP5+wOwnuBUeG9VTyN/R1hXy3Ml2AVSeOz62xVrmMyJu
 KcitFd8pI+rCbfLHGA/uYk2E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6e9fa77e787a1fb0;
	Mon, 05 Oct 2026 10:35:05 +0000
X-Mizu-Trace-ID: 6e9fa77e787a1fb0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so4938e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxl3qNpX7jkXsKtvIUe8bOJc6tymZnKvzCwlJsOfpz1T+svkdbBD/WWXUQznJlvmxHGQ6WsjijCuS6HOnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3HMeQ0D5NfNpTFWcGwEL7ReZjWEyNocqZtFnj38oIhLEqgHo1
	zHH3xi7JhY1q87WpIZ3iVpMwNdkL4hy5NHcKlWLvNKAHzJ/STFmXgmWkfyX9jq5mm/ROTu31iHo
	4xtm3FYeWLQNrBq+L0EGtslwn+KUwHbswyNSYvqgV
X-Received: by 2002:a05:6512:12cc:b0:5b8:c932:f056 with SMTP id
 2adb3069b0e04-5bcb62a9caamr173682e87.7.1791196504126; Mon, 05 Oct 2026
 03:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005050352.836980-1-fuad.tabba@linux.dev> <asNgQDxNQP9Gll-p@kernel.org>
In-Reply-To: <asNgQDxNQP9Gll-p@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 5 Oct 2026 12:34:28 +0200
X-Gmail-Original-Message-ID: <CA+EHjTw0qZ5DVNOag-8Y_LY2pny3LR8fys0_aFd93m8aYXdTWw@mail.gmail.com>
X-Gm-Features: AclHuK8UjgPmg-ubCtS9kjMFnBw5eJYdkkIlGq56U6ct7MdjZtvLfCs824uH56c
Message-ID: <CA+EHjTw0qZ5DVNOag-8Y_LY2pny3LR8fys0_aFd93m8aYXdTWw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Pend host SErrors for protected vCPUs through HCR_EL2.VSE
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	vdonnefort@google.com, qperret@google.com, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc, Oliver,

On Mon, 05 Oct 2026 09:30:39 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I thought we had discussed that one before (or am I making things
> up?). Why can't the host always evaluate serror_is_masked() as true?
> Given that PSTATE is never synced back to the host, it would only be a
> matter of set PSTATE.A==1 at vcpu creation time.
>
> It'd be more palatable than this sprinkling of vcpu_is_protected(),
> which really do not scale.

Yes, it's better for the host to always see SErrors as masked. v2 will
do that when the hyp vCPU is created, and leave
kvm_inject_serror_esr() alone.

Cheers,
/fuad
