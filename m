Received: from mta0.migadu.com (out-21.mta0.migadu.com [91.218.175.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9850327A92D
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791704126; cv=none; b=NBcFU2HKtR9MdSRadArenymMwn3K8LvX8cKCQ9L6PFFUTggxx8oVPPO3+I6L4fdF6/ofHZYzWIOTJgisqD+0V/60A8TnChbyUH/sD04detZZduybNlT+ahWcRrtI5O4VSbuVg9HtfPvso8l6uGQH2WA03Hjb8pz1bsnUzcLyte0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791704126; c=relaxed/simple;
	bh=XNFRYvVDaUFBZPhe3OOZAp9xrDPCoOvOUY4fCTsCUbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCqdOygo3kKcaiA+LYsMMv9xs/YBx3jWlX2lc25RmGRP7KbNAvXm5Wl7aYzjkSQ9knWEVn2C62kQkasxcWuNZ7YgsqqN5KYq/l7BjtLFgzecsl4UhU7ub1EOS5E11VWICo/fRF8Qp2Cd3CXabXn+5ZJIJxbCrCh1HWB7cFfszVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kAjzGqrT; arc=none smtp.client-ip=91.218.175.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kAjzGqrT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XNFRYvVDaUFBZPhe3OOZAp9xrDPCoOvOUY4fCTsCUbs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791704122; v=1; x=1792308922;
 b=kAjzGqrTFkWGp7M92r5AXKq3PHO8X/DYMmD6ohvad4KDgPkndKf7DlEx0E3YOIidYFE9zz55
 hD1oIQWsW7eIJCr7GtMr3E0jJax8HryydDyDuU4eBMMiajPt07jxjfhg4VQ4OayTahuWoeoZdPL
 7QcFSLA7DXZ7MU6f/8X33fTc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 22ed305539deb7f2;
	Sun, 11 Oct 2026 07:35:22 +0000
X-Mizu-Trace-ID: 22ed305539deb7f2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba40832934so2464e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:35:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVBuC8Q6mJ8nf58snMMmQ0XeMyAXNBVnCylKJXJZpbNjhK/mW1tnWE6mcwwtgVMpa0tLJxfzJ+fKKb+mg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLthEOKEXvMGQw3bqVXezr0RkL8FGdj5B498rDKPdVhEwm9jaPl
	MIHcmXjF/d1SKBuECh/ZgfJPuRzJfvKRGFb/Vx3+H6L4J+BpR27KbQUL/HQ1UjN4utUy+Gapcfc
	kKWbCdjCborwdbRGlx8RasPYfY0xKNtCke3Hq4hst
X-Received: by 2002:a05:6512:318a:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5bcea60aaf4mr47132e87.12.1791704116941; Sun, 11 Oct 2026
 00:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009100738.31288-1-will@kernel.org> <20261009100738.31288-9-will@kernel.org>
 <814a1d78-73df-4b8c-b596-65fb82f7cceb@arm.com>
In-Reply-To: <814a1d78-73df-4b8c-b596-65fb82f7cceb@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 11 Oct 2026 08:34:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwgfGzS92thiGFcJ1NgoA732RBqv3gJUWF1gJAE-jANFA@mail.gmail.com>
X-Gm-Features: AclHuK958ZwmXeLPkKS0guZt75r60xrx1-iRJMQxQvR6nqtqq4QaiIIHeVzCYys
Message-ID: <CA+EHjTwgfGzS92thiGFcJ1NgoA732RBqv3gJUWF1gJAE-jANFA@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] arm64: cpufeature: Store every ID register with
 its overrides applied
To: Ben Horgan <ben.horgan@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	=?UTF-8?Q?=C8=98tefania_Ion?= <stefion@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ben,

On Fri, 09 Oct 2026 16:51:14 +0100, Ben Horgan <ben.horgan@arm.com> wrote:
[...]
>> the same way. Everything read with read_cpuid() goes through
>> read_cpuid_with_overrides(). CTR_EL0 and CNTFRQ_EL0, which are read
[...]
> For completeness shouldn't read_cpuid(SMIDR_EL1) change to
> read_cpuid_with_overrides(SMIDR_EL1)?

"Everything" should have said every register in arm64_ftr_regs[], and
SMIDR_EL1 isn't one of them, so read_cpuid_with_overrides() would hit
the WARN_ON() in get_arm64_ftr_reg() whenever SME is enabled.

Thanks,
/fuad
