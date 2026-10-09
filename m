Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73332E54D1
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541632; cv=pass; b=e3s4NUa/31IA48evYyx28OlAkiY6cSetHwnidzyvlhzXDEP4alrs1bO6TYxoYAeIgEfaOAdEv4Xb5acwQn+vdudMW9TAEEP7ZWv89d4ukPT9lAvJJ7RUqy71fuc5Bsl49fmo/wY8E4Ra7/C/iHLp3pIdHzk3Yt6Poh7xQOFLxco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541632; c=relaxed/simple;
	bh=BdaaMK+iBtICxCq6a9i0L30gyCEkbvIoF4KCFr8YBlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CooiHBrJrJfsfJwxitzjH1bQa2LCdsiT9Zl4iPFkjdKaneb4r2jRqNFQv3+NvbSQnDMu9aq3rnHGoHF0HY+qvhhGf84SWqgkTjIaLALNHojekdL39K5loIHGrZndkMw+/o2BZdvYYUx7PGJqie4CMI94t1PKEDYgZidZ/MMMYoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=IaOgcPCs; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="IaOgcPCs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so71121365e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791541629; cv=none;
        d=google.com; s=arc-20260327;
        b=CNTkMsffAuQV7H2BLeU6YaI4ZRi9y9ekVQU3Cx/LyVTCIppf7khv5VXJ1zY1QIfzyx
         Hq6BO47ZCICnuZv/ea829AipxTGO7cSOYQGMwcIRkyeKIXxPg9AII33J+5J50XQxBdIS
         jj5reslYKp3goDEruHtsFMQSd7404GP2c55vk/S4WjyNx7Jum5SHfYz3k35MWIEfpudm
         YBzEGE+SzH6fYkOX5AKk7LePwtY64G6M0YZwI5GYSNKY56R4aSMjIkn1Odn5PLRfebN5
         62TKoEZ2/EbkEwC8mOhhfpz3T/tFuI+aa14VhYWIlR2WyWly8SGExHKFvxK/Gs2Y3A/h
         fWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        fh=nDBqO33zyEyGMCGQfTMgLGpiZz8LB0nI9jjWQNEFYzA=;
        b=kjSbii/GTgnVLDhdR1SI3uGZ3Z30bvHQS3VVa0UDwOmXVxJIGoTRFGEF6si9vEVLL+
         GshKuzfzC4v0VWt2Z9oaLI44k4Wt//lz+KbCbVW3HaRbKQxplKCx1n2/Z+ImxIJsDibX
         sMIyETruIZKQXrAywmqeACOsZy2U6hArtrgcnvKwaBLWRZTJAsHY1qL/eLPFb1/mvLBq
         Iy8dL7zaq3X7FaG1f5MgO3srzse3TmF49wIn1/Pp7sE37iv/3Fv7/mWnQjIHWRgqzLfk
         JeI2YT12gkI9gjqwDoV2gHkBQ14jhKB/cFFNqNg0rZqznSNwgLf8UlFSBeRuruwsPUnG
         +j4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791541629; x=1792146429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        b=IaOgcPCsn+vt4J42WgryTbeTglVzrjtfbuljPdJ5t5bRPFFTesmrCBjKhFH0xiCoQq
         ANS4+/JcNJmWkF5jzBr82mv86Rk6wO53BLkg/OT++17hcMNneWiY56YnyBKnbTRxbXNL
         UUw9oP8hzJNLXAcDT2D9v3KSiUFNPW0R2WYGkYEAWhVzveodVX3K8VfC/1JH076u4bWb
         ATBVINcXZLev3i8xz9qKcXwVcOPOLFIV7Zu2Qi9CKYrzUz6FDKbBSW6AmOUUjJYZ/fk5
         UMmAHsJuuuqj8cX5i8VbJKiYUI9fgWd69L4arhrVggbjfkmMa5vU7df92CdOlwJ5yBkN
         V7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541629; x=1792146429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kGfL6IKmzWaR6v/xkH3Bv8Esmb1CJCtQQioJT43pkY=;
        b=GQwkWAVP50Jy8CNDvOncmO9ADwKnQUwh4nV4HaPo6p9TkLe++f+K0T2PiIXe9kEvq4
         Kd5f5yG7CHHfy4Z55iQFeSKz8fbhpEnH5O2Bfw9bs3ApggSHiW6e82idoZm1QSALa8Z+
         WATFvIU3LsNx5JWOF2OU0SAXgB8YLnqKxxnZG5oLdLEbGERQVPkbhhJFzDgLthsRveB/
         KA6qnlHrEqJzv4BczH06Yup1UXUoN9nnhgbpJHjIT3BST6x9koshWU2EHscZ7C8PDuzs
         29pXqqGsThfgDb8YlkvVakcuq4pu6kmuhwoVJjIMWA5Uhv2T2G3UsTx4Fxz8mvTFZIyD
         8gZA==
X-Forwarded-Encrypted: i=1; AKwUvBxiMb/oKmINepMrj8woicH6j52ov+OidKxxqYcOBxAMXNomWhFdb2qij1djGeYumTNX2++CNpBmlJEjXnk=@vger.kernel.org
X-Gm-Message-State: AFuF++l+Y1Qx/sS8aa3dQ4XG67x7y/3dYp3BuUbtzoZ8UQMCiOLvNBEU
	1pVMk0jcgiH4Aa3nwh1Nw2xhCiVGj9gm2UKJN3hwOybVI6gw0HSbtoaAO1B3EImllYNbekF+n/m
	QoQGm3jYFdaljs7Yw/GDeHGeOW4EI+nkf8FkK3alsK7D3HJjpaN7EYKXH9wJuenw=
X-Gm-Gg: AYBFou10EsbAwVuV0fEJRT4DQK1vL8RAtgbkYwRpXMeiF/SL3cd/cp4ZAH+No4D/9IF
	+1KzER2atwz5s+ZEzHYNtJI0omgUIdzWsX1IsRXGRiBYKEpEyPt4cFa5mE7eeGXb5ErvFqomkk6
	fFZ+aI6fXnk0XmanumUSLCE2Mw96sYmhg7QY6C2mNUM/WmxkVYSBk0MQHlQM9YeaXPZl/EUQH1c
	tdCp8ZWLlZWR6ae9/33p+ELSc1DsgUhWD2/9Gq+z6DKtZGBAT/mpJpN1PH7JH6RVZx6j0eVyhaN
	RVJHv9pabPulh5yKGdgfF+vvTYGMNbHzlglh4Fg3Q5aRjhoZnbp21IKsXtWthQNpW95hbCsxr5A
	WVozMCp4K/+Y7RoNpwvtQta0/vtdDDrrWZIhLwwL3zF5N0ZMeI6CGouupxDesTvSBxk1Fr1QS1w
	==
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id
 5b1f17b1804b1-4a18e4a5355mr31129155e9.10.1791541629095; Fri, 09 Oct 2026
 03:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925160300.467884-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925160300.467884-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 12:26:57 +0200
X-Gm-Features: AclHuK-pEq92e8PF3NtgM83whKL9xC8DLhFEcuppkWWmzGxqa0y5mveDAWbf6kU
Message-ID: <CAAhSdy2xu2MAKwOfPNRPG68XbtQsa-CT66phvTZe_XD_3Rk3Qg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Reject vCPU creation after AIA initialization
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 6:03=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> AIA initialization sets up per-vCPU IMSIC state by iterating over all
> online vCPUs. Creating another vCPU afterwards leaves it without
> initialized IMSIC state, but KVM currently permits that sequence.
>
> Reject KVM_CREATE_VCPU once AIA initialization succeeds. Both paths are
> serialized by kvm->lock, so checking the initialized state from
> kvm_arch_vcpu_precreate() freezes the vCPU set used by AIA.
>
> Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irq=
chip")
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e062ca19f9d8..ccf2def834f1 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -138,6 +138,9 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcp=
u, bool kvm_sbi_reset)
>
>  int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
>  {
> +       if (kvm_riscv_aia_initialized(kvm))
> +               return -EBUSY;
> +
>         return 0;
>  }
>
> --
> 2.43.0
>
