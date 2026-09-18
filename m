Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A63403F1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700138; cv=none; b=Vdmr7wpQ8N1HoQbjlryLQV309QeePdyW1/4KVN5p9gNBpzA07LJUmCy8BtA4+SJkPbr0Ilb4zK/isJoVpp3N0cucJL1fHiviTKC5ucyv3SEdyMlPKcFBkUpM7ZmW0cHR2QGKaFA9Y+ETRezw/R2UiQhsxxnTo6S6YY/JEDXdjqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700138; c=relaxed/simple;
	bh=cljyv+SKsQFwrL67mF8CfrpMbEF+fcNmGcIPIp6I/M4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qmaWd/fb8ql3dz48kMrYuu4WojvYjk3Te1FwI4erf0Ju0MRpTRe1hShWAP4yvi0OXrZa6yPeISkSyPUWlrZTU0DkgbyxgFIlqf1/qprZHwG9O4M9/Jij/Vqz0QjOCk40XHjWY9jEnqzyV6gmSfNThE6mCTnFd8eOXecustekD6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=gbFpiLlP; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="gbFpiLlP"
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 174C2CFAEA;
	Fri, 18 Sep 2026 05:55:27 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 174C2CFAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789700129;
	bh=nc7IR0S77e9xUm+l+/OSiKzzT+W5l7tXh7cDJdyopAE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gbFpiLlP92Dd+ZFCK4K7U530X7mi6M4DO6LUyuP2swrkIViaQL0wb7NroPMHN/go5
	 mxGf3hESE2ilL7IeLKVrGsL2lc25N40P01G62kaKTNCITAEpxCzyEK6GmJsb3pL/Pk
	 J84LOFOzHzcGtuHhlUg6D2goWtG0lPMUTftAlLFPt2CO2jrv8/tHyBnZMlhYX4NNVF
	 nm8nbslZqz1l/tDrJKsQiAPecUj7MxM/IyB0CPHoGbbbgwH/vTYP/OxqsNTkhpTx0u
	 Wx2tfC/I2BTKc36svJR/0RxMp7ZRKNp3H6CYJ+aLrUihBBTLzfD/N3WAt7CQQmUgwV
	 KXJmQXmD0mA9Q==
Message-ID: <0f9ca9d4af4ac5cb5056c4900e61b747e4d7a806.camel@rendec.net>
Subject: Re: [PATCH] genirq/proc: Fix missing CPU header in /proc/interrupts
From: Radu Rendec <radu@rendec.net>
To: Haris Okanovic <harisokn@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
  Dmitry Ilvokhin	 <d@ilvokhin.com>
Cc: Michael Kelley <mhklinux@outlook.com>, linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 22:55:26 -0400
In-Reply-To: <20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
References: 
	<20260911-dev-harisokn-proc-interrupts-fix-b4-v1-1-f9ff208efcfa@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-09-11 at 13:31 -0500, Haris Okanovic wrote:
> irq_seq_show() must be idempotent since it may be called multiple times
> to render the same record, e.g. when seq_file's buffer is exceeded. It
> emits the CPU header behind the one-shot print_header flag, which the
> first pass clears, so the header is lost with the discarded buffer.
>=20
> This can be seen on large systems, such as 8g.48xl (192 CPUs) and
> 8i.96xl (384 CPUs) AWS instance types:
>=20
> =C2=A0 $ head -1 /proc/interrupts
> =C2=A0=C2=A0=C2=A0=C2=A0 9:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 ...=C2=
=A0 0=C2=A0 GICv3=C2=A0 25 Level=C2=A0 vgic
>=20
> Replace print_header with the position of the first record and include
> the header whenever that record is emitted.
>=20
> Fixes: 171cc0d9eed1 ("genirq/proc: Speed up /proc/interrupts iteration")
> Signed-off-by: Haris Okanovic <harisokn@amazon.com>
> ---
> =C2=A0kernel/irq/proc.c | 24 +++++++++++++++++-------
> =C2=A01 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
> index 1b835725f7b1c..0c0df16de5816 100644
> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -462,7 +462,7 @@ int __weak arch_show_interrupts(struct seq_file *p, i=
nt prec)
> =C2=A0static DEFINE_RAW_SPINLOCK(irq_proc_constraints_lock);
> =C2=A0
> =C2=A0static struct irq_proc_constraints {
> -	bool		print_header;
> +	loff_t		first_pos;
> =C2=A0	unsigned int	num_prec;
> =C2=A0	unsigned int	chip_width;
> =C2=A0} irq_proc_constraints __read_mostly =3D {
> @@ -543,14 +543,13 @@ static int irq_seq_show(struct seq_file *p, void *v=
)
> =C2=A0	struct irqaction *action;
> =C2=A0
> =C2=A0	/* Print header for the first interrupt? */
> -	if (constr->print_header) {
> +	if (p->index =3D=3D constr->first_pos) {
> =C2=A0		unsigned int cpu;
> =C2=A0
> =C2=A0		seq_printf(p, "%*s", constr->num_prec + 8, "");
> =C2=A0		for_each_online_cpu(cpu)
> =C2=A0			seq_printf(p, "CPU%-8d", cpu);
> =C2=A0		seq_putc(p, '\n');
> -		constr->print_header =3D false;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (desc =3D=3D ARCH_PROC_IRQDESC)
> @@ -635,14 +634,25 @@ static void *irq_seq_next_desc(loff_t *pos)
> =C2=A0
> =C2=A0static void *irq_seq_start(struct seq_file *f, loff_t *pos)
> =C2=A0{
> -	if (!*pos) {
> -		struct irq_proc_constraints *constr =3D f->private;
> +	struct irq_proc_constraints *constr =3D f->private;
> +	bool first =3D !*pos;
> +	void *ret;
> =C2=A0
> +	if (first) {
> =C2=A0		constr->num_prec =3D READ_ONCE(irq_proc_constraints.num_prec);
> =C2=A0		constr->chip_width =3D READ_ONCE(irq_proc_constraints.chip_width)=
;
> -		constr->print_header =3D true;
> =C2=A0	}
> -	return irq_seq_next_desc(pos);
> +
> +	ret =3D irq_seq_next_desc(pos);
> +
> +	/*
> +	 * Record position of the first output record so that irq_seq_show()
> +	 * knows where to write the header.
> +	 */
> +	if (first)
> +		constr->first_pos =3D *pos;
> +
> +	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static void *irq_seq_next(struct seq_file *f, void *v, loff_t *pos)
>=20
> ---
> base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
> change-id: 20260911-dev-harisokn-proc-interrupts-fix-b4-7498f7e18db5

Since I don't have access to a machine with so many CPUs, I tested
locally in a regular VM and simulated the large number of CPUs by
adding artificial buffer writes to both the header part and the IRQ
counter part of irq_seq_show(). I could reproduce the problem and
validate the fix. Also, semantically the fix looks good to me.
Thanks for catching this and for the patch!

Reviewed-by: Radu Rendec <radu@rendec.net>
