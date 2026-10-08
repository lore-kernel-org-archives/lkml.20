Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC939FCDD
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469652; cv=none; b=u7h5eZHmjmHWiMC83PDHIJ6Z2L6J4AE8ykMElCtSU5Sl8UFSanP6vAtUxbdHDlk8cRzDoKhirDnGL6Sk9g8z1Ey1FBrvf7+ZlxfK9V+2i4trpI4Py9ke0LD1siIak1lLfERiufLPICl6nIWpvgSwjMbDhM25wB2VW2WbK8VyYfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469652; c=relaxed/simple;
	bh=FQdyiMqRRKM3xhoD2pvA/tqeaw4HSxE3GF3abkaMZII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdGYnq4rWGaexEEqSqJG319NTrG5PfccZ5bWUfr2EQrcq7coCnGE20HLagKBrlOYfWC2Dz1EZ99sZZjwr8fWRStEigw+Lk5UPXmUz+OFFLH7BmJhOuUDNZvTEj66/FCAT9A3OAAb0Og+kB07fz5PBpYzK5QV6um/HQCiQIx0WA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBKwMFVa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBKwMFVa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956869750eso18836995e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469650; x=1792074450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZH737C9cPTnwYSjzXIKICQsHNjn8aaX+b4wWMoEQsIo=;
        b=WBKwMFVaUzvEiiDSXZo/liwE6v/ODUbm7SKn8h66xYDFfUR/mrp5y5dsKCd4v9ZRpF
         FwN20ev4t4pqszep9YSP1EA0r+fHoMg2Jngr475mQP7JEjGxXA4sd9nrz7kiitri8+ZB
         u3fVarsBE6qq0zxgYO2xe0/+sEPYQqkoIMUHhU+lsV8BCPZ+2zSji9V68sPvjZ+qf3/p
         XW01Pk44IstC+LwAttikGvLOIDjNvAMs5V1JkOluaiExxDRfDGLYuvMNLlXWpkjQBOz6
         PkwkMb2+Dal+GvpHeieEV7dfDb27WBgE0CXKVfgtB2uiL8vzVyLB6mUGCEv29PAGWnaI
         MxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469650; x=1792074450;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZH737C9cPTnwYSjzXIKICQsHNjn8aaX+b4wWMoEQsIo=;
        b=FygsDKFrnBsIwTqN/m0AO2gfb2b3vQq2+xqhpqLe/+UdUpiuN9x2KbPYARAhvp745a
         8PH890mO26WEWDSM9qzKQy2SZ2o81HUJ1tyKUc3A5ixDVri/inEdUt8+yp5wh8+gCqjK
         3gakfNIWwhueTqG7mvULk4QUUBR24MsTyaZLCgGW8ZiFv2zPWL3PZrZsFJvRCweStgxh
         nzzxFjm9aVx0lEhNAqdvsqnRX7loYf7cWngqI2Lh5Rgo6x0NdTRfafi7wB4sSIKp30s7
         8gOKqnyK2dczVjgXLoXUfXgp5fzHowOcLo6e+FmuGInxIyyY7dyBlshBw56SanjkUAx/
         OP7g==
X-Forwarded-Encrypted: i=1; AKwUvByOHnd9l81afp20vMSuG4Sgx0IX/NP7sKBbQTdlaXRpLqPnZNd6RGFFhXdjOExObAy/ANBjOCiSWTKL33Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kgzolDMnaZ98LsTecTJ1DHBIrcAhzHVgf/iXtRr1Ibu1pwB5Bl
	/DFrn2j7AGkPI9uUl77x64aRWX54Ie/t7zXlnQv4V49T3igVgMroPQXf
X-Gm-Gg: AYBFou1rBLjKmCtepQEo+rtuu7InSStsYgcdHNKse50zGJZxZx7a4rJJoMXb8Y+A4o7
	jA8JWPZ8RXAvI+/Bjk/UNAy0ioL1J5gWO95eBkZZrBID8ks+EZ7zbX/MdmarZ+UtLHmtJS2coEP
	u2fh2Q5kPIg/6kNSEIppsJSTuIqKm0MMb+TLFugH3kOY7YN2PQ/+FjzCKcZPtRZP4yPugp1xSKY
	fji5JrRxg3kt4ylwkHmG24/qQ2NgV5MDFojXG51lm8i5VXJZrkOFwDtRKeVYHuzOfIpgYnvkykk
	siTQezykC8pQ9OJ4PZW0mEyBO/7olStOh+5eotnyKjnSdXcW38dqxfAEAWujlHcUSBs4KA2q0bP
	VFoKyVnIeix1Mi+HWTR5qUVrChg5al3vzANaRCaTl5TE12Q4eS1UPK/uIaWcu8G1ELH922/vNea
	+iPseQWgWS93oHfe9f7jMqI9+9Uh7OmoEFMiHOQBbQzR4Jtz3/97cqmheYCw0F2SYZOvc1JeQtK
	tj+BGwPajtv/oqYnzjUqjY=
X-Received: by 2002:a05:600c:4ec9:b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-4a18043b30emr100122925e9.21.1791469649559;
        Thu, 08 Oct 2026 07:27:29 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1802cdf24sm96272685e9.2.2026.10.08.07.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:29 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/27] selftests/landlock: Fix off-by-one in regex_escape()
Date: Thu,  8 Oct 2026 16:25:48 +0200
Message-ID: <20261008142604.39107-21-gnoack3000@gmail.com>
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

The final check in regex_escape() was off by one byte
and should require one byte less to put the NUL byte.

Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index 91842f618a3a..ae6a0eb8e343 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -294,7 +294,7 @@ static __maybe_unused ssize_t regex_escape(const char *const src, char *dst,
 			*d++ = *s;
 		}
 	}
-	if (d >= dst + dst_size - 1)
+	if (d >= dst + dst_size)
 		goto err_nomem;
 
 	*d = '\0';
-- 
2.56.0

