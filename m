Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C04233938D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002616; cv=none; b=N9W6TzJQFuLOl+3YmzHSNpOFE2tmB4ymoRPvtbERZJ+zT9Mw9xpm1bSUXvwg7XBNuQ3c+a3zt+XDdLzz/uRtdiXVmUvI/aoJEPpgCFkMjU4Aq4uf/dkkIh4u4btiAHuV9wDWrBJRdlDhikOU4xeb1+quzra10e5a40mcqiepbHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002616; c=relaxed/simple;
	bh=or0xzMswmj9Tj7ceDBe8I/7LXee47Ypd8r/+wEXzH2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brFCKirFW5SJ/QORnMSQp0UFkdeWCcPj+1P1TsPXSjdqqM4abIsoV6lecXeawDiyuBUTZo+OcwcX/U/xXDWUK8Vot9bauGg6zFpZ5/lHF/DGg+6eIFTWNV6BHXcbjDVv7xskEzq1i4inVw+tiQbAgtL69BIS2w9iWgVXJv4X/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTmvnOc6; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTmvnOc6"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so7121280a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789002609; x=1789607409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=or0xzMswmj9Tj7ceDBe8I/7LXee47Ypd8r/+wEXzH2Y=;
        b=FTmvnOc6cGfZDjXV4TDY7Uv0rqr/p8hHPAhoSa4cgWbuz2LR4ku/LJUWn+hjpuo/oC
         8ivazSWxugwwnmth31ELknTRH2rZnyp7XouX4D+iSoshsjCcEacNBPoTmlx0ggHiS9SV
         UHoGzPJXSyaq+/HAWyAAgd9rBOXsTuznz53c7ZrHSB6vheKweLp8yQs8igYZFeBlb2RJ
         y3SqOlb7QzUwtDrdmoaWj4KdZ6Q/MU5qP6pxjC4mIKr8Qe5tz833qq4jPGJJDn/1WAnA
         g0ZLeGdWK2JBBsBMRpL+QuSfIkwOGDe/DQobxXU71/Vok5Td3MQVFaIggJi6K6iXLM2h
         xj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002609; x=1789607409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=or0xzMswmj9Tj7ceDBe8I/7LXee47Ypd8r/+wEXzH2Y=;
        b=MUH9U8zCN8Zx12BmDgfdllAjVcMGbAWatWHzIOSYZ9SzhQhpjEvKDfU5uDAX7Y8GjW
         su19kQr23kKFg1WaaRBxA+it5LT/haegS/AYxpw+bZ+ZUXEm/MNOjPuDyRVK8tzjAAlt
         gq5SEiZH3Cq9AbE0FTcAU/uuX2T9Ra3kPMcjHNm14oczyDl2r2b7yxRlFTqnNEOYXkQK
         NH9Sl7mijX1kSDofec+EuqnBGYrrk1mBDS0oWgoh9YfwyxNHceK+lRqzGxlwd35AhRUC
         heAPETAOe+J1jGsGxp9Gadjz3H/VGsvgG38/R6lnesYtd/gYAjVnJFuol4DrqjObM19L
         z5gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKR9gUVPE1t5lWzcMUEyrdb9Ngiw74M7XWHVZiCh1jbeOYJtfX88wCPqjhpVEL8OAZ3+Abf+qxEFfebpg=@vger.kernel.org
X-Gm-Message-State: AFuF++nUgRSk5e8j8G0TL15UKhC79TYTx+R0Yd3lxZverccbQTm71JIn
	/SuYxOEkaJboabxKWX0o9rbqY/VAT4AZldYUkT8x2eGp0NAR79MA2tvVkzRCjw4=
X-Gm-Gg: AYBFou2JWoTEKkTm9zV8Dc/QLdG2A40pKjeyo53b+b4ZGx0iNc6Cdxl60D4R2p4rZfu
	cpc4fnYRX3BzotyhasWpWeQU5Ar+7Lvl1doSV+LKo/1ROoee+8o7oRqoFt6gZUnjaRxDe/J2Rah
	nWRYq6O9zR0YVSNod8+hanwGl925qzD4jv0FXOImiJISR+IezSveX4Q7S4VQxNg6EFJuJpBFAhU
	k0VJFuVo6sUycwmxA/sgpBr7E4beCP+8CFC25GTF5QTHi9Z3FYhVfCfyYwzQyDCNb1JaJr6pBPy
	9MTbNBrH6N6r6ZVR/mu/2mlOAA0MZ8JXchBH8kjXgV92oNsw9OsA4fbk/4f2UdqjSgmhNHmJp3E
	IkEVIi4bdeFd+1f2WsYvjKBZPuzz7MozDMoAmRhN7hGjdN/+T3HvB4hF84GU+vYsp5+yQYQASg2
	AMgxYt/Y52xkZQKSY/31l3WrIqt4+TEjOapvrKyNnb261tPYxk+MZZJU/T8HzHVeWPbNxjkVUB+
	x6yB3tzu/tgoOEBdmxoBENN5w==
X-Received: by 2002:a17:90a:2c9:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39b2b5a9b24mr36753936a91.6.1789002609041;
        Wed, 09 Sep 2026 18:10:09 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e7f4369sm863377a91.8.2026.09.09.18.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:10:08 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] tracing: hist: free the var ref when its initialization fails
Date: Thu, 10 Sep 2026 10:10:03 +0900
Message-ID: <20260910011003.532262-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260906133352.3815019-1-donggeunyoo.kernel@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sashiko AI reviewer reported this bug before I sent the fix, in its
review of "tracing: hist: free var refs regardless of how often they are
referenced". The patch should carry:

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/linux-trace-kernel/20260906125025.711111F00A3A@smtp.kernel.org/

No change to the patch itself.

Thanks,
Donggeun
