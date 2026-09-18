Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFF518146
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749521; cv=none; b=TCZssPWM8NEh0012keXhq1AWuvcA1bcWlPVVyekoOtbwT6eqXvcxpQ9lhna0yV+pVCmW7eAVtA3QRNMQPqBetkGv0IWOcoPELQrZTRUgjTMO0osgFq4VC4oTtaPfQGxxmzXUO9Js61QK9t2Icc7NLGlAXKWebBuHktXZMIkdkgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749521; c=relaxed/simple;
	bh=KRGC9wawDzgkbiMY0zM6hzk3Dv8DE+14/bvdz6PWn+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2cZIfA7vXkUWu5CYCCrmpgk/0nzXRSZzsvfjDsGaibEJy2LeCgbEPXCqvIdKv7IHkyHOUXcl/LKHdzucjQfDBcyq8nn8u1K2VxVNmYxvfYFxYOH06ywFjjDKVKydS3L1hCXq0HNtwhevlxvKgOX8ZR6BsajrL1tE8oyGtJkWwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=WLmkjs16; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="WLmkjs16"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910a0cb7cso71203685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789749519; x=1790354319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ycexu/7p8mN/PXe2TLXJ60lA5nKStrY7x+9HFkGFF0w=;
        b=WLmkjs163rP9Bg1OExrPB1CtCIYmhMJ9/fjIKpUnCYQstCqG/1SqPPqdeigyS4tDZi
         QxsKbkhBp46DGzEdDKqoV7iN/kexse/+xwpFMgrnwaB9+Qq1hVyM4Kr6NtDifLgKNCbK
         7zyk669rxLXO86tva/GdN6tmk5o2uYlAGgLecK19sFpbJ4EsO1nbzEiXjF/dxBvGRq3z
         C5miYXTBwrOBuQb9YI2HCABIZmhUzxFo3XQnyYDkfVs/hILExUPnh3mv685sLOxYaxx7
         396BYIkrZcYSqwm9sUA1kTR4RrONNen58epVGojhh7sEaJf0uiPs8HPE+yXrYO94pWc2
         haZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749519; x=1790354319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ycexu/7p8mN/PXe2TLXJ60lA5nKStrY7x+9HFkGFF0w=;
        b=ORlr1aJxULi5+x+PwMqTjWzebHRbBvx2PRcboBG2Tn/MP9jhs9mfqKIItm32pRuc9V
         fxeq1NmiIRtOD4VKJ4jF6D4NvofDmv3hl68DNJa8n6LH1ZLEXGx1Mwe0lURwANZ0Ykwy
         3oPrsZu+0ZrC+wJ1GDLffTNKylQADmwA58hW1K0r2PJRgLxSoxAm6ciYfUj6/1pWeXAx
         XZEyNMkImBmVD8h6QZT6iB0i8D218wh668B95yDp1pFRdKVXG46ZMaXzs/iRUSuztXnI
         kOIC/0S1hlVAyRTtAygFGJn25Kpklq5hRq/33SuD47ilFbseFAkFx4kS0cr1kcvYSMoJ
         jfWw==
X-Forwarded-Encrypted: i=1; AKwUvBzuFFH45nTN1FVxurLSCeygpNs3QtfTXjSPZYsoa9oOU1SiRkFYzC4U0So3dqZxhIVFMxuKbgjmhw1/Tqo=@vger.kernel.org
X-Gm-Message-State: AFuF++lWww6ep9b1qi9sYGx7WxI944W/jrdS4r0o7aLH8S11M+Fu4qoc
	8O+LXKhmPcmS5wjhb41erpFfLjtxz/5+g8f3A45qrHHwcUwuRJ1X6TEHpwKKO5gnxT8=
X-Gm-Gg: AYBFou1pcKcS9efheKBYJLY5JaDJ1moNa9F58XuM7YohBbZFdAieddFexoHsXxougCH
	Ey4s6wO3l9Zz4sXih9OpUM+nEh+BDSP0ZezzacUNmTW8k7XT8sPyMBSFT9LqMA9qjkRTkBbNAvp
	hDjTD54yXbnD5mKIkiXokEvB3F5Aykektu3d2QKstVFU7PGB59W3t6uT5LkSIVW9aYns5niHPQd
	qyepTTO8vKQDZk3W8MnQszhX7Fm4ca5O+sQclYC9Ptvv4wZYn5BTdRTUaWkF3Yz6vOLkqFtFqSL
	U46FZ3XOkdlIv/A0mIOoHwieYFFx5Ohj9L0nwFpdixttDERzINAC15ye5CfyG4ecVP7ruxe6HWz
	wt9kGP7rFabzwz7/l8FcLuIseydTTPKWq5226MKTs8XqXhn1I+4P5uk9yCcPeRx53WT0w2Po5D+
	Dyn8ILZ90OtBMx+xU7xNRoKPylo19JS30/jR26znHdKTLk0wvMxS80BqfOuNsV4Bsj3rp4aXclY
	M7xH0JtasxCDtIFBXUG1QoJf6UKyxsPdIy1TjLYizR/v7zNvxMQ7ak=
X-Received: by 2002:a05:620a:17a3:b0:93b:d7a2:83c8 with SMTP id af79cd13be357-93bdc8c69f5mr461480685a.55.1789749519034;
        Fri, 18 Sep 2026 09:38:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0e90276sm176813285a.21.2026.09.18.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:38:38 -0700 (PDT)
Date: Fri, 18 Sep 2026 12:38:36 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	usama.arif@linux.dev, kas@kernel.org, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, osalvador@suse.de, 
	hannes@cmpxchg.org, raghavendra.kt@amd.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] sched/numa: scan read-only file mappings in
 tiering mode
Message-ID: <aq1o3TYZR9JNkXXP@gourry-fedora-PF4VCD3F>
References: <20260911001826.2109390-1-gourry@gourry.net>
 <20260911001826.2109390-4-gourry@gourry.net>
 <0ed3ab3a-80b4-492f-867a-0584441722a9@kernel.org>
 <aq1Cwh9hNw4wWEUP@gourry-fedora-PF4VCD3F>
 <c445a20c-ae83-4571-ae97-031ce7facc45@kernel.org>
 <aq1FDhy00epXXtgd@gremlin>
 <aq1ZUTgLQfLBxn80@gourry-fedora-PF4VCD3F>
 <aq1inYWiNWtZlyoo@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq1inYWiNWtZlyoo@gremlin>

On Fri, Sep 18, 2026 at 05:19:31PM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > Can you at least propose a patch on top that adds the cleanup you
> > suggest? Much of the VMA stuff is lost on me because I haven't had
> > the time to sit down and consume the novel.
> 
> What, literally writing the function for you wasn't enough? ;)
> 
> I can follow up on it _myself_ if you like + you nag me to (hard to keep
> track of things...) good enough? ;)
> 

Sorry i got a bit triggered by "If you check out my 40 patch series" :P

give me the weekend, i'll see what i can clean up

~Gregory
