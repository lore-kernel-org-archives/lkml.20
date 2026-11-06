Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928168;
	b=SrO4HqeYkXoLvl0AdoxnMpT4l0YATlpbBg3pDwsr4q/OG1twtIw7C4o2iyp+2FKNYQDg
	 iVcG6uF5KHvBErzIkXLmDE+XIxY0R1p+8UpY7dkvlrY/yhzLVVnwERYaXdMdIAwEjeGGj
	 QORj8fFGn6/ITjZOW/rPzG9LU6yABI6JYE+XKekrnO7De8nDHZnBsxPMiBZTzZUBFShJk
	 t0VsxW5NYh2xFqf/leKhSIAlZ/8iyZT9+mhrkx1YhH8JKmhSMKABf1YmpF1Qkce80xC5V
	 vgUk0gTr9pUeJ75mfhueHNpTHkj/cxaow6vM+xbIhx19ZzMReW53gD59NnsETE/4CIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oLgPV68l9ICjIDifE65oCN1RGzBXPv/N3KtgmZVNysE=;
	b=W9zKAmOfzP/8zUbP+g4HFbrt6zqz5vgN/LEpD1y6MTSkhwVbSurlNQuUxbqWK1kwlEzD
	 5pFO5Be9ZYEE1HeUND7X5uCxgMnZ3wMv40EW73GadDAVzXVkfC3cDjsH8+eazxPRpQUhG
	 eomluU4cFQT6qi/Mno01pvD9pp1y3PV4TyPO9YrZBWk7TUHNiinf+0aWIP0RDSW2IroXH
	 /dDLi22eqykqTx2waOsECPI6+qVw3KY2QMsSPhodaanyItcg5M5k7obRtWBGA7XkoQcU+
	 g9VfQRA+GuyKn8I3cqLaM+R6vptJjbNLbkUuaIlqquvoVdRMwAAx8D4x6QdtBrJQPSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35445606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35445606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070755c8cso32045b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:22:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793928166; cv=none;
        d=google.com; s=arc-20260327;
        b=beYmWDagl7XRwpuSafagMX+7UTXYA38OL699XswjOoQbLm1Sof3pJrIreq9dmW3KEC
         SKk1SJBBRqVfKTm+cYRZL3ZoAYhIAfaibrqD2hKSANv9SgRx4zQxlrPUFhKNqeggblBm
         4Fl0/PhgPBKkCskid1vH+J8AAOv+gfnX3tyiqI9YVEAwSlVHc8tKGZbat9aCF8kxvlvP
         FrlQh7+q6z4V9ECcV7I+cAOCWuJ7LpY6mNxYkTgdAcbT+OM5DK+3kA3L7myR+4TFjoON
         3Gj+SIzYxIfFmyYCX2xiJU6Lz1/W5OnORbt9J5PQrkdTgEEVBUeknFNwVCwIaahaq++U
         JlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLgPV68l9ICjIDifE65oCN1RGzBXPv/N3KtgmZVNysE=;
        fh=ADQU2j49iuqIzE1dCjpyk5IvK0BLb9vzg5bbIuU4c5I=;
        b=gFy/Iv1DOIf0ZnA6AFSrw0bpl/0Wr2PvvyhGEyCSG6mnw/Afpt4OBaWuG1VP8U1e+Y
         bWIrBLUoydekZx8jAJ98EjARV36fYZRs5ZscLHAA/IgNTpgNDcxgCYHjXnEwBG+BBYkd
         oni3QJOoTTGb/c/fKbs/sFcil41Ij/wJAFjQ/u1rSiWR6DMJB6tqtR/dH3+eSHn4Szuv
         1qUg2DKAC7BCO7F7hfHD4B41M/uMbAH5DQFkYP0l11KZqC6c5iC88VkO2bSoceFjwm+v
         iYDBWuoysgW8TQNW5hz8cld13H0Ms4SLa5tNvb9hEbRJrJr6B+4lkdsDG/1f64ZeznTd
         o5kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793928166; x=1794532966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLgPV68l9ICjIDifE65oCN1RGzBXPv/N3KtgmZVNysE=;
        b=BXgsLCA51X5/W48GvZrpBezpY+stGa03fvEbUi2MV56MnNmF4a2PjDTUVnBg0Dwtqe
         Pc0pFbbkVSP0pF2lMOwQEWZuhIoVpWFLaZww3T/CDXUanEMozEFBbg5xukYGZHM3dK7Z
         /fQ7M+BmNkKN//ilq5bRiwTE5y+M3XE5NT96+Mb4FuQk23KwrKKCtl+UAKDpUXGzEGJV
         USSryhSewq0S2ePnFYtulTY16RPJSyBaU+5La6UtGtX/D/3Czi9oUOP9+hhoTJe/0ETl
         gYSYGkR59nTYA3bP+5Nf3SMG0P++deg+hHNjH+z7C7raNaTFT7WIIduRah7XGk96iqIB
         wcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928166; x=1794532966;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLgPV68l9ICjIDifE65oCN1RGzBXPv/N3KtgmZVNysE=;
        b=R/IcvWCc/GYz9ob264diNnhK4Z0HT6FxhiOplPOZCSJKN27la9tEDmA2qXDOy0s+R5
         6tGPYCGMPHvlVoeNIMCb+6i91mpoTVtbE5LNxT+kQqSSuC/WFe2S6ENQ5V0NdB5kV71p
         SWM+OBOWRow71iixXvV4lw+xSmBa1mPR3vHLNPWclLsBvUWQ5rmEecCwqcWhkHyqZQAn
         jYbBPVzLksun7p9FR8DjEk4F0X0atEmNus3729/gbTkCb4ur1Fo123KHJPWHiEH4RxeV
         TXt0nW3eRrUsxAWYPKngHnoC4Uf9Dk9PV9miqrczkAhD1o+ZiU5lL/gt44zVm2a9uW5F
         Ztbg==
X-Forwarded-Encrypted: i=1; AKwUvBzwZqzQyMIw0ElQJ3QIkZbzfuH/L9tiBm46stVJIhxk2MKiEW5qGljHNrrZsyS/qePuJc/FJLFaBFv5wkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wU1oaQYPxk41S44M6X2pnrSzgbDWLQR2rglEBZCd4PiXMxWN7
	kFy1YXB7VHULf9XiJ2u/OGZb44DK5VQjNeTegVhIWtaDDhAwFgx/u7jrius3hMlW/21HVqD2EVa
	GJsv21qLDYevOLn2vJJb7eId5Q64LELCF/jkTNmzg
X-Gm-Gg: AYBFou37Ntxc21ZbWhYM1ggDMfmvOEffKzU1UAzfhH1dRge1LdNAfVSOXOyXL1LFYHd
	FkGH1klIkh48upC09kn5EQA5cJUPFnD/yNOI7ryP70J6u5sN6ZPSRqOir0i21ySTGuquh1bpqXW
	MjQsHYaaavliiA9hy5muEc6v2MK85giIaWupK0J25JYbUt34DlmMMHO82uLA48/xuHdePpgANsV
	611uzOQSIHtqXk1rnfqLEK9DvO2JEk2jt8xsc0jhNnAvGYO1k1SKWGzk9qw4eyzg9i22jJOp13X
	BaX36Ud90KpfXA9miEv3T0QqfCyaG42aqvLXTsQ8Q8fE6lmVnjpQO7ou8m133kQyNczX3MRgvh9
	uWSynnJxclqCZi1nK3UhCVm/nZP42wd4S8nc7s+/JyQnWqSCnz5rmGFtuE2erRMfYmHt/
X-Received: by 2002:a05:6a00:4f82:b0:87d:e8a0:2389 with SMTP id
 d2e1a72fcca58-8b37b37d233mr903874b3a.21.1793928166471; Thu, 05 Nov 2026
 17:22:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-vma-flags-v1-0-0d3cd15ab75f@kernel.org>
 <20261105-late-2026-vma-flags-v1-13-0d3cd15ab75f@kernel.org> <CAHC9VhSR=9YNhBxeFBcTR8wgG2yDP1fW590QKjzuc4Kq9ohaiQ@mail.gmail.com>
In-Reply-To: <CAHC9VhSR=9YNhBxeFBcTR8wgG2yDP1fW590QKjzuc4Kq9ohaiQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 20:22:34 -0500
X-Gm-Features: AclHuK_C6UmASiuiBuBvumlcrlzJEUCTa0-vZyEfxhlZIjAFaCskKj-ONE1360g
Message-ID: <CAHC9VhRDVz4M-m_4UZZDKMgs4uc+j-+-jwYEdBDfSD0rtd-1Og@mail.gmail.com>
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

On Thu, Nov 5, 2026 at 6:17=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
> On Thu, Nov 5, 2026 at 4:35=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
> >
> > Replace use of the legacy vm_flags_t flags with vma_flags_t values in t=
he
> > mmap and mprotect LSM hooks of SELinux, AppArmor, IMA and IPE.
> >
> > No functional change intended.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  security/apparmor/lsm.c           |  2 +-
> >  security/integrity/ima/ima_main.c |  2 +-
> >  security/ipe/hooks.c              |  2 +-
> >  security/selinux/hooks.c          | 14 +++++++-------
> >  4 files changed, 10 insertions(+), 10 deletions(-)
>
> Similar to the other patchset you just posted, is there any reason why
> individual subsystem maintainers can't pick these patches up, or is
> there some reason I'm missing and they need to go through a single
> tree?
>
> If they can go through multiple trees, can you split this patch up?
> AppArmor, Integrity/IMA, IPE, and SELinux are all maintained by
> different groups/people.

Since there seems to be a desire to bypass normal procedure in favor
of speed (surely that will never backfire), the SELinux changes look
fine to me, but please do wait to hear from the AppArmor, IMA, and IPE
maintainers before merging this patch.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com
