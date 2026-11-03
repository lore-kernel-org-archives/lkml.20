Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690162;
	b=pqag5lkyS/yZmt+7mAJEW9KZ6hk+Zm+pwAFcLnMg+CD2m2OFck6JOuhlusoAbGACybxK
	 wRO0QwIpGoMklaFPZPr1FohNppToxxV0HGDB6+XoM62FuwUiQpUlYjb+Dl7Olp8Kjf0WM
	 0DI6lLGqZmNZRO4H0VJn6a4z4nsKvp3Dc2AVt9j8rGlQFOnlws7mlEOYij2VAM1xryhAc
	 6Mc9PPy0jjbUSIHPWqVQVbJX6QhUMDlXeV/zu9TaK33YdpzOubtdsQD6PGM+4WVGr0MbK
	 ziboyIB1o0N5tEXE1owdIBHw+gssbizH/RUkc0Tcgj473G406RQdLoJi3gfCOJWVAZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690162;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=q4y6B1icyNzjJObRP5v2+iWtsvF0W+PG7Ux6Z6hjgbY=;
	b=gGPi0W5b6kNFWTUYhOgw3ytG5a2nQ14vt6tIuRmyRQ0fC10iriQITVRZfM3Y9EXnxPgE
	 fvE9Wn7x/1keqqR6v7O/zRE//3D+RlfiOaRWCL1AEcrYVmmcTEBiGtjhc2LBu7aSIkORI
	 jcO0iHnLsGuB0y+YLVDRhQVqYBjm82lsVyjL8B4PGcxlXbL40RT4J9a90R4KEBVUwA+iy
	 rU8kbAtjlTW6aaH1YOY3elig8MtF9I1pvdyChIY0WRi3t0vdW5HznTRkTK+I1GK/JHmEW
	 Tzh4nDKfOJIyXs1FJt9q0u5YopyG4La3vPp4OCrm7e8NiAskr+kr9X8ubzd1oMD+H8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=A45+5ywo;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E560606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E560606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=A45+5ywo
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so1247087a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690161; x=1794294961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4y6B1icyNzjJObRP5v2+iWtsvF0W+PG7Ux6Z6hjgbY=;
        b=nN6flvzY4vtK3EIq5EJHDa1F3CJrPefwlXI8vi97yx+glM9UkPfIyI1ZxjIKYq4KOx
         ppm9n11uXTeE6/t/mO5QHD5JLJOTtp8BB0KGrg9nChBB7pH9cpZ6PfIdRS7xX2cMjLHe
         4Ro/HISod/mN6RiZvBczyrToI8E42kbt9hmgMOjwscqZ6rtFCooKFCwjLI+JjvzDrytH
         aOJq44tfsRnfBG0044jD6/X3fxhooct798yKeZq8tgUiHUA9VX8n40X8eM07hk9I0Qxw
         ld66+oM5kXd8+SlEEvpZcDWWvZTLGKwEroHXlC77I7JYn/I/FxrvtNyZiimgxFQsKXK4
         AgEg==
X-Forwarded-Encrypted: i=1; AKwUvBx3pGwaCpXt1DEIY2D/pYDUpPYGt1pVB0cB6kaMeaIx91nS5On0X1Vyn1QKvIkYVfs81HPukaNovK9kjxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HNwdyJ9pk8ROFhOJIZyTcF5lMXbiNk+lv/yfYlAEta32Uednj
	xYlvtqanY0pPLB9ua2Ia1xJx4Y71DNv2yCEbqs0KaHaXtMOlW1QJhpPRD8B17hd5obz1FUJr1WC
	m2xkK4NzEsCE7loLxDH0B783kkv0Kzofg5LwdvgBwLDSpKlPtWC5ZITTsesNj53RwXkGQeKO6sN
	vrVMPiEUdBvuTtnuQYDnt3pah+dKkfwChg12H3bPkoTu2RHyQOZVZZPVtqBm88JAbF0trM1elhm
	xCXrH/IMZDh5Kc8
X-Gm-Gg: AYBFou1wiruDeTzQd44nM9nPK3035d7aCIFSUi/feCf5oaPeXeYR6MxOlxlgv6kYnD/
	0WIh8tpcwUMPIJQ46Sb0Ptlt4ua/I8dYLdI0rTQcQvF872OXkajZk8Z4214Hd3OqJEs3vk2ELVD
	1lZw8FSXDgQwMDtR+y3OoocHF9pUNNvaQiA88FVgImQvSi6SWHB5FvBN5DJNnBtHPVT9fD48aPI
	gQOIZLQrq/J93I3kcRsW+XPvyUqjP5O5RJ4RUB4G5SbumMQiqafEsNJn8f9uUE2I8nUSV26bPLL
	Nqgu1j2LB+L2JNgqe2+tLA5F8ZEULOCpuuhmCE2vifJ2m73fvcQSa1pzgBrico3MlpoRASR7v3l
	5LJXNQbNgzeq50FKC8JedF40JwFXlxqczCstNszEmXRkwnGi3C4h4OTq6K6io/XhX1vHjRvD++U
	/Y+cooz9wBIvs5taxrGelygfJUFdnhAgvd
X-Received: by 2002:a17:90b:3b51:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3ae897c7d22mr10357245a91.19.1793690160872;
        Mon, 02 Nov 2026 23:16:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85cb7888sm3891600a91.0.2026.11.02.23.16.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:16:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9440b27c1feso666546985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690159; x=1794294959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4y6B1icyNzjJObRP5v2+iWtsvF0W+PG7Ux6Z6hjgbY=;
        b=A45+5ywoXTZRLU4JwM4rtFIdd+2mO4qYrr8urLpMxMip2Zwrwmqn5EALQhtmzeyKPK
         Xb351tL+k793ijaRdL6ULIO/HuHxixyGOrxyPNprecb2GwO3wCll2okIogICJFRoirg3
         /GTwNx8Wos+gSNGJtlrywlSbVw+YJeOF0vArA=
X-Forwarded-Encrypted: i=1; AKwUvBwAphpoeSlniyFHZifj5Pl9sYYdxVeq3M9iLjsUY22q68eNGphvskhalhTS7nBMwSmssRwBxvGjtyENoKY=@vger.kernel.org
X-Received: by 2002:a05:620a:2687:b0:943:b019:f011 with SMTP id af79cd13be357-94421719dd1mr1970191185a.28.1793690159399;
        Mon, 02 Nov 2026 23:15:59 -0800 (PST)
X-Received: by 2002:a05:620a:2687:b0:943:b019:f011 with SMTP id af79cd13be357-94421719dd1mr1970188385a.28.1793690158920;
        Mon, 02 Nov 2026 23:15:58 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2d2sm1018334585a.15.2026.11.02.23.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:15:52 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 3/3] x86/cpufeatures: Remove unused VMware hypercall feature bits
Date: Tue,  3 Nov 2026 02:14:58 -0500
Message-ID: <c8e57b19d95fd8ffbfd13e7ab1c1ade551b1bd7b.1793685318.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793685318.git.zack.rusin@broadcom.com>
References: <cover.1793685318.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The static-call conversion removed the alternative instruction templates
that used X86_FEATURE_VMCALL and X86_FEATURE_VMW_VMMCALL. Their remaining
users only force the bits during VMware setup; no code tests either bit.

Remove the forced capabilities and mark both positions free in the kernel
header. Neither feature has a cpuinfo name, so this changes no
userspace-visible flag.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/cpufeatures.h | 4 ++--
 arch/x86/kernel/cpu/vmware.c       | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 61930f0d4578..b7633930020f 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -233,8 +233,8 @@
 #define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
 #define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
 #define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
-#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
-#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
+// free: was #define X86_FEATURE_VMCALL ( 8*32+18) /* Hypervisor supports VMCALL */
+// free: was #define X86_FEATURE_VMW_VMMCALL ( 8*32+19) /* VMware prefers VMMCALL */
 // free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
 #define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
 #define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 6719c009f237..b5c1610ff408 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -492,10 +492,6 @@ static void __init vmware_set_capabilities(void)
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 	if (vmware_tsc_khz)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
-	if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL)
-		setup_force_cpu_cap(X86_FEATURE_VMCALL);
-	else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL)
-		setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
 }
 
 static unsigned long
