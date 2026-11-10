Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316936;
	b=A6UOBYsOAg3rG1evHI3D+Hgi63+EGhvgPFrivxcGS+f4DllkoU2srBssMVaVs7WgM0GV
	 osAdT27l3NDFccdd8A3uILKDGf3ANLtuZJX7OOau8pcSzQCCLlZ7Z4pXO7qGIJgfrKwk/
	 Hrf/WCI8YzlCRS5ZiQNNQH1EbmoqOtWH+OzYYC86ZWm4vHBjxmVSJ/oDytdWCObCa2uZF
	 /ygTRJWlT889myGPqV0xoBzhykuu7oZ02rxykFV49qm+vxrjsNr83qzEdCmlCsTyLwm/Y
	 ot493asJHrGqrSZ3f/WvpJjeiP3Waao8lB6HVaAyS8U6c8JcNZK12DT6defYHmlj1Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1D2OMakjENy2CCg5zoH16kIpqUwoSYvl8dD8pwUKqpo=;
	b=no/25Pl73maJRacLzPhRgIgm1NKycb/WoX9Y956vGbvdxlGFz0fwqdwz1jd0xBlASgah
	 acNxgTa439ljCf9jZfLNi/RRpeTJdIYqc29Uugbaejm1nwZYQoMLBLkUDFTZU9PgpPzns
	 jHshUmwTWRp3sw8r5x6EJloT16WbaWC0cnioZkJ4FftViZ87cSzAKDW/P2RUUOPtNSzJO
	 CZGOBVWIst7oxiqICzmuewI1xFRT4w+GI8psGkNccZVbOgiHa1YsrnUHz7dH8ATfbXYx5
	 jyMgfr3GEZUCbmKi3jdatOMcgR1liJVvcJIpU3H8kMQPbzcqsNaONdXGFUvt7nXUeQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Th590W8O;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D30606A768
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D30606A768
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Th590W8O
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9eb579c0eso11119945ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316935; x=1794921735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1D2OMakjENy2CCg5zoH16kIpqUwoSYvl8dD8pwUKqpo=;
        b=Th590W8OG5dZUoLPtRCpkWnbFR/BORsCeoqr8ft7J/tMy9HArk8fsPjdhUxmcy0gk1
         iKacQCT8jgGWg6BIOfa5pYndrgNqoHPgFCgN8kL+CqI0lF2dzkFNuuSA/3eAbdgp2rWP
         ieCYGoCs0G7mgDu6neM1o5tH5H2br8TMW51chw8CxBM39TkTEfLhHDiTwYP5mdKR/aQL
         YnhSHEqCV3874Pb6m6Et6KN7JGxF708PTrBarJF7+uLlM3ZxoB/XyA3eK2OjsAf+U+xG
         c932JRmZsvqYUVZLuiWf7RAlfSR2IzVgOqyTYbfl+vsChtORVby1OdpVPNVZQ71N9E2c
         qocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316935; x=1794921735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1D2OMakjENy2CCg5zoH16kIpqUwoSYvl8dD8pwUKqpo=;
        b=KEdxag50CPBgDqihdZBl3VnWcm9LLAA/UHu3aE4uFMgPVdoEymbdXgyn7oMNAipw0I
         EE71lvWYLYeNAVoEjmQrm9OQIdiVOh42ayLERgFUjtcYizUo+DRhYzKNb32Au251syer
         9gdTrt0YhB6iW9WBw2xkx6DHN6Ka5ZH7KeVhwEtzuog2G1wWGSGigHjfXVX+MCGSAAxH
         DdHfN5Bw4csicRPX9yDEYpt5v80B0ZDpORlBC8Bjhs9b79v7EoBhEJacmGJTZPxN4T6v
         pSr7VEkw1/qbZfl284lUxwjQYgMBFo5tMl8meE5Y2riV3h87ze/BWCIk1+CC8MawPg7a
         Z6TQ==
X-Forwarded-Encrypted: i=1; AL+hErEzMi79UgQW3v/Jeo3n4e/dl1x0thAqV1SU4s+UWCoOGhxR26T/jRpi3eQbzVsqI6eQfA4dYQ8cLr8Ei3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VbVu6APqcUcSOEpjGANKxDKlF4XcskrdvZXfmD53hevOqvlvm
	//CXNiu/OOK9xDjg6fZeHug8HWMLpkDOhtQ1SJ5QO5Q8y03Nzu9C5aPX
X-Gm-Gg: AYBFou27MxNtPe7Azy4H3aYkpMwsPQyVyah4ZgiMQAieA44cE0lK/+WpyJrDyjdOmzk
	wVRXR/F1gfUoK+0TXyGzKbOSja0mBj0RUyWE180FEWhnqTYRGfAl+AuaZ4iZUm/mFM4eyHIeUhM
	zRG7VOv+Yx6sA4nZ3y5oz4Zr0arLVdEbL+wTc/gS7lZOZj5QJiivHJkOUoKs+zsGrg4zjg/97rP
	94XqV58Lg2VqPKPof+n9kxvugp2AGnFKuTW8/05DbE0X47dEXuh0XF7tfIpo9K6IhwosupRgfgD
	9GA3Yuho4cN8W2Jn/nExn5MJZaTD4QjQw9jSFLh5er8wq/58GTbk4UovWL9I2ZrUyCvDYJRrSbB
	74rrVeF2CAl/Y/EdOfBxc23FsQrzgW0AapgCfPkGtLQ4Ufe65Yq3CJ01O+WCoAkzYk2AzDo5mGC
	dnleIpPQid1vnuhrfpcXW9WsmfKri5wsTnDNGVW1aTqPbMup/khfPk5Ni606DYKda8DdoAWEQGN
	3upuFJy7M/UBjRwIl8atIbICMpjvqxYLLsJzl6WhNsZhbPKUspSEHavfvU7y7O/v0CyQHjEKxqb
	bgVasPSYe15XIHnwMqOjb5hrnfOJ7SzPAij1L7EuVUTe6l8chdcNahkobC3DHS0=
X-Received: by 2002:a17:902:ea03:b0:2e9:7dda:bfc7 with SMTP id d9443c01a7336-2edb932f59bmr23584575ad.66.1794316934806;
        Tue, 10 Nov 2026 05:22:14 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:22:14 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 7/7] fs/resctrl: Add info/moveable_mon_group
Date: Tue, 10 Nov 2026 21:20:54 +0800
Message-ID: <20261110132054.3702-8-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

Moving a MON group into the mon_groups directory of another CTRL_MON
group changes the CLOSID of the group while its RMID stays the same.
Where the RMID is only meaningful together with the CLOSID, as on arm64
MPAM, the move changes the RMID index of the group and is rejected with
-EOPNOTSUPP.

Userspace cannot tell whether the move is supported without trying it.
Add "info/moveable_mon_group", which reads 1 when a MON group can be
moved to another CTRL_MON group and 0 when the move is rejected, and
refer to it where resctrl.rst describes the move.

Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/filesystems/resctrl.rst | 11 +++++++++--
 fs/resctrl/rdtgroup.c                 | 23 +++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index fecb2cd2b343..4be0508c18f7 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -526,6 +526,12 @@ conveyed in the error returns from file operations. E.g.
 	# cat info/last_cmd_status
 	mask f7 has non-consecutive 1-bits
 
+The top level of the "info" directory also has a "moveable_mon_group"
+file, which reports whether a MON group can be moved to the
+"mon_groups" directory of another CTRL_MON group. It reads 1 if the
+move is supported, and 0 if the move would impact the monitoring data
+and fails with -EOPNOTSUPP.
+
 Resource alloc and monitor groups
 =================================
 
@@ -553,8 +559,9 @@ Moving MON group directories to a new parent CTRL_MON group is supported
 for the purpose of changing the resource allocations of a MON group
 without impacting its monitoring data or assigned tasks. This operation is
 not allowed for MON groups which monitor CPUs, or when the monitoring data
-or assigned tasks would be impacted. No other move operation is currently
-allowed other than simply renaming a CTRL_MON or MON group.
+or assigned tasks would be impacted, which "info/moveable_mon_group"
+reports. No other move operation is currently allowed other than simply
+renaming a CTRL_MON or MON group.
 
 All groups contain the following files:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 2dfb3b54338a..a3362f8ad13b 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1200,6 +1200,22 @@ static int rdt_num_rmids_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int rdt_moveable_mon_group_show(struct kernfs_open_file *of,
+				       struct seq_file *seq, void *v)
+{
+	/*
+	 * Moving a MON group to another CTRL_MON group keeps its RMID but
+	 * changes its CLOSID. Where the RMID index depends on the CLOSID,
+	 * the RMID index changes with the CLOSID and the move is rejected.
+	 */
+	bool fixed = IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
+		     resctrl_arch_alloc_capable();
+
+	seq_printf(seq, "%u\n", !fixed);
+
+	return 0;
+}
+
 static int rdt_mon_features_show(struct kernfs_open_file *of,
 				 struct seq_file *seq, void *v)
 {
@@ -1975,6 +1991,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_last_cmd_status_show,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
+	{
+		.name		= "moveable_mon_group",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdt_moveable_mon_group_show,
+		.fflags		= RFTYPE_TOP_INFO,
+	},
 	{
 		.name		= "mbm_assign_on_mkdir",
 		.mode		= 0644,
-- 
2.43.0

