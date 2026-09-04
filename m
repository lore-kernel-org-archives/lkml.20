Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBD146F4A1;
	Fri,  4 Sep 2026 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518138; cv=none; b=KLE0v2xbbURPKgbKrKE3up6uO/VFoslo6F6RUVkucCZY2igp+dj6L57ALgdzfZIOaf/Ij3i4qFsNul2ozGmVkmOHaCtGOoxu3wy6t9sOKW0qv4xp80Eem3wXVKl1puAvco8gZZzJlKs0jGNXsxKmq3iR40dEVRPMN4Uw9qBA+ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518138; c=relaxed/simple;
	bh=SKULSKfuno+ueNu0AjGt23LpDeyuye6kvTlQxfI14G0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JpF0Fu+HUwz227wvc5eGLkQtNFvaJG+0MNibDMqZS13hcfwZNlv4DM0d8zNVDPYW1QR0dl8i+uAOrm1xxxg4/TAEYjlsOmugaj1SdnjNCXSB+RbW+EiXkUEo4sXvCWCFLKY2blB1wMRpEMitRKedGiZaPKh+YuL1ZqlSjiDJuag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=jLUK3uro; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ieSebnxf; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="jLUK3uro";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ieSebnxf"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788518125; bh=IJ5O+OMRxzlXnTpP7WXm8UG
	KXRpHVfEKgrPFOTuwCuk=; b=jLUK3urokkvA+3WXiyGtulLBSDkDFdht2Lj6bcSwqDpVmxW98N
	Yu9dbgsRUm2l6QSpO2yRj/xkrf236hfanDk0cU5vnO5VrBzX0fUUcODN5Y3/C9dFSKlgo+APRf3
	I4l7PFxshiTtPGU2A1wplMk4uMJi8dnRE5uCY/W3MBxXNyGhWUjJ/8/Hc65izm5vWnIrwzPvzsQ
	tGek0x4adSvGpNAIKXxj6ELJuejVd8O9ahW2Dh4mK1andFDNwWZyEqmiHjMSpku52jbcCW34/WJ
	dk2hEqcbKqwmLMZFZayOWoLAND+1GgK7z9WeSVHgLytfL/EZWkwc62qxa9Shr6BIOcg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788518125; bh=IJ5O+OMRxzlXnTpP7WXm8UG
	KXRpHVfEKgrPFOTuwCuk=; b=ieSebnxfCjP2z9WpDNu8VXn4gIzMcBrPQm1phBnVhyUeH+ZAEw
	1nrSLfq2B1wWQfyHphQ+QuL91OE1tE34hIAA==;
Date: Fri, 04 Sep 2026 11:35:25 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
 Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
 Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: mpam: Document when to set arm64.nompam
In-Reply-To: <20260904103131.627392-1-fuad.tabba@linux.dev>
References: <20260904103131.627392-1-fuad.tabba@linux.dev>
Message-ID: <9CE4CF72-74D6-493D-9F92-2D14CDC05C68@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 4 September 2026 11:31:31 BST, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
>finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
>firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
>left unwritten, at reset values that are UNKNOWN, and KVM still hides
>MPAM from the guest but no longer enables the traps that stop a guest
>from using it. KVM never saves or restores MPAM0_EL1 and MPAM1_EL1, so
>what one guest writes reaches the next guest and the host. Nor can the
>kernel make the EL2 writes unconditionally: they trap to EL3 on the
>firmware the option exists for, and TRAPLOWER cannot be read below EL3.
>
>Say so in mpam.rst, and add the rule and a pointer to the
>kernel-parameters entry.
>
>Suggested-by: Ben Horgan <ben.horgan@arm.com>
>Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
>Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>---
>
>Notes:
>    Changes since v1, the first three from Ben Horgan's review:
>     - Put arm64.nompam under a new "Command line parameters" section.
>     - Separate MPAM3_EL3.MPAMEN from TRAPLOWER, which v1 conflated.
>     - Add that KVM does not save or restore MPAM0_EL1 and MPAM1_EL1.
>     - Drop "No functional change intended." from the commit message.
>    
>    Bradley Morgan's Reviewed-by on v1 is not carried over: both
>    paragraphs, the section heading and the commit message changed.

Still LGTM, the only arm device I own is pixel 7, and also a modern arm
test-peoples-crap box. So from what I recall, my tag stands 

>    
>    v1: https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/
>
> .../admin-guide/kernel-parameters.txt         |  3 ++-
> Documentation/arch/arm64/mpam.rst             | 25 +++++++++++++++++++
> 2 files changed, 27 insertions(+), 1 deletion(-)
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
>index 67fe515ed501c..e66b1359d1282 100644
>--- a/Documentation/arch/arm64/mpam.rst
>+++ b/Documentation/arch/arm64/mpam.rst
>@@ -87,6 +87,31 @@ The supported features are:
>   MBWU monitors can be exposed to the user after support for more monitoring
>   scopes is added to resctrl.
> 
>+Command line parameters
>+=======================
>+
>+arm64.nompam
>+------------
>+Firmware controls MPAM through two bits of MPAM3_EL3. MPAMEN enables
>+it: while set, the PARTID and PMG in the MPAMn_ELx registers label the
>+CPU's memory requests. TRAPLOWER, which resets to 1, traps accesses to
>+the MPAM system registers from the lower exception levels to EL3.
>+Firmware must clear it, or handle the trap and emulate MPAM as disabled.
>+Where it does neither, the CPUs still advertise MPAM in the ID registers,
>+the kernel's MPAM register accesses trap to EL3, and the boot fails.
>+``arm64.nompam`` exists for that firmware: it makes the kernel treat the
>+CPUs as not implementing MPAM, so no MPAM system register is accessed.
>+Set it only on a machine that does not boot without it.
>+
>+It is not a way to turn MPAM off. Where firmware has cleared TRAPLOWER,
>+the option leaves the trap controls in MPAM2_EL2 and MPAMHCR_EL2
>+unwritten, and their reset values are UNKNOWN. KVM still hides MPAM from
>+guests but no longer enables the traps that stop a guest from using it,
>+so a guest may be able to read and write MPAM0_EL1 and MPAM1_EL1. KVM
>+does not save or restore them, so what one guest writes is still there
>+when the next guest runs on that CPU, and when the host does. With MPAMEN
>+set, EL0 and EL1 requests then carry that PARTID and PMG.
>+
> Reporting Bugs
> ==============
> If you are not seeing the counters or controls you expect please share
> the
>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
