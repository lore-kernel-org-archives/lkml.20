Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A90118A93F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789318343; cv=none; b=FdhiyUbQhcdrrPBq6ElDcYrE78cTvLC7vIE3HeZcAxhjbN5hIaLN300PwcN5jhfMCHd9L6b4+MkEiGrX5iTZkm+U5UMG0uQpSJwGqLPlEUg35D/hv6wGcIRitwICHGs6Hr0imPPRaFN7HrGeZ7oXDc1ohfkF2Oy4+qqdVArfz8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789318343; c=relaxed/simple;
	bh=YwMJ1wGjJY0ruviB3QKeSIig6Dj3SI7sV0VmgwA0V3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hE2IU0BPVS+2sL/z6O6e6SWLcVbRPqkmWG+IiORRh7UnUKWJtyrVHtt23/gmU7Gg5tccPBm824bhCiQ4QmoguQ6K3bbHe7D5WpMW09uwtq7qPTIwqsFDTaWqY7xk0sGOnFaXL8GQaj28nxthJqopg/iqLNoUusTcpij8BFvcQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kom4h6EO; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kom4h6EO"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b30c94so167134f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789318340; x=1789923140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwMJ1wGjJY0ruviB3QKeSIig6Dj3SI7sV0VmgwA0V3Y=;
        b=kom4h6EOvMY/EKH5HGu0enzd+RzgCxkggeqjjslQi0ijyHGTUwP8mF555mhv9y6qG0
         6v6QHY9etlx5u5ADJ64mq1Q6hvfTmSGQFbMAXXVzuyLWaLQFfrOPMrvDk4o37LA+Zn5p
         AcnSysa7ew4vQpMD+LCpikD4i0/PTwAStuKcaxADX9fOFisRzF/Omq5XoYMx9fFBeqDk
         8MMzz/fy0IhlXUKYT5mB+ZYgPNw5GkyNmz7fnvBgpsmhPdw5XjcmGbMlqatKIuF1jtpE
         01jmNBsWSRcK0ihSFFkv9mb3A6rMN+gbzUEncwjfZXB9ATwOAry44WliPX9HpSSdORjT
         61hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789318340; x=1789923140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwMJ1wGjJY0ruviB3QKeSIig6Dj3SI7sV0VmgwA0V3Y=;
        b=WmzC7bVz8HySNN/X15GAC6d6DhQVxShZbtkX2CBEyW48XuoIeDwPgOo70zt5DEyTGX
         B9DvFafqG8PwL3zDr73mC8A5o2XO0xBaBzZPenGwYeVg9FO91OX4EE4uL10KlJR75x6h
         Tec7cMIfKmK/v8GZP0zrhphybzGkZ3eKGq3bCtLh+Z7UU/sNaryas0iBtJZ7DQdI1g7a
         xvRJuzQAoQkQlBdBZo3aI7kyrM9jXzXZHKybY2svi1VYkOe6SBn/UnVGvToIdzWzB0tV
         Y8sRFaIsXZ4RycEUhEzcZ/2q0F2jteAFfqb7VIYRo1l4h1FRf8h2t601mKuHPe0ANE0O
         FWIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaMh1ATTT4MASROZwMCfgZ6cBWUXk3gAs0bVdtz4Ghuy/B1pSMAGogDjErF3X1znmU2uLnsf8CXtBy7Z4=@vger.kernel.org
X-Gm-Message-State: AFuF++lnjM1cR0ev4wUv6K9ME/9qNcU6QT3v6eQPE9+cfv8OXvSBKPaz
	JMu9cxqTDmrVytzHRtvd/uqwsHcrZw5tiK403dhYdp6Z/6dkV0J42X/E
X-Gm-Gg: AYBFou2PSdPx7ICleMApAsnoA5byaTBtUChZH4HeUu2hZlzD2/wEYZTFVIO1/MVM3SU
	aNfTR8t8UqG0btnNUd+zzJCixbKtmuyQSdj9IFSrFqkBraFWhbRg4Dz6I7/JgDdID0K7osX1UMq
	zLLapaj+Ugs9yQsI1J8UeGDBb0CrBn8yEKYTJCc9C964NsLaTHHMPgn/1eHlVXgxsXkuTfWCvB+
	jp2fCZYG521aMRttMCYsmXQmvvmgxYcIGZZCa5oLAsvjtrR66GWU3pS+xjz0z+nhG3+WMtQ+u3F
	XMBjVYOMATgxkk7ZX427HKDJeyFbzbg5x6GNWHINUTazC1vNskRX5b47mRLkbVO0YoRr+TE2Hg+
	5pZxjEqZ2RoBTUJ/cxM50qBztBusoi2SvC/sGMtRABg7pTFkjPysUHOzm1toxmR20QZS+WPDuVm
	3sUNSVxkwGKY4NZLvl7S/x5U9RtdIJEfvw9PthpOQYfxX9x29jJTLJvnlVbBf8ji1Qxj0PDqElv
	A4Zoio6YyByNP09gbNN
X-Received: by 2002:a05:6000:430b:b0:484:3328:1ad1 with SMTP id ffacd0b85a97d-486ebe4df2cmr13717428f8f.6.1789318339530;
        Sun, 13 Sep 2026 09:52:19 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ea4fsm21190525f8f.21.2026.09.13.09.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 09:52:18 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kayracizmeci@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/fair: fix typo in requeue_delayed_entity() comment
Date: Sun, 13 Sep 2026 19:52:13 +0300
Message-ID: <20260913165213.1273791-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260822135432.327466-1-kayracizmeci@gmail.com>
References: <20260822135432.327466-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle Ping. This one is not urgent, just a typo fix.

:_:
