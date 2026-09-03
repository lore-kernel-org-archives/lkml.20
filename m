Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D507D4FB9BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456934; cv=none; b=t3xDk2HMyZG2VeqtOCN6oE4d/hQ82jDclIVxsiyx/MVzisHNMtp0YKfmirWhv/4ShqsxmXRVvC838w4XLJYp5ig6ZqFvzOZj+O/WBvcsXf+Skf34Qmt4+/jFDgqx12kUETZkaqfaGTcOIyGI3Tvt+FjaCGJNed63vCKe+mTqOMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456934; c=relaxed/simple;
	bh=4dpHZZIXlMGDgZ+1Ohw99veY4O7xbZj7iH41Dd9LmjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/8fUy/DoZxjxgnjpHsanWf7S0BmmHNulCNbd+TNVWcbzuXqIB3N2WdJBShqU4TVGsCWY2YltQAwAtue5mWs9jB0nH22iljLoLkip9BNqjgCem9zlf/KSLYpF/UhNmDOV4B5YB/b5RS2vZmN5J+TsAjb3zypDlqZKLFYKKf9VlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dFAygRP7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dFAygRP7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c25fbcf5d44so7682366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788456930; x=1789061730; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7b6E63blAP5xnsdva8mT3bQ5wWcWdQ5+H2n507fnLTI=;
        b=dFAygRP7y0LGDC6HN4bMaXjsE/q5s0TmRRsSGO+cci3NBtUM0+1cSkfwlBMl+a75MK
         LyeXDc/XB9MwOUdaUsU+AfM8Xpbi7jfqlNYREhfw+jOrQIbt0d3r/a7mLS82b7HCcZ0/
         jZN3UjJvKamZDccEvI4JxUhMhALOPY7TIzpQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456930; x=1789061730;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7b6E63blAP5xnsdva8mT3bQ5wWcWdQ5+H2n507fnLTI=;
        b=c3oDqlP/Ve4mro3WuwQ5FMx6HaCKyvwcuUsOZgMepiDxgE8e33dV2qoo0ezQ7cAxQn
         +rrGsVXYCR5FhCitacYoaeDsvIdWiQSWZf7RVEI0sA9nkXNW+BD0+b+EdRd/Sf4EszZg
         MNvv9ttUmpUqgQyNiIEzwPh88bMoRhVaKhiczS822VPJR+5zZSh6fbVZb037hYUQdxxK
         Dsdi3Kke5HQwb3Gr//Kh6lK4jAA5DO3XP7hfh8wH8zE7GJwJ081TH2WBsCYt7Q89r8Dl
         UF8nAfpYkj+bqPMKVqfNsu0wx5nqUsaWm8mDmiWPJp0jV5lH5swTyy5XdWvnVlfcaT71
         yN/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlbA55aiI/ee7ya+vzUNMGzMZ+vVfzYqbfhjhsbe4mCarknq8x4MbeIPtcfL7b091QO6B1vLRnS6TS3EY=@vger.kernel.org
X-Gm-Message-State: AFuF++kwQeyCpU9PdtS/nG8a8HF9h9DVXeRMZNu0XpyVQA6bq56GAXI1
	W3kcVU+zF3OJwEh0MtF5wnDPjMQuaaMNbGNfF5HNV6bjM1gjC35KlXdSrOVPC22QjwHijXbr8tC
	NzplJcBc=
X-Gm-Gg: AYBFou2f5XA9FqSZI9GNGpFNluAv6EjOUcV2XhOaCwOiBIstZm4AAVx+PMa5FQsWYr5
	djRrlMGJ1CkMYF55v3H0WOkeMvtCDCkddgvPT9A7ygUr52K8M9IC3IXs7jljSLaaqNCttjJAHkE
	KKVLfPvxgRumbPeoxY+NlNKYHKe/IBevhcSGVTrj/9QEnagF4PT6U1aeIlLKoHELzzTHGv4Gx1u
	odG0d800NVyccU+02cby4XdOpYHrY/2/pR0BF4EDqc3kSaEFQmHX/I6wQocJA6/adfhwfjiUHQg
	mbHwUtPFVeMp/dYiEnduMVf29Bar34EEfmb8eJCco7kiY3+emE2HdxmzttGbGAgeMKunwDUHWqF
	cm1BEgrX0G7PPB8DCqk6TV+z5Xyz1XkTXU3/cVMzzv1eCHmfVrmN5soH7KK4jCEhNFJC59zU52W
	1UyOrLgonrV+IGfFoUUtnynUVTPxgshBPHvbt7WlExIvASlOrqgKKmnGTTDyQZSFFdkUt8YAGsG
	dWu5vRcJvuD59fvpvSabQEu1twTUnx9Icux2dQcZm/5FbNJ
X-Received: by 2002:a17:906:f586:b0:c20:1bc5:7002 with SMTP id a640c23a62f3a-c260c6a0e2emr24121366b.3.1788456929947;
        Thu, 03 Sep 2026 10:35:29 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036902sm2568466b.3.2026.09.03.10.35.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 10:35:29 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2531f453eeso5641666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:35:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGNgpjl2+KpoDHqDvhhDCKkblG9XD3euR8UbUNKkW3snwi9dD/JcJMrgxLlTO+mNWye4DBnTRYDSiGbq0=@vger.kernel.org
X-Received: by 2002:a17:907:d93:b0:c25:2a78:15ed with SMTP id
 a640c23a62f3a-c260c8b4c36mr21478166b.6.1788456929113; Thu, 03 Sep 2026
 10:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903171054.12158A58-hca@linux.ibm.com>
In-Reply-To: <20260903171054.12158A58-hca@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Sep 2026 10:35:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgmQsV=5PEkazqEJcV529Y9jLry9XL2u+XJLHrkMYd7Gw@mail.gmail.com>
X-Gm-Features: AcwNN1Xdw4-Usv463WhkZMP9y3XuNRoReBatSAOiiqD-FTNXu0MZMY5Ezb6E1vw
Message-ID: <CAHk-=wgmQsV=5PEkazqEJcV529Y9jLry9XL2u+XJLHrkMYd7Gw@mail.gmail.com>
Subject: Re: [GIT PULL] s390 fixes for 7.3-rc2
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 10:11, Heiko Carstens <hca@linux.ibm.com> wrote:
>
> - Use jiffies instead of jiffies_64 to address a data-race reported by
>   KCSAN

I went all "Whaa?" on this - that makes no sense. Isn't s390 now all
64-bit, and there should be no data-race..

This seems to be entirely due to the fact that 'jiffies_64' isn't
marked volatile, so KCSAN complains about lack of locking. There's no
real data race as far as I can tell.

I can't recall why jiffies_64 isn't marked volatile. It may be just an
oversight. And it may be a "it caused gcc to generate crap code on
32-bit architectures". Or it may be something else.

But I think we should probably just fix jiffies_64, instead of having
bogus "make KCSAN happy" commits.

I have pulled your tree - it's not like any of this is *important*, it
was just confusing to me.

              Linus
