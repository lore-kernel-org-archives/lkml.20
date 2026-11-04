Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780050;
	b=XzsomJxglONjBHJ66CZWMwOGb00vA5tuMgMjLzeM1axfG82Xbjq0JZ2geeoUQUg/J9Rh
	 gqheX38vJGO0Pf2aU2rNjYLNjQ8+Seat0UUNWHyehUnLRVUHcRPj+MrrODu42HyBTHa+o
	 3UI3TlcZOmcfC5OwOIXUF8M3pNxembQbjGrbhC9GbgbwnN9imw/tx0VIu185M2P/rd7UR
	 PVSMLqBQi+E2uXfiFmKJdwORzK2ti7vX9/Gtk4y+xOQ2FRDzsEZggGY1Z9Su7KSmdbfRY
	 vo6IAggBIwUjDaWvJPcKUcDvGuJMKEWme71UwnakVL/LWVqfYLoTYx6RbMu1nR7ogrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780050;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qA3iBaIijakHB1QdN+Ns5adqey4iVefqmbVMKWtw4sQ=;
	b=XITzHzwSsUBZpCdxYNhzsOzuzG73xYrrIrmAPf6tplBrR+fCrJFdQPd80elc+PaxrkMW
	 o+EJNGK1Y0oTsxrfHEWMjlWZBDsy0tvddW6LNaiECTpTiusaL1/LBcX4kiBstw2P+4XEt
	 3R/+/YtWK1Cmai/TRaO75ETASmlJaITY/lvkXOj9TY1c5Qm9RxoYL4J8XvVJah9i7w9/p
	 pZKgDUMbOBfHVvtFEC0xS3/JLsxsuHJda+TJ+r00/OfZp5ewf8F4aLZFO/RPagHkZkm5J
	 SMk8Qfk+J7zCbAQ22ytAQZ9WUAsSpXvbfo887FaLC2JANQZL3t+GNkea6q8OTU2fEfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVKuxieD;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DMq8Khe8;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0EE606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0EE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VVKuxieD;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DMq8Khe8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793780048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qA3iBaIijakHB1QdN+Ns5adqey4iVefqmbVMKWtw4sQ=;
	b=VVKuxieDICgVV3B4nJooiXaIn/1q4TULaLbjBh/4XOSc4CoZ6wk7iay36yBurte4hTwqUf
	xyoYpNHThmyeyMZ36RiUIbGpG5Zyi8xBf7TjzUTwgps1H2OVpXQJVWLmsyG8PWN3e0Fmmx
	GM7AwBWC0fP1HT6Q8DYKb+K1RQ1qDQw=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-s7NdrF6YMiecVpuzdxim6A-1; Wed, 04 Nov 2026 03:14:07 -0500
X-MC-Unique: s7NdrF6YMiecVpuzdxim6A-1
X-Mimecast-MFC-AGG-ID: s7NdrF6YMiecVpuzdxim6A_1793780047
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89e05d31e54so420759b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793780046; x=1794384846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qA3iBaIijakHB1QdN+Ns5adqey4iVefqmbVMKWtw4sQ=;
        b=DMq8Khe8tRTMUpR/1ZXMZyrmohwc/4Z9aHfkig0IxQnZQn+PyCGxOg5Yu+ZnhBpUHL
         gcY1OvZgDMg1kUfBVJe3YjyCy26L+hQE/7Ifnqa21FvBQ5x1tvU35ZbBZelhhyeOFDHk
         /5JByFOBeWfKQIyD3BF3Pe9YP2tGIhkZKMOCnbIF3AjCFfpxlFkOSQRgHPgfoT0tCvKG
         kc+F/neJexDW63GPIMBwGAbV3yCXq0SAaL86tIQuJuVuUL725rzh7Gk18jfkyFJgkGiD
         XoCYKsUWGmKyJY7d4z8MffAwvlLSgKSPQbHM3CkqGxXNxIiCpW+F85Ud8emsv1eFQn1z
         xBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780046; x=1794384846;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qA3iBaIijakHB1QdN+Ns5adqey4iVefqmbVMKWtw4sQ=;
        b=bW0FcJwFydaw6iDn5Yr82mQfuI5Zi+Ue/IioTWA5l9eQg9D7BCB2rG3rJA4yAJ06Zj
         6rMMYe97X9ETtpT39hIoY/61iXdXhAFaeYXztc+aBx13HcrBvcDaYneJ67odfhY7SnBx
         W335umHLM+PHQZ3jwEKDqFIkotv4ibev1sPd+rAOjsiEbjpANU1a5r0rnVAwE26a9811
         piQKBzcEzGz5WL/YjepNqc5J58ve6O8oiOeiKUKGVB8vaOSyRhzWzqsGHP0d3yn2bdJd
         Bn7q821DDxwtGmbGsqI+g5SFj9x3acEAMPdkpQp3E6RalYlu/riVTzTSjlKgv7UEawS0
         YuEA==
X-Forwarded-Encrypted: i=1; AKwUvBzV2LRNIQALdGe5xz9UFp80jqRiYh8lmN6JwaUtzxgVJvICLIa5IsKbRGNoVBjjUkvMKO05RyeYXMCuLgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cn+ROgTuvHlEXV88QaJ5B9fTKnrDUYqEJNiziLjfjpGIQwAlN
	ud+ySIR6AYnoLtKp4yjUvKjgBQvSmJ3rMC28btHFzvLaq2sKQET3eQQ5nMhvFkEQkMIOJLoSFzs
	/CgfClcgAfefXPGFKY7UrCsXrBfJ/0vgZFL9L9OGOSbmTPAPNkgYdZR6kUUv6kMp31A==
X-Gm-Gg: AYBFou3iS+lwpmdvXn82zF6ed2aN75m8cQAv5hck2Zax2MZBTZvag8nBpkqUhObCW8F
	jYTpaRyTqu80A+AfSmmvFz0+QkD7aCbQn4fvStP1uZejpZyE8amlzutt6xY2P+GuvgCfdx3BODo
	kEI8sHefV4xPPNW322KYE/DJzl7TOOG875HD5ZUvXatOzV5Xw96tV2QeUuhwSKfu0FEjvgHe5wI
	7r2dx0mwhLZmckARsXFKc5sDHJuATjMV0WkKztY1367TVwaptWTH27rW0b1wc6WZHJ84PvU7JLm
	iQRiDl7Mh//bUFSSzDLCXXbr8jgZZUtVGRrdQM20FX8bF2Hp58Uyyqt5gKh6pGrfg+TYBTjDvMS
	nZmpcHbMDhHzUz/YUWzLbIlEukoznWeaHxV7AvG9PIa5n1bCuEL5NYYN2yR9tbhvqs73cfnEeK2
	jHWnTvkisRQIuuV5jZBHqoNcXA54LGxjTWLQ9oKVo05LM=
X-Received: by 2002:a05:6a00:a219:b0:89a:5:92c1 with SMTP id d2e1a72fcca58-8a9bffd58e4mr11887834b3a.56.1793780046360;
        Wed, 04 Nov 2026 00:14:06 -0800 (PST)
X-Received: by 2002:a05:6a00:a219:b0:89a:5:92c1 with SMTP id d2e1a72fcca58-8a9bffd58e4mr11887807b3a.56.1793780045818;
        Wed, 04 Nov 2026 00:14:05 -0800 (PST)
Received: from ?IPV6:2401:4900:1f28:63e0:edae:927e:c670:b679? ([2401:4900:1f28:63e0:edae:927e:c670:b679])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b56926csm585851b3a.38.2026.11.04.00.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:14:05 -0800 (PST)
Message-ID: <e2f4e63c-481c-4e25-bc77-e890fcfaad95@redhat.com>
Date: Wed, 4 Nov 2026 13:43:56 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/crash: Add only the onlined CPU's node to the
 crash FDT
To: Vishal Chourasia <vishalc@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kexec@lists.infradead.org, x86@kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, sshegde@linux.ibm.com, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org,
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev,
 seanjc@google.com, samir@linux.ibm.com, sourabhjain@linux.ibm.com
References: <20261104053848.1381005-1-vishalc@linux.ibm.com>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261104053848.1381005-1-vishalc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi Vishal,
On 04/11/26 11:08 am, Vishal Chourasia wrote:
> A CPU coming online never changes the nodes that are already in the FDT,
> so add only the node of that CPU. update_crash_fdt() looks up the device
> node of the onlined CPU and does nothing if the FDT already has a node of
> that name, which is the case when an offlined CPU comes back online. Only
> when the node is missing, the crash image is invalidated while the node is
> created with fdt_add_subnode() and its properties are copied from the live
> device node with fdt_setprop(). All of this is done directly in
> update_crash_fdt().
> 
> fdt_add_subnode() inserts the node as the first child of /cpus, which is
> the same position a node attached to the live device tree takes, so the
> FDT keeps the order of the live tree.
> 
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> ---
>  arch/powerpc/kexec/crash.c | 65 +++++++++++++++++++++++++++++++-------
>  arch/x86/kernel/crash.c    |  2 +-
>  kernel/crash_core.c        | 11 +++++--
>  3 files changed, 64 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index 775895f31037..ca37006bddea 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -18,6 +18,7 @@
>  #include <linux/types.h>
>  #include <linux/libfdt.h>
>  #include <linux/memory.h>
> +#include <linux/of.h>
>  
>  #include <asm/processor.h>
>  #include <asm/machdep.h>
> @@ -584,32 +585,71 @@ static int get_fdt_index(struct kimage *image)
>  }
>  
>  /**
> - * update_crash_fdt - updates the cpus node of the crash FDT.
> + * update_crash_fdt - add the node of the onlined CPU to the crash FDT.
>   *
>   * @image: a pointer to kexec_crash_image
> + * @cpu: the CPU that was onlined
> + *
> + * The node is added as the first child of /cpus, the same position a node
> + * attached to the live device tree takes. Nothing is done if the FDT already
> + * has the node, for example when an offlined CPU comes back.
>   */
> -static void update_crash_fdt(struct kimage *image)
> +static void update_crash_fdt(struct kimage *image, unsigned int cpu)
>  {
> +	struct device_node *dn;
> +	struct property *pp;
>  	void *fdt;
> -	int fdt_index;
> +	int fdt_index, cpus_offset, node_offset;
> +
> +	dn = of_get_cpu_node(cpu, NULL);
> +	if (!dn) {
> +		pr_err("No device node found for CPU %u\n", cpu);
> +		return;
> +	}
>  
>  	fdt_index = get_fdt_index(image);
>  	if (fdt_index < 0) {
>  		pr_err("Unable to locate FDT segment.\n");
> -		return;
> +		goto put;
>  	}
>  
>  	fdt = __va((void *)image->segment[fdt_index].mem);
>  
> -	/* Temporarily invalidate the crash image while it is replaced */
> +	cpus_offset = fdt_path_offset(fdt, "/cpus");
> +	if (cpus_offset < 0) {
> +		pr_err("Malformed device tree: error reading /cpus node: %s\n",
> +		       fdt_strerror(cpus_offset));
> +		goto put;
> +	}
> +
> +	/* Node already present, e.g. an offlined CPU came back online */
> +	if (fdt_subnode_offset(fdt, cpus_offset, dn->full_name) >= 0)
> +		goto put;
> +
> +	/* Temporarily invalidate the crash image while it is updated */
>  	xchg(&kexec_crash_image, NULL);
>  
> -	/* update FDT to reflect changes in CPU resources */
> -	if (update_cpus_node(fdt))
> -		pr_err("Failed to update crash FDT");
> +	node_offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
> +	if (node_offset < 0) {
> +		pr_err("Unable to add %s subnode: %s\n", dn->full_name,
> +		       fdt_strerror(node_offset));
> +		goto out;
> +	}
>  
> +	for_each_property_of_node(dn, pp) {
> +		int ret = fdt_setprop(fdt, node_offset, pp->name, pp->value, pp->length);
> +
> +		if (ret < 0) {
> +			pr_err("Unable to add %s property: %s\n", pp->name,
> +			       fdt_strerror(ret));
> +			break;
> +		}
If a property copy fails the loop just breaks and the image is
re-validated leaving a partially populated CPU node in the FDT. The
next hotplug event then sees the node as already present and never
repairs it so either drop or roll back the node on failure instead.

> +	}
> +out:
>  	/* The crash image is now valid once again */
>  	xchg(&kexec_crash_image, image);
> +put:
> +	of_node_put(dn);
>  }
>  
>  int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
> @@ -625,10 +665,11 @@ int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
>   * arch_crash_handle_hotplug_event - Handle crash CPU/Memory hotplug events to update the
>   *				     necessary kexec segments based on the hotplug event.
>   * @image: a pointer to kexec_crash_image
> - * @arg: struct memory_notify handler for memory hotplug case and NULL for CPU hotplug case.
> + * @arg: struct memory_notify handler for memory hotplug case and pointer to the
> + *	 cpu number for CPU hotplug case.
>   *
>   * Update the kdump image based on the type of hotplug event, represented by image->hp_action.
> - * CPU add: Update the FDT segment to include the newly added CPU.
> + * CPU add: Add the node of the newly added CPU to the FDT segment, if missing.
>   * CPU remove: No action is needed, with the assumption that it's okay to have offline CPUs
>   *	       part of the FDT.
>   * Memory add/remove: No action is taken as this is not yet supported.
> @@ -636,13 +677,15 @@ int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
>  void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  {
>  	struct memory_notify *mn;
> +	unsigned int cpu;
>  
>  	switch (image->hp_action) {
>  	case KEXEC_CRASH_HP_REMOVE_CPU:
>  		return;
>  
>  	case KEXEC_CRASH_HP_ADD_CPU:
> -		update_crash_fdt(image);
> +		cpu = *(unsigned int *)arg;
> +		update_crash_fdt(image, cpu);
>  		break;
>  
>  	case KEXEC_CRASH_HP_REMOVE_MEMORY:
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index e6f23933a6df..1660f26f3a44 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -441,7 +441,7 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
>   * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
>   * @image: a pointer to kexec_crash_image
>   * @arg: struct memory_notify handler for memory hotplug case and
> - *       NULL for CPU hotplug case.
> + *       pointer to the cpu number (unused here) for CPU hotplug case.
>   *
>   * Prepare the new elfcorehdr and replace the existing elfcorehdr.
>   */
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index d0bd2d0cf899..53d4f2c1760c 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -651,6 +651,9 @@ int crash_check_hotplug_support(void)
>   * NR_CPUS and CRASH_MAX_MEMORY_RANGES. The elfcorehdr is
>   * excluded from SHA verification by default if the architecture
>   * supports crash hotplug.
> + *
> + * @arg is a struct memory_notify pointer for memory hotplug events and a
> + * pointer to the unsigned int cpu number for CPU hotplug events.
>   */
>  static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
>  {
> @@ -676,10 +679,14 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>  		goto out;
>  
>  	if (hp_action == KEXEC_CRASH_HP_ADD_CPU ||
> -		hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
> +		hp_action == KEXEC_CRASH_HP_REMOVE_CPU) {
>  		pr_debug("hp_action %u, cpu %u\n", hp_action, cpu);
> -	else
> +		/* CPU events are raised with no argument, the CPU number is passed instead */
> +		WARN_ON(arg);
> +		arg = &cpu;
> +	} else {
>  		pr_debug("hp_action %u\n", hp_action);
> +	}
>  
>  	/*
>  	 * The elfcorehdr_index is set to -1 when the struct kimage

-- 
Regards,
Mukesh Pilaniya

