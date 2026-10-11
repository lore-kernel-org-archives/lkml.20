Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3481C75F9
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713205; cv=none; b=jrTDvT1WPVuJa4FYBhBwi/kyPtp/TcNChEZ5UXpV5xlPuPsvatfDju5sPGRnfgiL9llJWMm6NsHYjlLIxtysJFZ3qH60301sKZoiKYtsY1A8p6l80fYS5J/URbHf6hIvhmzXyoILPH94g92lGKkEc6ldGu/ft8MxFyLV5N23yfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713205; c=relaxed/simple;
	bh=g2OZqshVKJHxQmtATJG7N5iHityMRX425Ww84Gngw4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLfgTRb4z1KB5aUNn+aLHNe+ackv3vEkczmn3wrWahWpuI5AB/sHxSowg/LkaiGaz4gA7IRZAkp6stXQXEGqXjPiB/NTa8gYUQHm0tPW2jX+tOwEWrgzapPyePF6FPBOb70TKhfOhH3oPQ5CUTAmoLk9paf3De+oQB0SNohDRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUpb3I8j; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUpb3I8j"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4ba4425so133726f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791713202; x=1792318002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzsu1byePC9W4yIZ7gTJTcdhP4EEeDrnNov5kjt8Srs=;
        b=FUpb3I8jPw497Trlp1sDRHaYjhd9NiDhWBqY+S/Go3aZIzNFXr4JKFN/6Z2mBud4rs
         BmD/IM1aYrRDYFNnDKrENeIkfG40vLOcrc6RmxzbzVIS41P3I+yRza3GOq3eoYZCVlQM
         d3zx45pChvNKg/SuV38JLnvKXUO2SLkTz0pk5qHmVAqOaEDhJBIp7eGjFMCbEz+fOLvp
         L7RlelFOGPf0u9TZPlRgetZODscOOCCc8vSIxV4Wn28F6maIwfWjZiqhVVs9BXN6M2sX
         SVUmVf6z6S6QUbY/R/+7RD120zMEx+XW27v6IngQaul/yehJ6I1/q76JAzz/qbBKwXj6
         3P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791713202; x=1792318002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzsu1byePC9W4yIZ7gTJTcdhP4EEeDrnNov5kjt8Srs=;
        b=SxErzhTgbwQ864fkUAyiX1hw2pedFH+bMXuqrhMhFRY5O/I9cX8Zb2LnA4LecaLa7K
         hXbQFmleuWttL8OsCMH5MFZfVgmch1icHKTegEJDqrDoR0NhJ4/x5ZJ69uoeqInwsUSz
         sTwyOGyCRzlYGrjRFsPBURNoy9/7MqblORiDJ4Q1pCrhj9044hIhScb8ALjDcfdg+YgZ
         zGuO1qAOtCWXLJHObb+16GL8eNHBE/WGWSWfZ+7sav7BpeNjcq1Oy9lPskeoKtR+hyT7
         3d7DdZTp701yQj0xqW2HgHu5XrBKlm10CttK7qXLluWsM+mr1OQSNv5d+3kgUjNMUWzC
         4chQ==
X-Forwarded-Encrypted: i=1; AKwUvByp3gWnNYnZS237tiSMKWOrAKnC/c5PIzfH6neXcaugs+WCymapwtLIPEMTV1GNgv9FNuCLsb/lrmDC1Fw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlrAwwMWR9FxeMjUCnGwVPj9IW/fvNb6Jp0zm+ToVCI0u4dd4x
	IunecGQCjMpwM84UogPZB9jLmrsjyQNvx8j7XpCA/AOFzHgAXam8h4Tt
X-Gm-Gg: AYBFou0QGkET25E+milK7RURb/35tEGUA9wV09VpNh1beA7dCO5oLlV7mjtQ1MTV90R
	pXTcksKghTUy3hr2iHBw/8Egh6EsWIliwuGGj46aF/bj/sl0LI+08Hbd/pCZryRTvLE0hqXZWob
	iOgRMYoiX+L3tkQ1gmp1QnKaYbMwOQFq0iqrJeFUxcdv8Rb1ddw6NC3OpTSTsuF+zx5HkNfdn1/
	Z7wO76gTKPS0okGWTO3oTBkOd9FiAe0ZDY3e7g/fYLLj6St7lItUAcRugSsogA2jcLRmBOPtZup
	8/t4WKwVjlYsjOlrZcRGLSMjme2tT/x5ZnRXI0wfhj4XAUjrCXeGe8OXnMH0+kDp5doy5i4zEQV
	sL5TlE/lV+1R/R3g3i+PrbnDcPmSyNFhOGM1Uzh4P1ujetKaWyKTAFgjJfNNmOB+uwUeMxMwmB1
	YCNUBfGqAfkMqG2x5A7sRjei+/h8f3M7sIiJo215ewIEHV72hrxDOiyBFne8lqaZWWM016ZVxpr
	UrqjbHzpwVo+M9p11ZOKA==
X-Received: by 2002:a5d:5f4f:0:b0:48b:58e:6cb7 with SMTP id ffacd0b85a97d-48dbad1e2a7mr12353366f8f.6.1791713201415;
        Sun, 11 Oct 2026 03:06:41 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac94c6sm13396217f8f.42.2026.10.11.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 03:06:40 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	elif.topuz@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sh@gentwo.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH] sched/eevdf: Fix vprot across reweighting
Date: Sun, 11 Oct 2026 13:06:37 +0300
Message-ID: <20261011100637.60790-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ed2c3c89-f556-4fad-b17b-cc08f2eab84a@arm.com>
References: <ed2c3c89-f556-4fad-b17b-cc08f2eab84a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

> > Currently in reweighting, while a tasks vruntime changes dead protection
> > could go alive, or alive protection could decrease, increase and go dead.
> > 
> > To fix this, implement rel_vprot similar to rel_deadline. Only

> Ah nice find, please allow me to look at this code for a bit if that's
> the best way to implement this, will review then, for now

> Tested-by: Christian Loehle <christian.loehle@arm.com>

Thanks for testing! And yeah, take your time. 

> > major difference is that rel_vprot is not dependent on
> > PLACE_REL_DEADLINE, because there are no mechanisms (unlike deadline)
> > that recalculate vprot. So it gets carried.
> > 
> > Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> > Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
> > Link: https://lore.kernel.org/all/20261001164609.244156-1-kayracizmeci@gmail.com/
> > Link: https://lore.kernel.org/all/e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com/
> > Co-developed-by: Christian Loehle <christian.loehle@arm.com>
> > Signed-off-by: Christian Loehle <christian.loehle@arm.com>

> FWIW my SOB shouldn't be there anymore.

Right. I'll remove it on v2 aside with Co-developed-by.

Thanks!
Kayra
