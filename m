Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DF3E3D98
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792263050; cv=none; b=eH629k2deblrEf2Wf+Mrppr4sC+O1mo4MZsjcJ8BKcBoRnJqDc71AkTf7yS7utlyB+DHNb/NtMM7JwobMQnG9Go4GcC4XXxK8DchXhOw86Et+/GSSX/vTIyK8wjVw/cjK9U6z1AnaJeF3LEuYZCZnmEAfsMufr03gpm++MzKnf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792263050; c=relaxed/simple;
	bh=fhFh3Ys2uymSwdSZsLLJ544Yj6Gc1C9qBViPJtZ97+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/HUIsMq4Xt1qq7FOLYlKZcn3+twMgKWNm5Fsj9gAJlBNUAobg0BF9l7kZOUg6T9L4UfN4Qm+pFQGaRb8wmyoOh0XGpM7sZv1HDKAha6pfB7vWTR82eE7cseH+3qSUjHlj7FMZQL0PXTyVAIzJr2mkvaQZ1OGpQTiOSIDGg4aio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2HqK98j; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2HqK98j"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-4a1df99eb68so919355e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792263047; x=1792867847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZ55wAQt+5C+2u2S6IrGGzVNApcVZRVgGwe/A996wyc=;
        b=K2HqK98jBKY8KxgbDdyBQWKagmkxZjUITuixnXp+CHKDUIpaJxeJoIFC4cGhMyqJpL
         xZzWA04wDDEGCcr03GD5RnJtBsfAJ+ptqOT+/AqyUKOr8TXSx57SfvVykhWw/lVcsbkZ
         2GbEtIodbrwqe8IPvMueYxhYZLljJVq1ool1mbx0ZD8qUqVgtWRWJ4cJZEcP6Cl5i2es
         zkO2ff7Q4LBVd5CAm4kt7m3yaeF/1nwPI8xx1CLp3FkB9+Ix8s5hUmy6aPKUeENHjTyt
         dji40FnmwdOowS2BCAMSaJAo2qcYrZ5G+LI5oRyc/KtVwxih1q6xfmJNy3CnUBH1OEd3
         dTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792263047; x=1792867847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZ55wAQt+5C+2u2S6IrGGzVNApcVZRVgGwe/A996wyc=;
        b=Qg8NMeosCku7aiDubyu6B6+StsWAdOGqgs3sK+zNynHkl8BOblebTHDn2NTazlx93t
         Hmk2pdBs4K3AaOXRL6TlB+7maYcPbuQT5TLPksBK1+KbPYMbRubHsgFGdcsx4Z0kRDbh
         gE4GoykRUjNuCYpWOoJ2wBl2wbutVOYpMP5Kh2bzi3umO/uTi1yorqnsIXiYWqZjbZrZ
         hiN3C+eRR4ATcq48Y5sdK+qOZ+MXR5SwFw7RKezqkTcMe1drC+025DbwNqUiaPrI9TQs
         qHnJLtPvy21gYTk+USUV4hBof7s7fx6jvj337uEu9ZRbEVcQ20rSufnfKd53ejYgw5vk
         9cxQ==
X-Forwarded-Encrypted: i=1; AKwUvByuglfGaMEkV42wIdnQjV0jTq2Mgyue/UV3iG/mguqxDhTDwRyzuomv15C/Td0gx3N+D6gtvtNgviqwoTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMwchXFgGsnBKM6tNN1PpVcDyG5SYudHXKZ+Ls9WqOpIO9s8/u
	8pI//liCu6Reg9zyLKphSDA6v20pSZ1Ic3ugRfDAaNiVATby7N8hODhA
X-Gm-Gg: AYBFou0jMLOVEHCyt1/2sXZ15PzkKBSeiN6ELYgKp/wavLI0MW+8pcV11nI/uRXADEA
	K/U4dqzCWlxxcGTfOvN23uu4XIxMcEDdXbplB+uHRHD9pGBlSZbis/Q7U0cnYfyFDvgVd2Sl5fZ
	P8pLlQzPZKkItQTsPzkQbqkx0BjOG0N/+tV+Cl7SYq/scD3eP7DuIQlBqkpqtsAuDyuS1S/vvGt
	hTz5RRUn/GhIMiUENDbsZTb0XpCDzkx6oC7W954ggEcTlIFl+GBSQTL2rpf6V481uS7+zYpjx/k
	odr4ljx7PU3ZpFK1fF4hfa7nvBYysrfZ4AAYPe29cwsvxTbXTgBwYKQoLyRoRUkZLQDXgBaKLPD
	hLx8oZk6MLFp+4MpZGIKEbRkBBaNUr5tQbd6kjoTLbZGvQFzSA8mISqgpQ7rx0FZY4zWGOPJZgI
	4BeJQv9TYrVWkBQCqI/aNe7ZEZxRFBLiInJBXTJlhGN/sAsnCC2TG6xuV8w7N2hoMUxIvK3WrS5
	5tvJyNkYZKMaQ==
X-Received: by 2002:a05:600c:3550:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4a1d7616454mr69387635e9.30.1792263046736;
        Sat, 17 Oct 2026 11:50:46 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.205.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d28b698asm135972895e9.11.2026.10.17.11.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:50:46 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Nelson Escobar <neescoba@cisco.com>,
	Satish Kharat <satishkh@cisco.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/usnic: Bound buffer size to sizeof(buf) in flowinfo_read()
Date: Sat, 17 Oct 2026 21:50:28 +0300
Message-ID: <20261017185028.1019445-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In flowinfo_read(), 'left' tracks the remaining space in the 512-byte
stack buffer 'buf', but it is initialized to 'count'.

Initialize 'left' to sizeof(buf) instead of 'count'.

Fixes: 9f637f793602 ("IB/usnic: Expose flows via debugfs")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
found by smatch:
- drivers/infiniband/hw/usnic/usnic_debugfs.c:85 flowinfo_read() error: scnprintf() 'ptr' too small (512 vs 1000000000)

 drivers/infiniband/hw/usnic/usnic_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/usnic/usnic_debugfs.c b/drivers/infiniband/hw/usnic/usnic_debugfs.c
index 10a8cd5ba076..ece7c6e71499 100644
--- a/drivers/infiniband/hw/usnic/usnic_debugfs.c
+++ b/drivers/infiniband/hw/usnic/usnic_debugfs.c
@@ -76,7 +76,7 @@ static ssize_t flowinfo_read(struct file *f, char __user *data,
 
 	qp_flow = f->private_data;
 	ptr = buf;
-	left = count;
+	left = sizeof(buf);
 
 	if (*ppos > 0)
 		return 0;
-- 
2.53.0

