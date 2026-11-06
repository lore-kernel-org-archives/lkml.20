Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994252;
	b=e7CgGBI/oguQY+dJF6uH/bag2DrJjDluvdLfC4j4QYhZUOfmork2CnuPYOQB5v+v4VhC
	 Mlbc0UxeEefDTGn4fusEhZaZoCvm3hiQEb31KuexdTacnSK7paYF0R6YyyfWlf7+YELEv
	 eX1iZ0sYDrwgCpt4bfcTg7vFNeZHQfarqkbJ3AsIObl8XYMzBRgvQfgLhgDguOQeAMvRB
	 Tp5fj7scc7cMOaCGKkmU6SXOA18cMVmXX0vdR3jULYsPfj160yJH3bB1ukDoipPKNBLrO
	 CN4ciwvR6CnalLFJd4UKEjxieyu/cC/T/RNM2J/s3YlRX/HtkXHaZk+l+RMuhnIT3sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
	b=5mTzRpIWf1va4rcnDMoEVRTi+joqakQDMb209JgpGNiH6Sq5/83FsAYEQHqKUfCtqfjO
	 XBtjJA/PttPNHh6QZAv5qwKbKr79s5zMlT+U0fD67jOCvz4ap6ueyGoYVhVCkWMcumafO
	 T1dJAvweoZBnmPEpO7zer1LX5E3+3lYlHd9G3Qk+E0UoaCvfjczE2OccjJHWEyQ4GvbGg
	 LYniQ44ToR3qUW0Az/ZGkNDF1fmu5sLvzCir0UrN8WYL5Na2V4nQOMCiAs9eIhiXONWZ4
	 OwcSpoUYTdwY3XEHAl/QwbDv1ZVRBo9gnpswzEq27frpcA9kwpXKp+ptQVo87SAtUpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuBIsyUE;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C66606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C66606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuBIsyUE
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so607891f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994250; x=1794599050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
        b=SuBIsyUEJB2eLevaEPpigwz3HGG1GGAW+q+6ItQQaGvsu81Nu4zyJ4GANAI2lfw/z/
         sxAQ5461HvLZBkqWoqXBBJzSRPGkqwF84b4vOfs6CaINNDc+NEpgY7Iuprh4+essIRBZ
         nNG0dprqrRH4qhYz2wzF3gY4sdX2fTmHu4M+TKgZBOci1oYk2amaxLNreBi/rQygtk+h
         elop4XTHfWm8BJu5a/R7aNVmvLPLh9CFR4jMtDKS0PtM0Xa6jf21AOIN/0Uy/M589a5q
         hZDI3WlM+YmfYb4uOyGxsULBdL8G1qh8sLBXtH2738iyJF0fUUFGJ7knuVu4kfJSTomL
         rzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994250; x=1794599050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yH+uT6HKFwSfsz9asBe1dm2/HfQO5A2IC9muIRzxhY8=;
        b=IF1fIRe48j9jWDBw5cf05lpBUh9jfblH0XE9ogWrUrpNDoiwLeJ6k7Hiuo+YFD4BBS
         G9nhpxU0XZ4OxbwbA8kXMwLaGlYBclnZ9xOpMLdVcNXdmBvUf8yY34usEqDa33r6uf8P
         61V8N28A1idTcp1PDkYphXxlaMpUQnSSRbnlJiqngSFjDtgPJ0kOecB5tk8ZhvQ1UcWs
         7n/tuTS29BzYXV/nZ6LjlTgPXxN23y9DUam/eeposqd1s2+pEWRhrO1Qbl88UTK4Gvar
         HG8UgZesKC0vjnkVktsd9LcbsamuEKRoVYSHyrh1xwnvJJ+S57AA1tYNNo1BH7BzrIjB
         0DbA==
X-Forwarded-Encrypted: i=1; AKwUvBwuwtYzqnfJD8fAfza8hHq57vZHuTqTjgawuKYmIveqLMOjVWbkmMlnmLECZnpatSu/TD7UieEJ6YTebuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uApsYbTHNdvToYozWOpKaGbLHpRkv2h5kNdNkA4wSSoXvsYKM
	BHFgBPHc2ebPQ25HjGsXMjOi58M05KoSmVzpfVSf/iRT9tk06ncLi77m
X-Gm-Gg: AYBFou27AsU5g0+3OVG4l2fydqdlyV4TcrFous64xfFXvMZwY6TnYGeELXQTpKj7ZEY
	WDf4JcLk6CfI8C/MhHCNRNAxAjcQ2luHRqGkGVY9yZ82upFcIDh6I+SXp563JeHbvxlKza6fG8k
	sOWy6P4g9fn76We0NtM4S0fqrtM+jsHqoEhMzK/Vf5Ydhr+x58BePpCzwl7XfGNtjYzskmVzrw8
	zg2qj/7lsiykxlFsFtr3pccuMqR3iA4/4/HAO6q3v6mcBYcvJ6MnEj2IpAiMR1nhLPnf+DWCwtv
	2sEfVN4Rd+Ca80vqdQktuRLofOKQ55ZwW6mG+A7FH62+AUdUmz/0++rUvgnJ2iYLx9tcBb360e/
	150TLP7rtztH3Y47t+8KT52JLfFIOB22Xwy3OD0x5KFk3bC7ZciwbRC650x3mIifaEe5pMjaOjb
	7pBrBgYEAuK0zIOaA5LRlaWCHoOQXpCjenkai9GuOKzzOnyxUvCia428XchYYdDHxdWZlYharUp
	xKm2mLscPxTtUR5gBpC7jDyGCalqfj4E/DiYmZSVGdsXvAPQDcm2NWh+ouu+6+YqJwNnnOpIq61
	DATpnMEUoJy6EsWXyPgJuWPCm7Jr7VqnM7Y5GPq3SN1Rkfuu7G8E/A==
X-Received: by 2002:a05:600c:46c8:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4b6dea69526mr63988215e9.7.1793994250067;
        Fri, 06 Nov 2026 11:44:10 -0800 (PST)
Received: from localhost.localdomain ([87.13.215.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc628dsm5512894f8f.48.2026.11.06.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:44:09 -0800 (PST)
From: Francesco Giandinoto <testata.nucleare13@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Francesco Giandinoto <testata.nucleare13@gmail.com>
Subject: [PATCH] staging: media: ipu3: Fix alignment issues and remove an unnecessary blank line in ipu3-v4l2.c
Date: Fri,  6 Nov 2026 20:42:26 +0100
Message-ID: <20261106194226.8233-1-testata.nucleare13@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment issues and remove an unnecessary blank line before a closing
brace in ipu3-v4l2.c, as reported by checkpatch.pl.
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 61fdefe78..e9b2ce2b4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -248,7 +248,7 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
-		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
+		"set subdev %u sel which %u target 0x%4x rect [%ux%u]",
 		 imgu_sd->pipe, sel->which, sel->target,
 		 sel->r.width, sel->r.height);
 
@@ -291,7 +291,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -306,7 +306,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
+		str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }
@@ -753,7 +753,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
-- 
2.56.0

