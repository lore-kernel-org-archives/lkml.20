Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9AF332615
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767897; cv=none; b=DHkeNmbScTWRnbXI9BToZExE1YKVkbxzQX3085kU/j72fEDmyltIY99gmywP1NUrPkEq6m80SxzzG4tZ1Z2UnlHPHAlGP2jioOajev1lu4MDpyGqgzacahNGUhMJan4kdQm0W10E4EIHNecLYndQ0ljw+MPnmD74Gqj0JMBvft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767897; c=relaxed/simple;
	bh=zW/jWEywlJnLpPn3iSmZGT+bzd3gQc7ctNw4LFiA03I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EkdJw5a7X84QvtNy+8yXEiHYEzg0SaUDKBLIEncayhJT1xcGSgh50aBS5o8f1q9NyoMpto6ZwLOI/lybUkcvhCSqLHfo+bHzXw6NSOU7JGNA1JiEzkh6Vtb3R5qjc/A+o9swBJmLHYldYnOxPxaHkYLbM7gcpDkTCyUQw6/Lv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz9pm1Tq; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz9pm1Tq"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so693779a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787767886; x=1788372686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=70l+pktXnkTFw9cxbeR6NIJIADP4PanSEbbcQ2ECs8I=;
        b=gz9pm1TqJOTSncpKxrHtHR+gKXIiKaMsZl7ID8N3qnZxQ6Xv7ZGTBBTHLTHLFMMNgV
         criaun6l6F7vfYRZX+3SvzedIPUC7uK1gLdQCE4GciVKtPtjp3R2iuPfoxTCpSRy1ivB
         73WfmekmKQ2SgM+Poqz1aHJJ0UtjQZWDfS+4sYpHqyjNVo/dwFD8oYyZizmDGgKlNZTK
         Ylq6dDTaq1QU3/hu5oYuqfk+GcnJEJMrspdfeuvsLP+HQIATLWEOAuPCbOEivVp1WddA
         toUAmxBLWrPFOibEOza3iqDxEjDBA+P/c0sfhjMDv6Zc8VeUOKs/3PCg3VxZBZKV+Aqa
         6qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787767886; x=1788372686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70l+pktXnkTFw9cxbeR6NIJIADP4PanSEbbcQ2ECs8I=;
        b=XKi1aA5isynckH1LAY7iL9dAtjR7hZqPnr59I5ttI6M2/+aVoE57lG9nAnugEybWm+
         zsPRPr8HqXnTGn6neK1niMKP/Kiw+ZA0IbG9CzWBBCRsiXOXgX3tPOaZ9knVFSUyZoTV
         paI3CeWiYsK0GMo3adt02CiJQ2KHzidf4vEjZXoTde70ne33dUYk8RMYIQjtjJiO0MgS
         URg0Bltw7Ay4F1oJVXhCXgFj9ul7k7OYvG8wmYs6ZPg/L5n/uQEBwApb5mDXikrk580k
         P0othX9tO5Bi1CZ69QgrXfy9jX4ri0uQwUgHjHELRMhjd6sLu1NRipPlNGORlU7mhDS7
         6DmQ==
X-Gm-Message-State: AFuF++l07OmCAx/oLNWLezL/iZjr/ez9deKtdUa9uoQ451WSUR73b353
	mX9wFpr7U+ArLdnI9qYze0YRj0Nd6s/z+tAAjaFKUdbV2fcCEKsT8VKu/bFO7a26onY=
X-Gm-Gg: AR+sD13wwzVUqRzF77RO/lMzjOYUqU1p9yqIM7ZxgBaPwAzaexTQRTbEHJnkKY0gQBX
	HNfH35OE99iatF2DkgNzCEYwBrcAlWnC9JgsE3JMVsXLMd2ZYjPJI9XsbpPdc7C0P5Kkp+aK7Xj
	bWw+ixuJox3dT86JI9TLWzP3VvPPq6Dk6LNrtGqVWpkSA70/afkC1cpyClk7eJxHl2frxuzaLkp
	6JZjTfEtEilhchW+gTK1dWb+ExtquMH6hSVXtJkLi2A+tIVBaIR+mG7fT6Y7GSlYBoKockKfHxh
	j1XtCstXA5MSPmKGR48v9slWbnefg6b23pBO0+TEEnjuWRknxy9m5f9YJ51naZ4HDOm18rNngVk
	xeZUKFfazcccJGpG3xcBj6Gclih6VFiYI+MMI8Lh4OkTEGiktUN42IQkS6E6Di5b4x5W3tgACqq
	x4xSMiHTDHEZFXRVym5gPVdavOOq4gYJB+wit8bl4kC07L72I0/ymls2qvGXuBbLXY4ZScy3O/p
	HhVHwWfNIWssLcpIzAqyfDbW3SiaDoWeMsqw865Lm4bwW60+wLc/GfLyezNk+4y3KXmn1HIl/Dv
	QXMbikgPJ7NS
X-Received: by 2002:a05:6a20:94ce:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3cf7607a0ebmr19577158637.6.1787767886004;
        Wed, 26 Aug 2026 11:11:26 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e7c:8:d10e:986a:5a1c:babc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9036c85sm9334737c88.9.2026.08.26.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:11:25 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Wenjie Qi <qiwenjie@xiaomi.com>,
	stable@vger.kernel.org
Subject: [PATCH] mkfs.f2fs: enforce alias_filename to match device name
Date: Wed, 26 Aug 2026 11:11:21 -0700
Message-ID: <20260826181121.3825702-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

The kernel expects the device alias file in the root directory to match
the device basename (strrchr(path, '/') + 1) to identify the target device
both during mount in f2fs_restore_device_alias() and during reserve in
f2fs_ioc_reserve_dev_alias().

If a custom alias filename that differs from the device name is used,
the kernel fails to match the alias file at mount time (leaving
FDEV(i).has_alias unset and allowing pinned files to allocate in that
range) and subsequently fails to reserve the device range when requested.

Enforce that if an alias filename is specified, it must match the device
name. Also allow specifying just '-c <device>@' as a shorthand so users
do not have to redundantly type the device basename twice.

Reported-by: Wenjie Qi <qiwenjie@xiaomi.com>
Fixes: 8cc4e257ec20 ("mkfs.f2fs: add device aliasing feature")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 man/mkfs.f2fs.8         |  4 +++-
 mkfs/f2fs_format_main.c | 27 +++++++++++++++------------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index 9096646..430d180 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -121,10 +121,12 @@ Currently, the kernel is only able to mount f2fs filesystems where the
 block size matches the page size.
 The default value is 4096.
 .TP
-.BI \-c " device-list"
+.BI \-c " device_name[@alias_filename]"
 Build f2fs with these additional devices, so that the user can
 see all the devices as one big volume.
 Supports up to 7 devices except meta device.
+If '@' or '@alias_filename' is given, the device is configured as a device alias.
+Note that alias_filename must match the device name.
 .TP
 .BI \-d " debug-level"
 Specify the level of debugging options.
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 8d44a9b..99d92c5 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -191,6 +191,7 @@ static void f2fs_parse_options(int argc, char *argv[])
 	int32_t option=0;
 	int val;
 	char *token;
+	bool is_alias;
 	int dev_num;
 
 	while ((option = getopt_long(argc,argv,option_string,long_opts,NULL)) != EOF) {
@@ -218,6 +219,8 @@ static void f2fs_parse_options(int argc, char *argv[])
 				mkfs_usage();
 			}
 
+			is_alias = (strchr(optarg, '@') != NULL);
+
 			token = strtok(optarg, "@");
 			if (strlen(token) > MAX_PATH_LEN) {
 				MSG(0, "Error: device path should be equal or "
@@ -226,21 +229,21 @@ static void f2fs_parse_options(int argc, char *argv[])
 				mkfs_usage();
 			}
 			c.devices[dev_num].path = strdup(token);
-			token = strtok(NULL, "");
-			if (token) {
-				if (strlen(token) > MAX_PATH_LEN) {
-					MSG(0, "Error: alias_filename should "
-						"be equal or less than %d "
-						"characters\n", MAX_PATH_LEN);
-					mkfs_usage();
-				}
-				if (strchr(token, '/')) {
-					MSG(0, "Error: alias_filename has "
-						"invalid '/' character\n");
+
+			if (is_alias) {
+				char *dev_name = strrchr(token, '/');
+
+				dev_name = dev_name ? dev_name + 1 : token;
+
+				token = strtok(NULL, "");
+				if (token && strcmp(token, dev_name)) {
+					MSG(0,
+						"Error: alias_filename (\"%s\") must match device name (\"%s\")\n",
+						token, dev_name);
 					mkfs_usage();
 				}
 				c.devices[dev_num].alias_filename =
-					strdup(token);
+					strdup(dev_name);
 				if (!c.aliased_devices)
 					c.feature |= F2FS_FEATURE_DEVICE_ALIAS;
 				c.aliased_devices++;
-- 
2.55.0.887.g758fc8c411-goog

