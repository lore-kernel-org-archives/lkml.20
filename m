Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891403;
	b=x3kqvIrbfxpGvCfjRRTF0OlwlrYU05rBFdnH31oNWC6cyFqvjKwJ25W+LVHb2JH6tVO3
	 h2ubVQj0DiCpkjZPtLE0e79g59J0oi5bw7kJv8ArspN3FcSLsP7J44OYOqg8l/iZ/BkJ/
	 FFkQ0ddZC7csjZdA2sblT1I+YfCFYN467m/tF9ATIB3v9LqrxCzvMkQaTTSJVR2jZ9Olv
	 mlboiCtjDrA0M6cU/8TL9zzi/NBgy/Vkw9SA3IHmNrxA+/wSm+5HQwFjf5SxVMPWxOLGX
	 bzI/AKQ3qlp8DS9wjcuzzv9I81nTz99EGuZB5mhXF9TUyq0zOYPP3rA3hMn7LOYcjsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SONjZYRv1ckGFmSfkMm2m07etEBBhKJvU29wRk5CmFA=;
	b=2A3NsYR4/pkgFCc78QS5GtgC7vjb0QyDkSgjNugOw3cSiET+r859wLcC/Zv90JKJjaP9
	 tzziaHRjrGEZMDI9Pbjz5a6A3pxGYXRP+DixQ9RmOwqbWACpbYDgeyt1tPQFnfcgQHcHr
	 /KdlcjNVcgcSDYRIzOId8dUVmdUayDN+GlbcR8rizXtH/SZm9gDpir5gnWLF55UZjGbMe
	 R4uGmpFTQyXDTuNvPecKQh6iaw7BP4n+iOoRWt9q38uMrRRyxARKmVCSRxVn5w3hwCxSc
	 jLOnP4oF2QjVO4tWRyLNnVAQqmYSmfgGYtJyCRgniN21Jx5t+QPaBxy/zEUjMCop1WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=JkRbPk8S;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9D606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C9D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=JkRbPk8S
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b312be5de8so22440097b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891402; x=1794496202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SONjZYRv1ckGFmSfkMm2m07etEBBhKJvU29wRk5CmFA=;
        b=JkRbPk8SBtJBdOW5WjF/lfB8av9sgiHpDNhZRpiMMQWPkJgLKnFwPVWWcF1C92cqI+
         Mt9vyz4NQTGDOP4SYxZF07TWnNVc37Z0L5m5QKtQ4NSkC//gMfel4SBmnNeFfswc60JU
         JbHs19dOicuhjI9aJLJewS8znzSco04ASSWtujHq2WkzZ4lodEzEfuYZi0mHOWbvC5k+
         AGw7Lqv4WAS7yN6Y8hrwCxsu0fFDo4Syoot4J+lCenAdZ+BQnp7g7GzBzjI5k3luLVJo
         6ELIE4Mf+qo1ADh+tJxrv6RiyPTmBJN8bJhbh9rREzGLOVqSOS9lCXp/Xnu1oZ+K/7qH
         P8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891402; x=1794496202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SONjZYRv1ckGFmSfkMm2m07etEBBhKJvU29wRk5CmFA=;
        b=AllwC3MU+519OZHFxUdr8kgd/zua4rYLFgzCjT4hbTTJXQ32JISuN4Spi08/tkptpC
         PcQRb7m/2BXSxn9oCXqyoQmhvzM9hEYxN2cfJSqjDFNJKaaH3pfPOg5Z5HSzzZUL8mro
         ypxko7933QiT+JQBhHloQKQDwO0QRqo9qFWt29L4ID7+XwsNiM+HZ2WqMf1xX5cVcBoF
         dyPEPHPvXxKVjpk/R57oA0QHFadaNWqFp9zBZtsQiNNGuq16XBkIFDHYkgBCgorrvir0
         AJXTeLOO4kTWZJ4It+OkFIFTliSp/IGwHxwobutFS717qFXu8QXJA35rkpsEbDygVmrE
         VKLg==
X-Forwarded-Encrypted: i=1; AKwUvBz0U6NNgEhfLhiOxQ5b5WdD9sEUvpm3oHta8ye+sG/UtY3jEQIiDcgW1vh2z5fRCaIq97w7TmucjN1Ws0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vFz9qYYGk0zbOSk+2lTC3N1ANDx9xa3SaW8rQqJRVCCxlEoyu
	Z09Dcp0X1rpM8o+KgeilSnIpJqqVClrHpWD7+VM0urC/g9+z/IfvMJwpxMmsyfGupuw=
X-Gm-Gg: AYBFou0NxMSewKUH1SYCE27pW9L32+fM8oCr4LobbbAeD9MrkTEkw0vJznvuT8QFZao
	6INlsMPKYRCoJXjGvctDo++2iWKsAkr8pAmJpkHLYgYUk17uDwPukBqwUzBmSkvZgUeV1ucVTwD
	LQzxizN36GZG9OsQw2i25QUjub8Xr8/ICpmahnEa1/lq+MDtfwPA5OBI6HYjBb+Jn8FcaRfYdo7
	5sKScW5sEwEE/U0oFRVtl21I6W4bfstb2YL4idBbtWMSF/kb/dtBYZGERhI+Yh4RHKCz0e9r+GY
	i4TccVPL2PMMpnLNXoyksd2Elq/g3/Ke571dBvgj5cmUgMdkZ0PVss0MtZy/lVF4RYDcBSqSfWP
	8jVPLY5hYFRA32mAwVjFnrmeVFHUhdDfiedv10GnfhVJhGc4jYaCmthZ1eMlnm/aQGxRbwXE6Cp
	3R4s4zzw6H4PDDdpiYeZnvYl1/IwET5rYCP6ne2B2KraeVh70uF9cJR17TynnxIplDXEAAFnSt9
	whwe8NiNpN7KeaE8K+CFzoWcw99ciOKsyKCa3TvAUTOLpvT/Q82+qiI9mRg6nei09oDmbz4Zp1e
	hAxiGCm9/W5nh8uCwFHe8IXB+VtXINyqSTGUAQz+0Tp8QyAdNlxQqt6EtQoyGt2quu0=
X-Received: by 2002:a05:690c:ee:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b2b66eccf9mr94941007b3.20.1793891401874;
        Thu, 05 Nov 2026 07:10:01 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bd35c7sm42380167b3.44.2026.11.05.07.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:10:00 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:19 +0000
Subject: [PATCH RFC v3 27/90] cells: add the "budget" slot
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-27-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=1542;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=oj66V8aCZSdgG20qiHDURXxVIGnAfze/B7P1AdO5Gf4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMHbZexBHDoBFDFcix8APhjU+THxpbH6b2eo97j4VDm4wo4tQlfr7N8B8fm8p1Ff5YjUvCMyPNo
 BsYrxSAj0lA8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

CELL_SET_FD with the key "budget" takes a file descriptor for a cgroup2
directory and makes that cgroup the budget of the cell.

Holding the cellfd gives authority over the cell, but not over the things
that are put into it. So cgroup_cell_budget_get() checks at this point
whether the caller may use the cgroup.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/cell/slots.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/kernel/cell/slots.c b/kernel/cell/slots.c
index 905672db9936..3f74b4640334 100644
--- a/kernel/cell/slots.c
+++ b/kernel/cell/slots.c
@@ -31,6 +31,21 @@ static int cell_set_hostname(struct cell *cell, const char *val)
 	return 0;
 }
 
+/* A cgroup2 directory. Judged against whoever fills the slot, here and now. */
+static int cell_set_budget(struct cell *cell, struct file *file)
+{
+	struct cgroup *cgrp;
+
+	if (cell->budget)
+		return -EBUSY;
+	cgrp = cgroup_cell_budget_get(file, &cell->budget_uid, &cell->budget_gid);
+	if (IS_ERR(cgrp))
+		return PTR_ERR(cgrp);
+	cell->budget = cgrp;
+	cell->budget_id = cgroup_id(cgrp);
+	return 0;
+}
+
 static int cell_set_string(struct cell *cell, const char *key, const char *val)
 {
 	if (!strcmp(key, "hostname"))
@@ -46,6 +61,8 @@ static int cell_set_binary(struct cell *cell, const char *key,
 
 static int cell_set_fd(struct cell *cell, const char *key, struct file *file)
 {
+	if (!strcmp(key, "budget"))
+		return cell_set_budget(cell, file);
 	return -EINVAL;
 }
 

-- 
2.55.0

