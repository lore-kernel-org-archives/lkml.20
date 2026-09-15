Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC13A2E12
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509756; cv=none; b=SgEegHu5gEpCk9gcx4rxbtJHqero4LSH9E0EfunX8okYEoH9WAD017U2id8KtlRGqBCkD6DtzeFhSsEP753baBVac5YwFVd9B1HBTgzc0zQec9AKDqTEVPhWbFzUubJfVcK53+4R9PapYLlG4DBRh49FxK112IwiKM04z6+/sUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509756; c=relaxed/simple;
	bh=bA5ljx6B7ITW0N/BGPzHL/Zxz6YCyPP3gMhy0+PZ8fE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XeGlfkiEMqHU23wB4pqAXP6b7qaxCHOwUgUopD7b3B6kPteEJgHXy15T1lQJr0jeuy//4p7c0CEf6Fd2a6kcMDxYgKHWWVolDjkJEPfDJoXEsbJiAs0C7NPiU+dS4OGJTc42XZ8jkiH/NwTlnKy1zCUTxcmRIvFUXURc22O55LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAvwXvmB; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAvwXvmB"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so1972815e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789509753; x=1790114553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8HiHaihSRj3NAinCMOoe99n81qEN+3jpEfhb65vi+w=;
        b=GAvwXvmBuws1EzjCKqb8vlhZdrvt6YwfW1iawqyyDcVKTS4SsCOuJKkZgphkdzLQkC
         k/6f9O/WDTVFnjKFcHD8zNS5+ZQK8afwgo9LlmTqxnMSSuxykNUifbU5dRZSlSwsbH44
         txN6q67bW2tOvzXX6uQZvR6E5lrxc+VwBJEOY8sWGN4CGpTyL7TDNszZ5DQIHa/R93oj
         cuRKZ2A/Z/r9ZA2f5WK38RqqCvWyShi7g30eBiwF5LDgqWqgnbOR4XvJrrIEIP5DMfck
         nFsvuDyz5k2LaMpL9Xha7g9eD14XmOoeTI4AnppnijIz0OdEVZds1vOchpzgLPd6m5ZC
         pklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509753; x=1790114553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8HiHaihSRj3NAinCMOoe99n81qEN+3jpEfhb65vi+w=;
        b=gFF/HeTomTvRQMUbn4Sp0BPirG7j362unIBErz3MHlc02boIb3BaWDdHRy/D2jCs40
         7huS0FdDRUgGntkSwD+aH+7eb5BkQXvOLWAzYbCJGQpaGjfowyWMAe7rdF2fKdIYnRgI
         R3itCoTMaa/83vLB93Iz0GVJ0FgxWlLN9QBrC1wcI0VKDXTbBvgiK87xsqlyALmhBPwd
         AMdFbUCHwv2b1KHAdLShvmT9zs9Qva28WDmazr48ee+gW1AecsJBYIxkS/lXvgwOHZ2h
         N81kcBJ8ADotfWZxhYVrVHHhQY0vNlNmCKf1qHytTBKdZcVK9LXpgAXTdWWkf7ZhQbbC
         TgvA==
X-Forwarded-Encrypted: i=1; AKwUvByI2+BTQGGQguJzRclwxQUxetgnmNXGcmS2QMD07IS5Rgb9wsU0CvNC8Sw8Lhufl0wOFhQkxZma7OlZi3o=@vger.kernel.org
X-Gm-Message-State: AFuF++lMzDq8MljWov1dJl3O/3t7gqCrwnk+9BHoZusv191iRFrt0K+y
	EC2Z96ygfkODFfb+0cYjJD7fOve0oJuDZV8cam+FeYL3xbgeaUKTOwyF
X-Gm-Gg: AYBFou0Hy79kO/BYGPCkM1m/VUb2MZ+0ADzygaJ6EANATs5LDPNzxbei9HU1MdazM2N
	52bAPh3YsUFFsjJFJjKkEHfGS01VqWTS45Rj14FeYfcTINmreenkAFRqcvufhZoUI2cobEdRmRr
	GIzxENQMpInwfHtFLGjgqyj7mfNRu3WpVyfIPaDj7PCnqaMyXgFLX/DA2nuolyw88bOtIKHDMg8
	pfiQfoINNvcjzmFZ/jeRhrkaTjLBfjia/ieBwrpjpjd27Au8rZTJJ8M6ABBtIkbPVFFpnJIe045
	Hl+I1BkO6S3CY+iWERoFhILl8bv1JcZDd3IKavlUI/v8sEeXnerlz4XviOyleeRbpC6TNAWXbJP
	DeoHxT7JkE4Wu93IAXPlW0VCniW+KmzuJ4q1KMxUwB8d0HK1Bcxsyd1ikcqa+l5dCgyiatoKwbV
	zkjUurQBcJndCTFFU+zqrudIQb4rFFwd7OJJ6LGRR5X4B1H/koVxIdp5yxQSN4aToPm9JPSSGvJ
	eFQlw==
X-Received: by 2002:a05:600c:1d07:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49eb7314c2emr245005e9.3.1789509753103;
        Tue, 15 Sep 2026 15:02:33 -0700 (PDT)
Received: from epiphany ([143.58.158.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aeae01sm27747445e9.6.2026.09.15.15.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:02:32 -0700 (PDT)
From: Syazwina Fazrul <norsyazwina.fazrul@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Syazwina Fazrul <norsyazwina.fazrul@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: power/cpuidle: Fix repeating phrase
Date: Tue, 15 Sep 2026 23:00:55 +0100
Message-ID: <20260915220105.14655-1-norsyazwina.fazrul@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove repeating 'with the' phrase

Signed-off-by: Syazwina Fazrul <norsyazwina.fazrul@gmail.com>
---
 Documentation/admin-guide/pm/cpuidle.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/cpuidle.rst b/Documentation/admin-guide/pm/cpuidle.rst
index be4c1120e3f0..e91ebd432f6f 100644
--- a/Documentation/admin-guide/pm/cpuidle.rst
+++ b/Documentation/admin-guide/pm/cpuidle.rst
@@ -316,7 +316,7 @@ interval" value.
 
 Now, the governor is ready to walk the list of idle states and choose one of
 them.  For this purpose, it compares the target residency of each state with
-the predicted idle duration and the exit latency of it with the with the latency
+the predicted idle duration and the exit latency of it with the latency
 limit coming from the power management quality of service, or `PM QoS <cpu-pm-qos_>`_,
 framework.  It selects the state with the target residency closest to the predicted
 idle duration, but still below it, and exit latency that does not exceed the
-- 
2.52.0

