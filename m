Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932698;
	b=5BI7BwnvZd8CzwCigvP/rVxQSxca7FiA3NfU0r0u7gutqxvUwWwEPBuBwykWQ0EzNBRo
	 XMkRVJ+8s1nSkdGx0gmchWTGl9UX1BNtdIsIzjL8fXSe3cb3i2zADFGUkHrv/PpU38qSF
	 5MOShWIwfs0rS7r1MVaem/llgmgl8rCatQJtvfzZHhpMjoAJ/rrPmIBuPPruiPrByBsZU
	 qWJE28SfM4c+AjD4CN6G88NT/jEtWX5sjZMMGasKgHKF/SNgCrkNs+e30Xj58rEZV1I1H
	 G80S/n9MtllAVT4ynNTdm9LgdSBckFp/EvVTBSyEaX89l8UZEynTR6WqjKgnHR7+Kyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932698;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MkLtOYdxk61Y/KvhSC8VX37lUzy3q5IuR8MQhKngCBo=;
	b=Ad1+ydXmi/8Tk8vz/BgGGEt/ss8kFJix4lq9UcaqswTIzN6QSztjzasjYIAH64lyjGRv
	 atktn+rhOTlZ2pd/+mLP6kHbo6UijUtGg2MltWNPReqZcoOLe0Ik2XesZkog4lr1uefnh
	 znpWjfkwDizr41n1owcZboIziII9s+e1x6P75sfG85niIpyZ7S/HrUP/Vnt9O/IV4qdwz
	 VtkCrN2l8OYowEQ7Lh+X79zihl5OzGnNS0mXB4vXnre5M94zY/hhNm+xkBeyJKUBhz762
	 KTjDiP6Xfo1UeoY5ft5A9x1Cf/iH5vtxyo2eOKs29sbz6cRJeyYM9r/KtjyiS7wbW1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FGypZQv3;
	arc=none smtp.remote-ip=91.218.175.37
Received: from mta0.migadu.com (out-37.mta0.migadu.com [91.218.175.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C384606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C384606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FGypZQv3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rBbJ98GGuo36riXW7O6kVFtZAVMbDSfXsdKDvWNXwCk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794932695; v=1; x=1795537495;
 b=FGypZQv3AKcZzkmleh3dNJtO7K/iwi4LMu1yRKv34iToHDHxOCOCI6DAcNFKZpJL7KqBTtBZ
 l9zPskLgs7v0iTg4jau9i5lNrKYisE1npFIK1OW0FQos6Vl2DGBYzI5czgcPNG7Zy/iI/eLGls8
 wg/bbnm6RtiqYLePe5IaSyLU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4ae6cdd0d5cdc8c9;
	Tue, 17 Nov 2026 16:24:55 +0000
X-Mizu-Trace-ID: 4ae6cdd0d5cdc8c9
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 16:24:52 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: yangguikun19@qq.com
CC: linux-kernel@vger.kernel.org, paulmck@kernel.org, rcu@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_srcu=3A_Validate_=5F=5F=5Fsrcu=5Fstru?=
 =?US-ASCII?Q?ct=5Fptrs_entries_against_the_module_range?=
In-Reply-To: <tencent_E038DD9BFA4429F88047A5A4367D578DB80A@qq.com>
Message-ID: <E089D232-BEB4-4914-A25E-F05033EDD7BD@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 17 November 2026 02:00:00 GMT, Guikun Yang <yangguikun19@qq.com> wrote:
>As discussed, here is the formal patch. Exactly as you presumed:
>srcu_module_going() needs the same check, because a module whose
>coming() fails the validation still gets a MODULE_STATE_GOING
>notification via the robust call in prepare_coming_module().
>
>---
>
>The entries of the ___srcu_struct_ptrs section are absolute pointers
>emitted by DEFINE_SRCU() in module .data. load_info() hands the raw
>section to RCU (kernel/module/main.c), and srcu_module_coming()
>dereferences each entry and writes through it:
>
>	ssp = *(sspp++);
>	ssp->sda = alloc_percpu(struct srcu_data);
>	ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
>
>A malicious or corrupted module image can point an entry anywhere in
>the kernel address space; nothing on the load path validates it, so
>this is an arbitrary-address write primitive (an 8-byte percpu
>pointer at offset 8 of the target).
>
>The static-key loader already handles the same shape of section with
>a range check (kernel/jump_label.c):
>
>	if (within_module((unsigned long)key, mod))
>
>Apply the same check to both module-notification paths. coming()
>rejects the module load outright; going() skips the entry, because
>going() runs even for modules that never passed coming(), and those
>entries never got per-CPU data allocated.

For the next series of patches, could you please send it as new threads?

lore makes me sad because of the mess.

>
>Signed-off-by: Guikun Yang <yangguikun19@qq.com>

look, makes enough sense

Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>


>---
> kernel/rcu/srcutree.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
>index 2b0e2b2d2..412265757 100644
>--- a/kernel/rcu/srcutree.c
>+++ b/kernel/rcu/srcutree.c
>@@ -2498,6 +2498,8 @@ static int srcu_module_coming(struct module *mod)
> 
> 	for (i = 0; i < mod->num_srcu_structs; i++) {
> 		ssp = *(sspp++);
>+		if (WARN_ON_ONCE(!within_module((unsigned long)ssp, mod)))
>+			return -EINVAL;
> 		ssp->sda = alloc_percpu(struct srcu_data);
> 		if (WARN_ON_ONCE(!ssp->sda))
> 			return -ENOMEM;
>@@ -2521,6 +2523,8 @@ static void srcu_module_going(struct module *mod)
> 	srcu_defer_flush();
> 	for (i = 0; i < mod->num_srcu_structs; i++) {
> 		ssp = *(sspp++);
>+		if (WARN_ON_ONCE(!within_module((unsigned long)ssp, mod)))
>+			continue;
> 		if (!rcu_seq_state(smp_load_acquire(&ssp->srcu_sup->srcu_gp_seq_needed)) &&
> 		    !WARN_ON_ONCE(!ssp->srcu_sup->sda_is_static))
> 			cleanup_srcu_struct(ssp);
>
>

--- Thanks!
