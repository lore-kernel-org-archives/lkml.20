Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BBD3CF1E1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437475; cv=none; b=VwK0CuIZbzGTcNN3AucYr07aLv/nuWGmdWN0DkiY4ekXU+nfAf4TUdHv7o7a/6XlCAU+jjFoRJOKAYaSuMKpQpwx26nOZuS6eeS7ENjzqvEYqBqY4OkabjCnwrQIKzUVjDrwQdPCb/M4w1lG2XAaGEpKw6tmcUa6Vna9L4h6amQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437475; c=relaxed/simple;
	bh=RzPgH/3eGo+TdM3AJC5ylErp3efZkoBM2RxE6XOg6z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cK/ePNrnSmC4fH+tKJ/lLpMtQlRmX22qXEu+g5CbkhFv4tCw1c7QxERFpj4aEPQqx5/CNRuI5VXDNPBrCGMbFzWw+8+GpkWyhZPvS/BKNUxD2Rpu8US3iWrIrKwU9yY8KlL5dGlRqHQKO275NpQvpmtjyFS+gKxs4yX3+C1oXew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTquKce7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTquKce7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso459585b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437473; x=1790042273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8LtHfoqQuWljZWMj5fNvShJKWJ7Eo3q2bY3EGg9Y51M=;
        b=oTquKce7kKml8UudqBdJjRYYXkK7xVBS0OZtZssEc4L6A8jL91zwz31t7CCC2AfJ9Z
         M6F4E01S2fn/GKHTMMVFxIOZWofX6DrXzM3ILW+siPw8AOLa6PutVF8DwY7lkBmZ1KjL
         3BUeL4nljRO+69XLDcCYzoTyhMaU9DShKdjHA4bl0Bc/GAaohyhYb1StPRgvGdc7Sudh
         +6fz4fEmatET/8zD5q541u5TQcuHAcb3wtfPgA3B8oG64DfAWAXpbYq4s6MsO9L70aiv
         oAKLAQBYwHQH8nlxVXejuT++l3BtE43uKUXqQAQOsHwH3/55s3wRd94FgbWVBWvWpAT9
         c31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437473; x=1790042273;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8LtHfoqQuWljZWMj5fNvShJKWJ7Eo3q2bY3EGg9Y51M=;
        b=Ll7Dvf0HreDs0uIX4ZJdQFJoQgeqtN+oVVQjRDsqbZrl+sSHR9ybVACsuQPzNL1Str
         uOQ1FhfceXfa5kt4HX5vAnx1d4yVr3j/DEaLc0ng+GwLkyMxt9uWEqslG75b/eIrUYJE
         Ci3Mhzhh01HjOYOBOq+yY1Ux63/07ARHcn4yBn0JxIYu/gk+CaG07vjVuq/YF8cIBUXw
         HVaXP27Z4OPRR76+G0A8xVcbEy0aqBBoXqvAiv9d7QMzhS4ZssusTOt6j8LgWcwn5/Um
         MTRvLXg75prUEkREEubYO+eIkgH4tQEaM2bwIYWdCIG4m/qT98ge0KVLKZbO+STiPrqY
         FH1w==
X-Forwarded-Encrypted: i=1; AKwUvBxVaIZQ46RmAgM/XLLITVbI3i6Tv223rdCTHuqw5BzFE9/ygLxDYAarMri+/Ehmi09dhQT890FYTVYNa6s=@vger.kernel.org
X-Gm-Message-State: AFuF++lMlxiy1o/gG9AEY5pZrerflNkbj+ed7i1it2imD82565YbTXai
	b6dbYMi0f0qUls8gzCkYfx+rSZ1yIbRMn1nvnLK8sQm1yGQDyepf9zRh
X-Gm-Gg: AYBFou1jL/0UtMLsffqR1OB99GfJTVdpoome/l8XBakL6pZCPMcyX1rt0OCwg1EJxXJ
	A0tl2Fn80vvenWgQE0pzIi5wTXqcZutwSpCVR/nm8uNRvEghl507Yc8n6zIf4PN0MNNlxX9r2+V
	4iO3n9iAROYfbUg2fnU2FArDciPFp62heWQmW/orRc4h5n/VZvnABbraHFZIzuo/EpcoqKHq5+c
	Qp4PHvlRDpYsLWWXWbuLkc8lFH9zwLnFGxd1s6U2rNWa6BYEF2eJn6nrtuyOtFAW+vjLn1RahU5
	YLitNem6Sgd2VBNf2zAUU/x0s/gPuML1gFvNhCjLkEeBe6FyYEGNNTe+tFuh1A16tO3cGu0rYTK
	X51inO7XW4gRJKO77va9SvzV+eYEvlITufIY+M/gf0DOvazkXlV6k1wciKOr1eAOSavdv7G5f4B
	NbaOSmwEfP5noHFt9eZ3aYl1gm72DQce9FNHdMrQtHPFvLlMJl7i8vrR2SnUctMS4HDEu4UnSgt
	4RQ1ur8SJiR0ZX+TbmKkdwjerzxqlq9
X-Received: by 2002:a05:6a00:3a01:b0:86d:117e:5db3 with SMTP id d2e1a72fcca58-8708c45f131mr2265230b3a.26.1789437472373;
        Mon, 14 Sep 2026 18:57:52 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b6139e3bfsm5231011b3a.50.2026.09.14.18.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:57:51 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	hch@lst.de,
	jack@suse.cz,
	axboe@kernel.dk,
	tz2294@columbia.edu,
	baohua@kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH v5 0/2] f2fs: enable buffered RWF_DONTCACHE
Date: Tue, 15 Sep 2026 09:57:45 +0800
Message-ID: <20260915100000.1789437600-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788795700.git.qiwenjie@xiaomi.com>
References: <cover.1788438786.git.qiwenjie@xiaomi.com> <cover.1788795700.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jaegeuk and Chao,

Friendly ping on this series.  v5 includes the mixed-bio completion update,
the syzbot NULL-kiocb fix, and the additional memory-pressure data.

Please let me know if this direction is acceptable or if another revision is
needed.

Thanks,
Wenjie
