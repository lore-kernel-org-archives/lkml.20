Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B409C4A64CA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109268; cv=pass; b=qJusWSZ15ABvEtBbVQSKLLhgFXkyw3V0m88HXQtrPe4kMmEvjimgsGrXsj9uI4/L7QrCaOmwADOtqw9BYhPRiL4CrEcQZbvsk0OVAA7iQSGclYve5n2xAhfk5a53gjalXdDFbf8j5tMvX0AaqagODAI86cRMYtJlrVMJUKWmYEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109268; c=relaxed/simple;
	bh=XxcnKx8aTyQRysco9yob8teG0Hm7pIWhDCbbc7ogXSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tudPLO+SGDXqLAJyWPudHcHdjRWriYM8+zLceCIa5j/hwNCLFfjmM6q0wBVe78c26idBOrmWodnxEk+Yc+FECnT4OfrBHR3/mAYRjpbuamo0EIb0Cs22HUwoxXC7U8+P8/iiisMSPcYmRm0XX3dOW0YmPz9xPPFXDww80cZtQxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2B9VLDB; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2B9VLDB"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso197952a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109247; cv=none;
        d=google.com; s=arc-20260327;
        b=A59BXLu/Zd8kDPQJP1Yer/1lh4dLvCr2WU5gK4hzgwUPwQ8cv8WSi9Ut8L80Rio5vw
         16ncRTNmAvaE5ZwjtPFoj1DjGrtLaOqX2T+0mnNiu0rvE3nG+18RH2UQw/E4DDpaL+y7
         Zn+KE1wU/Bypp3n4J3GRxRmahKolu93RXa4MMYNj5YrHHDm94uUwf0cqOHGN6TcUMbjM
         4nbMs1gCCOgWpkL2IIaTKf/353ng0jWjuGnecfQHdbCoAHW5imA2Q9ylmaDoj7mHfv3a
         rE93S4LcK5C8jLmKXHKIEW2+M1sER4nbKQJk4Libb2v41w8gMT9Oep9bcrxUzH1kwqai
         mUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XxcnKx8aTyQRysco9yob8teG0Hm7pIWhDCbbc7ogXSM=;
        fh=YFTSEUVcHpUswPvjHBxzwNdFpLxd7fh6epaZTzXkH5k=;
        b=l20eZPhJ+ve9dt1tuEqRD1ks4tcUcAy7N5EDdsyC1SlAkYanjIopyhZ3NchuW7cs7U
         aaQWTmqUNBDoJ4by2uM7rc80cAqe5iXmPNlJ3YejPLEvq/4E2QLoHuf8bFGI28N58huR
         JtJ35egKDWQKgxjPtVut6hg8+cJihUSlK44gZcR/cnIFZfXnnhE9uEnYTfNWhk8FumMX
         1BB3HoET/GV/4rHkqNX2Hej44uWGd3+LWN0AeBguY4iRzFFfK2yLW5wqc3oMoj83iFt4
         XtFoJuk+qbYX909TiAuzesFRjh0A9QUv6fRt/VOzFwA/dvDJZP1Mfujv3GOSJtvLC1ji
         TaQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109247; x=1790714047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxcnKx8aTyQRysco9yob8teG0Hm7pIWhDCbbc7ogXSM=;
        b=b2B9VLDBhB9/kDZFcqYet14QEct3vAWrNBGYUGDVra9qfDJ9RqFq6mtqry9ZHwl/yR
         SWRRsgblCDH+n+EcE9SK80q1tUCx0cfW/BDaYQoANVjqKo6uetl5lDKCkYHsQ/H6Xetg
         CisWWuJkr62mKIQimU1j3lw0VNN42wGD7LW/RqHRjM37UU/czUL6RSgp1y+uuH6NXyG2
         tD/MnnbhlfrBYTCg5K7ea85lJKjH/yKCBHZw7DSHqNDKd3fi52tB4jiBCziSFheiyznR
         tXp1CLnBK6RrdsA4muGgVktTFvSQGjMB9tlpkZ/G9/Z5HGuUtDmM0l/n0if4r8y1f5eO
         /kiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109247; x=1790714047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxcnKx8aTyQRysco9yob8teG0Hm7pIWhDCbbc7ogXSM=;
        b=f50PFyBGpdtcbmDzinLg3NhipWSpTaciyQNFHOe1RZ/SR+RLrDKE4b8Aqs864066+N
         eE5yI8rAqMn23V0b1wtqXVVwaC1FsqEqIJscIz18Vz0mc6ZWUgfCO01frlSX38HMpspw
         SSeS8BUMqgexXF/OTvnPEJWHAQPV3O3V3TdB2ieUopl5wdHanOlpgk70SuxTeP6YVi3M
         EFHxTaHJHbl0UMb7QyTBN9K7sSPQXqGYKHQGzO2r3HleSiiPMtkiPHgTW0wLKPz6cjap
         aD4L01x7zMh01ykbhDFkJIX41TRWnnoAO2WryicGOCeRen7yarfMZy72k3gxd7ugDZ4s
         BWcg==
X-Forwarded-Encrypted: i=1; AKwUvBweWyxJXvP3OSR33dZBlBDlHG3k/yhFN2+90M46yBgdZ68L475PxO7AQ4cuxKIGH6lpJWeVE1pnrUwvnH0=@vger.kernel.org
X-Gm-Message-State: AFuF++m30fcv9Yy3cqKlXFTZLkV/4FJ7D1qThs9+4bwF4rsT/FDdT7CX
	NaiAaP1FIpEiU66alLMz8F2uX2blowAMZbjkT7gU+tKJBvO8C7P1A13wlycp4IRUaH5D9b5irWK
	80MN3cTvvNDCq0Mor4E2xouyLEJoC+dY=
X-Gm-Gg: AYBFou29nhDb75KZVciub39ISu/PF11Yl8zpEUuT20JKYXdGhjU6LhyfSimWWjBSKHg
	1EhTXJDkJSsDtVYw1A0aXdPK+h5E7BBn/X4lBi5gvlfzKkS79bJfUk5479DxEpcyHUg+ke2UaQZ
	lWoI9P3KMBaBVJyRvPbfon1WuWQ4bsSEq+lgRA5Myk69EXaeZUkhwpoI7giKt0o/roc0lChksaH
	rRItJEz8TFQ8LaDbsLDvmq2CUoN9RiyzF8vz4E3OZGFg36uAzKKhX1uEgAClP1I5ORjXMEkCLma
	couHV+drtflt8FP1DcpsOWfBkecloIwcXzQlfFduHmkrOF+x/CupKuSRL5jyOEFSCfek03SVmea
	Lb99dyR+jvE/LsPL83FV4gcsk/ykhfkD95f8M5RgHNTrn7w9gvy0+2QXvFIylgBM=
X-Received: by 2002:a17:90b:4a45:b0:39e:2530:2102 with SMTP id
 98e67ed59e1d1-3a07e56552cmr499070a91.11.1790109247222; Tue, 22 Sep 2026
 13:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810133540.1947118-1-puranjay@kernel.org> <4f755a7f-0a55-4292-892a-28346ed235a4@huawei.com>
 <CAP-5=fUepMzyctDcUqYNJMG+xBOK0bdUF_cXPtQ43AxfFVL+Zw@mail.gmail.com>
In-Reply-To: <CAP-5=fUepMzyctDcUqYNJMG+xBOK0bdUF_cXPtQ43AxfFVL+Zw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 22 Sep 2026 13:33:52 -0700
X-Gm-Features: AcwNN1WthkF5BlZ1QMNrqoVSwR9HYVD5IHCsPcWIws_60KwDdxRC38bx-LOITwg
Message-ID: <CAEf4BzZZOqFvSfjp7YMAvEabQSrziv7j26P_SRwMczKf56WZ4A@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] perf/core: sched_task() dispatch and branch entry fixes
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: wuyifan <wuyifan50@huawei.com>, Ian Rogers <irogers@google.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Usama Arif <usama.arif@linux.dev>, Will Deacon <will@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:47=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Thu, Sep 3, 2026 at 7:45=E2=80=AFPM wuyifan <wuyifan50@huawei.com> wro=
te:
> >
> > Hi Puranjay,
> >
> > On 8/10/2026 9:35 PM, Puranjay Mohan wrote:
> > > These three fixes were found while adding BRBE support for
> > > bpf_get_branch_snapshot() on arm64 and were carried in that series un=
til
> > > v6 [1]. They do not depend on it, so they go on their own; the versio=
n
> > > number continues from that series to avoid two numbering schemes for =
the
> > > same patches.
> > perf record -C <cpu> -b [<command>] triggers a NULL pointer dereference
> > in armv8pmu_sched_task().
> >
> > Commit fa9d27773873 ("perf: arm_pmu: Kill last use of per-CPU cpu_armpm=
u
> > pointer") changed armv8pmu_sched_task() from reading the per-CPU
> > cpu_armpmu variable to dereferencing pmu_ctx->pmu via
> > to_arm_pmu(pmu_ctx->pmu). Meanwhile, commit bd2756811766 ("perf:
> > Rewrite core context handling") made __perf_pmu_sched_task() pass
> > cpc->task_epc to pmu->sched_task(). cpc->task_epc is only non-NULL
> > while a task context is scheduled in; CPU-bound events do not schedule =
a
> > task context, so cpc->task_epc stays NULL. The NULL argument is derefer=
enced
> > and crashes.
> >
> > With the patches applied, perf record -C <cpu> -b no longer crashes,
> > and system-wide perf record -b -e <event> -a alongside a task-bound eve=
nt
> > on a different CPU runs without any WARN_ON.
> >
> > Tested-by: Yifan Wu <wuyifan50@huawei.com>
>
> Hi,
>
> Is there anything that needs doing to land this series? Avoiding a
> perf crash seems worthwhile. I believe Peter and Ingo are best placed
> to review the changes to kernel/events/core.c.
>

another ping... seems like worthwhile problems to fix

> Thanks,
> Ian
>
