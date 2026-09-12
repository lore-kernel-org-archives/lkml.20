Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C51E8332
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789174392; cv=pass; b=uRr1akuBuygH51ux7JXhHDYw2muiP4FgwMjYVd7b1XiaK5ntRl2j2klE6t1RICVWj88TXi36Cg6QTzu+h/xNs3QKBOddTl9MYyP6fd4xO2/KiNX4F2EmEI+lpcW8QtFn47CZqQEe4H7WMQzW9AatvHen5+xJSXDHWnHupJmLdzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789174392; c=relaxed/simple;
	bh=CQQ5uxI5LJywT10nnwzEUlbjvcuF9cqEPowouB9NJYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGdvfhj02Aljm7uMUOvuQWUaaoYB6X3LeEY3W0uoKLuxpWUNjrt9NjJekihzxWl7zq9VA8tT4MNYhN3ao630ETzhG2o7WKhZtAmx1Hf4Qy03rOouFu5XdVPdvAeYardIBugM5qy5BD75XxCRSdpUWioPb3mGD2mMR9znU8gfqKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6nXHCLg; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6nXHCLg"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2940d16190so224142666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789174389; cv=none;
        d=google.com; s=arc-20260327;
        b=PIhA3/wgXUyMU5kTNCF+CxIvLYp8EWoja2le6m0AxoHUHiBAXgXkw8IeIGYp01meIR
         TG+cli1EC2uhNtNVzVa4JxNFa6AJkWKMVAaLsn5vPwgazuuBkNXtBKyNXp0ia1KUh0Zc
         MLu1rDO6cOn95eQ9CrRBLjatn2oXd967i2UJf0Fcx4lSwF+iZ3mIfm+FOtMN6B7o5OOu
         ExAA24J2VV4nQlnh5TftyyvWPuaab4JA3C40B4R92rtLfkBFYdHlW/frDniR4rqFVGCJ
         SHm4tD1jnlNaitNd8wo9uH0jqZhWf2Cc67n1+UlTxEoC4NxfRfr21KGvVcgARZ34AtG4
         6V0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CQQ5uxI5LJywT10nnwzEUlbjvcuF9cqEPowouB9NJYM=;
        fh=QBKr/J7y5EHz0OCZIQgIBf7SRIdrRSM1ceKFJ6tLdSY=;
        b=IeCpKMYO4HsDmQ9Hyz27FFp2CNoL9u8boBuC6Jn/+bTwzukgdCvBe1R6VkY/Kpn6Sk
         koByeCYcyrF2DvvtrGtE1zCCPBDn8Y36qv/JYbbtDXi0XmEhwwUr8DVrON+2IcnSxrIh
         ITbZ/RIrTlDoL2X4qVmEZUsQQePxfnKghATkeo58MTES1xenIOajJeCr/d0uBXtXXwAT
         EOfJ4B646hoTnD5W/4OLXdg3aR7SE6iFvi+G2Cj2Vj78BK5dMB6kPdVIXfSMn+Bin3nZ
         LwGCE3DyVCV4qk1FFsEFAUXGX2/5pJrFDyNbQ2to8R24BIORSPVuUbCd5Ipo3AFrTmtK
         NcYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789174389; x=1789779189; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQQ5uxI5LJywT10nnwzEUlbjvcuF9cqEPowouB9NJYM=;
        b=M6nXHCLgKnJz4RWXriSUPlzYrFaCIph0CapgEoDCVGumdGLXCy9dHgs5YIpz74mfrg
         b+yNKGpNJgLcRRtb8vi2BC215CfpFuabnyscg/ZCKSw1subIrni867Q56obS505FXtyO
         yXU/+XqdNsqHNL38TCFRE55ZF4DCGaLHPPBx2E2zKYInrcfNywFh1EBu4axQ32QmgTF8
         8gCJRwnwS2Qt/Pud4RFTXgZzCC7nF+EoJEXXA2TApZy0MCE0TfnJm87VbZo2fysfA7IV
         BZ3pjLWYGxHc727jFJRM3UC2twiFfjTaszCR35Gw4CHV05K+tlL9UQutozGzEFuWHhJf
         kA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789174389; x=1789779189;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CQQ5uxI5LJywT10nnwzEUlbjvcuF9cqEPowouB9NJYM=;
        b=AhPyXe5/WYV2OJvaxT+Z4RwmXhurHI8gncaMYd4IYKiAVfL+yvxrsz6nSHPOxcjbX7
         MMdGm1b0pquF33y4maWDaPjlzi+RQ2DUZn5obq1eV4TVWaGRfyypRGaW9YPnjPMjNIng
         iIe74kZDeP3J3qiFfULUn8L/1WcLAJ+8eJy4W+1ItOHeG1/Ilq+yl094Ams5i8RObb3g
         6dwpEcL2eOgTJ25OgHEhTMrhFoVu1n8OWYUNOzTkqI5bCdr7IcfTNGd9If6o3Asc/se1
         FIybHIM5T0xFUJ6mXAbBd60codhK5DszPFB0jUOIfNPMAIR+/CqZZOpA3Hu2tlSqs4u9
         +K7g==
X-Forwarded-Encrypted: i=1; AKwUvByZMh0MkFfl1c1WF6zFp2SAW6LTBukCdHvqXFfqhj8m6Ssf7Go7VHQPfvkqWPlmTniytnQiyIkpQH0Zv+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nKGVrMyPdca3B2ktiFfwsotfyVN7lf7V3ElSZw39DOyucIMv8a
	R6UQ42+wHyFxFEoaoB+hvru8b0uZ7y2Ldz3JOKlOpuDC/JXZJ8VqkbBoWZwxOLsLXyaT15Tfy+i
	w3jeLhmaXYvG7Fy6x7kmLiVW2Zs7CrgLt0mHR
X-Gm-Gg: AYBFou0PwxpSKu/l4bs1okdCPKdnbgLi9jKJYC+AFXZmuNleEps/WeK0/j2ihxDqwyh
	2i12bxL4Lc7E4FJtNKDUoS09DC04hSeybuBlbfduVgysQDYjEaT8pvLzrE27629dThf1lijruW4
	2+wk59HqghL8SRMWtW/8ZHi5UJ4lI4melqM43Mq80NSR7bkfQvEoGe2b/gxXpCG9qVf1+90nIsE
	MQ+Nc3VDcoEOUsLg789U+cA1h99dluTExQ7CTkOAdt4/LyEmfBu9ce1WD/TYo7YTPYt3I79o6xF
	ZZj9SboQ7lJJ1Po8EEtfo7l9nltncbMaMSxBqJBknyTPbyUb4lMYuAPB/hCW/+7Z
X-Received: by 2002:a17:907:8b91:b0:c28:f9e4:836c with SMTP id
 a640c23a62f3a-c2966746c86mr293173366b.28.1789174388992; Fri, 11 Sep 2026
 17:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911213340.3767930-3-main.kalliope@gmail.com> <c440fa97680eae9966579d51586c2e6b9936bfc3157225269166e1c133515f8c@mail.kernel.org>
In-Reply-To: <c440fa97680eae9966579d51586c2e6b9936bfc3157225269166e1c133515f8c@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 11 Sep 2026 20:52:57 -0400
X-Gm-Features: AcwNN1Ur_WOJSfWbT1nTjTcNVZl3abwhTBIueEcresXiT5wFs3FL9dx_llrHL2k
Message-ID: <CAJZwKkgKjSOsHADdupd8cFdyUXKQeVzNmwLyX0jDorru1p1W7A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/3] MIPS: uasm: Add signed div/mod and
 sign-extension emitters
To: bot+bpf-ci@kernel.org
Cc: tsbogend@alpha.franken.de, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	johan.almbladh@anyfinetworks.com, paulburton@kernel.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, philmd@oss.qualcomm.com, 
	martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

> This isn't a bug, but would it read better to add the SEB and SEH emitters
> together with their first caller in the BPF_MOVSX series?

I grouped the native-MIPS uasm additions for SDIV/SMOD and MOVSX in one
preparatory patch, with instruction selection handled by their respective
JIT changes. MOVSX v3 will declare this series as a dependency. Keeping
SEB/SEH with their first callers would also be a valid split.

Until those callers arrive, the emitters are unused. Their definitions
do not generate instructions, and the existing opcode encodings are
preserved.

> and CONFIG_CPU_MICROMIPS kernels would hit build_insn()'s panic for them
> since arch/mips/mm/uasm-micromips.c isn't updated with their encodings.

That requires a microMIPS caller. Neither this series nor the existing
kernel code calls these emitters, and the planned MOVSX callers cannot
be built for microMIPS: MIPS only selects HAVE_EBPF_JIT when
!CPU_MICROMIPS.

I checked this on the posted v4: olddefconfig removes the attempted BPF
JIT settings with CPU_MICROMIPS enabled, and the microMIPS uasm object
builds successfully. Compiled-table comparisons also confirm that every
existing native and microMIPS opcode entry is preserved.

I also ran test_bpf on the official base and standalone v4, without
MOVSX, under QEMU Malta on little-endian MIPS32 R2 and MIPS64 R2.
Both showed exactly 14 signed DIV/MOD failures becoming passes, with
no other test-status changes.

Nicholas
