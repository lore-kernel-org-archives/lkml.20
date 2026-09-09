Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D24F55A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965568; cv=pass; b=E50g6BE9NBCzv6q/AU8x0ROdt6odE29oIway8zKBjfRTMnOunH9E5I0KMNpk/FpcWt1yTd3Yt8FUWR2mDEI1UYb11okmfX97QW8o/MIncweWpeL3uQtjBhgOgZ8eUA3Y+rMKyBiatGan/DDP+3OmEFlnffuoVuzNFM4iTqpqub0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965568; c=relaxed/simple;
	bh=nlL495Rwgq5pTxpggaWR4Kyh0bctH6OQcmcJP4kB+LI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwr2wtXcaVMQYjOzsTRWg2d2xfuVp2HnLmQJityZy5+JNyH730Z74fDDL+mEPrQDF/ddCqkVrTqvRJId5IA3pAVUeVeNnyTU6T3NqhPOfQNg35gi7mvaVic4tB/mLtpmiElJ7mZS0TE4NnRWUoNyJ/b/qXj35UF6VHu8MBI2KKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q8i3qMhU; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q8i3qMhU"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-878ed0f17bfso38577417b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965565; cv=none;
        d=google.com; s=arc-20260327;
        b=riEz0UiAzGxfRpkLSXLlHw+7kQF9OPTIsMFpxeK4/IzcF79JgMPHSQXYISR3ocDmeH
         hV6NQWnEUzIcf+yVD+OF5ZWc+aYJtCOXhuMKm6DKxMuCkFXe4IoPt28A6uORV6oEHAs/
         q/XhkFB0iH5CmtxhfIvFzxBwXlksHn/c62lo6+/QHHjiU5pTVdpUd3m6AUVkqwpyJikY
         lycb6nCcBFdDzPZdGLNj7ei1SQVrw/QyQ6tD54WLuRXCLshDmna++V+ZHMiJjp+1xorV
         gqNivkcRThOAg5lRc38T5yXz/e5RWc590OT/ifMFF6CCH8rlZeQ4ShvX9Q+g7ORBHJ5x
         Alvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        fh=MmM3aem3J9TuOaNJUfB3I47bovupH9TbadrrM1r4r8s=;
        b=dLMkXTJ1SRzicQjOJaMuZRjQ1TKvZhq3pC2pfiOSwl9sSiA7/CIn+ThpPjR7LQ6A4x
         tRL0tL7NrIa/r8NwuIFT99O/gcnImisYmDDgaj1FWiWFtv4Ys2sD1rPCPk0CzC7rq3Ex
         iFj5UhC4xMsjMPhgXv2anr/y93dTEbfreSUfU59XG+vYbHEVdun6k4ZLSResk/ZmjAxy
         MCqhpl4SMpapeRKpADteqG8YqRtx1C20yTJqP9bcO6Xy7hL2QjzRSzFEQ5LrDw2AA5fl
         vamBZfacPeQWvUOICD90iPUOSiGZ5Xgngc3EAS3YYa5QagPKa3tfAd+KDlkdh9gXBgwd
         ZnGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788965565; x=1789570365; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        b=q8i3qMhUp5t5ZXPUqJ2Q7wyst4pkqzz6PPNiA9qPABvr5TxyN6xE+mJfG4pvM4uaZ1
         hXgisclAU/Lka+Zv9mMs6hWHgsuGeUiSnXazvtjRlDl+mRcyhK0QxGsFG2fOHKEJuLDa
         uSnTA6nhxga6hmxGoPw6Bvm5LBSqKV83ZZFkqSv3vX8KHfOO6/t2ZvUNFNJbwxl7oaU8
         cGzs9DnJlC6Bly13MaOpMSLyMWnKPMOMtGDtRzL+H4BuT2m4ucPCGKrl063UZ+FXGWOO
         HUnv3V4svnbBaQst4Gv9XvhVy8D2/4PMcgO6j6/BMPC0aGQEZjOtYe/60bQqzO9HDEVV
         X3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965565; x=1789570365;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRvd1Tt7kpHM/AxQHBaJz2yfsVBadJLI9GFkxk7vpJA=;
        b=aX10rcLFLWKBaNN9/EIg+n/bpjgDCAQ1godRbWGolxilYxWJCEHsPRn7vyZMlOLSdm
         NGE1IYFNd2YKGACNEq89ESZZE3HaQzZDBX5uvTcJ3AK8Jp16AqN/daDkueWL8xVczSeJ
         PDk7SwR6Yj2h+q+xWlPLLod6qwoiXEn6Au2pTHnn/Ob//sLu4UEKkdOY0kQJohPgHJ8v
         TRANFmDN4N2RNmJQzuJjdXpqLtI9HUxnCibr0u+yfao5edj8WX7LcFtFZyS/K4sO556s
         /9mFZu0xaKqG/i3UJykfHMAZqT0fqX4Kb8MbBUmeWlI3ctWf+HqEYjy3RWZpPmvjQ6Iv
         AX0w==
X-Forwarded-Encrypted: i=1; AKwUvBztPGAngvMl6AORtgiE3NUZzpyq0lvB7bW9MrSRnXcxRCm+HAw5+ztg/StXXv2DcbDgJI55aDZ8kSOdtzs=@vger.kernel.org
X-Gm-Message-State: AFuF++n0J9GZrrxpw3kmUbVYz6SodTVg+9n1ej4K4NixP9NmbQvBH3Lt
	RSulFUjCqlXpoMQEaNEFVWgn9ra47rHu9QcWt6m/9oCHWHJfsIdF0ycGj6ZzRpm1ZBAZlwyfNac
	unwLCATTC8rksjYzhqyueLz+hJySyp/Y4zdEfJPKY
X-Gm-Gg: AYBFou15DydHZQwuuTQGMAv3s3XF8m1EHmNZTe2iww9gTW59EjMD+JkYQmzGwp0bxvo
	/lcdKhNeG4vofvKQ0W2Gg1JmhCRt5gI1cq68eVEs6S9KrjtnZqYh8HPDm8SIyV18Q9AZ6/NXr71
	BxqBiX/nA8sKY60bz0F2mxa1y9owYxBwb+uh0jC6k9sr/BZoGHhRyCS4rjuxKy38gV120lpQDVU
	ua4V9vgJ3ak7qYrIxjmOAtH3JLWThIM/Y60xrlScx8Nv0SYpftLLWyS0IX/QvzEJXAA1DFnlivP
	Udxo8c8eqhA0YlIWBobMEfvMaZnGBqqZZbyF7lSckMID0VeR/XB6ramw9cDMBlab/AXe6FDbqKw
	F75EpeMj1slw=
X-Received: by 2002:a05:690c:6b88:b0:845:ddf4:a3a7 with SMTP id
 00721157ae682-87126aa77dcmr145268997b3.16.1788965563207; Wed, 09 Sep 2026
 07:52:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:52:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 07:52:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
References: <20260830-gmem-inplace-conversion-v12-0-85e5fd25252a@google.com>
 <20260830-gmem-inplace-conversion-v12-14-85e5fd25252a@google.com> <CA+EHjTyU1Ldbw-qqdQOx_P8jrt85QEcKSGae2h+AahsDQdbmLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 9 Sep 2026 07:52:42 -0700
X-Gm-Features: AcwNN1XhqWHW23-sQN5ajMsWY1WhBdcubAUAi4IgbeOekiJ8g-YJ7YTjJ4UYzFA
Message-ID: <CAEvNRgG36aXk8UW=Mi7ey-6vUe1EOKnkgNRNzdSUz-QJih4uAw@mail.gmail.com>
Subject: Re: [PATCH v12 14/45] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <fuad.tabba@linux.dev> writes:

> Hi Ackerley,
>
> On Mon, 31 Aug 2026 at 01:25, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>> From: Ackerley Tng <ackerleytng@google.com>
> ...
>> +.. _KVM_SET_MEMORY_ATTRIBUTES2:
>> +
>> +4.145 KVM_SET_MEMORY_ATTRIBUTES2
>
> This section number collides with the existing 4.145 (KVM_PPC_GET_COMPAT_CAPS)
> below, so api.rst ends up with two 4.145 sections. One of them needs
> renumbering.
>
> ...

I'll add KVM_SET_MEMORY_ATTRIBUTES2 as 4.146 below
KVM_PPC_GET_COMPAT_CAPS. Thanks, good catch!

>>  4.145 KVM_PPC_GET_COMPAT_CAPS
>
> Cheers,
> /fuad
