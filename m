Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984622;
	b=Ue1bCWOgccHBc9OgtEqorTt9zpD3R4CYGK78MqaNlk9S1VHObcmQUGrEHKnvsKD07l0q
	 WioBTrXQQCkHNygQJSdx2j6CfYn205BQ9Iv2x2Tm/Wh9uy3CX1jFM6lm3ZpezoDHvjPad
	 8fxanOPXC7BdhdbVyEF6S8DYjvakJeRUKbAxoN0cfZaBtjYLuijMJcHRvSHQeRw1WAppT
	 Qn1QclKN/vASNqSckywu1hfq635NFqUBhT29ykx7QbGNLp/2OF8UHwHZWIBGOktEciTBF
	 0CPRSDF5ZMZ5j07gvF/YSVmNR0qLRXNXapu9GBEu+1lw+KDXTl4KF7Fdf21br8Ax5bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NenYAvPhHWZ/46YV8Jd0FVOjzULAh5TeHzIIJT0k+CY=;
	b=GL3p6MK78gokNKzgQuThs6DHf0k2DOnep1rF01TTj7aug+/D8qIqf0JzcMaG3aTqqZ3g
	 imAVerDlie5DPpQ01lBr6C5S94zHu684YPXbLzGQpyG0t47tmVyTPOX+SjIuqJ7vxXdjC
	 XVRyr7EISN3/vLiETNUPVkzpBwdwa5fzz4uOpowObuEd9jV3yhu5MCOYyig+icoAF1G8X
	 IfaFG7fM3YbSnoEuei2JfPvulTShg4JDKrwjGPUDwC4rNySMg5zqj821E3uJ1bsDrIfXW
	 fgLrcWJPqcEWj1X92c3FMttv9QtDlXFWZy8psXZ1gRJpDjIYkzUvW4iofJU28ubhYDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="dt/NcDME";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A31606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A31606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dt/NcDME
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4377432eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792984621; x=1793589421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NenYAvPhHWZ/46YV8Jd0FVOjzULAh5TeHzIIJT0k+CY=;
        b=dt/NcDMEmKOVELO3Q/Q1vfpogzrtSDRawkNZF2nUDqVOK0ZfZbYAtF7bXQUI7ZRuHg
         n2vzRlq8J4S/4KMrkjt4KWJEAhyILUHUo02eIA0SHcCfUlL3Gfc6JDVl7ZEmx0tHc5lt
         ltktK8K/E7TEE7xEgH1I93V4kyXFCs8HiCqpau4Er/jhmT7/n4KSVhSfLpolHh5oC/sM
         xFht5j9RcAid8x9GyoxOj0Bf7p48ar5mGW+QATZtMqMDCBwa4+hTZxO3ZG9LhjLU/vm5
         JRi0Pq06585EogMEZMr12rC/E+AmJky/RRN8tgJWLp9UtBn3EP4Muaks8zIbhZOe+ThT
         0vJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984621; x=1793589421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NenYAvPhHWZ/46YV8Jd0FVOjzULAh5TeHzIIJT0k+CY=;
        b=V7BntmVqp0777IBF/T0DdK1WmjVSdLQj8EfBFRzhfCdfWlv34e8ZN+UGkj3UvT19S6
         qo3wKRy7YGE+5n1RmN0wW3UpWh27bLQWnfiA9+NQDM8YEcMPGgB5mb9wi79JHb6ovAZW
         mnLaSNMRHqgCXjp63pcYpmHHGJkrJ2ejItTA1wV8+FGbNF1l5pLUQwHPQuFGZDuyW97S
         ERiWhP2VTs1kDwieDKhop8d63M13Dev0mCup3qVEqSpCeos1YCv7pM75GP3XtFIt4abm
         IRyvjm0x519xNvZCXRqEdotHZP+a+md/THcGQf33h4psd+jvi42B+n1fqCYX8b4nbpp+
         k8Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzZlbZ4R+EdjvAD/836NK5JqadE7U25h9DLO6dZyuulI4rW+Bigsif5gRRqSUFIAnDAVBxESCLaUWTBrv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEGDbGJIJ5qlGZsjTxazjewqdDCtC6+pDSihVR0giDai1lpTlq
	sYJDaAQm9w9NQ11i1vxA9i73jqkXw2USSCg9e7Q8HFjlFTMhL2cE+DTG
X-Gm-Gg: AYBFou3RS5GoY2tr67Qn5MpeXxGdk2E5WPCd1njFBQ1q3M4knmBygszRTYX5+qvUPHF
	1jhli2qa2RkG/39zPEW3AK6NwNUMxz7SW1NJeDysH6FtppqZEyp314KJlnaYgN/GXNpnIRNbg+X
	hI6oFJfu/k2lLhvpfR+2GfAZHZoVrTvH3SECHojZRrqZ6Vdo71k/q4v8c8aWOgdbdImcHiF86cd
	/4FWUESRSwV+CdTUY0gUUyPWYvAXCkqw3NU4O5NQmITUQGWZIj2/7RbDlQzEPKm6zCnm5el8sTX
	Ou+1F5IoPyBWg7f9pXUZVrlLon8N8MusJy/KOV/T/8V8w5nNzQsP6kILG5vP6Wl4H5CZhge5nmM
	cuUc1p7sKH7Vv66swjZUB7VRPh5mRqSng1L+AvmXrtDsdwR+iWD6WmZeFX+AnNFgv/MvF3GVtnb
	pvu1q5vagViXkMgxPHNAJ+sKG9Wfnf+W8mYsIuv7n+dTIWIKzrCx8mttl/W+68C1iEXZ9dnNA4/
	AEWCxKy1IEifau9NF2e4//pi84VxPGPU8ivk8pKD4OoNfa+LDdbEO1s04lLxJ5VV8dfkwy6Lwnh
	Rh4rOe5spav1XRl4+3GssULK7iCgK2oLWXz5T8cRJ16GwBwje6gQ0f/FHK5EFvyLMKOHJWfSnHp
	ezResaN7Av3nJ
X-Received: by 2002:a05:7301:10c3:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-369e8660376mr12281630eec.30.1792984620819;
        Sun, 25 Oct 2026 20:17:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm25485942eec.24.2026.10.25.20.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:17:00 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: pcmtest: Reject invalid fill_mode values
Date: Mon, 26 Oct 2026 12:16:55 +0900
Message-ID: <20261026031655.2699561-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The fill_block() function handles only fill_mode 0 (random) and 1
(pattern). With any other value it writes nothing and does not move the
buffer position. A capture stream then gets no data, and a read fails
with -EIO after the timeout. Nothing in the kernel log says why.

Check the value in a set callback, so a bad value is rejected both when
the module is loaded and when the parameter is written.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/drivers/pcmtest.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index d1b0dff56cd9..422fdb10f237 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -72,13 +72,32 @@ static u8 playback_capture_test;
 static u8 ioctl_reset_test;
 static struct dentry *driver_debug_dir;
 
+static int fill_mode_set(const char *val, const struct kernel_param *kp)
+{
+	short mode;
+	int err;
+
+	err = kstrtos16(val, 0, &mode);
+	if (err)
+		return err;
+	if (mode != FILL_MODE_RAND && mode != FILL_MODE_PAT)
+		return -EINVAL;
+	fill_mode = mode;
+	return 0;
+}
+
+static const struct kernel_param_ops fill_mode_ops = {
+	.set = fill_mode_set,
+	.get = param_get_short,
+};
+
 module_param(index, int, 0444);
 MODULE_PARM_DESC(index, "Index value for pcmtest soundcard");
 module_param(id, charp, 0444);
 MODULE_PARM_DESC(id, "ID string for pcmtest soundcard");
 module_param(enable, bool, 0444);
 MODULE_PARM_DESC(enable, "Enable pcmtest soundcard.");
-module_param(fill_mode, short, 0600);
+module_param_cb(fill_mode, &fill_mode_ops, &fill_mode, 0600);
 MODULE_PARM_DESC(fill_mode, "Buffer fill mode: rand(0) or pattern(1)");
 module_param(inject_delay, int, 0600);
 MODULE_PARM_DESC(inject_delay, "Inject delays during playback/capture (in jiffies)");
-- 
2.43.0

