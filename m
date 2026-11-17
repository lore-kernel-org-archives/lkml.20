Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935441;
	b=nh4ZAMZQ3Y9yLaKSyHL2Lu1XshBWgBogr55BJF7JIFsGIggQ2YSAzexQP5i3NWCMZiwm
	 Bxfflt6IjazKpaGACqFRvXX72NPMt1biOZtWLsiKuf4LmfG7LGtGBLqTRTBXLxTjNVmEJ
	 c/SmGQo5Vt+4kPVGNJvYfpj2mRTTyZangPgYeyM9UxTQBtGnL0ut4+jCOvYHIBgMbjDtf
	 HkComFkZum0l95jD9mzbUiYr1sgGMs/KmWPjhzatvUQ6buNqolXPKa7S/1mkSQdWOp76P
	 nSJKeqLqTU+S066SewyxGyr+h+mHePSyXZYWEggRLQrRtDHR3mqLKfofkpSfPv2haKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i88WEJdRAzSrZ0XFqkiPRY32+2W0cYtqx6CNsJcFnvY=;
	b=vOQDP1GoShStQEqbdaTwiLRlA5TmpUzd5U3fm9R6qbwG4/gZ063dz3lDfVdqmxXTzJUM
	 LoDvSJDB0fjoynMnierepz+Oi2kAEBMjhLDBiUWFAY36NmozsgdW279mKiFvhW8ZFMHMf
	 laZ3HdbiwXuKxzm2szxywvJIUDFVeAafXpuE7eksfB3IgIUGBP3mxo4f74Zdm8lzMEP8z
	 iORfk1Zp/4MXXAP36leOA8ZCPmdbeR3tg8A4NXBaopo9+3QOeaN+OJzJLin9hEw7ddp6b
	 SFkrmDvAd0d71foo558RZ391r0vb3+N5M+EGl1aIM3pXoYpVsoNNF36kRSfO6P+0Sfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9acTAjc;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A160A261A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90A160A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o9acTAjc
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67be9601f31so4944330d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935439; x=1795540239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i88WEJdRAzSrZ0XFqkiPRY32+2W0cYtqx6CNsJcFnvY=;
        b=o9acTAjcUanHAy/C+WB73wmCBUI6hRcPkYR7/vpE+5ud+wuAcWcEPCZKxLq1ZqtuFQ
         nfUJA1fuszl7vAAdxcnLHQCnvJObrlxxJ+zB4OVquxQrnhOrUdLQ8jVrOnali9ejMcN7
         JKwssh5uh9Nr8Nnsza2ouwM5xVJpc0WdfIiBqzXj6FdXptr/1l9iJZ1oypMveQ7mJcBX
         Irn3xcn2O6HGpZuWbrwUByWrnxNcXl4JkKZmPk8Pd52y0nhxVON0CwyinZ7Yu+jiWKq5
         kpzONrNo/3PAhAjMa/0/e4CAgxvzSS6rTuMz/q+tVXgy7U93jJNVeYang8Jy7eHhhvb2
         eubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935439; x=1795540239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i88WEJdRAzSrZ0XFqkiPRY32+2W0cYtqx6CNsJcFnvY=;
        b=VNvqcY4uvb+bqULjn5IDHN4KScappKiYRmINYPXIXfHUxjtyDdMz7w7CWIhfNKrvIU
         dOpL/mrvd35hin0A0pYt+P0nf8K+ooBJmtizdN3KU003dAvw27A4dQh6XP5fovdbFvQa
         V9k8LLsW/y8V0SHc+lT8Cc1fSXJvDIK+41uz9ByIQUM0o/qpEBAiHO+jKvqq5loFWh6A
         U4PHX5KGIPwNErCIhhSquHQzTfXPljNbQ5QCIfeccv1xvrdscTfAeOw9R3qSQCxeTELA
         fqL5NUCnVTTGdcQbni+d7ebELC0enPoa2YcTIF/gwVGWX+wSPV1nBDhSwHrcuoNzX/vv
         GorA==
X-Forwarded-Encrypted: i=1; AL+hErHoAQUC9sfOwcuTZjuUa1qjWuFUwAryNHG/hGnL+s/VfIPsk/yW7CPj5SEPaqDjglI5Na0j54HYP9AFj24=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MpznVAlfW31cjDmQ5vmItIMvReo+9eVCNjCHuPPEW38Jz48Zk
	0Ut6i2IU2nhaCt4DLyYVYhnWwV5pWBwWAw+Ok4irdreOgdNeTRKS/8z1
X-Gm-Gg: AZFdTZe0a4HyvaDcWB2JYQ+KH6jpMnWdeijpCpvjzfVyZzx3Ko/LcxOya4BBS0j1OMt
	1p8FUKcAdvkUPPYibIZCdyhkrZk7yMJbA+3rawpnYGSwUfER3vjHPDSARqVuMHeJQnn6qp8A9gu
	g64zh20V7r/+8ZkhWER2hCM7gAKzWW6QTz+Ayf+ZLeemZZEF/18wzTrC9idaNvpmxEHjDl/WtcV
	4/LUAcDSTr9IZ2OY59J8wIQ+llpSfEawktVmjVaTaV0eKKpBPmN1uB80/tiQC3xgyjdH29fJPYe
	MzsSldhTHwXXbK6IlYOyISVZ9bLAY2xwcPiWP7vk6R+mQdKMTPA2r8aIuWNf5uC0MmxwjLahal3
	yijo4famaffwQT8fq/2lYL+Q92jNDVmXD5AStBI5Fyl5l98DYgVY6vHAVjVhzWbK4D/g3A7S7l7
	Z0xv9rItbVTz9hT9hafLkd0JhIn/ME+bs/jJr8r/HwxFQNNOn+7S+tB7Viq4rTrqRc1MpHzP+DZ
	ua2mn9OgFpuX9/98WOhX1TTAh/nD2vVIaeOEVbOXBtv/gfXG9Ye95yaR90CqbHlTZRiUV92i7c7
	Ev1Cd4RCccPrgveYGJ/sR075IIQUjFjvl1lUp8WXvZ2NVTd1inR1j1/DxL23XSv8wRRxzH3U8ny
	pEP3doWHxQOAeNhI93FP5+eFXukON1SA=
X-Received: by 2002:a05:690e:128a:b0:67c:1268:ca92 with SMTP id 956f58d0204a3-67dd3d4bb0bmr121166d50.2.1794935439287;
        Tue, 17 Nov 2026 09:10:39 -0800 (PST)
Received: from Alone ([2407:1400:aa0f:8050:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd404a37asm115116d50.20.2026.11.17.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:10:38 -0800 (PST)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] staging: greybus: audio_manager_module: add terminating newlines to sysfs output
Date: Tue, 17 Nov 2026 22:55:15 +0545
Message-ID: <20261117171015.218177-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The sysfs show callbacks for name, vid, pid, intf_id, ip_devices and
op_devices print their value without a trailing newline, so a read
from userspace runs into the next line.  Other sysfs attributes end
with a newline.

Add the missing newlines.  No functional change beyond the output
format.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2..5737f2a32 100644
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
2.56.1

