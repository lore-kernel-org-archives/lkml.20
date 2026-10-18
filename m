Received: from mta0.migadu.com (out-42.mta0.migadu.com [91.218.175.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584C363C6F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792337448; cv=none; b=KudnDKIXcRGOz3+iKVynIi4raRMtHQBwNbsCH0IVG3+oHpVjnq+zxk0M7T1BW6fAx71WKCoEJFW+oWFZ5Cp4oZX5ty6aVrA5rX3y/Uh3sP4atEFEWfoEBQKQq5negrFJGp5GlY8koEE5QHImupjOOE11BQGvARoAZpWAOpOqhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792337448; c=relaxed/simple;
	bh=/JipYdo2bB1OfUJDoroTZjZ485KsuI12cRAd7OrDUZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lg6NhQ7+UwJ6qw3nmoUfSFxVapRfkX9+PaSlrNpaw23kAxpzhrI0xhrPn2tYfycqu2LbrlVI1JrkbqYfSYX/2kh1/bdytfxCMgThNtMEtZbaQsSaYpzvDrkR1STNdzICZ3JcQe0+9IpyFVYkvLYuHiBFTP2bvNQ4bNsCJaMiKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=toT1BEdY; arc=none smtp.client-ip=91.218.175.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="toT1BEdY"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/JipYdo2bB1OfUJDoroTZjZ485KsuI12cRAd7OrDUZ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792337444; v=1; x=1792942244;
 b=toT1BEdY93mt+VimZs238dQ/O+4pIHIsZWLIvB8b37t5u5xjMo+X9vKf2OTq4HgGzCTOwY2o
 4lLddHlF1APKPWBlNKy/cM3NZCBZ6lpuDLgzKto4cyxvXcMxQJSWoWYVL+Hm1D2UEiR7vaXkDbu
 6CvE9PFzHUW8ySBEotzjJn7U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6a8a9b2f2fa1324d;
	Sun, 18 Oct 2026 15:30:44 +0000
X-Mizu-Trace-ID: 6a8a9b2f2fa1324d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso4820e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGJupL0VhN3kA0HfhmZYEips0gKGdzQrLVUybBT0IE3bK6769lPN8MKl7HFRniVqJQKV/TscqCyQhg3Dg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUbgQkvRce5aCFsAtVGFaZEw5+iGQQI8mIXUPnQsKky4u/obhN
	I/HFR0AJcwvkEI6nA1SCOxh55eicTiUZ1aYPrvPrXs4X7hbAb9aerMMsKM8FubS9ZoHsvZfRHmR
	t0TwaVpqC8zXyLJHF+LQ8Ruwnlxcni4LiCCKR6smk
X-Received: by 2002:a05:6512:4026:b0:5be:5605:3606 with SMTP id
 2adb3069b0e04-5be560540ecmr42233e87.8.1792337439769; Sun, 18 Oct 2026
 08:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014162126.964330-1-maz@kernel.org> <20261017165204.3343275-1-sashal@kernel.org>
In-Reply-To: <20261017165204.3343275-1-sashal@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 18 Oct 2026 16:30:03 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzNJ_Cmzthn04bzHdu2+1cDmwqRsnK1uWQ1XBmxJdt04g@mail.gmail.com>
X-Gm-Features: AclHuK-MBUMuIZ1CdPDTxZws0S-OBMvb5spNuDbDe5Ykb1uD70nnFSK1DYZMkr0
Message-ID: <CA+EHjTzNJ_Cmzthn04bzHdu2+1cDmwqRsnK1uWQ1XBmxJdt04g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Take a protected vCPU's TWI and TWE only at
 vCPU load
To: Sasha Levin <sashal@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for fixing this Sasha.

On Sat, 17 Oct 2026 17:52:04 +0100, Sasha Levin <sashal@kernel.org> wrote:
[...]
> Build-tested only: arm64 defconfig with gcc and clang, W=1, no new
> warnings. The only code generation change is the protected vCPU's
> per-entry mask, 0x6100 to 0x100. Not runtime-tested, as the in-tree
> selftests can't create protected VMs.

I tested it on QEMU, with the host booted with
kvm-arm.wfi_trap_policy=notrap and a protected VM using kvmtool. The
protected VM doesn't take any WFI exits (4415 with the default
policy), so TWI still reaches it at vCPU load.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
