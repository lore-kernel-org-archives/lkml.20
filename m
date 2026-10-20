Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465457;
	b=nHld8fTW9F+tab7vmB6nuEwzpyxe5k4u7YQsKLOvcctCmJzKn422jc3hSt413A4mHhFT
	 0Z1v6puY1P87gl0pxKRUvOBYrCN1xHrGr4ynP0zpk7MDTiEZiXdW6oMCLD+Jt6ktkbGKJ
	 f8YOYJosfNkMgKesD0Gr2t5z/kB/e0sbSX/nLMM/MNYRuBvqZEcPGVtBrQ+AGvp7V2h2W
	 Bl/bi10FOYtudHi41KTVIC/5z3BiyZFnFWf7QykR9xlCiIzoPLHXBBb218d8vYl+r86yK
	 e2/cstXFznJHLlNhzIGUhxahE4gY2ut8fuqHOHJYd0Oivk2vJCULZoJgLO44ETJm7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FvpcUWOMJRPh8Fi2Ngt6U54Np2NRjnE0G0LmqIgTo0M=;
	b=z4piJWmMtNt0+8+rl93Dy3wLHwPgAipWCX+XYTaCuWrC6//qWxDVTxm87ZoipGsiKTrg
	 OI+6Jzn6QLyUfHya8PjOvPVnug0d/IsleJZlKLCPSPABsNyC596Zs9Qnt4xMG+CAVUhVX
	 GCUV5vI52jIa91X57cYd7Vtn3YlzXixe5kz3QaVHv2lDPt9pFOpa9qNN3oxvHKJLAmCjJ
	 CmIiKvu5iLOgVFTOcR54QKCO/LEtadn0/uRbG8lKsAfJUZONAcUt18G6i/iWN+y8xUu50
	 hEcHf8UvxvboiGGMl4k6lPUyjFoqfLv4I7xTZCO+UKmiX8OQ3oRCT6iWYAwzwmqmGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Rzv0PZ11;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD40606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Rzv0PZ11
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f1cf92c9eso281997985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792465455; x=1793070255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvpcUWOMJRPh8Fi2Ngt6U54Np2NRjnE0G0LmqIgTo0M=;
        b=Rzv0PZ11amlZCBHSQbI4tLaoQRJGFkTwgDTozpYth43bGQNLv/XgH1xNcWB7xJcKTX
         xNDuN+zQmcKHGzGII7v6lro3YCzTRCY4wGzBaYNzK4gumG8CGE+WlLi6oWc2MMetIcjz
         LdfPsKZbQLsgpOX6XztwWzeLGKLyu4MwkyLxxXFKdQh6QuBzFBkNjUYqN+NjjimDsV7j
         hakRQ2///8iSro4qBTbiWCFKcGAFfBeZ6CSV+xyp5uMemxJNSr29O6y+6OT+Ei6z+Kro
         Jz3NhYi78jjRoLREQFfO50TeHi5ZGSsSivKR3bsvHXoayJ436aGTNy3uE8YBDNGLTfV3
         Y/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792465455; x=1793070255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvpcUWOMJRPh8Fi2Ngt6U54Np2NRjnE0G0LmqIgTo0M=;
        b=CaR5wpi44ycRtG2GZo5Qansat5DlsXgEXUWbCi2d2xNdJM9NzAhtSiK5598InU8nDy
         NHaVaMNULhzFI3iapshZE+oTutSLVkswZzQgzSmXqQihrzpJ6hYoAtns+zEKLhvl0hgp
         Po6mILF+ZNv0E/xbQa+goXuXdIHqh8zdTGcSiJBa43PGYKhE886jUkoPZpO27/rJSYDD
         uv+aH+V0zCu2CX1j53vsV0zbMLi/z+FJf1D6DCse8l4M0eePeWQCSDbIuXDkzV5OAWDy
         meblAHk3Sd1vQqoM+O8AXeQurOU/b1Kv7YR0M14ECFh2R4DtsDzKnP67gDnQBDUqMlmj
         9xZw==
X-Forwarded-Encrypted: i=1; AKwUvBzrzcrj0I0X9+Twg4VN54riJq+7oRLNMB6duQbjWR+w5mqwY0Wo+vt3J+c9b0kvYBe2aTFwiLDCOSsoXnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7DqQY2PrjUWVdgFabbUd8zqtG7QyXWMUqObarr/8Va5QCU8SV
	CBW/DDSw4EcNhZqY4fM8vvmsOufXHDS4bcIbth/XycXJayaJZ3UWN8/ZcZnfgRtQOmY=
X-Gm-Gg: AYBFou2SS9St4KPbjjk5ysqO7BbchOsuyWc5nTJvZUzOZEtnR9u0QyeEzdQQ/mtlg4c
	lvuB97sN9cV7BkxwjU3T3Q2LsKgDSYWZogc18c5qLJtqtpRnOaj9dvDxTGLwwug5XT8YnrFmuQt
	mWbwMS6PabY+6O8AsFBlkbrVdqZx6Vu8y4IuJdmV1tzKfpt6AGneFUSYkdfgqbz/br1aH7ZqsMR
	UlCEL2u56ruQj3JJVJvnDYISW3TFF6aDR1Oa1jcnXH8wCP7gng+kXoPaw5GfBvoMoZ6ocnHeolp
	i8nk5PxO6Q+e7FqpT9ljPBflTVsk74ayDz8GYUKikqQyqK4fbEWZyC5Aok4r0YQDrD97H2DCSaF
	dXRtAd9jdT9EBqKE/lCMl5diSB/NUd4k44OCmDfgoS7k7RU4UBTMDiFiugffUJyo8vEBq8nI3I1
	VqfcyvaIo2Y5zFNQR+dGFLzmOgoLTgQ86IOSXh+o7LSuZ6/Kjyl+wjJQG16GMRxv/p64XxqV1iJ
	Gs+NKd0gE9XuZzyNdh1WosZNU5vnZR58fg8PtIvciaclzM+zuArrfA=
X-Received: by 2002:a05:620a:28c6:b0:93f:3565:813 with SMTP id af79cd13be357-93f3565089bmr1140582985a.9.1792465454862;
        Mon, 19 Oct 2026 20:04:14 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b0c4f1asm114948985a.33.2026.10.19.20.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 20:04:14 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:04:12 -0400
From: Gregory Price <gourry@gourry.net>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, hannes@cmpxchg.org, 
	david@kernel.org, mhocko@kernel.org, ljs@kernel.org, dave@stgolabs.net, 
	roman.gushchin@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive
 reclaim
Message-ID: <atbZyUYli9Ioy5O6@gourry-fedora-PF4VCD3F>
References: <20261019185002.3428594-1-gourry@gourry.net>
 <b7aab691-ae63-498c-8d0c-1696592eea60@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7aab691-ae63-498c-8d0c-1696592eea60@nvidia.com>

On Tue, Oct 20, 2026 at 12:49:37PM +1100, Balbir Singh wrote:
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index e82ba737c028d..90f7a7bf4e426 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -8180,7 +8180,7 @@ int user_proactive_reclaim(char *buf,
> >  		} else {
> >  			struct scan_control sc = {
> >  				.gfp_mask = current_gfp_context(gfp_mask),
> > -				.reclaim_idx = gfp_zone(gfp_mask),
> > +				.reclaim_idx = MAX_NR_ZONES - 1,
> >  				.proactive_swappiness = swappiness == -1 ? NULL : &swappiness,
> >  				.priority = DEF_PRIORITY,
> >  				.may_writepage = 1,
> 
> 
> I just noticed some other issues with this code, in terms of honouring
> zone_reclaim_node (not related to this patch). I'll send out fixes, for
> this patch.

I'm shocked, I tell you, shocked!

These are all things I accidentally ran into by just uh... using the
interface.  I'm absolutely positive these interfaces are full of bugs.

~Gregory
