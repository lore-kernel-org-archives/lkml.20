Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BA4379EF0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983537; cv=none; b=UQOcd6qAZ3BiT7BEbyiy97clHevPmHInUGKYnNVfAfRNc7y50CoHwlAYYZn6lCk0+LgbIhKNaUA+Ie9PzcaZvwwuOnKabm53QMI3iFVOzeL/3TGOtMizMQM+J+qjORs77zFWFWfJ5UGVo3lkCNDGeOAtnkznU2NVS81rRN6Qw8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983537; c=relaxed/simple;
	bh=U/TNpxXOdrQL61OvXDHMNpk6Uq9BDXbfNNEI4cvHvkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkD7KHT01ACcN5ZdyVKxgfuRFHkTBiVmGfu+3iLWpr0hTPbcxb9vH4RzLkjX+tOFNmP180pIb8copH5EEUWHuCh2e4xfAkIUVGhnVdZwJ3CaRKKepAn4FOckBd3ArwJoPCdcBFdaXR0E/5KaTcTzmqCIbrDuR6WYDZ5+wcyTbC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njSa9ZdW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njSa9ZdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7DA1F00A3D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787983535;
	bh=U/TNpxXOdrQL61OvXDHMNpk6Uq9BDXbfNNEI4cvHvkE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=njSa9ZdW51F7u9sNbBbSeSniECyxKh0bQnizh3VPdRvUwiVeZcRUX8L4WK0vKmpek
	 s0OJspytUqxUMuWackfDsNRyOxUSECh3L0nbybetugS02R9OHuIEXtrGX2QrscqR1r
	 AeRCSWr+DPpKQrT7fgY5r62SpEPj1dMOhsbfJGDwfETLAo8wfVDI/xPPqj1f11AFr9
	 WlnEI2pVlvq4RGIgbmiec1BEtIaeo5IKsqawN1XuVzsvflPv53D2LX9rXki4fUUXN+
	 hw53DOWeyuCAZHUuEDw6QI6iXDlhrq8nzX04GRXJiyEdMydLBBvb7N1YPJLfKT1wUi
	 6PZfQO2yiedCA==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93905b1dc65so101969185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrAFbG3B+V2zsPZ49DBAq7v/SwZwFQG7AFRmKUxwm/rxES2fkebuFyT4EFbQCVusPa6Lb1s1HS6Ok1qpxg=@vger.kernel.org
X-Gm-Message-State: AFuF++mInZ1ZgdSHPODFI5OafkzvTuDslVl0xVfMLOo/TPg7IYoZiaUh
	03G7ziwAvIWjB+/3gFmgnt/MO3+Wfw50/D/6sB2+T+4Lu0PBxp9xUFAeaZa5pM9B31ngX5UnMdv
	jpz0cjC+CkN9jePzA/MMxRsBNrQDMneQ=
X-Received: by 2002:a05:620a:28c7:b0:92e:7c7e:9c9a with SMTP id
 af79cd13be357-9391392cde0mr1366007085a.31.1787983534861; Fri, 28 Aug 2026
 23:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820045603.68809-1-baohua@kernel.org> <7e897a4e-2075-485a-8cc5-5bb928fba437@linux.alibaba.com>
 <CAMgjq7DFpKU=QdT4QNAREL8oLg-OAxM6zMcYkCECBVg=U5ECsg@mail.gmail.com>
 <56b8e283-f849-4fd7-9c2a-64b604176a82@linux.alibaba.com> <CAMgjq7Aemn51JRVx1_zxG=Z3ZhTBUW01erEpgHfDWT=BPGBLMw@mail.gmail.com>
 <CAGsJ_4xyurha07UNXB91jP5De+syHuVi4EyAXfMpMWZvr4n1kw@mail.gmail.com>
 <70133332-966f-4bd2-99da-cfc5ad5fb6b6@linux.alibaba.com> <CAMgjq7DudvXYMLD_1hnbK3ivPY0j6jUiO9b0JWdRg24B8vA7VA@mail.gmail.com>
In-Reply-To: <CAMgjq7DudvXYMLD_1hnbK3ivPY0j6jUiO9b0JWdRg24B8vA7VA@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 29 Aug 2026 14:05:23 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y-7-hgz2TvMs8=RoACQ0ZWyJFqugaMxjbQqCTym8zSmQ@mail.gmail.com>
X-Gm-Features: AcwNN1VwCOvfnTCjzcZkqOm-T-J65w6YYJr1de_FRQVVIFGp6yGiSJJxNIRacKM
Message-ID: <CAGsJ_4y-7-hgz2TvMs8=RoACQ0ZWyJFqugaMxjbQqCTym8zSmQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/mglru: clean up isolate_folios and scan_folios for
 readability and clarity
To: Kairui Song <ryncsn@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	linux-mm <linux-mm@kvack.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Ridong Chen <chenridong@xiaomi.com>, 
	David Hildenbrand <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Lian Wang <lianux.mm@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, lyugaofei@xiaomi.com, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Stevens <stevensd@chromium.org>, 
	wangzicheng <wangzicheng@honor.com>, Wei Xu <weixugc@google.com>, 
	Yuanchu Xie <yuanchu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:25=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
[...]
> > Anyway, personally I'd prefer to keep the original code until more
> > impact investigation is done.
> >
> > Just my 2 cents.
>
> No problem, I'm OK with this change for now.

Thanks, Baolin and Kairui.

If the effect of the exhaustion check is unclear =E2=80=94 it improves the
zram case but might slightly regress the SSD/NVMe case =E2=80=94 we could
simply drop patch 2 and keep patches 1 and 3 in v2. That would make
the patchset focused entirely on readability.

Best Regards
Barry
