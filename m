Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6847FB19
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020953; cv=pass; b=OHCjwoLE7OHz02ImjAl+6yYYLGkee4/ztdQkwyZepuxemVu11IEF2X32cR1q6/GxnKeiD9BUDdHdsxoutleXgh1Hy4nU8ckDL06KArdvW7WwnVy8cYRWLtY8Y25elUEoJAtbQ+xLs4NUMvnFbS63pKxeXAhNlvf9kz+Yndv8zFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020953; c=relaxed/simple;
	bh=0yKhwzqNgG/9SN/cpZkK6K7qmkrl/RC/A3uF/TuJVLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKeIDOUj/rm1TvV1vxsI5SsSz1TCGE77EtVmB4l1M0tKap0cfZrbFmPhPNnwjlylTEwuLJwIEgfkrBrHrEbFvrbEFR1dOJxc3xP3VNKkMd7Sn04barM6FB+FZkCFi5UcE+Hfy7B1jdpUv6LMZ8BZN818KACJFdzZdSFabmknBCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BHegyMyS; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BHegyMyS"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1057a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792020950; cv=none;
        d=google.com; s=arc-20260327;
        b=KexQLcCPA165P32oJssirsfEAhOSzSEboREx4+v7A6G0dkUJZ05Awm9EnMMfeWquNa
         aO2z149+j+eox8a5SOmIWYIfDOA8nUWMrDinZefsS3pJpk/NP3ERtbcT4DwcThYmAdML
         x+zKY2vMbUcavjJftpJXfPe5YvdJEDtc5Ty4afrTC2dLtVvgOBo5+Kvw/8H+tJnhccQ4
         YLTVknTI9yBucCC0UQap2wVuGRezPMDcUFWtwakOGGM9ssrNQ5SnGw238Wz/fbHvzh0z
         XC5RW8vBGYSiUwULpWUn3j1jkAzOriaHyYoBnAXzZsS5NE4I15pMyKiGs/1EWAp2WHZi
         StxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0yKhwzqNgG/9SN/cpZkK6K7qmkrl/RC/A3uF/TuJVLI=;
        fh=qYMovZpDEw9u33gwKMPUleEzF28QMUpWqkjNIGm+rzY=;
        b=SxJhKyQWbSbcmi+gUxtxfwrKUvCqmEe8xjqenN8111Wr3bMJBpYupXwHMvkk9REJnT
         PxsSs0XEUHRt1P3JXzYr8KeqX9F9Xw3624C14i8kH+9cw8KfCaXiyQjVKWHBxUJ4h8nU
         LPiWLUJESZnonmeogpCt0EZBakHTkQU6x5hy5ygYEFoi4THN9RdNwKe/reND/CeB8a3Z
         k8EIeGjr+RgsPXAtJIq62/zoj9jtnwDBgt63ks19bsFvFjzTRfY8jA+xvmKlxNvgLOly
         7UW/YCh4aUzOFV6ygfpqbJuo+x+Nk8TDM4xRO/5pyH3FzlWdyS33pTZTy9MXXrD51fsF
         8feA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792020950; x=1792625750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0yKhwzqNgG/9SN/cpZkK6K7qmkrl/RC/A3uF/TuJVLI=;
        b=BHegyMySH1YH/qhsyC2lSgQSuRb9SJa/IHoOaqCwjrdvFDvgdfPf8vYVUDNuwHJtLj
         a0HdBYuwYBEFsvbmiCG1NsxKa3TSg/g6JRReJNwWrxf/C8ZtUpcc5PKeiG1NXpjI+lcZ
         Py3FRDsHk/G9R3Db5XkDIYNKrdO5gIouH4B6jKXCCrS16Y0A+tiEsgQ7EK/emXGFwtDg
         axUf7qjJnbc06kvToKtYFUpPJ7KhEHZdsGEKfQxYNQofm4xySowoBsH4nvEhIW6pmGVl
         UI3Ko0xB/0sv3Pt090dlVVI8Y0/vzMbYnx0oKvt9Ov3fioPTYJGP2Bc4lkDzccDm3Gwl
         mIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792020950; x=1792625750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yKhwzqNgG/9SN/cpZkK6K7qmkrl/RC/A3uF/TuJVLI=;
        b=1pjg4DB6OmE33d0W61hwm4rRtO4nsdVukmiNk8yH4veqJgZkadTy6NL4wOzaE/H2He
         +DG9HBPhm7ZCh2LdQ4fjoHinmngcDuBEqNB81hnRHYdwoLTAuwlu2L2Ujgxzh9LHk0qK
         oMd44rG1uEnkztMxoXlocRvzEuiiZzgLNPU/0dPDTfDd2PM77buQnFWUhZViC38KUyqH
         t6mwhqs0PO+EoVcbkfsv35MpFrsCMvK1RXKlMoHAlsT65m4wXKvd47sz+iq2B4NKhmaQ
         5bGNl7eB+dxrA4lT0/hH7EulN1On3zWDdxtqkfvJ1ji7fOYNSKv9s0mM6K/dOjyXq4Ck
         aeYQ==
X-Forwarded-Encrypted: i=1; AKwUvBy097Tt9yvFVg8NS2XiUZ8kYgPstEyczmsb1N2AS6xZtUN0qUTdtpEMk4yRqAI1B8hUZDBLGNb40JSJYEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF208tsqBphL4Yjf3jtlrjiPsnkjXCUwegXPk3U7DKG5Q300Ui
	Aqhjg6Wsd0igz+/Qo4PFXvz7QrcFApxmfN9pYVx8HCe6aScNoLDNfzjT8Ps7fHX2t6PidhmGRUb
	52PDcv77bWUbvl0P/KrVCK7IVFhNejavjfpKlxH4+
X-Gm-Gg: AYBFou3VmnHNrWFNUZZEqd+VWCdiiKz7ACRB22qqXmUpddwbD3fbMRETED9T5j2U7U3
	SUICUuJ26F1XLZ+SBtLP9g2nyRWjfDFok3QiK4g0WC9WO3H6HKC1HQY9la4aMHoAvERrc/vK99q
	WJ7oXzxR7daJztedZR1oxksJsxbaIPvHC9XeDvUXyhHksRsAh3ggrX6xMc1uKZUV7fh7E0ksWK/
	o3J72RN+85qczNFbg1gE3TMWRrj/seyv9pV0s82EjOj+hE1UmA/fa6vaMQLTS7QXdkK3jx5Uwsi
	ONDlTjYqfw+ryJRfR1qgdYzNPXcZkLbW3iNgea5wIDc2eDVqXOjaA5M=
X-Received: by 2002:a05:6402:20c5:20b0:6b1:bc48:2238 with SMTP id
 4fb4d7f45d1cf-6b333845c12mr1302a12.11.1792020950237; Wed, 14 Oct 2026
 16:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-10-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-10-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 16:35:37 -0700
X-Gm-Features: AclHuK_FXjJZ3HVfOv9pAjNjOL2oKXm2cI4TAVw_4LY2M-i3V-HQJYD81Lzkplk
Message-ID: <CALMp9eSJThPYPrmtnu1kQ13Pq4V=heMNj9PCJLng0nXuC+28pw@mail.gmail.com>
Subject: Re: [PATCH v3 09/27] KVM: SEV: Explicitly initialize the per vCPU
 ASID on SEV VM migration
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Explicitly initialize svm->asid on the destination vCPUs as part of SEV
> VM migration, before calling sev_init_vmcb() to make sure the per-vCPU
> ASID is initialized before the VMCB. This is currently unnecessary as
> sev_init_vmcb() initializes the per-vCPU ASID anyway, but will be needed
> when the ASID initialization is moved to vCPU creation.
>
> Add a helper function for the ASID migration as more changes will be
> needed with incoming changes.
>
> Note that svm->asid is left as-is on the source vCPUs, even though the
> ASID now belongs to the destination VM. Clearing it would be a nice
> hardening measure, but it is not as simple as clearing src_svm->asid, as
> the source and destination VMs do not necessarily have the same number
> of vCPUs (e.g. for non SEV-ES), so NULL-handling would be needed in a
> couple of places. Leave it alone for now.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
