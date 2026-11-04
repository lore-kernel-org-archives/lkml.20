Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826537;
	b=4ZupOgbSV6DK0r2yguYG3fJZcnF/I4xNyCo5jCRVYH+uhxRir/ZPU6jvACwb1STglmEN
	 Rqmk8eUz6inHrHGJ6rJw6PvVJt8TU86FRXPgisGZg6t/mSiqiMDvExRDSSFWkimLMbngC
	 +x7QvY4BIBrEW3icG6HHGms6pDpmQqn1zMreYUztmZqlaS2QTbvdm60AopvA3vCxrAbnK
	 fOJyLpslaiQIaTuMAL8EXnYq5z82ULVG7z09ttCvJPRwTZxmYJzu3EUnFJTX3xw2wwNXx
	 6SjyqC/rAlFxq71NoxPnIKom9sTaUb3+377HNORx4JdHiPdUmWP+OMBsOmoqyLtd90g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Y7qQA4iJ8bvsuMHrueNyP7nsWPHIAJZ27V2eF1EoO+w=;
	b=hDI1EAfYc0BoexCO9KKf3uiaYeG6RUJZuJ3djgXf4g1yP8/6c35NMPntqPq1El0YVCFN
	 kyz7R1Wx8uTkmdYzx9QDvS6bhTPDa5T1O+3C3YZuEfKP7DVV/SIaBlJCFZI5r4sQ9Q3sX
	 uOZ3Huby6G+pNKbw0Rx8L9j69XCQ5VJCPIIDeDDie2f2RfcqnaDDKySoBK5BmbeTITux1
	 U+SO8wpNZhP3TzAB6J3zpOCMglXoMaUuhegzx7wUDFJc/idcLsklUZgwOYFqRYJgIbJsM
	 Etzbu7AC5pTzgXM5ApirModk4/yyAW6EL3ndmeesw8chInnH0/TcbT7UxtdYvcXtJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCK+qSh7;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D685C607C0A1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D685C607C0A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCK+qSh7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8127915e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826535; x=1794431335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7qQA4iJ8bvsuMHrueNyP7nsWPHIAJZ27V2eF1EoO+w=;
        b=tCK+qSh7U0Ie38Ckd0J8m8GPgrkpDTds3ChR6Mv8zezfM5a5WNdKJTl3RXMkps0TEY
         MpmFiAYXr5RBgooFn0Tkq94gK8tV3I1ZBWv6SpXovoAlFVyjez2M0wjaVHa9ixeK6Lmq
         bx3++ublClyuTJTPsutgG5iFtyU1kV+XBKJAtsv7enmH5vYNwNbCykZtWLyQhd1PzjFh
         yzXiOkDKx1v8UyUzuHpJ0iJhwAXm+K6r3lcDk0/bhuvOBqZq7zjgLIWCFW4R2NymR2ey
         Z4oFw+TaPoal+ruZ+FQqUHSAkMsxYTewGcVezdXu8TWNHZXKEawpTt5SQtOf2g6Y6oDp
         CI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826535; x=1794431335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7qQA4iJ8bvsuMHrueNyP7nsWPHIAJZ27V2eF1EoO+w=;
        b=0d9RxUvmX2ezGHuHVpR1GGb1Egx1Ha35mxmp4W2OitKj/igAvcuoVRyb1vwxm0/Nyv
         Xyx62SKlJ1VanVpc20KOAXmdNLp1AV/QxInUAJ16ha2qqVuVL1XJwEA8twsShYBEiKz2
         bctDyBHrltj7K5HnIhqFEuMfqgeTCtE9Gd+J4jWWPfEVMk+bd4jzGqSrAMAJi324Kmgh
         MybSp6E4lQK63vrR6GptCMT2HEBT33WP9sZvpuFWUMy6a7n5F2tZYePZfwRXoh+8wdsZ
         1xZQaLBfmqjibjbqP4rMfMu5E9izAUkTl87+1dTLeHxcWl7G+Uyfoe5J2jF2RMm7zY6G
         K2iQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3scDDywfkttn39vE//wp1STIsa0P5/0EXTI6EmPsmVUYliXgMeqxTuV00NWkTm8zKSgqohmMJS8CC7wE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kCSMZs8yLsomnM6xIyHLW6NR7NiCNi5VZxGQWp0Kd+SXL3Sa8
	IP1wjSziwp6HotH6l6N+qm8hrUd0g2hv2OOdk2eQ2a92iadiQV6Wxh9D
X-Gm-Gg: AYBFou1XszTLS09o+CIRuaQOZqZpu/bIMLPQLVDcKr45RMD1/Encq+ESKhyhqBUwqCR
	bWc3dP/yWicsjC6zRgm9D3wW48Dam30lNLwh7EeGV/zPhu5PpF1T3hbS4tf8ua8Cn6QepL18qKr
	yIGh82f7gq0bpOrPED2fBTQpGSkwhWijlrKeaupBoomSSVm6VyvJBvfK1Fl8zmN2rVGNddkHdag
	ZfL49A6ncxM1FhsHEBd6tA+sITwFnm/nUYG5JKdkDHRBmPH/GAtfZJKNTSjREAkQUhnD1Yf9V0I
	MSughrSDTzgGHp7MKPLk7jGlU0V5nNAr939OxLjjl3/FKacTZjYGg1cJI5FQto7+AGeuZGoPTCK
	KPSV3e5DGjw7LyiEzaEUo9lY0m6b+f/NCVvzxNtiN9Gz4IZUN3gi6wHx6ug0bqu+eJBrr/BrkyC
	Dmcq7K9K8dvlQP7CwOWAwgDtsTCONWc1ECB8Yn5ifZFt2gUwRhVqy994ww9pzUelkbzABfHrW0s
	FxbYfatU0ENronwtJ7fMGVLEIssqG+IWrDPtlwdf5t+JA2yl8aibbh5GYcabRHSwr8kpZS3O41+
	xY6d050mUHyfARjY2ET8K9pXThDCjfzYLiz7N8gQ10kETM8gxP1thQ==
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr414738865e9.6.1793826535182;
        Wed, 04 Nov 2026 13:08:55 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b452cd020csm81378775e9.4.2026.11.04.13.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:54 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:47 +0100
Subject: [PATCH v2 01/27] selftests/landlock: Propagate grandchild failures
 in unix_scoping
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-1-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

scoped_vs_unscoped.unix_scoping starts a child process and a
grandchild process.  Add the missing check for the grandchild's exit
status and propagate it upwards.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/scoped_abstract_unix_test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index 5dc0debacb2a..e006dba61652 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -608,6 +608,11 @@ TEST_F(scoped_vs_unscoped, unix_scoping)
 		ASSERT_EQ(grand_child, waitpid(grand_child, &status, 0));
 		EXPECT_EQ(0, close(stream_server_child));
 		EXPECT_EQ(0, close(dgram_server_child));
+
+		if (WIFSIGNALED(status) || !WIFEXITED(status) ||
+		    WEXITSTATUS(status) != EXIT_SUCCESS)
+			_metadata->exit_code = KSFT_FAIL;
+		_exit(_metadata->exit_code);
 		return;
 	}
 	EXPECT_EQ(0, close(pipe_parent[0]));

-- 
2.56.0

