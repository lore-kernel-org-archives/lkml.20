Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706541;
	b=juCVvG/o5CVUHDMw1gsGmCLqX0QZp2rEXlDTsBlDHyCYyt3Kj5tWqnVrpwDaqMCE11Rb
	 BBV/t2RXRAgAxD2r0dPREmMy6vEQWnFbRdlOAAq5sSXKD0QT+Fa8foL1pIa1Eqv+Y2i/0
	 MbJ+5mwhggHAUqUeGzDak1C+EUeD7qrHkbGbcx3XR/6BxKGxLkIXg0SpSGoiewFW4djFc
	 uMLqepljNIYkWZMIAMa/ja2BO3N+QRo961Qg9eC+8eU6qzpD1FiV3aSYjE8uA2f0W5Wax
	 MdoS/XOEvixMMTGO4Mphi/pnUvuYig4fpM5YnwF6FxulpKoZ+CPykvrTZXaQKvZaiDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706541;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W0ZUFOadJC6PrSKEwszh5okV1YbbWnVO0ckCp82sIZI=;
	b=PbSS/HtFK03pTbd+mFKQd+7yCHYAUm2oan1eryKq21OvqrDv2xS+T5WDwzzneF24nZu1
	 omXZwQRsHeIJyzQI/zBYU8peLEnlrDHnm2LyCitGnQ6Qi5W73rFStCP2g/gq+OmWrKQ2t
	 N4fTxbrjPEuq0Vz6fdT0eBEMGDqoSJphKNNHA1yJvGSftl2svk2l/kf1z7OAfBrAFbnIo
	 YBI6ZFyjwcjny5rA3CjI8BfxPEAfIe7nBMuX5ZeUGbXvPI6/2PHL0XiaFSrLteI7yzk8Y
	 r+VkLnDc7aCeha/psb8PKyCyhJo2eeNxsGv1FRNWFoDQ2gmvaWNWrWzMOJAsHvXTOag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=bDm2GHYu;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=LR8s8ZiP;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B35B606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B35B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=bDm2GHYu;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=LR8s8ZiP
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793706530; bh=W0ZUFOadJC6PrSKEwszh5ok
	V1YbbWnVO0ckCp82sIZI=; b=bDm2GHYuLgJgsv1tigyfg8wCCz8luzpaITA7dtAo4ZROwJSouD
	nMZI9HWXSMsQ4c1P+5HOOR1iHzumvla4XuY6Fs2SiuI+dY0Zeco7bfChDKQV3eLI0m9kfKS5CE6
	YPuHBb2yT2+lMPX1xhzU1uuXQn4POUfWdswS7iH2WNd112Fo9CT+oASA36d8FtsZ00bxnmr5ljf
	SNwZSd0W7tfbEJ2AcOwh0jVqbd9TXx6Rjvy1kncVjKsDlEK2orHsqx/+L1i208BzkwfpehnHXmh
	R1uidw8LHtD37sqfT883lblwSaeKQGLFrEM3Q2zPTsBJ46QmSSxJXQFyBtsJk9uXioQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793706530; bh=W0ZUFOadJC6PrSKEwszh5ok
	V1YbbWnVO0ckCp82sIZI=; b=LR8s8ZiPGOLCPF9tLMbTdiWec6+ioKJ1ftUMcZwrMpaw+aerQh
	0OkZAtuGQEP4rj7GBl0l41ut2Fpidf/OlFCw==;
Date: Tue, 03 Nov 2026 11:48:52 +0000
From: Bradley Morgan <brads@mainlining.org>
To: daniel.lezcano@oss.qualcomm.com
CC: akpm@linux-foundation.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, peterz@infradead.org, rafael@kernel.org,
 tglx@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_smpboot=3A_Allow_restr?=
 =?US-ASCII?Q?icting_per-CPU_threads_to_a_CPU_mask?=
In-Reply-To: <af37c4e7811a86adafb2064e7cf4aa4f5090ab4b.1793660202.git.daniel.lezcano@oss.qualcomm.com>
Message-ID: <79AC1B3F-F158-4808-AD7E-70AE659E8DB5@mainlining.org>
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

On 2 November 2026 23:09:40 GMT, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>smpboot_register_percpu_thread() creates a thread for every online CPU
>and registers the descriptor for subsequent CPU hotplug operations.
>There is currently no way to restrict these threads to a subset of
>CPUs, even when the user only needs work performed on that subset.
>
>For example, an idle injection device targets a specific CPU mask.
>Creating threads outside that mask consumes resources unnecessarily.
>Supporting multiple such devices also requires each descriptor to
>manage only the threads associated with its own CPUs.
>
>Add an optional CPU mask to struct smp_hotplug_thread and apply it
>throughout the thread lifecycle. Registration creates threads only for
>online CPUs in the mask. CPU bring-up creates threads for selected
>CPUs that were offline at registration, while parking and unparking
>are restricted to the same mask.
>
>Apply the restriction to thread destruction as well, both during
>unregistration and registration failure cleanup. This is necessary
>when descriptors with disjoint masks share the same per-CPU task
>storage: tearing down one descriptor must not stop or clear threads
>owned by another descriptor.
>
>The caller must keep the mask valid and unchanged until the descriptor
>is unregistered. Callers sharing per-CPU task storage must ensure their
>masks do not overlap and serialize ownership changes themselves.
>
>A NULL mask preserves the existing behavior, so current users continue
>to manage threads on all CPUs.
>

This is simple as it gets, thanks.

Reviewed-by: Bradley Morgan <brads@mainlining.org>

>Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>---
> include/linux/smpboot.h |  4 ++++
> kernel/smpboot.c        | 17 +++++++++++++++--
> 2 files changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/include/linux/smpboot.h b/include/linux/smpboot.h
>index 9d1bc65d226c..98c072eeaf24 100644
>--- a/include/linux/smpboot.h
>+++ b/include/linux/smpboot.h
>@@ -5,6 +5,7 @@
> #include <linux/types.h>
> 
> struct task_struct;
>+struct cpumask;
> /* Cookie handed to the thread_fn*/
> struct smpboot_thread_data;
> 
>@@ -27,6 +28,8 @@ struct smpboot_thread_data;
>  *			unparked (cpu online)
>  * @selfparking:	Thread is not parked by the park function.
>  * @thread_comm:	The base name of the thread
>+ * @cpumask:		Optional mask of CPUs on which to create threads. Must remain
>+ *			valid and unchanged until the descriptor is unregistered.
>  */
> struct smp_hotplug_thread {
> 	struct task_struct		* __percpu *store;
>@@ -40,6 +43,7 @@ struct smp_hotplug_thread {
> 	void				(*unpark)(unsigned int cpu);
> 	bool				selfparking;
> 	const char			*thread_comm;
>+	const struct cpumask		*cpumask;
> };
> 
> int smpboot_register_percpu_thread(struct smp_hotplug_thread
> *plug_thread);
>diff --git a/kernel/smpboot.c b/kernel/smpboot.c
>index 4503b60ce9bd..07857523a465 100644
>--- a/kernel/smpboot.c
>+++ b/kernel/smpboot.c
>@@ -168,6 +168,9 @@ __smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 	struct smpboot_thread_data *td;
> 
>+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
>+		return 0;
>+
> 	if (tsk)
> 		return 0;
> 
>@@ -225,6 +228,9 @@ static void smpboot_unpark_thread(struct smp_hotplug_thread *ht, unsigned int cp
> {
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
>+		return;
>+
> 	if (!ht->selfparking)
> 		kthread_unpark(tsk);
> }
>@@ -244,6 +250,9 @@ static void smpboot_park_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
> {
> 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
>+		return;
>+
> 	if (tsk && !ht->selfparking)
> 		kthread_park(tsk);
> }
>@@ -267,6 +276,9 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
> 	for_each_possible_cpu(cpu) {
> 		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
> 
>+		if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
>+			continue;
>+
> 		if (tsk) {
> 			kthread_stop_put(tsk);
> 			*per_cpu_ptr(ht->store, cpu) = NULL;
>@@ -279,7 +291,8 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
>  * 					    to hotplug
>  * @plug_thread:	Hotplug thread descriptor
>  *
>- * Creates and starts the threads on all online cpus.
>+ * Creates and starts the threads on online CPUs selected by the descriptor's
>+ * cpumask, or all online CPUs if no mask is specified.
>  */
> int smpboot_register_percpu_thread(struct smp_hotplug_thread
> *plug_thread)
> {
>@@ -308,7 +321,7 @@ EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
>  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
>  * @plug_thread:	Hotplug thread descriptor
>  *
>- * Stops all threads on all possible cpus.
>+ * Stops all threads associated with the descriptor, including offline CPUs.
>  */
> void smpboot_unregister_percpu_thread(struct smp_hotplug_thread
> *plug_thread)
> {
>


--- Thanks!
