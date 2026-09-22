Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C27138E5EF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080560; cv=none; b=DYGVt52LN9Gjse8QnK/OcQO9QdNVXeAAKdJThqbOyXs5cXwCJiNJo/CMB0Om4gOisKLNRf75rzG2DaEYTjfeYIkCJLaiz4q/DEPSGXOSe0XpabOz5vRDPnyce714rBOfjwvnEohppa+dQvEiFLHOx7nF0KNo8ZXSEtzKHVEZ4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080560; c=relaxed/simple;
	bh=FHcE3cZ6fwiMxVpjYkw+FYvWo6dydU6bYcNdLdIYu54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmY3KlEz5Jd5n0T1PZXCo3laeZaP8qwd3l3LLBUgRBQG6ocpl/AIpYz9HdVAyx5j9wjOUEBj/4gASC5ITevHq72oFGVH98CqTtUTXfndIG/gYHs0XdvheY/a0wrxw7HkHuyXOXat3P1Lq6AnrW9L7NJ7174l0nKIxhpVOK3A40o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C9Q1dLPl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C9Q1dLPl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so24458455e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790080557; x=1790685357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FHcE3cZ6fwiMxVpjYkw+FYvWo6dydU6bYcNdLdIYu54=;
        b=C9Q1dLPlTIqKTQXe4iQtNDUzZAlq2GTJ2d8qKPzvB/DAXYTioASUz3akGBtO7GbGJW
         q7bmos8QtDnMiMlmiZzziW4Bq5LbD5n8meCGy7ttIUY4yRN6YqLYw4wOXnd0IaOiAOcM
         gvv10G47j61rSKzhIyW36r6dkrRD9M8kOHqsYl0Se/Cr2ElQFN79Qwp1cGw9yDiOGJpx
         yiaWLUkjrX9wjOBlFDPjCwPpVUhsHnIp5hDL1VV9r+WO27fyMTbn2utt8/KnBWWKdPfe
         bYYh2WaTtcSfQRRE4x/yBJ/7bATe0xwNAqM/N0LPP3G7+HByHKQc7g66bESKhn27XYmX
         Fk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080557; x=1790685357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHcE3cZ6fwiMxVpjYkw+FYvWo6dydU6bYcNdLdIYu54=;
        b=eN5TTqapGCd5Mr2UQqb646KSFeTCXRbQ3xATbdEtF67BAkQXmxtDcL7ohrTlx/zcB7
         /NrEa/7Z/72IrkDrVpfUh2MI+M2MiAwi8ECocyT3BDkwumxxNqGVfU2QJDuR8TkbBqUi
         IvlLUy7v3wvZCeXhAlga8jHVm6JKSYXWKY+9edv51HHao6Esyxne/oLr8aGnnsu7FmYj
         JRVJcY+bCgwYbnL1cruGsTGvFZtkJIg69x77fl6BFJgS6K4jyyUo/e7X5/deninTGYiV
         HZqNbvkBpVOXUl4XhIKx/Am1jAQhDz/WUln54M5QkWo1v7IQdOEAE3h8+xQDb7n1/ygW
         iMfg==
X-Forwarded-Encrypted: i=1; AKwUvBzduJUFf5Qa2cRBc5DEF9YaMboozk4Y7NB0kheuK9+D6HMhoNR7IB4qqE2dPvi8WyQQ9V2LfjKZbHgoTxE=@vger.kernel.org
X-Gm-Message-State: AFuF++lY/FVM0KFFIEa6aI6YYUM51goNwJpk8Oe00ejES0iEG5/8W7cK
	kKPdgw7GeDRvdMnaaVCLHU39o+kuH06XONvRNrwOZCIRq9S+dVHw3hhJCAnOtD+Vkk4=
X-Gm-Gg: AYBFou2bCpHd0PKmtN8l0Z+xA1UdjJGQoPKftBts0q8A3xGnpiZmnQYMud523wHfSoX
	kzTBdqrTxrdnjRAJsuYv5tkRXYvQi/FTv8MwHZKn6rZd1hsy8GzZO8H8xH9g4m34s8J4L15up6q
	93px9DnIeXl8JOWm+0/IF9RqBw1rzmt33VyCogzH3xq3l2H4jy0sz2GFY8EMVsr3KGaCt5JMi5Q
	aJQbbf1QeAY7Y3wYhP0LaoEldEnbT1QCbhLB71LEHZtjCHpvL1pJxI42VLiiSY0Al/jpGP1Dfub
	f3wrQ5vWn0Hb/FFRN7iizjQQSQyte97BhE4rbwBRQ92H8gXaYJDI3p+k8CCyIysqIsUqloDHcmi
	pPigPdehAQ8eA5cQGmKE18wgwLtbWS/KHNKcWhSRfYUUEbJp0dq2oR95RVSV730jTIpz9v4UFGV
	DcTy9Lm06ecADDy5n8xK/9kwt6qsYcIbokt5VdTcUzG+zSmGc/BClsELQEqwjyiXu5LXG4e7XP
X-Received: by 2002:a05:600c:154c:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-49fc5743c34mr186953035e9.29.1790080556773;
        Tue, 22 Sep 2026 05:35:56 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad40b32sm41331985e9.9.2026.09.22.05.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:35:56 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:35:54 +0200
From: Petr Mladek <pmladek@suse.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Craig Lamparter <craig.lamparter@hpe.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/6] panic: fix panic_force_cpu= redirect races and
 NMI bypass
Message-ID: <arJ2KqCA7aBgt71r@pathway.suse.cz>
References: <20260916182957.7788-1-brads@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916182957.7788-1-brads@mainlining.org>

On Wed 2026-09-16 18:29:51, Bradley Morgan wrote:
> The panic_force_cpu= parameter redirects a panic to a specific CPU so
> the crash kernel runs there. The redirect code in panic_try_force_cpu()
> had two races and an NMI bypass, all found by Sashiko. This series
> closes them and kills one more hack that the rework turned up.

IMHO, this version is ready to go. It would be great to fix the commit
message in the 4th patch but I think that Andrew could do the fixup.

Best Regards,
Petr
