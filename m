Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719100;
	b=1J6BbvbLoBOCtlMRvA8h4S2XycnhDzuF9amRqcAawZYl1Y26iax8kiKgBW7GNKcma1NI
	 tw55K6GrP+m+MmetvhIAjCQanMkLNHCnnNl4oJ1NPuY7xXSx0JmS/k7Fe4ryteopsuIWF
	 D3qdEdUSpqsjcIoFtDoq8zQc9nxQT6/3L/n8oWPqcsMr38f3UptQUP5+eZAzpTvsx6aiR
	 PBYmR4rNihM1ig8GfvYkGCLlnA43w4lj+DP1wJKT7d73SyoTirux5T8f92UNoDrJiB24C
	 8OQAArsTMHK5qdIPD4/PeaSQImjsCC+u20g4ilnLtpUOA/pAonn2+y1I3rc6lRz0MmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
	b=R4fEYYYQXwYa2EAyki1dkUwBfQjdfITwn2IiLbqjxdsz7bxlYIIJN4Hnf3sYB60heei4
	 foRp7CrGhwPvQwEhCxcG/CCQxOWmqOiVtwjyz/ZPJcnOtcZ/iLCQQOjKkve8+rh8T9OGJ
	 rLlUOhA7iBhF6a7SXcbn+ToMIjlvfvJnhbeiqkdQdUNWay4C2lbOCsVmQqK2hP7JbBCcf
	 T3EIw/y37Co4/0oO/EVVG44ZJ/FiQX7IO6j0q3Coq3G1e24He3ECPBbr4ApIBW5c98Yqj
	 vw4fjnYt7bv+X5IEsKQWBOl5eHqXTKvgwJoeG9P7+AZswEXg+xsWiWusKbf/mseGfwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="tCY4G/fN";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311B606B273
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6311B606B273
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tCY4G/fN
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso832450c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719099; x=1794323899; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
        b=tCY4G/fNKBPrNKIJMDAH4z60NE/6pvSHmz4YmXDN0B+/w6hLIH+uOPL6uZQwDSAFSi
         ji5fqoupBeQyhW7F/5/GHEGCbg4c/RCf1hH9/0dzPW58fBu3Nk4SPtkya9OT2xuJFrpb
         37JHo51VgUcAiAINY6PXRFxnWqavoDo63iMKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719099; x=1794323899;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sR930nY0OLfAMXoZyFzjwPE74WxrEfgyHo+tDAm4b7A=;
        b=zHlw6IYLwzlwDWGJDZgYvvcchWqoYSVpLVQtkLV7OV9HMt/gliZpO0fUWlNKHkHJ8C
         I1NhfFyCf7ci/oVCeFOpTTNXQhog9KsvQQpP6sXBaZsM237aLJQ9j/UQ78Tfc7xfp7vp
         gF0Z+UbuhxSb6NtKKnD9zj1YpidWXOpciq6GWqD46ATQwYy1SnwNwXPPHtKJ0gOLoSZC
         86Mc3hgxFthXlhDgTBZOQemZ7WdH4eK/vjFs2PQ7cbX3X00/qjnPwzs3m6NTqXCc6kfg
         s3sai7e6jdVoiYPWTQ63plGYak6FwL/BxZQ+rIZRPOKJSVrRALnjOUzuKPCk2FINK6N6
         94Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxXdaSAgsP0Y1LEWvaVCOIJwP2Ko96QLKqQ4dBSFnp27S8666zfZJcztqZzZu9/SugcJc879CeuJJS0oF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z99BRHPV8mqiHF/UYRfR3SBQGMC/MGak+lSOh6QNjelyxyIYAym
	ysVtPyHpKoGdFrOuEEKLWJ0jPC7PCWd8LvUsyaXTiHMctEzu0vYiN84rCefeduEs+bc=
X-Gm-Gg: AYBFou3KPIOy2peohsVMeF+vfFZEw0/K4f8NOO3LbDt1kbikcoVnCgMro0n7rna60IA
	kH/wtizYRMpg7cAetO5f5XA5Kj+Cm6LfP917tw/tq2HGJv4G5SHVa4LOK8+npVJuGVbokrvVTj1
	1jW/lcsyQhhb9ZZ8YtKPupEWfobyB0F7mUrYF47AL4OVtmqoE2FphlIMBNika3zQuDBOSHwiD6a
	cqlT9aYq+ugVIYMTJ7C9+nsvwyZM5HEtFA6SkV4ZfSQ5V6QAWQ/eOKHgaPSdY4biPe12t1vCr0n
	Z9ToqLtuZHAa1+kpxEzU81E4A5PCrPRAbkeRpoDMCHnQDp8AIPiz8nnUpY7R9/5hMSdh4022SX7
	Z9jiRpQ3eo5O5iRItuJB6Dy776t8ksWdjud4XTRxSwGvYOZVMQF/Q9BwpD+smDqe3gWWn/eHHvg
	evWZEEHKH2unDbV9lAlehTz7zk0mwNVA6gGVTvni36lPGI+NgMcmFe+hIgt3N7gju68DhcccVhR
	X8bcEsXaGjw6KP8TkRCL/uPCUsBNXx6QPrn4OWZmDySVaPTmBRElBCNEDeBNZHZijuxaAacXH8j
	y0mBsZT78uCwLO5MSBMGAAvVAuZja5iIA6vMKh/1J9wMpB+DxGXykbdHikLMyIkjOJrsvi2c1Tu
	aQc9YcDYJKRza1M7ewJ2ZBAD1zhOaLL96F5zyAUvonSVyrh7EusVRm0oEGj7dmTMdt33I7m/Trr
	/FP26WxIqbiAJ1XbETgA==
X-Received: by 2002:a05:7022:b903:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1ac5ac4f0aemr16822717c88.12.1793719098430;
        Tue, 03 Nov 2026 07:18:18 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm42657488c88.14.2026.11.03.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:17 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:15 +0800
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
Subject: [PATCH v2 3/8] selftests/mm: Test that the seal on system mappings
 is enforced
Message-ID: <cff8df45bfedfe7dbd3aca9416923c27be2a4a3e.1793718940.git.chris@chrisdown.name>
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

sysmap_is_sealed checks that system mappings are marked as sealed in
smaps, but not that the seal is actually enforced. The rest of this
series changes how system mappings get sealed, so let's make sure that
is covered first.

Add tests that munmap(), mremap() and mprotect() of [vdso] fail with
EPERM when it's sealed, and succeed when it isn't.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/sysmap_is_sealed.c | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index d5ab2b0d8ca7..bfa140e01d8a 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -11,6 +11,7 @@
 #include <string.h>
 #include <stdbool.h>
 #include <sys/auxv.h>
+#include <sys/mman.h>
 
 #include "kselftest.h"
 #include "kselftest_harness.h"
@@ -138,4 +139,104 @@ TEST_F(basic, check_sealed)
 		mapping_is_sealed(variant->name, self->maps));
 };
 
+static void *find_vdso(struct procmap_fd *procmap, size_t *size)
+{
+	void *vdso = (void *)getauxval(AT_SYSINFO_EHDR);
+
+	if (!vdso || !find_vma_procmap(procmap, vdso))
+		return NULL;
+	*size = procmap->query.vma_end - procmap->query.vma_start;
+	return (void *)(uintptr_t)procmap->query.vma_start;
+}
+
+/*
+ * When [vdso] isn't sealed, these leave libc with a vDSO which it can't use,
+ * which is fine since each test runs in its own child. Skip if AT_SYSINFO
+ * is set, since libc may also use the vDSO for syscalls.
+ */
+TEST(vdso_munmap)
+{
+	struct procmap_fd procmap;
+	bool sealed;
+	size_t size;
+	void *vdso;
+	int ret;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	ret = munmap(vdso, size);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	EXPECT_EQ(sealed, find_vma_procmap(&procmap, vdso));
+	close_procmap(&procmap);
+}
+
+TEST(vdso_mremap)
+{
+	struct procmap_fd procmap;
+	void *vdso, *dst, *ret;
+	bool sealed;
+	size_t size;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	dst = mmap(NULL, size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, dst);
+
+	ret = mremap(vdso, size, size, MREMAP_MAYMOVE | MREMAP_FIXED, dst);
+	if (sealed) {
+		EXPECT_EQ(MAP_FAILED, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(dst, ret);
+	}
+	EXPECT_EQ(sealed, find_vma_procmap(&procmap, vdso));
+	close_procmap(&procmap);
+}
+
+TEST(vdso_mprotect)
+{
+	struct procmap_fd procmap;
+	bool sealed;
+	size_t size;
+	void *vdso;
+	int ret;
+
+	ASSERT_EQ(0, open_self_procmap(&procmap));
+	vdso = find_vdso(&procmap, &size);
+	if (!vdso)
+		SKIP(return, "could not find the mapping, [vdso]");
+	sealed = check_vmflag_sealed(vdso);
+	if (!sealed && getauxval(AT_SYSINFO))
+		SKIP(return, "libc makes syscalls through the vDSO");
+
+	ret = mprotect(vdso, size, PROT_READ | PROT_WRITE);
+	if (sealed) {
+		EXPECT_EQ(-1, ret);
+		EXPECT_EQ(EPERM, errno);
+	} else {
+		EXPECT_EQ(0, ret);
+	}
+	ASSERT_TRUE(find_vma_procmap(&procmap, vdso));
+	EXPECT_EQ(sealed,
+		  !(procmap.query.vma_flags & PROCMAP_QUERY_VMA_WRITABLE));
+	close_procmap(&procmap);
+}
+
 TEST_HARNESS_MAIN
-- 
2.54.0

