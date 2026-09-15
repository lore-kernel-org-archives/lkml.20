Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDCA367B9B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511959; cv=pass; b=SfAHp3nJZi308HX+Qjd+Il0n2TcWJHfSv9w38MkmxJkjvpPAdhMNU5BCC2Kn7DHTj8OtJUZZsXtVgX5/5OfypAdvKoLpTMdGJqDCGaDhlcYTR8AxIdsLjEaUWr7iWG9/7DjGoFCDtTg1ihmXdOc0hEu3i6rfbjwqKp0H1Ipf0v8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511959; c=relaxed/simple;
	bh=vJsCws3FamyI5nwIu6NR9CwJlE0an5auOcy5PUi3Br4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmmQJdSa08tz31b568JPwWhVl5HT6ucO7XZIKmQoGQ1Jy1OSUsThdhd3f77Vm0nS4zRN508+7FaCvaoP4nxc3hqJtRsabkj6+jbglsBUEL4B7pXs8zU/bLbWNjphbArvQQDl8hLci+5ojVACvj93rhPayAcKzCAbLGt4i1KAE7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rxyFWca/; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rxyFWca/"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so47991cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789511955; cv=none;
        d=google.com; s=arc-20260327;
        b=sBfor/MdIO2bXtSWFCsHrP4lFaPi7XOgnN3oRDGNKeWYDzPP3Qm87lrUZVXTvvGmCA
         +1WjegbGWp31HzLtA/SXqRAu+7rLhasU76I22NOHWRsD7tfECNN3DcUy1tC/KmoMnVhM
         W1tanhLrCX6Fcr7oQhlXQ8dAmVSAKBoMt6BzzYjuNOAuPon8DCIlE5zJ7+z8nxJ3+9IL
         8Ev6Go2JdV/gIty8Egyl2cE3aFiuyHvVUJBAWHeYcOZ3bhqqIfiqcJ/cpSi4EEuLgggs
         J2ZnSMLGA4VFqFLVU7SoG2kND0pff0I360L30ZavU6rEamW7R4mSnPDuO5iV62MHnwzQ
         YYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJsCws3FamyI5nwIu6NR9CwJlE0an5auOcy5PUi3Br4=;
        fh=u1QQJGGc199h4G1rWkcYmjJc6O+Rsua41SIkaeefxMw=;
        b=Xkq98Ebn0fhxAcZ9JaG1Ksz7AasfvMnpnZp9xbM12R1SIPCdGW5qAdQRbMkrBPCFOv
         1w2DjhjoT1gtlN6Z7X6/Y4/GNcCjctTN2xLpBGQKY1s/Chtx10jN01Y8cnWYqpQiAX32
         8b0sphJUmZdWg+FE320mXg93dmke7f7LwpgKtzsMsCBc2mKMDBGrxqoOm93w3veh4hQU
         JYtNBzb8g9Mq2sY11V4NXYxFPJCLgHDH6e+JOxjLWF/FNzsmTTcjDQoC8FGJKesBKIQk
         HttpbQsSS1S+y9cONpwqxho30dJEL0iiBkRHnPXcwUdv5QHcrorK72XZQzt1WOMJwaiB
         l+eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789511955; x=1790116755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJsCws3FamyI5nwIu6NR9CwJlE0an5auOcy5PUi3Br4=;
        b=rxyFWca/nEoQjYXMPfAHyf9F1FN3x7rz6dtzEER14eDiw4UDqHIY7juAsfbLvmbPmJ
         TkDG0O2fJ4T/8b/PM7X2oHanauKcsNZFL+/1C+IBusrmvZP5qtYyTRey1vhqFdIyIzGV
         4dwM3FCfXXVPiqyqDkz92vVO5b169ErAe+Gf8uKsj7yOvBDnCxCqYnVbW+MzxwzddyhT
         tH9xI6GNS3A/qwOPzIVt3mWJ/xizDXVAPsbfgAWkEBOjnu90Z0L5ShniO9r/F8wpLbxS
         E2edOgTa27PKYtmnnDYuMkkuSzbwMlqwza1WkEL4Io3+palVNcRZgYe+WUkx9JeikXu/
         wGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511955; x=1790116755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJsCws3FamyI5nwIu6NR9CwJlE0an5auOcy5PUi3Br4=;
        b=m5pDGSanCW1nBsiwHNVJBWyyAJ3kzDPajHC/qzVi216NkqGkAWD3Sto45j1n0v82xr
         Kc+pRdPRlovOu9rToJp5TmL7599EYBqKnrzYpSN4iln3WRMCJlFrWTkwYjp5TlifZ+4q
         CqnC6zW2TGRs3J4lKtAUT8r+7czOz+KkYAbtw4YQ0jCSeojU+B9ZWSMVQLk/TrY8ArG9
         Z8kx7gS0RYYf2HEmRbgZicoKi8LnyHUbmxtrT9X/fMQoJ3XQutQ0IYI/z4FVgbXcTT1p
         r/RzgGElGbX8ShyFWH/PuBgriQadlSP7PZsXDgamXeG/TcO8ckFr+F55SP7f8RKJXtth
         cqFg==
X-Forwarded-Encrypted: i=1; AKwUvBxAs9LCiksKbaNj0YIp40f+LLZRsSXGKUV5gJ3qkWIh/KMRWOq8tjf10mq0ozZQKpUBl4JGGjYt8GgjUB4=@vger.kernel.org
X-Gm-Message-State: AFuF++mQiW+GbsR1BjZ59yKDYnQRdPhqrsVx5p8h5xygIF/HvaCfF/De
	KfxVf3taWRyYFf2AdncNJtsiiXeN6o/U49NjK274+H9HrWjF5ZwvUOyTGCIbHwaMQ8blkH2vnjq
	Ivu6fyU/zamb4BKED1efDBHadQEaliPZfbJgCR+nz
X-Gm-Gg: AYBFou3QdEL9DAMsO5HppkxnTlTsmysHoSllDhh/UfLuCwix5S5TJ6PP0TOtR4A2BoP
	6+20yYv0Tz3/chmLh+0dmFzBudfDivJX9yZwzaeFOMaAPIScw6msnBo6D3MYI3nx3Au9YKNd5/k
	ouK3JKHXRH0V/wWNjgEM8PwFgzt0zQQTG4GwGJrOorZOy8JpAUmNcjSv+HxJb6tnhBUiLRuIizr
	ajtca8CVHRe7mUgwuhoUACii8ucc3lkYiJamig8fjiMLPH9YjEV49CMklwEobUu6RXPluaiSGQM
	LK8DWATRRtKUzusPr4WvP5u41PwAWYYXiS9vw/a/exlCm+kAHO/3cZv0D67apr4ed9DhH+rL6VJ
	qxoJ5x3mWIWwoFnNkI5Nd
X-Received: by 2002:a05:622a:4d8c:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-5327ed8004emr2058291cf.4.1789511954807; Tue, 15 Sep 2026
 15:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810133540.1947118-1-puranjay@kernel.org> <4f755a7f-0a55-4292-892a-28346ed235a4@huawei.com>
In-Reply-To: <4f755a7f-0a55-4292-892a-28346ed235a4@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 15:39:03 -0700
X-Gm-Features: AcwNN1VJtEici--U7gAI-B9LpTV32UhMFNQSbZNGUEhTbibENqFgMN18MX5xm4g
Message-ID: <CAP-5=fUepMzyctDcUqYNJMG+xBOK0bdUF_cXPtQ43AxfFVL+Zw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] perf/core: sched_task() dispatch and branch entry fixes
To: wuyifan <wuyifan50@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
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

On Thu, Sep 3, 2026 at 7:45=E2=80=AFPM wuyifan <wuyifan50@huawei.com> wrote=
:
>
> Hi Puranjay,
>
> On 8/10/2026 9:35 PM, Puranjay Mohan wrote:
> > These three fixes were found while adding BRBE support for
> > bpf_get_branch_snapshot() on arm64 and were carried in that series unti=
l
> > v6 [1]. They do not depend on it, so they go on their own; the version
> > number continues from that series to avoid two numbering schemes for th=
e
> > same patches.
> perf record -C <cpu> -b [<command>] triggers a NULL pointer dereference
> in armv8pmu_sched_task().
>
> Commit fa9d27773873 ("perf: arm_pmu: Kill last use of per-CPU cpu_armpmu
> pointer") changed armv8pmu_sched_task() from reading the per-CPU
> cpu_armpmu variable to dereferencing pmu_ctx->pmu via
> to_arm_pmu(pmu_ctx->pmu). Meanwhile, commit bd2756811766 ("perf:
> Rewrite core context handling") made __perf_pmu_sched_task() pass
> cpc->task_epc to pmu->sched_task(). cpc->task_epc is only non-NULL
> while a task context is scheduled in; CPU-bound events do not schedule a
> task context, so cpc->task_epc stays NULL. The NULL argument is dereferen=
ced
> and crashes.
>
> With the patches applied, perf record -C <cpu> -b no longer crashes,
> and system-wide perf record -b -e <event> -a alongside a task-bound event
> on a different CPU runs without any WARN_ON.
>
> Tested-by: Yifan Wu <wuyifan50@huawei.com>

Hi,

Is there anything that needs doing to land this series? Avoiding a
perf crash seems worthwhile. I believe Peter and Ingo are best placed
to review the changes to kernel/events/core.c.

Thanks,
Ian
