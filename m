Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D7A385D7B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913140; cv=none; b=L/oGSVTaIOSBWwX9N+Iz6X2+OzbHE/pSEJqYfbKZ0vdSWAsy9prKcxtH7wWrZl77+PpZuTYCSirvQQuPOTmV3pARSXqzNuwGBthOTptO2Zuq9XjUFouhGjMBEnXTG7dVCCk/lcZd1TtEivBKWghuX+FdhzWPRc5Tt1r/AbgeUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913140; c=relaxed/simple;
	bh=iFgD3s9FexkpOwPXoCa9/Aa+WW34NHp7ff/T05Ck7bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSnTFWpADoyldTOO0g0YhxClPzEE2f6cP4CZPWblFLonNM8rnV5mcjvs+R/BdYymOi8efU0N6EA6BtRhxhOo/Fwvxpj3LwLxVznsQY0PpIvLpYXMYeUdeLJh/vjb2QOvO2nyYw9+iQcbAGYvDicMQUskLHpJUDHi99YSqgRSFk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=LBcfFY6S; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="LBcfFY6S"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso801460a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1787913137; x=1788517937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1yQCyrqgM6nCeK6a0evA15Oc4geAWgDmyQGVFMtw4g=;
        b=LBcfFY6SeGQJGD+RY8qAY+tByC929yMhF9CNrt4Mrw5nw53vhonkByvNCDG9YbRGXz
         KCv/NzvwK2sqxq90Ha0kgYwvqELvy0Tilh7ZCOj1qZwRn6vPWSaJRpfsps6VRIFC/JuN
         nCgjPB+wkJnecE092j5BT2lvZM3VsSrGgs2CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787913137; x=1788517937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1yQCyrqgM6nCeK6a0evA15Oc4geAWgDmyQGVFMtw4g=;
        b=MB8kHln2e1uO8X3HzCQhoPJHlZ6Anux5JvmdIZT/EKP7Q6X7xMdCQHNXucP2+Nu9DD
         w+FAkLXqj2tcr6fr5NnMWeqagW7s4tLzXAc1Ktqdg3X/OYs+dwRhsBb+VqqHji0uBwsZ
         wLhXaluBxEik5E5cgiV3t8r6r/OiXzBIrs1Xsdf1QyndIv1TplQpgMSDEGYLMhF17Lt2
         gklhOY0CeJWQaWeQLqUGnphcgGoblGo+zDg/I3BHmQK/R1dkEFof1/oqGVMvc6+NvulZ
         Q2jvfFqCvY2qjzAxbGjXayYEjMy6AxvRkBGPYiqIycBG36AQotBYhJGdnU7MxBR310bR
         GXyQ==
X-Gm-Message-State: AFuF++kSQOh6klLFd+1B5BB0Hhdam9doxCuRoPzxqEUpnP4bo91ojCSm
	jFYSoB+NsiNgDje0qu8oXlzbiUu3lcfpqxRsEwSRY5VdltJK7JsLsZcOBJIIfQalFZo=
X-Gm-Gg: AR+sD11x5ptQSLuZPLDInRqmKnPqVgsIp2NeJ1WttH1rsnlS3aHmnM2xUnEc++4kQJX
	4jxtGlGCKmAOPMqKJXUjprWTdgBlWRS9BxTeLJ++VzZzynEDlr0w3hZUQ/KwX52Ev9uN96f83YJ
	P6ooCnTuPWyoSnc+NDhTpddypzB+BNS4Lsb/TUdCzlqX5u+cC61WbAASm1jglhWlc/ck3kfXOri
	WuO2uCBT+3gEEJroAgAtPFUo4VwZokWs68p7ZDvKEfyQLsHYpVEo3aSAIwoS9kjfEAvC4RXfCIA
	BAzjbq9tm59BDzT8x5SBq+6R+ilbzWKwNsPHeWSWKKBTLwIakd0a0kvF+4aq6E9O0wQUxB3Yu9u
	Pn7ZotIpgr4zB4Nh4NKXAiNHywrXOt7YxGGrsYktjrJ52ajKeVCiyb0QtqvmsqljAihQjzrinfI
	4kOYcuvSjcUx7A84nIeCmuvM5quHJRVTtPfCdTAMuL0OE51Z0WcBzUkBE5cUyXxpg7ENjmI6hz
X-Received: by 2002:a17:90b:3a45:b0:396:5785:843 with SMTP id 98e67ed59e1d1-396d0f09a46mr12165341a91.8.1787913136982;
        Fri, 28 Aug 2026 03:32:16 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-396dda7835dsm2017492a91.5.2026.08.28.03.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:32:16 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH 0/2] nolibc: Add sendfile()
Date: Fri, 28 Aug 2026 19:32:03 +0900
Message-ID: <20260828103205.384589-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is another thing from my backlog[0] and seemed simple enough so
sending now. Also, this feels right for nolibc as it lets you move lots
of data around without needing to allocate memory or even transfer it
into userspace. I've used it to implement cp and dd in my 64KB userspace
for linux on the sega megadrive.

There is some 32bit weirdness again, I think I caught that and added
some static asserts to make sure it doesn't silently break.

Maybe the test should actually test the offset?

0 - fallocate(), static pie, sockets,...

Daniel Palmer (2):
  tools/nolibc: Add sendfile()
  selftests/nolibc: Add basic test for sendfile()

 tools/include/nolibc/Makefile                |  1 +
 tools/include/nolibc/nolibc.h                |  1 +
 tools/include/nolibc/sys/sendfile.h          | 41 ++++++++++++
 tools/testing/selftests/nolibc/nolibc-test.c | 70 ++++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 tools/include/nolibc/sys/sendfile.h

-- 
2.53.0

