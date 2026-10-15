Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1F399003
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078433; cv=none; b=fbfTTG1UDGcOXg/zeyE8OiG3PI8ViHTRQwjaRWCuY/kK1GKc7+rXjf+x3Xitpv9RSOI+kLgxldYzdwmJBZOai+W4Iii7T0HsmlBrjdP4UdCVTmyVrRJqCSbpQVnUqlr11KupW1pY47B+gy2AI8orNku0PYfJBcknDuqIcgWzxVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078433; c=relaxed/simple;
	bh=O55RAvz0if8G1Ax5zhoCLemnqpQwrXQ3r6eLnjofQiI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=du6IW747Mpi0lrBDg5TUEnZ0OsFUYH1815eH9I8Yfbug2YJOW7yiDt4w77oQYhcQ2cwYVT8GhcX/Eqv7NpkLNyxITnR/a4W8Zr+wN4hKGOi4g4RwJPN9/3eEQgmx6LSz0MaYOpy7QvlIAMDj7UW2Mqrk+xkMnNQgqfFL/f2MZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=J0S3hBOf; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="J0S3hBOf"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7ca917f9f52so3032340137.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792078419; x=1792683219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4tKjkoRHQBs/0qfSCONCIuiBtr3cfqRy92h/STkCYg=;
        b=J0S3hBOf6/D7ATcQ3+g/Aj8W6MDz7BdqdKU64XruqvNuTliWwisSpQTkZDLHcX/4H7
         N/x7wdxl8l3MRaffLuGAQwOPov3jHUQVqEeAgb8E9XSX600Ov0Y3Sv1N5+HQXCy+PsBG
         d2R/PEmfwOXlaQ64msnT2V1qWn+f22SG6iaKkl/faXGRWLjs0EDyunJAwH+fgbsjn8fL
         xTRh0Cu0N9ihBL1WeDfKI7SEkc14fhF3d26Dw9S4YBKrsb7OH50SN1KzJGa5KeCpojXu
         E7zzgzRPqffb2uagL/RTMqVhWLsRawcyltFpkr0SWqcLKSmj0BrBxUeTRmQn4Wd6a1g/
         ix3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078419; x=1792683219;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4tKjkoRHQBs/0qfSCONCIuiBtr3cfqRy92h/STkCYg=;
        b=XCDg/A37lN50ym1rm1wNgTp4vndET2TSEpOOymbUB2zILPsEYOQfLwvaDIOTDjubuS
         6BgKcdCt3cu+HyVynBC7cCYMPhzHttqOTm/uvhyK9IULWvEkJtvo3Z2sHD+94MfUyoJu
         yECi9WfOXv087F+mXDZCRDhM8MAxOaN5WPfaFTINqSUn7TKmgRqTjEWogKjMfSq3NvW5
         cqXhMKgmFhuUc1PFG2vqmiHKFjz4GEte+jJ7bz5B8Fv8W78x95dxBuqNnGK7sW0TyfWO
         xW/FqCizj/mvDhMzJPHon1+bzhW5pgL74eeplD0ZiEr//lhPUcsTxcrspR7NbDCsurpj
         NxxA==
X-Forwarded-Encrypted: i=1; AKwUvByEIkM2Fx7ar2w/ptDqrWgdmS0Co9qIrqb25ZKS0GKjf+QVWtGaJEp+/rh6aLpvus2hNlWbZC26nQrfHyE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi9EPl67oydUwvo0bG0YOgDIBlrI45w5i6OJNeYn4aocqjUrIn
	gudm73X1yBxTTQ7CbOqlB4bx7DsXSo2KUVVxitEqboQb8e0g3IZBIyHiLDMEd11NGF0=
X-Gm-Gg: AYBFou3vjfGlrHfT7qcE17n5VOxAmpf+X6LyJUuCIch7aTJNMf4ifb+xNbrA9DG8yU1
	MfMK/Df1vLJergkozcoWn5zgLTU1JWz2IBL/mN1Dhw/+ukczEJyY7f93YgUGF9pie6BVyh73S56
	PxmbMxsfYgfDlfI7A9LyM1ukcSxnPp9gHlb3fLAg0W/kU0L+bRtfVmGi3Q1wzhobpqsUkA+61mQ
	RIMH7R4sulK1dPbtPztxFTYPQ4YKplEhhIaUclmr3WwMjwr4RrRYzrgqq6VdKGzzGi3kORRHu4g
	Lf6G20h6Py8xCYqRX3F2NM9ZpQhz8DeYyn/3sjHOwYRGiFD9tJrU5WBr/G5bXgnFxtogd1zFFrt
	Zc8PPK0Vo3MlzCdlGVLnnDdsEIWOMVN7O658PTJMttSl2hVm5cPEDJLLu5AplFTzsecn6d5jWIJ
	eMYN5nHOL4vcnvCYiFkz6FsesCWeAHx+LRVWSOElV1s27LSu/VpTwAT8kKaYTP4qNfP7RlhQ5Pi
	doP9D/OjO+splCnqzWwJ/LxN9JiFWFua/NVHBvx/NQaH6r7MtJYmIIZsO3I8+DztWFGauSpi6Fg
	UTKLGvnihaP9w8n8u95MbDaya11iog==
X-Received: by 2002:a05:6102:5110:b0:7c8:448:5237 with SMTP id ada2fe7eead31-7cb3a0e2580mr5832272137.24.1792078418833;
        Thu, 15 Oct 2026 08:33:38 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f66ad9sm12986347241.10.2026.10.15.08.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:33:38 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kees@kernel.org,
	rppt@kernel.org,
	juri.lelli@redhat.com,
	nik.borisov@suse.com,
	tglx@kernel.org,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	vincent.guittot@linaro.org,
	bp@alien8.de,
	thorsten.blum@linux.dev,
	cgroups@vger.kernel.org,
	tony.luck@intel.com,
	david@kernel.org,
	mingo@redhat.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	seanjc@google.com,
	ljs@kernel.org,
	zhangguopeng@kylinos.cn,
	dietmar.eggemann@arm.com,
	mhocko@suse.com,
	vinicius.gomes@intel.com,
	tj@kernel.org,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	surenb@google.com,
	hpa@zytor.com,
	x86@kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	tim.c.chen@linux.intel.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rostedt@goodmis.org,
	gmonaco@redhat.com,
	jgross@suse.com,
	mgorman@suse.de,
	graf@amazon.com,
	linux-edac@vger.kernel.org,
	liam@infradead.org,
	ridong.chen@linux.dev,
	longman@redhat.com,
	bsegall@google.com
Subject: [PATCH v1 2/8] x86/smp: Remove unnecessary WBINVD from mwait_play_dead()
Date: Thu, 15 Oct 2026 11:33:25 -0400
Message-ID: <20261015153331.1872641-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015153331.1872641-1-pasha.tatashin@soleen.com>
References: <20261015153331.1872641-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a logical CPU goes offline via mwait_play_dead(), it executes
WBINVD before entering the MWAIT loop. On processors with large shared
last-level caches (such as Intel Xeon 6985P-C with 504 MB L3 per
socket), each WBINVD takes ~85-115 ms, flushes and invalidates the
entire socket's shared caches, and stalls the physical core (including
any online SMT sibling on that core) for the duration of the flush.

mwait_play_dead() places the logical processor into an architectural
MWAIT C-state—the same hardware C-states entered by intel_idle during
normal idle without executing WBINVD—where hardware maintains cache
coherency while the package remains powered and automatically flushes
core-private L1/L2 caches to the coherent LLC on C-state entry.

During system sleep (cpuhp_tasks_frozen), however, power may be removed
from a non-boot package's caches after all of its CPUs are offlined,
and the sleep-entry cache flush on the boot CPU only covers the boot
CPU's own package. Skip WBINVD in mwait_play_dead() during runtime CPU
offline and only execute it when cpuhp_tasks_frozen is set. Note that
wbinvd_on_all_cpus() callers (such as cpu_cache_invalidate_memregion())
only reach online CPUs, so a package whose CPUs are all offlined at
runtime retains its cached lines while powered.

2-socket, 480-CPU Intel Xeon 6985P-C (N=479, mean of 10 runs):
  Offline:  40.46 s -> 11.42 s (-71.8%)
  Online:   11.14 s -> 11.08 s (-0.5%)
  Total:    51.60 s -> 22.50 s (-56.4%)

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/kernel/smpboot.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ba01a9e919b78..60a781dac9991 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1414,10 +1414,6 @@ void play_dead_common(void)
 	local_irq_disable();
 }
 
-/*
- * We need to flush the caches before going to sleep, lest we have
- * dirty data in our caches when we come back up.
- */
 void __noreturn mwait_play_dead(unsigned int eax_hint)
 {
 	struct mwait_cpu_dead *md = this_cpu_ptr(&mwait_cpu_dead);
@@ -1426,15 +1422,21 @@ void __noreturn mwait_play_dead(unsigned int eax_hint)
 	md->status = CPUDEAD_MWAIT_WAIT;
 	md->control = CPUDEAD_MWAIT_WAIT;
 
-	wbinvd();
+	/*
+	 * MWAIT C-states keep the caches coherent, so runtime CPU offline
+	 * does not need to flush them. System sleep, however, may remove
+	 * power from this package's caches while all of its CPUs are
+	 * offline, and the flush done by the boot CPU before entering the
+	 * sleep state only covers the boot CPU's own package.
+	 */
+	if (cpuhp_tasks_frozen)
+		wbinvd();
 
 	while (1) {
 		/*
 		 * The CLFLUSH is a workaround for erratum AAI65 for
 		 * the Xeon 7400 series.  It's not clear it is actually
 		 * needed, but it should be harmless in either case.
-		 * The WBINVD is insufficient due to the spurious-wakeup
-		 * case where we return around the loop.
 		 */
 		mb();
 		clflush(md);
-- 
2.56.0.385.gd3acb90ef8-goog

