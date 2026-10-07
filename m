Received: from mail-vs2-f5.google.com (mail-vs2-f5.google.com [74.125.227.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448FC45517B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791387403; cv=pass; b=pxo0mcAfmcbwoCk3Bt1WaRNToVNZwgJx1VX/l3IPqWku6dueudRZJv3yoHqdOMLiIub8dQSlsR1OXkq9CjyWppQ2cfzJ5TAJaDKIRlUuadj36QnDFEzJJ9jrSeem7W+oNn05oaswq+FAGraAo4VlBMAjR9rD5IdA2PTEV9ySGCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791387403; c=relaxed/simple;
	bh=VIlwNxRfdBd5XK7k+Yn5qCHGcNB8TrH811M/2dEK2D4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlqmLxjGgQkTJCaN3mN2BPh32IateheEFg8hbUUnQgdLugXVQf6OgAp2quimoz4V4NGKxRKAvGrqhOCnXqRGjDlMMTiZzYmHcsVZsOppttM64djpxlSQMX0/rhnF2mmd2xFiRHibz18Ccfq5RJ+oppFv7NqKirFbcC5o7X/E5jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7LI/huU; arc=pass smtp.client-ip=74.125.227.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7LI/huU"
Received: by mail-vs2-f5.google.com with SMTP id ada2fe7eead31-7c326adb66eso3657400137.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 08:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791387394; cv=none;
        d=google.com; s=arc-20260327;
        b=UukvPHruKr0+8tT5OZfnwqOeAS4wt/8+IC9c+4lwqSsa+qSqZUX4dJFE9/qUobcx4f
         7OTwAutlL8Y4tuMPa24XDgKByEqIgZYnUZIcmjyMDNfspJyRXuU/LoFfCC9S6yTocCpR
         Ya+3wCDb2c5YkstaXHkeujQg0LXxs99mRGxe7pTc2aStgVJWKTLQL3SfYozUZoZPKvWx
         dJ6d3WuDCww0ebBkTfZzfF59Wb46PNcP44yNK6Ot9UEjqxQ+RzS8EU/mcASBM77ZfwiD
         jzeoN9zU5qVMQpAerbdMxegfRlvD6kBogyYTmea7fIrFs5hdsnG4fFikllc8DsMuRwQ0
         53Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIlwNxRfdBd5XK7k+Yn5qCHGcNB8TrH811M/2dEK2D4=;
        fh=RSvxxKcjgY8NoVXbBOkQn5CcQ31k4hlQM9mhT2Z/f2o=;
        b=Dv+veuF8s6+j0/UEwUDE4dSvRdEO2ipZfQMeaH3qfDcDmTe9Es/iG2mCACrZJRsrTV
         pH1cEl+3xEW248MvfDYeNGD0YrONVb7ErxEbaK3osjn5MxAoBGulZr3i8AGfebzLXcYT
         r+tobG1Er1nwAFpj1NGroqCqXxPuJXhm310QesVcKO6U56+1EsJ9Q4xScaKM4OTmHxLt
         hxOwlPmKxEnoHNxPvp48IWeO7qkL2q9DvNvLURdwEbKbt7HjYIsVR52+kkJSiLNXhLl9
         /56v3B/zzaQDAJB0zbbcWFHAb3XMNj3ONuJ+28MhgyGEicj2V+PxYr+d4jwy1Bxs5kI7
         uAQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791387394; x=1791992194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIlwNxRfdBd5XK7k+Yn5qCHGcNB8TrH811M/2dEK2D4=;
        b=k7LI/huU2qDMJmkL+bBVEAg9JXf6gWlj2Ft5BFK6OrWROExNpfcfgh58pnRGDVnZaM
         DkQRdbITh67m89tUCOWjnioK8Ei+m6VcBudKEbMx9fa4GgX92CyjWFqx41O0Y6MWOa7d
         xfQdWeEzRpnNrUGGaTzbrFmwrin4TUjeu33VxinQcxECqrOj/1iYTCLppQJ9uO8/Mol8
         TlL3kFrGvTrrXIJxzDCMVYl4bSNQNUALDWHlw3sJ8+WZrcyMd6awY2iRAm0cUFpLbhW/
         bszkS20aiI3aPyU8nIhWjcPfDpow97rAv4jXtqKtJAull6hBeV3A2dKI2ZfHcIvsbZhE
         8Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791387394; x=1791992194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIlwNxRfdBd5XK7k+Yn5qCHGcNB8TrH811M/2dEK2D4=;
        b=u1ARDa9uOuHjHpDlDBMqY6aw977MlxPf/shG+meYc/08oh+RhjNeYW9+T01mbO+rNy
         nPBfkKJtauIAenhwN3hQ9uqeYT/aIra40do5+2u48K1qzAF1PrqZq2YwRsYsK+2UDIh9
         WylEkiA7zoyc2x3MG/vaKDunUeyVUMDXCSlXiFPyZLo+6nDxpScl7uABOYjd6KefP+BQ
         L6ZvXZopLpRW69zEOcvkjvXHkRIq7kac8lOUsyN9mZWA/6Y2/OkQpQNIGZuvPvnH6Kq4
         jhLd3XX2iAECHz2vkN45lU24DVPACdMudOkOlbnoKDkOPdAEPwneG3sKjtgOZpJ54w6B
         F6ew==
X-Forwarded-Encrypted: i=1; AKwUvByVVsJQrcMk1gTM3vqN8fEOulvUY5NzJbZ0QnK0ACvcy9oSKzPW+6o0uI+c042Qx5EkbGnmyXI4kEa2+QI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7sHYffABkfmB5SaBqi3X/hAE2tEIhc7TezMddSgiXhngJtx7U
	KLM+IrZwSwXH0GsFYy16Yq6P+Va0ijzHMKQzCAxXKZAh3t31Vgnfu0/nlI6Dfl+C/76ARvWGkW/
	877YomvNEl0Tc09LCBPB8EpgPakOTu08=
X-Gm-Gg: AYBFou1q4U4gieb88/nz0nrrJkPETUV3G2fyX2RqOURP/Sxd2fg5ONkZwNME00SO2ox
	etOA/HgOKDUa+2PH8QqsLf1k0t6GXs1Wy0TqtjL/pkoj5KZgEHlIstWo6bx/cZfecsKAj7x+aOO
	u7xQqZHPbRglHOKA6FgmR/dOf01iJbv00q5Q8wkb2Fq/ZnBypnMCgvLfRmqUgo5nPnO5IR208xb
	YJ68eArSRiCqy/BQVktz11pMUNhU8vKBjw3wcxNaBcTQ9yCidZ5eT8oSf+/MGnuKFhqHnFCtMkQ
	BWdRpID+0nMjGwlpgPVI7rRAeq970o4mMU5Zl8rum/ayrnaOsMZHA1weVh64BBcfDSB9rEhTt13
	cFuogIFzbT4ev
X-Received: by 2002:a05:6102:c8d:b0:7a5:391c:37ac with SMTP id
 ada2fe7eead31-7ca38a0cc36mr934178137.10.1791387393843; Wed, 07 Oct 2026
 08:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007092801.35649-1-jaeyeon.lee.dev@gmail.com>
 <022ec915-62ab-40d9-8705-90692e75acfb@kernel.org> <ce49e816-ae77-4c64-bd28-168d8ca52d8d@arm.com>
In-Reply-To: <ce49e816-ae77-4c64-bd28-168d8ca52d8d@arm.com>
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Date: Wed, 7 Oct 2026 17:36:22 +0200
X-Gm-Features: AclHuK_qZVYeP9e6a3BCk4ZuXrh1Fr29YQchvsleR4vDz7zanz3IAHpg3zmw-tk
Message-ID: <CAD+X6aDjhCGt_Btw7pcoj8uT4-tiTHX9+wEQQ4yjFx1KQj11VA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/mm: hugetlb_madv_vs_map: fix TAP plan mismatches
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Guillaume Morin <guillaume@morinfr.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:01=E2=80=AFPM Sarthak Sharma <sarthak.sharma@arm.c=
om> wrote:
> Anyways, the original code also calls a ksft_exit_fail() in err_cleanup,
> so this skip is just preserving the TAP test count, else we'll get that
> planned tests !=3D run tests message.

Thanks for the review.

The skip was only there to keep the number of reported results in line
with the plan.

I am happy to send a v3 that drops the ksft_test_result_skip() call, or
drop this patch.

Thanks,
Jaeyeon Lee
