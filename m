Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806625;
	b=xb7nuekeK7Xx3DH8Uv5hKjNa8aRj8DvlQ9N/atSFcVpp76IT9DJ6RWx4E3UUDbZJWbn4
	 MRBKbWS5b6tYF8tdyzmQErOFDfcI6Wo/oWiPV+R/KDHRJTnoGe2KRsNrskqkQ9/idrEuE
	 GeqtP0hcsB5ZAJL5qXzg1PE04LwxxIx5KEZ7lrj774AImYNwF3Oj29cFa+Tl9W4bjZMvb
	 ST+67RARzhYww9Hyel2FL7rR7QP3T0ugfdFlJiujATSZVdDX1rUWJLaD+kxfnhhNr4w99
	 bZn2/mQ0UL7OylOvRxUfqFCI2OUAk5rhnwj6A3ez/uxCO1OtHzsV5yO9IlOgyoOoM3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=W98HN7wJ4fZcfV5odlqIGcVOnLj/iuIKM2l41tHLMh4=;
	b=TaobcOk0TuhzeH+xEzqVc6pBp9MIfTqfTAV9XKVc1fMJqYjNXY+VqydqMDLUp95n+IlT
	 fdWeXQ9iyLsx39vDrEh1r7rj1a2AJ3LcZktqZrnZM94QmFh+S8bh4YCxfpJ8S2nNqgnGt
	 powzYRSOvoQQ0+T4m+IgBk3r5zCroR4zNOriteeTPxynYTUBtDQHu48vAmEUhF7DHt040
	 T7M4UhvFFjc0zaAAn49ry4BNbljaFODrJ0hey1E8YEA0Qfa4rEx60omuLRR2CcOUWA2mz
	 JLjm0Mi1pc8jlvyMvHmXh5PPhBXpsN2nb5AlR3H1JTS4PrVO8PEhrHbYLO9jywRkP7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETdVW47E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E44606EEB4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E44606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETdVW47E
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a9a1ed66b9so6878311fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793806623; cv=none;
        d=google.com; s=arc-20260327;
        b=kcA7SJym33wSaiuvZKRN4go3161NUPbyB0vME5FCA6FbwV9R9zlojDKyveH8hV/qZp
         zYMDHBX9/w5DNDh7MmhhIZIMznwXuZwus0BTY4r2XMmxb2kx2AziX9pyNxJsIcGai1t7
         u6Pd0L/cADmwU2k6J8B8sbiK/3R/peybkwbtZPVryIBmta3BWwNroUAn6gxGowoHBzTG
         Mns1CA+zaeG/wMz8Tvo5WqVx2FRTE4Yeau8QWpM5HuHApgvWojpSeyRyE6h5bNXxTnKe
         InGl3ZXhCDzhB/Aue3mR7SIuGJRBFEX32OuDyAMM8cEoLzU4bdwUVNESQy97Z36pv+pF
         Of5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W98HN7wJ4fZcfV5odlqIGcVOnLj/iuIKM2l41tHLMh4=;
        fh=pZ2j8o9REZD+2JnaXG0b2y8pREgJ56ZNomBjpyEagcA=;
        b=PBe8jbYlC0vTdUhEkWmOOMkN1E2xf8CKEog0N5FEZI6j69t6obXg46qnekq4Rqm4IS
         7MPj98zjM8t+jEvShViXvzpHXS/nTyn9ckiMEuScHCFgxxSSSrdcrmLc9cNJeV3TeIZR
         A/ojAhyh6mQ/wR1OuhF9DjG+loFMRxldZsdCNHT4Sau/L0K1mzzQfHFwj1ZFIZBj9tAa
         w/VfZVXWHyweKVVm7diQPcyXhYY056nfJxeP9C5sXEvzePo/uhdsv9PBkLHyX7ma254R
         zKzZSxCuuPYJFgrypKVnhMV+7Je6CHbcVXcYL4axyZsG1W8YZDywPLWgltvji055jUpk
         GUnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806623; x=1794411423; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W98HN7wJ4fZcfV5odlqIGcVOnLj/iuIKM2l41tHLMh4=;
        b=ETdVW47ERq8+IQVeUMVqMAqQCwFpkiJJoe7KGeo8X8fUPPryq5zwQI6X4/Sspby7R3
         IZnAeClJIqjcqBW933pNUHP+npj9dglngaNlTnUOReO8Op4dj8PYX418F4G0sFi+Frim
         NPZwKtkveE9D36hbqhQ7cGBKSWXGASgigNhpzykB5qe75RaXT7vraT53eEdcRDXKc5CK
         hV5TTpDFqcTmb/Ddk65RKUSFW5OymBNHUfWv98BxQK05kpY8T83lx++XG6MTMwY5A+T2
         650so2hJnfyyrIaCjW6bL3ou78fTTfIcDRTT/oRSoanTc8PJr0HQPmd2VHLgNTFNm385
         uF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806623; x=1794411423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W98HN7wJ4fZcfV5odlqIGcVOnLj/iuIKM2l41tHLMh4=;
        b=XzcowsYYjeuL4MqhVlUGKqxwVQcod768Ka8E6ID31sky7nyl4yP5ttr7WSD9VbABYJ
         Ecc8zC5fEa8xWHdxlogTL+GLvoGT6S7488DtqLTJuHCfeiOmCVvbNfZ/1oyx44HunRA0
         WY+Q3+PQRnRGpbGP9PAk/F1+yJN+uu4w/N4UgxEqWKPRT/l2Ablx1zkOtROVos5zDRCQ
         hzBZznK45jbJ6b/7Z06vHYY5AiyzG0xmsKr7y71BKUxySHDpooDrZLHbdDiz8IjUDtDt
         PFKF5cnb4JE5EqEgfbjZ2GFM2/C/fuzonnDCjpPpJ+sEYk3wZ8boYUj+xEG8YpCU4AJv
         9QLw==
X-Forwarded-Encrypted: i=1; AKwUvBzdgMEPSAN479niuc5Mv/YJCTVs/aOpgaP+1bXa5D+MtNs3DLpmJV5MtQZ31bjthCl6xzc0Wuf0sVwco/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4xYoGT28ANbN0jxmvp50USHs2PRnoOLYeDr6EHrivQt9KnI4X
	ZZ0zEwDVoqFEJftKTOTRDy7oMNuastoTMsron2eDotyKQdob+/gafT/Vhq2MMR4yGa1w4eLJc7C
	u4Y3enc7FbkZUEUIlsKh8vd5FgSI1qKA=
X-Gm-Gg: AYBFou0CvrBFubI5mWFPnCXvp3sFFJclwGFofSy9mYmOnLdtG0rRxJGHW9LpCN7722O
	ZDoLDDeybr0MC2vNWFg7pkNm6cJ113a1rveLidzfcXO/KBOHcNnbyNcgDqecqfEIcUID56josGk
	Q1neZvrBLbXlCQg37+iG71OKz7NMYImrNldQMScMR3RLyJItBnLcdyDIgTjqT88JSwZQiUv1dd+
	wq4MqPywi/6wy0C734TMRXyjn5H2j1COsgurk3HXKIJ2+3M7OO1FoE6BSEgwoxd5TfwCu3REmrq
	jUiBYlngTIjBTuV+7b6Ka3cE83j4FtAzFkN9IYCQWCaeHEAKqeZrJAErS5iS0qtziKnKB/R7v8n
	au9Sh32OoKwsGctY6B1sRkHzTZOH8JY+uVmDx30SrzUhdCDZ6D6R7hhvHy2DPMKi9ST780VGJGX
	Vi53vb1bbnic+rPndH5H1LjAPE3W0Q6OyzcX3XToacQANQ4IMgXw==
X-Received: by 2002:a05:651c:b07:b0:3aa:f72e:8ef5 with SMTP id
 38308e7fff4ca-3acb7a8f83cmr38793161fa.19.1793806622513; Wed, 04 Nov 2026
 07:37:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202608191340.98574fe2-lkp@intel.com> <4h7zrdfpu3ailx5ajkyqohmcfuxgrk3tn7i7n3dkp3ksy5xehk@xqg5j6pqzocv>
 <179361623876.3.16264907931792312619.redis-ibpb-report@gmail.com> <84ecf492-5a71-4871-a555-abb76a1402db@intel.com>
In-Reply-To: <84ecf492-5a71-4871-a555-abb76a1402db@intel.com>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Wed, 4 Nov 2026 23:36:50 +0800
X-Gm-Features: AclHuK-Vjr9iNtCEqcfXxOk7Wz6zZfhG5pCaMZhb6xGcDRnMQOLOvY9anCSqSS0
Message-ID: <CANGjgdnbBaTHYvvk1rOYH-Pe0DCHr0HWb5v6DjdNFn97dLtbNQ@mail.gmail.com>
Subject: Re: [linus:master] [x86/bugs] a3af84b0fa: stress-ng.seccomp.ops_per_sec
 95.7% regression
To: Dave Hansen <dave.hansen@intel.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, x86@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for taking a look, Dave. I'll investigate further and follow up if I
find anything useful.


Chengfeng
