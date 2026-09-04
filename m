Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9391F471D1A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522511; cv=none; b=LG6VXu85hsj6Dft/qsoQy3Fd/85ZdZ3qfcvzHtOmwszoy8tsiRee50L8fyMB+QGh/3YrljG0iSfJ8Rx7IvYDc+ju2/AFNdQ3bkpZH5lcDSe30VJrqHbHdEgtEdR+U+L64KB2TlELeQrusE8oQLq74keR+u6aH5gIrL75n+A1toE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522511; c=relaxed/simple;
	bh=FyM9la6c8DEmZm1o0Sze28ytD0RoNgbIOnGq9U4XXr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g6dyP/YTw1cMcV0u5wlwP6By2NqLIHgkuwTLq+u7fF87MLtfss6qgd+blkg0WNGvSfrs8Sc1NUTiCbXRm0dTqWoP9GvDDTWpqE+JxR4Be8B/GjuqBasiTwDLpDcBH93J6ILl+w+7FNshChRditOLecoeLPMrYELfqb0oRUSm4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjOrxgbf; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjOrxgbf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d6efd73032so17469705ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522509; x=1789127309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ve+amK0veETMoSZ5+zoCVWoX1YogA6ZC5rvoZ6VzdJQ=;
        b=kjOrxgbf0AjHAUBjTPbM05KcXGXjp712ozHlQjTacuePqZ3kDbVbsg82rejSUzgTyC
         gYf8gUfC6a35QH/sMJyNB8f1RihqOSnX8W/Ia1ZdwA5A7f1Vb3bW69ExVEkvT39oPjiN
         uB7yhboKQNIJcgKwemVzALIkdo/jIKWUSy6fH3LImRcVTcppZbXLymmKSFS+gFi4VkqJ
         EB9048WzM/h3JCJ8Xns9+Mk4kgrWI/u6SiWpbKS5i51+103sDKrP7s0WJzLuilaUnIVz
         WbR+ZW7BjP8rp6Zma0Z/ksz6UVQyHK3YvGQuQyZhA2jlAvVmb0kOGatwhBzXzXl9Ss0u
         B7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522509; x=1789127309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ve+amK0veETMoSZ5+zoCVWoX1YogA6ZC5rvoZ6VzdJQ=;
        b=iMkpmgjO8TE/T+z4OsEaW0Sex4FcA077WWhTO+NF02paq46EyygBOZ8Vf5RVRRGpIu
         DdQfp2iwLlj/UFwZKIKiL9YHB32TppWMBZoY7iD0nFEbNfGCMKZ/UbR8u1/4gy9aTTjh
         Xmsy0WjvjHQ8reYniXZI7G/rAScQVlr/4N/r/HWhBMMY3FvZ03O48LjVYFfEULjmp5lP
         uSrGrl+jTuD8bYtPyHKQrcgqNgZfQe6Be83Mc0fIrnntaBrcvzczwZh2t25ieSUxgx2r
         FrwR38KBlJLWtKUlj2ONGiew6+4vrdDGydUx++U0QCoB07RJpe13uNpyYKBgnoHdUUNR
         83mg==
X-Gm-Message-State: AFuF++llqcuiCLqCMQHmxWcudh3CMfrZg4jJEIMDinR8icW+IAwSyszD
	6I/2JHs3JootD67yXCfiV8XNUCPnE5c2jbqQV1wZX+7IZggMgDfdUU7t+Nwvuk9PKTg=
X-Gm-Gg: AYBFou15gHlgZSfmWat9x3R/UExEM30pZ4/+Z14QrRM8+grhD08DKeVtcGIdbDoh6MW
	kylqpbu3gtZH4IC2GkMboo9csYtdHqnmWrFUjUohXrT+xe/4mJCCoMaldm/JHdWSuE7ELKnmm85
	6magJoqmlWn+Chq/rxOLJfnpkybqkE+vsuP6hgtjhpNWl6y9YtlfjmrGhBF9aniFlr5DtylbB0M
	rKs3DpWw7RKYuDE33AyFBUc9OB9NRw7CJC9vzlqIzVK7H3th7vafXpcWGeHwHWOGuo/ZmvZgj84
	RJgHcam7H7/SCSbVsXspuZHMjEvu2kIghkS9C0Dd1dw3OI78t983WW+a9ckSIvrDIQfHZBxa01p
	+TnXhH8Z+OsSuDxJtqtrRKTDHwLG9V0q32GotECHlJb5rEYh8KIqAqG18tAVEuhwZTqs4b3+aam
	70cbVVwDlGFML+RUY77pZfRK/P9XiIC08iwPS18rZHP08TjMz33Sc1FFaoknb2VaJXo8wEx2cb7
	FzQUJ0Ii9A6O3I=
X-Received: by 2002:a17:90a:d446:b0:395:c3f7:2895 with SMTP id 98e67ed59e1d1-39b07f2f50amr13717422a91.7.1788522508712;
        Fri, 04 Sep 2026 04:48:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm6882570eec.30.2026.09.04.04.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:48:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/admin-guide: fix typo "asser" in comment
Date: Fri,  4 Sep 2026 17:18:20 +0530
Message-ID: <20260904114821.33650-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "asser" to "Assert", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/admin-guide/cifs/authors.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/cifs/authors.rst b/Documentation/admin-guide/cifs/authors.rst
index 5c1d2f0fa7d1..ebe223413577 100644
--- a/Documentation/admin-guide/cifs/authors.rst
+++ b/Documentation/admin-guide/cifs/authors.rst
@@ -40,7 +40,7 @@ Patch Contributors
 - Adrian Bunk (kcalloc cleanups)
 - Miklos Szeredi
 - Kazeon team for various fixes especially for 2.4 version.
-- Asser Ferno (Change Notify support)
+- Assert Ferno (Change Notify support)
 - Shaggy (Dave Kleikamp) for innumerable small fs suggestions and some good cleanup
 - Gunter Kukkukk (testing and suggestions for support of old servers)
 - Igor Mammedov (DFS support)
-- 
2.48.1

