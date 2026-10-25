Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792930371;
	b=so6dR2fNgNJ1TOJQmfFM+jNLrFvygPSJuzaKtN7Mj1wm6lhNLzJPNBov01iDepDaMCuS
	 eWeyvoI/CU2GGhA10y3ePXoeS6m6cynbCKm5z4VS9FB9pE2u59yKofhBKKyMwxCaoBLjd
	 AimDvKBjqvD8OI+uHns+x2UH9b1FaHy1P+Tckeh0bbycXmWt3mBjuE46umZi10rLQLNK2
	 cLZ/a4OcSuY2DDDF1Rk8G5vqy8V2Y9wkiU+PqlXfvQvG0XP9opoWAu5KKHRqVNQ6lhvRR
	 vbRZCGLuhzvMB4DNm7j7Un4LQ7ndWkf7H6mkQ9b45Ch+cb4tTKguF8tx5t2ubpK9Y4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792930371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B/PSMaUJV8pzyW3m8rb75J2+lO5o4zaXLutnAViAWbI=;
	b=35ehTtSGzjOlUYsGvoF1VBykUBVLiRKKQ0o18eqimDlbDCUNQo347zBkXn27cMOVOO+X
	 JtjZgpnF7TUcMSH1beJpKk6GxZiiEIP3ViedPXZmSWlFyrCGCVjkf9MiSz2fgKune72GC
	 GiEe7yU7jOan7804lhShGh6oGFivGFKMKiOz2sjnZ7aR45UGILvaCyOyBFDZRKoZOHGT1
	 1Ucb5LCz22KqPX7apG9QZWycBYfpg1Xg2x5VWuvBl/6Kn1h2h+wgZGibT8G3XHaw0L8bO
	 PUex4pPZbCqYOpABc1bwrxG08XgpvG1p+lJuEkHtU7YTj2JxJpAi+x4uBaEKRJRBKIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EKXWqFH/";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F9606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EKXWqFH/
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso22526465e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792930369; x=1793535169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/PSMaUJV8pzyW3m8rb75J2+lO5o4zaXLutnAViAWbI=;
        b=EKXWqFH/cC2/J8+XL7luRmrrRrx7atMfZmpggWVw204H1K1SQagHHZb8fD7eIj2FU4
         +Mtj0JV3q0bpseMu+9K04xYpJtE3ZGtCYPTYLsGgNYN5a4MUyLXRhsbs3Jrg3PzStJIP
         eWDVccUgZlYl7Uv2b375+dU0eGPUNJzdNQ1ywJJ5azyfjkis/T5A6gFTO4sMtGokcRzt
         +O9DVh8XVfDl89f3Xd6NnakHgSjbp0FFRJYmpX7pkkqDx0fOVv+Oadu5e9WD2z4wa+jZ
         UWA3uE9ZOqUqrRRRIDykWyjh3PD8yB79ZwptrUK879pbFxyJ2HLQSbaQEjiixehvv1S9
         dA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792930369; x=1793535169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/PSMaUJV8pzyW3m8rb75J2+lO5o4zaXLutnAViAWbI=;
        b=l7+3OIvmVqAADm0wh7sCe+NW8xfjhlkDK40cmAUrB3tDQpdme/YT1TxGHH71wp4RPO
         R7BJIue2TeQ00i30qgcG/J0HNmGcgjNUvVinfV4iWn2pERVNcKIvAGlpOFWf6bj0RVJq
         sEpxOxx2Wc/Qrh2jlgvcPEWcI97O93K8+szjCtdBGycNdx3T9AWnQv1VLvClK7qSBpRe
         i9IuaXxd7Y+vLjCu4L9cazjC1fyDawXKla6YQjJd71yMrn2aFY1X60ZVbWMUQb8OCrdt
         HJc13jnhDuGtFomG5x+4Yc3/pQbKu4SViM9X7FXV7D/XWAXYPavgsmORLqmRXNDaR+v4
         GjHw==
X-Forwarded-Encrypted: i=1; AKwUvBy9f7rS0Kv7tnKogelxQEy1DhqXJUfF+9U4RrFDXNKZmLu+owyD0R5dX+32bgx7urdiJ0hSZ+RfBS15200=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlZgiT5Xjc4O6Jmc5VO6ctaxijo9zEhgYWnDQByQs4Fei+7ZuA
	SvXT1BYmNIqXAR+izOciz9anttgHu7Xw5jmbx0F3b27/wBMUZVh9XZmY
X-Gm-Gg: AYBFou1Oixoo7UO82k1uV+Avutq7hQzc642AgERWmwrKHGFP/RgwqJd91z/j0ZOdFlA
	Pe9WGvX4tCY8OdzJW1PP13RUEQ3p/5MrXsO6yaTU3Jn8/PRYmsce4cGRmZsdSfWYoj/ov1viLsn
	C0xP2Pn/JPCpQvvrtJ9r8R27IQWeXdNoIWn2Hzy3xKl3PSUbAeyezQsAdMlcWHLdhNgsQ93jiCX
	c5ctkpSI3LKH3mDDtisyF+Ae39QdEE8NN/S2BeBs7P111AFx2cBCKuBulWrq2o8jwkMgaNPa0IK
	5VCrYFjumxyCQ1C394JxvmvICBH4d0TSlTUBW4U6sVxYTKGDinHTuCbt/KmGoizWl71dxu9ITY9
	hcuGv+BXjpxiwVlHJ68Hk0NWBPRHvSrATa2iKt8MEoFx4tQep1USFLa2vehTI74ZTfoCf53j8DC
	p4HYokKe8anc7WtiqeUFUQcNXiSM17Mmx/jmmA5fNVJnoOLhfKMQ9BCVNxd7RG93LuE9M50YXtE
	cS6/HtlJ5tcgVtRDZjIzVoaMimefgpw7zL2t7BN9yPqc/u6LdneZz23uPJom9zXQFmQm6XFVg==
X-Received: by 2002:a05:600c:4f8f:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4a35ac98b1fmr66672375e9.14.1792930369179;
        Sun, 25 Oct 2026 05:12:49 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:4c6b:e3c0:928d:b2cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm11811255f8f.45.2026.10.25.05.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:12:48 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] genirq/msi: avoid freeing borrowed firmware nodes
Date: Sun, 25 Oct 2026 14:12:42 +0200
Message-ID: <20261025121242.2169180-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msi_create_device_irq_domain() uses dev->fwnode when
MSI_FLAG_USE_DEV_FWNODE is set, but msi_remove_device_irq_domain()
passes it to irq_domain_free_fwnode(). This triggers a warning for
firmware nodes not allocated by the IRQ domain code.

Only free the firmware node when the MSI core allocated it.

Fixes: 9d1c58c80046 ("genirq/msi: Optionally use dev->fwnode for device domain")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/irq/msi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index b22d74496af1..e1d85035dbc8 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1129,7 +1129,8 @@ void msi_remove_device_irq_domain(struct device *dev, unsigned int domid)
 	if (irq_domain_is_msi_device(domain))
 		fwnode = domain->fwnode;
 	irq_domain_remove(domain);
-	irq_domain_free_fwnode(fwnode);
+	if (!(info->flags & MSI_FLAG_USE_DEV_FWNODE))
+		irq_domain_free_fwnode(fwnode);
 	kfree(container_of(info, struct msi_domain_template, info));
 }
 
-- 
2.43.0

