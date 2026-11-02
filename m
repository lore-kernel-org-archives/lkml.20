Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628288;
	b=z5e9lOSEO+iSur0hyQVQ6BAeETmqq4B9hZknPOG5ObdC+APBQW4K5r2BxAMUGizddXsp
	 pnIdAaxbt660dn43jWhUpL0HTFTHiiSOo/UV0f5+Zh6GVREaExRhjEWJnufK80Q0uhKdk
	 DqAaSq2/6ugmfINd99IMtkgnNMl3LDJsFSecM7fm9c24VfZxRvaVIN9yZDqAhPtRnl5m8
	 3JbpGdosbjVBiqGy72G4vtqlReeEZv6OSbvNQ8anP6W+E47d1xiykTpcKPM7CTKvowUj1
	 0ysybk9zQqOr0ZACdhqktrKJvL4e/BinVj78IukVEzHvBGzyrYeH19jWh3kMx27+qzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D5tqyyVkof7RtlNlJ5JHbIBnf1yP7JcExQ+TmA9lfdU=;
	b=k0KaeSJW2ajxY0ARXGHUKDtmyrqgsQUrEijgfWtrKcpJ6DOjCGfmk5rQi4rUyiOhcyMT
	 CsuAAMncG9wLVHebEaSaNZ42uZ0qI66AB0/Ej3m28mnExESgiTM8YqxZjzY94phX+QiYR
	 OWqMWOcHk1Clww9rUAj7SgUAkLKbnTGqDb/GOYg3mre+biCDiYXJoFni+3xpmAR0vbWX9
	 f7LIKduqYdYnV5QqE4urg9Jthu1gF0IYY3ADVb4gqa59tHlyV5kg6N6QqoN3CHJY37PCL
	 IHpo/lBC4rUqCFsqyHS4w99SEOK/pJO+kYYOKFhu3wOsDeSaqa/B6EWP7intmLGJI9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Xmefu8g/";
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1E606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1E1E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xmefu8g/
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so791269c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628287; x=1794233087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5tqyyVkof7RtlNlJ5JHbIBnf1yP7JcExQ+TmA9lfdU=;
        b=Xmefu8g/zrl4ae2miH8v0AyB5SCdfckQ8MvJZYc39d+eDwya1zvlz5H9oshNfX9yOL
         5mLbF/AmurqJu2LCHTOm0R68wagyhRiCtfOmO4Sz3EpNUygUuiUXp1laXxm8kf7a73pD
         mvcxau+GT2aJrUKuODKh9z6frAepPhwqg2HlIWXWrCmvGcq13h5O9mRBRtpm87eOnfHt
         Dk36YfbVAiMzHBfregnJLP7xu3iF5Kx1YII2QnnW7qgzduo8JTZUQWPPiKrrsxg968HD
         i7NV2iMcNn0bJPm3OjQOb1r6DEId6F8UNwbmDs480jyx/J8g+xSkgeGqlz+wiBC/Pfq0
         aoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628287; x=1794233087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5tqyyVkof7RtlNlJ5JHbIBnf1yP7JcExQ+TmA9lfdU=;
        b=V21Y6Us2ei3m1FtjHDzmNYwyh8PTOTvmzLO5lLhlrF6xUI9VmqOJwIep5y4CxrPQ7b
         rxdhBZn4HusHaSixBXC8CyJ96gGlPYZdgP27HiOIVIQrKeH/wkzbIPOaDIrI3zsfjnju
         AW9q0z+p1LDgNqfwYUlbyUYcZ7FXx6VJApiz1MImUmVHbh8MWzzPI0snrpMZk7UZ7WlY
         oZdtl3+6RNljV+zAgQCt7LxAPPV6PM98pwLoaL2udPp1KiCZFNtKdN4AY87ZlgIg6qoV
         6YmSyhz6iuMRJ1QL6w+wj0Zrce5YmKL8mEiT98c6k4VgKCNmboKCYop7kAWlQXqbnoP9
         dbjw==
X-Forwarded-Encrypted: i=1; AKwUvByJ0zLagXwFGT+sVpeyLmbl6vttDtM88oQ7izvKSJ3spqRkUGmEHvZCl/pRLjkUDFLPh/D+m3g7HeMtB7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKL9pGGIfm+EaThJz+aR9cb1bb+qg/AHLHMtVSiwIFBLFw9/mq1
	JQYqu53J6y2dg7HPYuQty/dX/fVapPTU5u/2QRONKhsIVv9uv3U8Wt+P
X-Gm-Gg: AYBFou3IYTxuSMkWbjVQMZIgJIeH6jNZd/vz8t5Amg3xZtv6jbyFrnaPh4nxWsjS+us
	beLVLukN8jrpiYM1CpZzORAvJ3HhefeTZCIrEuR2+ikG9TlUp+fjJr5Pipdhm9ThD/xLJyMINWg
	egimcMFRVGcbQ+j+57TNxzuOu3gXMy46ryAMznqSN1dhxLh90ANIPf43cMDzFDbwC9rAXQtaeRH
	pg0O1bsQqMNLs/60kDvheJmfJxDnEICrOwygDrrLVEshDGDCEs4C2fW/Dex2H83fkvRtFbPlJwd
	bZvQz04Nq3OUQHfT6hpMFbuw/hrGWimnO5flH1f7pblgkwtPrzfdP1xq/6hK1YLTaVDhJO2bmR/
	tXDhQIzXgK7oHGcgLSTu4bClvESrkDeMpkgDpL46oXMIcIR/kEGtNMq/juBsh5pr2aIfFeGSRRC
	5wvYANqi8tZokldDRGGlHhbh6OED8O/nFUuxRQKI64QflagOJgkdZ1F5Gg0mcEryjF4PgJ9dzlB
	nWZ4OnkVZtyUBsAyAfwywpP/0wqlBT/j4MKmMTVZ4ohT09TVuvKq2gTNgFU2jvHyjVjH9Txh13p
	X8F/tP4shpbGJ3cedThViSXb7dAlhAj13xypQMNP9L+a9546XwGyber6l9Ce
X-Received: by 2002:a05:7022:120c:b0:164:8e14:4939 with SMTP id a92af1059eb24-1ac59dd190bmr13232652c88.10.1793628286706;
        Mon, 02 Nov 2026 06:04:46 -0800 (PST)
Received: from WannaCry ([2405:201:a418:c1d0:90a2:f39d:9eab:aa4d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm34153611c88.12.2026.11.02.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:04:46 -0800 (PST)
From: Adhyansh Verma <adhyanshverma2010@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adhyansh Verma <adhyanshverma2010@gmail.com>
Subject: [PATCH] staging: greybus: audio: add newline to sysfs_emit() in show functions
Date: Mon,  2 Nov 2026 19:34:38 +0530
Message-ID: <20261102140438.103135-1-adhyanshverma2010@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Per Documentation/filesystems/sysfs.rst and kernel conventions, sysfs
show functions should terminate formatted attribute outputs with a
newline character.

Commit 14c91651df34 ("staging: greybus: audio: Use sysfs_emit in show
functions") converted sprintf() to sysfs_emit(), but left out the
trailing newlines. As a result, reading these attributes in userspace
outputs values without a line break and checkpatch warns that
sysfs_emit() formats should include a terminating newline.

Add the terminating newline to each sysfs_emit() format string in
audio_manager_module.c show callbacks.

Fixes: 14c91651df34 ("staging: greybus: audio: Use sysfs_emit in show functions")
Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.56.0

