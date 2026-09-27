Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9846037E5D2
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790512691; cv=none; b=ibbQ8mZxPzrtPheoQk42NdxNW/0jUekQQWU8NXrbJvkOxjCFFVWeJb5OgSAZ5N+gs1nrJfTGXWjopUJVFVeYK99PqwTFiBWoye828IJVJ2Z582cgO4iAVJ9rFszmBWTljSIWApebtwaoubUWGrHyOy2TZSaayV7lJ9AkfLpkbCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790512691; c=relaxed/simple;
	bh=NuKsMEW2bmL3HYEzGzn4/Q1vMLgkj5WzRXYhVoZ/eTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GXOwGBuBDvnVMf1QUqYpjB6hUN47BXd5ZoSOccaQ/mq0xbLRmv9bLsEfiCC5/VEt3/2D3WDG58yXgKvPuHBEfaTR1WTi5yQc6wTD4/eV0EnohDvSL1BFoPFrKNn8XPEoIKPhu6OxScvNP0aECIyd1BopvDefxXNQh3TeEIrhD3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e4IweKH3; arc=none smtp.client-ip=95.215.58.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e4IweKH3"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NuKsMEW2bmL3HYEzGzn4/Q1vMLgkj5WzRXYhVoZ/eTE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790512686; v=1; x=1791117486;
 b=e4IweKH32oHAAQEOzQLPOJ6zf76odYVxIcF4mnLVYyte3pGh2/oAzYyV42T1pnBaUehMisrr
 5WRa8tTnPoGg8ckj+gt0hQVOmxCntb6qLWP+I677e9nIkmhO/UCG8KBAD4HJaDtGfrznGthrM7O
 A0f+8Zfzhf74uB0TMUKQP47I=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0b6f4c6ea8c77cd9;
	Sun, 27 Sep 2026 12:38:06 +0000
X-Mizu-Trace-ID: 0b6f4c6ea8c77cd9
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b8e81e2a0bso6232e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:38:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzEDscG/s3gD2iLqb+iorDWEd7qaXWtJh1KJmhWpzYsKxN3LlQdRBZlYtIQwPv/Dh8OvkWxK9190O+Qcl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNcDhXST6zV5n+tyuB0OhmhwH8RjBkN33dVEB53rDOzpPneZbO
	ERHTRMXNH/pYzGJsDROkdwoPQovXg2F26hz4LgL5gymsyPovPuc0BuR+V7rbbndmmkOn19o6XlW
	PzaTGKWQMHMtxaSiVZUzbG5OZguIscUE3gAjWSAG3
X-Received: by 2002:a05:6512:b8d:b0:5b6:bcb:26c4 with SMTP id
 2adb3069b0e04-5b8ef285eb3mr99786e87.16.1790512681261; Sun, 27 Sep 2026
 05:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-16-fuad.tabba@linux.dev>
 <86a4ph5fb9.wl-maz@kernel.org> <CA+EHjTzCQkeXQQcCDwABLR2w+NTmKTG3V6RSmhzYNayaoYXw3g@mail.gmail.com>
 <865x045mke.wl-maz@kernel.org> <aq0628Ci4pfEj0KG@willie-the-truck> <871paf3y1n.wl-maz@kernel.org>
In-Reply-To: <871paf3y1n.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 27 Sep 2026 13:37:25 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzmGzwhVg=6jkHxzV6LF_WsdR1drobOFNTVWNyB1ZDGiw@mail.gmail.com>
X-Gm-Features: AclHuK83YcLXY0C9NhVVfgcTUZxPrypRPxP9P25GK7wvjm4osxpyz56DMnGRBu4
Message-ID: <CA+EHjTzmGzwhVg=6jkHxzV6LF_WsdR1drobOFNTVWNyB1ZDGiw@mail.gmail.com>
Subject: Re: [PATCH v3 15/18] KVM: arm64: Reject host access to protected VM
 private state
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, joey.gouly@arm.com, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	steven.price@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc, Will,

On Sun, 27 Sep 2026 09:20:52 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > and it would be really helpful to discuss it on the list. As you probably
> > know, on Android, pKVM has the semantics you describe above: the ONE_REG
> > calls succeed, but the register state isn't propagated to the guest once
> > it's started running. I think we largely did it this way because we were
> > solving a million problems at once during the initial development and
> > having to pipe-clean VMMs wasn't particularly appealing at the time.
> > It's also worth adding that, to my knowledge, we've never had any issues
> > in Android because of this decision.

That's Android 15 (6.6). Android 16 and 17 reject ONE_REG once a
protected vCPU is finalized, except x0-x3 during one forwarded
hypercall so the VMM can complete it [1]. crosvm has shipped against
that on both.

[...]
> > If it's helpful, we can ask the crosvm developers here if they have
> > opinions for/against the two behaviours?
>
> I guess that'd be useful to know what they'd prefer, and also to look
> into what QEMU does in this case -- I'm not exactly a good judge when
> it comes to UAPI definition... ;-)

QEMU stops syncing registers once it has marked the guest state
protected [2] (bar the virtual counter save/restore on stop/cont), and
the QEMU CCA series sets that flag when the VM starts [3].

On the kernel side, the CCA series rejects a SET_ONE_REG for a realm
outside the GPRs, PC and two configuration registers with -EINVAL, and
lets GET return what its message calls "(stale)" values [4].

Given that, are you ok with v4 keeping the error? :D

Cheers,
/fuad

[1] https://android.googlesource.com/kernel/common/+/cfc696b1fb110
[2] https://gitlab.com/qemu-project/qemu/-/commit/5c3131c392f84c660033d511ec39872d8beb4b1e
[3] https://lore.kernel.org/all/20260903193611.1058589-5-mathieu.poirier@linaro.org/
[4] https://lore.kernel.org/all/20260924160504.853911-23-suzuki.poulose@arm.com/
