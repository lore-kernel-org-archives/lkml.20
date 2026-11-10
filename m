Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342979;
	b=JiuXYNpFAavPBHjCtpbzc15rTL6rPSs8JHpP/3SCJsRwEKd62LMzbI2oKnzFNvqy7occ
	 yOvX3ta8SeI5+/mfyBuQq/hNPNJIFvQcG4gLEC1x+TRz/oq0NlGlloCMLwG9/PdO4mMAa
	 TyJMzKgYOQjqToFqQMOh7icWbi4JpqP85+bu2A+2xp0x31x52QNYLw4x42O0zoavNY6vr
	 F7u+Ju/xdEBHIteAvfq0hSxUjcisuAgwE8cYRMdl+JnfsetO6Z2nEqz9lexaAyz24ICTT
	 3IUgNiZzeL8sKD7VLTEDM5I90mCr/vD8eQDWYzr1Nq/rdN84WyvkODiOI9Nfp7YHKmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=6OZSyM/+htBjNF4ew/qY/xFoQA8rG85Tyx1BVaZ0pBw=;
	b=OuxPdwwgg8D40HZ9R5eRJFyBk1jEx61A2SkP1LUFpxs4Tnhw4xtK1kAUhqErRjIV5iG1
	 8cwnNsDonFsXhR7LrdFLpUq9TWdvOv2asU755WoCjhJUWOtuWGxECzC8RvpKFQjOKkNhI
	 FjMemQ09NULl68WmJmvq8ZjZFs2NFweD0iBzvQhw4757q8PZ562ZFtLwrT7OpeQP5IYtU
	 BCiqmvyitF6dAI9mv0ZDrGs1lt1s9wTAS0IwlQnogSsAkOBzXi+UZcbGDOQ0blib1y6ZA
	 ieTN2/bvRUCLoXaomF0xw1F2kPU6/Du4rmIjy05JLURxnALqmf9/oSVLCKRzSeMoCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Zhlmgyki;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022E6606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 022E6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Zhlmgyki
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91ec08f71daso19011286d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794342978; x=1794947778; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6OZSyM/+htBjNF4ew/qY/xFoQA8rG85Tyx1BVaZ0pBw=;
        b=ZhlmgykiQBV/u2WhbscMVXK6Y1sQWHXpEGuRYrJV+m+Sy3czagElgsbQnO1tXvrYyE
         CWJgwrNpGLXo/jy7vc02HPJ1guDdOMR+yIieWbTjFOIUywzwEzmrDSi2fWy+uJTgOpJi
         3eKYH+ZIruLGWW/orfEYMYLKZIY6i2n7TfKAhOGIZOlXQznSLR3WAOqO8h4m3BECmIoe
         owFFqVJQhHeGZTXJkCQ2I/PLDG3JdiU3QkgO6G7ZJUMg+ZOOlkNuJDi5ms/sAYPlKnXz
         qdYsk+ND5WxzhqnN6aaVqqrwnO6NlwrnerJ5QvQihQFDlj3YiKtwAR+nvymMk6ZSAbya
         QiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342978; x=1794947778;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OZSyM/+htBjNF4ew/qY/xFoQA8rG85Tyx1BVaZ0pBw=;
        b=UYFoZtbJGHxiToqJsD0c79sZwhC+/W60hLShhJa7Dq1QiC+sBnbNLBmVw0DqyiwkrR
         5szD/3GqjaOkX2Lo9qsdH+1FSgT2z1FY5biF208mnTUvO9bVuJrtKYoqpuw/VF801Ylx
         dFJhIoonV78POBP0jYKRkT3/WlXAvkmWrNxmuJrqtiTy7MrmkYsNuMgNdfB7n3OcCAp7
         AfV+5gBA6jsEZ0m3rtOQQV/dxgU47YlOzDoHGQhgxofE61eI/nUwFlvkn3MVg9R9Kqlf
         Yk15BSh9r+MOduMBRwf0iysDops2b3TFp7gRK/z9gBwuH/nl5UtZDg0DoZZW3NAmLvyT
         3e/g==
X-Forwarded-Encrypted: i=1; AL+hErE8pR3D+dvvo3DsHpmQfos2gG3f/clh+cO5383j6vMq9Kw8wJA/VvEOxOev9wQ1ttBweNZz/s7xPoJ5NN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U6F7bNC4AEwuD1mY5E+N+2LlGD9MBym7p+MmayrH4LHOtABeX
	mM7fO4X2OC1g+zw8IN5p9t+6pKSAPvJ0isyOmISyChER0LOY7mVqZvfL0gh5t2io/f4=
X-Gm-Gg: AYBFou1HmmbOUWzySfssd6E0/bLVkfSGwaUyxjm+21i1Wdid2Cm2ENngDY9+PsiSoMX
	y0dUYXETxKHs4j1CoO9E4zgpycvlZBp0QxX0PnZ2MxJ04gaJsFnsl5L3QIky4iCp7VspGlXOHVM
	F5bxCM19UTjwTig7euvtVxYLQKWyhOtvUfdwlzcDZRnEGQGqBTDy40/X6SBjxW9lHK8hkQ9xqKb
	y+yYiCE1cFt0eCA7V9EzqtrOvGEcSWSuK0etNdYR+9YTFQvQOz3dO82Q37PkTaH7fdDBGCO8paS
	tD0DbrSIc12r35E3sn7iXGisEu2ACGl1ViIe60uipkoeXlLshoNULKqIVIekTIzb1/RW7eIyoOe
	vG72qhV6gJNf2UvsMEpwtepfN46UcWGbLNsyTk6yZpD0T9kIB2aJn+kL/Ax9W0zMKOorCugi4Yh
	ffRZ9tmTofrbYpUorQSzNlWUf3lMw/IPHrsJ0kmSTFdDwn6RpMshVott/myZIgmFZ6g9ey5RA9M
	70H6V6B0C5V4M+SHAZgPWJmjLqCtmh+O8becVNTvQKlsqgq8Zi03bYf1HhAZO0qsN2tgq3csR0G
	uzhMqKP0NFGLo0bLvaZJlfgaub7MGIBOH6n/sID8hBzbZo3BTqbMe/yY3zYnjtPcSvfAY199DRv
	j2MnHB2A=
X-Received: by 2002:a05:6214:4487:b0:91e:a3b4:9f1 with SMTP id 6a1803df08f44-91f03c0725fmr9307786d6.0.1794342977608;
        Tue, 10 Nov 2026 12:36:17 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f04c2b8bfsm1195296d6.22.2026.11.10.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:36:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 5/7] sched/numa: scan PID-inactive VMAs for
 promotion
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, peterz@infradead.org, juri.lelli@redhat.com, 
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
 bsegall@google.com, mgorman@techsingularity.net, mingo@kernel.org, 
 vschneid@redhat.com, kprateek.nayak@amd.com, ziy@nvidia.com, 
 baolin.wang@linux.alibaba.com, nico.pache@linux.dev, ryan.roberts@arm.com, 
 dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
 usama.arif@linux.dev, kas@kernel.org, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, jannh@google.com, pfalcato@suse.de, 
 hannes@cmpxchg.org, osalvador@suse.de, raghavendra.kt@amd.com, 
 stable@vger.kernel.org
In-Reply-To: <20261110150446.2452975-6-gourry@gourry.net>
References: <20261110150446.2452975-1-gourry@gourry.net>
 <20261110150446.2452975-6-gourry@gourry.net>
Date: Tue, 10 Nov 2026 15:36:16 -0500
Message-Id: <179434297609.2530531.2349001562856798404.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-10 10:04 -0500, Gregory Price (Meta) wrote:
... snip ...

Sashiko report feedback
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4249,7 +4249,7 @@ static bool vma_needs_placement_scan(struct vm_area_struct *vma)
>  	 * threads can help scan this vma, force a vma scan.
>  	 */
>  	if (READ_ONCE(mm->numa_scan_seq) >
> -	   (vma->numab_state->prev_scan_seq + get_nr_threads(current)))
> +	   (vma->numab_state->prev_placement_scan_seq + get_nr_threads(current)))
>  		return true;
... snip ...
> +		if (placement_scan)
> +			vma->numab_state->prev_placement_scan_seq = mm->numa_scan_seq;

Sashiko took issue with these skips, but its reported impact is
overstated.  It tries to point out a pre-existing condition:

  prev_scan_seq skips an update on a rare corner condition, but
  now the same skip applies to prev_placement_scan_seq.

In modes 1 (placement) and 2 (tiering), the behavior is exactly the
same as it was.

In mode 3 (placement + tiering) the result is that the starvation
counter isn't reset - but everything still works anyway because the
VMA is still being scanned.

I can follow up with *another* commit, but it's really low impact.
Not sure it's worth the churn.

-- 
~Gregory

