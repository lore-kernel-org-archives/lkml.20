Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B14148642A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162310; cv=pass; b=Wsaw6JEPFECCPP1oneUgAygA2R77laS6ZKvNjVyd8UnHGylypyrWF/iX7sali2xP2Y7PV1oyHikaPsvz7cIgmb4tzcgoATaZ1WwL9ol/MCVxrc/NCKk1xCfTvL5b6d602O899IO/ejGRPEiBs5lQAl6vcjEfqhw86IIwg74hXKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162310; c=relaxed/simple;
	bh=VGvIJQkp5IyRlQ+7Y8L/xW8OHuy5Tn+hF4zSv+pVlvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHcGoeYJfyQYQW46O7hraS3XpzcS+C3usZ7na97xwJKK01ItNovi8iLFfP8/kW2skzNjsMTUw2UUvH4tSKX+PhmeYWVmEWcg6LIumA01fLd7iq4v/1fenjpKEsy3GyboColP7WWozx4EZ3JwG28OgyCFJEu6ibSc+3ZGjbIOrno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z9u33UOf; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z9u33UOf"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so159071cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789162307; cv=none;
        d=google.com; s=arc-20260327;
        b=Ke77rtWywPnka5v9ywZoviNuUaJMkNkUO/BIZtDfNT1mx/KmAHOtcTsz01pc9GfIWB
         SxVo63w5STrh882iUa5vrYS6XXkXIDpfVuOZ+KNQqeWSPjzpaH/NcsoMTDGmHyjhCTx2
         8B5ZfRUXdYrwWbrgNC/yfVkFbGE3lEoBz/SADPnpI4Cb7sYmeskv/O/zywvg7IZqGRu+
         6LdtRBWFxes4HGS21VTNJRXIeIINH4B2vzSr3zej/3dvm0h+dpzlZyI7yDMpxWFfImCy
         S0WSjOYamSNZKbj7uvM6fU9BDrMrcR0WjU3ERtmGxQG3tOTcSGpwgE36DjUzfDhPzln7
         O7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VGvIJQkp5IyRlQ+7Y8L/xW8OHuy5Tn+hF4zSv+pVlvM=;
        fh=VKB7q9vEjpTGqhNIURL+uSZqYxwI/htf1m6lhpx6K4A=;
        b=BHdlUmmPIFPs6klgoOH0e/nanPCc/czFRtOyHfkvRMrkiS7Bw94KSrK0qWtXEkrIVp
         GJhcbrz/WzItU+HTqzbu8o8dwefcrdzOtIiT8LiO3dorFPaVBn+xTIrewKublRLgO9DQ
         9iM0Y/XAvnexrLUZxnucVJUUo1De9w8+Egv2UyqPFIXtk1i81mD2E39npLhtSj/6EHL1
         Xo+1hYZeJ7SQP5sfmL4JqOz+GFvc3jX6MuJDAf2NazRyiqVSgj1daXDTWf7oz2VJDrrM
         rXHMZ1UpUbTYGnPxZ++azmD0AyvbCQUZnyFOIC5g371R7/lRY9Fjc749fdeb5+oa3VOD
         W9pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789162307; x=1789767107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VGvIJQkp5IyRlQ+7Y8L/xW8OHuy5Tn+hF4zSv+pVlvM=;
        b=Z9u33UOfoiTT/qg/fUgnmE+5V7bR/lua75IJMTY0NekWoODd3ccYqB5Dgxud/2T7JQ
         6zc4ZRtE15PNMFjE+C1s+ugS37YU/EHlEFhzQ1XiC2LzxP6E+6PGqReYahW5X54VDIof
         81YTq1XjFKrTpnDhzD8RlUQ/f33B8Scop5cLJwkhGnLG3XuTap8C+66J2tYFYaEWxxLu
         /fCuRtJ0mbmTIJ8cOSBDpWmd/iI21/kgGFoenLg0gpsFpnJehD+TWr+ae03z5yfACYMH
         GdS/LrSP2f/k6lnhjYbGeeSASljG+rwmdq2CGKCPqqgfkEjW+HDevzX++wGSVubVDHYq
         BdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162307; x=1789767107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGvIJQkp5IyRlQ+7Y8L/xW8OHuy5Tn+hF4zSv+pVlvM=;
        b=SJxHE/tTUCS66ztRUQxSBMhsCma/Exp/uFvJTVhc0ukuMR3vmZQ1SnteKeh9xRicwZ
         8hByAD/uTYfMSxvFf0h4di1yJ/eI11ukXb5GZy9jeMAvzMd3Jr1ZsGqUT0gr8XY1eUWn
         49P1GKPRyyeWzccyq0dxeJjmM09B/hgsJTp1EXJsxEa51n+9e2GzRTLBGlHtZIGtrtmc
         4Lg1LI1dqAw7/wg2IRb2zOGBQghiXILwBuESLXp8Umn4nEy2Vm728+soM0ukuctvE96h
         ZEdpF3H75OlwZSLaE46BSvy2v+La++ZczPotvDcGHex5/hfei1XeqF7cykjyqDrOv2H1
         a/Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxOJVS/jNGljDHtSRtTe1FIpK4L6jO8oorPXQNyBTjnTJphZJLeZO3Wca8GlPwOXo1MhlXBCcnuyki1jIU=@vger.kernel.org
X-Gm-Message-State: AFuF++nHH05jI15kqRZ28hx2iwn5+5XxfjA2Ewms4XpoUxckh7xkTXe5
	CGD535aYM86jfaSnDpz8KfF5mgqMIg7PoGTzGi7N4kEiUMj0nlV88cM4I6FlijgNYo0WkUcWkxj
	0ZffZIgKdtjLw/pqZS45Nx3KaZEDxndEXEffchYWH
X-Gm-Gg: AYBFou2s8SUFoUyOPY29w0rzCF6JPuPnCeBM3lascjY4rLpyX5I2WiKaXsSRJ8OHB71
	HiI711iGWzRCCR+gDHHlfQqZdI7WvBWrm1UsTtcMb9M/k7i/8suV9rxN3yBE0pukmFv895yzBa6
	1EDRoWl5Y/wGtReX5ml4hfqk4LVIkYJg6ZrzDeIKoGFlIYt1z2VaDHH8m9CAU3oJGVTyWjXUMVf
	W8dOylPVOcc7G04jQXyBRC3aDZ/cvACOxVyg91Yyj3aqlSOuSVpaVqPAL7dQrB3Mx12aCAI0JVH
	MEwnSM1125cklzhczscTjVokVCW8lPxQ0IHTWJ+hPYSismELSpE2UQ==
X-Received: by 2002:a05:622a:11d0:b0:52e:1e8:21f4 with SMTP id
 d75a77b69052e-530e63d3194mr1543051cf.5.1789162306468; Fri, 11 Sep 2026
 14:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911194145.1781926-1-surenb@google.com> <20260911194145.1781926-4-surenb@google.com>
 <8a5abc5a-bfd4-4fc3-aec2-a567ef5c409a@kernel.org>
In-Reply-To: <8a5abc5a-bfd4-4fc3-aec2-a567ef5c409a@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 11 Sep 2026 14:31:33 -0700
X-Gm-Features: AcwNN1UKizZchXvXxtFlTQJTapR2k2sJ1U1PVMre-GTpxn3kamF7rTTUDJ1EgCI
Message-ID: <CAJuCfpEp8eBidJSr0NZ-sBuJh-d51BNuM0SJAOSGN7m7GjY=3g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] proc/task_mmu: clarify shmem mapping walk
 conditions in smap_gather_stats()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, xueyuan.chen21@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 2:00=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/11/26 21:41, Suren Baghdasaryan wrote:
> > smap_gather_stats() optimizes stats gathering by skipping the walk for
> > shmem mappings in certain conditions. Update the comment to clarify
> > these conditions and use vma_is_cow_mapping() for CoW identification
> > instead of open-coding it.
> >
> > No functional change intended.
> >
> > Suggested by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

>
> --
> Cheers,
>
> David
