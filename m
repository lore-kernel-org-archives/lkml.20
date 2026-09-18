Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6E4E73B3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731393; cv=pass; b=IuTZT1vMNKaNLMkffn5GO+PaOfM9RLgbAc2zvWfJn5k5jaCdDOlkzPqBC8QLRk6gv4nph6BR2lz0xw9svXdHZTcdOnbgVuSVCkKE1i8SS/oeXxa5JiYhwhaPBVNHVSaWXfe2rADYohu7hVTVE59njEwLOVeoQ02UZ894SVKgZfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731393; c=relaxed/simple;
	bh=SM+WZSPeuzqNNHXbABDFo7m2xf8ZGs0pqFt1fmpcd8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzURpRmHo9N8/IY1aehin+5N+5b8bLUiZvFGAwCGQMPliKb0nf+5tDXvKO2+vXycpD6Jz8E2BSAZVrZd1rhXhS1I0+r4Pf7eLR2ZvWNrmdhCJQAKiMld4KdyzJdDpqP6qAHkE1/iNoW5HV4YBLSmL2TdQYHnrbCPTkqTKnq2ZhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB0WVjKQ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB0WVjKQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa65080so79956066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789731389; cv=none;
        d=google.com; s=arc-20260327;
        b=ijT/SKQDrwkxk1qasz2PxFHm+8s7bYbn+olTce82yEi3uhCzpNMRsQIaQNLHt79aCs
         bFOj96vnab/ahf/i6Wj9afY03KIB/6cnwvo0hTpZusNOldibGMmjtVtjsVh8pP8GuXwT
         k79op1U7+R1GP5isPMKmeN7JNqkW1ItqEykmBN0u6FoSGqwxEqMXOFEqKYYiGbPYTYeI
         IWgMsClWfGas2MYPuSR1UyFdrRRD85JELsQa9DRXNAeYHgX7svJREIBxCTEc81tmuFyP
         pb1RaWRf1H/j49irnM3m361WbRz1rZh5ZyYjlhzT7cMqvoSHl7ltnLBxvI7KsEJ9KsRH
         GM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        fh=0SHzSg0+u/nzSGTizGu/rg8KQfUQXkMxLoUx6bdz+Mk=;
        b=MwOPgW8d6CCBpoKPHBoYV/ONV70dwGINkVh0zFijZMY+SeowZhw5qIzeGYyMlymHta
         BNa5QEgiQ39r81+7oT7MfsT8ggcHny3+RYvUlObhPGVsSnndltf9vDbFHoPf1ebmcQIM
         qqkOkFCZN6AfVv3IPHzCJDyg+gi1X+9oH248Th50XE3EJlKX/fXMlLjIgW7d+NG4bBxN
         4JFl6sy1TPC24etupDrhmUV+caqeP+wcrDEiInXob+eKslmE6YHCUVUKAT3L+UAszaew
         vhbpmD5OsADQ5T5QJXIizPfTKTSg0w384tErNlFZnbu2vntoQRpiwF+iWm9EwKVhYFHh
         Cyqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731389; x=1790336189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=bB0WVjKQFWGFLevQSZ6+wAuVr10y9ueGPJi48P/WjBtC8HiA56X/7cJR6K9vGM0O1b
         LOn9zSnVnB030apqwbpqkCcB8mZ9LvTeNyV8wzjrAVeJPSwPqR0YbfMFFX7oInCp+PO6
         AUrKAP72yTipK6iFJN6rwwDKibX21Hd5VtDQi6St4RCUM1ANGs5FdA15ckkqr0pWqS1M
         dmYrup7gqfRT9F5Zzs0SSzWEO/OrwvnvxLERcm1vKAiyBn3OnaeDPBAat3WD9kx440C8
         44rBdCLqBzQhueA3Sxz9dP/Ix0BSHZ78Qw6u1mlZL+iOzeg6cyHhJb2ZDhy8cpR45RAX
         2B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731389; x=1790336189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=04ANXqElo/4Jv274sFZdGlBY9+k/sqhiZI+NannvptIweUWJCC8c6TSUSna0MCy92f
         +TomuRevMzfvPeKUzUsCRxUWS7JS78tHXjGVXNNziQQBjENStMYLSiVW3ZdRVZAlfLjV
         2qqKSic0mj5a3n2tORcBGuA3zK/BZaLnaOVso+mUxymEs9tWl3g3oTyEsSJdU/log1z1
         wkWFXKWWGcLxhfqLNlHhMhPMoE2Cz5k0og7vJUSdbkAC/Y7csKWfPjq2B+Yts2JoJbdb
         JyIPWv7n1Wv4lw812pVflVyIAvnSFbRMq6YPV4XxcJrDDc5QDyRJXdgvZ9FRlJS58o8L
         hXJg==
X-Forwarded-Encrypted: i=1; AKwUvBxKhpSHbChfwXKiDoClrx8to2GLSbSMUarzaao7iqZiRM1T67jVJxmXWVXo7T7gVYNvVzBAAtWGdRBnBh0=@vger.kernel.org
X-Gm-Message-State: AFuF++mx87iDTZ3YKCeivZBXJmaRiKmfoe87W5tMn06p6FPt/0PqGP6Z
	USbu5QvuTgfHkZnYtMhvnBGGLoOmw+5nRcwNOKdQqgtPyOIiy4tjv6HjKeF9yyd6vq6gHUK59GP
	tq3F4FNP2v5LJRQ5Y0RRfsHAd0pVnX6E=
X-Gm-Gg: AYBFou0FysoEoIi/b9Zk/G0cH9nijnQUpKbOOO6t80WIP5IRBVb+7HsbTVElsHcldNo
	RzCNIXnhI3qStcgLuyUARN5z50yQ1ekGsxj2tRjjTGCLDy8NTAUe58Tw5yfSVnVmSJL+a+poLo7
	FVbEHz8/K4sOK50YSePDWlTHXJQpmJn04fbd1eWPOuNVUcMp2cUtByHGS/Xws3dUwzdpzRs2Y2+
	apWusr0lrxlS/5TgIw7VIRZQt5B1gK9qRW5D7GT8VPz9e3FY9esqya/l7Rqau0dYDTiS1W7eGOd
	IODjzQtDMH9XoLj3Vraw7YN6Yi6UT+q90qzvDuRmm8HnLnVBqd8ocuKcX4dcMJx6ADtp67h867S
	3MwL+a3XLVRuNl9tIvhwHKgT82MeERkBnuo7kdUBXqA==
X-Received: by 2002:a17:907:948f:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c2a1582698fmr217595066b.43.1789731389390; Fri, 18 Sep 2026
 04:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 13:36:17 +0200
X-Gm-Features: AcwNN1W0uIsrBudlRZeSpl5_CSJhjtWRK4S-OK-90sOk1QFHdqx3jezfZnvgjR0
Message-ID: <CA+=Fv5To=fUfD+9OtAcNJcaquBy+xv6oNUFES6sVwpOKzH8qgw@mail.gmail.com>
Subject: Re: [PATCH v7 11/13] alpha: Define entry point for
 set_mempolicy_home_node syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:47=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.55.0
>
>

Looks good to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>
