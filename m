Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8D3DA7ED
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168095; cv=none; b=t6dOF5XyQy2kAoMhv38ml+73vx1uyUKl0dYohC4qiMeEc2Dz9hTj04iUOjnzShctqYMWlxiCP9aDErrbL6he67RmxCMGf1jd7hssqvFjGC0GLKA7+mrSBo8/PECzlQEeM4GyvgjIHurGVef4uPXCKtlhvvAA30ayUzHToIW2o3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168095; c=relaxed/simple;
	bh=3gArK77n2NjqbVaBq8qIADTWaXLArEqot7z9ZOmx4yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXyL2WIcRUQkK18uju/dP3GMpw9DNQ7Q7qbUgXsTvKF0J2Xvj+pWGpCweihmRY6XqKmnN9E/7dLjzgGNncApBX8f7c9x3MEQ+plmWqABDzoFVhHxQSMoMh2t3n1bgD1DemeKtUlwneKsS9ntV0VQt0mDs+YBBCy2cPOaPy71Vdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BiZca74z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BiZca74z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so24643165e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788168091; x=1788772891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CP/iU6/taW8ol4SzNq6xLRFo/dhj0C8jDaKht8KXEfI=;
        b=BiZca74ztjsVu2cr9YNAjKEC/XBjLvu2hBU2NCmyTIh+rrqCeA1BF/EhbHHjHpadhB
         tVx+U/pxFdV3RV/1DNvwPrw0p1d8AGev5ilCdw0r1/aVtcgivX1LdEReplRi1LoKmgeb
         6/rlLEALbVBkcOZyghh7ETwzDH7Iulzk/hmPvCPDa7s84hcOBZt5RJGhxx4JBK3SJFyo
         qY2JiPsplV5c1m0+YbD3CuEFhPVlD8ypMnNDF3VnijRRyHdbM/lzBX+KV+1F/ZipDkiV
         io1/zJFxAGWKdIqiBrK7681HXsJuwNvZIzlIOOhnR1xTMblntRz6fxo6nNh8k6mHqd2e
         g/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168091; x=1788772891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CP/iU6/taW8ol4SzNq6xLRFo/dhj0C8jDaKht8KXEfI=;
        b=bQJvpInAd9lsp6q58Gu/EKgVElE14wPMPBADsVW6Tp3pFZR4D4d9oE/CYi72/rrpLh
         LCGLhB8QM1zUtYqvraH68m65zqO0sM6nRrxw4Dzindnws8VhVkZQai+lYw/ollP7nDfm
         NzMHpIw2gFME8296x8NXESkZs+8V0TiOdV9Hn+2ObgMIbBYKsaadImzi11fQUawejdVm
         aX/wAx4TlUiGy1bvAV5XyJotF3rloK+gr5BZiSmJj6D8ImFiO5jrk0C8RQFO1bsB6ULB
         gOcYLuaSJ0kqzdg6CzweQwJJacg8vfGRI30zFplDau1R2ZsJrusZmwyjD+YDLhKDrxsV
         stmQ==
X-Gm-Message-State: AFuF++mL2yYg7SX//BD1wWYBieXjwkNLfQfCzVJ7i8uWd2jBWtvGFQWC
	yKPhEkZqCCdQT8oMms0PGzoDXWNKLFQq2Mj+COGR32mzo6dBGM2xvcllaNidzSR6zagAMAox2lp
	wRlsiaF0=
X-Gm-Gg: AR+sD10i8YS0TuWYmgQq/ISjkcGtUkc86zvnXVY2n2sOGVIza3ffEED6kGkt65Zm5wS
	oE5ppdyzFb6hSjJKGMK/EB2DDzh2v7AeVAns7me33958fEV4L87z1nU58GLfwptljDKluGXx5df
	JGofvvfM8SeyfT4KwRxy84uJeGSBCSLJFNDRV0DkbMJyTG8INqTMWbQb/22gE0uYYS87pDCwzRu
	ly/OujtPWEfa06Ob4XHW94uUmQZM0Zw1em70V6kuD3X8RcYKuy7cRB+Gu5RVh8bvr69/P7upe0Q
	ZHo2cFVBfeGFgQaP320lbsUbjE0iWUph1QOE8hsZn/PaQPcQKHWyMYYQDESsN9IMxGmIV8u+D4T
	s2mOL4/jTq3ZdZfM4Vhkbbw2nSo9wpNcDDmXBgSzxxRXOkSx/8jDynEurY+5ilpWfxqt1gTDnIg
	1esxTXaz/Ic2OPBrptEDOu42ZzgyFtYFgYzxj86OiXKU6ReDpncLB3W7c6osEwtpi1fRtjSciLJ
	df8ZrKRvC/5yHD9TqMrmA==
X-Received: by 2002:a05:600c:c4ac:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49b91c20e36mr366838225e9.6.1788168091576;
        Mon, 31 Aug 2026 02:21:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm150432695e9.3.2026.08.31.02.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:21:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: [PATCH v2 2/2] Documentation/no_hz: Change dynticks-testing repository name
Date: Mon, 31 Aug 2026 11:21:13 +0200
Message-ID: <20260831092118.124576-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831092118.124576-1-marco.crivellari@suse.com>
References: <20260831092118.124576-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the documentation still mention dynticks-testing.

Recently the repository name and the tool have been renamed
to cpunoise (see link tag below), so fix the URL.

Link: https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellari@suse.com/
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/timers/no_hz.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 7fe8ef9718d8..dd624b7c3f42 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -206,7 +206,7 @@ something else is in the way?  This section helps answer this question
 by providing a simple OS-jitter test suite, which is available on branch
 master of the following git archive:
 
-git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
+git://git.kernel.org/pub/scm/linux/kernel/git/frederic/cpunoise.git
 
 Clone this archive and follow the instructions in the README file.
 This test procedure will produce a trace that will allow you to evaluate
-- 
2.55.0

