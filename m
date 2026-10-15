Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59F74DD6F5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100905; cv=pass; b=AgiMGAoWDSvNEBdPT3YUDkzSbktfD6T8oLqgfoPl9ZEa+m32n3IS+k6iKRzGErC280zGg8c3bfDw85QogCj6HbXUwqvI6N9Cl74ywu06VBFE/ntkcSL6cFR3h3Knyu1MTIthT9RIGZyk7ku0TSu8Lpk4Ab5XeARrvXRJplgmPGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100905; c=relaxed/simple;
	bh=x9DfZcXd5QJzvCjBswFIK3WX4GL4pOPJHTl/njeMnVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMPmL3b307UBAqhpT9YUK8M7FBkjUzCzziH2GkdbkAM3ZSznn9Tdro/TQqT7LGEsEOcimJ1Up6DmC4jBkm7jyNWh9G4oERicNIQhHkLdiKxh6X+X4BguINJy8KZ3DPR4YzDqNmy0icCPpcsr9YWcExBxstVjQJQKRtcLBeMKeq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jZn02aSo; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jZn02aSo"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso4218a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792100902; cv=none;
        d=google.com; s=arc-20260327;
        b=b0cZzY/uGnBF1TJly9Fn9FJ3CQ9mV/hi0W94B/yVF4OJLT0pvylaTkVD6YagVAS5DO
         O0wB+DUYqi9Wg18HLExEscI0FiUX/BIPhKg15FJ0WQXiIWJQ1poMkxfXWhjVyNqkrPPc
         NL7iT2RUKHnPQaalkJXm5zWBd70BjTGSRT0ebXYHlymFoSm1kX8tKYWlatrpxaKCtwEm
         pY5cQMAPQMLagf5F6uYUHBCMzwbWJSbGdkpsgdGqGNHkowZhq4htFdD/mlkwxpSw/2Dl
         NOKDcsATeBO89QHrpzOuZnnPALchV6J8piMlA7CEmwt/vV1TJyiondt2ASPikHUR+MHX
         IAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vh9rWF4SvHNqcgCJ7jUJGPeOELEufaBIr6WXtF+34n0=;
        fh=lz0q/qwfoyUM8yzj3Hl6dxYSPI1y7Hnaai9Ynkbb+nA=;
        b=ltN48daTKszZYEbSKTERSWwNhVgDXS+UekHlv7oTtCkHaEqqzBZAq3vMZMU21+kc6/
         XnboiVIqvB7wPv/Uw9M3BPbiSrKiSsZoZ2lkN2rjJF2/DLq4TP/n7Kn73AFnfPm4WtMX
         SlFV36huJNK3ddX0OXOkgztDpBqva/UnYNGclmPfIYqwnTcsL2tq7Yk0F9aFag3LDKC8
         JZmOrfnvVDY1ziSieGY21ZyTszdxFinJDW7fUB36C35T4IiXhirMc/0cPjEJ1K3m/X47
         wGw6x1LkZssWWnWT4krnyJEOs1WNT35qSViokSYe/lnJ7206eTldDDkRbYvdZ+ZOVHm8
         2dzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792100902; x=1792705702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vh9rWF4SvHNqcgCJ7jUJGPeOELEufaBIr6WXtF+34n0=;
        b=jZn02aSo11YVn+Ty/uXNLpeexzQJ2hT+o4qliN1S9FcU3nZ3jTczPDIrrGJHieUDvH
         35gq2uhocSW9NCSKwWFeSyHwzEq5ebmb08E5KPATqF+NxsiN+Zszxi9Pvek2z1HIF/d1
         JtMFHI8BHwOEahtbmodawgnERW2XdWU8/NzAV1zcNfmV6aAWRV5BtBHvueruDIDI4z6n
         s4osdudm/EiBa4UfbG2xH6vpiOQJSqr2OiJvK+xczeRMyJ5kM+AI3AnBLHQpqwj0cu3g
         IZ7XKXgnvIRxnVpDgoXgA4RGidAiBnKYWP0JBbI4tMeuehQAVDFfUWWqIf2Idc90hMON
         x/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100902; x=1792705702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vh9rWF4SvHNqcgCJ7jUJGPeOELEufaBIr6WXtF+34n0=;
        b=BSYx76+MHEucRHRYuzHGkE/IwwqYJw0KcNwkqiPkvTa0DIwtol0hWFvSYWMhM/VPNM
         gQubHDFtiMr04zfZR/o472yOgR9EX9KNoq+oVmfdYd2T9PzryLJj6sSKIW73oBBKJCQq
         JVpJjs4cKaLBZCyZGRYvFUvQSqWQo45cBMwCvxGgvdtZ5B/IGUWv1tuWLxSgHXNS1jtj
         gonC6NZjs/aZKzCt9iV1epYRTk3vAxl+3GV9gsSeZ6lq8y0kJ++xDY+jcO67ZCQK7b9C
         RkXrHQZBP3ZpzoZAjqHA2ubNLdUKim5Xn440BQqdcz3foQFj8J2SZb9m60pDWr3HM7zg
         bN0A==
X-Forwarded-Encrypted: i=1; AKwUvBwMNCYEzCS1hBpRjolyZPkc+EUhttc6GOgwGYt9tqhTg6EvEfT7JpfD7bZEq5WUvVuXYLiL0J67B4ufZ1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGtwrWZbBuDmToi9wkFxzZIqJt1hzDcd9oV/VAOAXl77Zz49s8
	wnmabTDY1aKWAHM6PH67jiEKuXbBIdyGsDW9ZQd3DhFgQ2AEMuzz+OwmnG1R+NPzlMNPF9ZCa3/
	25anrXYHBTvDIgB4s5dYFpBZE/PbGtNXVDVaix/Id
X-Gm-Gg: AYBFou0ywexAPjtzvq8Gu8/DWsVMgoPt16AjeXqUb6fhG8AnVp2WNKsbgI1Ty4Vo97X
	K9+ApsXoPe/vNdDjfyLoqD/doNqhn/qUrzy/+KOUpM6aZPb7W+E8kqPvbv1Cp3XYIQgT+4nPZ5l
	wa/rNdi/4webVK1ccoVmrEFlXJszVZ6RVaFMtFQaHME1RaQMyGfz8bbWI2QEayiCbGpytaRZwbE
	L0ZZ15qUdB7s1WfpHrxf904Z6PNrPLxUyM9+5a+q9xTl/W4HnQpPn2GkHKrEbrCIZFVHX75fChP
	08XQXvSDOWmVbUSNNVcbdg/37rjObDbRmHRqtBsM73OiFes+J98PGwA=
X-Received: by 2002:a05:6402:a210:20b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b38c3c7b4dmr6572a12.0.1792100901496; Thu, 15 Oct 2026 14:48:21
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-13-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-13-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 14:48:09 -0700
X-Gm-Features: AclHuK843m6jYK8HtbsNcB8aWe4AsVF0UuZPl_y8TP3gKWeChhKGdv7s9SqYTdo
Message-ID: <CALMp9eQ0Nxf=bR3tZsaNHG64267_5mt03MEO_QiWfqghJX6wjQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/27] KVM: nSVM: Drop svm->nested.initialized
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> Do NULL checks on svm->nested.vmcb02.ptr instead of using a dedicated
> proxy 'initialized' field.  Make sure svm->nested.vmcb02.ptr is
> correctly set to NULL on initialization failures, as it is currently
> left as a dangling pointer.
>
> This makes it possible to directly do a NULL check on
> svm->nested.vmcb02.ptr before using it, instead of checking a different
> field, which is less error-prone.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
Reviewed-by: Jim Mattson <jmattson@google.com>
