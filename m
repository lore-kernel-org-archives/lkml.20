Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBB43EF66B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632340; cv=none; b=IZz6ZH6JDYgNq1an2kHBWIWtfRQjWF+Oe+KQnUArM3P1NzGsk0CwoMw0cFtSwNFK5vwKRPylhZ2gWaThoBPUY1uqousTRuvcvBWbKlStd2YLVDqlspHrNSw/mUcTuj2FqnDsCzDZpzMdqaB88MSwEm7DuWle7WaQKs4h8NTEg0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632340; c=relaxed/simple;
	bh=xbNh++XQiWtRJNC/Pfp6Yx3n0zBaaV4fhg0wByDIN9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bU5xx1bHlENp4X7IfEPNDk/45l1GQYvxKelaD8TbBJT+VhMS2ia50qeUigMCqei0rycQtOB4ZDAYK5Qc1WTXCXwc3DMOaP9SeD9ZFX1abc15WViZqnM3qMjqF6LYTbZwXwXKVbyirL9oKYighlSiO9JHfcAVxML5RxyTeoDvIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jttrZDbC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jttrZDbC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so456426a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789632333; x=1790237133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlHGMGQLKjtkoZ20RXH6pvWI6WX3arGtBMs1RNDDLiE=;
        b=jttrZDbC8eE5bVVslsUjpQtpeF+aZckomtF2jiGJE5K8Z0GU0/mMz9BvthlH5+EEOe
         g49di3luxk6+IfzO4bAMOYy8dMvDK6P1P6GQVM54ebL2ldCqbYWH6GM4ExgjEcC3lhX2
         uT07CqefGUSfCU+1nm7vrYlIAdMxFsWA2b5AKVlIFcGTveXS8wZhP8BaAUfxLLM90Z9g
         6/MbJl5mm6UFCz6Lqz+UpclAaaxt3uv9uPuxLaKvoKRsEfsEz7WedRCu25JHNc3hICsH
         mA0NgNdbn5CR1wuwIbO/QjVfDXCHtqQc9sbW8s5+8GoaYbRXBcHxgpyfMdn/wWamCaOo
         Hcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632333; x=1790237133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlHGMGQLKjtkoZ20RXH6pvWI6WX3arGtBMs1RNDDLiE=;
        b=sQgHgtswHounhXRTJiXQFOFOupgT2JKAi4pMKkOxpD+Y47LQAjKdOnNy1Hoyy1LBQT
         m3816l7e+7OK21qfDMUbQPCEdedzUagmlMcMCfNXTJSmG8Rw+4Ut2SqAdCHXSaqRy9eV
         +UFfEWDENCMVA0qnNq31NoqxUt/xpTMFuErKrFYnFGOMHcMBkGYDpcPCOPAM9/85bk34
         17deo8YIMP6CJOP7eAhSt5u5bZAWCFp868tnA63Yzl97eJkt27nbwyHiXp8L5rJiuL9P
         xCKApV+gHLCAxgt9g8n4tFrt4zNWYrcDY4WN68N11a2+w0/XqV3t0J0/atDF65cWexPj
         k0/g==
X-Forwarded-Encrypted: i=1; AKwUvBw95zrb5FJWcnbQXiPI38w/DAlEeXJ2vq5Cq88fQhpN4zFuUIt1BWEXBjPBekTfKNNeiOx9c6JpC/0EjYg=@vger.kernel.org
X-Gm-Message-State: AFuF++n1/30MWjSDYQjsRQV0mEu3Lu1aKa94w4luQGX/PeTYzdPP0iei
	renhUOW5Ljsw/PWSUpI1rLP4zY4E6/y2AWm4OKziL6YO2VyRVPQZk7HwftHkhQ==
X-Gm-Gg: AYBFou0gnf8rtm13NAXGGioeEpOM8Vhc/vA5Y2cWwp7IkyQmLddz4xlEd74NuGy4J/l
	1dU+ZpbJUwX1tpYii8zVoX3gDeY+1FyEI+KA84MSy1Q3yg/BFsUD8pwcwlJBHC78v7eCF4sjUGA
	yb0WVK4u6KGbzJzYCA8Q5mPrkNY6Ti1D7Ks1aOO2x1zv+A1i3J0bMoJHxfaOJuSBj5SnAwNNmzd
	P2WH8hbTRbdOtZzgp7g8rfeG7Ee3iJMmaQeLyv2uxgNyT7NI24EteGO0eNUHPE7D1l2V+Yo4GUx
	0YfP1xotyKn1WZRF93YW/mOjQ3+SDK+sGBOkTYN3lmvLtxoz0Foab/l/jaYhwPavgXrfz2DgWLk
	1M8j5PM4QF/w98qT3jEBU62v9ss/2IkVIApyaj4b06EzN9H6fq/0uWzzYrx6yIKpDJtUNlYDfk5
	zcNKgKa8f+C1+4InvPJteOLvHlgHFg9/eLRxQikj8FJcl0vTYzm7GIXzWxToXVn4Qe2vFxp8Vuo
	1DkPi/P+DBhHpTw/u5mmw==
X-Received: by 2002:a17:90a:a88:b0:39e:24ab:9f82 with SMTP id 98e67ed59e1d1-39e24aba6abmr6998190a91.10.1789632333162;
        Thu, 17 Sep 2026 01:05:33 -0700 (PDT)
Received: from localhost.localdomain ([103.178.204.119])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c13f09408sm2723056eec.7.2026.09.17.01.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:05:32 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] nvme: auth: validate DHCHAP secret before stopping authentication
Date: Thu, 17 Sep 2026 08:04:24 +0000
Message-ID: <20260917080424.3544-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently calls nvme_auth_stop() before checking if the new
secret key is valid. If a bad key is passed through sysfs, the key
parser fails and exits early.

Since nvme_auth_stop() was already called, the current authentication
session gets stopped. However, because the parser failed, the work
thread is never restarted. This leaves the NVMe controller stuck in a
stopped state until someone writes a valid key.

Fix this by validating the key before stopping authentication. If the
key is invalid, return an error immediately and leave the running state
machine untouched.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/nvme/host/sysfs.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 02a2490a9ed7..d6512b19752d 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -825,7 +825,9 @@ static ssize_t nvme_ctrl_dhchap_secret_store(struct device *dev,
 {
 	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
 	struct nvmf_ctrl_options *opts = ctrl->opts;
+	struct nvme_dhchap_key *key = NULL;
 	char *dhchap_secret;
+	int ret;
 
 	if (!ctrl->opts->dhchap_secret)
 		return -EINVAL;
@@ -838,16 +840,17 @@ static ssize_t nvme_ctrl_dhchap_secret_store(struct device *dev,
 	if (!dhchap_secret)
 		return -ENOMEM;
 	memcpy(dhchap_secret, buf, count);
-	nvme_auth_stop(ctrl);
+
 	if (strcmp(dhchap_secret, opts->dhchap_secret)) {
-		struct nvme_dhchap_key *key, *host_key;
-		int ret;
+		struct nvme_dhchap_key *host_key;
 
 		ret = nvme_auth_parse_key(dhchap_secret, &key);
 		if (ret) {
 			kfree(dhchap_secret);
 			return ret;
 		}
+
+		nvme_auth_stop(ctrl);
 		kfree(opts->dhchap_secret);
 		opts->dhchap_secret = dhchap_secret;
 		host_key = ctrl->host_key;
@@ -855,8 +858,11 @@ static ssize_t nvme_ctrl_dhchap_secret_store(struct device *dev,
 		ctrl->host_key = key;
 		mutex_unlock(&ctrl->dhchap_auth_mutex);
 		nvme_auth_free_key(host_key);
-	} else
+	} else {
+		nvme_auth_stop(ctrl);
 		kfree(dhchap_secret);
+	}
+
 	/* Start re-authentication */
 	dev_info(ctrl->device, "re-authenticating controller\n");
 	queue_work(nvme_wq, &ctrl->dhchap_auth_work);
@@ -883,7 +889,9 @@ static ssize_t nvme_ctrl_dhchap_ctrl_secret_store(struct device *dev,
 {
 	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
 	struct nvmf_ctrl_options *opts = ctrl->opts;
+	struct nvme_dhchap_key *key = NULL;
 	char *dhchap_secret;
+	int ret;
 
 	if (!ctrl->opts->dhchap_ctrl_secret)
 		return -EINVAL;
@@ -896,16 +904,17 @@ static ssize_t nvme_ctrl_dhchap_ctrl_secret_store(struct device *dev,
 	if (!dhchap_secret)
 		return -ENOMEM;
 	memcpy(dhchap_secret, buf, count);
-	nvme_auth_stop(ctrl);
+
 	if (strcmp(dhchap_secret, opts->dhchap_ctrl_secret)) {
-		struct nvme_dhchap_key *key, *ctrl_key;
-		int ret;
+		struct nvme_dhchap_key *ctrl_key;
 
 		ret = nvme_auth_parse_key(dhchap_secret, &key);
 		if (ret) {
 			kfree(dhchap_secret);
 			return ret;
 		}
+
+		nvme_auth_stop(ctrl);
 		kfree(opts->dhchap_ctrl_secret);
 		opts->dhchap_ctrl_secret = dhchap_secret;
 		ctrl_key = ctrl->ctrl_key;
@@ -913,8 +922,11 @@ static ssize_t nvme_ctrl_dhchap_ctrl_secret_store(struct device *dev,
 		ctrl->ctrl_key = key;
 		mutex_unlock(&ctrl->dhchap_auth_mutex);
 		nvme_auth_free_key(ctrl_key);
-	} else
+	} else {
+		nvme_auth_stop(ctrl);
 		kfree(dhchap_secret);
+	}
+
 	/* Start re-authentication */
 	dev_info(ctrl->device, "re-authenticating controller\n");
 	queue_work(nvme_wq, &ctrl->dhchap_auth_work);
-- 
2.54.0

