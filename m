Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130043A6EE6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667181; cv=pass; b=ZV2o0+5svmcKMXjn1A3CdPjtvI6mskXW6g5ydJR13eCXbP8v/l+pNSeuWs/NRjq+zg7SibPPHK93oJeWnviy54cI4oGM+Kr8UE65lqnojeF/PYY6CTrjqpb57OwyniYezxWTsgRdPIomQWFntYUju9SwzMHWL7DMEZT5o5XQVtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667181; c=relaxed/simple;
	bh=R7xCnuy/7g5iJFczMExEfQo/POzPplLTdlE3AdQob64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWpMWaDXt8DiKNOTZEpmD6wvTbsz43o0786mOw4sYdcKJZa+snf+5e10O7DLIPkcHwpFoqx6Izijl4tNCQYZuts34PBfyOrB+S6Xy9+PN67vKq4IS8jzLQ1X56+sxNenu0DPEoU+Grq0iIeQceqIareo408oHqqCjlhwdnioHRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H1HB3XiL; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H1HB3XiL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d3b445a84fso29215ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790667179; cv=none;
        d=google.com; s=arc-20260327;
        b=jtDxsxVXqjb0gG5Cvq9CQLADCU1/qlEdCOfs+TnKzbViCQNnaVWv4gxnwPR8kbEii8
         llhQ+yn/b8jx9gQpyaUCwstt5chSYDI0N3WiqWfdlPjwxRQwM1QBDHhQycmAhANG42hW
         p1/8W5KCZS8qZJkj0iPzpDu56IDJF0/YRljDP8KbdoqD9gx0iYP/D2OflyRhcpFP5J1+
         KLEq0Hzteo25Uw7d/C3ucADQRnTF9H0t66hXdoG+CpUz1XZEsnTZULcwHmp3DDHODwSq
         H+OsxFy3KZ0tdqGZ5d9UANIqS9YuGKUK/5m5tlJ07NW8XIBdTq1VT81oRLqBBxNVi9RX
         PRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R7xCnuy/7g5iJFczMExEfQo/POzPplLTdlE3AdQob64=;
        fh=Djg08bPgJVVntnt0PRob49g9WB26gInNCVJqd6X1pIU=;
        b=fTFEQCDQn7VlGQ0EdjUKV7GBmC8DeVwg4C9WRgPAq4Y9pLsEU10rdI+W5bt28ewhFW
         x4BxekkocwIJhh989R0rjmWd3bBplEckqdliMLcG9327pXYY8zHSPj/+hfft+ye9FXGO
         HqcjmQpeFp15jfGV9q3h5jTRBQGJnJw+LeXCImjPs2h/73SIndRbQqvdiaL260e5M6Pd
         EjD/k6CpViuU/O7f/Jwjk9ZV6n0OxzbKniypQHBuFEPFRxAJTyNcMBSd/jLW3uCcDnnH
         Q7BSEJCjq1/M9XfYvsuLx07HZlAD+7++pNkpeqxqN1XbnLqD622A57ymwOtx4wVJS7Bw
         BsMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790667179; x=1791271979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R7xCnuy/7g5iJFczMExEfQo/POzPplLTdlE3AdQob64=;
        b=H1HB3XiLmsZi7HaOCEcuh3B6nJGFQxSfm5yue3dl7CWNnO0f4kncfZMf3Le4GKCTTp
         DnocZtOTC7/9DnvzKYeQ7jZ9ZUkKgOWwXxGYhTNq0WKGrdHmHxs4oUbSFMema+izDL8V
         N0uetuS1j6qSVq5N/2phKqVGfYlnW+GVeUh9/VyLj6CXqyU/KuBCGmz6McB+HwbQPzn8
         2d4gFHe7L/lEWI4kXazUFzNWu4or4dXFb5vK+sMvPcCIl0XC67gVYAT/A/dvrAFMrUBe
         2pdx67bRtSnfwsdAlI2Fu+WeKPnqmU3tpmxwfEVUueGtGSp2vOhQzwXhJRgbYZOP1cmj
         CMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667179; x=1791271979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7xCnuy/7g5iJFczMExEfQo/POzPplLTdlE3AdQob64=;
        b=kq4JtkbUNzpCDhX59XFdzE2VjS4U26+U47kCyYIg6UnT5kYiBeeppYPRwhku3PxF+g
         7st5fph1uhppVGOpTdnM+4pwmXfgfBc9l02COCahnCXjxQ8QlrYirftBZYxqKNNrEhWc
         XssHcUWGJ8HM/cK0w/SpMZ/ZDzQSubc5gGvYmACsh2EAYC0IRpVzziuczUjhkl/icoxH
         ZUgsrbrbtGhJGOnuDKQElo2uCvmCGlYZMqq3LXTwVYsQGWVz/YspKuKK2wXmlz2YhIZs
         /eY3iccIxXi1um7HobDA4MTbUnPMOdNNjQnKCyJVWDDbPZfhzX1a3IZjsJTEA3B5Ccja
         d63w==
X-Forwarded-Encrypted: i=1; AKwUvBxvzpZL5e1dlkzXAvBAlIuTok3TTWc5FDqWxa0Rt517TcOFInWuXXGJTQfldhGFoVYLTx3wxSomeGXDO2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYK39wbhJ0mcWsnILoTrSOO5GmPs8qq25BW8t9zNOVdYBPYgwQwu
	pmsKkmfAN/lGUcW96/d/Z5FW9ZtgAiFlf5eHumdj9jHCQrgqwfoXgmSrtrP+gcn3+RLizj7RVWP
	6UolhTc4i49eOFpOdI/ZqkaU77BSGySCz3Ln7ztEw
X-Gm-Gg: AYBFou1D46CwzbRnXkwreLxwR2EApR1hzxlCj1UCpvwSLV8xBnbvLeGx+Zv//1xf03d
	EKHijYuT/0zf5oe4WfIOrsyUgApM+cwKjc1IF7x4aKpwYwSnrwIn1XS3bxIJ0sINN7fArsL/DGY
	RjiY3WUZ9y0m40c0VENcrJcE6F4t75Jlk1SuafcuT3K3qfEiaqlD/uLBQng0Uxp3GKbiMjvRYZc
	gJ/67mTkHFymSzP8R2nVOvqiR/s7pOAh6cm9bVlo0vE1bMZ7bRVFfnZmPEXLLsOizy6AmSDZDkF
	3sbwUUQF1Jl/rS81UhWuS45AMEIE3CSR/Gko995aSuqJ1vkVw06ZkXJOLNynYXD2c6/t2Xy8Hyc
	kYp/ihoJCTe7W
X-Received: by 2002:a17:902:ccce:b0:2d5:db3d:1a44 with SMTP id
 d9443c01a7336-2e2c7a23584mr2335885ad.17.1790667178733; Tue, 29 Sep 2026
 00:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924050009.19974-1-sarthak.sharma@arm.com> <b8da4a73-296b-47f9-95dd-b8a74f3a0984@arm.com>
In-Reply-To: <b8da4a73-296b-47f9-95dd-b8a74f3a0984@arm.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 29 Sep 2026 00:32:46 -0700
X-Gm-Features: AclHuK8NL08FRy_baDRvYY73Pdr5_fLWqFBgJkAq-JJf_OGtsBih00TomEM-M5M
Message-ID: <CAC_TJvexEaehZno0P=xsoCbLw7wgfz+22iV4fwzcuGCiu3vAAw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/9] selftests/mm: improve mremap_test
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun <ts930@dgu.ac.kr>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 10:54=E2=80=AFPM Sarthak Sharma <sarthak.sharma@arm=
.com> wrote:
>
>
>
> On 9/24/26 10:30 AM, Sarthak Sharma wrote:
> > This series fixes several correctness issues in mremap_test and
> > simplifies and strengthens its data validation.
> >
> > Patch 1 converts the mremap_test to use kselftest helpers, removes
> > manual tracking of failed tests and corrects some spelling errors.
> >
> > Patches 2 to 5 fix userfaultfd skipping, unexpected mremap success
> > handling, multi-VMA data validation and failure reporting when data
> > corruption is detected.
> >
> > Patch 6 removes the randomization and uses a simple pattern based appro=
ach.
> >
> > Patch 7 removes perf tests and timing infrastructure.
> >
> > Patch 8 removes validation threshold and always validates complete mapp=
ings.
> >
> > Patch 9 strengthens the multi VMA validation by also checking the
> > mapping state of holes after remapping.
>
> Hello everyone! Just wanted to check if someone has had a chance to look
> at the series.
>
> Also, Sashiko has a concern [1], and I had the same while posting the
> series. I hope I can get some opinion from the community.
>
> Currently, for PUD remap tests, we allocate a source mapping of 2GB. We
> only fault in the first threshold_mb amount of memory, remap the whole
> region, and validate the already faulted threshold_mb amount of memory,
> which is, by default, equal to 4MB and can be changed by the user by
> supplying a command line option.
>
> Since we plan to remove all command line options from teh selftests, I
> removed threshold_mb altogether, following some discussion on the list
> [2]. This would now cause a 2GB source mapping, and its contents copied
> from another 2GB buffer. This causes the process to have a 4GB RSS.
> Sashiko says that this can cause OOM killing in small CI machines.
>
> Would it be okay to keep a 4GB RSS in this case, or should we find some
> other way of validating a part of the whole range instead?

Hi Sarthak,

IIRC when I initially introduced the test, John was concerned that
validating the whole range would significantly increase the duration
of the mm selftests; this is why the threshold was introduced. Please
check how much it increases if we validate the full range (with
David's suggestions) and if it's no longer a concern from other folks.
I am fine with removing the threshold.

Thanks,
Kalesh

>
> [1]
> https://sashiko.dev/#/patchset/20260924050009.19974-1-sarthak.sharma%40ar=
m.com
>
> [2]
> https://lore.kernel.org/all/2e34b619-085f-4a9c-bb41-bc024fd40dd7@kernel.o=
rg/
