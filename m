Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369976;
	b=HNBPL+lQAL+eTMfsiIhnQWOODXmEfdZzEK8rNFyhM7ovNL4CIUUzbirV5bFntD8D2Ol9
	 96T7lhf18WkqttXphuLQpnZM5xPDDCNkGBWETq6HyuaW0Pa+FAZW1Ht51mNcBYoy59xVX
	 nMnW7i5RHQYRlbPjYQv8RP8NyHzE+wim/7QaKqpYaYTu1hjI0zwMc6Ur/G+Nkg/G9Fdz/
	 Vh8SzkUmy9kRHQTBQ/l/h4KssoF57jLZ2t2LN4wf/5r96yqhuRQhoSelbAiaXw+4V517S
	 +tWXRAwogqdt2TvZ8J/+fbkHoW130Ohj7f47sE1Wvg1CBBFQWupD2TNEh+oU/wmMeEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=bA1fHQBlzW2f3EluTeJ2sASuPAQq8eJKTH0MCDp2mJI=;
	b=YImoWKybA7kB8/1o/JTqtgFFCfSVLBpFRhpmFL4rwvqFlWxdB0qJArwrwhZ1KhOcl3m5
	 UHrpiTyTWEhfd+KhvHx0UWI16EcI0bBXSpxvbPPdgzsZN92coflYYJ/UlQ9RBlUv8wgHo
	 ieyK3OAExbOxt1i40gFyQHccgZ9Alz5EIvfLv/g4JaPCb40eJ4kDwOZPgrVlISgK87KJX
	 hcuwj4L2pxl/GkIwB2bRsXaD1QRoHSOrBrJ9HN6fQQAOZo2WOsH36Wt6xULwlh8MfTDgG
	 YhpuFSXbkqoFbFAYDteR/28dpEFEk68C9dgIAfS4lIia3HES7drp4nxBkOvLYvMRIPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Esi1kjmC;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CEF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Esi1kjmC
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1925248eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369974; x=1793974774; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bA1fHQBlzW2f3EluTeJ2sASuPAQq8eJKTH0MCDp2mJI=;
        b=Esi1kjmCu/mPRLNW6Cph+bFN0jarTDCCCrwoQ2TSZDwxIXb2wtL6LXW4OPt/ipy3t0
         /I2GAN+Bf3sPY0A2kspEkj/14Qc6h7BDjO4TvvKFPnXS80vbdfNlq0YcrffLZwXt3g8b
         toSERLnJ7zIqd9r8fNei1Jxy7U4LiXPRmfgqGFVd3C5wkH4Sugzvh4iPL+fS8qtcLsYl
         hIwWcdAvIXxVuSiQCNyvRGSseiNtUQNY1wQYB/vYC9cEEASCo5auPpCTsFsyrMVa8xlx
         R9YFYiIUne+OZP1PbyvBbJjt+sZhTT8L+9jwnBfTb01pm52RfnzoYV+vE4ZKepsLJ7ep
         Zszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369974; x=1793974774;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bA1fHQBlzW2f3EluTeJ2sASuPAQq8eJKTH0MCDp2mJI=;
        b=yX5SNsOKeuTye7k1gYX9ZDxyBr3w5lx/90Hp/A61ZsIJTrBF4SYWe7antYoXV7aTqs
         ENXHUjeKgMfgicmGgsb6xIT72D/Dqeaf9m7iHxPASzvWVSOsDqznqbuyHe1y6HeIqNaY
         nKDSzlhMOUQvJfQ4XDdVLUTp+LTSHTMrhd7BTxMJ8W+3rhZec/Ixqm6bHVMBy5AL8G26
         fT/7ioxsn/kFwJIpyLOAURGac4hHSgFIYQ7kdM3NzBsJSp3rx5biZ6iBZBx4bf/pM+h5
         7Dvu/toZQty/GKnOx35MwNbDTVVt03WM2eEtGC6IgH4cd+oBWPSDoEHjWFHMWcx+R7gx
         J3Lw==
X-Forwarded-Encrypted: i=1; AKwUvBzI9MF6HUj09w/TVgDKw3X3mwWjZ7v/Ie1KNCfUnAn5O+d/jRzRUqSqhLK61lmbiocvz9kYFSwjjQz30Wo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqYHsh98sTRN7gC49HroBjVs+Nf/niCE9vNxZj5zitH0NUHfO7
	OUwA0Wg9OSl36t8qKQV8Xker2iCxhyZ2WG2Djdw3ISX5NLzV+dqoT5f/fCVtTg==
X-Gm-Gg: AYBFou2wrgIVu2tqiWYRJCWg0oUqSoInagyybwuUFg4FZ0u720Q5KRTYrQCeJnj9HXd
	RLmW3bIrWB10up/n/S5R4RirpIL9kLQorXzqy18/6O6JtNMkGkAURNI17wMMOgHepxsTRtJWWBQ
	8ZQQBhGa5MHvRwiniPxt9lOpp3EMPa87vF9mGsaWR/DuiR4b2PbHEiVNYD6tlJb1r9qg6VSepyd
	5Uq1efK1oJiH52rnAVAocLYi8MV5ulp18r+vxzgP4LYk69zB1wmaNo3z0Ati6g7nDnqGeKiHsYN
	uK6HdBEzkxE5f2dEhwSwUnsBNU8TkptTWqxeWptW6VG7Ponf3Sf2R+eVsefDfe6s8UdPu2cHKCw
	8nbjHZwzkIrUtkT8dV8em7lTRt0pzdF2lfWBt8YZwDldKtdqXR3O8v4rFxZJYUQHpW8o9S7qGYc
	X4grn0W/b+bEJBcRf4OVq+cr0hGPPIB+bFpVthq5efTwcR/Lxy5YD5TUdMSS9xr+QdJiezZj5ta
	Ow2Csc5Za5iBbZh2wWmWcFN3eCZq5Tc/bwA2NjqY/zlnAQQskrZN3UsJcPzeh2dXfKcwKspXpUh
	HY6O6uxLER8LvHBKplD4TJsT+QI=
X-Received: by 2002:a05:7301:2511:b0:36a:1872:4b35 with SMTP id 5a478bee46e88-36a42203e6fmr3338125eec.2.1793369974284;
        Fri, 30 Oct 2026 07:19:34 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm10406146eec.1.2026.10.30.07.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:19:30 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] KVM: PPC: Book3S: Protect TCE IOMMU table walks with RCU
In-Reply-To: <20261015120137.28843-1-nnmlinux@linux.ibm.com>
Date: Fri, 30 Oct 2026 19:32:20 +0530
Message-ID: <5wyjwakz.ritesh.list@gmail.com>
References: <20261015120137.28843-1-nnmlinux@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Hi Narayana,

Narayana Murty N <nnmlinux@linux.ibm.com> writes:

> Commit cad32d9d42e8 ("KVM: PPC: Book3s: Retire H_PUT_TCE/etc real mode
> handlers") moved the TCE hcalls from real mode to preemptible virtual
> mode.
>
> The stt->iommu_tables list is RCU managed. Entries are added with
> list_add_rcu(), removed with list_del_rcu(), and released after an RCU
> grace period with call_rcu().
>
> However, kvmppc_h_put_tce(), kvmppc_h_put_tce_indirect(), and
> kvmppc_h_stuff_tce() traverse iommu_tables using
> list_for_each_entry_lockless() without an RCU read-side critical
> section.
>
> A concurrent IOMMU table detach can therefore remove an entry while a
> TCE hcall is traversing or using it, without the traversal preventing
> the entry from being reclaimed.
>
> Use list_for_each_entry_rcu() under rcu_read_lock() for these walks so
> that an entry removed concurrently is not reclaimed until the reader
> has completed.
>
> Fixes: cad32d9d42e8 ("KVM: PPC: Book3s: Retire H_PUT_TCE/etc real mode handlers")

I am not sure if this is the right fix. On doing git blame, I see the
following patch introduced this:

121f80ba ("KVM: PPC: VFIO: Add in-kernel acceleration for VFIO") - Alexey Kardashevskiy


> Cc: stable@vger.kernel.org
> Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_64_vio.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)


Sashiko pointed out few more bugs around this path:

Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
- [High] kvm: ppc: UAF of spapr_tce_table due to missing rcu_read_lock()
- [High] kvmppc_clear_tce: pinned memory leak on partial IOMMU map failure

So, even though these looks to be pre-existing bugs - do you think we
can address them in a single patch series itself? This will reduce your
testing/validation as well?
Also since we are anyway fixing RCU specific bugs in patch-1, so I think
we can also fix rcu handling for stt as well?

Do you mind working on v2 and addressing Sashiko review comments please?

-ritesh


