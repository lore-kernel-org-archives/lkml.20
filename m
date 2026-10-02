Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0169472072
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938947; cv=none; b=T28GWOW283L2gRfogx3yNTBZqVeC7KdMNFWN9nQziFotPAL2yLQj1JFPlZCABeoDSPqKs6KzNPFEirnKNrhYJ5UVNOdgBRvmXCgWXN5u339eK449fYhi6Riv7Hb5WIOwgsjpKGdx2aDmt6Wl2/K4ogWZtiG77NHMznO2AEqAni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938947; c=relaxed/simple;
	bh=sMYDjXGq5gOME0BnR8m+hayKlCpBszg98PRKZ+lMzIM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ur5YFaiO7CwqxARgVWqjpKxV/arl90B7AIkgb6XB3Ajyp44XtG6Ir1SC9yt3Wa9n5OqAGELWc7fTGpH90BPJW1wuJVe8vw0AnrYdLhm+lNN9/gQHj7sqyALxTMRK6rGF1oJPVb1xwo1xsI9RJNgy7QHdhXPF3RycQghFLdUIFsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxzCkk7s; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxzCkk7s"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so3011214a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790938945; x=1791543745; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MJDOeLwqvcp3iBpXwoKB4HC3fFzZPfjNGp8c93vnL5Y=;
        b=lxzCkk7sJ/6z2hR5PheLYpz8pwU44b7b40geJkr5TPOhTiXt1iO1Cm8cThyyreR3HF
         997xjL4ycyXHXH0XCeCPKi113DqL9rMK25XvsAbt8IGnfRRhbD17Ail/FldNb3mBr35O
         bwl094r+aGev2EwA13IReWT/i/sLK3I3BW2AhL6Oy1nlBlKyiMnVhLCiffKlWe/KULey
         EIf6jfz0eSxYMcZ41520nDhOkt3c8OvspgGVzi6+5eYPo6bh/ff3EOGHpX1fqqZ/VDfv
         tiUwlre5j7OuPwxv4vpCuxgtHGSvQlXE06WeisFeZvG5joqvVd1zm11Pw/pSotC5CA8K
         H7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938945; x=1791543745;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJDOeLwqvcp3iBpXwoKB4HC3fFzZPfjNGp8c93vnL5Y=;
        b=YWeVDHeP6oFDtNXyORwO03bA7uP+UYAWIB3xLkY/nH/vZ/Aou5gBUeuC19tbVsVk4m
         HIY3g48gA7oRXkxvc8TGTFm4wCn0yIdRWUhpnOH0ql9aScm/P3y2qvfkRpTqVDBKiJ2h
         ugvzauOkBiF/i7qq/SNDdBLxPqPMRr/PpqaTafY7nuWfmTqlvyTjchj2RGjEC/HCRu1D
         iZvvFemKtRnRMDkSMlzWMGF37tb0SuH6IxmqqN+zZLq+ljczh+Es1+htfmDyuLqqJpQu
         mXYZZx32d8C+aMX7PLtrs6dpNCrAnto2YM5h6imdAVqmnLkcmESW7qBXEuMmnU4wv9dY
         UojQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5upT9YtkAD17BgngnaSbxFRupwCfldxZmKm0P0MqEkA6uQfp4SbloUqzyYNDn/3oxyLPg2tJTj2ZmpN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxKmZXiGx7mNm+ULkEKI0+h6TM1q6+qeplQVkZ+1rix+Vvvsfz
	CRDfUu/XVTMyaQTnwSxBLGbtGy+RBUOUedTUhbGziPHrgCn2D3RP876y
X-Gm-Gg: AYBFou3fObPl0WNNGyR0QVg1BBHIkwFLrzBbm9OnGAMJgze6KLBELD/NRVILMCqyQko
	C0bANw3IyM0bFOwa840HTOShNVrVs5hZlmy4ghPQ+DzMEge81Qm4MuxDFQdv+/MNO6uHH7xWBM3
	NkbN50F8rDHFHTJjRVlnzREJanmxP1E8Lijq77OTIjbTrhZbtVADH3BfuQ0YJl9u+4p/3LHyZa8
	KNnXWrOMbqJaFaUzcfMLPUtdj87pIqAsJ2UAod0rpDwlRQ41Y5Qm27hODTq8r+btxWKJlcB9UOE
	2n9zZ4JhLVeakwumtppTWn5p97KZSh+NvkcPlGLOgegGWTZxMkWxgI8/7LwoA4PxZrdNdMNOAzr
	FMHLZN82prDxGqBLiTl8AbMY0Rg2DbCivyvn75KXzxb9bkUCw9G0e4InWRxW7D4Llkv4qCSNHNC
	M32vBbPQCnh2HRO7RTrslvFaBC/n8Dq1NLztkkS+O6EfD9pV8iEAPXQhlxl/4FROii763Y53gUs
	S+a6Q==
X-Received: by 2002:a17:90a:e09:b0:3a0:8050:2ed4 with SMTP id 98e67ed59e1d1-3a6e3cf236emr888796a91.17.1790938944927;
        Fri, 02 Oct 2026 04:02:24 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd1a0c1esm1369314a91.4.2026.10.02.04.02.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:02:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.41\))
Subject: Re: [PATCH 1/3] sched/fair: Add smt_balance and llc_balance to the
 decision matrix
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <57c0b8017ec57818815dd833963b594304d61447.camel@linux.intel.com>
Date: Fri, 2 Oct 2026 19:02:05 +0800
Cc: Jemmy Wong <jemmywong512@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,
 Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5FA792B9-8BF6-4E6C-8341-B4D401B86F6C@gmail.com>
References: <20260928042018.10618-1-jemmywong512@gmail.com>
 <20260928042018.10618-2-jemmywong512@gmail.com>
 <57c0b8017ec57818815dd833963b594304d61447.camel@linux.intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
X-Mailer: Apple Mail (2.3901.200.41)

Hi Tim,

Thanks for the review.

> On Oct 2, 2026, at 5:34=E2=80=AFAM, Tim Chen =
<tim.c.chen@linux.intel.com> wrote:
>=20
> On Mon, 2026-09-28 at 12:20 +0800, Jemmy Wong wrote:
>> The group-type matrix was introduced in commit 0b0695f2b34a
>> ("sched/fair: Rework load_balance()"). When commit fee1759e4f04
>> ("sched/fair: Determine active load balance for SMT sched groups")
>> added group_smt_balance and commit f38cc2f0d8a3 ("sched/cache:
>> Prioritize tasks preferring destination LLC during balancing")
>> added group_llc_balance, neither commit updated the matrix table.
>>=20
>> Both types are only tagged on non-local groups in =
update_sg_lb_stats(),
>> so their local columns are N/A.
>>=20
>> As busiest, group_smt_balance is only set when dst_cpu is idle and =
the
>> SMT group runs more than one task. Against a local has_spare or
>> fully_busy group it goes through the nr_idle checks, where a non-SMT
>> dst group may also force the pull via smt_vs_nonsmt_groups(). Against =
a
>> local imbalanced or overloaded group the local group is busier and =
the
>> pair is balanced.
>>=20
>> As busiest, group_llc_balance is not an unconditional force. A local
>> overloaded group is busier and the pair is balanced; otherwise the
>> nr_idle checks apply, with prefer_sibling still able to force the =
pull
>> when the local group has spare capacity.
>>=20
>> No functional change.
>>=20
>> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
>> ---
>> kernel/sched/fair.c | 16 +++++++++-------
>> 1 file changed, 9 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 7455a83a6a99..f9ddcecfd19d 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -12947,13 +12947,15 @@ static inline void =
calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
>> /*
>>  * Decision matrix according to the local and busiest group type:
>>  *
>> - * busiest \ local has_spare fully_busy misfit asym imbalanced =
overloaded
>> - * has_spare        nr_idle   balanced   N/A    N/A  balanced   =
balanced
>> - * fully_busy       nr_idle   nr_idle    N/A    N/A  balanced   =
balanced
>> - * misfit_task      force     N/A        N/A    N/A  N/A        N/A
>> - * asym_packing     force     force      N/A    N/A  force      =
force
>> - * imbalanced       force     force      N/A    N/A  force      =
force
>> - * overloaded       force     force      N/A    N/A  force      =
avg_load
>> + * busiest \ local has_spare fully_busy misfit smt asym imbalanced =
llc overloaded
>> + * has_spare        nr_idle   balanced   N/A   N/A  N/A  balanced  =
N/A  balanced
>> + * fully_busy       nr_idle   nr_idle    N/A   N/A  N/A  balanced  =
N/A  balanced
>> + * misfit_task      force     N/A        N/A   N/A  N/A  N/A       =
N/A  N/A
>> + * smt_balance      nr_idle   nr_idle    N/A   N/A  N/A  balanced  =
N/A  balanced
>> + * asym_packing     force     force      N/A   N/A  N/A  force     =
N/A  force
>> + * imbalanced       force     force      N/A   N/A  N/A  force     =
N/A  force
>=20
> Thanks for picking this up - nice to have the table match the code
> again. I walked the new rows and columns against
> sched_balance_find_src_group(), and they line up, with one exception:
>=20
>> + * llc_balance      nr_idle   nr_idle    N/A   N/A  N/A  nr_idle   =
N/A  balanced
>=20
> I think local=3Dhas_spare, busiest=3Dllc_balance is "force", not =
"nr_idle":
>=20
>        if (sds.prefer_sibling && local->group_type =3D=3D =
group_has_spare &&
>            (busiest->group_type =3D=3D group_llc_balance ||
>             sibling_imbalance(env, &sds, busiest, local) > 1))
>                goto force_balance;
>=20
> The group_llc_balance clause short-circuits the sibling_imbalance()
> test, so this pair forces unconditionally once prefer_sibling is set,
> and prefer_sibling is set for LLC-vs-LLC balancing: the groups span
> per-LLC (SD_SHARE_LLC) domains, which keep SD_PREFER_SIBLING (only
> SD_NUMA strips it). That also matches your changelog ("prefer_sibling
> still able to force the pull...") - the table just reads nr_idle where
> the prose says force.
>=20
> Could you flip that one cell?
>=20
> * llc_balance      force     nr_idle    N/A   N/A  N/A  nr_idle   N/A  =
balanced

You're right. The group_llc_balance clause short-circuits
sibling_imbalance(), so when the local group is has_spare and
prefer_sibling is set, a busiest llc_balance group is always pulled
from. I'll flip that cell to "force" in v2.

I also checked when prefer_sibling is set. It comes from the busiest
group's flags, i.e. the child domain's SD_PREFER_SIBLING (see
update_sd_lb_stats()). sd_init() sets that flag on every level, so SMT,
CLUSTER, MC and PKG all have it, and only SD_NUMA domains clear it. So
the pull is forced unless the child domain is a NUMA one. I'll reword
the changelog and cover letter to match.

> Thanks.
>=20
> Tim
>=20
>> + * overloaded       force     force      N/A   N/A  N/A  force     =
N/A  avg_load
>>  *
>>  * N/A :      Not Applicable because already filtered while updating
>>  *            statistics.

Thanks,
Jemmy


