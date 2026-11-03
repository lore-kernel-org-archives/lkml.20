Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719119;
	b=LQMernbijEpcDcQxgLEFSl8n2scl+DQTyewPWusZ9UU3H+N8MA7CAn7kVKVOzOynQq5M
	 PsG3xG1DzEox+p1mFw7IKiQJ604aWoosRBy9tpdWwQ263kgZv4x5AmSwpZlthwJ81PGEH
	 gu5e56dCGmGts5fPR5NFxUKinek7Wz5rFvuH4w499F5p5rdw/vQZW0abCc3tvhymH/EfM
	 OTnrJOONwcaOLcIIrGlXE5ONLYzXEho+sAWpjPpSdh4ueExAm1D97dHaeQ/RAhfhrDo6b
	 txM00slbOh4mk7e7CFiG1pTdtany4VOkpqULhr+pMMAW/dfX9pGwegSFM+2o32h3fRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
	b=OQ9E7ueRoWMjf92hLPz3qpnTSD1EHc04G/MFGt6kuj+o6g3RPYlCp7O4e4H2O5x3ZwPD
	 TAXS/9lXSN+Dg9ZzeYzgMV/ev0brMcf6GChL8lo4mFJsJzYnlFYyxAZa+hPh+DfmBwLOp
	 L8IoLGrA6jdbBGkRFRdNT6AE7Ttfj0NxCi2vN4o40F3HMfZRGxlB26La1BfRb2hyaZMWp
	 ZeXoBGhFKTBbiEEw3Rc6jDT1G4tAM9M1LSbspmC2PoWUjKsE5US1MFJ8g8pR81alW+bti
	 XuNp9/9EX1p6soZGb5uPStdH1BP/koQTU7mb/DLa4M/cEjrRwjAWs7wQkHVOvH6KiiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=NzH9v5uE;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291FA606FCE2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291FA606FCE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=NzH9v5uE
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a070781f63so1783689b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719118; x=1794323918; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
        b=NzH9v5uEH+MPtdumNErHcLU8TI7esovID+0FCTg4cq4Ny7OB6Jbv2iuLnSDCRB39Vh
         z1jm9WbnlKgC0FM/ImPLdCDbfHy1wPtGKCnh7nLr66I2ZWRMh6r61Gw1Myi8kqqxygS/
         MP+GB+led6l0lrR+WCQZnEEeUcd7JizQOJMcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719118; x=1794323918;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
        b=f7/0XV/2xT4HgSDM9McCeU1DnPKl96hFfuqXjDh0zOcTNneHTHZoWB9sww28L0L5Dk
         bs8dOtSyHUsOQL/p5t1kxzqJjdCQj2PMoIynH3fwj6xRrGGaBT/9GSD+7Y55Ih4QQg/j
         VCQRXYWCzSl06Vie+Aq2LgmiUm2GjHM2N0eE5s9Fw+srRV0PrBI6KbmIs+jhybGbZqey
         xXveXQOB9NBq+W1mmYOXxp4JHebvvjetnVxj6UU2STjD77kIAlDVvq4oN9pT7Q9uqai5
         JlvYtx+ZO4xpy5+U/TQI88aMOMPwKvG/lloszW6GzyGGTD6Sq1+6xullFbS4ZbpFGRbX
         U2rw==
X-Forwarded-Encrypted: i=1; AKwUvBy0ZbknNx+tMnwaPiCsB49M9AMdTyexJd21sx0A7OTxZepFRMsX+iO0ySe7YRKLj181QPuzBAZbCs7NrBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iO60qGH+7kuSHFWq4wEqpXB3yw8QZ2Se/D3OaWK4xHORJ3M+4
	ZCV8EZ5DI9gJWw5jfQKCuFH2/wfUYHahs46IKK3pmKdnf3BZuIoYxMowBueErzkueW4=
X-Gm-Gg: AYBFou3iMK/PUpGs3vsPyWlhbv3xqMlmf1ALWd1ToiEDSaxgmoFSwsEzYSfPphUNdJs
	2MtPlaaSp82ga9HKa0PQEUUIRo4n3WglQYAdtayoqPNM2oBbKHC/7cI6NZ/uwHuoC1MP7sj5y+T
	1mopC86/IhBueiO21xb89TJoj3nPZO9ftQnVUoagkzmsUmwLgf2hvGmDmmC2ZJEFbtIFycdgbCy
	xJ1PaZ+xjbzNjrxG4Vwb7FYr4NaRsUv81sEfocBT1AV9jx0wsbezyvPoQe1XtEITfpN++X03uTI
	KBf2GV0pNi0b44+Kzs3Uu4UALPeYJLwhLvOPIssazpC1VxvmWh45NWtiLV+QtC930q1ZJAdwEX7
	01d5JBYSx6lE090GnqXInSK5p34jjRVaxB1AfGlXRPfBX031Wgc9qqsqEFSqffE5FQQR4IuWt/c
	0pSTzAzG99YDbTr0+TnairsF4XDdQ7qCYOSoqU0s2Ahe5dbyQ4D4aVTmOAzTiU05TMZcquSzGoi
	yxzMrCMjsd9olEgDawQx4nzuEfr5zG66Dn01z3r5hHsx53LbIFZz5oFWX71Ai3yg14nwdQqf9q8
	we1KDgQuuOi58Yc/8LOViaRWvJwo7xWTE1P8+ArL1ro+VKARe9pQYJ1UDTfwBmAhDWO8ELwzZe6
	Qbz7MH5GLYVGghqfZcBKFCm0j8FKjnUH02UBYcKKaWbh12+xsLdUVpn3mJnO++iiXU48v8cuBTC
	iubo9uPu7hEYspj8vgMQ==
X-Received: by 2002:a05:6a20:914a:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e928e2909amr12529216637.42.1793719118513;
        Tue, 03 Nov 2026 07:18:38 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb362ab313sm1592131a12.0.2026.11.03.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:35 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:33 +0800
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
Subject: [PATCH v2 5/8] uprobes/x86: Leave sealed trampolines in place on
 optimisation failure
Message-ID: <eafd3da2cd2c3e2c4d137a46f50351dc6290c5ea.1793718940.git.chris@chrisdown.name>
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

If swbp_optimize() fails, __arch_uprobe_optimize() unmaps the
trampoline it has just created. The next patch seals all special
mappings when CONFIG_MSEAL_SYSTEM_MAPPINGS is enabled, which includes
uprobe trampolines, and then this do_munmap() would fail with -EPERM
and warn a second time.

Nothing is really leaked if we leave the trampoline mapped in that
case, since get_uprobe_trampoline() reuses any existing trampoline
which is in reach of the probe. So let's just leave it in place when
it's sealed.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 arch/x86/kernel/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 0f60c0d076b6..fb895bfc09e0 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -1183,7 +1183,7 @@ static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct
 	if (IS_ERR(tramp))
 		return PTR_ERR(tramp);
 	ret = swbp_optimize(auprobe, vma, vaddr, tramp->vm_start);
-	if (WARN_ON_ONCE(ret) && new_mapping)
+	if (WARN_ON_ONCE(ret) && new_mapping && !vma_test(tramp, VMA_SEALED_BIT))
 		WARN_ON_ONCE(do_munmap(mm, tramp->vm_start, PAGE_SIZE, NULL));
 	return ret;
 }
-- 
2.54.0

