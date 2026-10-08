Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D738C2D1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469610; cv=none; b=XGSFlgbnBclrb4pfNmZE4i9nwcBMv3kqVOSbe1+as5vxNcn7mkvxO9EaWs3inTHyNfZ8cmWZJOKRgzS+IgN1f/GbYwvhKZkQPAsubdIaWm2h9STFNtyfwXrJ/XEWctVot2ng/+catO2/6v2IGTTTBnZ2/3G5JwrBBc3PhTe/IuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469610; c=relaxed/simple;
	bh=QaPYYNQyOGRWS80Oiyw0TFXYSpFN2iuoAICrlp5a5BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcD8SCier5W9qpJwEFfF7rFFxLGrRNIXy3b/pTcC08n3eW2vE90uuWtF3ZaSksXJOvoqPsCPVUaJxIoB6fM+6/DEIEEI9x8hdTk2gJM+itp/mdb/Z4waZMNS2S8Xwg/wVk2zzGD/GSfe1j4IMBkhN33VaM8nOoefc/vBTTq+aZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4/vmmre; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4/vmmre"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so61333425e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469607; x=1792074407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=43yKwHnHP/WZ1jZvgC+UcjcrGZuSSGiPrkzlw9Y42Ws=;
        b=H4/vmmreflTCk6hgkiycfgHJnii+outZ89Tz6KkxeIncH3pxB2kFW4N9jXBiNCJv2o
         YF1u5j1WtIWqxyZ1Y5NuX5a8fwgvkqT2TRFgw+FXhsiE2wyDpiYXwpOXMXy+lG7H5QJb
         Z99A2moWt863EQckV/lb04kNaJZAAgNrLXNZy6CExUL+qsVnfFOBOh9w+v9Hcw+Iiws/
         rFqz1Iyh+ylroziZ4abRxUyK+/bK2Tb+N0eSCFwXligRBh2TWn5fHYQGef0voCh5hsfA
         gjKz3V4gIKVF3DqHS93KA2o1O+YnDmXwHWCggVBAO0jqqziN1OSyezoFZ41AuoHz9kjB
         //2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469607; x=1792074407;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43yKwHnHP/WZ1jZvgC+UcjcrGZuSSGiPrkzlw9Y42Ws=;
        b=vomZMuNx/YBy0WdYwU9g1lTmFl8DxoEIdizoYJsLwhz5hhKERnpX0eFRH4XrGBrWvl
         Fkd1eU5msBk6BecWg09HNVzTIdIhga2WwL09FkwVydBilhAqQhwjk7hGzWzlrqTU3ezX
         pNJX7/PjYd47Ns1M70FKJsMUpzrdsGyoOXDEgI60qblq8tfS0JbjjsO6VPtXvU3i3hBE
         fQKxxaTUr0zVTLYGrosYQTtVKeVAy1m/m/ygrVVTW4Sk++1n0AHhozQSwBqTTMgK5EFD
         sqcnVUVZzIKuRUBaRmVAtcWHH017k4ZiIJOogBhAuiuYmvcoqYo5PLhQMD3C1C5m0yBs
         rc3A==
X-Forwarded-Encrypted: i=1; AKwUvBywpGVfG1rDVrsCb0eqv2IcmITqu8BkgTUsQrQ+7OCeYibSh0Hb1XIMQq4JMKDqMPpHEKeUkOor/QBy5ZU=@vger.kernel.org
X-Gm-Message-State: AFuF++l4XKTBun6/vcy/Yyr9ptfkJmG82bKu4hIw+fKVUWrIh957k0y8
	kRd60T9VUEGIL6nuNzEj3gWUpa96mjCejtJZUka0DLGYBEGYzV5ez6mE
X-Gm-Gg: AYBFou2Rab4eSIqVcZZKv0oJQp9KULQTLErOr1HhcP4vaSNY9on5VkKUkMKU259Iu24
	QRIxC2+qvHLuS+KeT2XEcuhSMNvlDpp4B16RkmX0dRFuDUwnLXjxaj5M2M8eCmGGqMfLu7ry4fe
	LpBozXTrSPdGOMcA+nzZsE4EsESDjvAVYDk9jHwndpu0U/0NmrGgE9/YMtU5vfh11FotjSEqu9U
	xjfyQT4168SX9aZh6d2lIYpF7Ei2KN+J3NN+FxjQLZVOp4wgQ/mu4rTMuqDUX2XelgaCKjKNKe9
	yV+RB6iUPyFa6f+bolFIJS+PfOrgRJ/zEHQA5VSfqK7suZQiTU/VTQQ4T2OOZ59Ef6MbUFzb2YL
	O/HFGFo+ErkH/alMr2xbRSExqMYPye11royb7R3AInCWpcXnVdv69l/D4SI/sUAwaXDu+9HSR/K
	lhhNCD4OsWs/UARTzPvQL52fD6/+qmCqkSfwLH/i4qOQVYreaoqlIv/+43AqauRf6z+jmCHtMLg
	noWKf6enrR0Bw77A0TRTKA=
X-Received: by 2002:a05:600c:1c22:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a180424698mr124373615e9.16.1791469607192;
        Thu, 08 Oct 2026 07:26:47 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm12022355f8f.51.2026.10.08.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:26:45 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/27] selftests/landlock: Propagate grandchild failures in unix_scoping
Date: Thu,  8 Oct 2026 16:25:30 +0200
Message-ID: <20261008142604.39107-3-gnoack3000@gmail.com>
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

scoped_vs_unscoped.unix_scoping starts a child process and a
grandchild process.  Add the missing check for the grandchild's exit
status and propagate it upwards.

Assisted-by: LLM
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

