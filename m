Received: from mail-wr2-f40.google.com (mail-wr2-f40.google.com [74.125.225.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D6B4F3EB6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613982; cv=none; b=gZPMZev+Q5Qd/IeQjsD8vAczqsI7HtvHRyOFb44f2zAoIsRFI+rIeEKQn824r4sVDOtlEBLieu9OekDVdBtvV7gG3ysYxffopdOazeEo+o5UJ+BXuQH90VPoTr/ceOk5O655MyYWep+QYsJRVMlRkteJ7flDT0dYkq9daurSMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613982; c=relaxed/simple;
	bh=jnnkpX6A9eUVIr0NRIFbVU++Wwtl6+NRJQ8AKjJzMGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YH2BuwdzXD4AWCoGjxE3mFa9cBLzMzN0n9o4uJU+ea+Tmx/9J1ZOiPBeQ9nM5iS1qaI/RbkVJtdRBG/v8kH85+WdT4XZN0cCsQ2vUfQQGxLS5X6T2hPWZFGDUkZL/QtlCVdoTlj1tLjytj1pxkb1E2vsGOyLhbUS86Ugah0EVCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=k3qVUUGW; arc=none smtp.client-ip=74.125.225.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="k3qVUUGW"
Received: by mail-wr2-f40.google.com with SMTP id ffacd0b85a97d-488780459e2so3192142f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790613978; x=1791218778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hAWwzEDYsdL/vGS/72cVPiDxquOMmSf2cMFzWqr5TUU=;
        b=k3qVUUGWhI4HALhzrP/TaL/0yJZn1XtLqFidu/HEtTo53G3Qn7sQZ2Fo4v6XIeI9BJ
         CbROkaraZ8AlldRR+Wa+pxG765h0Z1CAUJE/tf3feTxHauujZQ5B+5lGGiutvtdO/bdu
         siUrOUY3rLV1RPNukelp6Qv0zSGGbEzwXTfujMA7tvdb+kwd/XFHAjez+WAim6fnenUC
         dfPACNLElG+T1uBDJqxI4dvNH9ZnYsVcmEljk57x25btkElMjL60vxhIvPshD7nOKL4g
         ZsvbfKNJbtf4HX/MhzlPfgo9LYJRpI1T+7uIZcOC3gcc7Tn51Dc7De/7Ydw6nS2QWTf6
         yakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613978; x=1791218778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAWwzEDYsdL/vGS/72cVPiDxquOMmSf2cMFzWqr5TUU=;
        b=Iw0F5EIgpcUzI9z+euCQbyUhKVDnd8qFJb6gZ1I1mC69Oa8LmGq1ed1B1E39jPlx50
         NacT9GWpJ7YOfFfbonkCDz6TJn7bPzBbX2WIGkSJLk7zIMYVf6Qg32OkpRRMBdWHMLOW
         pLzwfVG6G9hw1bLLxBGWN6C5btnIyPlOhM3n4lj2/TzdPV1O+rGe8gJ5kmh5Mph3FgnA
         P/cpprQ9dE+bePfLoDaS5KtQmc2B7ZuRuXvVcDJ7p0yGJiO4+dbrYd9J0UYdUH31zPP9
         ri5/5tsSyXcPhxAMM3tLGd6esAHtPq28CZVihUjBrpzkrbWGpUiTwqcaik3tY55DyYmq
         Vv1g==
X-Forwarded-Encrypted: i=1; AKwUvBwXMAWaHy6XqKvQ8Qe2s00o2WdDMVDmwSUymIHY3k8XrGG0IbFQna6iN+bCthWlw3dtTpLeltbMdsrDTL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj/SCphN4mWTwGdRCXU1efsJi6xV8BJMBjCNApBWwoYrZGYg5u
	8+cmnjgMYUQKD2DlgEJA5RjmR97+13N6hKHkqB7l2XVDodM+RCSAakFmBaaS06oTc98=
X-Gm-Gg: AYBFou1BGdMpti66SSSbAzzmCtoaABeMw/wyJayiDDM995Gf91wrJrxXGPcAYXn6wj/
	AU1uVLzIhz/nVy6peUl86vJXsquCQBhg0TLGWRYVMkzPDbfhvhwDMOZPFYapxCTab747y8Fqr0V
	aw9Fw4u3VtVrASxT7M8y8AGubkQwDGxTGkjgT2Eqh+lf6z5IevgJsWgxnTSLaEkb4xrunU229Az
	alDMFqV+w3eXfPwlhNARzWfWOnPRE9JgChUwqGZMeThf5bg9mQldx5pQSGy/47vGCSLAKbeNQHF
	c2BLhuyCM6sTnMpXN5z7CG0z2Kb9p+PjreofWYeTa4Gjz9MUIqGPdFYU+RPGvm7o8tS0MK8eIvr
	7oqur/cBZpdh3X9p0fDrI2399vOl+6BMC/0DVvHgeD92bc+AsyKXvtwmg+pbAdFf1QYWloyeFG0
	3JQ0TXehekQVmOdbnUAwnq1kwFxtela3FYhPEMTQSSLkw0V8YyFXNd0cPMBu6fhVggOC4++n/oy
	I1NIYRKFs/bksZw6ifA+ZrzjQAPbDMwODzMjRzPm+mqrqi01I43Vp3f4vBQ5g==
X-Received: by 2002:a05:6000:2c11:b0:487:b28:c82a with SMTP id ffacd0b85a97d-48871879aecmr25843657f8f.47.1790613977949;
        Mon, 28 Sep 2026 09:46:17 -0700 (PDT)
Received: from localhost (p200300f65f19a90433f74747aea68541.dip0.t-ipconnect.de. [2003:f6:5f19:a904:33f7:4747:aea6:8541])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4887a36189bsm27776092f8f.21.2026.09.28.09.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:46:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Bradley Morgan <brads@mainlining.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 1/3] docs: admin-guide: Handle TAINT_FORCED_BIND when parsing /proc/sys/kernel/tainted
Date: Mon, 28 Sep 2026 18:46:02 +0200
Message-ID:  <bf400c123ec86a7192388ad23cfe4194f536937e.1790612298.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
References: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=jnnkpX6A9eUVIr0NRIFbVU++Wwtl6+NRJQ8AKjJzMGY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqupnLEWwU4nnlnlZA7LE5yrcNgYkA2pF5L5t0z t/9cwZm36iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarqZywAKCRCPgPtYfRL+ TucICACN+AyTvue/mceH/MnFWJsKL8AdaDdIkUDXr7WE4JygrR48sB2yKoGH8oxBbmAFZoIYhLL eXVEf4JzuaTR8nbKlKfi7lq83HbmXbj186CwlftOaiEjDvC7N7byaFSHEQeifccsrovUBbdQ6SU /Z+usdibWVtAwKXxyrh0UqPVUdcwKMxUMIjL0zMCYp+4G54HXGNQftvqBg4+GB39wz6NrmkrbgM frDm9EIL5up886P/8NXiOiW0kYczKLp55okfL/YtBqUvmUHX9FdBRaCUCoZnJbHa6wn+DFgMQ+l 6rJwsvu3oEnrrBP9iw46CIRxF6YSQwGaae0qf6Nnzwecz7JC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

tainted-kernels.rst contains a small script to check which taint bits
are set in /proc/sys/kernel/tainted. Add one more loop iteration to also
handle the newly added TAINT_FORCED_BIND bit.

Also simplify by starting the loop at 0 and save substracting 1 for each
usage of the loop counter.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: fcbfaffee51a ("driver core: add TAINT_FORCED_BIND for when userspace manually messes with devices and drivers")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/admin-guide/tainted-kernels.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index abbf5e3dd749..a208811ad525 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that to the aforementioned
 script, but if you need something quick you can use this shell command to check
 which bits are set::
 
-	$ for i in $(seq 20); do echo $(($i-1)) $(($(cat /proc/sys/kernel/tainted)>>($i-1)&1));done
+	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i&1));done
 
 Table for decoding tainted state
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.47.3

