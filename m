Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EC14F55C7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755424; cv=none; b=j/Rm1mPeX/fsvi0Ls9G+ZaafeNNmPhi/wiMm3O+krsHz5niCHxN2G5OEPGjBpV+CkYIOMQYJ1yg9WNYtARJc2o2keZy4sbeq+dOGTQOhgOLaAQOLFU7MVcKWMawhXerEerCzqt1Udu3foQ1+9jrUdEpOgBwNllmaKzLABrx7AUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755424; c=relaxed/simple;
	bh=JP1DUGRnFpKenhUQXMkCfj/AYF5XyMKm7PlfqwvLN0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tA6oKJ1wAGJi1n0CCdasoe0bvgbZyoQdgQDWcDoVsAigo4PEcT4FWVUmN3sdOnrgLQHyaCl76Fbg/ZMaF0E6R28gAmvKl1wBYcl0UM6cOkTozbCP4g+8kOJt1NxbwFNb48TXZ9rVchA4hsE1jek5ZhV/azRD881mBw/UoRGpFjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ddJraQtS; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ddJraQtS"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so7818055ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789755422; x=1790360222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVQz5nhnRw3JFcVZi/bpaRY30mlHvfzPq9aZRP4f2wk=;
        b=ddJraQtSYmRqaD681Qz5bRkasgrsJf9f+/9SLwhpJyGGftRnc2IsyMGGfEFoHhLkS9
         xbu10gf45oD9M2DaAlQnrOH7XXZXAfUpFM+aB7FtWztOFVoXow6n8mqEr7O+NRmP2wPp
         cTwDPynawk0Adff8mM92PohA9F4xBijj+PoNKmZRXIgmzwAMK83WUDXCZ/1mmQkqh4lf
         4wwWClpmq1SB5IUG5KCpbjX1wr6bOBiq33xQixiZGdVJCpoERiQgroBzi7uPma+bYVrb
         jOxatIH9DXiOKJNvYyuenbOlE0u6HtCh2ackCFpvWZ8eD1CyxvaenCiDus9fkGETCOmC
         PxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755422; x=1790360222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dVQz5nhnRw3JFcVZi/bpaRY30mlHvfzPq9aZRP4f2wk=;
        b=Q0xoqRchNxatimOBBdu4BDrtwljKze2xJ1GvCKL446YDO/QaCglyNl6G+KWevPjaV/
         U+wDbWDquIXrtzEXSBRV8qjhDb68/U9dbZ2j/YcrGCs7wNipJQtWlnSryhR6h23OIRhL
         r7pKMm6Ji2zXL6wRO2p/72PzAcfeBWcok84b8z+6yvBSM/5QhGp4z0xC1wYAB2UF+CLZ
         POKx5Jup/fdyrG3RpDxURtyBINsQQBIAc7+9KCJHLvhQ4SLQuu4r1gtfZpVY7EkLUYu6
         pfcQxOx/sv4p0A3+LXx/KX0o9k5893BalLGaZGMLe/zrAMrVYIQ/qTKpBCbTvldJigUW
         WPUg==
X-Forwarded-Encrypted: i=1; AKwUvByh7rNdZhz3YuyiZKOaBsATFGSZNy0HkTk1ePpQZxyUm1EFmBNQx3ok9IXgqWQVToIdy30ppHZcodc0Kzc=@vger.kernel.org
X-Gm-Message-State: AFuF++m04rz7g9u1vdXgna0ZFd6A0nqB8XWUjCmjywwk41yDf41yVHFV
	R07z3w2a2EDVnDvgzCcXOJ8eLrdGk2D3ZkwPaezcVQPu68Lk3VpAWgkHshl2iaN7I9k=
X-Gm-Gg: AYBFou3OLiYo6TKXUKKBSrYPUCi0gMKPw/NBN8jrABSS0yF6+XhDj7JZwiAEed8Bu1S
	K5GMbWnT+Pt2DLOUeQpXjidJ9PBlLO8H9mOw70oZESBJIGvN2h00pVHZ044XRZZOFQTkLTCwsYb
	2Zrq8Jm2f9bV4+KkTozgFfOArSKH12hYP7S2pzufHc9fba2+ZKd/OvagCwrYLsOBV4IaUQam9Ax
	NcR/VY09r5OtqbtTcA7oksD4NdbGR6On1aicH6LwaHVJc1aw7ZvYtcxK1e1sa2h5qdj2amJ+sIG
	UJod8bhXaEni2YDbyiu7ytscTWV9fXW6Jf1wKiyLi5ZasAQHQIlDh5wYpkzFvV7rdmaKbA/zeQD
	kOmuxZqi4eqVtqcFXd/kkp/61uSwmedDAREqk5e4qFHk+/I/USUiJv3HAF705Dvwpf+7jqzDkkx
	8MFiCruotcokTl2xKH/aBUkeA43jqUS2vGU3qvKkwsuIUqk/ztQe/wBxHy7QWheC9PWnRmHNZaD
	xE240/WCd/DgkXtM7CJGXZehhiRlDSw
X-Received: by 2002:a17:902:d2d0:b0:2dd:c0ff:e72c with SMTP id d9443c01a7336-2ddc0ffea23mr6053395ad.62.1789755421554;
        Fri, 18 Sep 2026 11:17:01 -0700 (PDT)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm335107eec.24.2026.09.18.11.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:17:01 -0700 (PDT)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 02/18] nvmet/debugfs: Export controller CIU and CIRN via debugfs
Date: Fri, 18 Sep 2026 11:14:02 -0700
Message-ID: <20260918181614.3947933-3-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918181614.3947933-1-mkhalfella@purestorage.com>
References: <20260918181614.3947933-1-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export ctrl->ciu and ctrl->cirn as debugfs files under controller
debugfs directory.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/target/debugfs.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/nvme/target/debugfs.c b/drivers/nvme/target/debugfs.c
index e85fe1d4c9f8..4de460879d0b 100644
--- a/drivers/nvme/target/debugfs.c
+++ b/drivers/nvme/target/debugfs.c
@@ -152,6 +152,23 @@ static int nvmet_ctrl_tls_concat_show(struct seq_file *m, void *p)
 }
 NVMET_DEBUGFS_ATTR(nvmet_ctrl_tls_concat);
 #endif
+static int nvmet_ctrl_instance_ciu_show(struct seq_file *m, void *p)
+{
+	struct nvmet_ctrl *ctrl = m->private;
+
+	seq_printf(m, "%02x\n", ctrl->ciu);
+	return 0;
+}
+NVMET_DEBUGFS_ATTR(nvmet_ctrl_instance_ciu);
+
+static int nvmet_ctrl_instance_cirn_show(struct seq_file *m, void *p)
+{
+	struct nvmet_ctrl *ctrl = m->private;
+
+	seq_printf(m, "%016llx\n", ctrl->cirn);
+	return 0;
+}
+NVMET_DEBUGFS_ATTR(nvmet_ctrl_instance_cirn);
 
 static const char *const nvmet_pr_type_names[] = {
 	[NVME_PR_WRITE_EXCLUSIVE]		= "write_exclusive",
@@ -287,6 +304,10 @@ int nvmet_debugfs_ctrl_setup(struct nvmet_ctrl *ctrl)
 	debugfs_create_file("tls_key", S_IRUSR, ctrl->debugfs_dir, ctrl,
 			    &nvmet_ctrl_tls_key_fops);
 #endif
+	debugfs_create_file("ciu", S_IRUSR, ctrl->debugfs_dir, ctrl,
+			    &nvmet_ctrl_instance_ciu_fops);
+	debugfs_create_file("cirn", S_IRUSR, ctrl->debugfs_dir, ctrl,
+			    &nvmet_ctrl_instance_cirn_fops);
 	return 0;
 }
 
-- 
2.55.0

