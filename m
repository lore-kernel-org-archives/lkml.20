Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559042;
	b=LOc4VT0Iy1S9ik4aMQ6tDjOJZHoUNTtzkIUQ1RglDjhuh2VTnM3YxYpBrzxzCJrBY+/3
	 mlYxmE0jkxL73AUoo4LbUBtOn/4HbiK8Tpdljs+RityHAxGVwZyrVdqYbWnnQHlCQSN4H
	 3t4Gr9PsO8TO4sByxnPfFvVAMt/9k34UFDpmShRMOlMK3dbZCi+Eq5q9/h7SoO3iKKVEx
	 UIcW8vzjBOQQVc5MlJX3AttMR4dFWSt4KcAJtieYy/0gNkgA5VLSYqAHlWBlfA7R9kYps
	 7SJPnY0H9s320E74+XjNltBbmiSoBL8miTNY99Fv2cBInwCzi2IYemBf1NXzSS8WOgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
	b=hbW1shRmnOQC2Z7fq875LTrbvnsWWSn3KU8XFbI7X20HyjSF+HdCa5L8SllDgk2ZmRpT
	 HRJ3rfTxe/7tAowy+DJG/uLbPtO7SFG+u4ZiVqKdWTURZuNgRgwUjggUOItkwtM4pQ2fa
	 USHcvT7qZEn+vADaXKgh2kHrq7cuGZKp1AJaWkgCQbfOlqwceQcpkgVlhD/OQpXgHmdnx
	 tSUjBkFVHbYzObN0bFwfgaCjvtqkb+oYIj7JFHpf5LJEe1E5PCEKVfXdD9ibCSvC3VIuu
	 FvRc4qEFWION62uRWc9QNjilwwnd2sCq3fnkLbOPjJCgwNOCNzBbLjR526wWh4Y+CxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ami1KE7P;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634C3606B1CB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 634C3606B1CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ami1KE7P
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so576858a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559042; x=1795163842; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
        b=ami1KE7P5QavEDOGMp60eQrXNRJgwmjS0vs05yvlrW1EqIwdZckNLm5O1zXxO5j2nP
         F451yYIFwPl+eEzS408uV3WZLxSDOjKVtEiD7hphLYbylW4kSeGGadDd2Afkyns7ZdgU
         eaVXAs8bUQ6ydMKgNm4qbha32qqeFrsDoNXrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559042; x=1795163842;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
        b=qdQYnvESVHK+hCY6tSHQ+0spBJZPngLsdSOzIs9HkENK5IHHv8Bc82U9dx9U+UngIk
         7gXo/lmI/O9nGP++cYOCAYDFOhQJ32P3Lw4YCLD2O1qGosWg5xZmnd2yGCiFZrua9GyI
         N16+qW3ImEQ1P/vIEDR0w4+Y8ORQJxuGU+ire9XNyrxATf44rzvtfPXFxyvXnyFyPS4B
         zgM9WHTqE16ME2PULNiEYXEysKNwUQzQdOQkhjLsCd2pQE93/NiaRoimN8lZoGVhocd8
         xJ9HgK/pJtRdhrkkiPtpLAOibdUdIMT67YtlLPycKvVkmTZlCijOCcWVD99fnuXXXhmo
         vwhw==
X-Forwarded-Encrypted: i=1; AL+hErHamPBp6YivcyDhErZJy1OuD5ZNV3TfjxZrUlW5TUecvUI+5aAAr8iO0mmBohjwhaz7+qblSmp/unKOBa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZZ5yMfM+CLDQOzZE6l71e1y5SXwHeJQxSPuwy8n72Bii98Dmw
	d3/2cnfLcj8E1TMAIibCIusQBHFidcwiDvx1+spCAPyIYNWd8Cx+XsLKK+gVKUxZTNg=
X-Gm-Gg: AYBFou0UF5NNSWJ97jIlNuDPSRPgRdZuuL+Wm7Y0WWUL9Hc+KTlIi1j8VK1Y+0kjlek
	a//a87oiAbSxuShnpkqLcUNny3h7NkeLsRkeR42qp+SETCEBQWuTovJ70yq/619HraTKDkI7iC5
	uraTHVbcBBZ4mBA0NltwhaTYL/AH9zMpqYwbL3J2SuT2wpvL1hlJkhCLOTtR+PVAfF0E9StX+tL
	CF7eyvCceS4R7DbLFMCRDTZQFOMaKFMpfwPM+oIKljQX7n86SltSCCB9QRDmEbQWKLH3PNK78bF
	akK8QDjlDvyUOd/y05vxuyiXRBgigU5RwaVwZIr0kGY2vKTGaCBOUPgkAgIV6zVByYXnMrr5DX0
	K6eConivZJk4QloT7zyH6q/qIiQbctzLUplvD/yb86d0Siabum84moLqB2rCTY488x/6fZOy4JL
	iHp/QI0TzgDsD0pK5WxwnU45n3ehMBuwtddxquQ1KBU+mzaTCHA9h4kkRhYVFvNAgp47+rc7a2J
	N+ZHjrmACXJwfEDdmuoCvgFBP6myGoY6R/ZUNXuWeOC0mrD3ROLq/rHSTCLqFGaSHXIzHB1KSF6
	gsYapyymLW9WL8wtRv2WV8L5Qt2Pb6+Fm8z8a6pJr0rCpwxGfblQzPewcTsefEaFkj9V6QLH/Nj
	rLLYM8paV5cp0neDJjfdNqQ1pP6DvgIk2MnQVBrwJ0PNpjf026cbATHdmw0KA+pRsHdfwsfqXEw
	OXvaSQXJimYwGNaECmd6Z7rc5FGnuVyyQ1xauFO5wXc0wIb2ysUDQSGI+ZRKg=
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr1404120a91.24.1794559041771;
        Fri, 13 Nov 2026 00:37:21 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm8749569a91.10.2026.11.13.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:21 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:18 -0800
Message-ID: <35b84656fe82fe1cff0ba3bc55ddc72dde70b089.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 1/3] scs: Skip the shadow stack end check when SCS is
 disabled
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

Make task_scs_end_corrupted() check scs_is_enabled() itself. It is a
static branch, and it folds to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 include/linux/scs.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/linux/scs.h b/include/linux/scs.h
index 4ab5bdc898cf..29ec2b8cf7bf 100644
--- a/include/linux/scs.h
+++ b/include/linux/scs.h
@@ -45,14 +45,6 @@ static inline unsigned long *__scs_magic(void *s)
 	return (unsigned long *)(s + SCS_SIZE) - 1;
 }
 
-static inline bool task_scs_end_corrupted(struct task_struct *tsk)
-{
-	unsigned long *magic = __scs_magic(task_scs(tsk));
-	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
-
-	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
-}
-
 DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
 
 static inline bool scs_is_dynamic(void)
@@ -69,6 +61,17 @@ static inline bool scs_is_enabled(void)
 	return scs_is_dynamic();
 }
 
+static inline bool task_scs_end_corrupted(struct task_struct *tsk)
+{
+	unsigned long *magic = __scs_magic(task_scs(tsk));
+	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
+
+	if (!scs_is_enabled())
+		return false;
+
+	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
+}
+
 #else /* CONFIG_SHADOW_CALL_STACK */
 
 static inline void *scs_alloc(int node) { return NULL; }
-- 
2.56.1

