Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE84746A9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814285; cv=pass; b=OJUBxgzYZxfQh7+mTMTq65Gd8NNK8+jPo9JsxgoH/hT+x/19WyvVqJczHRb39s2FeCMMzcID/a0mijGIzgvaj6Q6hyqq6CCjdx2h2iFLXhWGAmtuZM/cfPe0ssL4Jc3oiA5oVC0sVu8OfN7hGk1+z8sKP93SVomYeW57rr4TtJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814285; c=relaxed/simple;
	bh=toTfP3XAamHR53tLn5nTeuCeveBATzueww87oO23fhc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RA1YH2BvEaYfR367wZD0k6m1kGF8jpwCoTRW0K65ypI+oh4aXxn9/jDbMHzZqO23scfbWchpQk39ct4eGJoD2FectqSwYxS/WPQIYjlF5E5DQDq23p7oCD4OgR4OtIo+7WJiwrAd1w40xE4+BF7v7YSbENdda1pQlGCoJ/u3Y3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=riuHiHDN; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="riuHiHDN"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9144e8021d3so29085876d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814283; cv=none;
        d=google.com; s=arc-20260327;
        b=fSFFAQOgFSPWN+gtr8O7cPMY6RaUvYvqgwNyYCdy+R/ULXTVRcq+9tqSicZ94Jgzo0
         B67aExxkENQnd69rr6Zq/LtoH2sKRApXd1xcu9S1j22mdsA2cM6QpCtc+Xb5y4VohrS8
         b5apgMHO8MjUKCoWRXskKeW8IlXBJ7tpK3aJvA60gbkdbRp0AUZhHekvMpdYJTk9G09j
         +ydoCMJvAynoMHbDQ0LpPalHrTKvvbLoFxuURUowW3Xl7j2SCqPk1Clx4L5yciKlSA0t
         G3fXt7uGMCAGJp0NZ5aUeTkQwdBajEbZavb3btuPoyr8Ev4Qh00KQ+Sy7NT4tAorYWYR
         oKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        fh=Evr8fuUZZzBAKBvZIoHA02njxfHNYOsRGq+Cy7Y0/4c=;
        b=FeyypRqlZqq+v/VdMjnZtpY4bjmW0LSmI+ICP5ODUh/LaHbhzD0S8l6NThf/8CjpMQ
         nboC/te8gyy3c022WCtvInqy2Hao2C0dcN59Ri/YhIWAflahcKp6+cWvawcoWqu5YXRb
         Q8i07c8DfyRaDHJa0QQpOHG9fvVyBioVVoI+7CbrdWxQx2yiIm2+ShTI/gfkiMR5zk43
         2uyp+PQSjp7jgrd4xzJLTgupdR5EVIFCU3EvXoV6y2/KuIa+7THKzHZA/yJy/1Qk7QWI
         LPctdnuSdAZWT3FuUWndpn5kV4THljAN2FAvEhJGTe/C15A27+0IRhQt9B+GWA+zvWbe
         o+TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791814283; x=1792419083; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        b=riuHiHDNI9VbFbKH0rde37/ykIQHmtHxc4wUw4QOAJXPzsnzi8j+1eiNfM0X4MguS4
         JXwovS5bZUNydRY/IxjZYYmuQpkw+RJvr9LfcZXyjpTz2u87kRr7GiKsTieVmsanIWkL
         UwjCPacdD2mICgm1V3og5rguoRO5WIdCWYbxD9AijiQXbBYr386NufiBinUAEpfXH4+X
         jLIJt4F2o9i9m6KcdyFwCTnsW3PD+DSRKDYlvQLjNV08LUFp5TymTaNl5EtsTWwAovql
         mmu94+cOesk/2rCSd0D/Tg3YDsQ4g2d2FlPJtslOfah444xvgzoWE/Atm/cGEmQbc26u
         Xw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814283; x=1792419083;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2I843zxPr9lME1nSEmz+NsS/OxECT+sAh7A1cwprg8=;
        b=fO9+ISYcQuFTbVaNCMIbqgfGEg1TJvzdWoXYUKGjImR3adH+AL9LNDOrI6uggYHKUX
         saUB9VKPTqDxV4tlAcfnxLsPt85QF1/uEcTQOIiF1nO/21ED1FV6sSzrEeEMt1N+nM/U
         VmzR2UTfGqjU/XYq6onKePbWEoQTsfRfTAnFz4pyAdSB/apgAoPj1gtZQgZgySOj05K/
         sqeSpCaYtDDBz0Q1gGJ6NnHvgy6dBQDDB/nEPdf86+HUi+d/MnLbVG2BLxqeQH6CpKAl
         i0K6S8O64ittF1+/OIfr8UaoKaEVzWZDP5buLTTgh+kQ/F7ivpk3y4ZqiDl129LmDbDn
         +rmA==
X-Forwarded-Encrypted: i=1; AKwUvBwidemFL/X4TkKbX6gEua+hSEtX9BX3dfzGRev2Ck5d3WYCNw138NO158ywIOw5drZU7crkHbDXF7SSfC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYImdN0ZN1SYwl0FlPYFuiolsHElhGxTQUrwHhH9RE5t7fBKkaEr
	xPXQXfMGuulp+T+E0ZkNd1GfjTjU7C/krFcFB1GeHhaqKt95m4uoXc/WW720WQQX5HlXrGP4jy2
	tKbcBF4kJShtlxO3pd8yGU29VwoeJmrb+22VhmXvK
X-Gm-Gg: AYBFou1uDrl0itKbrifnTOBOVtbSB0TWfw2NEiiP4+YLlVKliHI6DsSV3AAIEHvqTTL
	hc0jJoNKIC6K/IFe1lfri3C9H/PNOvHo/z0pFrCUkIbK1CwG2JXSnut0x0R1UhFGDqj5cjz6NlE
	FswpmHxPQEzNYFgBpbnTNGtq331Zyck+X4e6SoVqTpD11XcpBBzIkgHX/xj5EleV/tEUiAo04of
	BsXZJpvAsGSK4iBbfJhhT0yhXH7DCfB+u3WHsG7/Bbv6Fow7bAXFJ+fJxEf6JpjJPSnXWOYTTX4
	gzVsjU6zxUxJQDhGijVyNrxeLG/RQPch09Ud6JOZkHk6BspitWOfc7I8mLDj4ouHv7FkRlev7zJ
	BHhPa7P2Cie87IcdsVWI6
X-Received: by 2002:a05:6214:23ca:b0:91b:8e83:e4b0 with SMTP id
 6a1803df08f44-91b8e83f3b3mr19792736d6.20.1791814281518; Mon, 12 Oct 2026
 07:11:21 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 07:11:20 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Oct 2026 07:11:20 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ar5iaaLcyz9dCXQI@gourry-fedora-PF4VCD3F>
References: <20260925-gmem-tmpfs-backend-v1-0-d36159822d18@google.com> <ar5iaaLcyz9dCXQI@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 07:11:20 -0700
X-Gm-Features: AclHuK-GAlH1JSAYNCIS06aJZxJfvunIjbH1E5FXsRqa5lYNWWJsyEqAXZVZwzo
Message-ID: <CAEvNRgFO5FUFwU2GEEbHogLmT+SXVu1asLe5uzvRte2jqXthUg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/17] Allow guest_memfd to be created using a
 resource (pool) fd
To: Gregory Price <gourry@gourry.net>
Cc: Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, vannapurve@google.com, erdemaktas@google.com, 
	jxgao@google.com, rientjes@google.com, fvdl@google.com, jthoughton@google.com, 
	tarunsahu@google.com, pratyush@kernel.org, fuad.tabba@linux.dev, 
	David Woodhouse <dwmw2@infradead.org>, yan.y.zhao@intel.com, michael.roth@amd.com, 
	suzuki.poulose@arm.com, Christian Brauner <brauner@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, Xu Yilun <yilun.xu@linux.intel.com>, aik@amd.com, 
	aneesh.kumar@kernel.org, Vlastimil Babka <vbabka@kernel.org>, kernel-team@android.com, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Gregory Price <gourry@gourry.net> writes:

> On Fri, Sep 25, 2026 at 05:50:47PM -0700, Ackerley Tng wrote:
>> + e.g. for tmpfs,
>>     + Use mount page size.
>>     + Respect mount size limits.
>>     + Use guest_memfd mpol and fall back to mount mpol.
>>         + Gregory, now you can set mpol upfront on a mount! [3])
>
> I haven't had time to quite give this the read it deserves yet (have
> been traveling this past week), but I think this mpol/mount issue can
> be solved with a new dax driver (which maybe provides this provider
> interface) without needing to involve numa policy at all.
>
> Essentially
>
> fd = open("/dev/cxl_dev", ...); /* backed by anondax driver */
>
> then later when a fault on that fd happens, the driver provides an
> anon-memory allocation that explicitly requests the node associated
> with that device - as opposed to trying to jam this into mempolicy.
>
> If you're planning to be at LPC, happy to discuss this in person, but I
> think this provider pattern is likely much cleaner without mempolicy at
> all if you can just make the provider do that allocation path for you.
>

Nice meeting you at LPC :)

I agree with you, I don't mean to require some kind of mempolicy setup
for every provider.

IIUC you're saying the entire /dev/cxl_dev is some fixed NUMA node, any
allocations from /dev/cxl_dev is from that NUMA node?

In that case, if /dev/cxl_dev is used with guest_memfd, guest_memfd's
configured mpol, as in kvm_gmem_set_policy [1], just can't apply
then. /dev/cxl_dev fully controls where the memory is allocated.

On traditional mounts like HugeTLBfs or tmpfs mounts where the mount
config supports mpol definitions, we first apply guest_memfd's
configured mpol, and fallback to the mount's policy if there was no
configured mpol for guest_memfd.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/virt/kvm/guest_memfd.c#n400

> ~Gregory
