Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F70330662
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925830; cv=none; b=gCLDoj+Y0VXrnYaaVSKOAgJmyKGKc8t4BhgB2mY8xjxstEviuYgGYQmENURzfd5wFoF1iuUKG4YcgJ4Jz1StR8zEMxcCL0cGSC23+l1dEERoh3LAI1lPoDuj6AamRKjVhqIh+mtvomO1Kln/NJjoWA3wUD61uB0Kw4wwFIPQ2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925830; c=relaxed/simple;
	bh=sWCjOchFpM6d/asknsANdAqdWuKgQsqJQeGpORMMkcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcOyHWKXjcLG1RS0hoxX6bRxcQFukXv/vhWqZ51oxyhCYkCYv8MihvqUbmDRGZ8KBwL9jkpQqjJQHNZC7HcpW23DQRj55PlXDdWrf61zyWDrX5HXQaIvw0BHkbgW/F7kZmRAqdBsO0g8kJOX0QB95HnPrt2TPiAqkuHDuADsbKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWHBtlfJ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWHBtlfJ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1667501a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787925828; x=1788530628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jpc4UopHI5TTc/u5p11DlrHMFjXp00rJXPcYkmn7WPI=;
        b=KWHBtlfJueaURhXQHbFAW5zaLdXOQzdkzuwNi4NNByYK9RIlTmO2YY1b7n0Ir9nFWo
         GGa25ngBNDT+gSZ6x6rqm0NcLU3O2mTw2CYhb+I/4T/ZrH99Wgz8CF/I2gVTQsZTp83+
         Im3RlK/tqCK0rzFSZrvgEciapv5nuDAdtjLjl8Sv4yRTWO7VbTRNreg87ZAJ2uVE70st
         ijOpJRaSZZVOUJe+Lwzv+xtXXijYc8wYN8cGNfa+81V/ExAwKBgQbY+li3PpmlNa2rYq
         8aU59R3y4TWAb9jbdoE08H0xMeakMhO8ldLMCB3roLMa6kkoPFeFnd20slaNZ8OaCn3K
         ZXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925828; x=1788530628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jpc4UopHI5TTc/u5p11DlrHMFjXp00rJXPcYkmn7WPI=;
        b=dQZqaxXgPtYP6ANU/uh3tLLOIXBDGcFsfGroeAEPRM6XkW1/oq/BOJbh0tULitzukQ
         lsGUa8D41kKeeR8UX7oBY2wb6TralfXPOvDmI4aq2hUNy3pUveV34H1eem+HD5d5FGvR
         WuvlUDDas0dqzgj3YeC+Ke8oz9W754dSBRGKOo+bJDMVUxO6/rOATbTzcD/UvT6NGeLI
         v7JVUIIqR9GCHT/xp9LIzs9pvZaOwlOsyxxRTOWDBhKAjMTFmY3XhbrVk6xue10so5fI
         bbOlhYMk7XO2VQMy8/8RLUKulSpxsuSVJfMkrP7F7wvviV6NTz4bDaW+73KfpJV44eZe
         ZfSg==
X-Forwarded-Encrypted: i=1; AHgh+RqeQHUA13ElmxLjn7r3GmRKg05eCgq24kwiI4iNZWrSEDC4SNOKWWoEWcv0hy9jlm+6DzwS/4i74XHePPs=@vger.kernel.org
X-Gm-Message-State: AFuF++lp+c9QoD1JgZbg4pvtAR3U9FmJGA9teqPwtTwVMUFLTpfhtKB9
	w61whNzGbUyujlO2yDWEg4o2TUbvUirTrHeefwYgEAaABuF5kNpy8px5
X-Gm-Gg: AR+sD13WgU9yICn1zdhzeUfsG50o1T1m8hPXZT2GGiIIUOmMjx44425VdD3M3RPdLqU
	NKYMT9vM7e5icxqfv2jq0/rrNcjSGwqmqbqI0klho57hhiSns9DSAg5XbymEkW+d1FJ3a93mQtk
	WgeD2I5VEoyielTFGZqfWompZbha7+IcQwxhRcdYTxuIXKM4ty2ThUi8Zu2wQw+hMFQkasjEFYD
	aecKtZGuC5kf3dFrH6ofLoYOWImECzxCdvDQkzrau6oIeQSp6gbt9hIrPGha8QsmJITWFAeIy/3
	ysXZTueN4r2G+/u8qCqy8odD4bK4yJvcPwu7gr1f+HPThnb7GiiErLNIvDD6fwQoUvNDscjQtzt
	a+s4TvzHQUqV6xKnjqfQzUjtb9TMpFF6rkX130RsHNSksIJB6LyCwJKnlpPcCaWua5dDd7BThnA
	BJc1ysf9tSB237XJ17cVh08fUNb6B4lz87ERkUiVTUE/VtSfQpwM/rPeMioJphKhkW
X-Received: by 2002:a17:90b:6cd:b0:398:9bd4:d14 with SMTP id 98e67ed59e1d1-3989bd40db9mr149856a91.19.1787925828032;
        Fri, 28 Aug 2026 07:03:48 -0700 (PDT)
Received: from Default ([2409:40f4:101e:9d7e:7e26:7b81:64f6:f32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm7107186eec.9.2026.08.28.07.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:03:47 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [syzbot] [input?] KASAN: slab-use-after-free Read in atkbd_set_repeat_rate
Date: Fri, 28 Aug 2026 19:33:30 +0530
Message-ID: <20260828140330.134760-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a90d9ef.4d659fcc.734b4.0019.GAE@google.com>
References: <6a90d9ef.4d659fcc.734b4.0019.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 5736f4bc5a50..bfad2e2ac937 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -961,7 +961,9 @@ static void atkbd_disconnect(struct serio *serio)
 {
 	struct atkbd *atkbd = atkbd_from_serio(serio);
 
+	scoped_guard(mutex_intr, &atkbd->mutex) {
 	atkbd_disable(atkbd);
+	}
 
 	input_unregister_device(atkbd->dev);
 
