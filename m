Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F36472080
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929021; cv=none; b=ZnLnSwqD3GWIGBLqV8AYgZ+HqIa+km59YU0Amk/TW2gpclmcqp6qmnpg2pRzF7sqIh1hG8trARYR69t1Mr03c+yjOOf1L1hzlaMQYgnUrrDYNcxhLpE1zvpvdoGgjKVk0xu1LKW4MxiGvbxc9fYlZXY/W+toQWYwe1B5CS7DxNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929021; c=relaxed/simple;
	bh=JP1DUGRnFpKenhUQXMkCfj/AYF5XyMKm7PlfqwvLN0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7Mv3phJ00qW4ynbethriUql85s45HzMVJosZiGqDxAc6W1UXaSSS7Val5SQ3pmOiTHtIxP9344YVQXD4mVlWY0q4Q8lGBXtvk7SGUCVX+HN7quXIIc4wqiLwBp8EXA5Wh4R967JO19hNGHuMM7ZiqivD9b/PFFPjuQOIrQvmz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bMbdSs4A; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bMbdSs4A"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb751so1875895a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929018; x=1790533818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVQz5nhnRw3JFcVZi/bpaRY30mlHvfzPq9aZRP4f2wk=;
        b=bMbdSs4AnnVVZ+9DLN2Mp77VluYJCb9pqlw/DcBqroNLOBJOaMrAv70WTkFt2ChojA
         Jqb/9vOQFOPC35jvNVIp3SHpAc8IjsVGEhrsOtPlw2nlhD/ASv7YT92AiY48nCH+DIs/
         l/RVBXZMbU6M2x87CmIXwT++ANOPpoH+5kRxcXbXcmWf7uUgiu/5mOpzJTv1MN+Kpd4o
         lksMcKo/wXWVId6oZJo+H15w1QvU9B+wgmATMMAhNjqv9r4WNi5JvOQ9bPs5Ta139npY
         sOO6c0Z8OqsFdyLKoao30GtiM5otvMVyujJpAcykOw8G/wbUaO/O5srCQdsTim0yS2uu
         aibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929018; x=1790533818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dVQz5nhnRw3JFcVZi/bpaRY30mlHvfzPq9aZRP4f2wk=;
        b=giFkAuNtkOtpgX0dnVvdw7gRvVzmBweHTlEcriXdQwJQGvQhpahlAw7TZaheXVGq/A
         SJKogRfuqUhHBItoPoWD0mNvTlELw2r6SdWMWzikJYOwuUwVeXNUiBlyKFyHG53CAsXN
         H3hcME3YTmS09gG7gdGq/gaFyJtpd52E4QfAhcc3mtFFHcaNvRPhOIzc3kf+GRVFWnFz
         gc37uIwxidnqH5OI9X09xpLvq6U688+F930nYJ60lUEzs6IYnELadhvVqpMZ5exivVmU
         +J0lw61hFNC1yGF+Bl2yCJ3dCdL1BdEdd503pjiuiBDCJ6Cc/n+txiU6AEmZlfTzv5MF
         SwkA==
X-Forwarded-Encrypted: i=1; AKwUvBxvcZCvJmLLIV82LpuW0RfsIWXgIm910GB5NrM2GSIAwQrOGGLnVGH6AaJDS0C0Yr0jbaCJXeAB/SoDCFY=@vger.kernel.org
X-Gm-Message-State: AFuF++k7XruXfqfNKnmEf+S/GKoxfCItEYHoUz0JpPlT+nTN69Bv+4V6
	GFcH9reouCiX6bYU8jkxHQ2TzzCJdSqRUJkOTDHtJJYu5SuJ40nH9kI+iRnLwVl/hcg=
X-Gm-Gg: AYBFou0PdRkzROaNlYvA8MXxQPCfSBq3b0I3it1U/eTxrvXFWD7hH/kPNFvRvEaL91W
	4MYtDpJsC7yy/X8sr/Swby752mwE42iT7P3vMLNhUDXVlWAKC/Zjb+LSWhsPRMxELwZhTgMWXtQ
	Ypk5QDLW9+PMMPbPsDu2R++/Ls1fv73BoqlYWiwyZFhT0j5ixrzx5Quw0itUmufEPF/89hZVwh1
	rz+TflUS32063FiLNXSL43W/gGygRlGlto/s9+4+d76858vbHwem4SG+CZmv04zg7J5Yh5rg4iC
	TYzLQivBDqZsL53WO4iZk384Kq4ykFMd7cF/tgnXqxBX36+buajiWV0Oc9JLXxMBdpteVzkZooA
	U5NaY6NU0VoBSsfaODBlSkiq5R+A8J6UOqSmHXUw4EmV0Ha38zICwcPaqgRb6agxphYW2EwhB2M
	jKtoDQNGMujdTBbZ8WBQ9BlEV8mwqJOKVCR5mlHMyfrAwOKEpjnsuM2WHB
X-Received: by 2002:a17:90a:1050:b0:39e:6b01:f93c with SMTP id 98e67ed59e1d1-39e6b0213b1mr6419367a91.13.1789929018194;
        Sun, 20 Sep 2026 11:30:18 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:17 -0700 (PDT)
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
Subject: [PATCH v6 02/18] nvmet/debugfs: Export controller CIU and CIRN via debugfs
Date: Sun, 20 Sep 2026 11:28:00 -0700
Message-ID: <20260920182936.2317916-3-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920182936.2317916-1-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
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

