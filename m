Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C793793A6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788330620; cv=pass; b=pWXgOaAOpJDfSBkh9SA9gS0iCXV7T6IVwYii/CAmO8gL3fqipTIJ+ieasyUHPYCCWRseW9Pb0TYOn/FAKidY1uMmoZUhpo4sJi1Pf+fsbkXRYz3ITRa1sElDLr+53Z+WWYSsNnvrzI1ur/dHKM5pziT6BkAfcbwCylPSm08oabU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788330620; c=relaxed/simple;
	bh=hqXX916iabVWIaVT+yLpLwAMtJOlKrOokwbeDU8nU94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcfiaKvZFamrpTd1wXJzIz52hqtWj4ZKhSATlQS/ujK7jeD8Rt6Qj0JajPb4Y+Egof07ExC0Z4m3UxmQJaQXAWcoZOXEnKUkZCDtVOZRAqiOWzjO1/in2Lt1TTOID6tR6pvYGcm3oFR2fwdQFh1qHo5YisDwR4uusRwzyJrHMTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRQAafHM; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRQAafHM"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so668184a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:30:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788330619; cv=none;
        d=google.com; s=arc-20260327;
        b=bdkLqD86mO6Y4dXo5iLwr2n41xjbfOTqx16vi/NhhJavYepW+Vfkf4PvIujo8nJALY
         NsXgorzMAoPB/5iOohYcqOo1kbuVHgG7euwASi+WN4OXWnkZCkl0GYLaS1d095zRKIho
         EpoMrEFmZCS4Z+FVIcD/krQc/fiNF8pgHVpRlcN7Ev6LArUXkMOo2iZva/vDR/IaDfKU
         g7uKAAl7LzrjUyjFD5UeBbzP0a5eAZ2gHrxzsAmIsDpTLV/cexwfURZpINjEzMhCaqKY
         lxPieDn3CYuWnO7vvN5xS5Qdth77SduIJZo3PxuHHUr1dSL2YaiOjd1B20JifE0hmnVn
         RHIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uSdUTO5pFYDk/RdXIauhZ/Y8HcVVZ3tNgjyl9k6n1+k=;
        fh=4h95tKuoGn4TC/m/L1Bi4VLpj1MQcSm0guoj1cB/+UU=;
        b=FHO5lptfVqPhozjhzr/cWoufttRN7LIPHkw+7ACoHL2xBq8MoBPPbmdwhxASxLJszR
         YtNABBCij4L69rGHVzsfLFdddWwLmJ4/gB9mRyFtKO8u33PEBLZJVssXpl+LiKJnKJRU
         upngJ2zxywTO6kDSl62Ga9N0vMShl7J7fojUO4Y6coy+67Sd6acZoomVIMDj6Devec8k
         WSV1wdgD8/4KVPpXPAtOAiHqfETw0gKscz3SsD6nqfhMOW9w9Hi5O0CUDmLdAecA/qv4
         HBu0D99emEqqX49HThuXFevcxt5k323kpjaRUW/6xEywxpvwxSKZ3gGwIRr3FCaZLAQS
         0suA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330619; x=1788935419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uSdUTO5pFYDk/RdXIauhZ/Y8HcVVZ3tNgjyl9k6n1+k=;
        b=NRQAafHMwMHeuZW+gBwZKd7HuAgbAQouLRG23W77zrFaxCESS6+3k3FQxKP3Sr5RqX
         tDjNdYE14Dp+7mKHfBjo0lIOyXA6kYcaRI2p7vEd8kR/x2lilXWqHKRwUGVjf+Vmag35
         v7NYypvUGqWwmiyNu4LrhtvKPQm8hKDn4OtqKg5WnCj40TpBwlzknontBqhor4FHp/74
         41ByciO/4DYVwD24pCeNCz4EFQArYYsPF3r5kqoeSoh8eoWctKwrGDIT+3amtX4OmX1t
         AsNF703Ww6QRUpBDZ/XSPlauMIi/KZ/D4GhM67/QqBiV0HabVsVGxOtietr7iadF8cwy
         1rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330619; x=1788935419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSdUTO5pFYDk/RdXIauhZ/Y8HcVVZ3tNgjyl9k6n1+k=;
        b=X+8ueRxYCNY5iVZmEH+ViJbytkzUvY8EhZkJHo1p7pVCHKqPeXIGLERmTaGJKKqpkF
         p9BbYf24fEWUJITkSNPRbRvuClcKJ04ZXIbcWpNUuOWIKPjjdkOAxQUO+WrJ5QmZKKga
         8MJd+ZAYBWKYKxogtUlP+F9HxRTM0NRyMyr2wiw8ejmYrIv0gt2eVSZ+Zf/04gb8V37W
         8C4mLzqFrxuWTvS3/WeViX/HnVFjIwO/jAY+UiFc+S7A35e3FQ9ZyKAmpC6Myb4VLiII
         SaxYjOfE69LRMJdxb/UBW59S3Vn+70DPeWGy4984peW1xnfleQN5ZjF+PWETPX6VZ0Pi
         qs0A==
X-Forwarded-Encrypted: i=1; AKwUvBz7lfUUASQXst4WUMwv5j+PBO9EohDyuq4PRFXrgpEIN7ikRa4KiqBujZo1jkyAaB3p5lDWnaEaSK38lUI=@vger.kernel.org
X-Gm-Message-State: AFuF++n5bLxIFM7Mwh3qu8gdtCmnep+vnmLOXoDGpUqB8lBc7tDsQUCB
	pTTVnDxoPucUqBADAnMWZZ2JruFDPpFwvNHSyJOjpTf1vuCbHv3lg37nuXrZzUidGeXC07qMiqF
	kOpqzY6t0cAdLX8kkKJvyghNkV0pkYWM=
X-Gm-Gg: AYBFou111A2cd3OAqLIf6q6Qf1PRdUrmgxX7dZf6LZ+VZ6b7zsG02LVvGo0NJmUpsJL
	ZtqSuREa8Bz86DzqZa9MNXUUl8Lv/Az4CVnIriUg6kBzNZqO0QK31cniY7MIq38xWFCezp+QY/K
	ad/azuS16U1GEloGvIbTsgtarXEd9IYSz+Y3IcYBy/d/1M7E+MDfUvWtX6d0xDZptvRcjwfiaVJ
	n/HqodkGiNOC/a9BV1y/b7IL/dSX3rpShMEIjuWy7QXDDLM7UbQU8w7Ndx4q96n+1aWIXSkcGav
	B4wZ3VtTMHtc5O6DwPF+bdvCX4uSb6fkuRLNw3+YOYzBPg2iS3hjpjyV
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f996 with SMTP id
 98e67ed59e1d1-39aee1115e0mr4127538a91.21.1788330618532; Tue, 01 Sep 2026
 23:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902030127.581040-1-mhklinux@outlook.com>
In-Reply-To: <20260902030127.581040-1-mhklinux@outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Date: Wed, 2 Sep 2026 14:30:02 +0800
X-Gm-Features: AcwNN1WbeMKUAbOCq_nM3KSlOWjFb_TW0sxASOv2OLNMYayJ0082OMFXrWDXWXA
Message-ID: <CAMvTesAKMHYC36QViaUi_cw8-gSkBQyJtCd+Kt73HoDaLOkwUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] x86/hyperv: Avoid using per-cpu output page in hv_apicid_to_vp_index()
To: mhklinux@outlook.com
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org, 
	decui@microsoft.com, longli@microsoft.com, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 11:02=E2=80=AFAM Michael Kelley <mhkelley58@gmail.co=
m> wrote:
>
> hv_apicid_to_vp_index() currently uses the per-cpu hypercall input
> and output pages. This function is called when running in VTL2 and
> when running in an SEV-SNP CoCo VM with no paravisor. In the former
> case, the output page is allocated, but in the latter case it is
> not, so the hypervisor stores the output VP index in memory that has
> not been allocated by the guest.
>
> Fix this by using the input page for both input and output. The
> hypercall has very small input and output, so sharing the same
> page for both is straightforward. An alternative fix is to
> allocate the per-cpu output page when running in an SEV-SNP CoCo
> guest, but this uses significantly more memory, particularly
> with larger vCPUs counts.
>
> Fixes: 86c48271e0d6 ("x86/hyperv: Fix APIC ID and VP index confusion in h=
v_snp_boot_ap()")
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
> I'm not aware that this bug is causing any real problems because
> SEV-SNP CoCo VMs on Hyper-V are rarely, if ever, used without a
> paravisor. But it was on my list of little clean-ups to do, and
> a recent Sashiko analysis [1] flagged the issue. So the best thing
> to do is just fix it.
Reviewed-by: Tianyu Lan <tiala@microsoft.com>

>
> [1] https://lore.kernel.org/linux-hyperv/20260901171238.834601F00A3A@smtp=
.kernel.org/
>
> Changes in v2:
> * Make the new code a bit cleaner by dropping the unnecessary cast
>   to u32 *
>
>  arch/x86/hyperv/hv_init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index d5edc8530964..2a71c70d7e27 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -731,7 +731,8 @@ int hv_apicid_to_vp_index(u32 apic_id)
>         input->partition_id =3D HV_PARTITION_ID_SELF;
>         input->apic_ids[0] =3D apic_id;
>
> -       output =3D *this_cpu_ptr(hyperv_pcpu_output_arg);
> +       /* Treat input as having 2 APIC IDs so output is 64-bit aligned *=
/
> +       output =3D (void *)input + struct_size(input, apic_ids, 2);
>
>         control =3D HV_HYPERCALL_REP_COMP_1 | HVCALL_GET_VP_INDEX_FROM_AP=
IC_ID;
>         status =3D hv_do_hypercall(control, input, output);
> --
> 2.25.1
>
>


--=20
Thanks
Tianyu Lan
