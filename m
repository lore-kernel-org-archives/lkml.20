Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9824C2268
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348885; cv=none; b=WZncVwBAyCyfwj/gUaIcJIj6vqukB1sqENw3eVTIdiVmcnQIeJ+qX7uCzyBIKuP9c3AbQtov8U9CXyjjKxRcS7pn6qYRyyQn1H+EN3Xo0jp5xe1Z6wto/Hx1N376qx+8TwDeJEpzE2WOwC5/Dj8SyzzBBrFMAA11T2W+63X5weo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348885; c=relaxed/simple;
	bh=17w7sG3Y8RnfHFiCgVIzL/ZpIEzpLF1DetFSqGv7/D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6iPVfnMgKUUDfD1+BzQZ4RA8CaW5cvcSDOL2CKEE8zoCbqZlKoiwVrC0R43OzQ9QIXLWs24sryczQkr8NI1+jUd7on6F7/CkxRenZCkGBqBofchUy7q+wyJlMCdKLhGwN4KIUNDegrbUrGVxNn+WsdzXl9CUYavvKj1YLeU2Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emuBr6vc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VRUoevFX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emuBr6vc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VRUoevFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790348878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UDT5tJHTpdldUwLBk2S2uZT/CFN7pHQ1hhyTmuldAjE=;
	b=emuBr6vcg1OY3FFwIjJxZuauBnUAWdwRBsM3uFF2l5Uwpm/P3vlMR3fTqPGn2bBrJn6yYZ
	CunAqidI069/rsuZkhQi8GdSuFXcEMN6VFw0fIqpDZG5eM5DulCUz7VgYjp0uPV+I1IPAd
	64t+Z41l7l13mbfiHyvH3pvnN3m1Vgc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-mj1jQqDxNh6PVFusNLOxZw-1; Fri, 25 Sep 2026 11:07:56 -0400
X-MC-Unique: mj1jQqDxNh6PVFusNLOxZw-1
X-Mimecast-MFC-AGG-ID: mj1jQqDxNh6PVFusNLOxZw_1790348875
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4843e59c32dso743720f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790348875; x=1790953675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDT5tJHTpdldUwLBk2S2uZT/CFN7pHQ1hhyTmuldAjE=;
        b=VRUoevFXpwigm1PyGIxw/PM7gRz1Wi1K5rEewrY8Lher3e22Yys86/UVyN5KvjSzWv
         1pXbUZwxANhNAlPcGDPM9gEVpEBN3U+NetgN4tFa3jLlMl62NPUno0Coz3ll6wPXPBHG
         JO3P11SDD96MN6siagBiECLpTIzxEBGYXDZv4oSsUU9ktFQMwJaSQGtRz6t+Zy4yi6R/
         qSIrBafUmYZRjMAMOjf6fULPkgR66mAbfWg8k+fKYG/eQiNriz5OB/9jLe3pw2onoxHL
         ALUJ7aq1Gtl/sVdfdyRR2fcdlVYTbz6pIYEmlW35W3L17/Fuvr4vgHn8cJJjXriJV17J
         pPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348875; x=1790953675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDT5tJHTpdldUwLBk2S2uZT/CFN7pHQ1hhyTmuldAjE=;
        b=MZZ3KXTGbxc4ccpn/yirOEy+OXjMl0NdZCB9yJ2M2CFjPXNuTUnQwDe73ItcZsakLH
         2e0AUz7l7C9V2gdWXfhTvCTQ4nAGNBVhK0JfcwpyIU+aORiHJLbcb0Wh8vl0LKLHCzVH
         DVpjHPhMoWE7bfrYhTH39qwba9UC2UGXFM5AcxlyCx9LdylMnwjEl0VeMwuaZCjRCGiz
         fMTybT5en0cz1xz36pnafyjRcrADcmI8fa0jK8lmjetRQGaNw0Wwm6eVTC0wFi/Nekw+
         +5ttpamt6uH8GYHv2QoIxFcPMjoIR0MC35efK/RgpKiTFiEc3aVBWDNOBTlDXcmp4/Om
         mQOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdIUw4ywS+MseOZ9CD6oQ/1PAZ0JHsPzDmD+ioILa0Y5VCgkKhDifwve6cpHy3/h9fvrmHksys33SADOg=@vger.kernel.org
X-Gm-Message-State: AFuF++mCWDlZ1/AqXZcO5NxGaaGDAw5YIPnWaTmfeiD8/b/4YT3w6Qnr
	jbAKZ/4weLqMBou10K/9LZ/uS4MEXKsK0jTH/lhCNja9X893xUF7csvTt0lvnHvH2xL5grXRvWe
	/GfuZEzq7ftC1U7NWa+aIQxmQHOeZQXW/kM+7cgXLTGFqAjG41qQ5HYysnF39LsdI2w==
X-Gm-Gg: AYBFou1fz5acuaeazpF+6Wrd6KF5tDjC98Bvg6CRUAen9a4uSgvrLxqrNW3PSHoOZ0V
	9PQXe/r5SLRLGUj03rRjuhy60rCuSsfMUH6Y5Fs7ASGSZfRRP3Q9nWMuABjdvO1gh6G0vEpBCZV
	65RkBm9WrXA8ai5HtcXw4cMtcrQF3PpZLnwpw7Wtq1j8+xCGN3aTuIvu4E2d3cVSfRNyvYM5WrM
	+x8vrPCTdKfSyGu25Pfpc6C62LD9GZd3WDWLG+3Png9tbDrYP/wvQFAfahCvJx8IHNGv1zkv4Cm
	sTi2SPhRcTYzZXP7XHD3gmdzUCKo6ThQ2rw0s6pFMNwfXYT3eYSg7yUwpOVMgfXUkXwrR0C+3sE
	1uEgiA9YWU3z9uzN+IWzIvLwYN58n
X-Received: by 2002:a05:6000:2893:b0:487:10a9:57cb with SMTP id ffacd0b85a97d-488719756c5mr9921141f8f.49.1790348875166;
        Fri, 25 Sep 2026 08:07:55 -0700 (PDT)
X-Received: by 2002:a05:6000:2893:b0:487:10a9:57cb with SMTP id ffacd0b85a97d-488719756c5mr9921100f8f.49.1790348874777;
        Fri, 25 Sep 2026 08:07:54 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a744fb5sm7133085f8f.33.2026.09.25.08.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:07:53 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:07:51 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	arighi@nvidia.com, frederic@kernel.org,
	linux-kernel@vger.kernel.org, dhaufe@simplextrading.com,
	create0818@163.com, frn1furkan10@gmail.com
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20260924170402.521623-1-ionut.nechita@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924170402.521623-1-ionut.nechita@windriver.com>

Hi Ionut,

On 24/09/26 20:02, Ionut Nechita (Wind River) wrote:
> Hi Juri,
> 
> I have been chasing timer noise on isolated nohz_full cores for an RT
> product and ended up on this patch. It does restore the CFS bandwidth
> guarantee, but on the isolated core itself it trades the dl-server's
> timers for a full CONFIG_HZ tick, which for us is the more expensive of
> the two.
> 
> Below are measurements from two machines, a variant that keeps the core
> tickless, and a hazard in the dl_servers_stop_all() call sites that an
> equivalent change of mine ran into. The variant is not a replacement for
> your patch as it stands, since it does not address the housekeeping
> wakeups you are fixing, so this is more a "can we get both?" than a
> counter-proposal.

Thanks for the detailed analysis!

I believe my v2 was never picked up, so I'm happy for you to send a v3
modified with your approach. Keeping the tick stopped during the
server's throttled window sounds reasonable to me. Having a proper
single patch will make it easier to evaluate. Please do include the
ext_server handling as well so we have the complete picture.

...

> A separate observation
> ======================
> 
> Independently of either patch, the CFS wakeup pattern changed between
> v6.12 and v6.18. With the same workload, v6.12 serves the periodic CFS
> task every ~50ms (199 wakeups in 10s), while both v6.18 variants on that
> machine serve it once per server period (10 wakeups in 10s, ~1s worst
> case). The bandwidth is the same, but it arrives in one burst per period
> instead of being spread out. For an isolated core running a periodic
> housekeeping task next to an RT application, that is a user-visible
> change. Is the deferred activation expected to behave this way, or is it
> worth looking at separately?

I think what you see is the deferred server model at work. The server
now defers activation until zero-laxity. The dl-server is primarily a
safety net to prevent complete CFS starvation under RT, not a latency
guarantee, so the bandwidth being correct (5%) is what matters and how
it's distributed within the period is a secondary concern. That said, if
I understand your example correctly, that periodic housekeeping CFS task
you have on the same isolated core of the RT application is relying on
dl-server to be able to run? It doesn't seem a safe approach to me, the
RT application should better ensure to sleep at times leaving space for
CFS housekeeping task to execute w/o activating the dl-server?

Best,
Juri

