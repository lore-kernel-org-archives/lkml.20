Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625551;
	b=VBufHuBNcTbhuz0GdOlklpR5vA1jPwvzHSk0MWumNs9hAQEucYY3b3HJVu13IdIE7jIY
	 d6WkwFIez1K7TSnPgtzQ3pNbGUTeKOlYBs+Y+7sA/JNjLumMjoe08NrkIC+cT1HydHvVh
	 emaRgOnjK8y6YqgXKBvPVXmSpY/q/ym2orL7nnYpksJIb32jQWBzhsKQnZGc6Ztu3e/oJ
	 UC3wWhbOgYHQN1OGhXhrD8IhvfX/DSCQWsiZw/LharpD8Tr5Xlzm8RNTC1W9JN6vAgCTU
	 3E/EuWkQRsJif/ZBA1lfCwMLCH7bvq8frQOys3eYt7dI08BibG32BMqLTCAD6yKTT9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T4r4BFW190mgVXMSF3sZHq0lg2jwYYGxl88uoGK7Nb8=;
	b=SCUTON7PN4V+pZXRiuBpuJ7dLT2DlM9Pf4TDSzwYdHW7lf8v/ngprDKWdbSqcA8O3VyT
	 2aQ5G8CucjQcHpxyKFuoBWYBlMH5XygnFbMvRczkkU7tR+XGcHTQoICXgFIkpPaNXsTIK
	 TEGT9pzgoysc2gI1jIJzC/A7SCnz3363VKrrPFmwS7TsRTuFdc9T1R+pdC+8N2wTrDAEV
	 b+BPtJ7fs7aAWjKYo2Bi+NUcJl+T5mNlmw7kkn46cyx2jCuIBnLoCmQHAsUQurpasBWcc
	 nbLUGBKh+95vWJvWElw4wOgCjP+rk2dA6/KY9BbD5BY3fQTZGMbtBTAi/XBj28vSPaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CvFjc4kj;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160B8606A339
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160B8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CvFjc4kj
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so2136865c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625550; x=1795230350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4r4BFW190mgVXMSF3sZHq0lg2jwYYGxl88uoGK7Nb8=;
        b=CvFjc4kj4FchmlxYZKDH4tPAwGZm00cKyKWR3bDov/cE+tYHvwtGZifvG3OcLg/58l
         ZpQJDWuEdrQQZXEsYchA4T7sX8t1GcEE0HM3Oj8Oi4MfAf29AHfUhtCD/gU7P16b0xk4
         nWH35EFWsQVGGXf/Jr0DTPYQbibZhNzx3ci29pCyBlOCoTOyUa49PwXdJVBHVwSql1Ey
         2VBwDcJUbY0XojKcInWKbBjzGbwezw3uLbAadqeEtN+/iKvkVBb3klAStuSUi/Ez74rK
         3BCviTNuKkUYUeJs7lBGt29Io/MN+MTL7CO1R7DR3xmslzRqhUdUb0B8ptYeNclE3vTO
         zcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625550; x=1795230350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T4r4BFW190mgVXMSF3sZHq0lg2jwYYGxl88uoGK7Nb8=;
        b=SLleEZhDMmm6z/9NCR3Z5T+n59yMpNrpDnwIBVWAVI4w59vKJ3YN2yZSYkVOGrwg7k
         3BrWAMfhGn9gchznHvBCkY09TzSE0TmzM+e3kkxTdLYjHdRkZyCkllcGqYxslNwA7t3w
         AoNU7OJgC8GbygwLsHDkOWz2Fz5wjEsu19drjmtIRDZ2I6phhMGzgJ7p0ucR92dsOJf5
         /Xpj/CGZRNL10W3Neh3QZnnXi98vznqdVK3XLSrEUadh1rj7kNIn2JnBq/BTrf1kWXvm
         dSuKliTFIuISB5cszVhcIP8t5Z/N1UKeFnQFMxBZaXYV0BtEOzrn68TPUXLlkqOfl5SU
         +3mA==
X-Forwarded-Encrypted: i=1; AL+hErGGRqAu6NRCBnbPGzYUActSTJeGmWlp6u/KgAgALlGDomEjZqix4WRl8ONMFyrhIMlD+0O98nMTRvUcGfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tfqqrzX0BPxIn8zMXdD+FA+1yvh1GQJwpvuzj1ncTE+aJjTnY
	CIyq4AmbReNHxn+Zk0EJ//Z/vgAe51ITPUMYnKHwKa6m4rBpiZaWyBMGasTeRc8QaI8=
X-Gm-Gg: AYBFou2xZIUJC8OqgCXIZjlbwiLh8TBm2vS3xEaxOQbYHaNCuaV4O1sQT00aYzOXm3r
	bZc30OcHrK+hhCE7RJ/jEcQMK0EoEQY+6LgFJ8Si9EmaSpfWUmqC+oojBl9yKh8OHd2hoeGTxDw
	zFphTdeAxnpnv8/VjQSb5pnQoatkSAMoykidr4jjugBupVm55oRHXH83DnqmAi7tIYWMIMKdp3X
	LHoidIuJqKmEee4UpXwcLrXwhJ9kDbdn680tMEENOLEor0E+qU4Abwi5NaIrZ36WN16Q+lEikTi
	w+lf3GWya+NYSobhYcNo8ah8M3wkhbGXCE0gJ7skpyZ0oNUCTkG4yhhOc4MkVuuJEkUSB7WnAfs
	bqLawYPkzUWw4F6Vthvw9/7skq2yh3wn/WbFL49QAOjRUjjSJOBXbkBjBP2H8WEG+B2KxXGILKe
	WfB/U9qETRYAfTwbIVyc61VDbuNtrbJuihfCCLFUq8dB2+bYe0bMOucNT8/4m8mdbv2rNjmPRpx
	a6ysVy4+9EqxH9/xm223JPWUOdDt/CGs1K+TRYGHP9lLxusgMaVqgPLBjmsRcnc2iPRqclWlfcF
	TB52bGGGDtiJA7mJ+Jpur33/gGTC149dEkwX50PKDM4SScG5VnCW
X-Received: by 2002:a05:7022:7f0c:b0:143:297c:276c with SMTP id a92af1059eb24-1b503136bd5mr3705670c88.33.1794625549801;
        Fri, 13 Nov 2026 19:05:49 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:05:49 -0800 (PST)
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
	Daniel Wagner <dwagner@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH v7 02/17] nvmet/debugfs: Export controller CIU and CIRN via debugfs
Date: Fri, 13 Nov 2026 19:04:16 -0800
Message-ID: <20261114030454.2836543-3-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114030454.2836543-1-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
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

Export ctrl->ciu and ctrl->cirn as debugfs files under controller
debugfs directory. The values are useful in matching host controller
with the corresponding target controller.

While tools like nvme-cli can parse and dump these values during normal
operation via identify commands, having these attributes exported in
debugfs is essential when a controller is stuck in a state where it
cannot process standard admin commands. Exposing these values directly
ensures administrators and diagnostic scripts can always retrieve CIU
and CIRN for manual Cross-Controller Reset (CCR) operations or path
correlations.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Reviewed-by: Daniel Wagner <dwagner@suse.de>
---
 drivers/nvme/target/debugfs.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/nvme/target/debugfs.c b/drivers/nvme/target/debugfs.c
index e85fe1d4c9f8..221fa81e124f 100644
--- a/drivers/nvme/target/debugfs.c
+++ b/drivers/nvme/target/debugfs.c
@@ -153,6 +153,24 @@ static int nvmet_ctrl_tls_concat_show(struct seq_file *m, void *p)
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
+
 static const char *const nvmet_pr_type_names[] = {
 	[NVME_PR_WRITE_EXCLUSIVE]		= "write_exclusive",
 	[NVME_PR_EXCLUSIVE_ACCESS]		= "exclusive_access",
@@ -287,6 +305,10 @@ int nvmet_debugfs_ctrl_setup(struct nvmet_ctrl *ctrl)
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
2.56.0

