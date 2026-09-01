Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA873B1017
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226177; cv=none; b=KWPnzMpRMHQvgPAK0ohGiOdQjvA5a52VBFWmP/RfAH8VG2ra46MCgWpeSrJK70zkMr01e2n6apFnTnlj2R/8/xJqDLQuCGYbQ3CCZFZb8phBa/FetROEWYANR8/oC1HOcj016U1ewIEmFMGl3LoRpcM51PWm+vboecmTLn6aceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226177; c=relaxed/simple;
	bh=q9xLMONCbLWdhJ4OaevWw3M/plpvpB4yfOar6DAZZUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oNfQ4TDzFbtbjGmGiVCMWhnTYA2Ni22GPka5mnETva1IiXay3y9OfLrPG3/TvADMIYGdGuuUE6htrdsqFcUaT/hHrkDGlC5g54sgdlQl4DPQ5eHGXp0ZVsuUi3SJkuFvEXhM52Hz+hY2PtyxX8ynh+JwTbeuYwFfY2KSHma+rtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=WbkwoeER; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="WbkwoeER"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so37433365ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226172; x=1788830972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEreQw5XOjDLuZe5quRylIWJUa6BEc0yCs3u3pGy0TQ=;
        b=WbkwoeER0oEcVW9iovAvC5oyWIhUPROM7LtnXhnUscZga9vVePsVwPF3HQL5aN/sws
         3xcBTuZ2WdfrU2ZPDxff/6HDhP7ii0OiODfnLlyp/abO/D5ZjPR70aYk6EDVmI2x9N2d
         kJqnfM/uJ+SaJKgzGvWwfKJTpeB6gmvpIZxW8YLyML0NTeOs8qY88sYFzqN0fvb2mMD4
         PU38+K/0ZomACDVDTDksAtKfQx8kVf/t0hMVQV0g7UbTsr5PgmpeBZxzjJ85s4mlbHSS
         1Y0U1itxtf71D5hcCj3Hbr6KRmkJukZ+pta2M9ZGPMb0OmbQ5q5v4kg6frQIZ7ldPzld
         Kbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226172; x=1788830972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEreQw5XOjDLuZe5quRylIWJUa6BEc0yCs3u3pGy0TQ=;
        b=Tfujsq5tW2Y78H0zyVbji7qOI5axz4lnbIjehJf7qE1ghAxRJra8NznS771O+dLZPH
         HYAzkoplYi7U3fDRteVN5hvRSJOqEe5d0Jnk5ZVQVrRjChjNoC9EZ1qC4ab/uHhiBEqB
         nooHFTW6GHpoPxgWavYZVab4V40ti3MJhRstnkaNlr969EuYYTM5ed4KuZe0KoRlmGYq
         tBM9xLZ1pyWpJUQihtIwrnJuDN0yWrIKm9rVDz3hbU+KZvUKHt+zPpyZcTEUx8wHes5r
         OQPXgrfTXsaSS+Y3kCK6XPTWE3XljyUXzmKFzkeZ/CQnZqzq612txI8GJWacueVFeN19
         HA8A==
X-Forwarded-Encrypted: i=1; AKwUvBxeD9mDpKefSSb3wFORpd0593YA5Zt0JwKlrGfGRZoDzPUcyUyDIh8NZQeiAKnCER7n8iomajgtkTsh4LQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n3XfdaB7W/KDbEYlOP07OsKrOhZUJp6dqXvgFYE2JsSSOvgf2Y
	rUkEvkzFXzsdvAnmC9CEPfMOZ9i00TfSaE/325VANk1sjU1S2MFrmzxfBCP9aQXkf2k=
X-Gm-Gg: AYBFou36seC8qXrQTgE0DiVAwa4fupDGE2aWY7f7sgGb62ECpD9Coe7kIOWc/pH9/Ps
	LZunAQ/S3pjCVq200LbNJiKliZPW6tLrGLekWZ6EeQqpMZcGHdpGLuQ9FHecIEZ4cfh0TlK7cU6
	K8mjZb/nW3RKxTkedGAxu+FIgIC+4lA1POdg2lQHd8jMaQU/mpE5C1TKfw8yvZCkqdVweOqpZha
	+y91XK6U9y/4i5+i+Th8n3gp7Xvb6ugSkx73ILutjRPgj3Uu+zw1H7KCHxTPPmB4NS/25MPwtl5
	xLDcbNnY9l9ioQfgjs54+IByD/Fn1M3ogFuzh3+JO8sxcFEcNd1U6DlUdcCN7DDtIwGmUPin7jf
	SVmpmzd9+UNhqzi+0cMD4GqT9zezzYYbUbyv+ciLftjBIiudT8QweXoQ2rm/1eWgf7EmNwGhoRK
	upfL/+f71tTh7nRi2+40Sc1j1+c5jpwnLBJP+se3Q9I/LXwTkk7oI1BIvWyFD1/pU=
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr506351595ad.4.1788226171712;
        Mon, 31 Aug 2026 18:29:31 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:31 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:24 -0700
Subject: [PATCH v7 06/10] of/overlay: don't leak fragment references when
 changeset init fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-6-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Sashiko AI <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=1515;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=q9xLMONCbLWdhJ4OaevWw3M/plpvpB4yfOar6DAZZUo=;
 b=L2cOOfGiICvIF9zYrz3xoO8sZHlPz+DiVgGkYsFu0M/jgz5h/QAjfRyiV+hpjZXW7EKU2BSGI
 MLXOyFCtdATDJuLScYyhkVzJIZjhVXUsU1NdPYcSQ3HUpDpnEUuHXs9
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

init_overlay_changeset() stores the number of initialized fragments
in ovcs->count only on full success. When find_target() or the
__symbols__ lookup fails partway through, the target and overlay
references taken for the fragments initialized so far are never
dropped: free_overlay_changeset() bounds its cleanup loop by
ovcs->count, which is still 0.

Store the running count on the error path so free_overlay_changeset()
puts whatever was set up. The store is guarded by ovcs->fragments
because on the allocation-failure path cnt still holds the counting
pass total while there is no fragments array; everywhere else cnt
only counts fully-initialized fragments.

Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/20260805204009.CF3891F000E9@smtp.kernel.org
Fixes: 61b4de4e0b38 ("of: overlay: minor restructuring")
Assisted-by: Claude:claude-opus-4-8 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 9b9f198a1d70..51241f16e87b 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -850,6 +850,10 @@ static int init_overlay_changeset(struct overlay_changeset *ovcs,
 err_out:
 	pr_err("%s() failed, ret = %d\n", __func__, ret);
 
+	/* let free_overlay_changeset() put the fragments set up so far */
+	if (ovcs->fragments)
+		ovcs->count = cnt;
+
 	return ret;
 }
 

-- 
2.54.0

