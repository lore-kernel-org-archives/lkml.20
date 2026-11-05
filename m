Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793920681;
	b=QXZ4olvErbkljNkyYGybnL+ddJETK3P75P9kd0uHl7jEKifssUwlJX4IEnugrjpLP62K
	 SlHoD+4yF30EpCCop1unO08XTpznP55d8Gy12QIUCqFgAyifS2efovFcBpx21qkxtZ97a
	 ABqzkdOvEEYg5aPdkKqXIVcquTinecoGqfIx7zqI30ghZeKXbD37wGLj5kSnNBnGAEDsp
	 B/uaSDOcdCX0BwK0CmHLZzkZwgJPcSHWWNduSrrAhFdhW1TAGvHKdZJn7AqEhXDRDtaWr
	 Udcb9cxW+KcqAZLp06pGZfa7c/XrXzymgQU+gHAXjPC/+C3FFMxHl/bvAhQEDRXNniQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fuCDmSI9zu6AYuOwJkaSaRyngdfgRozjSLztTOAphqk=;
	b=4cDMH2cppdTy/qa66tax83nA84Ixz1NvVCOp+N8vni7L+lCrXzDVXxiStMNmWEEIhz+x
	 4gJeEu1bX25iZZBMeNiw5kSWkO4hmw3l/aLrOvFAAFLSrtDBdCrucBBUnXBRI+QRZ6hle
	 8Wxsdbt64LN+Z3pMbivwL4BayPeV1lvRy1EYdHnLpm4UZM9oVoOpuazGn70hqdICM4QZM
	 W8RM7Zh4f1whYuuoy6vVvF3vcDyBaHe1zAFfPfi/270A00dCoJ5p5dIYSoLuftSUx0Bo0
	 qNYzOszAi9C0zi0osb12yY470gLskNoCYLaLPiWjwIVAOFLS8qAzjACusWKd3IiF0Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=F936vzKm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03582606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03582606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=F936vzKm
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so26853a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793920679; cv=none;
        d=google.com; s=arc-20260327;
        b=D4t30LoNYauINdo4qhXria1vOPwADYBSckkXV5N/2haiEyjHH6oVdB7/LRcS7eb722
         TUJ+AgPVMMZZEN2wxGZ0nTHqUUX1VkYT6jbzYUJyyK44G6Dwy33UadV9fnwIGNUVmKc2
         CVQyLdaSwedZ8qC96Uz3vTHxJNle5k0VfFwtFPME7uQ+fACJ7q93r96XqnjNzmWHc355
         Ci62TB+wR5uUoeIJiZHI/5/KvPsVM1j/dYNpYOQyObH3NHKvKH0oAd7mlWGvE7jtv6un
         gzca2FV4lw4Kp8+h+7kTNgXUh3avqZcmH7lPGKoSPpRlE1SGa3CgfpId8KzjYpmaSyxw
         vJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuCDmSI9zu6AYuOwJkaSaRyngdfgRozjSLztTOAphqk=;
        fh=luwucCnU1K5srUcPgRvOeF1Jm71kEltX6bE303xTLxY=;
        b=kDuQf93edcpoJ6XEU9EZnKrfdFH+2yp30jWXZMlpQtwfpDxwal45YG7F5YmsmZ8w9Y
         gp7Qya1+QxznRb0RU1IXoCkSQOQWAS99dNLVY6TB7OXRRaz0uCTgDQuwVXxe0ChwDdyB
         b0ArpFSKdLLftF5hmi/7GzzBw+R8mBa2wzCbf0DIDG7HWGDQ1EUNtWNh4XmW5IrzG5rf
         9tvoqq3OwP0WqUJC9EFN43+U5gMONZDHp3KFYt8XuegIakz7MHDl8fcMVq/UzdrIPADD
         ZDT4v153yLfF3AJaGQgW6NuKe6DB6R0WwCS/I16P/5WBJskm/MwNMofFkcXbpkvITvV4
         SSjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793920679; x=1794525479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuCDmSI9zu6AYuOwJkaSaRyngdfgRozjSLztTOAphqk=;
        b=F936vzKmZco1Rg9qiS2Cf7yXwnXt8dn1LQ3YxCN5SMsKSJRTlu37FG2JQnmiZ4tO3q
         ZY7C/eCqTECYbf79gAR8gp3oow9+Ykdrk78RZdAOFLnN4sIU8x8jDIiI/j4+tmIgfhgQ
         Kfc7/iulz45+20nMepsyi2DVKsca2I7vu/IOFa2DSNB+5NoNB+X3xZL+TnSEr5nUJW/0
         t+eWupnUof2Q+Z07m3XUdhgKdmPOk5SNXh4+R1i03zuB5eyYkN5hGGMTpwfL4P3jF/oi
         qjoVjwxKWuHtQbutc+EbzPaNTI2YVJHBnHBIs9egvV2qx2jXIUZICkPleteOCZKku3cJ
         ZAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920679; x=1794525479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuCDmSI9zu6AYuOwJkaSaRyngdfgRozjSLztTOAphqk=;
        b=rdcQ9Zh6gpnF/kACoJ58hfaty7hkDaF5bdWi3IAuoixnmul6Ks/8/NQ+9Ux2F3unaD
         bOn0UK4pROlOLFSvKjaT/oeqmcnr8anfOTsomqC+t/IsVaASDt/U/yGWKtkojqK2V3J1
         tdQYrVg5E64aGSzD8pHfA0DLPhTZ0Qe19HtMRvavKz1I4vSdYXLmFBcOL5v8PEbPPrr4
         9G3WQA6GjXLXkKUKLlzOuzpCZ7WQsM4HXx7m4IoUp7uJDV3s/XqrsgtsaZyi0VSKwS3q
         5kLvAs9mdJsiWNgG8ukbkmJc6zUD3Z1FPqh3BQJRAr4fJELlQXseeGajhxAwfYUiLzCW
         7vMg==
X-Forwarded-Encrypted: i=1; AKwUvBwx2S1uleGQrmLHF7WUZ2ApXi+flnsbaNw7XT107Ej5/TEk82GpbVS1/CyvQfWP0WYwZ6aKx6uIAUU8AOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YB4oEV3wITYIXMlCVUphYZCLfeh1s/d+7cKOfy973JoM8R5cA
	jgqXcHMZ+PXwdX9gDDUqvdc4s5XN10AoCeToBsKYDfPcb2aAblLlHTKWtS3zkK9kHC09ax9zUIY
	MyGlddIiUYNdIRFjqPsQjNgBr5NLhZ3HPQ6+jXjaZ
X-Gm-Gg: AYBFou0dn5W2aZ2SUqu0x/j0AZHcLtgG9kgvPSMoV3EWxQ+7uDLb79qdrwVOb3mYJEH
	m/2EWjPoOAj5/LDXKv8QmqRjFOjkBs0eLL+0AkNQuPywe16Oyg3y7R7VSszC/wEx6NA7KTgLoaF
	yCas22Wsvx3E3sn3cMSbA3FpyHlLmDFPZYrCePUYYcum9otX0lIgu0ffY/Xy3Z3xon4v0rpVzPm
	OYmFovRhZwFzETUaBvVfAKussrTT97d7cdLNlyU7WPkFFQW4k8aSv/6b9aSoeyAWsw4R26rWpHr
	ZWPHu5eNgsupej2/lQlCtxfb8AUyErqCsIf5S+ZYfklwmGiMVLZ86pyn3X0vCuhTk9d6tNgCtVe
	ScQBsUHkwjigGHIHFKwB3p3HwOafKcdEtcfWJn107yH9oFVjctA6qU+LAMCbJP6ChgEXU
X-Received: by 2002:a17:90b:1dcd:b0:3ab:f38:2b43 with SMTP id
 98e67ed59e1d1-3b0db703e39mr535625a91.34.1793920679319; Thu, 05 Nov 2026
 15:17:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-vma-flags-v1-0-0d3cd15ab75f@kernel.org> <20261105-late-2026-vma-flags-v1-13-0d3cd15ab75f@kernel.org>
In-Reply-To: <20261105-late-2026-vma-flags-v1-13-0d3cd15ab75f@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 18:17:47 -0500
X-Gm-Features: AclHuK_gkg-Hspii6U5_01_jGLQO23B7F4YXuvzvsb53ImE19wnChR3DgLruv6g
Message-ID: <CAHC9VhSR=9YNhBxeFBcTR8wgG2yDP1fW590QKjzuc4Kq9ohaiQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] security: convert VMA flag tests to use vma_flags_t
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Rik van Riel <riel@surriel.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Pedro Falcato <pfalcato@suse.de>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Leon Romanovsky <leon@kernel.org>, 
	SJ Park <sj@kernel.org>, Rakie Kim <rakie.kim@sk.com>, David Rientjes <rientjes@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, John Johansen <john.johansen@canonical.com>, 
	Georgia Garcia <georgia.garcia@canonical.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, damon@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:35=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Replace use of the legacy vm_flags_t flags with vma_flags_t values in the
> mmap and mprotect LSM hooks of SELinux, AppArmor, IMA and IPE.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  security/apparmor/lsm.c           |  2 +-
>  security/integrity/ima/ima_main.c |  2 +-
>  security/ipe/hooks.c              |  2 +-
>  security/selinux/hooks.c          | 14 +++++++-------
>  4 files changed, 10 insertions(+), 10 deletions(-)

Similar to the other patchset you just posted, is there any reason why
individual subsystem maintainers can't pick these patches up, or is
there some reason I'm missing and they need to go through a single
tree?

If they can go through multiple trees, can you split this patch up?
AppArmor, Integrity/IMA, IPE, and SELinux are all maintained by
different groups/people.

--=20
paul-moore.com
