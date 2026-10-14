Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768331D72E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020799; cv=pass; b=K7pPNSP7DrpeHzoK/C9YqNzyZkSVnBUQO026yRB6XmWP33pmg5jXxyBEabOzRDo1rs8iNQ29i+GYsppgHKzVMs5EpcCYrgVzowiHCQ9EQtzyW2t9KzsjOyDRHVlyAAwxoWmWMw/WXkrRw2pYG+sM7xyp+qZLYEMf6f3Sr7Jp3KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020799; c=relaxed/simple;
	bh=UME3gLxvOcbdeeImfZzUcDJxVeJkr7yc9QMRKYfW8v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rI76Foz9jRsFHRzxvlwT8uomgN8g0t1wZgVB6kLSceTsO1DsiKkllkmSlApgfNTZDdeopLR3cmEghzoZEhN7XycqpoWNCh+5dENUqJLaMn0ixwJfz/taqCmcEUXhmwzhyMgv7Hn/QWLPNDf36rxgkueAZiBbdSG3rI8bUJa7c/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lupv9RHL; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lupv9RHL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so1029a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792020796; cv=none;
        d=google.com; s=arc-20260327;
        b=nThhuWzU3DYxV9fAqOKJaY1ig7ymFo/2gJ3f+2MTi1hl/2rVPKsDV/u45VyhoUvwrX
         YgfeiLAsbKEYDbx2Wq9KBAb+KEaGPOw1uuhNHFbpwGBxrJo75x6RVm4mvLRneNhh0sD2
         a0Ct5Th2gwfKDMKzDPdkjXH23V3mF82r/zW8/Q5UupVcU9gCTNsrUepi9ESeSqUXDbmp
         jHkouPBwZdIK8WP0+b/fpehZ8AOqt0qbWr3QrVfrzU8umYETuOfcw30YTj9BGGspVSv1
         LOkZv8R84hgFPpDGqrW+qDvqk9ZrhT+4C0ovnLQKiVfLHw3i3w7P6loDBrrOxYVpfgqu
         TOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UME3gLxvOcbdeeImfZzUcDJxVeJkr7yc9QMRKYfW8v0=;
        fh=siDlmkrh4h/alOTNe9iSnCUsrv4nlxjq/C0gz7uKG48=;
        b=VA4mHVxrejJMkIJ0E7717dbKqiaVvPVZv2Lnqpoaa6lCZylYMR+ZGfgl3lSnnEHkT7
         EFi0BRq+QYm5kHFJiCNINnQguPGwENwDWKeRX0d+XwKF4hH+Pkxyd/9+gH1upPHe8BWF
         ZLLmqLspv/ioTBgvIiD779TzDUQYh5ZHyxe616CY8iGy4b6zRXhL84284e9lCNjyda66
         mk846HFOrroTQEncS5zZnO0S2t8sVs6qp6O7tq3SWFuqi6NBuWcM6RFyvsw9sQRqCJ0i
         OJvxN1q7MyBIZPnOYOcCkWfqt0Z2OFrP2CtN/rs7ECm520B2yOpRpA6Vt6b7db18Fr5v
         3Nug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792020796; x=1792625596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UME3gLxvOcbdeeImfZzUcDJxVeJkr7yc9QMRKYfW8v0=;
        b=Lupv9RHLK8uaKj4rl49Fam9q/DWsm4IFC/4GAehCjKz8VvOHrQ8buFVDclki0WA3jB
         fnkGNRN76+CSDLPDzPd9WWnWyUxFMty4EzYnaUOwlszpLvKN2+57fGnWILBfH9YEtgnQ
         1otAPqf0SKSCJdLvOBYUK+hc9SV0ak9WJwReX8n4ZaUV0xPa0fz3ujASpyijj/msVEBZ
         AYOhUfY9gRPsAvb9bY6yZI11gB8VksL1xjBJ2MNOPTREIUluobcWNZqeOCxdtQbvB912
         llQISzZk7QyBQ0vLzeMw2yAPaUswJZmyiOAEUvpPiMhxkB9bCVXfMbl8ICIJfz8hgKwg
         zCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792020796; x=1792625596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UME3gLxvOcbdeeImfZzUcDJxVeJkr7yc9QMRKYfW8v0=;
        b=gLGovNiF5fSeAOgqTB0M/+pUZAjf6ZgpFQUziS7/jezeO41pWWU7tG6aB43yBZbaMl
         JFtBYU0JxLRCwzkNqlcOP5V3HC1hzz/imnuQ/fviq0GA81l7KObxFKRQHXFG6ZWTzAq1
         iNpm/PDNKj5OEJqrMlo7WGrzPS44s2kC6BWLTMRzOcMWlTfBhZ3huue54ziWJ6FVfpgh
         jxTyn1vawKrQUpqdpKDkecPiVHPDTNYJHCruDsv6E4SNWjYSbNZcR3QQyRX6fKg8eZ9W
         HUw5UkWMfioxSkiBYbNLCd4b48Qu+0BmFe9mbIhMCNmgkgiEHt9wD1LLKqe32CLLqR+W
         uPOA==
X-Forwarded-Encrypted: i=1; AKwUvBwpVr0FkqEGamXVaHkSmvbJTcSYetmKLiipeBVtH+fLP9NqwotoS7oyplWMnM/r64DOf8RJho968T88+Ow=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxBZJpnr4ajtkCFE0eSBn1+Hrpjt4akvsolQRIIhTvdGl5XlCr
	TbJAQuvSDL7iC5hfWUY1MCOeb7SByvmriuCkQyQL9BE3UuF0QvWmeLjWo3K51DbZ5k8FDj25K2c
	Dc9WyHmT8hlDNhrKAjDKFvi4NDc8w1c/tMMYZYZ75
X-Gm-Gg: AYBFou0YS2kYN3dVORg+A3TSsApnwsHhpXcSmWZCpVUoeHWE294zkpXQgRxrTKmwoSW
	YCDUgQZgReC/79+AHMZ1dMOCMDzchS1eSLkHjRInitxEFMfTri0LZ/xDISj+geB268tkwimzAgQ
	QjBPCYCHY8ODfEHTMP5jbopEpDFy1Xn/xKoOWeaZ2YJnvLi/Z32NVtfJiXDa4be/TnhL875oUA5
	eTvvmwasxQP9D4W8EmKZYnfwc17ENsLKKwUNfy84oFGkrKQSNeYlFv403qgmCQUVublMHqC4VmE
	l8ow6n8JcEAB29DevHhqMJlJM9qpYgsKzEqAZKm1OGDWLogLTtVdriM=
X-Received: by 2002:a05:6402:a546:20b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b323170e5dmr3931a12.0.1792020796073; Wed, 14 Oct 2026 16:33:16
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-9-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-9-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 16:33:03 -0700
X-Gm-Features: AclHuK_3nG_mewji-7JZbITUFFbQKSC5wLbCzDueJSSlfMYouBa9PjUn-HbQoec
Message-ID: <CALMp9eQ6ZeJLR5b-ChuwLjWCVC2MzYnFSHoRoV5Pr2kO50P+Pg@mail.gmail.com>
Subject: Re: [PATCH v3 08/27] KVM: SEV: Expose sev_get_asid() outside of sev.c
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Move the function definition to svm.h in preparation for using it in
> more SVM code.
>
> No functional change intended.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
