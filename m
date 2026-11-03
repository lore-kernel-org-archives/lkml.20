Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719156;
	b=yaw4MmXqZLrNb3ssN8QgNt3P3gtBFbPnDkPaltYu+OTmdFGw0NTmavUiI4yWGqSlQKhW
	 4AUG9mXX15O7fy0r5mIyXTSDOliYTJcWZ0pQJcbmUm7r6jkuM2Nv8skrc610opkbWq/f7
	 0Tx+bn40lcfTZSkqgXFCVUDt264TAk/cjrRf88fcpzkvjXuB1kwziMmUF+bKw6lYVuWfS
	 att1aqoitkGzxYogKY62bdXY/0wcSeo3KnwP5WZC//HuMqpTdJXgMB/QWyxjDcbkfgBcu
	 rqOmZeL2srSfQ8G0f8dGN1MhrNVnrfVKUF+VYSJXc1fNmXiE/tX9qgaSV72JN2tB2fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
	b=2pYYaGlo3Vz/4aWroeaWjxkoA+hLcr7GNc7gcAc37RF2RDhrZqU3ttOfEcbOFNEMuxDE
	 snbDZ4fYKHaYleaT2MJumVuoJl7OGXehuH23IkOjc0GFNx8k2qNlzW48wOigrKp2OZMVb
	 tkzy4z9buJtgg9meE56/p2ytAy1szweByWLjEHZEgkq3UPq91tlOODGUwAiocpc4B0p8Z
	 VUtroZGrAz221+R8We388KjwFEw1uMZdWI1/AFbiv0fYqSQjXat5XJus+u583YjxUZegZ
	 TJKNLYvPFF6HQMmsN0996PYGL2AunCE5Bnbo9FNEpph4DNcHW5w0U1NN+fwJlQJ+4sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xZUzdAwf;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB460A5BE9
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FFB460A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xZUzdAwf
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e5378b281aso25420185ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719154; x=1794323954; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
        b=xZUzdAwfqCxPcOCK/JIrph7KFeszpA91tfvzeScxT4EruNXQmKAS8pGWqhBe+PY4Z/
         ou0hbryfYCEyJQbo6WBs+n02Jstu6/reJiLtVlG0TBs7a8K9lFbBHtCcknocnhWccbMb
         mylFVqxhUsqas6fdwUmCpy4VyNDgqx0gnOIIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719154; x=1794323954;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
        b=VLFGE7aUE8upfAbnWmRwGeukDkui5pUi2BU0/rRmnemQ2w4fGOZUr5vfNLFmm17BLU
         EiNmGB7wRjAtmtiVwg0tCJ7zmGxgxRioIz4XabrdV944OHNPsAcwlEytdbQb0gZHU8kl
         W1izUW2ISsBRjsdcMkb+V0F0EhqFPoIw+hZ0bByqkzUDLltAStBqCtTat0f+E3QeURLt
         nv4AnJRZiqBBILKtc5iplihrCDrDVkhTiVKmIwMpTfRWcNJ+RocMUgUcMyoBR9I/b8l7
         3CBi3tCVL5p5/hvpeLbFZbQoGkN9Pvf87ajqYT4xRtHscB1GhRb6PAs04lxSRWCL416P
         7MVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyFtlploEPYYGL5ggsJD8C5lTIIfhAkV2Zx4KAyM0Abv1aHGzFNxc99ESZfiFAd2p7wmsgnb6/EgKx7sI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EZoPuzNncZcAQoLcWO7JB5ZWOY5JVMeaCzKJJ/UBEiV1xlvuP
	u+REFynq30YqlBAV7sUpnDvtowK1y/bMX611LnH9EubIqcHN0h48ktczW4Qfq5VZZcE=
X-Gm-Gg: AYBFou3wwSXgpzn9BMPv6I87Frt85e1e1m1ykYpZJ6plChReATo+y/TtLQ+HiwVisPn
	Z+XTJifmKMu9HLUyC4UToe4OFVLkKvQaU++BcOhBqLB4OOaAgc731pu3xOiMAJdGSmn/3GabC87
	AuTF1KkRZ7pIFxW3O+rd+HfysEEyQqdm33AiNQ0tGhZlsdMk/snl27XHi9U/NNvL8STu/44MEIY
	SYXHvc2w2/Xo4joIhqSLpAjRAMdsxKHeZqI6a5Eri3FprKoAyRH/mh4DnVZbRXm0fq8jtuMgP7/
	D0k6zj3sRzxZEvnQIX4ubkuoJVqE9Y6gl642mLOy2OskF16inOWGqVEOuG4292IypQ1fnAdP7sG
	aAFSxwhHqL48/0WY0eOEoCC34NyTOHsdaqLt5a8DXwv8p0WuNT/kyUSQweWXZXaTlCtWHspEKuq
	nIK6YsoW+om4OKNekp7idSPgvZqm+bNS+DlGBUo9I6bna1nRVezH6JCr9BAwxG9eXd/9V18c/Wp
	92m83dDCJ6kXbKkMwOinLMu8b0XrQOnCI/x5IUwGX5CmisD3Y/deRETRNhE+DypFVj2wm48ro6I
	6DqKWtlJZ3M07gd875AXG/IL/S2BhydsU9MrChVGAjvLeqACCFFTzwmWejlcLd1Veb4cXO1TjS+
	eoR+Qbi1GcaU4zalh14T5z1rkFs9Uuz0mIrxeBT+/5adiFWgo0Ekr/M2pIDFRFnPZiyXgH0+j
X-Received: by 2002:a17:903:1b2d:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2eb36414d03mr125058495ad.7.1793719154563;
        Tue, 03 Nov 2026 07:19:14 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm42885535ad.32.2026.11.03.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:19:13 -0800 (PST)
Date: Tue, 3 Nov 2026 23:19:10 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 8/8] selftests/mm: Check that no_mseal_sys_mappings
 unseals system mappings
Message-ID: <053ef1ff0a6a7e5b37109d59a064a7665e087cb0.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Booting with no_mseal_sys_mappings currently makes check_sealed skip and
expect_sealed fail, so nothing checks that the parameter actually turns
sealing off.

So let's check /proc/cmdline for it, and when it's there, expect [vdso]
and the other system mappings to be unsealed rather than skipping or
failing. The vdso tests already expect munmap(), mremap() and mprotect()
to succeed when [vdso] isn't sealed, so that covers what the parameter
allows as well.

Suggested-by: Jeff Xu <jeffxu@google.com>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/sysmap_is_sealed.c | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index bfa140e01d8a..158e116ca3b4 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -56,6 +56,21 @@ static bool sysmaps_sealed(void)
 	return vdso && check_vmflag_sealed(vdso);
 }
 
+static bool sysmaps_disabled(void)
+{
+	char cmdline[4096];
+	bool disabled = false;
+	FILE *f;
+
+	f = fopen("/proc/cmdline", "r");
+	if (!f)
+		return false;
+	if (fgets(cmdline, sizeof(cmdline), f))
+		disabled = strstr(cmdline, "no_mseal_sys_mappings");
+	fclose(f);
+	return disabled;
+}
+
 /*
  * Kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS don't seal system
  * mappings either, so check_sealed skips if they aren't sealed. This fails
@@ -63,7 +78,7 @@ static bool sysmaps_sealed(void)
  */
 TEST(expect_sealed)
 {
-	EXPECT_TRUE(sysmaps_sealed());
+	EXPECT_EQ(!sysmaps_disabled(), sysmaps_sealed());
 }
 
 FIXTURE(basic) {
@@ -127,7 +142,9 @@ FIXTURE_VARIANT_ADD(basic, stack) {
 
 TEST_F(basic, check_sealed)
 {
-	if (!sysmaps_sealed())
+	bool disabled = sysmaps_disabled();
+
+	if (!disabled && !sysmaps_sealed())
 		SKIP(return, "system mappings are not sealed");
 
 	if (!has_mapping(variant->name, self->maps)) {
@@ -135,8 +152,8 @@ TEST_F(basic, check_sealed)
 			variant->name);
 	}
 
-	EXPECT_EQ(variant->sealed,
-		mapping_is_sealed(variant->name, self->maps));
+	EXPECT_EQ(variant->sealed && !disabled,
+		  mapping_is_sealed(variant->name, self->maps));
 };
 
 static void *find_vdso(struct procmap_fd *procmap, size_t *size)
-- 
2.54.0

