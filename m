Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07042EBDE9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197593; cv=pass; b=Ol6DO9luSoHn4e2zCbAUCQmqsUv81uHFi5mJKkMWNEcpC9EK0XXQpBeXHvIwXL2e+rLxGruSMyRapp9EG+iQWkSREEfSmdmWJlu8tX8QWFyGak4wykNPRfzdysTyP4Y0afQduFMhZafvfSPpnW/o1tQCzBzWae+1AmSh5mEJSyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197593; c=relaxed/simple;
	bh=pGpH0+ouhnwwNkJU6TGm2wYa4a8DQmd3BmREAcSC/hY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIB/H7E28A7PD/25KhoISkWSQ5vIxyHuZCMzE7LRz7DJgq2Eiu7TrjQGeUFT64xTMJcHqKBt7SQyzRlwBwlghlpm8fHc3Qa3+RFbe22LvZutPySDhEjoO/TVmS0aU9kjHyl6gzFwSjG8Q4/qa/QUNmgh7Y9Rs9ZGoH3lLuz5O0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=ZsRwpwIa; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="ZsRwpwIa"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so144502f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789197590; cv=none;
        d=google.com; s=arc-20260327;
        b=aguDnbIWUMrJ94INY+KOz/fdRSA+2/jPEImLVm5K0Pl2TVDeurN1NzZtKsaOtdH+zo
         l9LuDm9eTUU9Y50o2xPEzxf2to2I8QQ5wwrw+9yfSyEOVGYKyVlPB1Myd6QClBpViV8d
         0zp1ArZTGXnrhwdIJ6x39HXY7jyVPW9BqWA6tOrIbvsIkvv5bYTnuGm2nvTiB1vjw191
         /2eupiNMNGyF8ZAiOIzSBnC7tZevCV6IENau1TPVnUq8noip4pW1PRySV3RbZarON+z+
         T0T5snkMMpemHLMZ0/YIk3MZiS5+/pyjXzc/PG0O1s/qRigTpoGRr05byIVQlSeyxjUO
         DZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        fh=Zqag0EvKdFPLCCION3hYv3fSOBdL6THA2z5za6BlceI=;
        b=rmiFvcHVET1ljWD//LC1iLT/ovd6Dtgg+r/Zyq45n3cgD+R+JL/7o2Qk9klTifsNr0
         5DfUzYyug+V96YNuC+Rz65c7GnRCBBCQsYRQSAEtyhgTob9KbZhpwUJqXqQcRXgOH+O6
         iZJnzswAzruHZ1462KJJJ4y4sx8BUQePfiHIUDJ5wRFH7hgv7bj0WD5iVrsjxrGQ2qPR
         8uHujCTycJCbLMYCET0FsG1sKjiOkHwjReRy135QY6DfMbu/t9kwN28xoEWG2Fs6zvX7
         oa4r+iCdfYBge8kRM+EgPiPwGjUwMqnojH1VfkGTJGCfLjdMHbRKStX8Zx3lw3hm6cXg
         t5Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789197590; x=1789802390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        b=ZsRwpwIa85u1zXhnKFyhmzRZJ32K7oQ82tXuZRnTAuOJFpF3e2vAs0Wsq9D4/7Bunh
         dul2WJQOWT1kDjXgbdxK9VdoErOhu9mS0b//FHbmCk3VnG3bJn10dKkc8yNHtkAX1RZR
         yFIUGW43t/1e+pKSWCR2wM0aDjIVI03mtIOc9B9fbw0b7oLZJwUYuDgoIuPShlV6S3TB
         8vYO/wfDkUoCWc45Io7S9EiPSWM4QCOmoQV7a3HHiWKB1Ns77iyclvjMcUyqzQmHYVcD
         XKaknhxaBZnBW9ocUQPJD+qJDUPMD+tcc/tBuCIXU6t5dOJJ64qdsFyZS6ttaWQmYLBf
         Y4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197590; x=1789802390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RWV49ckuigD55nYwZZoBmV/ryAALoCGfcRf1WteUKA=;
        b=MuH8Akym1faJTVrce/vgYNu65bmd634bgTPphNcf612aJ06LU4KypNaiiRZ3Gmzl4l
         8twW0POtM8mYjXLMRpC5c0IjO913T37rNWRkPkw6DIb23AZdvJ/r2sruQSjgwQcSEsXy
         wBnYPVabVHxLj2M0Uky69Attd4R7EUIqOS+pDxPy9VKqWGiyXvnHywXVd62NP8MyQXxp
         TpXdkNC4tM0ctduPkLizWOx3pITWTrH3pvEm59axt+Tsbvy+0c0hiJ5zSDoY5TPHfkJ/
         mp3tZ+uEwFezCSDZR4T+9o9ERHZGtWUCMpsOkM7dcTn6qnZx7EsWgeI5YlXoVdvQQATX
         bxbQ==
X-Forwarded-Encrypted: i=1; AKwUvByi8amRFvKVtC2JDYO06mnStKV6BI6IwboScyQ6ZPP9qsbVihmKH/HebM0oV49u7c+X2XGj+5NTquXZoeA=@vger.kernel.org
X-Gm-Message-State: AFuF++kJyfywEVUj/C+M2i5eTFMD7Dmj/fa3GtTAzw6GpoVXfACX4t71
	CBtHBJrzEjbeilyAt8tQcpE33ShbRDRHUA/Pi5TUJvfEB6nh+rNnMsd+S9ZNAwN1vNymS74uRUi
	r+ePcQ9SmOBxZ82+6d1vJ7REz9bTCifRml6qY9g9Nzg==
X-Gm-Gg: AYBFou3iPxeJKV2ekkt9yz4LtjaYW3Hu1oi02/Ipyezqxe8e6XDy/M0LvyXksflZwWX
	YadHU+UrPWTfCS+5puvDU/ufgsptAQXlky2I+jFsx2DMCTa3p/QirEigne3QPop6JEzuX1ij7uD
	kC/Of+r8Ed7LSTQVivTIw3JSDJOVjtn6OZR9AjbqB3yH9SduXFyI99eVqthcNuSROgHz/4a9b6+
	EZ/BIH5fhK+bBbDWrxyVLGHJUliwM4ZZsSICIpzif3TsKkV6QX5W2KqXijNd8tFOB+3INK04C00
	6druov0/dGmVi6+Wkb+mxWIgVmjNKoGigY92eu26JXtMAJ2m80tUiPZSpYZn1N2a1n/Mq5+x/wg
	gkrd+wclNdnBt9NzY2uGCiDvjZOVJueuWS5S38BxILEKbpoEQxaJwu5GdePyT85DIgDDQmQN2TT
	M=
X-Received: by 2002:a05:6000:702:b0:486:f600:8e6b with SMTP id
 ffacd0b85a97d-486f6be9493mr1750445f8f.14.1789197589863; Sat, 12 Sep 2026
 00:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826064117.58029-1-min_halo@163.com>
In-Reply-To: <20260826064117.58029-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Sep 2026 12:49:37 +0530
X-Gm-Features: AcwNN1WADS_UyMRbl-o6HEs2JIz2PBNtpUz7lA9SsGRbmoy5E-S50JL4uCJxHNQ
Message-ID: <CAAhSdy1AugX4AiU6xj1R3SQ9bRsRFBNu6=_aYM=G9SMkXN8Ghg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix sdata leak and stale snapshot_addr in snapshot_set_shmem
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zongmin Zhou <zhouzongmin@kylinos.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 12:11=E2=80=AFPM Zongmin Zhou <min_halo@163.com> wr=
ote:
>
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>
> A guest may call SBI_PMU_SNAPSHOT_SET_SHMEM repeatedly. Each call
> overwrites kvpmu->sdata without freeing the old buffer (memory leak),
> and if a later kvm_vcpu_write_guest() fails, the error path frees
> sdata but leaves snapshot_addr stale. A subsequent
> SBI_PMU_COUNTER_START then passes the INVALID_GPA check and crashes
> the host with a NULL buffer in kvm_vcpu_read_guest().
>
> Fix this by clearing the previously installed snapshot area before
> installing a new one, which keeps sdata and snapshot_addr consistent.
> The SBI spec suggests a single invocation but defines no error code
> for repeated calls, so KVM must tolerate them.
>
> Fixes: c2f41ddbcdd756 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch as fix for Linux-7.3-rcX

Thanks,
Anup


> ---
>  arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index 752f1014d633e7d67f69c27b72088ed560c187ac..14f73490f12cbc5a8547859f0=
d1bb1170d89403b 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -454,6 +454,14 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm=
_vcpu *vcpu, unsigned long s
>                 }
>         }
>
> +       /*
> +        * Clear any previously installed snapshot area to avoid leaking
> +        * the old sdata and to keep sdata/snapshot_addr consistent if
> +        * the re-install fails below.
> +        */
> +       if (kvpmu->snapshot_addr !=3D INVALID_GPA)
> +               kvm_pmu_clear_snapshot_area(vcpu);
> +
>         kvpmu->sdata =3D kzalloc(snapshot_area_size, GFP_ATOMIC | __GFP_A=
CCOUNT);
>         if (!kvpmu->sdata) {
>                 sbiret =3D SBI_ERR_FAILURE;
> --
> 2.34.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
>
