Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B742BEAA
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465855; cv=none; b=b7UYDe7Pkt/a0moM1PWOgW6xl9vzdzH7E2unJDWDwHN90hrC51eSV/hshdkaxiu/r/scPRLTSbwacFiV91BoAffS5rVkUy+cpPSzFNYZaUHSftetg+6k066kNQm0Tk77oGr7Tc+6QpCP93pJ4ejAoFZDgW3Jz2XfQ6P1Dc8+JVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465855; c=relaxed/simple;
	bh=o1QtDcU6N31kBFaXegDxVYZLQ/unsQ54uSGAZPzgmIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew9d0EVjyS2Ixxxf0cqIqXTHNzFfrtRaYQeLEo7DANQTf6DjmiY93d82MobHimvq3SB9WH/ncaDbvllywPWMtQCiqrfS1LNcs7aexFiOSkZROo6nh9lkEMToFMYJvngCLFXknVvJy7xYlc1IGJHE3g8w6CFp8UB+HPxHBpadw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=tEsKkafx; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="tEsKkafx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cvCf7CKajWBrqxAWgYlUQnFOqNCEESdBn+7VWlxKpSE=; b=tEsKkafx3IJjtRUwib7d7NNAVA
	AVG/XMxpQ9Hc8EpYd2OXMq+mpgSWS5Fl7gt0eRGzg4Ih0gSIYg83fkszJHZMlBAlLImJJt2g5q7Yd
	EDBFGcFQ59BJqcpO7HajUf4L4ZvWL3J8XG2ZfDRJqxKWqxUbs1HYfmlq8mBDhobXExWz51n8ya20O
	PNUeH46onJ0asBkkTj5GxTMAfp4bu9CPibTT+gEuB26btExX81+tDnLDkfmAjpcL68T2kCrNHrR92
	GJ7fTSos3pEnvNDd+9VT8fNrLVI0hFu69Y8E/UQ8NHkXja2CaQxpm13RuIi5LHuddQchRUA7vc+1i
	i0q/wn0w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x6Po8-004J24-0A;
	Tue, 15 Sep 2026 09:50:32 +0000
Date: Tue, 15 Sep 2026 02:50:27 -0700
From: Breno Leitao <leitao@debian.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64/sve: Don't zero the SVE state buffer when the SVE
 state is live
Message-ID: <aqkUU-kSTOz8NntH@gmail.com>
References: <20260914-b4-arm64-sve-acc-memset-v1-1-67866e442393@debian.org>
 <aqkEPCrWXxaU-mNs@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqkEPCrWXxaU-mNs@J2N7QTR9R3>
X-Debian-User: leitao

Hello Mark,

On Tue, Sep 15, 2026 at 09:39:24AM +0100, Mark Rutland wrote:
> Hi Breno,
> 
> I think the change looks reasonable, but the commit message and comments
> aren't quite right. More on that below.

Thank you very much for your review. I know this is not a trivial one
(at least from my PoV), I am glad you quickly reviewed it.

I've also dropped few other lines, but kept the benchmark values I've
collected. Does this look better now?

Author: Breno Leitao <leitao@debian.org>
Date:   Fri Sep 11 02:57:34 2026 -0700

    arm64/sve: Don't zero the SVE state buffer when the SVE state is live

    Currently do_sve_acc() always zeroes current->thread.sve_state. This is
    not necessary in the common case, and avoiding the zeroing has a
    measurable impact on some benchmarks.

    In the common case where the task is not preempted and its state is not
    altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
    is clear. In such cases, only the live register values matter, and the
    in-memory copy is stale regardless of whether it is saved in
    FP_STATE_FPSIMD format or FP_STATE_SVE format.

    This is worth doing because the SVE state is discarded on syscall entry,
    so userspace that mixes SVE and syscalls re-traps constantly. A fleet
    profile of arm64 hosts running services whose memset() is SVE shows the
    memset under do_sve_acc() accounting for 29% of the trap handling cost.

    Measured on a 72-core Neoverse V2 (SVE VL 128, sve_state_size 546,
    performance governor) with perf bench sched pipe pinned to one CPU, and
    SVE operation on write, so that each loop also takes an SVE access trap.

            * -0.99% kernel instructions
            * -1.38% kernel cycles
            * -1.12% wall clock

    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059b..324c9799b0511 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1316,7 +1316,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
                return;
        }

-       sve_alloc(current, true);
+       sve_alloc(current, false);
        if (!current->thread.sve_state) {
                force_sig(SIGKILL);
                return;
@@ -1341,6 +1341,7 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
                sve_flush_live();
                fpsimd_bind_task_to_cpu();
        } else {
+               memset(current->thread.sve_state, 0, sve_state_size(current));
                fpsimd_to_sve(current);
                current->thread.fp_type = FP_STATE_SVE;
                fpsimd_flush_task_state(current);
