Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B253C2D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787808620; cv=none; b=fKdoQQMomYovYIDwFhSnZQwqjB+FkAc5oUdYHsADEUo3P5QJxR8tUUUc38w4tdqMrnnTMOn4GWo0RKVj0xnuCGHk+TNWZgoB+67JRdyTVXhlMqtA+Y/Ze01TLbjr9G7PGtYyX1/YErSCTsrHB+wtq31FoJY/U/kRex/sOY1tzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787808620; c=relaxed/simple;
	bh=S6Rl6zBjfS0Ca1JzT051AkUrgEr/ED6h/G4rtheoPQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmikzvmEp71pfQZO834YNnB0WP+t/UpZmzgT1eff0G/A61HlQmaNsCixDCRa3uHbbwywKVUF0Hcv6r7eeYjkfkyqyRwmFknQliokXIQSL80avkB/O57zOPqh/ZROULb8DCpSu6Z5T8p22FU7ulYdW4MTOav8hagftSGOE3pIvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqGFyV//; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqGFyV//"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1216491a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787808619; x=1788413419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XT4IaIglNY0yBU6DSM9OX+m1P0B6x9mKUa+wNt0cik=;
        b=GqGFyV//Yo+Y31aCZ0BkXVa8Rth27BXyDZgGlriDdUNt3zm9UVZsMIRsAm4j4UpUbj
         34nP/0/+2P/UcQrZ0A90c88oRnlVFq2HJALvgPEXEnGfzuPehgA/M2QeIQW3ZRM3+3zm
         qOT1ije3LVTJFxdzDnfz4o3ruoHg6A3sfHTPbsGjoLQcyjvcNOzbE7RraQW+56VuRw+N
         F6rRTMWafz+3uG9DAvKqRK8pQ4kknIrpBOab/bGLr090poVfFXYv3Mo2ORfpzlNWpCXx
         yWj3k+2/UzWsN49p3DIPBXJTQMm9qkmMJsoB7YCPG8s+ocDTyjSfFVchysd5501hzEFz
         VoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787808619; x=1788413419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XT4IaIglNY0yBU6DSM9OX+m1P0B6x9mKUa+wNt0cik=;
        b=Yoy60PSmpnehTJI+lG8Nyc27fHMpONcYft9v1qEkJ4FUvlrqKwGAy4cWVqDdPKP8F6
         XkkwqtKHG/IRKLJk0ecMWvdJQFglKBS7b3GLIDWsdWCP3TYLHiFi9XBA4S5bczCwZHDD
         f1+3klQCvRgZDdf+I4u5Q5Xzx+p3NTIFTQY5g8dvQ/wwe6Kt/XdcB5jINkWe/uoeXjN/
         xRlZbawF5dtbH0PSHKy2SBJqlkL7kt1JyczGCk2mFXfWO3Y81mqkp7o0/pq3F6vjdPlW
         Jr+g3NWYKUb344oOAKJS9WW8srWAL1Vkicn4s4bq5Wfxv1RWqn8WxaAxAUdlWWyd9ThV
         E6zw==
X-Forwarded-Encrypted: i=1; AHgh+Roj62a8WU2ZTHOdeqZa+3o+z+GYLek6lzPofAB7HevrRae4y2lCTWZBB46adIurq4R4fekJhBBTxWnJOTU=@vger.kernel.org
X-Gm-Message-State: AFuF++k4HrlHujbczEfWgdLzhkb+qk5GIhUs8CSTdrl7IvBtWmeN2kBG
	E4IFpW0QLbIvTTNwCpijaDVqDDvpDtg3YW7/OQ0716vXtYhIjr4V/nuJI0fu3A==
X-Gm-Gg: AR+sD10NzhD8TtB5AZpbePqDTyVS2AlndSEIBziplwHuhq4zGIxffkQUaKBcp6J2xUc
	dtjKgR/Ed6JoNBwchaNmtQEcyejFoQOsL2Bkqp1ozQC6CQQUjiHzcunlsaQFpMAw1SmXTUidvFA
	k63lUbQca+hjUXH5yr1whdVOxf7Sf0sfRxRIBVBfZ9vDREG1lOpsE1raAqhMVCVeyiPxwkKFzh7
	v/NZy4mvT/tdG9ZahDwZN6xqs9FauxRntz3DeTA9UhDjMci22ExdM+h4jpHh0nYza9J0cWlSeVA
	GbMhRXwYtPkHupzdy3+faw9W9VXfRG3hsongmGRYMo6YV24iC+OoRMTTso+grser8Hvdb96nEnf
	2orxBuqrX48QFflicTk0e2OXoWuGMybYsJ/oya85T+eZ/x2LxE5q8EIiSsmwlaBqyi/eK7Yp8+0
	uE/Txtm1yem8k55bh4UN8HgSr9hEpE2HXt5OFhyxIbFoAOx46g+kR42v67X3KS6etZDw==
X-Received: by 2002:a05:6a21:4a97:b0:3d1:5c01:e6c0 with SMTP id adf61e73a8af0-3d15c01ef14mr4338564637.11.1787808618511;
        Wed, 26 Aug 2026 22:30:18 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm12138693c88.11.2026.08.26.22.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:30:17 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dwlsalmeida@gmail.com,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com
Subject: Re: [RFC PATCH] media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
Date: Thu, 27 Aug 2026 11:00:03 +0530
Message-ID: <20260827053004.14261-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082710-curse-hardwired-baaa@gregkh>
References: <2026082710-curse-hardwired-baaa@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 07:20:31 +0200, Greg KH wrote:

>On Thu, Aug 27, 2026 at 10:45:08AM +0530, Jeffin Philip wrote:
>> On Thu, 27 Aug 2026 06:51:21 +0200, Greg KH wrote:
>> 
>> >While "fun", this is not a normal path that users ever will hit.  See
>> >this thread where I propose tainting the kernel if you attempt to do
>> >this:
>> >	 https://lore.kernel.org/r/20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org
>> 
>> Thanks for the reference. The task hang is not possible
>> then. However, the UAF will be triggered anyway as we are just simulating
>> an unbind. Even if the driver's .release is called naturally, if we are
>> streaming data, it could cause the UAF, no?
>
>I'm not saying your patch is incorrect, just that using bind/unbind in a
>way to justify code changes isn't ok on it's own (we are seeing some
>crazy platform and pci driver patches being proposed because of this...)
>
>It's up to the maintainers here, just wanted to point out that this is
>NOT a normal codepath that users can ever exercise and think it's not
>going to possibly cause problem.

Understood. Thanks for the review.

Thanks,
Jeffin.
