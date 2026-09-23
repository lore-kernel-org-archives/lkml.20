Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB127456299
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149135; cv=none; b=ZrgRc/nXb0hceEIPznaKsYGlGjJA/6x5NssCvHgjtJzznZdkX2PXbaV/Ia19bj8UYanUs4xzIKdW3HAdTmmXv7HW3XN/T0ivNLYXt1hdz+yFQJq2FlHdZYZEkT/aiMBU8XdVXvnqIVbMV5HvkHbInbaQ1JucTCtES5YsBhV+Byw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149135; c=relaxed/simple;
	bh=CgvfhIqOZAHIwmp9VQvCKx4wipNWh8764BFs96AX6hU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HC/g3/LkOaOGMQgy4lnIF2D2PZUYIWhHJR/h3wdh971i/wZFQdMWH86RwLY5oSezZGrPk4sbJySMJBdNdDCiVslNi42e/hR5EJ0d3fVTTXwBrP5sqNdJIMBXlhffufKCQ2+qwkuMnzNfypcZYJzqyBiBY/PmwQzhwM7AMWPw+f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFELAUH+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFELAUH+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so4915295e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790149131; x=1790753931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fgvGkM1pyyECB7C7U7NNpHz8bjTHVJbR1NgyRpCdbU=;
        b=jFELAUH+ZaoTML/dAJ9DH0XOR0j/lPpSpfkWaFurv3LtCk0P7DMQ7Jeivq7XKFmQcq
         JSEab2I+ah5RVL/JXlw4jPDHCbEoUEXfUdrGKjKA3Lz9tkdt+4++JRvWwpWB/hqxOmKC
         Qo1K39jM9GxOX/nQ7o1EA1be05Wwo3xMQ4oK0P3zgYgyu6VsALfGTxv9dp/l/VoJuk0v
         3Z7cEDQayZ3lr3FhAKKH8/5oQDaNhdxsDIMSeKkckIUrnGRxipaXsdEyFYZfSf2JgiEw
         fcR6QshcaRDqQAgmIarc/w+V++rVqVBQWzrVRXxWiv95hSE29TaNZtoic+tCf1boYx6R
         CTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149131; x=1790753931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fgvGkM1pyyECB7C7U7NNpHz8bjTHVJbR1NgyRpCdbU=;
        b=y1Cmbed6UB2RLXuXK2Ff3znJIml5PvLQt15LXiRrfGPxaYzONiNG0vejmpcxL6SlN/
         RcmdpGuJdSfEIiVn6N70t6YngJKjpVUCsPKCPW8C+TGbdwey2PZFAw+IBrLCqNM0RbIa
         sBQ9HJZ4qSxwxi11za/GVrAdQymX7SHROF+ZI8R+JtzVvF4vf8HiNptVup+1qjv30T/I
         FttJfuJjAGmVBZ6caRbbPhoSsif13v0pWMNlNNK+Kylzqueu7LX+TylJePNRk0wrEDsg
         H4AFEdBJQnZreooyLYyogMYUtS9f0KHfLD9prusXpuvDHPsNNIQiolySumtPg0qsyb2S
         DR6g==
X-Forwarded-Encrypted: i=1; AKwUvByzBBivzkEH/nG9HoWc7P4KGdMkGYsEDa2YWMrz1Y6/rrPXn0t3FoU76isJzvBqkywxvBXPQ8glBsUQx2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++khUUpdjebWUSI05Su97pFs1uBH87JC/0e1hKCMXT8kwOWxQ1lg
	kgHHKWWQYz8lV92LYcIuX6/rSmiRdp9NmWujXWPlFgBCxco6vJ1/YvKW
X-Gm-Gg: AYBFou2wwtBK3xUfeq8I1Ya7Z0Mzf9/uwtZdtP59zws9xDci6K08ViJZnoInA/e/n2l
	0cLPZsqaTCn77bBP3SUnT180X44LpJOCPVByO99Pi1i2eIREuYS6nXgViStZLxua4zxqUJaMCxl
	VchA1SLAmfekcYaKv+fmwW0lC27IM41o6ktL7sxbbj1GiTA+dWVwzRD0EMKqJ3m/anXsJrpAuAZ
	Qacv8mtDXJKX/buJsjvADM/cjZ3z4AqCgCEWVJPJ3JQJLeSY3w95aO4T9M1Wa3MUJItffxVkYSV
	EjSuJASnmrlavsPguq1KCalDB2dsNkPksYLkWaRT+UKWnRB0ZmLa6EuaZHi17oa4xsFJFthPjxB
	+b0CFBfgxTcYztlYPePuCjAFpooebDju69lqOLybZt0dAI+fstzmw/2Hz6ze3/SWWcsqdS1q3pt
	mP4eTwVLBolTDbZ6woTdt8UZhnpTHLHViszKi3hd2s4JiIh4Jnyk8+F7lFoiLX+Z38dztgp6tSw
	MrN/xSk4/Ur5AnZWs5uuBwo1mzE7gpy/7ycbu6gv9h9T3LMcuPwBWx7fPR1tOBOQlHaM0VckgXK
	6lvi/ra2n7NIkV3tq5MZsYLLs5GZj/9HUTR7P4NjbLLVYod6hgMjOwYmC68j7Oe1c7nfanT9ROX
	zznvaMT5fJLujmZUOF4h+OZd4rqIDAGGmKMDz74yOZ/Ic6argF+usHbdqdr0SProCjDu0MO7pKs
	dPdyIp
X-Received: by 2002:a05:600c:1d1a:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fdec98769mr20567755e9.0.1790149131103;
        Wed, 23 Sep 2026 00:38:51 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde134739sm52926645e9.0.2026.09.23.00.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 00:38:50 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:38:47 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: buffer: serialize buffer teardown with mode claims
Message-ID: <20260923093847.00004c4f@gmail.com>
In-Reply-To: <20260921062421.64647-1-kimjinseob88@gmail.com>
References: <20260921062421.64647-1-kimjinseob88@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Sep 2026 15:24:21 +0900
Jinseob Kim <kimjinseob88@gmail.com> wrote:

> Buffer-mode claims hold mlock to guarantee that the device remains in
> buffer mode until the claim is released. Normal buffer updates take
> info_exist_lock followed by mlock in iio_update_buffers().
> 
> However, iio_device_unregister() disables and deactivates all buffers
> without taking mlock. This can invalidate buffer state, including
> active_scan_mask, while a buffer-mode claim is held.
> 
> Take mlock in iio_disable_all_buffers() so that unregister honors the
> mode-claim lifetime guarantee. The info_exist_lock -> mlock ordering
> matches iio_update_buffers().
> 
> Fixes: 0a8565425afd ("iio: core: introduce iio_device_{claim|release}_buffer_mode() APIs")
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
