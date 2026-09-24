Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317173B83F9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261915; cv=none; b=q1pu+TfBoGyax5lZb3DsUVMNV5NS6rJtSqZaumr2i1Iax8fNQeiBhOCJL4epx65ahnwv0dY6RSaR+yUhL8o+5mb9P2ySt5Cjw+FVmRTNMPCmeEF3MTHwlS1dc+k4w1s647FPIhBhmu76aeglMlpEsk36iH7YKMCvuIUpRnI2QqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261915; c=relaxed/simple;
	bh=e2G7J84G1D4XCfSLdP3gUfTkL5hqpo1OoPHtnVanTCI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oU8nwizeocFQBLEmP9e9xYNlvR+HoQVLXKV1W77axnrfZDVHmbvaKuoC0t4FPJ5mKPPY0MAi5paKW5i4c6syFEMcXdLc0GSQTqoE3JjesWZBO6TFvf4zu0x7StX887ep8680falNc1KNdW4Co7n3YEOylRNrcKtdu9Tw0NvEpqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pLvkzAZN; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pLvkzAZN"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e65f2f1baso20656795e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790261907; x=1790866707; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vM356NruxwMMdbIb0iHJaJTYDI/MzfDme3zT783DwBE=;
        b=pLvkzAZNyoUzqoZCbRSt6bQnN0UniSb5igWj26j2J7itpiDfUD53ny6tTZ0UT8cxyM
         TJtnNtzW0mNJwuok9QmIBYa4iDrufqmb1a+zqK8NuLt71mRIqoUd5UiDbUyFLZ6hRZoH
         nY9hyCCwiOZ+OITR0f2O70Anr2zi2Nga7hoEH0YpYHyqoKues5aBq1Mjx0zsRvIo/bBE
         hbGRo3WJ3J+GabriMM9f9MgFKmsqmK1hN+H3mXC2EI+7H1ziUBlbyDuJO/f5cjBS3V1G
         F8937akE4qBfzJb9QZrXf/vGRVrz+xwlIJq11/0if4kdPMfj+kNkewSDSAorCIpzHkVz
         wFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261907; x=1790866707;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM356NruxwMMdbIb0iHJaJTYDI/MzfDme3zT783DwBE=;
        b=ADKZ2qmZzPziHHSODkwIAyyKmAmuHNxhYVpFMI0EWOtiYGGhaghuHRxgA2rN4KNB+h
         V5ZNEfT6QbhANHU7XcmfkVWQBZ4Wh2y5mDJXKVJ+PUzTHPHJ6OP1D98Csuo9HISFd4UE
         q7D0PHZbP0mxY4e04iIrVZKDACc6PtXfgpBkBiRcZZV6eJ5Kk0eY+q1JjXLPX/G1pLei
         KR3DmGSaq3zQlW0p0Q2YpAzbtytf9HaaKSUGGUW6WNqUDFMCReQnH13vK3HfbT4AXrom
         5wX6lfn+ZkZw9kOlBXRbuDApUDEDQQdfahx6Mv7IY+jhqBX2mSa6/PNpdVUIMYPIshd7
         hx+Q==
X-Forwarded-Encrypted: i=1; AKwUvByyH12954oCVToXJc5NsLJoKT0xE40CfiuWWrBQPMn1eQFusbeVc/DJhtI8bIBEbQN2vnhTD08ysg/TDDo=@vger.kernel.org
X-Gm-Message-State: AFuF++nflrif7gT3+b9BMXqSStgMiQZnxBFgD8d3S6Scf9cJ/CDDnW/M
	FuLIku//2Wa1f4PPbPnS8XE5y3iEzn9VyBqIhG222H4jsl16hlczHRRn4QVKZHeydCOLKSElROo
	euCEzGgUebvNS0+ju2bJepw==
X-Received: from wrbda3.prod.google.com ([2002:a05:6000:1963:b0:488:54c8:2f06])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1546:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fe66f4f59mr48865125e9.23.1790261907159;
 Thu, 24 Sep 2026 07:58:27 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:57:37 +0100
In-Reply-To: <20260924145754.1285146-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924145754.1285146-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924145754.1285146-4-vdonnefort@google.com>
Subject: [PATCH v7 03/20] tracing/remotes: Use kstrtobool for boolean tracefs files
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Use kstrtobool in trace_remote.c where possible. This is more user-friendly
as it allows a better variety of input strings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index a1b84290be2d..ae22d13308a5 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -235,10 +235,10 @@ tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t
 {
 	struct seq_file *seq = filp->private_data;
 	struct trace_remote *remote = seq->private;
-	unsigned long val;
+	bool val;
 	int ret;
 
-	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
+	ret = kstrtobool_from_user(ubuf, cnt, &val);
 	if (ret)
 		return ret;
 
@@ -1151,10 +1151,10 @@ static ssize_t remote_event_enable_write(struct file *filp, const char __user *u
 	struct seq_file *seq = filp->private_data;
 	struct remote_event *evt = seq->private;
 	struct trace_remote *remote = evt->remote;
-	u8 enable;
+	bool enable;
 	int ret;
 
-	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
+	ret = kstrtobool_from_user(ubuf, count, &enable);
 	if (ret)
 		return ret;
 
@@ -1235,10 +1235,10 @@ static ssize_t remote_events_dir_enable_write(struct file *filp, const char __us
 					      size_t count, loff_t *ppos)
 {
 	struct trace_remote *remote = file_inode(filp)->i_private;
+	bool enable;
 	int i, ret;
-	u8 enable;
 
-	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
+	ret = kstrtobool_from_user(ubuf, count, &enable);
 	if (ret)
 		return ret;
 
-- 
2.56.0.rc1.310.g51773c2048-goog

