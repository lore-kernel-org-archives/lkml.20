Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A453AC0D0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762518; cv=none; b=A1f/IEejoJNgeXp3klzsrSct8XxCC2nxTAPD40la/I11V7KNPZ8wHTVeWU2B8rJhwYAFRnwT6MhchsksbkPArJSDpN73BE1T9bwlXsPqgC5P43UotcTGSMv36YrqMlOj+5ysiJ3UtjBrvq4Rx6RIkfXfa7WdHbU0E7UgRciE/fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762518; c=relaxed/simple;
	bh=wxSQkLXWCWxEaJjBH3HhApPLUhg00iXXhz/BrXspzl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=feL4dKVJvThmFpjN7coOknzE+4iPtbAuYss40Xcf2DHfobSEwUjUsXhWS9yeA0WwUEFqzEH2wgvcuJxAwShZoqxAau59UsBAgBcszzeqJP+lKBfXE7InUEoWrP5Bf+NTwe9iquddDVYTidZvImq0zRIIbZ3KM5QIbotk13qKuII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFAa3T0R; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFAa3T0R"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3463831a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762515; x=1789367315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sHzKvLnlyGdxYzhKnuxr5occ0k1Zs9EilK19Jh2gzJc=;
        b=lFAa3T0RNosWdYgoWiUqanm3eqKHXhSAXi3+/UmXFqPsANDhYaeMb8L5rK3zkGSV4z
         msvvuO+BGeHHFRp4BmMKNk/bWq+aGvk8Zwd2xPqDwcz2aXzD7aUBAAUU2Il/ochtMNlm
         GsK8MMA0KHHAngIwA4zESCT3ISQbVc+muWp/E5Qe7ksTGW4x6guCtisWEnNTl8vlkfcY
         Q9kTMrhmLp5cQzJE51IAvoe20As1DyOK4H+Uy9Go297/Aa1C+1xgrkBhWM9cz2KG4J+E
         +8Pg8WXNze5pIziHl05s1u1x0BSittGzUtpOGiwQqs/bH+BXU4bqkXWiJNWACpHXHBpn
         7lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762515; x=1789367315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHzKvLnlyGdxYzhKnuxr5occ0k1Zs9EilK19Jh2gzJc=;
        b=SQ2BxETIacJdn3QXCy79ti6gbCFXatnkZzEHVA5x55en3PpGoebj++bbtWZTnpU7W1
         FfiS2xEJt/c5+t7oEpaIAVUtUyXMwZUKOhYkwv+suyJQ//3lHBGhbdy5ckXHEVBH/ojd
         8EfPad5yDQbdwD0DwSQFsFZwzyudlp5BnRsD4zrEp8Xu5oKgcq3svOPgUeSZATxNE0nC
         ymh3RwbKlpaRSLxQV9w+Fqcvl0GFQdPqVg7MgG7GiWE5+klu3IMKfOw98k4zDlwf3wzW
         lOADspM+156+7R2T9RLwA3K/E1+bouwzqUJM+xfamimWAZmvyPO2c6/2665X0/qwdeex
         8+Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwPgxIsXRosFQBbkUhjufGMos7A97KwRLorIvm7KuI0zQjK4yoi6RR1woWAUTSfeUHIFLK0ceqJowWyI78=@vger.kernel.org
X-Gm-Message-State: AFuF++lMTgzkUfj5OhTEgfdTXMvOiCzxyUvf3DPtqlmNC0nS59JebQti
	hdDqK3hiG42Fg5D2R6f6Dka1wfs0QoXbLGV+QSqAZf35+hUAYf9v0jk4whc+CgDW7dm++g==
X-Gm-Gg: AYBFou3soq/5v/VOWulVbqng9NrrNzK3Ajjq7EaajyL9d57+sfctS88ZF6n6uOuitvR
	tXt2h+qwE4UgS/osiZamqp9DFSIUv3AZcUkPk75Oepum/Oc9YxYbHwsJ5+aeepl5GcghLDA1lv5
	+jBeJYfBwy3Z0NO3d5nUrwbdTJUweXNmSxaHluE3t0Zpt18rITXk9C2dBNcVTjXhXJW0vOrRrCK
	4jzpiYbLgW8yVtvn3vI8VLnXFkMsq4m7LcarfuBqhPXPKzEb28u8CU68knIjESXCn1N4k+Ih3SD
	YDhkeA4uOJ4HV+wPl+wgS2P/Kcirmi519CRDEhxWOHbkVW8ExXYQTQYybBt2PeqvFLkGIecBk1B
	YLrKvaQCYXjyQZrH1XvxmpuqUitSFtzKdc8TiViAyxws3AS1MpwgVoqgv0qd2kvnTCHdn61UMdr
	tKbbsVg5yUIFiC6uQHuxGiHYul0RuKfMLpYj7k89PMq+XwoM5t+wBPRBJidFP7DV45KRsvEOykh
	oNLSwuY5a0WFT69zWBWR4n+2UXkNOSda4zmj9M747nFKvcb5nnZZ5L7b4WckEEGe0fqqqj3kBHk
	yoSkb2s=
X-Received: by 2002:a17:90b:17cf:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39b26216cf7mr31265813a91.23.1788762514754;
        Sun, 06 Sep 2026 23:28:34 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm18978042a91.0.2026.09.06.23.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:28:34 -0700 (PDT)
From: Wei Jie Law <98lawweijie@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] media: uvcvideo: Fix two bugs on the control change event path
Date: Mon,  7 Sep 2026 14:28:16 +0800
Message-ID: <20260907062819.2519878-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two bugs on the UVC control change event path, both from e5225c820c05,
both in mainline and 6.12.y.

1/2 oopses on an event for an uninitialized XU control.  2/2 leaks heap
past the status buffer to userspace.  They are independent.

2/2 reports zero for a mapping that does not fit, as the compound case
already does.  Staging bValue into a zeroed buffer would give a truthful
value instead, if you prefer that.  6.12.y needs the same guard around
mapping->get().

Wei Jie Law (2):
  media: uvcvideo: Fix NULL deref on events for uninitialized controls
  media: uvcvideo: Fix out-of-bounds read in uvc_ctrl_status_event()

 drivers/media/usb/uvc/uvc_ctrl.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)


base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.43.0

