Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C05649BD8A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303064; cv=pass; b=EkNlHW4VuaRzYxbZQWgeohPhyX2Ov/L3YLuMaOYHSlXaCTuiN3aIf3NmujmhKiUtxyFXU2SwbTxLkQqjM4slFEN12tcPDjoukXgV9j9am41vSEHzRq3YeOmyjrXx9kwkBz09zzcCnNFuTU5Pz+XAWAkDv3eSeEZcm0xL28ePTMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303064; c=relaxed/simple;
	bh=9WCkiE19cbtAuYYQ4uqsh1anpnBBbEDR9fWCfux10TA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaASje3DJozbIsTupzKSun3JKB51r88LbpIG/sm/SdlS31xNT6OpXlvxovIkLNooGsRCr8EiWauh3DA8C71+n3Gv10V4khCpIlUel5SnhhRGX/epjEUBBl516SiY4zpNKTlDWEsG2xYoIbrBEMykFhRurW1W9GflXpLCMvRb0oA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KAol/EVW; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KAol/EVW"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ab3aaf416dso8847147b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791303056; cv=none;
        d=google.com; s=arc-20260327;
        b=mXF+wyMufBgy3z1Wj85+bK/jozg4b2bYOhiF2INFneSLPvqsM2wJOwyOFY3a6621l2
         SrGLwdoswpF++fRURJ3cBXGKjBxYm0aQB3/KXitHrtHiDoQYpWGMVnvhtstREQHKHXo9
         skDrdmKnuJWlqcH95jPvd588VyUldk7ZVJyoZIV++n0ASUWWg5seE8SwSNfHCsuyYs8f
         GWb6LudmqwGS46UyYVlDqtZYgb+Ackqm2hNkm+zCpo+ofJR3v0dHJ9f+B3UJg3nMpqz/
         N5o4QNo5SP2Psh7UjqwHXpOUFHEfnBiBwXi0exaXYVbD0I3CtB0NNKIa+TbUdoUm97H6
         2qPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        fh=oKw1eZAzYM+TDNNrtbDOIozBf5uYO7Xv5KsNHWcAf6w=;
        b=TrT55OYVtLA4qS8Jwmm6wGqhiHZWYMEcGJhS1owxHa+oNeeN+VF9bbnNCJGdXRMVQM
         Dt5WYw7TkASOiSRWoUXyVdDxXIaXoC4dRzAbbPoRGlaqQJnDa7VOxkFTnUlSLl/fNX9w
         g5V53O1831gnqYqKv9TkFSLrk/n62O7VpP8fuYF01Y5A1vhk0pm/91uIgvjZHuwgcb4z
         YLINB0xTGWh5XnQA+cs6d6cH7PVJN/rfkACsuZxJ+IuQTRDONUTvhaTwamhpXITJHaNm
         eNHR4oNh0i00Z01G3Fyy5MuXY+kVvoKJrd+WSqhAECpTfx3UFYUCg7UCZu398C8sebyX
         KRWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791303056; x=1791907856; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        b=KAol/EVWndwCAAefTkH6Xt23lTKfF8bg89lV6Q/YwYVIALOx+VT+A3ReJEZd7mhVHY
         u5uAwWXDtUNCGzoumqWqKUFMxCuWAqWc8E48Bs4q8GQJ5DV/MYyK5FkbCaVdzSvlgJAj
         WpVwnmuRWxclQi+qIP4Q+Q8r08cIMnguge2IESogruJD5JBKihZ7itYtdLHX42G+43CT
         9v30tzlxMY8Uz6u7pbHeR+g580BmjbeMFh+TLSDfjduVagvTeg3hroCyqU1v5CFFmeXh
         hlI6dVwjfm6h1J5fH+akAR/gBAnRkbR9KhvIjbt91Gqw4uC9O8uVloodiFrKHYVwC7xk
         cjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303056; x=1791907856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        b=XJU/9klM+e3g7Mi9EH6AJNsJIszzC06/nVPzpYYSvgbmIK0DnaE5l2Qf2Bf+vilS1E
         Z4Z9C3lzR22etK/dk0W//lXL7P4/zzmdtuUA3k4VcXpUbCGYyhh679AeEmqNPk/VT/VZ
         RSi9qKumiWf9Nn0eLk8aNFh7XqokHD/+EtRr6vMrpK+kZCNsJhz8Nzbl5D8qAHfC/2D0
         wMhX6CDj6CQT5lLw0M/jR+dKV7qnbJfBTl2Eu92wclA243AP5l5Boab7KsG6wrQ82YlS
         hFHy9eKV+hYMShOLzn/EiuUpIGzzGWL+X90C07zDrcqvJNuZfVSgvoUwbWcwUZGYSpAR
         Bz8A==
X-Forwarded-Encrypted: i=1; AKwUvBw0zkvDwP5teNdqr0opXx4uLSVppyCtlTHaTL+p3IH1m2aUJBs3DeRb/ifULiqmwS05sP9xZI0hVXg18+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8FI01bave67XSdLyu2oO9119uIvh2UOH2kDTRsWBlTYsogZCr
	5sJrjEZIfOPYUVNabliygDKJ0oxERVy2+ccDkljoAMgD829v5exU+TsUCIKzS7naoD6+LOU0imC
	r7Guq8mXpuhyltuQGl1kQGOR8AqXL0p696yFwB3eo
X-Gm-Gg: AYBFou0JJgDP5YVgCn6udNXb6HQFPuYbmdwkblVy3C23BFiDHF4SLI33iiBsJDGi2HW
	AKhViZ8TFwGBec8ZSw+7IyGR9Fiw6cUFP1gthSUdf1KWGFHDnZRHQpq3dXyLbnxSbOc0BRL8sv5
	FiyJ7gI2HIw3APMTKcFXYq+PPzKFDBweTlrQ17WPU/iz51o2n/1zFxbK0iXN8dcacYvDxd27q1U
	NPCc5Avb30tQuxfMPBQNJnR8nlbGluvie0DvC0yoyTwQIkfn0GtUlkhk5njS+90Ji172MSThiwd
	RQD0wTIp2uPPWnOvvb6miCFKjWQ1kizgtmnHFJLxQ2NNvS5dMGMFXA==
X-Received: by 2002:a05:690c:5302:b0:8a8:7e5a:dc2f with SMTP id
 00721157ae682-8b04f40f097mr9171807b3.12.1791303054779; Tue, 06 Oct 2026
 09:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <00ed0b57-ad05-4c5d-b152-7c81df94b23a@app.fastmail.com>
In-Reply-To: <00ed0b57-ad05-4c5d-b152-7c81df94b23a@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 6 Oct 2026 18:10:17 +0200
X-Gm-Features: AclHuK_OeB6Z7-eCIUVq_1RabrgIKOGeEVPLb2q2UdMqE46rpsfhYWgMuA5UU2w
Message-ID: <CANpmjNOaykC4McAj=gZghqPSQc9aGBP_CjgKmp3n2yjeJTxDSA@mail.gmail.com>
Subject: Re: [PROPOSAL] Replace gcov and kcov with llvm-cov
To: chuck@wolber.net
Cc: kasan-dev@googlegroups.com, nathan@kernel.org, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, oberpar@linux.ibm.com, ardb@kernel.org, 
	arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	dvyukov@google.com, hpa@zytor.com, jinghao7@illinois.edu, 
	johannes@sipsolutions.net, jpoimboe@kernel.org, justinstitt@google.com, 
	kees@kernel.org, kent.overstreet@linux.dev, linux-arch@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, luto@kernel.org, 
	marinov@illinois.edu, masahiroy@kernel.org, maskray@google.com, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, mingo@redhat.com, 
	morbo@google.com, ndesaulniers@google.com, paulmck@kernel.org, richard@nod.at, 
	rostedt@goodmis.org, samitolvanen@google.com, tglx@linutronix.de, 
	tingxur@illinois.edu, tyxu@illinois.edu, wentaoz5@illinois.edu, 
	x86@kernel.org, peterz@infradead.org, sashal@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Taras Madan <tarasmadan@google.com>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 17:14, Chuck Wolber <chuck@wolber.net> wrote:
>
> Stemming from some hallway track conversations with maintainers at LPC
> 2026, I propose replacing gcov and kcov in the kernel with llvm-cov.

I know the origin of the discussion, and wanted to chat, but I guess
that didn't happen and instead we get this proposal. It would have
been good to understand the requirements of users of gcov and kcov
(more below).

> llvm-cov instruments at the AST which enables precise mapping back to
> source code regardless of optimization level.
>
> We have a set of patches [1] that implements kernel based llvm-cov. They
> need to be updated and some additional patches are required to address
> some stubs that are missing noinstr annotation. But otherwise I should
> be able to send a full set of patches (including taking on the
> maintainer role) to remove gcov and kcov and replace it with llvm-cov in
> fairly short order.

The hallway chat was supposed to figure out if there's a way to bridge
some of the gaps, but jumping the gun like this without having
addressed the requirements of kcov users does not make any sense at
all.  As for gcov, llvm-cov was designed as a better replacement for
gcov, so that makes more sense.

Ok, well you made me untangle the most important differences between
kcov vs. gcov/llvm-cov below so we have it for the record.

> If there is a desire to take this in pieces or implement other
> intermediate steps, let me know. Otherwise I can generate a monolithic
> set all at once.
>
> [1] https://lore.kernel.org/lkml/20240905043245.1389509-1-wentaoz5@illinois.edu/

llvm-cov is generally useful to have; llvm-cov is closest to gcov, so
that might make sense to replace.

KCOV, however, cannot be replaced by llvm-cov. KCOV isn't a coverage
reporting tool for users, it's a low-overhead interface for fuzzers
(syzkaller/syzbot and many others). llvm-cov has no equivalent of:

- per-task and remote (kthread/softirq/USB/vhost) coverage collection
(to avoid polluting coverage with concurrent tasks);
llvm-cov counters are global and polluted by everything else running;

- ordered PC traces (edge signal) and comparison operands (TRACE_CMP);

- performance: a per-task mmap'd buffer reset with one store, vs.
reading/resetting
megabytes of global counters after every program;

- GCC support (we may want to keep at least one GCC-supported coverage tool).

It's also UAPI (include/uapi/linux/kcov.h), with existing users.
syzkaller heavily relies on KCOV's features above to achieve good
performance and coverage; there's no reasonable way today to migrate
to anything else.

As-is, NAK on removing KCOV. Consider replacing gcov with it.

Thanks,
-- Marco
