Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152DE39FCB1;
	Tue, 29 Sep 2026 20:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790712975; cv=none; b=Qx2qLJXOBBLcNki1LaIZVNA+/lN8KCo0S3r8t0GeMKoWChIHOlNW9s7Zcsqjq1/DC+58gQI9hpW+pERsUDiYZoH3YoXHwSiVDU1C4K8uREOUHMj+Chch1s2d04UCu9vYbjt9MhZPYzxnn6977TdSGjFLQFCQs5sjlWEGGwxKkSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790712975; c=relaxed/simple;
	bh=CCNb0myM2bFfXS5kJPH6OE5BaOG3Wc1Bp9Rsc8Y9B0M=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=XM5nnMCXMkJJqvmPPl2U34NdNJVPbnWjEsyGsCb49kgIXFNd6nQHMTA/BAMhWRFDZ3amafDvVauLDISYh8ISa6zctG5WHaVr8K4ZV/uTtDUNKYKQGrZpupqaQ9qX7sH6fhTQ5dUb9T4Etwxu62Ktd5VrTRox6EFS3g9wGJlGOIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=X1QmKbvM; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aohXBJhk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="X1QmKbvM";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aohXBJhk"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790712967; bh=b7+Geox4ud8eTAeg3+j6HDt
	1q363PIIrzuBA/1qIzLQ=; b=X1QmKbvMB/5s7XUVbyfZ31NXs8eN1HR6bZAsQJYyBgls5geHeO
	sxI/uPI9qD7AR+GKtCZ5k0FB4SVA9kiOS9XmfDxyjlDIl110WbhLYe+MbwCQaOPngaEqrr6gHRq
	9DlZC9X9rBG/te3HSZCmWQaac0Ox59h8ThThKgHiCs6/EB0YTao+y7mQGfIq0RZDz3P4Qe89BcW
	mGsJ7i0WAFTYXsQRnDb2XJKLCHcW2gqTfth0EobSiwVJXQ3YvLBB8suTMN7AY+dZtvIJ253inVY
	hqS1QLOERfjIwMOm5fOawvoxOOrYto1fDGTogs+fJDQwERF7NLRQdby3Gjilcfd/VGA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790712967; bh=b7+Geox4ud8eTAeg3+j6HDt
	1q363PIIrzuBA/1qIzLQ=; b=aohXBJhkdcn4jNAYTeUiUJaqenky18FS9eaOv/ZDLdn1loHoQG
	MatyD7zBmVYyUXu2TorED2ACCUri1NRjKjBQ==;
Date: Tue, 29 Sep 2026 21:16:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: salil.mehta@opnsrc.net
CC: catalin.marinas@arm.com, corbet@lwn.net, gshan@redhat.com,
 james.morse@arm.com, jic23@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peterz@infradead.org, ruanjinjie@huawei.com,
 tglx@kernel.org, will@kernel.org, yangyicong@hisilicon.com
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_1/2=5D_cpu/hotplug=3A_Sk?=
 =?US-ASCII?Q?ip_disabled_CPUs_in_cpuhp=5Fsmt=5Fenable?=
In-Reply-To: <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
Message-ID: <133D63B7-B1DF-4DEB-92F6-B6D785D43457@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 29 September 2026 20:41:29 BST, salil.mehta@opnsrc.net wrote:
>From: Salil Mehta <salil.mehta@opnsrc.net>
>
>The CPU enabled mask describes whether a present CPU may currently be
>brought online. cpuhp_smt_enable() is an online operation, but currently
>walks all present CPUs and only filters CPUs that are already online or
>belong to offline NUMA nodes.
>
>This can make it attempt _cpu_up() for a present CPU which firmware has
>not enabled and which has not yet been registered as a CPU device.
>
>Use the enabled mask for the policy decision it was introduced to
>represent. This keeps present-but-disabled CPUs out of the SMT bring-up
>path while still allowing registered offline SMT threads to be brought
>back online.
>
>Present and enabled are separate generic CPU states, so callers which
>intend to bring CPUs online should not assume that every present CPU is
>enabled.

Ok.

>
>Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
>---
> kernel/cpu.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/cpu.c b/kernel/cpu.c
>index b3c8553d7bd6..988b7a1e8298 100644
>--- a/kernel/cpu.c
>+++ b/kernel/cpu.c
>@@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
> 	cpu_maps_update_begin();
> 	cpu_smt_control = CPU_SMT_ENABLED;
> 	for_each_present_cpu(cpu) {
>-		/* Skip online CPUs and CPUs on offline nodes */
>-		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
>+		/* Skip online/disabled CPUs and CPUs on offline nodes */
>+		if (cpu_online(cpu) || !cpu_enabled(cpu) ||
>+		    !node_online(cpu_to_node(cpu)))

Ehh, have you had a issue with this code? Like something e.g: a splat.


> 			continue;
> 		if (!cpu_smt_thread_allowed(cpu) || !topology_is_core_online(cpu))
> 			continue;
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds
