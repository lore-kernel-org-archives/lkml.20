Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4D37187B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878525; cv=none; b=fd+W7ts2y2lLC94+vGAuznRR5YHdGSUX+u9DtDkkA+NQcxVMDmOIcY2vH014IBuA0Wypy7qqZ4NxbDaKkDE1hyQfPNqXgoaQlOdNsQ6lr2vFTwThJoXgqeUEdFuOpHfQCi5p+d/+z1hGS7kn5GX/Pz+KcPRFasMh3OTouAPnHbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878525; c=relaxed/simple;
	bh=t4orIt06GtaIMZNSl8mfu6p1hQPfMKIS8AfG8Kga2MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t88P4TKEa5fDaUBqtogYioUMu/vwsE116Ki5LetG5TCgotOLd97e8UoNaTXwXiUKmLvklgCBGOgE+qRtyAQ7HHuOwKbjL2ZBuRLi6OV2cw6OD1lsQn1vOp2uIPLaX4wOPxj07R4od2hxG4MXy2YHGKg0U52rzyfl9FfjEUHEyAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2WvKhNS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2WvKhNS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c34bff61551so282493066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791878523; x=1792483323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4orIt06GtaIMZNSl8mfu6p1hQPfMKIS8AfG8Kga2MA=;
        b=b2WvKhNSiyfZAWRHhPsqhrqcc+4ZpTc3PnUp4uDmcYxumD9J6MV1clae0IEiwZNYTx
         jSoxRMwMb/bDZsncs7C979c5Su7De1Ze2MYR6nwdUDrpomadZKTdzIYoqNbu2w/nfL6+
         1i5B48IGXEAQ+wfdbkKt6E9LappovcikfRyVIFA67KmGEejqYcwBZpIOIclzpFqtqGiC
         2Hd7g/71uKupiNcO9FA3LuzErnof7DIjYwzDAb/61y8/YV25W0GrQ2Ho8Nps8bwePaks
         UFGAZfWPv6bAueO2FrCvD6lqRG4WJIlbvPoAiE3XoTDIQM/FBUvCKICBk++HUmmVkzYT
         5cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878523; x=1792483323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4orIt06GtaIMZNSl8mfu6p1hQPfMKIS8AfG8Kga2MA=;
        b=GMJNXJfBfjKvVBuBhEO9BdXM4xCT/q2wepVELZkyfkWgp3P8JhTGAzJjnycXJohhD1
         F8g0BKt1aU7b1XAAN8AaH98VSkQbaUF7icZyFR05Pe0zVSziSIL82P/LP2V+exvXQHJl
         eyu2zpo3k4ezjD6l8ZC/La/33KvCtY8qdQOhXCeLitzGYAa6eQrkfimeqbHoYxop+krj
         /MzPHJyGrY/l1T109AYMLd26EndB4gEMFNY8i0BCPIZ0EiGAQ4WgcYJ4hKC2Dj8yJXNV
         ARkZ9r4SS9GlowvhWP9iaNZziMaCzBaUu3oFlwewzMJ3uvW0JJNdZ+v8Xf65uPbEQiTp
         0Aaw==
X-Forwarded-Encrypted: i=1; AKwUvBx79DjWhWgoCgTRYelXcShc1wxpBQrms8eyP44LwzqpbcCTaeTSueyQ86YDU6TNkzokNmAtCYR/zAoydkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/c5Nr9iesow/0a4gqzXR5knsMB5o/5j8ov5Cxzq03TxvvkChS
	okFpLVHiWGURp6ZSXpSucUNaJ3fWmhm24ZCHNKq95zBa9gtzg7cQ5S2w
X-Gm-Gg: AYBFou11zYoAKvvqdvcnSFtR7sc/4P3iE+UwRtptKKYTD1J3XpRFEKmwTaJZksVQh2r
	49IYKFiP+YBtJDEwMaG5sp3LkAJhoC9eWf4EoylYcknFWJdtY23fxwGPksPeSGOY6+pVqR+JStQ
	liRLUddWU3GFYWmJm7ulmVdWRyr55+zBrOAt7LZPN7lfh/V9k/uXnQ7Al9hsCwGOHlR5KvbYvRB
	bgq/nuXGQeZi10JqSMEFHXSVjbOs8vyse0LFDsKIdt32wQkzctP+VPT0F3bzsDrK3P9gJf8DWBO
	1s95FyWT9tQdcgczD8G8unYNdhC8yRdl59BZxJxp8OD5ljwXDs0uOX537Vq3QCNQCyBpyhkEjAX
	jzl6J9IPTXO3JZiQOFWG4nqeQj+3/V3mZhqbGXb21eLwLWykB/T6dUIhyXZp7EyDDEjVQHZ0kRU
	zWy5KbdZv1nOkgQN7nRl/VDGgVQl2IpRImgSOgCCLAEe+P6yhBWCgH/002bBaj+b9CxqAGDv4kx
	1Yt2tTPE6TMdCU7
X-Received: by 2002:a17:907:3eaa:b0:c2b:4142:2db1 with SMTP id a640c23a62f3a-c31aa0d82b6mr1250747766b.40.1791878521335;
        Tue, 13 Oct 2026 01:02:01 -0700 (PDT)
Received: from localhost.localdomain (luna.k.pl. [193.239.59.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3626dd09d2sm119890966b.18.2026.10.13.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:02:00 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: hare@suse.de
Cc: mpatocka@redhat.com,
	dm-devel@lists.linux.dev,
	dlemoal@kernel.org,
	agk@redhat.com,
	snitzer@kernel.org,
	bmarzins@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dm zoned: back off when reclaim finds no destination zone
Date: Tue, 13 Oct 2026 10:01:57 +0200
Message-ID: <20261013080158.558-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b2a6b9f6-53a8-4250-aae6-a0837f0f598d@suse.de>
References: <b2a6b9f6-53a8-4250-aae6-a0837f0f598d@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hannes Reinecke wrote:
> Reviewed-by: Hannes Reinecke <hare@kernel.org>

Thank you, Hannes.

Mikulas: this patch is unchanged in v3 (only the author name and address
changed), which patchwork shows as accepted:
https://lore.kernel.org/dm-devel/20261011175450.952-2-illofspeed@gmail.com/
In case it is not too late, Hannes's Reviewed-by applies to it as well.

Kyrylo Biryuk
