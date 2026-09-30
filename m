Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D0B45DF7F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752985; cv=none; b=uxoGH05bX3MUkLQeTpMybKxkbaGBW6uDQrlelVFFFPb5kFd9DZ8bEvhXdH9B6PFj5CWE6s5lAqwQYatnn5AWHc27KL1Fmzp5lzgFHtyI23KJsb8uYwJCsElfU1UqjnzKp3mEpvaKeu3kUKygDXu5OzxJs3GOBOoZvloemU0PXOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752985; c=relaxed/simple;
	bh=Joi2OZuTmjgbDN57dzLD+JcRLScvJC3JC66V30FnFJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTGqHizW9jl5jG/+2Yw210HgAeCGIMH1S0rEAX4mK/N0qWfR+0bp74iJm8ihueXuRg+i44NsJKbe+7pFh1Zy7VK1zghDHJ7gr2IO7gCPiXN4RF4Y6Lq1FnZfVi3jggxWe3WJgbQ7P93kNit1DGe7hef30jD6NPaYakp13X9MLJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVuIBfP1; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVuIBfP1"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso776398a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752983; x=1791357783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Joi2OZuTmjgbDN57dzLD+JcRLScvJC3JC66V30FnFJs=;
        b=PVuIBfP1Hkj0GNMbPlHeYSE/ADA0psq9TJpm1sHfqZcx5fUaNTVNAtHLsq+vQxsxzo
         XGoLyAlYfJd7xxh9jBlLLPvhm0kgXhnBLSh8WBvve3l6BdOyRoz/B2qs8QYn0NUdIaIW
         210iHvRxDyLnl63CSfDNQG/jSEjhYq4TEWsL19jHTiQxOfu19rl72B74p53CIINHOk6G
         hHUSifOS3PLhqUTTJZ4mBM3AK7W0TwQL/pFdd5rA4Y9N8RD84zu05YmxfKWw1W9Azc7S
         QbcN9uRZxppsjU84AbY8B6QexNqoji4NU9zCz0itPKKIeXgI9jemKofJBTRTYbGNzIFM
         ufjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752983; x=1791357783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Joi2OZuTmjgbDN57dzLD+JcRLScvJC3JC66V30FnFJs=;
        b=u1epLzWmKOTWKhWxJU4sIC7Cw8bO1MDuVgwGZzca50wXu3tNOg1FnNBW45z1QSunzx
         5aCFxcU0qcba5rnWAfKaOtYxAcSTic3DnK0+SvO6UjfD4O7yrN3bj2B/0HylBcrWJIuk
         q9RYLJy/bn5meQyIJMvM8j3KyHAS67Z2O/I4tA8cTle55D15dpT4W6kkm8TEt0qlX3Fw
         zz/VyzgGeAPRoca6gcDVR4rSV3BV1yHRKS8gz+6coNftXUtb3Hmhv5EMknPRTzEaCYCe
         4IFVNZnzR4MLmihAl3OWd+HPJ1qSJRBVniQ1YJL8X2ytJ7OjYHabdEklmLXdL4Nclc/o
         1frA==
X-Forwarded-Encrypted: i=1; AKwUvBwXIZ6UVuYNVTKAvPDAxTRN+N6WLTwY7VAB2veDTYQNk10TvIWSW3CAdfAm8bmIqLXhu6VLka0gWovPTOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXaXhjXaiCfz86gg5wRXeC2VAAHXUM5IxstvG4fZMLYs1Fmbiy
	GAajd4aEaRGWRCvIu/yspI5iKde9rnbp7W2O9pPWfoyyxHu3s/dsGZNHn+9RBH9N80QKsA==
X-Gm-Gg: AYBFou3W8dBQZRu9Er0M26bYNMn3r4RJ9rwh1/oDKXk7+hcoiP7AnPYtF9LyAg9j4Y8
	sKmqev201cWar/OL1mFTGcL+7tLQ9UirKbOQoa5ObVhaUHOmwrttcv87m7EBddQbitGdMec32U6
	SVN2XMsz4RYggUJOyQpEkyuuGRQfYq9J9mBq/3tpgQCH2WaToWEf4O9STt79+lK+RLBfnFQjsLu
	TvTuTWROD9w4fQjJCAtNNKaJdVShz4Grm7ZFGdzxVuHYtOESsXrlTLeEtG7e2XEHDbp4OrUyPba
	D3Um9+yL7zZhMQhcWO7PdSnnukZY+Zx1iY5zhnMymtsq4pkMaggitxv2N4wrMTNGBLZ7DuUh61z
	S8R9OX+SbS/ydPpt33OicYgLUCEmOUgXd0IF9QlG/i4guMIHNaI3pC0k/t6CoB1fcV0VNfHfAkT
	7OZNIQEi/3z1xGgp9lgAwc9jZwHNq29gu0zfL+1g0sYu2A+u2J8IKduAbqu9MhEeQSBPnbWmae7
	v50deOvDc83tyNfVzsCNNttWBme/h/pBQ1bd5vPkGDuWezq19gTHai8EAUSwDoKFYAW+HQwQv26
	Pdv6OD+DqOrgspekxaAkapWBNyf0nk1Bo9dtNHoFFKYQS4Tl2oKVyS07CiU=
X-Received: by 2002:a17:90a:fc45:b0:3a4:cbb2:f35c with SMTP id 98e67ed59e1d1-3a4d13a690bmr382719a91.22.1790752983099;
        Wed, 30 Sep 2026 00:23:03 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7da14e8c5sm345460a12.12.2026.09.30.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:23:02 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Anders Larsen <al@alarsen.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 6/6] qnx6: validate sb_blocksize before dividing in qnx6_mmi_fill_super()
Date: Wed, 30 Sep 2026 15:22:59 +0800
Message-ID: <20260930072259.1167895-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930031604.70544-7-benquike@gmail.com>
References: <20260930031604.70544-1-benquike@gmail.com> <20260930031604.70544-7-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to the cover letter.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
