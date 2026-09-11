Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8170B232395
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789101541; cv=none; b=Ix/W7l/rQ6XL0dBptz1OXj4CLUbBg5sYXL1JmH0Sl6vEpd0Rp+ZIQGlzxoBa7PY+5UvPtCoHGYCMKW4nYEqVaX96GdGelB7IXfL9Dw/0+4tS57WG3Lf9dWQVoycYEBDyNzG0NTFEHHxPhdm5seB4P3MSYLhwniFL4XdumOc3o28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789101541; c=relaxed/simple;
	bh=GyorX61qqrCCXsi+gQF9pDfjYhB4/+/Ayt4SCYC57m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dj5r48XSGe66EpZgldbdOZ1ooACHHLTCZaePgyGX4ouKMoId0rpA2eCEie//9+WIFEOoPebDNfIgDBlZ5zQ2Vvut/yBsYXQ4htD0pJwG6M6cnkcxstTZMXz/ZqX9pOfnKeI+PDdEFhiq24LVN9DSW+9z6XiMJGPTRTNYiqCwHEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LUYyefAd; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LUYyefAd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 832BB40E00E8;
	Fri, 11 Sep 2026 04:38:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FpIopqVKuj8D; Fri, 11 Sep 2026 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789101520; bh=T7n3csq1h16sUuD8cRvGmtF1Jsj0J38l6tEVY9X+IHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUYyefAdcLKDhek0XZZcuEIHjGff5EZZ+pdDbVpsjpKiJgrGEhlw4vGrfG7894cfp
	 il06hXtV41nlJmUXp5cA0dDZzcIn+U8gra4xN0tnCH9O3N5nqRvpgzvIEqHD9C7Eln
	 FUWtayd86Grx3UAeXbnNm145iaS8Csz2VWrddCIPLg5SuUAGAGToudrdjDnKMq2yVj
	 n4Z1fagj7nihG65GNsUTZKpCRxANhM/Ybr9QhGT5zvqzJDLS7BIQh1ssfo28tIubb9
	 dg9us/aRxXvx1wOHyC7lj89n8MJLzzp1DXI8ZO+oJdZ8sr0l2dMff+UeHxTmISePia
	 3vFwC2/eDIZvu3dzt9qRVd3c9PKOsc0mVEoungLxLYMuDQlSyom4Nxbgl9m90hc61S
	 Fkh7sQW5cP24QxKB2W8kZ/2ycEOjBRbHJIjisgACjwB2pE3MfncBos48Xagqrr3I/v
	 G39l24Ooqd0YfDzagldTXOIMcD3OcVUYxeewhSl6auATMwZhzkK8h8YIE8BNYuA+Dd
	 8ciayjcOb+yGStSKydsjaZvnGHdCeNTvdXpDrrtZG1x2dMpSJBMNod18EkeukIjTDt
	 FlA/jChQ8xXi/XysbOVvPITmtBfmfvAw9H3svhYGJ+yIM5EYclc+IgRC1NkORqzdNd
	 dShvl81qRqWMAZv5t0+3dgDc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C145240E00B9;
	Fri, 11 Sep 2026 04:38:25 +0000 (UTC)
Date: Thu, 10 Sep 2026 21:38:22 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
Message-ID: <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>

On Sat, Aug 22, 2026 at 03:33:20PM -0300, Mauricio Faria de Oliveira wrote:
> diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
> index 82eddfa2347b32b76c2ea9b85f005ca5416ac71f..2d9f3d4d63de6e721f275d9e80d372edbdfedf30 100644
> --- a/arch/x86/include/asm/cpuid/api.h
> +++ b/arch/x86/include/asm/cpuid/api.h
> @@ -204,7 +204,7 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
>  		 * from PVH early boot code before instrumentation is set up
>  		 * and memcmp() itself may be instrumented.
>  		 */
> -		if (!__builtin_memcmp(sig, signature, 12) &&
> +		if (!__inline_memcmp(sig, signature, 12) &&

Dunno, did you not think of simply doing it by foot and save yourself all
those gymnastics in patches 1-3?

IOW, something like this totally untested thing below:

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 2d9f3d4d63de..a2db83d17940 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -192,9 +192,10 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
 #define for_each_possible_cpuid_base_hypervisor(function) \
 	for (function = 0x40000000; function < 0x40010000; function += 0x100)
 
-static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
+static inline u32 cpuid_base_hypervisor(const char *__sig, u32 leaves)
 {
 	u32 base, eax, signature[3];
+	u32 *sig = (u32 *)__sig;
 
 	for_each_possible_cpuid_base_hypervisor(base) {
 		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
@@ -204,9 +205,12 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 		 * from PVH early boot code before instrumentation is set up
 		 * and memcmp() itself may be instrumented.
 		 */
-		if (!__inline_memcmp(sig, signature, 12) &&
-		    (leaves == 0 || ((eax - base) >= leaves)))
-			return base;
+		if (sig[0] == signature[0] &&
+		    sig[1] == signature[1] &&
+		    sig[2] == signature[2]) {
+			if (leaves == 0 || ((eax - base) >= leaves))
+				return base;
+		}
 	}
 
 	return 0;


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
