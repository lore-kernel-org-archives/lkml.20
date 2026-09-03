Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8127D361979;
	Thu,  3 Sep 2026 09:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426296; cv=none; b=nf+MEkEn6VXOWsSxIA/EbST7b9AdzGTW8WkA2j1k0qdj9dF4YgTreTLrek/s8yylaxuVQ4qeH+GpAQGPp0A/h2EjyzdkY4LaMgA7S1F++MO9Jzl2oGUe6f5HaJZbQYPXZMfC5Q06qQESagHMMKxX2EO1cjFXFSQB+0o4P6AyiWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426296; c=relaxed/simple;
	bh=EfMblQeZRc24S4SdF3z46Mg5I0UjRvdu1DLt0R3zA8c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PCGyEOyziqwVWRKFMI7eoqZUfkC8OSD2MPkv5sfMVFnQoeqaNPsVAkRB/vAHg4gNRf9ywgAWgupBu0wfZejPQh+rdak0uB1ngENF/W1nh3+a6Bh8OrxZPn+LEym1QDlldY5G8H/hMEyS9LmKx3IS7A0z3111jf0cYDabRUr5ftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=b81WW1SF; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=o1ibmwxH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="b81WW1SF";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="o1ibmwxH"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788426283; bh=Kg958laBgwitEnJRLR5zerC
	cOFv7TOffR/ikCii1qAk=; b=b81WW1SFqebXsXzvbFKqMA467xaN7TKayRGK7pYw0/DJRLYBUR
	ohIHaM4Ppl76deu+L0QWto+1KMG7GUWEtSQKccsoXL7bu+2y5yg3J/6VP/OGjwCSyuTsvEZiRZF
	wqBQSxlBr6KnEHglprVL3K+mjDw/CPRlxyGHMlfXSo6HO3rRJq3dYLVrqvnZ7f+zPYXQ6nahoj3
	XsdzVj38+JyOXMexpJ/IK6rw5xWm75VZt2Xw70jfJHZeKZaTQGGj2HZvtWRQIY/8qF1MvWMQYFb
	bAHYRm+hxyxgGY3KSNp7KfhuBZ6NqBvbtWvtw5Is1EbdWxDznaDu8tKTpq1RR+ful8A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788426283; bh=Kg958laBgwitEnJRLR5zerC
	cOFv7TOffR/ikCii1qAk=; b=o1ibmwxH0ht/8RuSYCtduPAEy7T5Tcw5XPZwAa61CLu90a4CXF
	RQ3qhI8ro97jq2l774zO3FO0qYKljqSSneBw==;
Date: Thu, 03 Sep 2026 10:04:41 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
 Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
 Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mpam: Document when to set arm64.nompam
In-Reply-To: <20260903084809.2027326-1-fuad.tabba@linux.dev>
References: <20260903084809.2027326-1-fuad.tabba@linux.dev>
Message-ID: <0EBB8E64-5F67-4525-9DE4-1D9A7DEAA701@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 3 September 2026 09:48:09 BST, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
>finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
>firmware has enabled MPAM, the EL2 trap controls are left unwritten, at
>reset values that are UNKNOWN, and KVM still hides MPAM from the guest
>but no longer enables the traps that stop a guest from using it. The
>kernel cannot restore the writes: they trap to EL3 on the firmware the
>option exists for, and MPAM3_EL3.TRAPLOWER cannot be read below EL3.
>
>Say so in mpam.rst, and add the rule and a pointer to the
>kernel-parameters entry.
>
>No functional change intended.
>
>Suggested-by: Ben Horgan <ben.horgan@arm.com>
>Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/

LGTM, cheers 

Reviewed-by: Bradley Morgan <brads@mainlining.org>

>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>---
> Documentation/admin-guide/kernel-parameters.txt |  3 ++-
> Documentation/arch/arm64/mpam.rst               | 17 +++++++++++++++++
> 2 files changed, 19 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>index 68647ff4bdd24..e6d543de3cde5 100644
>--- a/Documentation/admin-guide/kernel-parameters.txt
>+++ b/Documentation/admin-guide/kernel-parameters.txt
>@@ -575,7 +575,8 @@ Kernel parameters
> 			Set instructions support
> 
> 	arm64.nompam	[ARM64] Unconditionally disable Memory Partitioning And
>-			Monitoring support
>+			Monitoring support. Only for a machine that does not
>+			boot without it. See Documentation/arch/arm64/mpam.rst
> 
> 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
> 			support
>diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
>index 67fe515ed501c..67c8a95391171 100644
>--- a/Documentation/arch/arm64/mpam.rst
>+++ b/Documentation/arch/arm64/mpam.rst
>@@ -87,6 +87,23 @@ The supported features are:
>   MBWU monitors can be exposed to the user after support for more monitoring
>   scopes is added to resctrl.
> 
>+arm64.nompam
>+============
>+Firmware must enable MPAM at the highest implemented exception level and
>+leave the MPAM system registers accessible to the kernel, or trap the
>+accesses and emulate MPAM as disabled. Where it does neither, the CPUs
>+still advertise MPAM in the ID registers, the first kernel access to an
>+MPAM register traps to EL3, and the boot fails. ``arm64.nompam`` exists
>+for that firmware: it makes the kernel treat the CPUs as not implementing
>+MPAM, so no MPAM system register is accessed. Set it only on a machine
>+that does not boot without it.
>+
>+It is not a way to turn MPAM off. On a system whose firmware has enabled
>+MPAM at EL3, the option leaves the trap controls in MPAM2_EL2 and
>+MPAMHCR_EL2 unwritten, and their reset values are UNKNOWN. KVM still
>+hides MPAM from guests but no longer enables the traps that stop a guest
>+from using it, so a guest may be able to choose its own PARTID and PMG.
>+
> Reporting Bugs
> ==============
> If you are not seeing the counters or controls you expect please share
> the
>


--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
