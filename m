Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890711;
	b=g5HqsFAOrQN05lq/FEe9A+QX6uYSGcul5SHwPLosgfuH2MT6choU0jHnjKqfA1af3NcA
	 VHqHn7nGy/2EymTf1/du2hvQk11pOJkKod4vmeltiqqjJ7XsT6dwwwdjD1oaJuwxH9FCo
	 ePv3CSNfWs+F29WgjHJxVP757JYXhe8Jse/Z0V5oaPjHcf0UD8S5g3x733lvX3mwtxUpN
	 movboMDFIkR1/N0xbUw3r40foAVyuR/GpvrbArVfqQN96y9ZuWmY5W5uHdbVV/q+cNYQ5
	 81vF08sanb/3VqZ/UgNzh9RqRGghEUq+pbVm/ATjP5+0fppNgl538NqnX6Iq3vap7DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=h4VrnWA7ZgcXhuGabyGlnTx8ufAcZg7zGdUYfMWpviY=;
	b=YsiMUfpYW1x3C8jdGiy+ojABlv0nTZejfsLMhoMA0lvFEm1wtov6WevwzOPFll8OyLo7
	 VdCoyWVSX8DnUSGWVDkBJW4macKiWChmQ32Ve2Erv9rmoPtGDY9q5EZ4wt8BdFdhzkRYS
	 MMai3mO3O5lF2jD2sYDjDXvgIAsG12EtQv0uA8PrwIrQF/KeIverk5Nm2UZeHgbczTi3A
	 6RYjnnYyozhbQJJYo5dnf/dHHVWpy9qwZEeLjEp2nsefaRM525qyKL3aOqn23504Xthrz
	 mwk1rbxgZVSOT5UWNrmpUD2t+c2XNGEdbZFqH7qB1ZO9RhyoiB81RAi7XmrGsZFxK5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=N6N2oxvU;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841E606EEB7
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4841E606EEB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=N6N2oxvU
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e7ad9f78dso234802585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890709; x=1794495509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4VrnWA7ZgcXhuGabyGlnTx8ufAcZg7zGdUYfMWpviY=;
        b=N6N2oxvULytWHtefdcgJgyRSBflsm7Yk1PfWyrFhUW7RxxCDkDiyNMZUHOUaLr4PZn
         DPdMMeJYMS9n/APVrfkungNZTezMtTygYkTam68MoDwR2kMLPnQdEdOAYnNnErq4BeEc
         l9dCgumJVwyXTgbIUkCfJML0AJGe3IwA90O9sm2BhnixqcF6f9hfwgl7pRdkEdP1LYhh
         ULfQ78NBpep5puCy6ukWPNtVwsWDbe2DcBgpi+KWJDB712b696JqBApwYX9uOBXbsjpk
         MKZ9YFXYNWGD7JW5tY778fp5ydqnuG85IX2ScWawUMNmx5mbL+IfWz1zmBzoZyRsceXU
         v4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890709; x=1794495509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4VrnWA7ZgcXhuGabyGlnTx8ufAcZg7zGdUYfMWpviY=;
        b=ErdS3qLo/eU5iRiYxN/6pb9ZaNeLwJCvwODz2VRFQKUEOlb/4i6B6OIujGSarWaVUP
         Rx1AfeldicgsiyOPQzHSVD4+GdNSvgRGh1F0r5mGSltkOOapd5HlSFCz7nKph15srRg3
         OzgqAdUpE1j2W3At/YbQS4r57rM+QXkNgMo0FEJvhHjwcNUv51q+ftHNj473GYLpKyiK
         R+TqPXhTUu/B21PaOb8EIDCTVKyk/RFfCelZJamnuK/xtPrZj7hol+y3KPKJn+FZeP++
         w8hEj1+VW8NxlYB2TN1aHgnVigvkd0ncYJu+5V/D7kPy71hvtRIXLChOdSV9H7EnSxsU
         0xug==
X-Forwarded-Encrypted: i=1; AKwUvBya6gtHxRMRVkHSXNiGgOMOfcmC4/fwpjwpOjuns7lOjZXkKtQk7OJWUafnztjC6houIvarV8hChsV6W7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l4+0aixGz+kHTe6fzVL4iTwv7ggdq4343VkPJYspuRNTr/j1l
	Z8m4soQVYLDiYFcUkKv2kL5ENK81t88oeO/jT1roNGTfgwz5qJD384oOo5klYZSMl+4=
X-Gm-Gg: AYBFou1bUtMSfbg2H5EIzf1ktNndzthK0ttYzSLBZ7RuwdmxCEgSuE+KsMy57eMFg+J
	K0uCGR3jbCbQt4tCzq7rAZDkDhtzbSS+uj1lK1iGDgNNrmxYuTR7z1SRMlQ2X//8jczqBbBurPG
	uyetB6nABVNxeryF7FvTGZLGCLiohtH8VmAQhwocrQ3BHjiPMKBZQXKBNz/OTk+ufr3GsUwM6Sq
	NX7OkGsRMtMmwMgJR+FlwgZT6OB0hat67DI05zel0oEQM6XIfvgyqeojLA0CdbgIa7PlBJVXvBo
	Cce6dtPTspVuf3/r2j3c6zyiU2MzWF5ebxtqgmrG5EVEwO2R5xdt115rUNpNtYYlRczwE7CasZ2
	jPKSifkqXajmbYfY+LSJUshmOEvCfTt87BeqfWhHjI9i2lq/zFvLn+0ExTLJbMe4m+jh22gBUGm
	MOD5CQdAc6I/PB25z3nam/oMIQrEACFjELk5qLbfvBPUZJ6mvVi/vgclYHoab1E+H6BvITem+SW
	yQTbXtqT2KWd9plxoG3wZxqEXJMHff/iXhQwreJUp6bKNZ012/d7dPP7VZeFOxDjrIhd/D7m9dj
	A7Nnc7O1QVs4SozmgbCTP9RFB7CPe0xBEnjmMfLs+l9oYw==
X-Received: by 2002:a05:620a:84c4:b0:93f:dea:3b7e with SMTP id af79cd13be357-9442171286amr3115484685a.24.1793890709275;
        Thu, 05 Nov 2026 06:58:29 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfb2f7dsm49267226d6.9.2026.11.05.06.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:28 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:09 +0000
Subject: [PATCH RFC v3 18/90] cgroup: give the budget of a cell back
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
Message-Id: <20261105-b4-cells-v3-18-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=2732;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=u1GZaQPiSin7FMbtHavx4OO5TkTes4ys58hMwg1veX8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO4NmBOWlVpJRoAnputLqeeA12+xZndEhJYqtWGwv/i/XfVDOBcHenv6Mcka08EAylJBD0PabTk
 /7ifAFgNDlg0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The ids of a cell are only lent to it. The cgroups that the cell created
below its budget are owned by those ids. So is the budget itself, once it
has been handed to the root user of the cell.

Add cgroup_cell_budget_put(). It removes everything below the budget,
returns the budget to its previous owner and clears CGRP_CELL_BUDGET. It
reports whether all of that worked, because the ids must not be lent to
another cell if it did not.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cgroup.h |  1 +
 kernel/cgroup/cgroup.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index 0e45a5a1afea..4d9baf195f1e 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -155,6 +155,7 @@ struct cgroup *cgroup_get_from_fd(int fd);
 
 struct cgroup *cgroup_cell_budget_get(struct file *file, kuid_t *uid, kgid_t *gid);
 int cgroup_cell_chown(struct cgroup *cgrp, kuid_t uid, kgid_t gid);
+int cgroup_cell_budget_put(struct cgroup *cgrp, bool handed, kuid_t uid, kgid_t gid);
 struct cgroup *cgroup_v1v2_get_from_fd(int fd);
 
 /* Was this controller blocked from v1 hierarchies by cgroup_no_v1= ? */
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index fb2775006087..e5e6761522eb 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -7125,6 +7125,44 @@ struct cgroup *cgroup_cell_budget_get(struct file *file, kuid_t *uid, kgid_t *gi
 	return cgrp;
 }
 
+/**
+ * cgroup_cell_budget_put - the cell is gone, give its budget back
+ * @cgrp:   the budget. The reference is consumed
+ * @handed: the cgroup had been handed to the cell's root
+ * @uid:    who owned it before
+ * @gid:    likewise
+ *
+ * The cgroup is empty. Whatever the cell made below it is owned by ids that
+ * were only lent to the cell, so it goes, and the cgroup itself returns to its
+ * owner.
+ *
+ * Return: 0, or an error if something is left that is owned by the cell's ids.
+ */
+int cgroup_cell_budget_put(struct cgroup *cgrp, bool handed, kuid_t uid, kgid_t gid)
+{
+	struct cgroup_subsys_state *css;
+	struct cgroup *dsct;
+	int ret = 0;
+
+	cgroup_lock();
+	clear_bit(CGRP_CELL_BUDGET, &cgrp->flags);
+	if (handed && !cgroup_is_dead(cgrp)) {
+		cgroup_for_each_live_descendant_post(dsct, css, cgrp) {
+			if (dsct == cgrp)
+				continue;
+			ret = cgroup_destroy_locked(dsct);
+			if (ret)
+				break;
+		}
+	}
+	cgroup_unlock();
+
+	if (handed && !ret)
+		ret = cgroup_cell_chown(cgrp, uid, gid);
+	cgroup_put(cgrp);
+	return ret;
+}
+
 /**
  * cgroup_cell_chown - hand a cgroup to somebody
  * @cgrp: the cgroup

-- 
2.55.0

