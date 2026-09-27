Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9A3CC310
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496217; cv=none; b=q23MtnRx2xdfl+zz5JJwmFZOs+t4v1J648HfVZUeBjmCgCWg38PuoVURJ5KrPRiMVsm60rMI5+Q9zlLUGTz8YOpoxCFdrwPZhiq6pUxHM5KqsHHWEzYhLye+ezHqelvmynYGHsxtC7MmR0FcHjvUIA8Vuo3iFQvWpNPhytc3w/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496217; c=relaxed/simple;
	bh=5JYRdb5CubIKord83n51B6HshJXJEfaqJZWg8t5lUxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMjOo2LxUmDjEwc8ZSHqOB4q6O7/fGFrYi6geaQD9s+BPt1JCHT3mUVEN4HWrdsPkcWikf+2YuG/7zYU6bQMk0AZbzyI88t5BSFKq/wRgKGlL8wxCJvD0UVDAyXv3sw0SSc+uRFjTx0nPNaXQs3UMN8Ofp+tVbyPHHaEtu4ZBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PiGTFctV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PiGTFctV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so24178805e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790496213; x=1791101013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hBW+H2pM5yXqy13aycas8629K/W3qz4NR3q6Vfp4ik=;
        b=PiGTFctVabEddRVuH7EdE9aohoKBoxDHfKwJWFYgd25O1N0skT82mIfzNF1+fVmm3U
         Fhbzs+cRi3GZ/KCcsbbMAqoUJ9uI1aNH94NiIC2TadQ3lN5d2SPxckVKiRa/5a1Stido
         Yd81ShMoOZkgHQl/2szvzgepkr2q87dONYHp7OT8RmCncgCZkxq6goV3bZCEJ3F9XrgX
         UUkufrEsSIUA8FeBxwTH/ok8E3yBPbZUM0ty5EHjL8YkN9d2xQ6T8crJOamfkcAQBqDT
         EvkuGHLZRXiO1Sd12f16FPWusxilojH6hJNK741yBMaJkYcCXftfpC2Gh7MQU/28HRE7
         PGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790496213; x=1791101013;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hBW+H2pM5yXqy13aycas8629K/W3qz4NR3q6Vfp4ik=;
        b=CeEPVHrJV3jV4r2Jr4aTLSqeIr9S8qzU50+pgPi75fAub712ha5sSuFEmRMlKywlH6
         Mo1aqtnDvvOpFN7Jn2LwhmAvW0GUVql9Am+xLpDB48lyWnHflxbnJUGu69p9iFZtYmIm
         mhCUFwti8JwuBbw61ldDdKUAuxvlCBR7zymDr+waFJLGIgtvOHhfwrfx4rsNulyg+0+c
         MlcNmHS1mCdkl0jbdco9OsdpNbg6bKeLuFsM4k8rZaEcuqeVRXuAwjb943kDO9PC7DZT
         sdGpuxGCFzexamuw9xTccBSX3RQ7phYHbvyCjqACmT4bpmGlE0HDYKFRAw+Dfk/I/2Q3
         IgEg==
X-Forwarded-Encrypted: i=1; AKwUvBzd9U813BlnI9TmYkkPTdNVT9/SAgPtB+ABjb25RNx5YXbAeBRr1WRAFi6Qs+ZG3YAQdgVdamlYQ7Lgwcw=@vger.kernel.org
X-Gm-Message-State: AFuF++mkaV1Aj4yRm8YiIsWmIUOEIqdRAgBZYiVMmSN+/xlh2wnRQG0Y
	GTX30ABPNtRjhJ103J+A577gpL6NmQABacXyVbJ6z4eUF5QdUgb2eN7nzTJUoD6FWpc=
X-Gm-Gg: AYBFou2SH4pDGhZAnWLH1dIlRF8rJq2pTYOU4x9h1aog66cDjqDhUHSq8LCs9ol6hVX
	A/Dp+z80GFSH16hnteWhVQOXinIs1B1aBJLaigGrxZEMfCToEMZpEeyjs60xZnAGYQUo1M6KZKG
	nzvytiDK0TKZyygZYGF+up8XimVrgDDZ1A7tqLLybm6y1VCyjveT1hRh19xdonKF/p0XWQbBgIa
	mQKsqDfQsGJXKM2RKhIu1z+qvJMyt+3pyrVDlComSYNquNHeWRIBuHKYFd/wdFzuqCb1BKY1ZXH
	xGCWH/9sqNN5AxyDUDtFy9EYgAGPillEBMNLGOTtSsnR3pPsH8zNxYAT0Sv2wLUN9E8F7k9ZJfC
	nkEOAzCS/5H8Bkw+N6naOWWHPFQ0Yc1QL5Y+sFJ7QGkoY01eFM51opiLOObqlRnwO5mSQ03hWRV
	5MWFkuiHRYFpuCzRmfVKxWYsulA+8br6kvnTT0uaIekwzF9oy6hiHJHA0cYJ43bi3gGmm+JT+eB
	nBm
X-Received: by 2002:a05:600c:8b34:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a000b647f1mr21695095e9.0.1790496212803;
        Sun, 27 Sep 2026 01:03:32 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fef4fc959sm168298325e9.2.2026.09.27.01.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:03:32 -0700 (PDT)
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
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] docs: admin-guide: Handle TAINT_FORCED_BIND when parsing /proc/sys/kernel/tainted
Date: Sun, 27 Sep 2026 10:03:14 +0200
Message-ID:  <4f89ceaf98172dbfb788832ad3204c8739653b31.1790495516.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790495516.git.u.kleine-koenig@baylibre.com>
References: <cover.1790495516.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5JYRdb5CubIKord83n51B6HshJXJEfaqJZWg8t5lUxk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBquM3G+ZFB5imtmjExFcjHBB3VSXhHLpkWC9Tvz 53VfMyUYnuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarjNxgAKCRCPgPtYfRL+ TuTOB/sHd2uUsDvxA87zU7ZGmE50LoJsMNGwmO1PGLn/QY+HoFqdCO7ZPk+vSUIZbJnipa/8TNp ZZQxbZ3SqpGrJX5vJcs8g9cUNmz/WVjEHHenTEPMzqq437IsNUOZOzvfAQMINbzHsBcxRsK8SJM 6Ht/z3nX6+63uD+cUOCnYt15ZZtsElFXcSVRRBXCMpX2BvPHDBakZvAq23b9tqHzDuEJv+LFQCW CE6C1XbKcireXUkoPgQz8M7Z/cMlzA/vTSbz0AaaHCZUruIVofHd46aAMAlAO/iJpi0HI6i0Wjt jf9JesveFpqosl5yyGQPcbBXqJV/jtBAqg3EM8lq55jKMleJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

tainted-kernels.rst contains a small script to check which taint bits
are set in /proc/sys/kernel/tainted. Add one more loop iteration to also
handle the newly added TAINT_FORCED_BIND bit.

Also simplify by starting the loop at 0 and save substracting 1 for each
usage of the loop counter.

Fixes: fcbfaffee51a ("driver core: add TAINT_FORCED_BIND for when userspace manually messes with devices and drivers")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

feel free to squash this into fcbfaffee51a without author attribution if
that is considered a good idea.

Best regards
Uwe

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

