Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF1D383982
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 21:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791323854; cv=pass; b=EynLJgJ45G/GYRzTKhiy1S8DMuP7XuTtRhmooVe4sTBrFZ9SNP1U4TFM1k+cTPkyPZ5GHKunTkI1USbPztJ7V0R3Io8CZ5cwTQsQC0bkwYOpwJ3qc94eWnMt4nLBshaIW/vT5+/PErqnJpMNyXsibxU6JIiPJhhtJXb1TXbESBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791323854; c=relaxed/simple;
	bh=e08EuhQW7pzOcYaJ548JslB8xHm80aFdGtESM8ZlF58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJND4MWr+ZEKqXXpMefsKOALM/JcdNULPpp85sb+/M8VfcxN8w1571/VVVnK5X4RknsF4v/tuhA4aSyLErgHdHEOfn0rLEErreKfLnUwsSeEPf509mjlcwXQISyHxK1Hv+R/12wfKetEGUFcxDXKv7Ojd1oKKqjc04j5DZfzOWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eQ9705hJ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eQ9705hJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2597a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 14:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791323851; cv=none;
        d=google.com; s=arc-20260327;
        b=YE33NAHtpFM85FEJiz/iipZLR2hnYsmppN/CGh7xRR8pg233Dsr0ccfsahsTB3X5yk
         1H9Py50mDoZrh2CPaHX6dEljZX201hJjjlYZ4bzonUif9ZBmwVfH9JZPWxZl6ZrfG5Pg
         q2YaaFVji8Jq3T2EbeNSFj5z264kLeioiozpvJY1BxmdUJIaG2wkAUn9Idf1fgnu3uKH
         BjfMNssKhlVobTvSTN/PKKtNFOGDjvbUGI0+awVJtwMPO8qaRmkYopZEd0LuHL6r+RcF
         NAPD8/9csmm9gNg3AMfzagdOLHuOEokSrm7FWdQ53TZieNRR3xtFr7StH2gPFdux0azN
         QAAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jCcwO2LV+Ld2g/yJwpkwAsvl8IfvNX1pMTCUsDf1qHM=;
        fh=+xHT4Qo/L5epSoE5WZu11zSbfRMoIGgAXmtCWxVBdVM=;
        b=d0P1jb4hrnEuSM1exvr8kMm5Jd1i+J0wpN5j/qix0RQVn7jvps7+JirQJkr+jucAtW
         +XJq2FivCFrPCv7oXhbbyzPCy3GqVhbazkRRQr16mnS0vN72f+jkztOPnGjscQbPAOYb
         8Q6ADZc3pOfrFt5hz0htevaC2x69S1APMU7fo/ApdSsqyGTAWNxnxDODOlVlWq0e5P6y
         o8wPa+/BxwPqGPk7+GJN5S7m/WoG8RuH2HoUccwRGPk1DsBLgsiCU0ap6eSVzrpMlkSA
         v9ZsDcl2pFUeMmYt65eeonF658eyktvYZSX0FlVv4xzsYOB3c9Nod8WOK1IGinEFwBng
         4J+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791323851; x=1791928651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jCcwO2LV+Ld2g/yJwpkwAsvl8IfvNX1pMTCUsDf1qHM=;
        b=eQ9705hJAkE7ySDjuMQAyrAM3oqMnmZob82tt6Su8LCyND5r7Of+mlg5t7UlzWAyAt
         rxrXLzYFGo+RE2/CYR6kmq815soMeIPdikAFtcRUxwK13uE39prHgnjiiwFrs1UtkIPU
         e3GMM/Qr4ZxNkrB0mrUfbNzd97eM8rlA1XKmkF59iCaSk4KhzLNGxkcjF+QvhQRnMz1k
         SDyKyP1Fs3C4bzG8KuC/pXNVabUFH0z1YUl4RjOzca1WXOAXdc9MoAgea/CBsAjOlrEL
         BfiZE1/YlLcYIRfyNsDjojJbq1AZiA1Rx5xAhec8f+MLa5J+HHTZJsHzMrzjZ4hcFJKK
         WUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791323851; x=1791928651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCcwO2LV+Ld2g/yJwpkwAsvl8IfvNX1pMTCUsDf1qHM=;
        b=R+vmNYNzM5SbmPqmfp/gDAOQhZ6m8AeqkLlWTPu3vbxnjHXxkP55o5C1ah4rz2VmqI
         tmXQoLAyteOCzyNtO0jq+c65MPXY1fe5NEUPY2FLBwwRcG1kficrGEr/xJKWx88Nrcmz
         SD9YzEoavPKfRYcv6WfCkrwEWPvZqd75mqmUD+H+7EaStLWRS9MwKoFs2A4zT4gI/DGx
         FwstpsMvnh4OGDrXlIEmzT9um/sk4sjXxhv5geNAOLz7lfL/n9QARQJd8+1F92z1Grib
         nzCfoE9HOn8sI+u/w2Vija1B8SMdAMBOduF1jFfL1JagnnbBpi3tDDttCtiW3svdVozg
         sH9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzHpMafN1N5TtnqMh4gvhZ4HrkcKTt8F+hfA6ckKjo4QWEm5y6pdBnlkX0NkG0VS6EG9ZAjbRrW7nvfbQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp4XOPV2C7IoAMbz9N06PFXKfHPP80szZRTuI88DdpPS8VMQ0S
	LVy8mjMFOfE8xzYMt7jOn+qcCPtkATwAQ3lJOQb/cBJoTqM4XN5FzP9z4MVZQ0UEtNQlABCMlVp
	s9ahNRZSc+MGjxwro9Why2p1J3caNjv4FwAlQglmW
X-Gm-Gg: AYBFou1YhbhCGA9V1omzCWUxBe62YoAewU5QH8f6IHoS0pB2B9b7zhZcRvkQPMxKlL3
	u+8doK9eC2CvONBZaItCIYtbsSSUtlhOlFRuB8QLdfaAG7PWYrlKlBD4mM9AjQQDjA+hIYGJiOQ
	ifyVOJ53qgthBsoHySZWreGai6kl0oMGBMlCd8w4rEWeVmbl9HykrDC7Y53g9vyLGk9MPe2L1jR
	GsRVE1LuOUx6KhgvPm7N7a4SOxywXAjUwqTbGMC3xqbaMjKs1BQy0YRO5TAsRpfibECrn3Ba8na
	bmTOiLV7WUem8btmIes0MyB0sZkcOfN1xiIShprVK44XR0IiN8ms/rE=
X-Received: by 2002:aa7:d5c2:0:b0:6aa:b72b:d762 with SMTP id
 4fb4d7f45d1cf-6afd8fe5331mr72366a12.1.1791323850737; Tue, 06 Oct 2026
 14:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com> <20260930173635.3362655-14-seanjc@google.com>
In-Reply-To: <20260930173635.3362655-14-seanjc@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 6 Oct 2026 14:57:18 -0700
X-Gm-Features: AclHuK-juL2tOV8vJqtls9IgipFfKDGs-bJ8YWH9hKG05WoEYaaS7Uk5UU7yNdc
Message-ID: <CALMp9eS0=HgM02Ff4mv6RLHVoM3EgavhKu_P6J-oTWTMbk9zng@mail.gmail.com>
Subject: Re: [PATCH v3 13/21] KVM: selftests: Use KVM's reported TSC KHz as
 L0's frequency (sanity checked)
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:04=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> Use KVM's reported default TSC frequency as L0's frequency instead of
> calibrating L0's frequency using RDTSC.  Trying to calibrate the frequenc=
y
> in userspace is all but guaranteed to be wildly inaccurate, e.g. due to
> interrupts, preemption, etc, and no known CPU supports TSC scaling withou=
t
> also having a constant TSC.  I.e. there's no need to calibrate the curren=
t
> frequency, as it should also be the same as KVM's default frequency.
>
> Opportunistically sanity check KVM's reported frequency against what is
> observed via RDTSC, e.g. so that KVM_GET_TSC_KHZ or platform issues show =
up
> much earlier in the test, before VMs get involved.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../kvm/x86/nested_tsc_scaling_test.c         | 25 +++++++++++++------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/=
tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> index d790ab36a198..a78585af0ffd 100644
> --- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> +++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> @@ -137,7 +137,7 @@ static void l1_guest_code(void *data)
>
>  static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u64 l=
2_scale_factor)
>  {
> -       u64 tsc_khz, l1_tsc_freq, l2_tsc_freq;
> +       u64 l1_tsc_freq, l2_tsc_freq;
>         struct kvm_vcpu *vcpu;
>         struct kvm_vm *vm;
>         gva_t guest_gva;
> @@ -159,11 +159,8 @@ static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1=
_scale_factor, u64 l2_scale_
>
>         vcpu_args_set(vcpu, 1, guest_gva);
>
> -       tsc_khz =3D __vcpu_ioctl(vcpu, KVM_GET_TSC_KHZ, NULL);
> -       TEST_ASSERT(tsc_khz !=3D -1, "vcpu ioctl KVM_GET_TSC_KHZ failed")=
;
> -
>         /* scale down L1's TSC frequency */
> -       vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *) (tsc_khz / l1_scale_fa=
ctor));
> +       vcpu_ioctl(vcpu, KVM_SET_TSC_KHZ, (void *) (l0_tsc_freq / l1_scal=
e_factor));

Our internal Sashiko complains:

[Severity: Medium]
Is l0_tsc_freq passed to KVM_SET_TSC_KHZ in Hz rather than KHz?

In main(), l0_tsc_freq is calculated in Hz by multiplying the KVM_GET_TSC_K=
HZ
result by 1000. Passing this value divided by l1_scale_factor into
KVM_SET_TSC_KHZ configures the guest TSC frequency 1000x larger than
intended, since the ioctl expects a value in KHz.

I concur.
