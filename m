Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E9D397E9A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469638; cv=none; b=GzZHtLEHL7KbC2gTjIz5O824uA08jVBTzn2LTHIAnHFSx0IYUMzIBc7viUYpNaUqd2/C6hIaf1IDH2eRSsmjTVncYz844AtjW8XLARWRHwWMXfxsPJnq40xtbvlwI7oHwykuiO1tdUcTigVX53DMltvQeE1BXapZGPU+zbfdgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469638; c=relaxed/simple;
	bh=UhDm4WNQwXw7aR1QB+LiX+TYoJuttlt2x/dLLT9hWvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FPfPhsDe+eUwbKCNstpx5QtbEIgf6DxOB35/e8rWIeuBpdDsBUDmY2TSYCxIIpFiYnkIQmpYcpRO4rovXbnx0psC5cGUxyKZ6+0c8uqnxWhe4OpWyTnpzTjM2bTUarhTbKCFhKbrO5zW8OlWIvO2Ec3jKxuB+7emn4p9M/Dp9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3DB4DGK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3DB4DGK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49e73611928so5898545e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469636; x=1792074436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHrEYq9MgxAFLtaKHzrscJ3u+B/7wbhOLRSIihIY+ZY=;
        b=s3DB4DGKs7pX1+Mj1c+pexU6gX500tbugCO1Ah4S0IH9YFW4NSNK40++9jL1SVVzE+
         /AOkb/EJlCn8ks2dgjV83cPQ968cCp3B9CeTqNZv4+U1mhPg3WFJ6cp2UpzSmzbxHG23
         bxW2ryAYE7Phvmu8BsRC4UWBo1exeZNIRYgb8htnAj7g9bA6HkNc6We0fSQxTG4K7II7
         SkvPcFT9SHzI3hb6t+00lDPIjaaFv9oQMtsaJjndH54foLElPv9m9frzv52ca+YEj/04
         c/RYLUfQ8j5zoWisgMCdGObM+/vYMfvk3X0wc1PRkdVKuqyU1G4iEwyzgcvrTgnhIro9
         7f8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469636; x=1792074436;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHrEYq9MgxAFLtaKHzrscJ3u+B/7wbhOLRSIihIY+ZY=;
        b=2ssN+GdH0NoK7pR+qb7W1aN09fQU6aKDKViehfvGg45kKaevJqz5ZPTa96HXKgtCyf
         RIJaXXlpQ/9m+R5CHTjT8hJI07k21nbrkOQOWqsOfgGuegpZ2pNQDLO/gc7fxGuundZq
         LxnJQ1irxXMu1m/e9MMVd9Ze+x7l8FJfY6v/2n70pRHX3HHwcjSxDPp89IxnDTNyLbAR
         SRRb7S+/HiFimddiGMuMOI8hY85Q+AlQaYRLqcqT0S1U9JP5q5NrFkhu/ojPJMmI7QQB
         TUmvJihPi6866fY6rzNWc78JHbG1O419ie0PD7Q2GZaV9HAzhcG9nJal134UFjjgT+1K
         aAqg==
X-Forwarded-Encrypted: i=1; AKwUvBxFioSRQtoi8dXb5PaCONT0tBaGgdYxmNf/x/uGd6inXHRkRIuDWTlIs4sQ44z0LP5LsSRolspW0/9lcw4=@vger.kernel.org
X-Gm-Message-State: AFuF++kD8tyfejsnLRMte+0XCtRfacWI34n3JdkKtHApQSgVrrBw0uDT
	39xv3oWg5DYw+YIy5KKG3lfX4TIPdY7DFd+0Z3tlSikpDzmTbEF3ANTg
X-Gm-Gg: AYBFou3/4b4H2cXP/NsHMx7JUuasr2NrA9Vcn1jev1NaRr47UNjnjPCqEGVuo+8MkvZ
	pu4+PTUkkTDuiMiVvnwxSJckVwu1j0FA1ymDDd9taNjQOOofionJyKgrqNsqYHD4yoUyP+cd/3n
	o1A0jHu7wspyXoYGlrzq01vroKSYLDHONgN62vqTymXIjdLDNoxgfZK67V1QNST1nIXkDcef/jw
	mi7FgnBAS4lXL7aIYkVs9TKdZyXY5W2ussjHspvcXCmWxGPK7IybvSO21WXtMP35E/2e1PzQ+59
	qKAn41PK0e8Ln15RJB8f4vrE6z4pfg6A1In2fOaD55HgiG/SCnFhw6OcY2Qiv02DepkMeZQnEsJ
	Dhazcc+7VSL2QRvjkeX7rrjGRbGpwJFRPtB7dQxPdSzHFdjKd2xl3KplHSvhxkMYfHUbZCwbf37
	B7lbRmMyirLkGyc6F56CqIP97+gEfCL2Nqy57SbZ9VcJ/HZYsF+ZvhUjivsuvUn7id1EIIkDahJ
	y6rBBtEXmhteHARzfGhQAQ=
X-Received: by 2002:a05:600c:3111:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a185160ba8mr53337635e9.0.1791469635592;
        Thu, 08 Oct 2026 07:27:15 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d113dasm11244781f8f.19.2026.10.08.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:15 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/27] selftests/landlock: Fix memory leak in audit_init_filter_exe()
Date: Thu,  8 Oct 2026 16:25:42 +0200
Message-ID: <20261008142604.39107-15-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

audit_init_filter_exe() does not free the buffer returned by realpath(3)
when the path is too long.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index d428ce802f49..1e533b4e26db 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -507,8 +507,10 @@ static int audit_init_filter_exe(struct audit_filter *filter, const char *path)
 
 	/* No need for the terminating NULL byte. */
 	filter->exe_len = strlen(absolute_path);
-	if (filter->exe_len > sizeof(filter->exe))
+	if (filter->exe_len > sizeof(filter->exe)) {
+		free(absolute_path);
 		return -E2BIG;
+	}
 
 	memcpy(filter->exe, absolute_path, filter->exe_len);
 	free(absolute_path);
-- 
2.56.0

