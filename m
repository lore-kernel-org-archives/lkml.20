Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FFD23ABBE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704016; cv=none; b=vGaydohOLT+tnVnkciolpoHicDfFmD6PZUWZx72PuFoNou1nSaNbD/PhU1fdKaCyTVUECMoGhyl1gRJT9NjfnzNDcu7hggk9jw3Ch4MncFtx/mRQ2S1TPKql6uPS+MXx1+ZgvscPvT3fzPKa4GaHzgSrb5WjguA02ysvWhghJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704016; c=relaxed/simple;
	bh=plLnMTWHjT4ksAJ2LtWoCd3HEFsbF70ylSiNp0W26Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saimI3hyMwIf/tlhIbedC3Ntu8/+Qqgnm57YMohyXuk53ylfIoGoNOcux59EiKJkWqtxFrpAozCAtricPnbMdV+f5mQxXZqm/2/EFncP6PpcZ9jNP6J5ZFtTEB8D2GnekulhAiHuSE9MkU1WU9sPiGSghWsvIN+lhz+pz4zSrXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrNbTkmR; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrNbTkmR"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488837e7eccso482808f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790704013; x=1791308813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kd+neJQ7oIbs50uy2PwGD5QdD8b7z9vag9un56+bUwY=;
        b=CrNbTkmRvqO0iUHrQU7avKNYRsdeiQTkSU4u5uCE1+lNvQfnb0iFFlD0AoEhaGFdJ+
         tBf7DaDpTe8dVR1E4AYDKQEN4ECLyikUrBeMqkQeB22FTowvNefHfy4spOQEdoLWf+1G
         s298ko21CzHzNGzZbXokTyfo+K9N90k8k/stYuhK6pMxRaBPRIRfPlqEVgLkVl9EbfEU
         oKdp939OY1NLKEhOc3pedJZuazBx+sLzpamob9qgoK5tLhq/nru/eKQGfGR9PC1w2HUA
         ue9E0ftOvC4V34QrQU+EsWsSk7rFSUcGSgeBOw1PUgZh6r7NiSBnbP3QDOQevOM+bl9I
         NN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704013; x=1791308813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kd+neJQ7oIbs50uy2PwGD5QdD8b7z9vag9un56+bUwY=;
        b=hnfMS7w9LObPDidRed1lW55VwatTQkIZ69Hryo1/NlWe8jvtlqzpCs5mOfYh8gtW09
         HmwoNf5rcNTz+WJTzv9fcAYJBGirfQYAGB0e5tK6scXiPAnQK7VR1Abpp+YdKfkWr5g4
         BIVcNZVRoIYZBhk0h5K7jB02aFvAU0ZS8Yyh5VxVyn2ZyOG0c0D52wR7ascidF0VMz5R
         OIUiPPZARY7+Zh7YayjU+fiFFblG2LC7/nYnAVTHMJZAoJCKRKas5Z6epZE9YfkzK6+D
         nGR/NPCeuLTuI6UJDY+yJc7Cm9YxjxEzTG4t61nVsKn7Hiac59InmN+aq96FwTisdeuT
         02AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo0j1XJRXfAfAtWeaxukDMvPN0X9iraWmaJ3qHQIX+GWTm2CKxCZs07B2nrksOGzlffdwhTwyhzgCuIUk=@vger.kernel.org
X-Gm-Message-State: AFuF++lwXF86qfTphW+7+29RItkkZnZ3/+wT2R5CVzOwZMhqZReRg2D/
	tARfQD6uru+DtDX7DeHVhDiC2TifyTV/Aw/qBwEdqh/fGTdrc3QuprM8
X-Gm-Gg: AYBFou0SNtloaXLl4tnoIpAyoXvNk3s2JB+7oyeOFjGGfgnP3j+XetVbPho0HPxdVTh
	WcAtsSUMK5POT635U+UHEMewLdQ7snSUxoK7gBJ1pcjgPHT8g8wj3lheBtrkpMKL6bTIxiuUA76
	0+X8BIxiSMuvrOhqG2H2h8a51ABbR4Z1q0TPUPUpawJ5+EfdXkI1WlXM6ZMfeQUY4MXCD4P4440
	XZEgddEGn16iPkaHKFehALMaXcUv2DtR9w5A2LggsHJG+9T5N4aZ34XZQ061imIx58hZvPD513/
	tsmSUvH1tCrtRawPSv1A9OTpX6v4GLRuFkeTs7HGjNvybL5mwGh30c9mks4G7rJQmKfRlpRBGfF
	yk7Q99BZLiTQAzuyKfL6C0i8uKnM6UzO1vbR7/mDEqj72zzs5iK6LM/zUo2jW3Pi/fvedhMOd83
	kOc1y6iyx93CckE7s8boh/QAtuW3fHxdM4oFV/NCvSJ8zEB++hvK1s/CxNz8wrKEVL+pFCuC1Ay
	Zpgx7ya8EjSoxxGa3Qd
X-Received: by 2002:a05:600c:6088:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49feddba128mr243816215e9.1.1790704012063;
        Tue, 29 Sep 2026 10:46:52 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfe16a2sm94724455e9.4.2026.09.29.10.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:46:51 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@kernel.org,
	rostedt@goodmis.org,
	tj@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
Date: Tue, 29 Sep 2026 20:46:47 +0300
Message-ID: <20260929174648.196105-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929085320.337703476@infradead.org>
References: <20260929085320.337703476@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter,

(Fun Stuff):

> @@ -15731,6 +15766,8 @@ static int __sched_group_set_shares(stru
>  			update_load_avg(cfs_rq, se, UPDATE_TG);
>  			update_cfs_group(se);
>  		}
> +		for_each_sched_entity_bl(se, cfs_rq)
> +			update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
>  		rq_unlock_irqrestore(rq, &rf);
>  	}
>

So, the code is this:
	#define for_each_sched_entity(se, cfs_rq)					\
		for (struct sched_entity *_BL = NULL;					\
		     (se) && ((cfs_rq) = cfs_rq_of(se), (cfs_rq)->backlink = _BL, true);\
		     (se) = (se)->parent, _BL = (se))
	
	#define for_each_sched_entity_bl(se, cfs_rq) \
		for (; ((se) = (cfs_rq)->backlink); (cfs_rq) = group_cfs_rq(se))


(While writing this, a suitcase tried to assassinate me by falling from top of the closet,
what follows after this part may be the symptoms of my brain-damage.)

Let's say we have a *thing* like this:

  +----+    +----+    +------+
  |se_a| -> |rq_a| -> |task_a|
  +----+    +----+    +------+
     |
     |
     |
     V
  +----+    +----+     +------+
  |se_b| -> |rq_b|  -> |task_b|
  +----+    +----+     +------+

When we start as task_b, everything goes well. Both groups are updated.
On task_a too, only se_a is updated. 

But when we start as se_a root's backlink is NULL so we don't update anything.
While on se_b rq_a's backlink is NULL and update se_a but not ourselfes.

I don't think this is that of a problem tho, and
I could be missing something.

(Ultra-Fun Stuff (Maybe)):

Also, I saw you making an Assisted-by joke yesterday so... 

Assisted-by: Fingers (Typing)
Assisted-by: Luck (Born)
Assisted-by: Computer (IDK)
Assisted-by: Knowledge (Knowledge)
Assisted-by: Linux Itself (Kernel)
Assisted-by: EEVDF (I mean...)
Assisted-by: Water
Assisted-by: Energy (I don't have any ;<)
Assisted-by: Sun
Assisted-by: Universe
Assisted-by: Editor
Assisted-by: LKML
Assisted-by: LWN
Assisted-by: Music (Vibes)
Assisted-by: Heart (Broken ;<)
Assisted-by: Brain (Damaged a bit)

There could be more :p

Thanks,
Kayra
