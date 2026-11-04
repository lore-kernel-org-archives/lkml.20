Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804037;
	b=TcwD2NG61BPRSDxk5EiYnX77R4syWvcG83vwexuDvOIbtCGyFeFeJgwaXV+iAc1EbWQ+
	 ihDLrMsmV+nvAH6M/zcHujkunUsP3GwSXl7v4E0RsXbWmUTsGb0mprcm1zvWVzB+ZAnrI
	 Kumo1Vnu9kjPw4UP1Y3Xfp5WceteqWkRjVr6hJoWvnQ+w1aNej+viZbOVbYyPrPbatAy5
	 LYhMXoMalL7BoxzebwFWjanjqqXLOxj9gVHITQyHrlJ2/x2GmYfSla11Y7z+FaNdPuW4w
	 AISJy+T/OIAXp7kWVOf+ZNmKtv5BSCwbIj3DUngAWPpZHDuA9JlE8YzMMPbSUmdR6+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Mg40lROHKMJpuheArNs1FLRBw+BpmUksYbkdM5o4WG8=;
	b=nVe2836rJkDMqQAN2i0XEQ0aCTDZUpxEBGa801Syf3mFEsSlUxvXH6aA2g6LI/hv3tsV
	 /60hT0i0USszTFPAZbyBE+jLaN/lJIG++8JCRPv6VthbEeVyIwnqTOUwKY/OJS5ojLu8E
	 rA/H98GUiVutw2DdDeH9dZNuXIZY89+NhcdBiEjJr37mJ9cHVLPPzCIpPv4ZtBa26oniu
	 a/+oXAhURYeC7NPUB6ify6CnGOYvIR9w8nEXRfmRFnro9V1CwTxXk1F0YgmRLQo/Xtuyg
	 bZp3FikfN9w8mfkUqO3y8Z3OSI5cxvYI90OBJfW42CXJRTyYkQrbgQgqlFHhtZQyZ6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KcffofZ3;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3AD606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3AD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KcffofZ3
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so788834b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793804037; x=1794408837; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg40lROHKMJpuheArNs1FLRBw+BpmUksYbkdM5o4WG8=;
        b=KcffofZ364WrrhyE6ofKLqmFxmg7CSE9Fzkp3CVK0lCAv7ToKzakKxVlfCn7t5v6+D
         LqGCMA7pOOgzLJgEUmrAxx5PTHeGfEuxgsXVEGChIFYv+nsEBoIK6Q/LUaWlD2yXlNJI
         6zq4ydC3SpvhElqcDpD92ccQozcMG9NUKen3POCDbBqICjAUS3sYiCEnu1AYpSRK29ql
         NAhGevLKC6y5saIcrtxiNDOnH5cGC1SJq0/+T842ohmsU/tpCYVCsirvIoKV5TpmalU2
         MVu6izFD+BUMwnayWyyPYZ17XjYa/7o5BFYZhgQObtZf1clQq+CTSRcCZTnK4NXhQkhC
         wkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804037; x=1794408837;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg40lROHKMJpuheArNs1FLRBw+BpmUksYbkdM5o4WG8=;
        b=1INkbo19jtTmVk23pDrWpJFDiRyboVvbZDQIkhpkd/GFXXJTde3jAg5Gw70Hk0UrNd
         o14evPWlrD+LeCCtxEKBcYp8T3UJIOKfkOXyJrTqMzd3mXPo4E5LklABQG3f3g89cROK
         6xgD9Tf6C2KF6d1UVu4IFBhQPuM/8kcceOOl/7ZnZUuGOtX6npXfLBkseXptl9tkOzVv
         Uhj1GEXXKNodUxyNtNy6TQpKkhAiGoRpvfT3z9gYPluEJroApotA3Vn5koN6PO1hQZ6u
         YLFoRLUk8VkLbVWrT+z0scBAvjwwkQ5UdUWeWhUMALR7q+cZA8grk3miZprABcWe1WUJ
         QZ8w==
X-Forwarded-Encrypted: i=1; AKwUvBz5zWJZiWe9KhXTJgUKOsensVHxPtm5/FrHsQYzVfviKcmI/+S4vVhSlqjN4FVKQcmNmKi3s1M5aiZnvow=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n/3clqDBXPLaQAfj2TecC3BzQeBC+KpaooDK2v5RKmecwPug4
	G0JLcCmGWbtQoaBwOHhuz4h1SSk36BzVs3qTps8SEF4V1oFYeF6EkX384Tw3wWnTgSL4p9lpnOF
	8Pqi9EQ==
X-Received: from pgjy16.prod.google.com ([2002:a63:e250:0:b0:cc7:85ef:361e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:485:b0:3e2:6daf:f7fc
 with SMTP id adf61e73a8af0-3e928a7c910mr13865633637.4.1793804036471; Wed, 04
 Nov 2026 06:53:56 -0800 (PST)
Date: Wed, 4 Nov 2026 06:53:55 -0800
In-Reply-To: <20261103002205.3348519-6-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103002205.3348519-1-dmatlack@google.com> <20261103002205.3348519-6-dmatlack@google.com>
Message-ID: <autHA6aNrg4s5PkV@google.com>
Subject: Re: [PATCH v2 5/5] KVM: selftests: List the known IOMMU modes in
 irq_test's help output
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 03, 2026, David Matlack wrote:
> List the names of all known IOMMU modes in the help output for irq_test's
> -t option, using iommu_mode_names() from the VFIO selftests library, and
> clarify that the IOMMU mode is auto-detected by default.
> 
> The help output currently claims that the only valid modes are
> vfio_type1_iommu and iommufd, which was never true, and would get stale
> any time a mode is added to the VFIO selftests library.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  tools/testing/selftests/kvm/irq_test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> index 8a345472df5f..ef69f9d7ac3d 100644
> --- a/tools/testing/selftests/kvm/irq_test.c
> +++ b/tools/testing/selftests/kvm/irq_test.c
> @@ -159,7 +159,8 @@ static void help(const char *name)

If you're going to do s/type/mode below, then the initial help lines should also
use iommu_mode.

>  	printf("-i	The number of IRQs to generate during the test\n");
>  	printf("-m	Pin target vCPU to random physical CPU before triggering interrupt\n");
>  	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
> -	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
> +	printf("-t	Override the IOMMU mode to use instead of auto-detecting it (%s)\n",

IMO, the "auto-detecting" blurb does more harm than good.  It makes the code harder
to read, and for me at least it's just extra noise in understanding what the '-t'
option does.  It also makes the line reaaaaaaally long.

I know the parentheses are pre-existing, but that was somewhat ok when there were
only two options.  With a big list, it's again noisy to reach the end and have to
think about that the closing ')' is terminating.

What about this?

	printf("-t      Override the IOMMU mode.  Options: %s\n", iommu_mode_names());

To go from:

  -t	Override the IOMMU mode to use instead of auto-detecting it (iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1)

to

  -t	Override the IOMMU mode.  Options: iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1

> +	       iommu_mode_names());

This really should spit out only the available modes.  For the internal assert,
it makes sense to print all modes since that's just doing a lookup, but it's
annoying to have to manually probe to see what's available.

Juggling all vs. available is mildly tricky to avoid having to dynamically
allocate, but not that hard in the end.  And IMO, it's totally ok to print a
misleading message if a mode becomes (un)available mid-test, especially since
this helper is unlikely to be used except in terminal situations.

E.g.

static const char *__iommu_mode_names(bool include_unavailable)
{
	static char all_names[256];
	static char avl_names[sizeof(all_names)];
	char *names = include_unavailable ? all_names : avl_names;
	int i, len = 0;

	if (names[0])
		return names;

	for (i = 0; i < ARRAY_SIZE(iommu_modes); i++) {
		if (!include_unavailable && !iommu_mode_probe(&iommu_modes[i]))
			continue;

		len += snprintf(names + len, sizeof(all_names) - len, "%s%s",
				names[0] ? ", " : "", iommu_modes[i].name);
		VFIO_ASSERT_LT(len, (int)sizeof(all_names));
	}

	if (!names[0])
		return NO_IOMMU_MODE_AVAILABLE_MSG;

	return names;
}

const char *iommu_mode_names(void)
{
	return __iommu_mode_names(false);
}

Side topic, the use of parantheses in iommu_mode_lookup() also yields hard to
read output.  E.g. if there's a typo in the command line, the error message is
rather hard to visually parse:

  Unrecognized IOMMU mode: a (known modes: iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1)

Coupled with the above, how about this:

	VFIO_FAIL("Unrecognized IOMMU mode '%s'.  Known modes: %s.\n",
		  iommu_mode, __iommu_mode_names(true));

to generate:

  Unrecognized IOMMU mode 'a'.  Known modes: iommufd, vfio_type1v2_iommu, vfio_type1_iommu, iommufd_compat_type1v2, iommufd_compat_type1.

Which to me makes it much easier to identify the bad input.

>  	printf("-v	Number of vCPUS to run\n");
>  	printf("-x	Use xAPIC mode instead of x2APIC mode in the guest\n");
>  	printf("\n");
> -- 
> 2.56.0.385.gac671c819a-goog
> 
