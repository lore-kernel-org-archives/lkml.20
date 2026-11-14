Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633362;
	b=XvCZyoDyOHj74T4VqkG1N7obhDelWk06AR6LDJoQTbXRuMEdZPmQvlsuNdvVPKTIPDeT
	 pba0ZKMVw6AB//j3wSh3S/k0LL48B15HNCgQ6IZvXTcv5kqRNivStnlVJNK40t0ss1L7T
	 dAGTY0EuplkBO3mmZQhxWIE4tp2QdOcBGgNm1uL2rLji8XyyZbKVX9huYS9GCaw3olLI2
	 N3QJeXZPBjBo6vm2Ybqw5zFLqTq1ABDUt36soKiigcY3LYrMPttqdEc6q4PWcY+4VqOx6
	 YZoL5Q3GnXE0sMy4A2wbE11oCw3AiEfFWiLC90aQ9w5Xf6dSk6Ssn4vFQiF9WQVCP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=auEFv6Wzik355jOg4Z+xLlNi2IgivCMaU5F0Bxyhp6c=;
	b=KCdpWeC+nP/v7ZFNx6By2ZNyjcafZ5U7WHwfdxbZwHaa06SC5wJrbYbua3Okr1673wmM
	 Kpt40JmZ2ZtghhT7Grc73m+aAaowF7cddO79CAOkvGQ5LSU4x2ItPYg0Yyx4Tsc4tfhaK
	 N6l3IYMcB+GKx43zKWTqZV9G9oRdd+g4BoIAXUxaojCy+cTyqvamaiCFqtkuENoED8vtX
	 2vutVwQEeGZ5R5jZmD7tQQevIBKEoqTQ2V9CZeRoXaJB8kkOEoWbgJZKhHqD3VJ2XNV7W
	 K13At3RoPX04UiUoVAr8ivi42DMnoLbYSWeSHHSd4am8jbFRS1jfrcw2yyHZiDwZJ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXbCIBhZ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEB2606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EEB2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXbCIBhZ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3ada81853so1608719c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794633361; x=1795238161; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=auEFv6Wzik355jOg4Z+xLlNi2IgivCMaU5F0Bxyhp6c=;
        b=nXbCIBhZ/+y2acV660OI/PBRYoTZxZi1azBk0HqMU2YkaJ+Xd7pkgHLjXCsTeh3Ws2
         HkjTxFqQhWodc4Rhy4oxaSNX1jJg8i6eg+e4xz2FCGSXoRIbGHGZWYMx7nMI7XCM7pfS
         AKKOGhzIh6OAcFfKJMh/fJPUyIaRL/r6brwHwvSvV41Wo7IK9MO+maSH/ljOoZroQdTb
         8nqr+/bDnOTNo/031ejF05lJw9gtmlU1CgvODWrG4f904iKS4yV9JxngLlzaybPkvGew
         9hmnoF7oZNDBECT+kw+CKAq2FODXvUylMdjr58t+1vmhYuaTooDJpsWuJIwLTt77GOjF
         5wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794633361; x=1795238161;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auEFv6Wzik355jOg4Z+xLlNi2IgivCMaU5F0Bxyhp6c=;
        b=sAyv99Imj6Nn99rUuO2F53cSt1xlnuuVF9ALGiPKPAHOfCOyuJjvF2xx5bOBFEcWVK
         9sfHmkKcUGb1yVbK6kXN89vWBWa3YbrwL8Fm7LHjXV0s10VHEeiKdT0Ru2olGr63Liej
         yTLhHUTX+HCWIrEMvb+k4L63oqn1Cf+f1DwF55vBCzGmQTuJeZD4r9XIR1VvpjCv208Q
         g3+yLuzkaD07c2whsKNTlq7Lqpgoxznxr29nvrbuMoT7fDQiturR5tqZFhVCyjwGZd0v
         Btf2Y4i2tm2fHijupS/piuSFPcs9Q1bOhWsXpEG3u1wU7eBuV9Ne7CFrTKJvCEjIVwOs
         IZCQ==
X-Forwarded-Encrypted: i=1; AL+hErHYmltnOuq2OHY9s2q2PPyAocEvv5rR2HlSXPR+JTHEx2SghyQvyfkez9HnxU8Mengy2rJ0yDEKwA9ORcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iHKrsjShciu5QovshHAyUMrcDA38EWPdSISGbNxZ5k9ZPOrCi
	hesfgajNg/0/G/xQxrkflDeHyMMh9nftLSRK9FNifIeJ+phaKhKFFfCC
X-Gm-Gg: AYBFou00y4qBdbp27+rA+9S7P2FvvAlRwVDvGbOeGLWh8pL2rx52mtMGKs1cnzhIymB
	0zSCevmJeq7h5k6LDhBdngOs+cUJfl0LgZiwo3mYaWsmDtPzhSykw/GkTdNS6Rmlm8qCNIHbADP
	HyJHB52inSbOxTFPW0aTPL5a+fgPbauvSTpSNvRCcCRjfJmJQ2HBWeGd2fdXW2cAIWm8U2b0wYy
	m682OM5ftLL7/wJ2ADQY+mMu4syA3tqEbQRxRqSf3coXD5xRbRT9iYdsGd1Mn1hAtNtupNrzxz1
	9+3b0crUfcNKn32+P3PUhU7JQC4JQTRZYqOpw1GLjyED0WKIfDXNYIGgsOqFXHVWkoV7jtc6pu4
	MKQAU/AGXfk+KGV6MSKYJQje1ehXH2rS0gWQ3Zndd26EWLRIacYnejnk1nKXCXLarVI2duh6MUV
	j/BIIgd0EIGkfFa41hnJEbIdTWf1GdL8sSK3fCTs9nBc8OBS7/e4KejVdSY+ebncwlSpKHUnbhh
	hSdyZvRB2IbHemdqkQveWFejIit6mGofAC9pq18q8ZF+JOdJnYH+O35xIH7yjbrU1T0GsdLpU/Y
	0MEyUzA4Y3Y8vBGzO4rLuX0ujXA=
X-Received: by 2002:a05:7022:92a:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b5030e9a6emr6381022c88.11.1794633360987;
        Fri, 13 Nov 2026 21:16:00 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm14545581c88.5.2026.11.13.21.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:15:59 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: Re: [PATCH v3 2/3] KVM: PPC: BookE: Load FP and Altivec before enabling the interrupts
In-Reply-To: <20261112130913.4124175-3-sshegde@linux.ibm.com>
Date: Sat, 14 Nov 2026 10:42:32 +0530
Message-ID: <h5hk808v.ritesh.list@gmail.com>
References: <20261112130913.4124175-1-sshegde@linux.ibm.com> <20261112130913.4124175-3-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> Christian reported that booting preemptible kernel on FSL Cyrus+ board
> causes boot hang.
>
> The logs pointed that system was busy in printing below warning.
>
> WARNING: at .enable_kernel_fp+0x30/0x78, CPU#3: qemu-system-ppc/4884
> Modules linked in:
> CPU: 3 UID: 1000 PID: 4884 Comm: qemu-system-ppc Not tainted 7.3.0-rc1-powerpc64-smp-preempt #1 PREEMPT
> NIP [c000000000003338] .enable_kernel_fp+0x30/0x78
> LR [c00000000005de84] .kvmppc_load_guest_fp+0x30/0x80
> Call Trace:
> [c000000085ca7700] [c00000000005de84] .kvmppc_load_guest_fp+0x30/0x80
> [c000000085ca7780] [c00000000005f2a0] .kvmppc_handle_exit+0x5bc/0x5cc
> [c000000085ca7830] [c00000000006204c] .kvmppc_resume_host+0xb8/0x10c
>
> Which is...
>
> void enable_kernel_fp(void)
> {
>         unsigned long cpumsr;
>         WARN_ON(preemptible());
>
> And...
>
> Though irq's are hard disabled after kvmppc_prepare_to_enter, but
> kvmppc_fix_ee_before_entry enables the softmask's IRQ state.
> That causes the irqs_disabled to return false.
> Hence leading to the warnings.
>
> Fix it by re-ordering the code to load the FP and Altivec
> before enabling the softmask IRQ state.
>
> Suggested-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> Fixes: 3efc7da61f6c ("KVM: PPC: Book3E: Increase FPU laziness")
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Closes: https://lore.kernel.org/all/33342fbf-eb7b-bde6-2c8c-254fe8bfb993@xenosoft.de/
> Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/kvm/booke.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

LGTM. So, please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

