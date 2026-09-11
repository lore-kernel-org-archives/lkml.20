Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DD63C3F7D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120230; cv=none; b=ZUq23i/cCdIqkGATFvQ50RCu6I3l5qDmNT3GibyaDI9R3qbr9kQBwrjN8IYLxU/HATn9GnjXp7gqsoQv/3MpmC6CRHFgWAces5MVC0FWVWeCtZ4rbmjXriQ13FPoTOkQVuI8mejNtZYyIrVCg1/UTevWO5CTobzLvLEEKxfZNwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120230; c=relaxed/simple;
	bh=No71cd5buUUHeBE48TQG44YiouRm3taIpFkpoL0GdvU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H3avDI0/I3WqixJHUxN13mN1eXbyTnsb/wsg+0oPKkTmLmaVYs+Q4EhbVjsgkBRilGw3wKKlE0jyfG6jMmHTIddSC7k33+DlBb0jjfIIUsfc7uXiemKTwolfGHGOeMhDmeYsv/vlDBGmSCya8nrrP0JsXlmq0NxXy56XpSaU46k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=miewqeWi; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="miewqeWi"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so5474941fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789120225; x=1789725025; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hdzbs4lJ5S888JvEnLEEzWnpR79iP4hGYQ+NNaIqwIk=;
        b=miewqeWi19LXZgrZS54WPwI3F+kFKrDhmNZl/OVZnMLPmPvUbNXxJw3Kk4GW1bhSRG
         FT6VBU4+IHZ4eKF+heZqkJTqXtnzbpD95u0sfsVLrjtLInRzhOEZsGIODO0Ox0QaK7Ur
         oBEL90BLETJou+W8Fc+mGgXxWyYmqNsUnH1hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120225; x=1789725025;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hdzbs4lJ5S888JvEnLEEzWnpR79iP4hGYQ+NNaIqwIk=;
        b=VMI7J3MBd7H7YNzSec3wiloRjNDh7avcEJieEc/khcjKtUpOv/yKupiv3KfUG05l3M
         CYGWrdQMH0JVXOztb6oTg0VmyZfX+v7oj4ottA5oxD3z8fW0dQ9kMeQu4AWgazwVylI6
         Tn8KmnVxg0mj3EM+W+g1Hj8nWo58Ru49E8MNSxbrP/gmyDKtwq0F2j5YnS7RNEI2N6Sn
         vjWix23YbPhHGwY1AI9UIQlTcRrsdrUCNOwmHXMZLrWxMDBlcMNrWQXhgzIdAuFCo/p+
         3A/phNma71xSGD+ADcb2W61oAzYSn6X9oiAahjjiP6QbE9IlfCOseRZl3xwPCeG8q3IM
         JmOg==
X-Forwarded-Encrypted: i=1; AKwUvBw0inYMwF69c+vZ5xlcBdNleh4HKD7u8UH92a58WepwjS3TFDkxGgH/EvMxCNF0kh2tyo8wOu7FyWjXT4w=@vger.kernel.org
X-Gm-Message-State: AFuF++n4j97Hz7bJm3DkcOzMUYIPsAP1N8ratg3o6KVsO51duk16QDdj
	Sl2JJHyMahHQaGu9oxcdzYMWfjYeNkKqpnuFylcCENWfTcJBFD0RlMQMbHuPw5DdfQ==
X-Gm-Gg: AYBFou0ILiAV1UzLVl2wbU4gp1kxgiytdguzArLdNoQ6t1vccFRnEujxcvDY/DnT0dz
	TZAqOQ2p66SrpJJhJQmORq/F5/rlYm/+N81FDMGae2a1LC1noeJlA0eafdWr8FnkcLekSPhH+gb
	Wp4m9xOF5Tm7sYx/ZrX9WMU/4b69UOYE+Hmafdect6HxdVdlimo4cgZl7Yta8r7OyE3joKjPA1L
	gSXSxAOqwUvdHwEqxBUbDvWMTT0nOhu1UovLXGFxyPoqFFvT0n1wAErmG9LQsGUgGt976CopMS+
	FAkV5ImujbsD2R9Rc+9g+G3R7agnm7rYIxNL+YBfNzQvC7shgMF/y4AVkWU5AdoKktzm3T6/OAH
	ruKXWoXYG+vYUaCFe6TpeB6dFB3ZKxhYhC7ZSPWwrhUZZQbY/mhy+kk3MN3odEZ/lV9gXio1nx4
	4UBywHkGG0WvwsWjl3wTX/e5k8BephUoVItqq9lQCQOg88wZU2+qrR/yBPNecgRWHqTdVDiTt8M
	pqcDlIZgiT0hVgnjEC3+Li2V6WydjFx44uyb9g8ZAe9RGmyxg==
X-Received: by 2002:a2e:a551:0:b0:3a3:7741:b43c with SMTP id 38308e7fff4ca-3a5a5082d76mr3491941fa.7.1789120225152;
        Fri, 11 Sep 2026 02:50:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263ebsm5138231fa.17.2026.09.11.02.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:50:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: uvcvideo: Automatically handle invalid
 uvc_versions
Date: Fri, 11 Sep 2026 09:50:21 +0000
Message-Id: <20260911-uvc-version-v2-0-395f27b0444c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3Oo2oC/22MOw7DIBAFr2JtnY0wJt8q94hcWLCYLWyiJUaJL
 O4e7DrlPL2ZFRIJU4J7s4JQ5sRxrqAPDdgwzCMhu8qglT6rm7rgki1mku2HAzny1nRXYwmq8RL
 y/Nlrz75y4PSO8t3jud3W/53cYoudIXNynpRx9LBB4sTLdIwyQl9K+QHsbC9MqQAAAA==
X-Change-ID: 20260907-uvc-version-aedefc4384ce
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

This series changes the way we handle invalid uvc_versions. Instead of
just failing it will try to continue probing.

Now that we are at it, add a quirk to fix an Avermedia device affected
by this error.

Why keep using the quirk? Because I think it is more correct to handle
them that way and the quirk system can give us an idea of what vendors
are more respectful with the spec.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Add quirk for Avermedia
- Change the way the compliance error message is printed and cache
  ctrl_size
- Link to v1: https://lore.kernel.org/r/20260907-uvc-version-v1-1-34e45dfe04de@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Force UVC version for Avermedia GC515
      media: uvcvideo: Automatically handle cameras with invalid uvc_version

 drivers/media/usb/uvc/uvc_driver.c | 22 +++++++++++++++----
 drivers/media/usb/uvc/uvc_video.c  | 44 ++++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 49 insertions(+), 18 deletions(-)
---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260907-uvc-version-aedefc4384ce

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

