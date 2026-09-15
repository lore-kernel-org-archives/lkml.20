Received: from mail-vs2-f21.google.com (mail-vs2-f21.google.com [74.125.227.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED084388E7E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481767; cv=none; b=WUfMJSyPUp4lH2uuR5Ab5L9GacMSg9Z42pnJnJQio9Zrr9CnxFTlkJPZV6R1qIf3S0bCKbSyKbb18y9TXIknsGqwqblyazvkFc0DgAOvsB4V9vbuAM1aoqkhD/akAQXWaUh+TMXzNnEEX3bPBht31jFIONAFbkSz0S7Uoeyiy2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481767; c=relaxed/simple;
	bh=fZFg/j3pb6twOqqBfqfH5ANDxZSW/qTsavhnzB5RzzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRUc0Zz0jhOGUFblX3hoc43fTR/TF7LZjZ/B2A2ZkjrUfZiAZa51Gc+xft1YamNbA9RVJEPl/vl9lkZHe7S1wi5qYBvx08qzUam+XTznWGPI/tJTLQ1PnNjXSmXVrRU0JaMHO1fiJkYdSl8TAq6Pyd9YhUhDoE7tdJnUSdO7onA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U24A1ncC; arc=none smtp.client-ip=74.125.227.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U24A1ncC"
Received: by mail-vs2-f21.google.com with SMTP id 71dfb90a1353d-5c83397eeeeso2085607e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481765; x=1790086565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fJS//1ZgrWfO+Hpg+mD2bvTEqYipgvOVKK1VwTdF1g=;
        b=U24A1ncCjpfO8XOmtRMh28g2L+lTBAGTlv+QcNj9KFJk68ZIU0Y/Fq0ndUKjPkqNnm
         1UL0n7benzscYi2KCnQUNbKOptZVb8LXamMrh7fRL1XSUj2ACM0XOaMSe9BXhcx/G3ZE
         EaXjDGm0Z1wn1xQXtRdFBfy7xVcL8VzqCeS88vKhwoEhIHy2mL1Btxn0GttZrpsWZopF
         pj17+4hzLKQWnktNdO7gKm3USS/+ALSjOKOjGFqKZ84XKJQfJfXSKvQAQlWAReZ/XZ0w
         GhFx7GYSA+quru3czgBrLrxMsPEeeMHiWFTncYDa8m3j25X0sogZ1PPrjEc5M9Gh+0dB
         2AnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481765; x=1790086565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fJS//1ZgrWfO+Hpg+mD2bvTEqYipgvOVKK1VwTdF1g=;
        b=1TgHeQsw1fgDNzsuzFQa+78dE6IXRiw8CILrdYYwEHZhEWAh/FQeHLf1AUY6PLDoab
         Q8kuRv3GTu5oRinVqvOjxHBcCWy/v33EYWurGWpQ3qkcvqPd2Mf0ZS4oNG7e065hLTx+
         03Kb0SosU6ALALbTMC78qetQ4svcy7xOKOWFuqFrqtkgMvZU4U/ntdd9kbR7BMsHBwdo
         ZphbFpxhxUCz1+dY2H+eO1KC6Pzq05n4TnKl3xP/u6BhPT+t2d/Bf073znQYlj2wZ6BR
         mmHw93kEgjrtWQOhGPkkpTUTJAgP6vnjLGLWagYfUJmhRR+L4R4jyrDjpG5Je3yHneWj
         p9ng==
X-Forwarded-Encrypted: i=1; AKwUvBwHQG12F4TAQsmf2XnrBg/Jef7F7sOtIYEmYNYD9upxskRSe0Lw1S/Rwda9qVrih7rsUAFz0zsUXOo/Sn4=@vger.kernel.org
X-Gm-Message-State: AFuF++mG6XvWt6vDBGivUul8zSlWGiTv/hV5GiEcvQ44s0aKPlRp7hTo
	2fZ/jyjZFuGIhf4/on/TOlx19GaaoclMlZROnNCqgjUgzwrDdZfpmBRs
X-Gm-Gg: AYBFou0M2ZQRzYJe2KDzILaSWTEkpwT2ObDDQIjhL5CMJciSmte2rd6wNwEGl1Pf4lM
	RLb9NEI60bbHPTN1n/nrUrhBKCGLyS/3A8zNXEYnRzaOTffR98XaDDTAJ8RrwHgE/X7rxvxcKKp
	0pST7RaKNqKqYLm448+uONGQO1Hh8LiRHi0sRqW0KOCoEJqNTINB88kSMv0LMEQGt1AKiqN74go
	grTXCAXdm+HSHRxWS/NrKvIEqYX2AM9CHk0euK0Ig2VaMmpBTXkIyX19qvrt8qiYOqETER/BtqC
	6rQXdeSZg9tbhPcO5lNF5QPgwkHqN0/N8/0BMI2dc5S9Q3pqoVJdfA0IWY5hr17GOjv8gJcVBdE
	Ibj4zifL9xEWThZ/9oY0mz3qioDYkvt3fbOemtL+HB1E6xPeeB3IRh3lpiyJdmJ4/NltcUccjFs
	ZraiVlZbh9TqP1WocRWEORL38zvZPsvRDi7vvMzeR3m9s0Cd8bMcfMu3raJ/bLK1yN
X-Received: by 2002:a05:6122:2056:b0:5c9:82a1:a6a3 with SMTP id 71dfb90a1353d-5c982a1ad55mr8136390e0c.6.1789481764710;
        Tue, 15 Sep 2026 07:16:04 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c84716a167sm16029131e0c.18.2026.09.15.07.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:16:04 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v2] vsock: ignore empty child namespace mode writes
Date: Tue, 15 Sep 2026 11:15:47 -0300
Message-ID: <20260915141547.3010692-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915111417.2726515-1-qwe.aldo@gmail.com>
References: <20260915111417.2726515-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vsock_net_mode_string() returns success without updating new_mode when
the transfer length is zero. Its caller then reads the uninitialized enum
and may permanently store a stack-derived value in the write-once child
mode.

Return before inspecting or storing new_mode when no bytes were
transferred. This also prevents an empty write from locking the current
mode.

Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 net/vmw_vsock/af_vsock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 622dbd0467..816d25b314 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2883,6 +2883,8 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
 				      vsock_net_child_mode(net), &new_mode);
 	if (ret)
 		return ret;
+	if (!*lenp)
+		return 0;
 
 	if (write) {
 		/* Prevent a "local" namespace from escalating to "global",
-- 
2.43.0

