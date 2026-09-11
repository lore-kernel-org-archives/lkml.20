Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E64037C0E2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140492; cv=none; b=TLoNd3+4y9hluu7EL5xIqCBEPtlAUoL+5Nn1gVDPdmnsgNnWD9+klGbQrrY7JQL0Y6+oU3XuWtF8favW+E3DKfDNwo0WZhqOBa92gKfudeu222ktd58ehlz5NeKupA2+IWp90rj2ZD/Fd/rw9pSqhCIhBYu3ETNM2HL86a6iKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140492; c=relaxed/simple;
	bh=FhC1BGc+izFGRSVhsr6TbpR9BgsKGiF2SuSQ1pALooY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=McV6eEr1IZxA0vV/ZM+4NZUxm8oBWSZ/7jYG521mf8ag0BuASNvNJZGKj+ID3N+9rFsPeI3YjJvnirA5rSFp3fIOM0j6dbOPquJPzLeJmUxa88usYHpGGln5P9Ffjln8Y0LUQRy0Ym2AbIL8mLRVXLVB6xP0hgoBgJG1UFQ5CQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STs60svc; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STs60svc"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-87005a0e052so11874227b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789140490; x=1789745290; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wQzcuFPYkAadTcMKWgFjkOZlpHbtRvNH6B7KXfZ46WU=;
        b=STs60svcO8O0FkFgCHDQ0+09DLq/6qhMsYJW/OBFWCKrPTBPT1g3Zao8C/zE4RGDVU
         IRlQT3lO+NENP9ld9LkI/yuOZVHI8q8UPBMPe86+amvYkeEfDyZqnxsmBIFLsKLscS4a
         KSGgKwi3CLnWZVZzdYx3uwjt8cyTCGJUa58PrC2FVo+pQROrXs681COn2sCrA3tX0XXQ
         IVYnOXbtit7+v5dJFRieZw6idMsqT3DNAMF/U11u2iQlLCzR2YwrVz0VgfvamAWF4PpU
         Jh9oekGdw5yvicESh5bYbxAlmmcGs8Oj657S8zsa0DT4G4fB4smLM0zRFVzZpkbMMb4v
         XAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140490; x=1789745290;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQzcuFPYkAadTcMKWgFjkOZlpHbtRvNH6B7KXfZ46WU=;
        b=V/s2I9EA1t16xYXUEBAM1AncPXngYJLyH/2r1wdjYGiob4jwXv4BqZ3wG9NURA6Otr
         ZSK9worZqmwjaKOG9iEsK72La7aC32TMnsIz9S/itQ00YUosYmnBIUhLa9+IuBU+GMjY
         P6zv+BiyQfncO3KVI+8vUvD8bCN+thvifV5PTPMovDcxEhYd4WSudWKIcl1csjV7VCEe
         zFIRLsDxWlSFX7WDKzAWlLCwYxSbDTD722jZ1XQvcXMJip7robiUB6pKKkDvJ0tKhZqE
         /hVP9qK8XwzF0lJp3aMIKXN6zWsgLy+U2YfCktec0ayUN9+dAkjC4BFOv7sCCqpGI34N
         k3IA==
X-Forwarded-Encrypted: i=1; AKwUvBw4qA0yT0m+WqDBMJ6i08pWldg3OCIPFOwUF1ebj57/ews08t2GNLpQvCIVZSHNCKMxJR96qh1m75qqV80=@vger.kernel.org
X-Gm-Message-State: AFuF++mSQJGnQp0dP+0hzXjVs4AmQd+Tv6YUXnteMd4u0czwZnBEp599
	Dvp2sB2jIAkdg0gFioz072nyYw+qfOg+7bjieA0rhHk5LwV0CV234NBn
X-Gm-Gg: AYBFou3Xly2gqt35QdWy0Ow9DmCcQ63njhsOQu8ZuPx1BFegIndW2FisVB+qVYG57Rk
	nw3gZMPKcFjQrM7bq2nuZrcQO5ZKtNJB53ZxFaYymVVh4FVSNP3MvCemSqIyEwDQTObdmg3bZTo
	U+rr/XhSBj84RoyoN5BcPhyVnmhDdsL0s0FUpKMApKqPRKY97eRl3gtX0jWwAG3lNsJxgmECIhG
	Fy4hdZ/niuIdjgxKptYG0tyyfH1CQO33hIbPueEAQs3b6HUnQJ22K5FwuSxP5glcjJYdOs48cgv
	9u9qVop9AVQrS1galBJM2US5MIMgaKqd+QysEsp7CQwy8sza9iYYKFKIZYm4pUHMyAqkJ4d0HKH
	Hrz5EuiqdQlaKDGexDItDXEL2Ff9Nz1D2KNdJBEChd5zJnEqnhJmWPV4wvZo7SV4aDPMksk/1QO
	5nCSPwlA4VXlpCg9cm5YNfgvz1TqAIz7BEShOT9ZlfK2VlSKO4xk6i9Vmv6f6ofTq6vYZspgyeQ
	vcZorJDWKP2UzRqvYCTB+zcxSCKo5/4a7YzYEzdZU5zbobZ4R6Fw8Zep0Jckc/SZQ==
X-Received: by 2002:a05:690c:660a:b0:873:5c6b:a2f7 with SMTP id 00721157ae682-884b23029e1mr17446467b3.37.1789140488900;
        Fri, 11 Sep 2026 08:28:08 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884876e5780sm11951597b3.27.2026.09.11.08.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 08:28:07 -0700
Message-Id: <DLCLDD3KN3WJ.2PUS28BYG2QVK@gmail.com>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <linux-kernel@vger.kernel.org>,
 "Aohan Mei" <henrymei@tencent.com>, "TencentOS Corvus AI"
 <corvus@tencent.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Hash lock addresses in rqspinlock violation
 reports
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Aohan Mei" <ljp1205831794@gmail.com>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260901114755.1165703-1-ljp1205831794@gmail.com>
In-Reply-To: <20260901114755.1165703-1-ljp1205831794@gmail.com>

On Tue Sep 1, 2026 at 4:47 AM PDT, Aohan Mei wrote:
> From: Aohan Mei <henrymei@tencent.com>
>
> bpf_prog_report_rqspinlock_violation() prints the attempted lock and
> every held lock with %px, which expands to the raw pointer value.
> The report lands in the program's BPF_STDERR stream, and that stream
> is readable through BPF_PROG_STREAM_READ_BY_FD with no privilege
> check on the read side: prog_stream_read() only validates the fd
> with bpf_prog_get().
>
> Any user with read access to the program fd (a shared fd, a BPF
> token delegation, or an unprivileged child) can therefore read back
> the raw kernel addresses of the rqspinlock objects, which are
> dynamic allocations whose placement depends on KASLR and the slab
> layout.  The verifier-facing log path gates pointer printing on
> allow_ptr_leaks; the stream path has no equivalent gate.
>
> Print the ptr_to_hashval() hash of each address instead, so the
> report still allows correlating the attempted lock with the held
> locks within a boot, without exposing the raw addresses.  Fall back
> to printing 0 if hashing fails.
>
> Fixes: ecec5b5743bf ("bpf: Report rqspinlock deadlocks/timeout to BPF std=
err")
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Cc: stable@vger.kernel.org
> Assisted-by: CodeBuddy:Kimi-K3
> Signed-off-by: Aohan Mei <henrymei@tencent.com>
> ---
>  kernel/bpf/rqspinlock.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 111ec80ea958..5721dc1a9577 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c
> @@ -16,6 +16,7 @@
>  #include <linux/smp.h>
>  #include <linux/bug.h>
>  #include <linux/bpf.h>
> +#include <linux/string.h>
>  #include <linux/err.h>
>  #include <linux/cpumask.h>
>  #include <linux/percpu.h>
> @@ -673,6 +674,7 @@ __bpf_kfunc_start_defs();
>  static void bpf_prog_report_rqspinlock_violation(const char *str, void *=
lock, bool irqsave)
>  {
>  	struct rqspinlock_held *rqh =3D this_cpu_ptr(&rqspinlock_held_locks);
> +	unsigned long hashval;
>  	struct bpf_stream_stage ss;
>  	struct bpf_prog *prog;
> =20
> @@ -681,10 +683,15 @@ static void bpf_prog_report_rqspinlock_violation(co=
nst char *str, void *lock, bo
>  		return;
>  	bpf_stream_stage(ss, prog, BPF_STDERR, ({
>  		bpf_stream_printk(ss, "ERROR: %s for bpf_res_spin_lock%s\n", str, irqs=
ave ? "_irqsave" : "");
> -		bpf_stream_printk(ss, "Attempted lock   =3D 0x%px\n", lock);
> +		if (ptr_to_hashval(lock, &hashval))
> +			hashval =3D 0;
> +		bpf_stream_printk(ss, "Attempted lock   =3D 0x%08lx\n", hashval);

No. This is not necessary.

pw-bot: cr
