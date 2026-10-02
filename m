Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C319743DA3A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939037; cv=none; b=f2UdYVTGHc46Xf2EElmN2aywQgwWZRQmp/87RdClwkOhLvqg5jEdGWw3X/IiADg3ADVkISGkDpqAm3vjFINMKOXjYvlMFfd8HWaF87+XMQ3duugZl5yEXbA8RYBBbIQyZpibuabZvbFLrbQRVpEMSewmn+rKpiTRviupfYrqajM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939037; c=relaxed/simple;
	bh=J4Qev+yfxvQD1OwCUM47s8dd9ttwmJ8y/UTwkA70d6o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nUyqj36DBEZiJS1zu6TDZy2H4LRsl5kzPhLmDA9c3G3RSe5jkOdLn/JvyuEjS6WpvQ64PVQzHxg1qe5afXJK/nIGQsgrL9in2BRdhKFj6hx8WOwG58NVmoKBhQ1RHLKPUxR2U9A+yitCdRJR9pHre8M1Fh6lnKpLBbsLQ/zLu2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFrMHzNs; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFrMHzNs"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so49588165ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939034; x=1791543834; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fOzLjPY/di2Ti4giKzVg5Gtoz92RuTsm3BhFcvohAD0=;
        b=BFrMHzNsjT/ubKtSxwzmo9u+hr/gSEkJy/RmLHUNNa0Iv4YiyT3BVevedASYFEy8CT
         G7KPy//4/MF5pKvw2DJHdyADtC41mm5D1BIiC89/Ul6zEBhxvz8uogGtsffSbl3JcxPD
         T6bEtQndKsXZ8nVPoXLfUL0sZtNmJH+tR6/h6FeU8oKcsuNUb9S2689URFvplL9n+HMQ
         GpulVMuQHXZm0tjQMJi35wg/POoVKXxfZPY5grgpxGk+/xB6R9T32oxRdebTqd9ccEMP
         5ctE4HWayWlXNlFrA16fOzx5HcwDkIveHRbcOuH6RpUwE6wrEn7ZyulqBc5rozncNSKo
         yKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939034; x=1791543834;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOzLjPY/di2Ti4giKzVg5Gtoz92RuTsm3BhFcvohAD0=;
        b=gzHiRdeH4lyFyfnp5Kd3B9bP/Wz1tFrsnFopjVyJs9ESf8wl/VdVMlZO9YfOvhTh5r
         8Ng6IBgQNeGUwDG31WrUKAZHwR0yHKbi8yqI3qiO8cc2XPwnmjnrzsrJBZr20k1GU/aA
         qjd4K3qey3/HHaJkCA2vcftG3EXohZ121cqoSr4Ju2ssiVtT2INvT2uswD+8QAYpN3DM
         RBs+Fh84bIMwhPbcvepsoOgeN2wQo+KULbkarR+L1e0pjOsUz5HfWXMnzMythlB2IBJB
         1o9ONxDX4U2T9maQzv4W3mCQuVzvPEV5Ydrd1c3V+Dg90mMiF+mG7rbVpq1YX+tBAlST
         1/4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVcd7WSE+vBNzfNEUf0NqLteMs1Anz+Ju+CQ8NIaJrjY2/5tKSX6wwLvA1MeZJ1X3mBiAQwtBDGbSp1iE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcsz3SN2LB09KU/7dYCdIXoqWQtvvJFsGAyZTcLj0S5gl9S26A
	q+wIC8du1IBtgE55TD23MOwwUjTa3JYvfDMiN3bUBD98WCFQGpGXCRgIsFvkdQ==
X-Gm-Gg: AYBFou3HdtmcuM6cB2dC51y6bi8hFj3chLVeAw/ryCSgwIIoag4nMqI0eXl63vg0X7H
	79WzouFfnPmo1hs6TnFbipm9W2QCTV9B+4YxSyGQYrRX/o7WjgnyuNqRL3xe6m/mzREKZlhEI8F
	HFx38s+RhN+p/S9Us4kTAUYQxWIpAPh8Uhp/EqLSSEZIXO8zGoK8isisG+wBSjo063iqc+G2+PC
	YcwovfskDj+RmNZ7eUgbZiuLf4EnWawD82nwSd5RYBXTJNUPu74fAofEA6XyDDuvHpq+9bKcKHX
	PW3HKd3p936BEryNPEfXgtiL/l3cREo28I5SaDdFsOrrf9L7na9IGYmwuvcRg+ahZamaf/sI3WT
	JmZXaGiniLm4YZGa8KyYc0HJa5C+MczU8hA2sg7qjh+M2SK+oTSofBbTWGDdF3gVOxmVPk6Uc0/
	Ejs6AvF7Lu9dwtBOZwq/UBqWYCIRoNgEugwOKBjVJqqkJgWfNVnVLf3VZ8Z+oPGa1VjilpH2AjZ
	iP2iw==
X-Received: by 2002:a17:902:ec92:b0:2e2:e7aa:74a5 with SMTP id d9443c01a7336-2e49b4e2fdemr22903565ad.25.1790939033758;
        Fri, 02 Oct 2026 04:03:53 -0700 (PDT)
Received: from smtpclient.apple ([202.8.105.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e4ad96323bsm3715035ad.18.2026.10.02.04.03.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:03:52 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.41\))
Subject: Re: [PATCH 2/3] sched/fair: Rename group_imbalanced to
 group_pinned_task
From: Jemmy Wong <jemmywong512@gmail.com>
In-Reply-To: <88f28ac61e238cef9bcf8bda3adb4326c15ba15e.camel@linux.intel.com>
Date: Fri, 2 Oct 2026 19:03:35 +0800
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
Message-Id: <EFCC9B8D-C341-4B19-976F-CEC2129DBF7C@gmail.com>
References: <20260928042018.10618-1-jemmywong512@gmail.com>
 <20260928042018.10618-3-jemmywong512@gmail.com>
 <88f28ac61e238cef9bcf8bda3adb4326c15ba15e.camel@linux.intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
X-Mailer: Apple Mail (2.3901.200.41)

Hi Tim,

Thanks for the review.


> On Oct 2, 2026, at 5:54=E2=80=AFAM, Tim Chen =
<tim.c.chen@linux.intel.com> wrote:
>=20
> On Mon, 2026-09-28 at 12:20 +0800, Jemmy Wong wrote:
>> The name dates back to the original group_imb heuristic, which =
flagged
>> a group when the load difference between its busiest and idlest CPU
>> exceeded the average task load. Commit 6263322c5e8f ("sched/fair:
>> Rewrite group_imb trigger") replaced that heuristic: the flag is now
>> set only when a lower domain fails to balance because tasks are =
pinned
>> by cpus_ptr (LBF_SOME_PINNED), and kept while all tasks are pinned
>> (LBF_ALL_PINNED). The name was carried over unchanged and later =
became
>> group_imbalanced in commit 0b0695f2b34a ("sched/fair: Rework
>> load_balance()").
>>=20
>> Today the name no longer matches the condition:
>>=20
>> - group_classify() checks group_overloaded first, so a group whose
>>   load really is skewed is usually not classified as imbalanced,
>>   while a flagged group may carry a single extra task.
>>=20
>> - calculate_imbalance() does not measure any imbalance for this type;
>>   it moves one task (migrate_task, imbalance =3D 1).
>>=20
>> - Elsewhere in fair.c "imbalance" consistently means the amount of
>>   load to move (env->imbalance, imbalance_pct, calculate_imbalance(),
>>   the lb_imbalance_* schedstats), and imbalanced_active_balance() =
uses
>>   "imbalanced" for repeated balance failures, unrelated to this flag.
>>=20
>> Rename it to group_pinned_task, which describes the condition that
>> raises it and follows the adjective_noun pattern of =
group_misfit_task.
>> The enum is local to fair.c, so no tracepoint, schedstat or other
>> user-visible interface is affected.
>>=20
>> No functional change.
>>=20
>> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
>> ---
>> kernel/sched/fair.c | 30 +++++++++++++++---------------
>> 1 file changed, 15 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index f9ddcecfd19d..aa63950976aa 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -10363,7 +10363,7 @@ enum group_type {
>> * The tasks' affinity constraints previously prevented the scheduler
>> * from balancing the load across the system.
>> */
>> - group_imbalanced,
>> + group_pinned_task,
>=20
> I believe we are trying to fix imbalance due to pinned tasks.
> Perhaps group_pinned_imbalance is more descriptive.
>=20
> Tim

Agreed. I'll use group_pinned_imb in v2, which keeps the "pinned"
qualifier and matches the short "imb" naming. I'll also rename
sgc->imbalance to sgc->pinned_imb and its reader to sg_pinned_imb() in
patch 3 to match.

Thanks,
Jemmy

