Received: from mail-wr2-f8.google.com (mail-wr2-f8.google.com [74.125.225.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07509446BF8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757830; cv=none; b=TFsN7nN5hhLS1M7bkPI04pKoRapFrihp25qwolVMmcprb5sha6sQZeu6mUWuhTZcS9LXIF2DkgAJLYaiIHVH+8F/9Gb4X3c0Tawk0mZIXxacTJcrrEN3Wa0qDAr7Sm5MK/6iOEyr4PbeGv3mvEUBvdIlJ/D9+e8u9OMGK2jFaZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757830; c=relaxed/simple;
	bh=ZqmiIM+1aauWDfyrsibFBf66UYrNpL3a+gp7OyLmUpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FSCbz2B9W3GRAaGhSuVL6hlNrk6nCXm/OENE1u7tlXBeBfuoFNkRgduExN+4DdxGdAVGHJTy2NaB6vtFttHBjQXXwWj1lzAgz8fOc9OIhQO9baOZ6sA5dmXSFaWWwLyS2kp/1TO0DVzjoywtOFxMyp3j0i8fLRJAJ079OVmbHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net; spf=pass smtp.mailfrom=opnsrc.net; dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b=CcSxM+SG; arc=none smtp.client-ip=74.125.225.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b="CcSxM+SG"
Received: by mail-wr2-f8.google.com with SMTP id ffacd0b85a97d-485ac0c75b9so2060107f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790757824; x=1791362624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jQnxbzB0rX2uzsTz5BeJSh2mtO9nvpvZzzcrUYm1zTA=;
        b=CcSxM+SGkx4RB2JEyoTtM4Ads29nnc7AjgNstF5OqPi2BGNjI0gYILvPTMy3cScKPy
         DT3R+U/6UDYyKdN6lQj9YKQH39AStRbPTRQD4teCsHj1/KxhKdlNqPCi2JGhjq0zuPrt
         FYmh2ctzoKutOf++6jrG7peq0SZVN0StWdUdFRdcXiotbiPa5KJJxfWliFvNlMz54/T0
         M+WDtupun3l3uMtMfkDiHz5qsioDY/Sr85dyBxbfUvafDB4kn4ExvpJt7vkaWz0oX5Qo
         GI0PnLK/+1LUIizSTzxaUXAOdokNR/KNgeH6FvUAKY3p4+8hPBGhRCIr7rLb60dDarK/
         z1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757824; x=1791362624;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQnxbzB0rX2uzsTz5BeJSh2mtO9nvpvZzzcrUYm1zTA=;
        b=ux5vmMzGkNN8e6eIUoVr4zX1IhZ4NDPwcDSGyoqjXpe1LDqNueLiIDR6Th4STq0bBU
         eZdVSSEBglHIRKYjCURLwbOlQMV6ActM56WHd2qcyhxQ9GSgChYVIZEZbEISjybM1vZp
         46W9K8lAdKobyzn6Wy3OwSwzQPMD19yLKMeVzM2MqLdRt5hDO3hZrzckzwyvnpu6nGEm
         i0yQ0Z/jOpaGALblxp38pzgU43Tg5IvS0AX+lyeEKl8MNJ0tQ3rhIij8L6+O+8rriAwk
         DZ4H9nM5ar2NJvEogj5Yw9tymQOpcktRVfZt99nE9np605gnoxdf6DFzC9QM2fqYGG57
         ONVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwc4fAv/SO2r94qobWkigYWKMwGkSMbU7b4NGTHsoPSE2fu5f6jSOVG2VzmwsmLbgUyisWP6jtFEGdo55U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCmGQt50hWAvTWlj1W/HJlZALO/Tat0p8k573dEpIc45rjI1sJ
	dkwldeCmhlRm1s5kXVbU25tY7GV+RQvUY+8NYNaZrDhWC5cDSkSRO/oYjiosOyU8oXQ=
X-Gm-Gg: AYBFou0mJiSYKvO1BNfd+gqWpPnbWFOL5qsZI9wVik9lu30k6ips29NiSJ0W7eD+ylo
	YsU0b1Nnjbww0FjeRLccG3iEroAUL+LkvERVjU2ANKkPTt5y5zqmB0+Lwlu+946qQ8MB7xwwBp1
	BUGJzho2VqAlsWTFX5a9i42EoIl0NwOxOOYd9vApDdCvrHgGmLWSgEgEuffwe86Mt4bmOqsD6Ng
	U60VSgYlO6jPS2u0LyUOi4lja5kt4P2eZkre5OKGOMDrj1fAVQaZv8FyGAMjCalURH7juLfTe7t
	JNXLBXLrHhatElyEARnueCob0I9mj6QwLSm84rqRS+O+CukvHe/7Ta3dYBnIVjTnzpKD9N8h7xi
	WWIxY/uwRYs8oc/j1/7TFMygdZPvxQ9dluB/DieHpvwBO01n87r0G4kwuId9KIVfZz0MBNTAI2L
	welbQqv70W6GDO2ogYYWnqxiH09VszXOnvZ6QR8ifwc/7/msEyEbv4fah/vM/fF0qPc3pUDjx58
	MYyZbrVAYVj1cTgulRsLca9bsvNp1wMTMj0f06TXAhQcO/teYjfqHW7AJZV8QN/Phvt9x4=
X-Received: by 2002:a05:6000:25c3:b0:487:10a9:57cb with SMTP id ffacd0b85a97d-48b0253e9eemr1543524f8f.49.1790757824401;
        Wed, 30 Sep 2026 01:43:44 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b0dsm1702201f8f.25.2026.09.30.01.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:43:43 -0700 (PDT)
From: Salil Mehta <salil.mehta@opnsrc.net>
To: Bradley Morgan <brads@mainlining.org>
Cc: catalin.marinas@arm.com,
	corbet@lwn.net,
	gshan@redhat.com,
	james.morse@arm.com,
	jic23@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	ruanjinjie@huawei.com,
	tglx@kernel.org,
	will@kernel.org
Subject: Re: [RFC PATCH 1/2] cpu/hotplug: Skip disabled CPUs in cpuhp_smt_enable
Date: Wed, 30 Sep 2026 08:42:46 +0000
Message-Id: <20260930084246.3238477-1-salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <133D63B7-B1DF-4DEB-92F6-B6D785D43457@mainlining.org>
References: <133D63B7-B1DF-4DEB-92F6-B6D785D43457@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Sincere Apologies, sending it again as Plain Text; earlier reply got
filtered perhaps due to HTML content]

Hi Bradley,

Many thanks for taking a look.


On Tue, Sep 29, 2026 at 9:16 PM Bradley Morgan <brads@mainlining.org> wrote:
>
> On 29 September 2026 20:41:29 BST, salil.mehta@opnsrc.net wrote:
> >From: Salil Mehta <salil.mehta@opnsrc.net>
> >
> >The CPU enabled mask describes whether a present CPU may currently be
> >brought online. cpuhp_smt_enable() is an online operation, but currently
> >walks all present CPUs and only filters CPUs that are already online or
> >belong to offline NUMA nodes.
> >
> >This can make it attempt _cpu_up() for a present CPU which firmware has
> >not enabled and which has not yet been registered as a CPU device.
> >
> >Use the enabled mask for the policy decision it was introduced to
> >represent. This keeps present-but-disabled CPUs out of the SMT bring-up
> >path while still allowing registered offline SMT threads to be brought
> >back online.
> >
> >Present and enabled are separate generic CPU states, so callers which
> >intend to bring CPUs online should not assume that every present CPU is
> >enabled.
>
> Ok.
>
> >
> >Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
> >---
> > kernel/cpu.c | 5 +++--
> > 1 file changed, 3 insertions(+), 2 deletions(-)
> >
> >diff --git a/kernel/cpu.c b/kernel/cpu.c
> >index b3c8553d7bd6..988b7a1e8298 100644
> >--- a/kernel/cpu.c
> >+++ b/kernel/cpu.c
> >@@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
> >       cpu_maps_update_begin();
> >       cpu_smt_control = CPU_SMT_ENABLED;
> >       for_each_present_cpu(cpu) {
> >-              /* Skip online CPUs and CPUs on offline nodes */
> >-              if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
> >+              /* Skip online/disabled CPUs and CPUs on offline nodes */
> >+              if (cpu_online(cpu) || !cpu_enabled(cpu) ||
> >+                  !node_online(cpu_to_node(cpu)))
>
> Ehh, have you had a issue with this code? Like something e.g: a splat.

No, I am not reporting a new splat or crash on current upstream. This RFC
is a proactive polite enquiry about the design choice, together with a
proposed alternative. If you check the the cover letter it provides the
context, including reproduction of the original warning with the earlier
present-mask semantics restored and the results with the proposed fix.

Just for the context, there is also an outstanding QEMU Arm vCPU hotplug
series awaiting upstream acceptance. The distinction between a CPU being
present and being enabled has been an important part of the model we have
been explaining to the QEMU community. Changing those semantics now could
complicate that work by changing the assumptions on which the interface
and its explanation have been based.

The underlying CPU architectural requirement remains that all resources
associated with the possible vCPUs are described at boot; virtual CPU
hotplug does not dynamically add or remove those resources. The patch in
contention is not changing that assumption even now but are we changing
the contract between the ACPI and the kernel or misrepresenting what has
been discovered already?

My understanding from the earlier design discussions related to support
of the vCPU Hotplug on ARM was that toggling the present mask to represent
firmware enablement was considered and ultimately rejected. The intention
was to keep the kernel’s representation consistent with the ACPI/firmware
model: a CPU can remain present while firmware controls whether it is
enabled. The separate cpu_enabled_mask was introduced to represent that
distinction.

My concern is therefore about the compatibility implications of changing
this established, userspace-visible meaning. I cannot currently point to
a specific upper-layer consumer that breaks, but neither is it
straightforward to establish that no consumers depend on it.

Catalin also initially raised the possibility of breaking other things by
no longer marking these CPUs present in the discussion of Jinjie’s
original patch, although he subsequently proposed a present-mask change
himself:

https://lore.kernel.org/lkml/aeNxKpHzTQX4_kId@arm.com/

What I would like to understand is why changing the present-mask semantics
is preferable to using the existing enabled mask in cpuhp_smt_enable().
To me, checking eligibility at this caller appears to address the original
warning more directly while preserving the present/enabled distinction.

However, I may be missing a deeper constraint or a trade-off discussed
while I was away from this work. That is why I posted this as an RFC, and
I would appreciate understanding the reasoning.

Hope this explanation helps.

Many thanks,
Salil.
