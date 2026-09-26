Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3515459ACB
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430769; cv=none; b=kmBOwdWc9QP4eAy/jA133zWN9Nqq47AuTTak74yqrUEdyVDv+vfApeZUg/G36xgnvz2Z4DBlyi9XJ2BRrl78K51c3EdXAyKeEaeqQY6+eZpDyYj6Rc5u6Aye41WrOtXIOg3OQ3YKbVkOIoe5Tvf87f/jCk4EHWol2LPrN5PkmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430769; c=relaxed/simple;
	bh=nDVeLzpJFTHd5XVtx/oGFPJPrtX7jH3RBOLzMXzveD4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Wt2CvlwLAhGavrkdEH9/PlRiqpNtqaWfvmyAv6GMQfhoTMKENz4dqZIZecNYcPhewgJk+akB26pOLTG01m1298BIwRbOESTRfN4KOsY+9P7W/6uSszPcKlR/wnIQcx/E0+aq+3jvzwBuid1FqLVfwpbhyCa6B3NrV90WK0zaNOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l7FTkFKH; arc=none smtp.client-ip=95.215.58.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l7FTkFKH"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nDVeLzpJFTHd5XVtx/oGFPJPrtX7jH3RBOLzMXzveD4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790430761; v=1; x=1791035561;
 b=l7FTkFKHrmdG97cts+C/0DeNiEjOpp/zCj3Al/QKNhYnGI/uH9iySz54NEjJUDYBXUSzJq9j
 gXVU+ba3as3YNQIuMe7vUfU2oCyLwf6Dk7eerQTaAb0iAuBWYutlUQtaYiyLNBqmmOAj+WR2nll
 AN0ZH7qVUVaVkpZ5zjCzHFqc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f7f9435df3e225a9;
	Sat, 26 Sep 2026 13:52:40 +0000
X-Mizu-Trace-ID: f7f9435df3e225a9
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 13:52:35 +0000
Message-Id: <DLPAQECUALBD.2J6OV9FK2MA87@linux.dev>
Cc: <martin.lau@linux.dev>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <kpsingh@kernel.org>, <john.fastabend@gmail.com>, <leon.hwang@linux.dev>,
 <zirajs7@gmail.com>, <rhkrqnwk98@gmail.com>, <puranjay@kernel.org>,
 <xukuohai@huaweicloud.com>, <iii@linux.ibm.com>, <hbathini@linux.ibm.com>,
 <chleroy@kernel.org>, <naveen@kernel.org>, <bjorn@kernel.org>,
 <pulehui@huawei.com>, <yangtiezhu@loongson.cn>, <hengqi.chen@gmail.com>,
 <linux-kernel@vger.kernel.org>, <martin.lau@kernel.org>,
 <mason@kernel.org>, <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf v4 2/3] bpf: Skip detached progs in trampoline
 images that are still in use
From: "Florent Revest" <florent.revest@linux.dev>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>,
 <bot+bpf-ci@kernel.org>, <bpf@vger.kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>
X-Mailer: aerc 0.17.0
References: <20260925100342.481242-3-florent.revest@linux.dev>
 <6a6d43e6bada7a1433cd525c9ec31780ed9b2401c8834894defdf671601b2f1d@mail.kernel.org> <DLP46AE97EYD.1I2HDPGBR8GME@gmail.com>
In-Reply-To: <DLP46AE97EYD.1I2HDPGBR8GME@gmail.com>

On Sat Sep 26, 2026 at 8:44 AM UTC, Alexei Starovoitov wrote:
> On Fri, Sep 25, 2026 at 10:47 AM bot+bpf-ci@kernel.org <bot+bpf-ci@kernel=
.org> wrote:
> >> +	/* nops for move_imm+jirl, patched to skip this prog when it is deta=
ched */
> >> +	for (i =3D 0; i < LOONGARCH_LONG_JUMP_NINSNS; i++)
> >> +		emit_insn(ctx, nop);
> >
> > Can a task preempted inside the skip sled resume into half of the new j=
ump
> > sequence and jump to a garbage address?
>
> [...]
>
> > Could the LoongArch skip site use a single instruction instead? For
> > example, a 'b' to the skip target, which is always within the +/-128MB
> > range of the same image, patched from nop to 'b'. The rest of the sled
> > would then be unnecessary.
>
> Seems like a real bug. Same issue on riscv.
>
> ip_after_call was patched in bpf_tramp_image_put() when the image was
> already unreachable. Now bpf_trampoline_remove_prog() patches cur_image
> before bpf_trampoline_update() replaces it, so every call of the traced
> function goes through the sled while it is rewritten. stop_machine
> doesn't help the task that it preempted in the middle of the sled.
>
> Pls fix and respin.
> Everything else looks good.

Ok. In v5, on riscv and loongarch, it will emit single nops at skip sites a=
nd
patch them with jal or b instructions. They can always reach their target s=
ince
they are in the same image. This requires a new arch_bpf_trampoline_skip() =
hook
that defaults to bpf_arch_text_poke() on other archs. I tested it in QEMU.
