Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7888446A5F2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526058; cv=none; b=d7RwcoBl2PnwDdfpV8DsbgFckALr1bZ9ut1ZecF+zPmBknM3aqMlnNd8PHa8kXqtVmtszU+KNZWi+VBUD33KADFN0wKnjfuMEzWk6s/va5DZ+SZ7kTkHFgVi/MUqnom3GzarPW9FxDbUaZNuUVnE/P6TXUR7falieMGZ1NpEvXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526058; c=relaxed/simple;
	bh=2dgeFU4dMXanVlsum2W2x7rzNpqIqmTbXZG1r/qGXIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7R29T9hDrZXw/8IiuBtjo8M+SAgnJOEuNi3sAUVLm0zsydB+qezSTH9ulZ83Gs38KT+EZcBef1geHYABW4kTImxKkJcD7RpooGWO5LIleNAkWYCPNBbMn3J55Np8avA9Q5p8plCWHBNEwLY3pjT9OPNTMls20O1oYBTVpY+pt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sd6w1H/V; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sd6w1H/V"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc439aa0078so894928a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526057; x=1789130857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5ZNcdofv1xmkEiwkoEej12YoH5SbNFwYgfq+H2c2UI=;
        b=sd6w1H/VKf5LBrTm5ZCvgYA2nQVnxhEmxDiPWzMiQY+4pakC2A3iq9DXypPw+UWp86
         Wy3uOKICPUgHzu/HWTAKcGoAkS65R6KcRu+Ernhul0zjx3prMQhAavSvMpCCN9snYRrA
         6aSrlYykNLQqGrQXcgXPdy31Ygx1GJPdwRN7f4ItuiP7JzTmsyidAhXO/WpwtRuWlTw0
         pw6NkejJY/2LX2UhU6C7GjP5plv0mIYKtSGxBG2Y9cF5WjMhBB3asxKoQn+Er99BJxZi
         naaGtmYylZ1YMg5I+7jxk0jwZh+xUBI7H3o/17KfUgg6AfWGkwVdH/OI72QkMB9OjlpM
         opcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526057; x=1789130857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5ZNcdofv1xmkEiwkoEej12YoH5SbNFwYgfq+H2c2UI=;
        b=SE+GdpxVs9HI9+GbszfjhhRGMhzKJdcrEKYfHBcRIpVldA2MLH4hrdeBNKybRbCnkq
         z8hKa/1wiYkh7y+CEks+np+RZtXhLHd6/67yfjDvEa9LC8nJgwaHVmkg4+cRegwVCiSO
         7BjxN51F2P/T75+7/LQmJMzcqBcaldkaBt1q+Y4jKA8qxetosUXtDceKypancMYIzsjN
         RkQGhB/qRpz9OKRogtzt5W6xrwMzwHWYJk4xb4frTedx2mAHxDNYWVdmPC5sVidXDhVi
         B4xvm7Cg9eqQvXtGaaT33EueMDngzYHC60QncCKw69aB4gPTbQdbjxd7UBzwdfQBp82x
         1xpw==
X-Gm-Message-State: AFuF++k6zqL4prvlxr3WTgXgNWEj73MOIhkDIF/raCvAbVTvqpAw3Vw4
	Dqc8xh0eypuEEO//QRe72PtD+YQMEvnacXJKsrHCLut0aIYbPnt8l0Y6
X-Gm-Gg: AYBFou1WLOIhlaqqCfIeyEZ+HxhkFY/WWFZBm/8N8iQbNAiR5QskyqWunWgVU3qC1sZ
	1q78aC19fXgq33ZuJ9vzDhQOBK9qCqDBQBLWt02VeFqVTfEUcv+hQkd3cxj6vEFAbflZt3jkIjv
	A0dxf6e65RqJ1pLO0B3NTIiB1ddhLf7svbS5FiueNxB7Wxihxvj4rDP+ZXLwqm1hU1jDjQJ+bLp
	RpxTmkwyK8gQsIPP3FLYaE3KeIY8lcEr5R/xt0759OAe5YxxdSekccurIcW38wwRe+gCgns0I7O
	EHRe6Xu9Tx5qot8WqN+qs0lzP6gW9i3vrE5PJlF68EcpnmY6KO0KFaF64/LuOKPbpdXE8cQzT1v
	eK9SP1Js+jC5q9BsBIXeuD5IEf1yMtnjHNdXs9gtcB7l9oSwu8IlUotYe7FTne9+e71tClKEwTI
	Enw+NFhC14rl0HXw7nquU2gdKBW9hE89veUZRoDS9yzofg+PJvY7xbcjBRMHrw/oU3lOwoA8How
	5MXhTFhkBWFSlA=
X-Received: by 2002:a17:90a:d003:b0:398:ba9e:75ff with SMTP id 98e67ed59e1d1-39b26273a40mr9681789a91.21.1788526056610;
        Fri, 04 Sep 2026 05:47:36 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm4553800eec.17.2026.09.04.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:47:36 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] mhi: fix typo "intented" in comment
Date: Fri,  4 Sep 2026 18:17:30 +0530
Message-ID: <20260904124731.9011-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "intented" to "intended", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 8616bacd8675..65e8a397cc50 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -687,7 +687,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
  * Resume the device irrespective of its MHI state. As per the MHI spec, devices
  * has to be in M3 state during resume. But some devices seem to be in a
  * different MHI state other than M3 but they continue working fine if allowed.
- * This API is intented to be used for such devices.
+ * This API is intended to be used for such devices.
  *
  * Return: 0 if the resume succeeds, a negative error code otherwise
  */
-- 
2.48.1

