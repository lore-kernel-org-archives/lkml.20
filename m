Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794217340;
	b=monDLEt807qKrYVfzPkwQq2/jU2In2ZE97pGD3zLs5poPNCetOabadUyun1UTf7NN+cx
	 S8h2Qgh8bXimGiZwWFYA4XSuAYSBEphqzE66QWEVb0GeJigUwalpl4t+41ADypJyPrmRF
	 zXkgMrZ68enIKDlom9AqGlqOXu9tW9okWPwxAyvMgMO7BhNU05cliEaKOV/uEGvVO1BEY
	 dmd5UoRbJngOW3PUg+uFlFadG4vWbhCZ7iYyh8xVCj6ugsaXd1spRptG+q6sgYCgMmfzC
	 j97tv2ZFwiiyVmoWWlecSyDdJ0LtTvmY/8Yr8++v5mTAxx+TV0JVeV0PV2PVtlJOoqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dnTFqC7NFZ6LKcry7zosB7nFvDvPqEPM5rGL/V6wgTk=;
	b=tOvD6Lu7iG4ypMo37vN9FFv35xhs3MrCg0aMuypdg+i4Jsmst8ZespYfCytQ9Yyiwdos
	 8zWfUyGKq4CuhVs9xooKd/cq0GQum54HJqO9i65xFX4QW12ewn3/3JyX59yJf/poC/vmO
	 6WEjnMwlab+zSwa2qZ6Z5/GcjPH3V45bRiL4wP4PnJa1gxKGWmSjlJaYHhvgDwm3K6RcZ
	 JDxr25pubWGjVuIKSQKOwAB14uvoF7SojNrhlUWl/iwPOVX1Vj2O0LJatUocnoFuZj9WT
	 4oiI5xWKJ++wn/XKQeOW6IIOQEPR08XKEmY44g8JNamR2un6jdyIfaD+8dUmh0JpvGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IW2nD7TB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D1606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1D1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IW2nD7TB
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so2435e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794217338; cv=none;
        d=google.com; s=arc-20260327;
        b=KIEFVivaLGyZV++fR76hU2tZX/cpg4jJ9eHKp/6eBPP06z958QpJSwD5fpmwQ1LieM
         AH4Rm44ZCR3dnsOgajH7FQ+IA6xL0C6acuSdJ6bGep/v5Nm/eAlMg+Et4B4oZHt36nDh
         rgWYaeyGWBDKy9pbVgc27zAiKYH5svSUNJ7+IWf5KZuLWp27kD+3zp2789vnup8y81l7
         ZrGUnrjbrMCwpk1dzEqtSz2RyHLCnJGqvlrdBvo4kk5fffkSrPlgKdhK3AaV0pqu2UYh
         JZjc0gKM8gJ/KPycey7EAOYyxBVADY90hqT4N4VIUDazbAhEHHzFd/k0ZApFE0ecZ5Ab
         baGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dnTFqC7NFZ6LKcry7zosB7nFvDvPqEPM5rGL/V6wgTk=;
        fh=0YAfhIgGnQjufbdK5wFewhYpRH0ldiKaEKqwriktBYE=;
        b=Hh0oaZkVi7NVV3hkVudmW3IL3qW7Xi3UiIxfez52IFwG0MWMhM3zX75nfXeZPY3PmA
         sVORUWFLFvVB7WmnlEtVCfYfJ4X/eXH8L8gJ7fx+QxKmusizk3QnZYb15YDNy0SQcUe3
         DlYWfCr1TjTaXXA3ARRXhbCke0J4HlM2fSLgsUc1gyAk/4+IrpM1cdOlq6kDhGraIKCH
         uvsMSGONRpr7oMV+JcXUYpvnqv/iN6pyFAN3cu2VR9+SovsqMePfJfQW52QTLarA4QC9
         t07QTS7KY6p75B9WFbfiTjtNgoMKzqhbqxikjh4MPpr1kf/bCmUmFXUnb+m/AVfNd8KJ
         jv5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794217338; x=1794822138; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnTFqC7NFZ6LKcry7zosB7nFvDvPqEPM5rGL/V6wgTk=;
        b=IW2nD7TBfpylCv/Q4iwboGxtpYLm77TPNHjYntv3vZdOMn07KGEJ8Z+jzF7pqd73le
         R6C3pFcK024lUnAUYKpxEFVxXng9CqVrBsfIHokmvrFogJT4mwvbtoNbjyd3zvhbR9dO
         Tw4VheWTrTOXCPqeGvIvJzC0Z6HIIVEnDDj9Ns+YAcSq1balXLUBN48TiDzLXdzu41kR
         9VnpZtANr8A3VW8NxsBcw0PmQ4QkW8RflYfoiuG3LnC/PhIWHCa6XOWCsah8JQe3bTgn
         Z0femMdJtIO84tqoLbepZiwyEsrNjYhK8lTxSrG6d3YNLh0lwnObvVFb9AYP4xZUrn7u
         1R7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217338; x=1794822138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dnTFqC7NFZ6LKcry7zosB7nFvDvPqEPM5rGL/V6wgTk=;
        b=S0SVl8LBn71of347Mvxkq8xeIW4yHbQEnY+SRqQpXRioyz6XrUd78MItb1FjB5Cwbz
         slEI3txCOBpNEilk6r/Wzx8GYRenKCNHnlgdVwGC/3P1QXjp3SL2aM+RTBUSYyBtsHJJ
         cdcVNwYCfpu3q1yVMycaAizcz8yAK/ig1R+zJ3cpzu5s0nBN8et4hCBX2sKnNil4KeVX
         +ZqDko+YEUgXwwBRMaxVGC/UA7C+NteDQesTR8E1Z8h13l1PyG1NvkLw9r4ELjl9iji8
         GYtysCsQlGF29E2eCz8zx4oHOAEQFgsnkOhU1150IcWYlsiE92D4MPFdjXthh443Q5Iu
         rwPQ==
X-Forwarded-Encrypted: i=1; AL+hErHmSUF7YDZXfLTur8JVfLqz2U006fvf+rivTZK47FFC8H5lF11jfR3QNaDfXDDnta6kES1ZojFmXuvlfgg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/LFu/LnFiU7oeErnNqwsoWzUzXJhLdq0iQJIlRBhelq8HxsCr
	VFVj2xeTTEQv44VrgmI1cuUI2KwplxPl8tkNbWAyZsEyORPpaep0IZO7qKke8ILAI9ABPv8+7O6
	afeVrq8x5syCG18GUE/p/Uk5HtuaUIrQciksfDV09
X-Gm-Gg: AYBFou1H6fs1XcP1l/rA/EI0YZ1x//bDI2Ez6s2VYbjPg2oH6ACs/b2OJQUGrpa3t/C
	TMWDTfndJNCve22YXp7nI5Iq9YCRbo8Zm/Mzrz6S0onYwKou0ASKsTNbbX6Yxrj+gmhZ4fphuxK
	OzFxv0lIBYrZ75zPM9Kk/iBCRcsdValKpioXfy2MeNDu+esL6C159xhwxj0OGP9sepYWrYQ2DUK
	MhqFa1eevOsrxasdlHhvARqr1a4uvemH/X+HSpmHesBm//ZFcwL6IRREw9A89CDEql7UT9OzaWU
	AGzNuHyebrlS/coHys5xkC2uSdKlgVKnb8rEA8j5VyUbEDFFn9g0wYky9aSH2DJ/wScFR6VvtBV
	TBunkeI+724/4zEfct1oNY9YUmmmz0rbwZa8pkhJYAB9SSPW4S30otQzGc22G6Sk+rjl6fiRl0b
	zVwFCCsq8xhq9nRZ1dN3iiZlh2p8z8ZlbjjcZwkdIU1/HdQbY=
X-Received: by 2002:a05:6512:304c:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c00bd5bc9cmr144934e87.10.1794217337930; Mon, 09 Nov 2026
 01:42:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922071945.693714-1-fuad.tabba@linux.dev> <20261007074037.316564-1-fuad.tabba@linux.dev>
In-Reply-To: <20261007074037.316564-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Nov 2026 09:41:41 +0000
X-Gm-Features: AclHuK_MaYET6PTkt0ZnvA66k0DV_1M55e3jB2HzY2bpxHczb0VPvo1hIAKLqfY
Message-ID: <CA+EHjTzaJx2nV_9YEExgYn7STSP1Kvhsqan8va8M7ba4WtCiqQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix incremental build dependencies
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sean, Paolo,

Another gentle ping on this series. Is there anything else you'd like
to see before it goes in?

Cheers,
/fuad
