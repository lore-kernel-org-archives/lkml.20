Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7D480954
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351952; cv=none; b=LyEKr1B2OZdt8zw2OU/cPb8c4JcFoS2egr3miA6dTKmOdZndqeuLxWygxCIrAX0tANA6NNikaBdSjK6fOPH7bz+gQSvyFiJvwFgD/0eMjeBCaAHrVg//CWuiC7lVWTF9AIMkvN5apXaGXf+HW4TiEh6pbKniJJSwx52mGnP7Dsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351952; c=relaxed/simple;
	bh=qWim/lIPPQ6l98wILRuoStvmb9qBcy2G1Hm67Al1zOA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=puL8ys9+ufhdpFPCkm8PqsV3yuoKRGnIicpm5vnIuDAHR8HaODuV0b46zEhDPwKHgiOIrGlp1aW7L9tdO7PHRGCsyQok1lLjkdyQhMnhooNpxUbb6yjVoUeXP89rnomef/hbHxOGXZebbGB+dG5ilSUlMw7xq87E/ED4HjUxB+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOEruDXz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOEruDXz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2569aa5116so316914066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788351948; x=1788956748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnwKUYyG1eYkPaem6py7c8DPLUxuR2hx2uAC6F2MPOw=;
        b=GOEruDXzWTFx4Cbi7NIqyT7+GD/SiamD5kgGg3wA2OwPpNQSzv8xfvp7uJuLLf2y+o
         2MtIOh8pUn3AED4MJe7eo0ibP+6EpWQICKKR1vKG2EZrK96wEvnUf1KHEkEZN1ZFBCjW
         doQ7W8zAFYiAAOvWyZ6yxiG1J3iH3UE6Z6B28ywMyZjqGkKMEy1C12dXt1P7R/M7m8uv
         XnimT2UuV6FKzWsNCjlYoAxOHOD8/ir52S3122BQsN7gzT8an8u5TEDVBeO7IUI1OEzb
         W8Hvom0Nx7tkwCHMVU+iQ3H0ueyEkr9+mOnq7+ROi+EzAwsRqIlscM8ohLKMJw/4Uwta
         bq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351948; x=1788956748;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WnwKUYyG1eYkPaem6py7c8DPLUxuR2hx2uAC6F2MPOw=;
        b=SLHtI/UKzk6OZzhRd5XRPmPihJQ5wQMFXBPIblci60Gfj6t9gefqJNdQeEotB0ilJD
         0IbFu4YJMNk8uyMmlMFopUlIZS4O6kRuFekOuNS5SaerwcIjlWz6FjXTSTmsCksCpNWZ
         rvWn9h/GDar690JTMz+feLxt6mvju/+EgUfo05mUCaMPaERDWf5pnLipkU0OFL113Qpg
         KRSxRWGKWMi5yGqRiHfIYsXgYck8+ptf/jtsHQxDRGITyyf06FZdDKoojeFHvEKAL2Hn
         xZamR4G/1DfWMre0AZ0azb/qnJCRvbyIDXZPfFc14bbNhyIcKD7/GvGMsyzSaLsGHt3y
         xqmw==
X-Forwarded-Encrypted: i=1; AKwUvBw6Ql9bbYwgCQLylB+E+xXEuKWyhyn3wRWN9ABQ2KdB1EQAGFv/9wcDil+TGcCUh9Kq1hMdKTz834eByLg=@vger.kernel.org
X-Gm-Message-State: AFuF++nNyGYrwHLnkVx8o8VDGYO/bfPGb0THhe8K1+C0mLl8LO20VYC7
	GQM2pv21filnYmQhCsh3T3tRP9F9z3xE8jWmOkT9KCMgf7kNYvEfTCtF
X-Gm-Gg: AYBFou0mdrUAihUUVHB+yCadyPlhPHR9aWwZe/8T5p8Zqh+6cHJ+JfF2XgMwtQv8wLO
	qxMyuxjyLWiO0cLHhGvMCxb3nhJLgDgf+0CUYxVts6pbf2Karz6KRT/QhcLmKyNMEsN7NSK+LHk
	vjPGLmcIR5MWGrWW3UUAOGiWClSk4YnpFfJHIODKW1S7K/7iCHCmms7kY8aViLEAdEAOcNc1BtZ
	o1m+4I9Sakh5jhX8XHsSGp5N1zGRI+e6RTRVG/8EEtJbYWW7Ib/k6UUTjETwfzX7K5QtXvFJ+mU
	905bjl0lLVwkuvRNxBSLeLUrZwRx+xQdQCQf1DrUbyjUtJGDfh2t56xqbIiyvn8HMl7eDwEk0JK
	1o2mQM1686K+8Vh5PhwUJxakuXaUrIkT7QilPLIeqaUnRXYL/umE8G/ehfjuAHIUKK+URWXxc7a
	ok7gWltpVQ1kthHeGuA5GipaP1fco5EXCgocMlbc16KqWZ+7D9gpFWV4bs4B9nf3ZR
X-Received: by 2002:a17:906:730e:b0:c25:c678:ff80 with SMTP id a640c23a62f3a-c25dc9c1306mr204507266b.2.1788351947624;
        Wed, 02 Sep 2026 05:25:47 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d043e6bcsm125254366b.61.2026.09.02.05.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:25:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <567d5476-5f9b-435c-8884-8ee5b9b26966@xen.org>
Date: Wed, 2 Sep 2026 13:25:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] KVM: x86/xen: Latch shinfo mode in
 kvm_xen_set_evtchn_fast()
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-5-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: Hyunwoo Kim <imv4bel@gmail.com>
> 
> kvm_xen_set_evtchn_fast() assumes the port range check in
> max_evtchn_port() and the bitmap layout selection observe the same
> shinfo mode, but each calls kvm_xen_has_64bit_shinfo() separately.
> If the guest changes the mode in between, a port accepted by the
> 64-bit range check is handled with the 32-bit layout, and
> port_word_bit falls outside evtchn_pending_sel.
> 
> Latch kvm_xen_has_64bit_shinfo() once on entry so the range check
> and both layout computations use the same value.
> 
> In practice this is harmless: the evtchn_pending bitmap is at the same
> offset in both native and compat shared_info layouts, so a stale mode
> just results in setting a bit in what the guest (in its new compat mode)
> considers the evtchn_mask, wallclock, or the arch_shared_info fields
> which follow it — all of which are in the guest's own page. Even with
> this fix, the same corruption can occur if 64-bit mode is latched and
> the guest switches to 32-bit mode immediately afterward. Like Xen, KVM
> makes no attempt to *convert* when shinfo mode is changed. Only the
> wallclock field is updated in the new location.
> 
> This fix is for internal consistency rather than correcting any
> observable bug.
> 
> Fixes: 14243b387137 ("KVM: x86/xen: Add KVM_IRQ_ROUTING_XEN_EVTCHN and event channel delivery")
> Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
> Closes: https://lore.kernel.org/all/aiHPPUk5DY7rH-zL@v4bel/
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> [dwmw2: Rework on top of long_mode/has_64bit_shinfo cleanups]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/kvm/xen.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>
