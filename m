Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415066;
	b=iN9isoQSvim6F+67XjhEcMmbrxyJ2JCVYqCZdeI2zxgQzZtNNDR2636BvETxSQscP/+y
	 zs4ksLeqHIf96cGI7WPZYx49UYB86KKM+3OPG0idT0NrZKsQV+OLWbGnpovkrjMjdgsjY
	 1FJH6mUq3phOtpDkwt3F0T6F6DfrsAp9SVOFuH2PFL2nzgtIXwqBhGwwxcLlu90corPgW
	 TIGdshEyFNQQZ19ksiernTuUFuyUxSdH9LBRFjLux/CiUzmuOYKMAFLTzuc3PF0KTbXCh
	 T+kbZhtGAShqQ3FFHcZIZUDbM08q8ZqA+39mNOQmj9NqcitIDY4ejXIMhtwGi7ixuCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
	b=SInX5qiMQihm+Yh0ti7WLRPz79ssOOp0fp5KWspcfMNpsoE4cwd+P2xogQQOzNZCblkv
	 tRcihkKswMrEvObV66my0TvWNV29EFw3p/qhw0E2Sr1h1Ic+HoAPeuLM1hXryaZRIUEBH
	 U6jrV/9HYGAuXJYncYRj4Xlwo1oK8/lL+c2tWUm+9PhsepazPAC6MF+/Qek2uKCgaGnLH
	 t5jhfGvcqL2YDpDCN9zs/rchs7UMDpR01/+zPdQSpqrbsnPpvamtZ8ybtgX1mvMthx79e
	 mltjQT9P67M2c5RVO/2d/mHl7476Y+D+NLZBSuyhDzmy8Bo5KFA3fW/RnXMGMESF1VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSXGPVh3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB0860A2600
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB0860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zSXGPVh3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso26034605e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415064; x=1795019864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
        b=zSXGPVh3eZ6dh3GRnYH6oUgf9iQxK5XdkEeTaNUgQg9ub3mFf7yHL1uOwN8uIqluYA
         OMCL1P9w2f2dAm0Ks4mBsrm8mDwPgo9G2jbUhHNtFZpqoRb9wJhO/Y7zPQ02DXA+IKSo
         7pMXRcyKsVPaEPm8HRFyIRibpcCNdYPc4MMzL0x33YIpFlgrCbVoaMlFKSs1V2Y5M8o7
         RRjfTCXGPnzwhCSFALxjVkdJNK/+mfTmWjEiIN+AsffYVc5orGy5kOmY43Zcxoqk8X0a
         j1DD98kA6Yrz2m8vrVc6x0sgMNotK6gbQGyrqtULoLYTBRj0LqmfQXKtmlN7M5sltTR8
         iUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415064; x=1795019864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbBLkzczqje5q5Cdgiw240astKZC/MyEc22DQrkWanU=;
        b=oFYPZJrabE6X2bb1bG55OU2t7ux/LE2Dz3ZDWnjBWMwTjru+2iicxirGXb40XX/FMz
         t8QFZ1xkzjogenelB1nUxsS4js8H6heUjfZB5liP0/Qtjdgj0PF+Sek7h/pphJdA8+Nh
         E4Z9XeULGpLO9XI+c4i4jeKiTMdMJhaJ6IrX1M0TJkhcGWzFacfO8nH9nSMT/BG1JCTB
         hjJbzfhRm7cuGRuUmKz6/LNFUw5dReR44mDwOnIZqI4emSuvqno7BC3rbLvCELaMhU1/
         0l8i0TLUZU1e8vuJh2gFrLJAMvZty6vdn8ngTcZvOBiRkDhvPbDstlWZt1aThhk9m/eb
         JWEA==
X-Forwarded-Encrypted: i=1; AL+hErGz+MbTHiUUAbzhntXUSxqKL/ZfW8bgLpnjTiQ4Q2jWcI+OJBYdnqkjSvqoKE/ZiiMu2LEffeMtfl6yf2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s/dZbzDDx7vKXYMAPsTkACJRfhVt4TgebhWpUIoh7lhT+1Ktz
	WZ6ezc9h3msO2GmuTGVGADMpUPsh/wFv+HoYa6LQLVAyxx3fuY4t0gpucKIOTrYk
X-Gm-Gg: AYBFou0viKavIoPHas6kdzf+/rzVDQGUwsacqZV4dVhPssQZLU4iF1B8UKOty+GKv6y
	sTicbvWoKaI5p7Mp+lCtYuBCzzHtY8obbOe/1dvHVTYj7dm4AzE0nAY/OlMUKaVTPRo+W8hbbVL
	VTrDcNe+RMQZA5JcUVzsNFnowYcqIC8yVNqkmXZU61XsEkV1uPQgPxZDe/+KSq99tpgjFNk5tGn
	OXnV0jsa1HVQ8xqfVDaEbakg3KUxyY15l2C8GBfYvgs76K8Bi9l7fitSiezhZ6fIe8cmSmo7/yO
	xCh91HbpuJ4LUrG1ujRYe4VFCyNNs999+N7S/bs5Hs/VnvTBjmr5jgkWXZ3198DJk1EWlG6S1kw
	qX/snrsH5C+9jISdvxUPUtFHBQB+J8ug8AeqVUjMR4+hipMjKz9uQefYjtqv1yiFCkp2zgnmzWj
	zCTWvt+Scy/TvNjD+mD2nqLIJiuuGVc62Jat+5RO7pQyvmO7w/lqJiemCLrIPlizqeRxN64+jbl
	28aNZxwEUtC29osvy/NtNDvQWthMqpoec74TxRd5pb5KZa/wbZZm7C8QyKXLVAPm/n8UC9YnoGp
	4BRUE5f648XnwWdXKRmd96yHgr5QBS8MpJH4+8EDW5UMFygUH7OxBpBByU1uwggH6an0c2BN26n
	aQ+bqWMfSFAjH
X-Received: by 2002:a05:600c:468c:b0:4a4:fc8c:cfd9 with SMTP id 5b1f17b1804b1-4ba0939b3eamr53551675e9.25.1794415063769;
        Wed, 11 Nov 2026 08:37:43 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm64559995e9.1.2026.11.11.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:43 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 6/7] zorro: warp mfd: expose the fan duty cycle
Date: Wed, 11 Nov 2026 17:37:33 +0100
Message-ID: <20261111163735.227286-7-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
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

The diagnostic frame also reports the fan drive as a percentage.
Expose it as fanspeedpercent.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 Documentation/ABI/testing/sysfs-driver-warp-mfd | 7 +++++++
 drivers/zorro/warp-mfd.c                        | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-warp-mfd b/Documentation/ABI/testing/sysfs-driver-warp-mfd
index fec712b8b9b0..a8213affb153 100644
--- a/Documentation/ABI/testing/sysfs-driver-warp-mfd
+++ b/Documentation/ABI/testing/sysfs-driver-warp-mfd
@@ -33,3 +33,10 @@ Contact:	Paolo Pisati <p.pisati@gmail.com>
 Description:
 		(RO) Voltages in volts, with two decimals: vbatt is the backup
 		battery, vcc5v the 5 V rail.
+
+What:		/sys/bus/zorro/devices/zorro<N>/fanspeedpercent
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Paolo Pisati <p.pisati@gmail.com>
+Description:
+		(RO) Fan drive, as a percentage.
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
index d407c786d44b..a438faeaa232 100644
--- a/drivers/zorro/warp-mfd.c
+++ b/drivers/zorro/warp-mfd.c
@@ -303,6 +303,7 @@ out:									\
 static DEVICE_ATTR_RO(name)
 
 warp_config_string_attr(boardname, board_name);
+warp_config_uint_attr(fanspeedpercent, fan_percent, "%u");
 warp_config_uint_attr(fmwver, fmw_ver, "%04X");
 warp_config_uint_attr(hwver, hw_ver, "%04X");
 /* board sensors: volts to 2 decimals, temperatures to 1, as WarpDiag shows them */
@@ -315,6 +316,7 @@ warp_config_sensor_attr(vcc5v, vcc5v, 2);
 static struct attribute *warp_attrs[] = {
 	/* RO attr */
 	&dev_attr_boardname.attr,
+	&dev_attr_fanspeedpercent.attr,
 	&dev_attr_fmwver.attr,
 	&dev_attr_hwver.attr,
 	&dev_attr_t60int.attr,
-- 
2.43.0

