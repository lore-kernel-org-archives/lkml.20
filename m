Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D5D3AA4F8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520043; cv=none; b=CZxcvqmGquMvdSJc+tHshhNAc7eT0cEiXgg8HqnR6oz14vzoHmtVoM4t/J45GbTOgIR/h1Y6hfoGOHWKTp5wcPNjQBb1J1QR+yIWnexdMJZ+IlkzsAUtRHq1igQh559ez75MQNS8ThrU9pnUJlHIOZJoNJ11ufpCwxJ9TgdqzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520043; c=relaxed/simple;
	bh=WsyJHW1clZ8iKOOVdJ3ec2qpn5XWVAQgC6D1tlBvu/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9jV/uGCJen/Bkg+4WAsILeN1/YXT3cSv4YVQQgtKRSymIH/FUzpw8WxLI+K3kmSCG0omFmoC6fYGUiD0YDJwopH+wymNrfuIARCQeCAXLQY1Wx79Tz3kV0kPxslKanIHW4J3NEuR4HvVL8fjpj7tRmFQ2lFpIzQBx9wvGOwAa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHTz6Qdn; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHTz6Qdn"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b13496112cso683072eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520041; x=1789124841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=67sJRcIvyS9+alfNbLSeAD3FZ5gx7L7BGnwp5aAPOi0=;
        b=tHTz6QdnNJqwcuht8UREcQiNzVKNGhYOzO058ExUR2MMqUBB2ZrGtoAZJGaoEpcjyx
         xDTlbG5OFSfn2hHGSoX58JKVRgMStYD4yz8AfwOY7bW6tR2JjC2pysYsILMRjIqKAr7j
         zBMz4yjDTIQnYjs1lKo1yUtvK9OcffcKKE7Il2sxalvU26/TE1x6y7PUxVbQu/qZ1WtM
         hC6ayf1hHpFblcXu2oJkxYhseNxUVhKtmO1HVNis0JClSTnFYr3fLI0eRsZyPsVjNkPx
         0hlta1xcfTJrGRJMxdecNcq2VE0O2c4od3aG/oJh5r0wNfjVdjk0TFrk/eV296g55UoA
         WuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520041; x=1789124841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67sJRcIvyS9+alfNbLSeAD3FZ5gx7L7BGnwp5aAPOi0=;
        b=qfXFNhw7dyskGJXhqvA5Gfnt0JHbmT4v7zy/UCxPXvqhSzsdELsE4GCHe/IK2ebV3A
         8ycpvB+geknrW9/1aPOYPfka4sdIxFwLTMLIWSXdjQqPEBb2vc3ftgHWmy6slx2787kW
         NYs0uPMe85BURJOqM83DRwdekargU9euhEomd5T6k6PclXzGTMfQLxtph66FHKX8ab/i
         Ihgsw6OWodP3+vozUwcsX4dg1ktQdJOpwOPrL9B5R07OF7AGDGbwaMznGrlgvqyu5YaJ
         tSVKTsZzU5Y+mCy7PTQZENOS5llOPnAM+HQNgzDykTkJI5lZvxlzroyvB75dLZSou2RY
         iZ7Q==
X-Gm-Message-State: AFuF++l38JJ/sfxz85eUx//k1n+N3RdT1YxycvK5fO7HT5BpgLjEiN7o
	JpjsDP1sH4+xd/vpiRKpKbmnOxc5cMu+N6+gcl1FaMcBBcfhYd2fDmzl
X-Gm-Gg: AYBFou0WNSQG9+5RZlzK858SO0YVQawp5r39KZ60Z7zx8mq4rN66vCkpb1j/9wZIWa0
	qJLMLLkxrWt99R7CQp4HdyGMryEADNEMsHIrWRCB/aU/gY0qEVqaVcKwJabxFO5EWQVMDYPxlsX
	iSKjRC4a7A1AJXoT9+8adPCMQFHLOeE5+a6vJCz+fBNpyHcdzxaezCx3padOzsh7e2QUJSf/qnX
	auOmxpcZhG3JsTdGsC+I66wv+nmTVJU9rLuqkYwBesKbcQy7l+E+XL4SXPoalfYckDoX4UEDgJP
	ZC5gqIQ9+2Ss97yxgt0GvhFr7c7Q3wCqt0qAk+3BNQUozYAi6PelWPA6+DPn3RZgsxKqPrhFXuZ
	LnCCkzK7DZH9TLrbQ1JSIKB159qjSUFpcDLJ8gzjgOUXR8aOtCpwRVwHEoBReZlJZs+k4YWNKzy
	j17T45XwqPgtzSZEDgwGRFOmSTi17JiVVIKAm2Pl3bEt9jqQ/VYDr8r9OtJhNA7ubcDoi5m4C7B
	TZyS7Ck/xxeY0H0eEOshPSmSjc=
X-Received: by 2002:a05:6820:813:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-6b746fa1a49mr1990618eaf.40.1788520040539;
        Fri, 04 Sep 2026 04:07:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm5588331eec.18.2026.09.04.04.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:07:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] devfreq: fix typos in comments
Date: Fri,  4 Sep 2026 16:37:13 +0530
Message-ID: <20260904110714.18123-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/devfreq/devfreq-event.c | 2 +-
 drivers/devfreq/rk3399_dmc.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/devfreq-event.c b/drivers/devfreq/devfreq-event.c
index 9e183cd8818c..ba0a5577c775 100644
--- a/drivers/devfreq/devfreq-event.c
+++ b/drivers/devfreq/devfreq-event.c
@@ -161,7 +161,7 @@ EXPORT_SYMBOL_GPL(devfreq_event_set_event);
  * @edata	: the calculated data of devfreq-event device
  *
  * Note that this function get the calculated event data from devfreq-event dev
- * after stoping the progress of whole sequence of devfreq-event dev.
+ * after stopping the progress of whole sequence of devfreq-event dev.
  */
 int devfreq_event_get_event(struct devfreq_event_dev *edev,
 			    struct devfreq_event_data *edata)
diff --git a/drivers/devfreq/rk3399_dmc.c b/drivers/devfreq/rk3399_dmc.c
index dbdce7636ca5..2cc753fe30ac 100644
--- a/drivers/devfreq/rk3399_dmc.c
+++ b/drivers/devfreq/rk3399_dmc.c
@@ -189,7 +189,7 @@ static int rk3399_dmcfreq_target(struct device *dev, unsigned long *freq,
 	 * Check the dpll rate,
 	 * There only two result we will get,
 	 * 1. Ddr frequency scaling fail, we still get the old rate.
-	 * 2. Ddr frequency scaling sucessful, we get the rate we set.
+	 * 2. Ddr frequency scaling successful, we get the rate we set.
 	 */
 	dmcfreq->rate = clk_get_rate(dmcfreq->dmc_clk);
 
-- 
2.48.1

