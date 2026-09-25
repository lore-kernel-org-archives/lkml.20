Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46861388382
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351490; cv=pass; b=WMPZ6k9KQ2xCW8OhfAf4J+IAwh3p2u1ait4XUKAl0YIWtsbxt2a5LknySh1MUlVeK4SZ+07BWYmGXLhr4sC9rOuRpsT6Q9BhbqNOqcKJCbTm3221zHm5GFTvwusPOIMwpJe+vZ6RcB2fNqb84owmkDFNLAmS34ouZZihGFkJ54k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351490; c=relaxed/simple;
	bh=ksv9+eayqWXdAvP9hbPnMbA2UNu74L0hqhKX+YUYQA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APmAQZb/OqtiyDOz3Xq2CjuZwlwDJHrmB/EAf2kOk2X1XCUta3vCS1r8XOBBllGgp+mlle5husAS41UXC6qUh0yI+JD7suIctDl9Ee5ltI4EiNgqHkgc4Bgm2SgU5q+A/9Pg7J12aiSq65QewKoPOrXcq6pqX3KZlJwPUE5zuRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=o7weNjUT; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="o7weNjUT"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so25073f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351482; cv=none;
        d=google.com; s=arc-20260327;
        b=Q8Wan8uxWD8o8sQpuLKu5AB+HTl4XrsD4fVHWFdA5JDuyRakL8mwIdE0pTqvNS2r41
         qSYXtpKjbcHH+aCo70PCm6+8V5jMDWteQNmrNmg/UfWjsz4qpIlaQR+1XC8/GNyN1RlI
         MCWrQJNVidYCmMbRWcAtAQwUCYzCiY5YUmdIvtjpklicUa2f+8TQlTPCD9Bb46rYOJgN
         hodoJTWDJoJX68PnT1Izb/Gy0ZFA3g31ZEv255E4bT5syB/WEFZTH+aBOsus/rZV9onH
         cmzStEmHd5i9hrh6apetyxlnonY/Cim/d8nvdKts1aRAl2iTRZ1C8XQnHnEMiA9fH1cb
         +QKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v7p/CXRNed6Ee5EzOeUUhXw4TYzwEpF8rokaKaV5e+Q=;
        fh=q8m4jOTl4dKwkwWwdeEi7OH5KyZegCiFSqHYDJC3EP0=;
        b=DEBY9B0SdhRogLQD4TZhtrktFcsJFPfpic1CS04gNfdXCMm0xFEwt+cfVbaqalkBky
         Pn9hAe32XCS7vHErVvLCeV+4SWGV5w2iB+Wqw69ZGji2YO4dKqwIlfSLcKn0FLjiVPRH
         cbmegzojqUcjGoiBHEThPHHXDLovkSvgpab7cemxVjQSrr0SJ4Eg0RQeUAIU+o1F5wcb
         sXcV4JRP1e1Xsf52vblL2tKL3RJQNPJSpSLH/3CB7gfiw6F8ah0murffDusfdDLrQs5F
         mABGJlqY9nEh5GpFvr9tTwKcFKhsXrzLYF2QFpLdp+H6Q/wiOCRXs9UxaV5jxXzy6XSO
         Bfnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790351482; x=1790956282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7p/CXRNed6Ee5EzOeUUhXw4TYzwEpF8rokaKaV5e+Q=;
        b=o7weNjUTAPMzXLXYhFqboBmj3PpW+Pc6A8P50M6cV1Qnh05nVWMt3azGn2QEH4ZSA+
         IIDQMHbmDDgf2+FB/mTJJaAqkb7A8XAILbIDQhmWEo7Qvkt0lLG6AicfZ+T/hCUWdCey
         pLSyecvltMQZ3ao1WzyYOpXrkPjTC8GC9E74Jll/4g28GFCfPsvoNhc++XJvnWeRYvQQ
         4JFpIhMEse91bQNGyYEE+KZz2h9m+r4b0RXRmA2Gt68QK39KqSR9rF2c8AXMo1Qlv7s2
         fmVeW97NcNkaRPRY5SCZh16sFUcoZLSMiOShT69Ibse/czruRvBWtJ8WzJlxSzxdFKWL
         rEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351482; x=1790956282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7p/CXRNed6Ee5EzOeUUhXw4TYzwEpF8rokaKaV5e+Q=;
        b=BmauzbEEDuQ5XThFtsLiXaoxYPpkPPPnAsVU18zlI9Zo2MirNnB1+4Dp2yrrCG7GX4
         2YuWWybCEj+RVE4jkB7lFC2cTFCOiozGrvA9FFRw977JF3EKp0gal7Qbc4xPirYNFMOC
         DWhPENGHTN3JTnnVlaPLMGp5whGip/w/UoF+NtcMuAI0mEQRlpOnhA0s/+tEriOGSXYX
         9qjP8Mp0MgCUKNQ6iQjm5zBu1K8vsB9CY084ayXefsynJ5GnMvFdZ3WLpH/AkcP9HDAN
         vdH44Gut6rhnow2whhI36C78yAKo71LjFKTgd3DCjRqmJg4fbc3+yaM1Sxn1JsW7LDNO
         VdIA==
X-Forwarded-Encrypted: i=1; AKwUvBzh54Jmvrs8JVxSMcS3wRtsgcyQCY1BF9Mk2HwodDqpvp7Whmgv/lRJ35SiZSDVCFzJZ/dzS/QjZoMhhSs=@vger.kernel.org
X-Gm-Message-State: AFuF++ltWiMs89sBMYkF3B6wpPOg7Uo8l+cF3Z+n6f2S+UQ2qY0+fHrk
	Utn8dhY6oGFHK33TP7kxSA8nZRI4mOeYdEzqCa+576cNLH+C4OIHt6R4NrwN8Z7MKs5svJHduGt
	LhLsMGXuPrenpbfPo63L5gafb0t99uPKSVLFl53Ol2A==
X-Gm-Gg: AYBFou1mm8yeluxjGmne7IItWTFM62IxotgyGv2HwueP2bRL5kaKS/Pldw9CH2mW02c
	9BAI9O7nWyARlu7I/KsUid5on9izuAA9pnbY4N0gR0sVpiFs7YCHhCE3k/Y634bemG3lE07uRde
	dU88AROX/KSRxFyh7oWdWkWEWnSbz7LPRbXqmzkj4ZRGm2XlhChn3fnTJ8X1ofEWQ8Rcd7HVWx7
	MsxMWWTwCugPlsnHZjYh/dpiwqTqNM1jmNFp4491e6+KJnvuGlPd6xUGVU9f/4BteZmBrcrWmdc
	sELTMbFtxR/xr97nTD7EfFNFyJhb8CRWqAZCn/dTTZggxyIi1af9bQz/Q0/cFq5KXEb+pqszFvN
	aGUcbNBWyekS6C/7ft4SSrbm2Ulk17ub7oIVhZBh5Fk53fYcpK7ybt3KavnmLnQKgyzLIo/nMRs
	M=
X-Received: by 2002:a5d:5888:0:b0:488:57ad:d5c8 with SMTP id
 ffacd0b85a97d-4887171423cmr11459377f8f.3.1790351482096; Fri, 25 Sep 2026
 08:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com> <20260925151659.419512-15-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925151659.419512-15-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Sep 2026 21:21:09 +0530
X-Gm-Features: AclHuK-IHMdTsA8jz2IcBn7rlhmgx5DYTuZzwV1GUkqdkciiE-3lPooZDFeq3zM
Message-ID: <CAAhSdy2WLpd7rA0+cUi-oLgDePsZV_4zr4v8rnxp=y=RkObuCA@mail.gmail.com>
Subject: Re: [PATCH v6 14/16] RISC-V: KVM: Enable KVM_VFIO interfaces on
 RISC-V arch
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com, 
	Nutty Liu <nutty.liu@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:47=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>
> Enable KVM/VFIO support on RISC-V architecture, now that VFIO device
> assignment is available on RISC-V through VFIO_IOMMU_TYPE1, so a
> RISC-V KVM guest can be notified about VFIO-assigned devices.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

LGMT.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/kvm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index ec2cee0a39e0..49179aae9504 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -29,6 +29,7 @@ config KVM
>         select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>         select KVM_GENERIC_HARDWARE_ENABLING
>         select KVM_MMIO
> +       select KVM_VFIO
>         select VIRT_XFER_TO_GUEST_WORK
>         select SCHED_INFO
>         select GUEST_PERF_EVENTS if PERF_EVENTS
> --
> 2.43.0
>
