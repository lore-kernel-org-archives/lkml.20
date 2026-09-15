Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37A477E4D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461874; cv=none; b=YEmDevoTe5X7i3ucLn09mzgWoVJYQ7okhrNb4in54zwnP3hrYdN0TiXgHPvTn/FU03bNHkhRuO1e8hX8i06/tZmXSbNYnAYTxcTNYsw8eLtuhwNIGCOEC8wvMpXoFTnrOp4U40BpTGGL2cOryiZMS4HqZhI6ivN9k/u3BSadfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461874; c=relaxed/simple;
	bh=jVIA5xzNgCy6FOfiVslV3k0F/zpB6if4V9F/fgFGUKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvosWDZC2qdgJnjiLYVfm7OTXJ8ouzsp0938qxTSYDhg8y3fZHLyzK0RPjGEMUrlb5QWiEAmHy1lYsNdKM8H4EVd78Bxpz4H0W1JZIwmYYOlRah5TeTbZOsVHhF5398/nflMLq5i/k/bLnT3JWcJjchjndrzFSquApHVTVMzXj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lld4rCHA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lld4rCHA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca069c8so25599625ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461872; x=1790066672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQVMbHw2hMLu9BwDPceEe/gIwaaH0G/zHij8Nbr6Ruc=;
        b=Lld4rCHAs2BceWVkB/rCv3eA6v5px8jCESWBKZE/BUhrHYYAxPgGza8irBRztzfFv0
         TP91BOd20neDu7hJVLJajRnXBjgGMKxPRLSoF7GLTwEjB8QtSIlL8BoBsWrauRh2tTDZ
         3vujeI+AxHDbu0ar6ABu3D2KNmG5QKCmCJ99K3YpBlU3BLDO2TtguC9XQJMQNPTbOo5j
         gcfJXqD6dSbcN4cjSvOQLR60R3ytow1KTx1geI8izJW9JgRpIydhbQbs4Co7M5qKEccA
         F1XBrK0/vPyyP/p2tRiNndcfGe+zV9HZse7rwHl+okfk0M/Bfrr3zXcQsRnc3PyiII0k
         ddzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461872; x=1790066672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQVMbHw2hMLu9BwDPceEe/gIwaaH0G/zHij8Nbr6Ruc=;
        b=C4Zn0nHEgn7zbyXfM7KriPWQqyJ74KHZk3BLmOQGAw6iKXAVxzyDFCf+yDHKLoEBc+
         pUs6PnBIvOdI68+VQ+xCgc8xOGYoHDm/x/m9YSCOaq+Lm67UtlWfo0L7Xj+/Ez1bQLkr
         /16u9o8b7UTitVWw/dIWJauidshkQPwfJbdEWyEL2iGKVJQv9p0hAgsGmDSA6/Fufn3/
         MaUvo3+nTdWw/VYqCPHKA/jalNToBRZNcxM4+6v8+R1B3ggCSyzg7LA+MZ3ZNQCQ6M81
         dyDWDw0KRtqsQlUMiDRV1ceM3CpOFC279a89+E8lVCC3O4+Q7W/vOcnnRCxBMzX5pmhX
         9hnA==
X-Forwarded-Encrypted: i=1; AKwUvBzXCn9G8boQ8/45qygeDMnIlhpWt39XBFedvGxs6ibgLy0rRlyZvXDKm5fgg1ARAhCkvn22vYDhD7Fdl4c=@vger.kernel.org
X-Gm-Message-State: AFuF++l3eLPyroVO2+1yt48RExsRL75y0IIFtIGk/P9f8OfAnZWIuhEP
	Rs0Aa31ep95ve5Eq9XJndkwIihHWMBKI2SnMoGTo/VX2Bja6p7ejof/m
X-Gm-Gg: AYBFou2VQKoHjV+nxr54sFUN6D2yIonJ9sP/ZKh6qPst5YMDUISmyFMfGNIs8jArNx+
	EqjR89lwhTD0L7w3w0nvTq4gzQUNapsCv5uRcM+BhVYiPTYy/vK7ZH7M3Z3/UZDBSbfTCb4nI5w
	1hXe44okGpCVfeWd0QRgXOXsi6k6mssHeBCPdxESFfCnOOenPWXiwluQnI+GggCLIECmYEPHdBb
	oqwD1mKjkMZoQUBeUKQJGPD9S+E24SkGgrXWO8KbcQtgM1asykFWGEkSXeSVfG3iEXXGoRqVWyy
	wksI7GMv9+c/HGjqIZhqxaaWP4/mt6gkqyBx5ac5V7IXaTz06yr4GZekaJFddlJPu7utRVXdeMT
	KM9t8caD4Xvx7xNrnxET82Bw//MlOF2gjMi7wf19+2ucTArH1b+bOh3XprAnL4z1a2PLNirump6
	WfZYm5KVk323/69tWGCQL+Pfx52JFBEEbmN3jx4CzwFbaZnlNztxUYX7OexZ+wIYpKRmDJvXD18
	iDptUIdeYiujoo/zlGHVBfdHQ==
X-Received: by 2002:a17:90b:274b:b0:39e:d2a:e25a with SMTP id 98e67ed59e1d1-39e0d2ae7c0mr789254a91.13.1789461872475;
        Tue, 15 Sep 2026 01:44:32 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:44:32 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 01/23] ALSA: core: seq: oss: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:02 +0530
Message-ID: <20260915084424.1007757-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/core/seq/oss/seq_oss_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 1aece46c8b06..6586e07431c3 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -376,7 +376,7 @@ delete_seq_queue(int queue)
 
 
 /*
- * free device informations - private_free callback of port
+ * free device information - private_free callback of port
  */
 static void
 free_devinfo(void *private)
-- 
2.48.1

