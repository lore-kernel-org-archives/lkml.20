Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D99D344DB9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 20:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788726552; cv=none; b=jaS0JftewrXZdim0nCI+xnUxw8xkjz4TdpTv+8vwSGp/C8vVYM1ImnJ+ayU/T2VI4fWu5m0HzmBV29Ic4E0nL54RjQymdnDR+CxgUms/QuufRi6TRa9aKAvqpTZULPld209her2XqDErV1ufqHWVVhEF8ccON++bl1kuyz5OUxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788726552; c=relaxed/simple;
	bh=76VAeUkXL3BlGk+9tfC+Eq+2Gm+mySXnTdEDQNC4wtY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DGKuu7XUHGkT/F7pO3Gyy07OKsS7RjOYtEXHuX1cxim5sZkmVdfqcEw+YK7MS14/UNQiKiUyz6cO91BVaALsQsG9uPBSbDi05V/iPpNMvKb4xkdQbyI0E5ZFE0zg2D4/uR5uRVJgb8KjQl6jqc+Ni1AUl0PFdABPyhvmE0ODXAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OYMp9zrd; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samagazaryan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OYMp9zrd"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so6474057a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 13:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788726550; x=1789331350; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbF+m1IWNGHjplX/XAIe8nP/a/sFZGH0R//WnioyHCM=;
        b=OYMp9zrdiCCr8Zf5+lvkcIgkPNO9tx1Hty/D+MeS914yGxysmH5T2SRX5l+JMB+Yvx
         chQmid153Oqj+Ckk3Lv/i+AChmyEB3tKeExJDCN4FOh4ZbbOXcOySvf4Ci/0kY3AgqOH
         GGzEIFkXKDYigkkdsTXJdT1Rx3d+KnfjjMhngEphSivEyYSKIgGL76HVWXR3oh/DnkkS
         AJEYbZ5ZoRbdZP89Bg/d5eJZ8Ng3jrfYsNby0C9xXx84K96C5P/lrdGyqCD+otkK+cL+
         zZElH6r1cTxeRC/HOlTR7jUfGzbZVV7pKi6ap99p0hqhJrDIP/AcnaQQfvDpznFPspPh
         ILQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788726550; x=1789331350;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VbF+m1IWNGHjplX/XAIe8nP/a/sFZGH0R//WnioyHCM=;
        b=ckGnQET62etFEiOOOou+3Lb180x6xcwD0qenTTxBBaCqi1v0YwVIfcd5P2qyelNpyA
         rn9896lry/qahnxTH+LCV59q0XPzUf/BPLVW3/1zUXFl2k3CvdEMR7a51D7Syp+S2BkF
         H/bknrNKKVTwXH+zo4G61ymKpIe0+fadhwsUuFlBDqowoIJLkKN0+7AkbAFfkINshwjN
         sSlwK6QX4TVFx09pSZoz5ls54iXb1mRadX2WK2gzV3QOCbHSHo4uuuvHInmtG5+GY+vb
         hhAbDVLh06bRp+lloCXXsx/4kCWBI5euTV+46K+0C0KACDu3/GG7VTJnIS7icP4PIOkk
         5A3w==
X-Forwarded-Encrypted: i=1; AKwUvBzjAep4sBCPjov0yp6GTfRV5CwpE0DVYEGqRFa11nRuIE7w5ncSCnxaOuM0IJICyJNJxr44bG0gQ/mMafY=@vger.kernel.org
X-Gm-Message-State: AFuF++kVE0Ierj4PixLk5ZBemGkPcsWJRx7oNXfyOmFxCqLEP0lqENKa
	J6dSmq1Vbn1UwFiQNR/04gNNp/xwt+3Wam1n47ZF54Hw97q9XJP66hFMN1qH7tqouuoR7dWsWCt
	UYAN4Q/mtAacOQm9wa3bcsFgQLl8b2w==
X-Received: from dybvt2.prod.google.com ([2002:a05:7301:78c2:b0:32f:1c5c:c8a5])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:28cc:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39b260e13d5mr28750188a91.1.1788726550262;
 Sun, 06 Sep 2026 13:29:10 -0700 (PDT)
Date: Sun,  6 Sep 2026 20:27:45 +0000
In-Reply-To: <20260906202747.4041389-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260906202747.4041389-2-samagazaryan@google.com>
Subject: [PATCH v4 1/3] i3c: master: export i3c_masterdev_type
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vitor Soares <vitor.soares@toradex.com>

Export i3c_masterdev_type so i3cdev module can verify if an i3c device
is a master.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/internals.h | 2 ++
 drivers/i3c/master.c    | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 86a36b951e0d..cbc00c862104 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -11,6 +11,8 @@
 #include <linux/i3c/master.h>
 #include <linux/io.h>
 
+extern const struct device_type i3c_masterdev_type;
+
 int __must_check i3c_bus_rpm_get(struct i3c_bus *bus);
 void i3c_bus_rpm_put(struct i3c_bus *bus);
 bool i3c_bus_rpm_ibi_allowed(struct i3c_bus *bus);
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index afcd7a21a3e6..e8a9f8c3041e 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -864,9 +864,10 @@ static void i3c_masterdev_release(struct device *dev)
 	i3c_master_free_i3c_dev(master->this);
 }
 
-static const struct device_type i3c_masterdev_type = {
+const struct device_type i3c_masterdev_type = {
 	.groups	= i3c_masterdev_groups,
 };
+EXPORT_SYMBOL_GPL(i3c_masterdev_type);
 
 static void i3c_master_shutdown(struct i3c_master_controller *master)
 {
-- 
2.55.0.979.g7e5102b832-goog

