Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892077;
	b=kldKH+fZ8oDJYlyz9YR97pHtMH6591AIj/jB15KRCOeIhZtNYwpC9OANLJuEEU8aQpmt
	 coEzXJ9xw4/j8m/K1N+36JmZHZpZf1sDMn2b/s9dFKmIjpoeX5jDVgejqCH608iFLZJnk
	 s7VQpc41FYqHK5LZ+7rzkXno4oY+e/a7CD3EGCxAczhK4BnB+hjiX7ST8uR/vLy/34roq
	 Du1/9LOI7hbq61wxN1jIiEQK2K4QQuJRYBF7BRf+GxYuP5iX9JxhadFIG4Bf8fDCmJFXE
	 Whz1ZKQKQHh+t74MVQ8bca7shk4uD1RX6d8Ie2FcaCdpr2q4+AM/Ipj4Sv4poSZSLxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=u2u9PsPEFuJjBc6T1esj7oeDK3O7JwKIO6kYyidKbLY=;
	b=VDHHlL9ODx3cixRMS4z7V0iPzpTO/g4EROjLoMhish1blNaBu0dfEMx6g9qRp5mcES1v
	 7GDKAKg1pkapBZItJGS4hscUKmKQaaJY4wvrPsxdkaXUpl8VWabQQVgLCH2PTCjiK8hKe
	 PYTTiLL25KnWGmkEzZEuQmCCmXKBeJv+D2mdIvnodkb6rK3jql3ZU8+yBgQzja7iNo7xc
	 3BMdgpF/ul56igKu3XWL7Q42dcazqDRv/omoRdIm3tl0F7qW809cVwms2052Et40zNN9U
	 eBpyWkcIkKPgVLhKZeh/PzcdsCyHCsNurqkTI1SBCqNKv8eVCUbNf9ZHpnCHhmJnQwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=rqPPKMgk;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1330606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1330606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=rqPPKMgk
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eafb65e204so641005e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892076; x=1794496876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2u9PsPEFuJjBc6T1esj7oeDK3O7JwKIO6kYyidKbLY=;
        b=rqPPKMgkREkU9IM211ra3k8AITo9T+TdNDhco6Oy60gtAM2RnRAKMggyHKkB4jLaSs
         0r9s/bfxnQAXHahfiW2nyVtgFkMQ0n7u1IHZODS/U9HER4Q0JOoPMLF/vm5Hqu9i+XQz
         XAqaJRpdK4CamQW7eDb8stBOv2z+fYBFmTDh/HbJISeOEhRmQ81xJGoc2NAcnoG8Tbes
         P7aoACeIOyBklmTYbsiURKGDjOd1fqzO0ebyGCG1pbHMEt48DO5ayhwlLKFQ5Yca8eAe
         GtAjVAatAZ2oQpZ/hg5WP2ob8L8VRCw+KHXnYfYZfdipb2KK72+QvrY3WmwfoXezTn2A
         92LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892076; x=1794496876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2u9PsPEFuJjBc6T1esj7oeDK3O7JwKIO6kYyidKbLY=;
        b=HOQyHaYabrVUf5WPHo9wzjKv/lTW471lImFs73Uqke4/tAFtZAtSbMcj52o6Rs7ukC
         Lhxb6VSKb6T43S8BY/T6soaWnPfTVhusFTWlbbXsa1fQzvSjq3ocbi5Zy7jKk1oCFErZ
         Wqc2+TV4lxjh3Z3UZq3VTKNvSKX9YRQSqcFTGk0aZTXF/oEbrpjNzWHPB8q40v+dr8sn
         sDxSaw3wVMQ8Pndx2qz8nn2DgFK4Tj/s86tZDCNkzRIQoyMzn36xRBwhwq++YXqjw8Yy
         57FeSCyDcxuGYoBW213t1URVOIVizjwMzg+gMlekgoNPMgzluvi041jhGtcwwlHTzhpR
         nR2g==
X-Forwarded-Encrypted: i=1; AKwUvBxxkyR7h5NkiIy+MKYBFrxSnnqlhJTgXpygW1yrZTY1Cl5oby6BUACS68e9tLSQNETZ/Ykh5DzkzdqAbpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a6v5waCKXbbqIVFparedCnPqwy+LCSOfyOjK1FK6C1qzElSe4
	AQ0UPBzB4lr5Mrl3oDS8o5NdtAQvGZ8dwowdMP7vcA9ccsxwB8fObGeVNCF3IHcMTKQ=
X-Gm-Gg: AYBFou20AACus8s0D6myTZ2Ag315yUm7P8EqeOSH7QuNUWU8APYllslGFry5iZAmL8B
	C/PeUaf5O8MLhtdVt4JynDzK3s7FSMVkd2xTHHSoUoDASumKEbQKjLBPPA8kmw33q/rK1K8BaCF
	QZv6ZrdTwwxbSbpoJIcuJG3RisPYiDrsjVYR0pq2qfFP+F6xgl45fCfCZLk/Hqk2zSNxXD5e/Fw
	TrgDpKpH2plxMXpOT+z9rp/1XyqJSI4uFWQ8YCnherXm7ie53edY05EkSQQXlHYDHIairZ386f6
	Os+Joa4dnxP4krt7RDO6J0QvF7w4cUI7mzx12MVV5arz+ISaixV4zHDadtSx4hUZzF2DcoT3qp9
	bM67Wh6fvXI0vU761EFF90k/gUmdp0xFM/FBKrpjym6j29hLLVPH2LIar2UKfBTxKJRJ/OJqEiO
	Fgu/WsJ4318mbm1bSi1tBk5KfW10gufbIk7dt4k50tNS0+p9U9maTXX+9LVjXPT3vIEY/PBqDyj
	h3fcQTVQvwiJqNlFSZYBNyhUeZobVSBP7cZqeXZrqRhnNy+YznmJ5ZVZZ3kQ1OvbhuaxvSKnJel
	GoU1va2Z2sMcjRleAZfzJJ0/djHx0OEUPf0pbwdFCw6L
X-Received: by 2002:a05:6122:506:b0:5ea:e188:a5af with SMTP id 71dfb90a1353d-5ec6894ded1mr9818300e0c.11.1793892075876;
        Thu, 05 Nov 2026 07:21:15 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d37aad94sm4845109241.0.2026.11.05.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:21:14 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:49 +0000
Subject: [PATCH RFC v3 57/90] resctrl: let a cell change nothing
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
Message-Id: <20261105-b4-cells-v3-57-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890934; l=2307;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=C92opVjn3f0vj1bT/yXpnChkXGGDp1qEgM2rpFsMc5I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMKEW3pc/80nYyED9rpa7CvnvI7XhWfomql1dcJdBJ9B9XfQzU8gbEdcv4Cn1d2ql9b8TmLlM0l
 1+OG3tgCHMws=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

resctrl is delegated the same way as cgroupfs. A group belongs to whoever
created it, and the owner can write to its files, create groups below it,
and remove and rename them. A cell with a single id runs with the id of
the user who created it, so it owns every group that this user owns.

Moving a task to another group through the tasks file is already refused
across cells. But other operations affect tasks without checking them:

  - Removing a group moves its tasks to the parent.
  - Renaming a monitoring group moves its tasks to another control group.
  - A write to schemata, cpus or mode changes the conditions that the tasks
    of the group run under.

Creating groups also uses up hardware ids, of which there are only a few
for the whole machine.

All of this requires a builder that gives the cell access to resctrl. It
should not do that, but the boundary of a cell should not depend on nobody
making a mistake.

No part of resctrl can belong to a cell. So implement may_change() and
refuse every change by a task of a cell. Besides cgroupfs, resctrl is the
only kernfs based filesystem that is delegated by changing ownership.

Compile tested only.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/resctrl/rdtgroup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 6b7b7daa9fd3..e7f2ec56f371 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -12,6 +12,7 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
+#include <linux/cell.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/fs.h>
@@ -4451,11 +4452,18 @@ static int rdtgroup_show_options(struct seq_file *seq, struct kernfs_root *kf)
 	return 0;
 }
 
+/* Nothing here is a cell's, whatever the modes say and whoever owns it. */
+static int rdtgroup_may_change(struct kernfs_node *kn, enum kernfs_change what)
+{
+	return current_cell() ? -EPERM : 0;
+}
+
 static struct kernfs_syscall_ops rdtgroup_kf_syscall_ops = {
 	.mkdir		= rdtgroup_mkdir,
 	.rmdir		= rdtgroup_rmdir,
 	.rename		= rdtgroup_rename,
 	.show_options	= rdtgroup_show_options,
+	.may_change	= rdtgroup_may_change,
 };
 
 static int rdtgroup_setup_root(struct rdt_fs_context *ctx)

-- 
2.55.0

