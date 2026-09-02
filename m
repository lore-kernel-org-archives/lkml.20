Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43312369D7C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336456; cv=pass; b=LUxYeQoCWl1pnL0oZFuBt2rFMqFIbu4rUecH5yqCK8xdyn95tKawVvdh3L5yJQ+qcDC/knbSYfVB06c1iY4jvGsX6CEDNXFqd3FVgf1B+9iwL5KFHHtc7rCLPK/ek9LfHlq9yAMwSHrEJFK0qWYNMjNTbpfqG3dsVVPIoOq7fTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336456; c=relaxed/simple;
	bh=oC/8q0+KfLxmwtogP5EgD4eiXYFi6/BEjEeEofZZqCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNpMN81rMu6Vp0o80nl0MUz2r+M8zMzTQwPa0H0bDNIkRlmuEdBfxvJqV43MFOoRRcHVYUXoxEjLqN/xAczIzUr776mb5yXT7wl2B/mYWK+8UIb92v6doOfuuZZrP2IzX2jU5Y4nEn2qAiUvvBHGKntnceyhZVCM+ridOwQm3Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RQ5g6kSz; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RQ5g6kSz"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-782df51b4c1so581010137.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788336453; cv=none;
        d=google.com; s=arc-20260327;
        b=g+e4ev/eleZeZvekpZgSpGRCFNMM2MNgrHu8nPyAnbUFGYuwJt1TrPg3yZDPvvtbIV
         TtnCnLmX8dCYsQwYYkpKzFUOmL4j9lFw7nzlgbM9rvBdvf4VjZuXNZS0lepCKqs5YF5i
         oZnJx2QaQJEhqikrXz59BpVjrC5FjOp6fcujdeyN9OnyDO5PKmEZhaAp0OjU0rWiu9Q4
         7xu+r0WVk/Yi5IJWgAG40Sid66c65prxFgFWcGH68sCfgxrfG2nnXesyIzHFL+g8woCW
         WRMweFRwhcztAw+TPheOF6vL2xoeT7mW5Lopv7D9vj8fpz+AvhLXFHSUhrz4ZR9J5mNu
         mHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oC/8q0+KfLxmwtogP5EgD4eiXYFi6/BEjEeEofZZqCU=;
        fh=Vx9IHQHSOptQPWOota7+zdztRLg2t9lz7Vdxxa0fgr8=;
        b=npT7EKWJ9MqoqF/TtCt1bU8OEOm02tLD6nwMRV81PDBpQoWxmh0DNVQyY5pIcyxrjh
         Du5+8l9thMe7vhLFtSTWy/9oXYagNcgnRreH+xnd0v7afBbvJuPJqr8FJLJL9m+ncZGX
         geX1DUoc5x/xNuOvNEVYI2Sc4wwgfOwCDyQckMfyaD0rpwQoYLg8XNCf2WBuL1cpqcPn
         fQHv8YDbLULtDrTQoDp1ErtIR/QFB1S5+nYZFK9eE2l80OMCSK7MAq5VAXsgAChukVDH
         OXtu6Vc5oF1mpiZJZL9Szs2jQB+uLukHpB1FXSP4eS3bA4NxXAIFnCgj1SUFquk2+/gw
         fHCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788336453; x=1788941253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oC/8q0+KfLxmwtogP5EgD4eiXYFi6/BEjEeEofZZqCU=;
        b=RQ5g6kSze4HRbCW2OKD84OPtT2j337VDled72s5K2NWI1MrXWYpqYcZrkQqX8P7mSF
         zOCgR2avGCXoPtBrn0VCHRt6PxYoX+FBnFpgCHrc3BLP5zdVJUUTnO3h8hPK/EVNu6bm
         s0V5Y3SuHXJ62B3Rxl4ZAx7kfeSETZxFbyKKc7XVHJ0I98SggelgUn3tZOMARmrvhKnO
         Q/xTQWoia5CvGghk7UDjsn+gz0Vs8JnWJVpgy+GEm4h597qbVHAs0huA/7DxkMfcQiTO
         W3+KoRMGJeBPcnB7P3JSGdZDWnMmzBWYnKmRujPvOU8vbISkhSqPjcVyB1JDK6v0FNBJ
         GjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336453; x=1788941253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oC/8q0+KfLxmwtogP5EgD4eiXYFi6/BEjEeEofZZqCU=;
        b=Gl8qpl1BBOvhN7tu4A7vo1HGdtIk8InTZ541vFs/5YGfXpcqfR/ufxtoxAl6dE8bdD
         THQFLRqHj9ipA5V1qmzNGgKk3EDq+LA35N6Uqh0UH9M2MIF3OZsAw+k/pCwRp7Jn/vTD
         rizy7/M/+4JjjQdMQfu3eQxnrUT5kFLU5svEBwLPdaGq0mOIG28mNkoBCdzjecElzOVk
         ELCYDShJfhZJWYzHFjayl9G1jKfZtptOphkTOxju578DzauHdTc8Z2h6ILORZJIbe0X7
         Cw4Z3oTV2Az7D9146cAIk3aLZ/zTnFyKWf9+S8Xg2s9dkaZ9s+OddhRAENRhKtdwah+s
         kQ/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpGJ1Jw9x4/F74pa0+PBQ15/h+7c4kf+cnrPsygDvtSQWq4dpNcmHkjN1gvfeeWwE/i5J1hYEI3U5uihg=@vger.kernel.org
X-Gm-Message-State: AFuF++nWAn2uCZaFcMQOYZfTF9BFViW/QoN3jrsAP1VmUuFEl6QgYoYe
	ttW1Stsy52qDlL/Xv9pawx6+jDCQSKKO8sE11snJcp6h7eYB49kpMRmHa2+NNVpT5vpTSqWbAhY
	1zXOQaUqKlaxOJ/nmFVt2IA5PNhKKlI424XTd7iS6
X-Gm-Gg: AYBFou2hkxvk6SAPaeg3+kggc8Q8yPRbByIykRo492wWqANGcOuuwwJ0M5K0X1zox+i
	nW/TvxN65SmK2clN5duu5VRvuqEtIoxtexSSsvKC3qQi0BRrui8nlU59Uu9MUj8gMoHR9z2aiEh
	vKaUitsSu/D8hGVlPwa1E54VRBJGO5p/Sx4/YaMV4p3OPFPwvfp+pJ+Ioss+DrDLEF+g7RVarMf
	5LVTF09bTbu/vc3p2hDsH8JFxdbrFjz6Ip140oeRTS/R91pZ5ort6+ZHxLkEHiWg+QYLxTcyhyb
	29KKxYC2sJXT+JsNnfdAaqgin0vhz7ldJ394SYIeg6/RlHIlST1tjHEOYA2Ay4KH8AebLIYyP80
	=
X-Received: by 2002:a05:6102:2c03:b0:785:8f76:654d with SMTP id
 ada2fe7eead31-78a1f4c036amr1080373137.13.1788336452487; Wed, 02 Sep 2026
 01:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901152212.1691696-1-michalblk@google.com> <apb7OapVwIDZV3D4@gpd4>
In-Reply-To: <apb7OapVwIDZV3D4@gpd4>
From: =?UTF-8?B?TWljaGHFgiBCxYJhc3pjenlr?= <michalblk@google.com>
Date: Wed, 2 Sep 2026 10:07:20 +0200
X-Gm-Features: AcwNN1Vr6pBJpiqvmKdfqrS6i2-zQNc__YmHDkZwqP2cR0JjcyJ-U-b-wSM9V8I
Message-ID: <CAD=VTGdfHkt6QfEOOYWBkGaP5dM-eTCFtFA6z-ECyqm+UbXB=A@mail.gmail.com>
Subject: Re: [PATCH] sched_ext: Use atomic cpumask_clear_cpu in scx_idle_test_and_clear_cpu()
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Changwoo Min <changwoo@igalia.com>, Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

On Tue, Sep 1, 2026 at 6:20=E2=80=AFPM Andrea Righi <arighi@nvidia.com> wro=
te:
> I think the atomic clear makes sense here, but, as sashiko also pointed o=
ut, it
> does not fully address the race, because idle_smts is also modified by th=
e
> non-atomic cpumask_andnot() below and cpumask_or() in update_builtin_idle=
().
>
> > Fixes: 48849271e661 ("sched_ext: idle: Per-node idle cpumasks")
>
> And the race existed way before this commit, the idle SMT tracking has be=
en
> always documented as racy and self-correcting.
>
> This change may still be a best-effort improvement, but the commit messag=
e
> should describe it in this way. Did you notice any improvements/benefits =
with
> some workloads with this patch applied?

I was investigating an automated static analysis report from Sashiko
which flagged the use of __cpumask_clear_cpu() as a concurrency bug
that could lead to lost updates. I mistakenly assumed this specific
call was an isolated oversight and that the other surrounding cpumask_*
operations were properly atomic.

I hadn't initially realized that cpumask_andnot() and cpumask_or() are
also non-atomic bulk operations. After reading your explanation and
looking closer at the code, it's clear to me now that this non-atomic
handling was intentional to avoid lock overhead on the fast path.

Since my original intent was to fix what I incorrectly thought was a
strict logical bug, and not a profiled optimization, I think it makes
the most sense to just drop this patch. Making just this one operation
atomic while the rest of the mask is manipulated non-atomically would
just be inconsistent and add unnecessary overhead.

Thank you for taking the time to look at this and explain the
context to me.

Best,
Michal
