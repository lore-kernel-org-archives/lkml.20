Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.42.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208502;
	b=s0YIChJE9B6ZCAGiI9Qh40tDKf0W58aBio+Dq7Isx/NwbR9ifKPvzXduFMpAXQNI6jJD
	 p+wG48lSUVu2pNhZIQ+oVFMZ/R+yON7e1K3FYL5l+eL2gzL+nr7iJ/NfqQi+01d6frY5g
	 OwsdM6ZTTCSUcO+shCl5LOSplZz615QTIDK2LZtCO/7IhzETwNG0ZPSGWXxEALgnC/PDz
	 ix2fPpzG088o27+P7BzOcpuT0oIwoawFvfOxfdsffVfZK5uqRWNI2oZMtCBO0c5yKtEpQ
	 qy4uK/TZMulrOSSnrxy/UurC0otNdAuQIv3BmbItl2L1CfhcsZEEjpGw7tQSZCE4R4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208502;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization:x-ms-reactions:
	 X-purgate-ID:X-purgate-type:X-purgate-size:X-purgate:X-purgate:
	 X-pfmilter;
	bh=r0RhoxzrOS0ewFBxX2OsoTwEDd8az+BbbiFVvSszX8I=;
	b=R8QjFMhTdHq+jLgdV+oMtFd/PE8lYSVKqS3QMN99Q+3DFhtNee37Hu+4gg5txaygyks2
	 VvY9lZtgANs2P4AjFOUmcO/R+wMQgg+PmpjIBvF8RB8mKj0qeIgvML/ry+KrVnYoNPrKg
	 759bn+mAolpcZTTzMFsx8M8k8M2ApJ3JWmAa6ZYbCWj/FvmmeuVUylya2U7ksDuQOdxs+
	 jTftGBQ9xeJnUJz7WCl2kvGBknRHhc+OzXzphMGct+avNhu1n7HdteLzKRO0NJlAtD3pE
	 EKG6YcqTQADy18J8DLLwdJAHDIqKjB9eajq7txxN3HxFPuqjBEbV+V3sHp2ATmKSIQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fritz.com;
	spf=pass smtp.mailfrom=fritz.com;
	dkim=pass header.d=fritz.com header.i=@fritz.com header.a=rsa-sha256 header.s=mail header.b=aLeOXqH7;
	arc=none smtp.remote-ip=212.42.244.119
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0DA606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fritz.com header.i=@fritz.com header.a=rsa-sha256 header.s=mail header.b=aLeOXqH7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1794208491; bh=T0w8QQnRfOo6Z4xdcqQ5XF4tGbG+03ot3nhzDDhBGZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLeOXqH7L3Ti9MSwuO2LwrFZV/6sxlMcz0iJWdMMSYZD+APAzC9fnPY1up04r24QK
	 qRQXTHIeGvFur1zCHIdkmcmCkukMxNVdeyTT0ekWmHEQVYC4TlBJ3m1WBxOVkMEJmS
	 fFq5laryXi6k9woaZjDZJ404qSdlr8VICmKxWrTiWZTzAqljDaSO2l6iJgDTcGnzwd
	 7ooXLA8xFY51rQk7QPnsr/4fdT+vyJpJmuScPa+52zA3MUMsu6FYOmG1P5rcaSLqxn
	 L0W0TPcgsUspriLUpgC9cw2iDy58eunc4pTvsItIcYCMn/+KaLLm4SHyqp2YVn1dS5
	 Vq+ODfFqeIW1Q==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6af172eb-03e5-7f0000032729-7f000001c594-1
	for <multiple-recipients>; Mon, 09 Nov 2026 08:14:51 +0100
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  9 Nov 2026 08:14:51 +0100 (CET)
Date: Mon, 9 Nov 2026 08:14:49 +0100
From: Nicolas Schier <n.schier@fritz.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jan Stancek <jstancek@redhat.com>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] x86/boot/compressed: Enable -Wunused and remove
 unused variables
Message-ID: <20261109-lyrical-bear-of-fortitude-fb0b3c@l-nschier-aarch64>
References: <20261109005528.3477-6-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261109005528.3477-6-blum@kernel.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1794208491-67FCDEC9-99DCB5E0/0/0
X-purgate-type: clean
X-purgate-size: 1927
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 31676A012E  external: no

On Mon, Nov 09, 2026 at 01:55:28AM +0100, Thorsten Blum wrote:
> This series marks potentially unused variables and functions as
> __maybe_unused and removes truly unused ones. Patch 4 enables -Wunused,
> matching the W=0 kernel defaults. With WERROR=y, the warnings failed as
> follows:
> 
>   arch/x86/boot/compressed/acpi.c:25:1: error: '__efi_get_rsdp_addr' defined but not used
>   arch/x86/boot/compressed/acpi.c:29:6: error: unused variable 'ret'
>   arch/x86/boot/compressed/acpi.c:57:15: error: unused variable 'nr_tables'
>   arch/x86/boot/compressed/efi.c:64:16: error: unused variable 'et'
>   arch/x86/boot/compressed/efi.c:136:6: error: unused variable 'ret'
>   arch/x86/boot/compressed/kaslr.c:600:13: error: unused variable 'i'
> 
> Patch 2 also drops a redundant efi_get_system_table() call and uses the
> existing efi_get_conf_table() error path.
> 
> Changes in v3:
> - Rebase patch 4/4
> - v2: https://lore.kernel.org/r/20260624120300.590233-6-thorsten.blum@linux.dev/
> 
> Changes in v2:
> - Fix a kernel test robot issue by marking __efi_get_rsdp_addr() as
>   __maybe_unused: https://lore.kernel.org/r/202606240416.cXegPpiJ-lkp@intel.com/
> - v1: https://lore.kernel.org/r/20260621144116.224010-6-thorsten.blum@linux.dev/
> 
> Thorsten Blum (4):
>   x86/boot/compressed: Remove unused variables in EFI helpers
>   x86/boot/compressed: Clean up EFI RSDP lookup in efi_get_rsdp_addr()
>   x86/boot/compressed: Mark process_mem_region() index __maybe_unused
>   x86/boot/compressed: Enable -Wunused
> 
>  arch/x86/boot/compressed/Makefile |  3 +++
>  arch/x86/boot/compressed/acpi.c   | 18 ++++--------------
>  arch/x86/boot/compressed/efi.c    | 17 +++++------------
>  arch/x86/boot/compressed/kaslr.c  |  3 ++-
>  4 files changed, 14 insertions(+), 27 deletions(-)
> 

Thanks, looks good to me.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
