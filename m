Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C8D52ED4E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556841; cv=none; b=pV3nmagXJ8USZcOPAvA2G38CYcGCr9DW9KviR74FhG1Kr8YN4bfNNmIh5Bo3t5IibdIfiIodOmtx2F5yhwGd5pMnf/EUGiICY7dg6+BR94L0ug5u9mmLFeJDBcwxNS9iXG+ZDExh0vQrFubqFiclA/lGTWsScjFGUbobETxsSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556841; c=relaxed/simple;
	bh=xKaYW9zJkwwWXZEkPBsIv9x7Ds5D3bG/QUriwzNmc74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AM0v88BKYW7816YX7zZdgGw4uOwRqv5sOS6kFJHzRc2L+QOAvQKo3XiPwzj/s6GRDpKqcWTD22KqGZZVkCNUKoR76NuQnVLppMGACsodNNQqe67ACNVvUZMGvMeqXRJw8KsxqKcH/dsEIRlKszsl+qy4pvP3QtndEHxUIl14p50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O1OcNwS/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O1OcNwS/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8f265cbe6so11644145ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788556839; x=1789161639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PRA1MiHjBTxffZGUtkRwz7pDd3V4cniEc57f6JxKLc=;
        b=O1OcNwS/YU+yW4zoye8fy+n013Mcn1hK/4LbgxyJUnbG2149KWz8rkWCntnlxDtuia
         IggSE2vDIPM/rXbaPhK0sa/3SZJmIFDTnTbWGlVyPuq8OxbZMc0EGJ1v3B8Yd0eWg8hj
         Obj1XCqTZQLamwZlEIIqOVZpdOoQ26syq3KXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556839; x=1789161639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PRA1MiHjBTxffZGUtkRwz7pDd3V4cniEc57f6JxKLc=;
        b=FTAPto2qYYEnEkGlA1LICtTHhg9dhDDQfVaxqTW81BV7roWXn9Z5UgPDsNY/8faHE1
         9U54vPcaPl+PHQrg5GhdLGz93WnQl5SFYvi3Sh/cl06eKtvrO6yG6RsM7s+rR9jIfTER
         zLvxLHCBZY3E5J0DsAS8y41KV2VJAkacfvqjlPlt4U88x66Wugd2cpqoV/eniXsJNnaP
         VNrsuWfy7pUPR+VJ3i3lJzalL1Fmz81IpuK2T5HRTaoTTwALwa46bYh430QIVPU4lMEg
         XyVu0xfNYwY3OlebRD5Xti00+wfP18hFc5Bzu/XPtTlKRfmK1mQMDztNmFRxEo/cWDET
         WjVw==
X-Gm-Message-State: AFuF++keq0InNhKqExwV9X2Eqg4cEaH72Lqd6xir8N7edXkVDYCDxzSy
	/A3RYjwWX80qgjIdeCQ7DmmomRohEkGgBylF6Hvjs08gp/LHdwQVUBK95tdcrycK2A==
X-Gm-Gg: AYBFou390Mg7h+ErLYHATbD+6wkjafiwx6sQmekw33hzgbH1s8Hp1fsov3nxHqrFNMD
	dhBxc9IJc+7fUw4AkTJ2EorbzIsq2FufXU0j0gxJRKyu8KOQuCmpiwVnRTJEhANvN2AiE+IplI1
	Of0d6NRynL+DdJcEGfgi172HwPldBkUWBgwF4Xhs08iTybFXhSIbbqbBV7HJlpyDRcwtrXvHUCp
	wKQHR/rI2OaZ1Z5vDosJCc8fc+LhQDva2mn0g7bRzkRDuEzIQM6EjMUB9sSIgsgPgH8ixEwdJ8e
	L4zqyr+B9xkwjigQVCYIuAB+FDzZnlJgvUKBQ/HRQkyFPts7rAW4751ynTIknxhwFv+p3vfOgwG
	epKmsL9ESqVYQVf5v9DukbDYmHBl6xTndRdk+Oqcary/FlWkRjBWTtALRqSY2dk00FewQIiVEYO
	h8DiGPyGHRnGGBks39hN80BA3U7rwTs8RySVBWmdFci6JLn/0q65ckMa9GL1QlHTCIfJ/Z3JiDI
	AxHd7yx9z/U8fxE03Pzd80fNf3/4E46/q7xnw==
X-Received: by 2002:a17:903:3804:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2db126d8a54mr132748865ad.10.1788556839162;
        Fri, 04 Sep 2026 14:20:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339ac24d7esm14125746eec.15.2026.09.04.14.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:20:38 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 08/11] PM: runtime: Clarify driver callback expectations and structure Section 2
Date: Fri,  4 Sep 2026 14:12:13 -0700
Message-ID: <20260904141215.8.If19ee35d3b80d115f264484b21fb003a962762fa@changeid>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904212000.4167880-1-briannorris@chromium.org>
References: <20260904212000.4167880-1-briannorris@chromium.org>
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

 Documentation/power/runtime_pm.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 334fbdcd8fd6..571a2f29851b 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -99,6 +99,14 @@ There are three device runtime PM callbacks defined in 'struct dev_pm_ops'::
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
@@ -132,6 +140,9 @@ not block or sleep, but it also means that the synchronous helper functions
 listed at the end of Section 4 may be used for that device within an interrupt
 handler or generally in an atomic context.
 
+Callback Semantics
+------------------
+
 The subsystem-level suspend callback, if present, is _entirely_ _responsible_
 for handling the suspend of the device as appropriate, which may, but need not
 include executing the device driver's own ->runtime_suspend() callback (from the
@@ -212,6 +223,9 @@ return a non-zero value (typically -EBUSY or -EAGAIN).  Unlike
 return codes from ->runtime_idle() as a fatal device error; any non-zero value
 simply stops the PM core from suspending the device.
 
+Core Guarantees and Synchronization Rules
+-----------------------------------------
+
 The helper functions provided by the PM core, described in Section 4, guarantee
 that the following constraints are met with respect to runtime PM callbacks for
 one device:
-- 
2.55.0.979.g7e5102b832-goog

