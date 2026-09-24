Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93AD4AAC50
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273965; cv=none; b=rSyAMDVegf8seVDGl7Ygkjp4ME9lHu8kHi17krp0eh4jbDz5llUYhyW+Edg7i9rMaZ4sC1CzBJYlOy8zT+WcrEhOzasJcKV47bkP3vx8/B7rXQsVDSfNwBozUAuB920N60V95Gl/aezDSFOVy3+0XHX/EtggqpsElP3dd7c3SW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273965; c=relaxed/simple;
	bh=IvUR2431T4OLwHWTHJUJSLYNuzeAJuOHiFRGzJguyA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQ6eQg5lDnZRqC+sqkCoXzCmDjtY/ONX+BH4CmqYYn+TsY3YgDMH36z6DCGmj7Pg+J1L5FxaY292ftGFc4BgmvSNqWwo8XX812vHIS3icH5/B4prpY8SmEafcsnDeXE5FYuvvA8CJ+gQHwCbYKRAfXwro8He7sRhwwrdG14jG28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JK2VMlCz; arc=none smtp.client-ip=91.218.175.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JK2VMlCz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IvUR2431T4OLwHWTHJUJSLYNuzeAJuOHiFRGzJguyA8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790273961; v=1; x=1790878761;
 b=JK2VMlCzlWD7pG4XUcQz3UmmSvPMinHkMCt3G4tpJF1SDG0LmasM+K9jZhtyqATA5haK589a
 uE2WO6jtPmVC5WBB86qPhROFjqHjHx/NaplC/vz2Ap1EY3sLeyHlkQ+yMSfw6qTuIpEzIKfJsg0
 HyCkNBRjB8RwfY1+ZRGwUIoM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 83c7589b2e139cce;
	Thu, 24 Sep 2026 18:19:21 +0000
X-Mizu-Trace-ID: 83c7589b2e139cce
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b8c42da963so1341e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:19:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVVJUmpObqS25jr3i4vf3V5B0ebZ1pNq8Oe/ZoC8WhwSvCoHpGoFgHtJKA1lCEx7OAkSNWTRTwjcvIRLc=@vger.kernel.org
X-Gm-Message-State: AFuF++mOzSMD85/mf84owCgPYjlc2OQND5Lu6eZUAe7D3erYaJCM3Kb8
	/asCYlA69H7JaOV6nFsWOXCDekei/XiYTYMeRmRWDUge/JQGSZ9U08Ozd3xqMf2U9qlR+dJcz54
	DGi65BpNYm5AiB+fGfaEWOyxGop/GG08U89P5gy32
X-Received: by 2002:a05:6512:3ca9:b0:5b8:e262:d32e with SMTP id
 2adb3069b0e04-5b8e57821dcmr16882e87.1.1790273959309; Thu, 24 Sep 2026
 11:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922071945.693714-1-fuad.tabba@linux.dev> <20260922071945.693714-2-fuad.tabba@linux.dev>
 <arVQutV75u2gGVr4@google.com>
In-Reply-To: <arVQutV75u2gGVr4@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 19:18:43 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz=n2Tnq73amL3cok0=_vn-cigesdd1r-emt=+__Xatog@mail.gmail.com>
X-Gm-Features: AclHuK8gQuMnh5G0uSWpcfUI1aukInqrdbq0WmB1N5HLh0hWNnycc7FfERA0vUQ
Message-ID: <CA+EHjTz=n2Tnq73amL3cok0=_vn-cigesdd1r-emt=+__Xatog@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: selftests: Fix arm64 sysreg header dependencies
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Thu, 24 Sep 2026 17:32:58 +0100, Sean Christopherson
<seanjc@google.com> wrote:
[...]
> Definitely doesn't have to be now, but at some point should we split out some of
> this arch-specific sub-Makefiles?  It's nice not having to hunt around to figure
> out which tests are supported by which arch, but the amount of arch specific goo
> we're accruing is getting unwieldy.

I think so. I'd keep the test lists where they are and move the
per-arch build logic (the ifeq ($(ARCH),...) blocks) into arch-specific
sub-Makefiles. I could send that as a follow-up once this patch lands.

Cheers,
/fuad
