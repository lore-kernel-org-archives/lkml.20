Received: from mail-pj2-f28.google.com (mail-pj2-f28.google.com [74.125.227.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E8B424D6B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185673; cv=none; b=E5jMPxvlsDHwmQN8ceQtQZR4avJT7CLUJyXyHfneWMi6VYd5AMwOflBUh2Qmtu33g4O0YU8I6koD98IPf3eZxJcuPxc9zM4deSys9y/KhU20K45pS9qNp2oAg5B9lR/l6NpB1qZYeDyxAPjFILWXA8c34FQHKnHWX0j+2bmCR54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185673; c=relaxed/simple;
	bh=cv3kk5egmQXlDJvzUveGMkYSNyw7O54onpjvk1Il9Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdbN9DMPyx7gWKcyy9YYLdeRu96rBrzZEYBjTZ7b3351neoFF8lrEu/FcU1WIs6JedCmtapb8/UKbbHF3YfBv9BkgPLwwEjwfezSgHWlCuoUIq1ucquyKCEMlgNLSk8ArlDp0AcX3P4+VFRq3kKEY97zvKJCSEb7DF/FLgeP/GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iaf9aUu0; arc=none smtp.client-ip=74.125.227.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iaf9aUu0"
Received: by mail-pj2-f28.google.com with SMTP id d9443c01a7336-2d91c22d27dso5080755ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185670; x=1790790470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uWDBb1uS4h5PTodUKMRyx5us4JzrXxHaBUn/GM73f4=;
        b=Iaf9aUu06v6e0eQd6pI/eOMsQP69vqOBTdlydzqbu2/seILSZtQLukOHaY/R3V1sfR
         NTYPzayxomPL6lprtGil60J6mrGqVrxvvu2xoNS1NUb3C2cqDcJ9eqJE9nobZo/xnQXg
         laU1OS+/p74F8C5aWoRYpSYYFddWm7y53Xp3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185670; x=1790790470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uWDBb1uS4h5PTodUKMRyx5us4JzrXxHaBUn/GM73f4=;
        b=THN5uGpCx0ALQnpf4sc//HkMMaxGB6UU3HCpGWW56gczH0eNYebgrii86sB4m31yyC
         ZpdfII9UqREP36MwlE6n4EXffQlNIhuL6AFNqdr4QXV9vT9hIBKfzn6FbNyazdZ5v+kJ
         TIFMXFbWsPBrtgdiOAvRmOEotli5ncD6VtTbcgtF7xcV92cL4tdMcu8oRNCkahltGIyN
         GogeBJFTC8czxO/JAYC6IkYEjXiekrqMJAxkT4ENz6EoURhIwis+Ia2iUUgNAI62dOVK
         zs144LkVYvLUV8qjpJLMbdN2iNSVBLVz8tckavUrdRpA8mEHmmswLo4MhwVerpNxVHsn
         D0jg==
X-Forwarded-Encrypted: i=1; AKwUvBy88hSoWjthQEIt25pMEgTHIZTf6m26rB0dsLP6vaiWElS75VWSGrqmhCaiVh5fJGZh3r6ilAVqHDly8Ko=@vger.kernel.org
X-Gm-Message-State: AFuF++lerH+vlI2S8b8DYd36SVWYQ0NmExbWFk41YLzQaB+EeoYYc1qB
	r9J+JsJY8bmoYyxwy83n8OlZJEJYpTDBmtzVA/7Bm1P5BcXzSYcMX+g7AbajRAEnMw==
X-Gm-Gg: AYBFou3IEkxeDlWQnuQNMTrRsPEf70wjUPF7YTGWzPgK1m9FWBtSbUTsKrh7c7qiNZK
	/fkTdAUdhnNIpxSZo+Qa7JvLczaX+Zi0Knnl9unQ7zfXmST3XeYcEm4wRlOGmhPkNiCG2TSZt/o
	FZFf78Kv8DCKPDx7lJINS03PAMVvGiSbIPwLzPU/+iqGXwQ6ThSXhFaodDVmIL/pqCdoG758kmX
	0eh4oPfyMqtPkl4e3DyNa1Yt/JKEnBxQygLhblvk/dUwic14rnFHr7pIO751uY0nhlK5dtSiqNn
	rj6vEtgISbj1uER4Mn4dC6TvCZIXg7N5J43VYp/5X+ZKD8vSlJhEL01Ke9W5k9v/39O0KBtbCcd
	pUOVgCXeDzDotIOKwdlNOkCerox9k2eMZSpWy3pK3pnKRoXbT+7iwK6I2Z7c+HbHCKm8oi84bWF
	5OZw1No0BdWkd40MUYON4JsqUeM3mhT6eQOaT0u2CVyICg6BgjxgS5ynhOqb+cmZTgXivvTiY7s
	T/6qIrW834itlxI06qd2HczcI1jVQ/8PyiApQ==
X-Received: by 2002:a17:903:1847:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2df69d0b3a0mr29106195ad.7.1790185670158;
        Wed, 23 Sep 2026 10:47:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2df6a5f4219sm15306515ad.68.2026.09.23.10.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:49 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 6/8] PM: runtime: Clarify driver callback expectations and structure Section 2
Date: Wed, 23 Sep 2026 10:40:30 -0700
Message-ID: <20260923104031.v2.6.If19ee35d3b80d115f264484b21fb003a962762fa@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Section 2 describes the three runtime callbacks, but:

1) it's fairly dense to read (150+ lines); and
2) it glosses over a big point -- that it's uncommon for drivers to
   implement ->runtime_idle()

Add a note up-front to help direct the reader about #2, and add headings
to try to break up the text a bit.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 Documentation/power/runtime_pm.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 423287fce34a..e0c20132dabd 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -54,6 +54,14 @@ There are three device runtime PM callbacks defined in 'struct dev_pm_ops'::
 	...
   };
 
+Most device drivers only need to implement ->runtime_suspend() and
+->runtime_resume(). The ->runtime_idle() callback is optional and rarely
+implemented by peripheral device drivers, as the PM core automatically handles
+suspension and autosuspend when ->runtime_idle() is omitted (or returns 0).
+
+Subsystem and Driver Callbacks
+------------------------------
+
 The ->runtime_suspend(), ->runtime_resume() and ->runtime_idle() callbacks
 are executed by the PM core for the device's subsystem that may be either of
 the following:
@@ -87,6 +95,9 @@ not block or sleep, but it also means that the synchronous helper functions
 listed at the end of `Section 4`_ may be used for that device within an
 interrupt handler or generally in an atomic context.
 
+Callback Semantics
+------------------
+
 The subsystem-level suspend callback, if present, is _entirely_ _responsible_
 for handling the suspend of the device as appropriate, which may, but need not
 include executing the device driver's own ->runtime_suspend() callback (from the
@@ -167,6 +178,9 @@ return a non-zero value (typically -EBUSY or -EAGAIN).  Unlike
 return codes from ->runtime_idle() as a fatal device error; any non-zero value
 simply stops the PM core from suspending the device.
 
+Core Guarantees and Synchronization Rules
+-----------------------------------------
+
 The helper functions provided by the PM core, described in `Section 4`_,
 guarantee that the following constraints are met with respect to runtime PM
 callbacks for one device:
-- 
2.56.0.rc1.310.g51773c2048-goog

