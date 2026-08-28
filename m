Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF25391E51
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787886961; cv=pass; b=iFd32m6JCbMqaxvqua+WfoPQ+c4aEcvvqJgwlBYeDJ5F0+P9uWZZlKpnCiGoLdjBVoKdwa+WTvYMM9O5p/dqER2l+sBc4J1Uis3+v4DYvPFBzftHMXAf34wd/6sEQv/SIvc0XORh1v9Xl87JZjaqpJIIjENNHQb/L8lEDYJM7SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787886961; c=relaxed/simple;
	bh=1miJQ3XU67QGxzaMp89AvZFl+Okgcn5d5LRthW/MVn0=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=NoMsGxklkb1bETbT76CRCs35jiHJMT037gtrwoquqo4QZoeNClI0Mi51UHFJ4nGK13PjrDvm9UAAO58MpjGUP3O4Qgr8VRLIzHmT73Zlt2uA8ZYvV/2a/3LT9X0YaSWe5dAydD0PqZdOyguiRxluGff6IvN0/Ozdv0qZxs7nDyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=neBLinKC; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="neBLinKC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d6f624c323so4157345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787886946; cv=none;
        d=google.com; s=arc-20260327;
        b=Q9ccVd+IQkXbKz/03OagKNqj/v2m04XWkAJIhRBjCq5gAsMTGWRBoo+s+1zkd2ZEXx
         WlTaI8GcBHy1OFU6/3b+os6GlhA4JWoxoByoKdMNd7LpC7T9WpakjsazdePYdl7NHqQj
         VPS8irIGLjv08NpQLNsqqN1XKGC6yozp0BnN6zqQfFG5Uk91iduiN+Fm4/9fAzei8kJX
         fi+mmq+Vv9oUes4hex5fiDNNZlkVxj3l/Dohpg53Zz2EKLDd4JNxHo4NuMZVSSmegepw
         TFmROtqTuQT+7+XxmuIX30iQt0dBrDwaYW5JcUWTHgIo9DgwCYq9ND8w3KWOfAbID+Hm
         n9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=GVDaim1d9W/nazmbFLIR9MFq39kGfUIj6rnd22ExSQs=;
        fh=dQ6IhAMDGBygQVWMDuF1Jg3u6KAc1ESCjUhlelKPt+8=;
        b=GxhduFNiHWyozE+QJ3i1iidWkmVmhC+BBEv6dDlwRBmYbR3uxJ1dAIfmJclWlND7IN
         xr7APO749a1erg5awla0UhNYo5548H8LgL/vcg7wKyfy+S0/0oBIAVDjy3xKbUT2zqTy
         cy+RDZfQeKBgkwqEJjbTEX6fmvNQSdFGZL5Abgk2DK3YqrzOzY5nCzENDDbdt1muf6cB
         u0l0UneDHV8gk9X4WYXur/6iCiGXARBsjbdKfJVhzSW4Lb0yTAHudV1pwaxQ6yF7bI0p
         uaKHGWucXhYFficucSdTwHoJJq4TeCBgwf62HCnNaGKlZkc6km0mMc/PG6g3fWbs8QVE
         D/ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787886946; x=1788491746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVDaim1d9W/nazmbFLIR9MFq39kGfUIj6rnd22ExSQs=;
        b=neBLinKCAT+MANInucguTZWim03AHHpj+bO5hrp1IvLBqrDqUNUFIi3HnOaTacaN0A
         BSzXklUQ4ZkMuoCQMMC1lMD6Z9kUCHgKc42RAoR5TFpM1yoO7fcRWDUrNPjBVTM6DZgS
         f9pR736ovN7AgX4QHJLr/jIy/9n3RuQMjXyoBiC0FAfBQ4XDeHTPVwFpKTfJZm9Uhmyl
         oSZSmRPMDpfNEx+H81fNBdQJlHL6B6x4qrzwEziyIcS3ATYAE0coIpFpwVV1vQaCoQGy
         VWPdTrA5jhiBIyYE7+jTp+yJZKCVNcByX+LTUgxVRmyjjNtdtjNwNNEi9gNioNv1otMp
         5d6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787886946; x=1788491746;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVDaim1d9W/nazmbFLIR9MFq39kGfUIj6rnd22ExSQs=;
        b=Xu4cQRVjzULMVAS9Egc8d38DesXps44orYacQetnh9WfGzgE2gyNkFYrGxL9B50Qz3
         Tkugta3od0Fq8UHyRs94248IDl1dH3cTgD+8cC4EgwWxt6GcV4aK7WgY2OJLvxhCONKJ
         HuYqjpaFr7Qw/sHnUwOPdYE3wYMbf4f4k0unwkEOtrczugfCCquRaLQngMBY2WAxVBoM
         O7mIXMNiEHSpNPVsF+S5+7PSKu7U+Lzcy8krpUE2F9LsBJd+RiwV9j/KvdkbHnM7WzIP
         3zJVUMae5dswPKrDRlTpPOGs5yXzvmNLieL1qZqyId0JnabzLLwQxx7N/GQBCNCSZ4u5
         /f0A==
X-Forwarded-Encrypted: i=1; AHgh+Roh9R8RNzMqSWJJVTc0QQoIORfjPZ7Qo31jhEcoyPfuWEAbcYEDqrj4Q4X9Az1/3ULMAjjlFbyxOiJBkF8=@vger.kernel.org
X-Gm-Message-State: AFuF++miid8rA2Yw99Uxh5NXv4eARhiVrMTZqOWOgCXfAy+1OkqCYi8r
	8/prZVP4uw0k2fXYPvIF6hV02/Kbu60VbhWwv6fSdZ+NpPuEhRho4qdZUirRMW73/kUNoUoT2SZ
	sCXYT4HXW/BXYNaKsnRe8ojNG8oeUZq+CtTqkk/mMQR2XEJUQQuv7TQ==
X-Gm-Gg: AR+sD1015QNfLSjCBScFexV1SRU0zvYmDX1kzHxaupVJS2U9bHgZ+I7z70S1GTKDhBx
	4v64Y56oAqnBBokP/vh1QzhucLr49wUzRzVPTcdAXjyz4wTZIrSBq+fn7tDy6LE2K7Aq5DiLiSR
	CADxm+hiRFLF+hfMS8Vc+v66ZV7v19T7v6wjPThmOLBMOeS+OeChj3jMMwwYh6+ZmpkMVajxqrH
	UhRP1Rh6SF64ZAD2/R6ywGPemCnLH2RPSSriRoRRiOucH7QDzeY+YUiQuQpF0Lh9ScnHUzCOR9Y
	qz2qwT63KTqzfdoMRFfFFqzuAWTS8Rox8r9HGiMxuM1uJVXXQD8QpJfhleePWRrOebFEqu5nnWX
	WJAbdgdlgn1fEv0yJeWa7zTp4QQe1HJju
X-Received: by 2002:a17:903:8cc:b0:2d1:1a18:4d0a with SMTP id
 d9443c01a7336-2d74ddc4043mr72395145ad.9.1787886945097; Thu, 27 Aug 2026
 20:15:45 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 03:15:44 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 28 Aug 2026 03:15:44 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 03:15:44 +0000
X-Gm-Features: AcwNN1XK4N9AZ5nSdtzZJJ7gOvoMbccpDuyxz4tcgDKwL6eXRIcA7BljFOFKVRY
Message-ID: <CA+0ovCjbbonrZ-eWsjT6r7VhBaO7t8M_HCYwWzU5XJDettsd8w@mail.gmail.com>
Subject: [BUG] can: kvaser_usb: WARN_ON(!dev->cfg) in kvaser_usb_probe() from
 an unhandled clock-frequency encoding
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: falemi@asu.edu, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/123-can-kvaser-warn-null-dev-cfg-kvaser_usb_probe/

  WARNING: drivers/net/can/usb/kvaser_usb/kvaser_usb_core.c:989
           at kvaser_usb_probe+0x14a9/0x15e0

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
