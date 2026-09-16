Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE94FC8CC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565655; cv=none; b=QW8SLYWyEHK1Qp0CsMuICApPIcrZg3isg2vk4tzJcRd5ZvEUtHoy9aMId/1MkxsXhbu3o5xfWc2Sn/uT+lhPoUdaDFdp5K4TSxURm7szJ9qP4HcquINykA8zQOXfIni8dSWtf2GXDp/VdDgcqD7fFQm9MV291L3VBLU7VTAodyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565655; c=relaxed/simple;
	bh=TWTYiq5qy4yczgvLZWe5852fv9kP7nXzwOzboAO4VhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKcT+iqsHxwsRKjhRZtTZiz489TCcAlRV35e2gZCawMw7Y7vwoi384eoeL4Jdppu96kkywvG/mk7Mw+ILAZBSeqsSWWEHU8r2iJy2treWaUl2GcNSwCoQYprVbBvmMHhIxym5dkthz7rw6oTrs2GKu50CZIM3945oEspl+6IAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YORpnS6k; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YORpnS6k"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso671705e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565645; x=1790170445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKxhsj7x2KGNTWtDWeg+zi9RZVEL4pyqe1TauKiMIHM=;
        b=YORpnS6koHvO4MR9LQ7/GuDjQpiqBz9rxLRHUE9v4tcHIq2J3qmC2/yGE3Nw3nfI2N
         YsHw5/jrLTFkPHHpBr/OXt7oCU8rUlHMqWaYwbFMMlWFgMRVJR8yQ5KPb0d1q3HwS30B
         GF4GGeo1ALUzFaeGSuD5frMjS208Tlc9x1pnl581GA4VKEKbJarc1wq5hoSzeQWxtOTg
         twYliD3nz3ZpXUgEKTML8K7uWPuc/aN3zWZqGQo9F+soRvBKEsTfkzPxcyOmVxGwiN0G
         /QTV/3L2e4r5maVYjPVXskHgHk15IhTn29OA0jMxFC0MXXlHV9zr6N0NlfWKcv5FW3sM
         9wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565645; x=1790170445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKxhsj7x2KGNTWtDWeg+zi9RZVEL4pyqe1TauKiMIHM=;
        b=2eTzY7xDtT6E1JQ4u2zVvXUa4sDrfdNw3r/twbRqMY1R7BkBlcdpr1VTtdo8bK3IYd
         YkuHgrZg90/oj4X5x7zK2QWg7CXNaq6Z4Z8BWudQv0NvUVT6vx1VCsS2Mj6dGYlYNB71
         r0rndV8dfwbsmKAPjOxPHPz2UXqtbZVjQNvwpv/MHeirIA/hqrSG5mSp3bUO6LMcH499
         WBDTk4ameU7NlY2nZpy5z5cQfsNd2lXnEBidw4BT0AmZjV8SM20/+g0JQ4S69EY+Uwyc
         pAc80pr9nARemmOS0antHy48crZvlfEHwHfwRFwChXIVUPgjiCqc+tKG7ZHPqcRjiDRp
         XGXw==
X-Forwarded-Encrypted: i=1; AKwUvByUe7swSmrrvef7rt/M0cOaAJ0aKKo/0woF72RkN8DbQg0N81RM9htcFaGlOdgcmGiOs8KnAjOfb+vwj/I=@vger.kernel.org
X-Gm-Message-State: AFuF++lApKb2gYsoqWkMC5IpYCtTxR5jF3JwxZl2ILmig9kbUYQWRvMd
	/hsV0FcgauTs93A8LVlKcck5lO3GydX9krmqOnbg3Dj78dQVhxYXzAlD
X-Gm-Gg: AYBFou03pl+6vN8noMLgVHEyxq5yblZseOe0Lj7DAdndM8LKpNgv+nnv8pIfRenO3Tr
	0MGRoxxm6WOw6u+t3zbfMHnTEUkxqdF/A/gIRJ4vvhtLjtaQ+/dR46Roumhvg7It8/Tw5uqHbNM
	zlBXctzqa/wYQXlz5otU/XP9uJVreqnKWVvSHo8bcLeNpSYzFfcuRpD81EenaY3d3gqHIWrYbG/
	gUUC0Dcb7rwuIt6BRA5WNZweewnQynYW3WeZx17Mogau4Xj9w8yRywD5pjkY7LyF8+59WZgybfc
	XT5H2Df3G/KNYWGtl9ev20qZ+tlEt/QExCupmw9sac0/SSq/8IQqEqB+E0Y2yDP3JGUXG6acM0S
	xqmHmgNSatUN3lrDzrTlJAT4s9advFlygejrXyYMd2kX6xtk1njEinqh3A3Z5gyBo+LWWQ/r5IO
	j1PIXlNcvcLI3cDDMtUHiuYjNWkcGPDN0OoSgs74oDegkKqDhWFGdC9ez+n68mqcNkYXexwN1O2
	uGh0SZNuk3vyTIxQcHBzCP9QKk7pQYZVw==
X-Received: by 2002:a05:600c:1f84:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49eb733596bmr27842625e9.2.1789565644472;
        Wed, 16 Sep 2026 06:34:04 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm6931392f8f.9.2026.09.16.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:34:04 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: brauner@kernel.org,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	imv4bel@gmail.com,
	jack@suse.cz,
	juri.lelli@redhat.com,
	kees@kernel.org,
	kprateek.nayak@amd.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	mgorman@suse.de,
	mingo@redhat.com,
	qyousef@layalina.io,
	ricardo.neri-calderon@linux.intel.com,
	rostedt@goodmis.org,
	srikar@linux.ibm.com,
	sshegde@linux.ibm.com,
	vincent.guittot@linaro.org,
	vineethr@linux.ibm.com,
	viro@zeniv.linux.org.uk,
	vschneid@redhat.com,
	wanglu.priv@gmail.com,
	yi1.lai@intel.com,
	zhanxusheng1024@gmail.com,
	zhanxusheng@xiaomi.com,
	ziqianlu@bytedance.com
Subject: Re: [PATCH 1/4] sched/cache: Keep nr_pref_llc_running in the runnable domain
Date: Wed, 16 Sep 2026 16:33:28 +0300
Message-ID: <20260916133328.3422-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916123046.GE776954@noisy.programming.kicks-ass.net>
References: <20260916123046.GE776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Needs a fixes tag.

Hi Peter and Tim,

The Fixes tag should be something like: 

Fixes: 714059f79ff0 ("sched/cache: Handle moving single tasks to/from their preferred LLC")

This is the commit that adds this:
env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_runnable
thing. It causes the issue so, you can use this, Tim.

Hope this wasn't a unnecessary message. I wanted to
say this since I already found the commit and didn't want 
you guys to search for it again.

Thanks,
Kayra :>


