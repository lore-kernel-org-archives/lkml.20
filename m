Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807E353A6B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927148; cv=none; b=iTEKefFac5QI5pYF4kWY853tXhKcVA1517ksFEQBDCo+LL6EK1lchnDKZLjmfvu5VvCul0APCZfl5drqIU2ulRZvbWtGQJtPpDAiEG3GTgeYupZeZxT1CM6EqhAGW0CvxxbeGAqbKxX81FF2J/Cw7/iBojNlzasbvM9DEnjiuG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927148; c=relaxed/simple;
	bh=gF7RjPEJRFWajt/OLcEI/3tzHIgjMyeLim53Upe2oFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nU/HNqTBh522f/A21UJgRozPseSL3ZslqS8KguEUzYR1S0NutDy+vVoExDPxBL6txhqqrszGhuomwdcmoiUwQ1O7zCfxwWCVo4wwNLU8tHJoYdKHQqzyPxL9cvVlQyCbL/sYS241c1otR+yDtec2BRHIJUpMbtyxn6KkQVIfunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eXnuON0z; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eXnuON0z"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e2904915so755387f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787927144; x=1788531944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BoxMq16+fYtVCLi36Xsb9nn9RavJ5HgJioRujA1lSB0=;
        b=eXnuON0z7SL4oznMBGst9qSBcOo3fOl/LXUzgaBWnOHkjqXCUiOSiSCofWmNzhHuFt
         C9xsrjVFAkWVcRXUi26Je2nO0TvJRYOAaewoLpq1ve3q6g2jZk8jh2rGROy/4aQSRHYW
         6ORnDst3cZZHfeFdJYvQqM8KJRef48cFX+G9wSS4GUWORN26q6PcvCDEPdVPjduqDrSO
         9vGlee0KGMyx+Rz+pfZl09rQERxM146WBE1qkQ4AbtGa1c7YMbrzTbyjtusCuT+t6sx/
         wXzZ4Jzs2EDS2Xsncu2VaGp0cy3O4sJ5uuq+Wj2Y9vtpma1BhqyAA09utlk4JNEbTIql
         uxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927144; x=1788531944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoxMq16+fYtVCLi36Xsb9nn9RavJ5HgJioRujA1lSB0=;
        b=kC1cqTqgHhmaQpQyWpORgu560LF2b8KRKNAzootDSLefP6gX9UzgWy+9WWpiZ8YZWw
         Nz6YPujCNvzm6CLjuDiVuU8RDxFBeIJ4a/Y8l8jVjnoEFCppU4BpHQdShV2A9w+cmKWQ
         OTlqXPIZ1E7j5/MIHYZ0ZJlQTpQmEVgSNrdvtxme6JxwMPRYYAvT/jgChdQjsbg2uFwu
         gDmD7IJfhS5WIZJe6wFMWvs2Pr1z9Th4/xZ99PPYZCUeuMFORgJC2Ld2z0SCCNDI8DtQ
         OOEF2euIbS/103Dtx8Rzu4uJtMqmRbW7QjC54117OwwmmOh7U0TiKRJTTOHznmdcMzDG
         j3WQ==
X-Gm-Message-State: AFuF++kjkW9jilhKZ3QK61BWq+OSuK/lQB03i0f+12dl6j+L1D3yA5oz
	IoKVcx1eMQMAbTx6ZO52Sy5ciSQS0eXBjQR40kqfUnBNl3bAl+RIgJoFkcWB52qWCpg=
X-Gm-Gg: AR+sD13ky6u8p4koPw0pd7khqWGS/SuwMA0eMdZhq5CoD3UGwWZ8dGVJ+nUUbbhZSf0
	9DT/4i5RLqWRQDVcT7NCRpf9r6O6FmoUtI+tPKX/OOX+z7kwJWSuRhi+jTt+HY8koFktzMwC1pi
	AQt+urHkALhU7RuVYyAFn6l2qnNP9sLfWnie5CogLXfXws8A6t/1VyrIlNlhEYwmDxT2P1QfJaC
	wc9h6VCKk58WjuP4dEt2cgzbx/Dp2VJpI0ti6R9IC9sm5Va4EVMSGqOm01UxVh+jDI3d3bnYEf2
	iXWG/SscriZ3zK+toq3WYLxudaRosQ+JZP/Rl3yPRoSRBuWDI5vYlCy46NCyxZ8+aciHZArmng3
	geGK+0siu2rJnSvoQcyT6ZPSe70LK/cwrBvLCR8DuDLv/XZJWAoG6e9rjsPC2FwhDFfPXIjguJT
	abTwjc4A0mbkuOWttzH9/Ov56v4aOvgN3Ef+6VkWKMc7bCR8/YcN1f1ASezc2OJuB6J3ITfgU97
	A==
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr23596595e9.12.1787927143838;
        Fri, 28 Aug 2026 07:25:43 -0700 (PDT)
Received: from localhost (109-81-85-229.rct.o2.cz. [109.81.85.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm17011155e9.4.2026.08.28.07.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:25:43 -0700 (PDT)
Date: Fri, 28 Aug 2026 16:25:41 +0200
From: Michal Hocko <mhocko@suse.com>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] mm/memcontrol: avoid stuck FLUSHING_CACHED_CHARGE bit on
 isolated cpus
Message-ID: <apGaZdxAPH68kkCc@tiehlicka>
References: <cover.1787890328.git.riel@surriel.com>
 <a611f2bc40d30f9c14a6f41b173185975c46a203.1787890328.git.riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a611f2bc40d30f9c14a6f41b173185975c46a203.1787890328.git.riel@surriel.com>

On Fri 28-08-26 09:46:21, Rik van Riel wrote:
> drain_all_stock() can leave FLUSHING_CACHED_CHARGE set after the
> work is dropped.  It sets the bit before checking isolation and
> schedule_drain_work() checks isolation and queues in a separate RCU
> critical section, so housekeeping_update()'s synchronize_rcu() can
> race the second check.
> 
> drain_local_stock() only clears the bit for work that ran, so the bit
> remains set and the stock is never drained again.
> 
> Reorganize the drain_all_stock() loop, reducing nesting, splitting
> out local vs remote cpu handling, and skipping everything on isolated
> cpus, which solves the stuck FLUSHING_CACHED_CHARGE flag.

Is there any reason why we cannot simply clear the flag if the work is
not scheduled?
---

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 69b37f63a307..907ac63e5067 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2261,8 +2261,10 @@ static bool is_memcg_drain_needed(struct memcg_stock_pcp *stock,
 	return flush;
 }
 
-static void schedule_drain_work(int cpu, struct work_struct *work)
+static bool schedule_drain_work(int cpu, struct work_struct *work)
 {
+	int ret = false;
+
 	/*
 	 * Protect housekeeping cpumask read and work enqueue together
 	 * in the same RCU critical section so that later cpuset isolated
@@ -2270,8 +2272,12 @@ static void schedule_drain_work(int cpu, struct work_struct *work)
 	 * pending work on newly isolated CPUs.
 	 */
 	guard(rcu)();
-	if (!cpu_is_isolated(cpu))
-		queue_work_on(cpu, memcg_wq, work);
+	if (!cpu_is_isolated(cpu)) {
+		queue_work_on(cpu, memcg_wq, &memcg_st->work);
+		ret = true;
+	}
+
+	return ret;
 }
 
 /*
@@ -2303,8 +2309,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 				      &memcg_st->flags)) {
 			if (cpu == curcpu)
 				drain_local_memcg_stock(&memcg_st->work);
-			else
-				schedule_drain_work(cpu, &memcg_st->work);
+			else if (!schedule_drain_work(cpu, &memcg_st->work))
+				clear_bit(FLUSHING_CACHED_CHARGE, &memcg_st->flags)
 		}
 
 		if (!test_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags) &&
@@ -2313,8 +2319,8 @@ void drain_all_stock(struct mem_cgroup *root_memcg)
 				      &obj_st->flags)) {
 			if (cpu == curcpu)
 				drain_local_obj_stock(&obj_st->work);
-			else
-				schedule_drain_work(cpu, &obj_st->work);
+			else if (!schedule_drain_work(cpu, &obj_st->work))
+				clear_bit(FLUSHING_CACHED_CHARGE, &obj_st->flags);
 		}
 	}
 	migrate_enable();
-- 
Michal Hocko
SUSE Labs
