Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCD84457B6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800964; cv=none; b=GleMzmtpPtu9feWBCMo20Bo8bqC5d8V648YLw+H35BPo4xNbv8aGMzqIB67jb1l3ua7cPtQlLTBm5HkLKTrFG3RstFQ4MBZt0cr8GTEMK81HfPzIQNT8agshlFFTeSq/S+gVPX9zsz2Iulh8y2LiyGUkEOg9vW+tAkk7fNgdK7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800964; c=relaxed/simple;
	bh=mwbcEmf8gJZTNKkPLveWt1KeSmrbmyjXRuwXnFG5/0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkM3FVF6w7iLy0oi1jDq89GC1HsvIy6qaJ4tjoZjPO+zSdPPxy+u+fMVD7eXE6xSceoOEhZRzUxqJlI9e67ixRmpsIF0Ke9zzvT8omDno4I2KuME7RCHWHjyAGK/jFIOMd339K+wsBo59cPFDm/y+d/6m2Syi47sV5NZJRnjvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpN8W2MS; arc=none smtp.client-ip=74.125.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpN8W2MS"
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so360287f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790800961; x=1791405761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwbcEmf8gJZTNKkPLveWt1KeSmrbmyjXRuwXnFG5/0g=;
        b=bpN8W2MS6+XSQPQVgHvaJ1F+Y+jNF4ZopF9cjaYHRJhUn9Bc/ZX9/hGkmSXehNWrIT
         MMxlSO37cc7Wpk93q4MDMyrSRjJMrxMb/7boAIOiBGNMjLHeyiJuv6Ybpy72ZB0OwtrW
         qughqx9/fJptiIKfyCB08UGKateNqITFQYElIfcyQ2NbeyHbOy7Yg5jgBo+14+AhIytC
         CqsEx1CDZtdIg2Ur0DrXWOjFFnTP7K/FLU2Z2XROtfYY5+1hNZw9cSseSzEnpFbaGNiU
         x8cY8x6VWWGTFB/h4u8dSbrKAK/BKLDS9L9XqDhnKJ6WpvdVRp9IkvYKYSFl14g3TCqi
         DT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790800961; x=1791405761;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwbcEmf8gJZTNKkPLveWt1KeSmrbmyjXRuwXnFG5/0g=;
        b=RUgs+FjHfD4q9DHeXvMz8TUGfr4pSJsfEg9jAQ69OPctH+7VL8CfCY08/soa52qhOw
         gt/+qu55spdXZjCueeUa6xNFs7p1z7/ZFroaWDosxB4DSAseMiC3xxAnWsInLe3qXnst
         Ef84oDC4W01l2TpaqCxZEHm7ehKTRLy9KkYScHYUN1yOK7rgAkw6si+ELo0o4f/lD6vQ
         F4lx7HLNLmwP46mDnQGo7XPs63zxUBTctAT1KnXm8/EKISiKc/qzceHhyKlbqZSBmiSk
         xzuHpuRRiZynB6qYEbYWWK5kxPfE2aR5U23lIVxyAaTCWyPyY31jhVlwd7M+1SwlmphN
         /9ng==
X-Forwarded-Encrypted: i=1; AKwUvByxvmWAzwbzVn57U2Kia2L0xLT+lcGFf7iaKodbzmGdxxzM9KsPMyuNeBlGkEGH5KBS4+GcsQ3t+5eNxes=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAqX5xBIck4wRGmDiNNwI93s0ZWSNw456aeptOvPNgk3SZlWp7
	utMMJyFxjzscBza12W21AVOYYK4snyrP2JKj/NsuERSHNKYaAU9Tk9H9
X-Gm-Gg: AYBFou1AttnwUnzGfgAtH1Qsp5fMyG+ZDNI6y5OI6VcB0Sb5RZeiji/dCYAIvh/l+ZE
	aI2lFbSL3J628qhljR+9XR7W9xxHdHn/qRnCnbV5O4xV+zehCdyJO6xRfxd1ATIE1XYflAfZiz4
	rLZ3rC8/QljQkKsysLW+6giSsxa+WSbmxLtvc4r6Se2YoH26WVxcHu0JdqY1lLblb6K2xw8hp9s
	jFXYFFge+uCDuCFG4QWhZjrACWWUAChmXCo2cTftaKH5/c4MQoStnrCCG0lAlXYbhabl9+nygx8
	WM8zL4U6yMagVDhk/9Ziv8aUE5ziPNrf7aNH0CkmQfhDNQGe3kfrcGSt61Un1ELig5DduoVkkkA
	G5fKvTOs4VT88K/y7BBAcbI14NapHHXQmnPtfwjdi+3aA1eXmrj0BrMYawGkp83bwXAKXIUy1/w
	nsKbOY4VE5Nez5vwxHsuRt5WOusYxWAhmofoXcoXmmWKFCwayAPqUjMttJru6wLHM1nnWnZA==
X-Received: by 2002:a05:6000:1ac8:b0:48a:ffe0:1497 with SMTP id ffacd0b85a97d-48b068cfa97mr1394230f8f.20.1790800960456;
        Wed, 30 Sep 2026 13:42:40 -0700 (PDT)
Received: from gmail.com ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068bc944sm1646164f8f.3.2026.09.30.13.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 13:42:40 -0700 (PDT)
Date: Wed, 30 Sep 2026 22:42:37 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	=?utf-8?B?67CV7YOc7ISgL+y7tO2TqO2EsMK3QUntlZnrtoA=?= <ts930@dgu.ac.kr>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mlock: fix zero-length request normalization and
 integer overflows
Message-ID: <ar1y9pekhVr19MDm@gmail.com>
References: <179066531783.50175.13377521828379196177@dgu.ac.kr>
 <3a95d0e5-7969-4b0d-988a-ead62b06b6f5@kernel.org>
 <art6x0XpWcT2aUyy@gremlin>
 <CAFPGN2jPGhcWVqa3k16RWMaMR3TwKyhFbYYF4D3L6L85T8E96g@mail.gmail.com>
 <7d120555-0c31-474f-893b-e5ee3466ead4@kernel.org>
 <arz82IHw4MqGTb6l@gremlin>
 <091706d4-96cf-4dbd-8f9f-97ebd3f8d81b@kernel.org>
 <ar00Lx1xB5rvKOdu@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar00Lx1xB5rvKOdu@gremlin>

On Wed, Sep 30, 2026 at 05:09:26PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 30, 2026 at 06:08:15PM +0200, David Hildenbrand (Arm) wrote:
> > >> So is this patch doing more harm than good?
> > >
> > > As above, I think the submitter has decided to drop this patch?
> >
> > Sure, but I still got CI noise because the patch was apparently not even
> > properly tested?
> >
> > So I really want people that send "fixes" to test stuff first.
>
> Entirely agreed!

if nobody has picked this up, could I take the wrap around part on its
own? I would implement it cleanly and test it before posting :)

--
cheers,
jose a. p-a
