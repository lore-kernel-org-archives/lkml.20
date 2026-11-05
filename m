Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857178;
	b=fjFmkHwB5vZMoGKBLMYvyqY4yhnGftARu9nEdcLn7/zXjfLTClxb5lsYW6UMO4UPxsIZ
	 rgJ9+hW0z8jWpwotBawwU+m/J5tPteSLigLlzbJ1jjTPZ3INeXap9YD+2MdXLRaS+1QTg
	 ZJKUvnTn8E2QK5FFpAgoCis3fY6BLunY84i8JHKygK2nU1daOv1DI6QcbpoFW9cC6Xf3Y
	 i+YWMT8Jm8xzmgbOLZnhdOETUpnFYqvTWPnyHIYx8Hni+gVAbkGyz9WkrwrhxhmA/G6u8
	 op8LQcwy49wwSvFbjEb/6GJUe1por/VoDoEBMPeCUcGw2LT2+iJoh1tSevwV3NY4vMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zb8urviQtBLgbNWUzwiTWUQPBuOVmT07HgtSLoEJuzw=;
	b=s4FVPB/FmBuM0RUhbWlJ6Wuerit4UJJpNQkL+3gCJhYa+jkA25EfYeVK3Kv/FbFoJJ+9
	 r1UbNbDNZXWJzpu0jZUpSh0TyHmWrmY/R2Sud9COUdSsSRZCGwXZdnbo7lRzN6udZ80KZ
	 eWZq7NaOjKvBfYFTfckz59q+sllQHmC2JVF8/tTT0MQ/8UIlrJNQyM5oo3eoqDRGNCIjT
	 0y7E4pWaSzi/7HFflLla7aoYZxqzzpWcRWp+JmjxZT28DahIvy+9e4fsyJNzBWUsLEPXl
	 i8PJoVJMNRH6PiFOR8aAnpu3dc6wKD/E8C1tDxtKktxd/20nRQAr4WQdUd547XOVjXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrtykEZN;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017B606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4017B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrtykEZN
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2585734eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793857177; x=1794461977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zb8urviQtBLgbNWUzwiTWUQPBuOVmT07HgtSLoEJuzw=;
        b=XrtykEZNasYdt/6SffzLapgWzNs+vL+S1AK/vssprL9RC934PkjJvS79m5XK33gK/W
         rOSil0n3jpCdsRoetjwk7ZrF6JHeEmXJ+eUM23meDLZTmRknGUobWy2JlZ5jCTWyMXmO
         NT2W9+eLolDUJ58egFtRa+h+HPuMrjSbN/lLW9BfmGx4EjTZqZ+NYyrD/XszF7qdymR0
         062vslxfhzkBAPNCxQaVMCNfCRXbSAlfn5/EvT7rE6hr3sJAVobQRsvz4Qj3V7wL79Sx
         fIEoX6H7LoQwxNscLqHn48m5g5BSM8PtA0wl9i+WbGKAg5lSjIaf3ovBx07+a5FVHynO
         9ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793857177; x=1794461977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zb8urviQtBLgbNWUzwiTWUQPBuOVmT07HgtSLoEJuzw=;
        b=yfMW/VC8xT82WRRwva6uRzPaGw7iDNHRQCtcCyfpek9LoaA1E27TQ3sdpF9nSY1FYL
         aG3grm8YG499TGF77hwvh+ymKfSdnUdiQqc3OBZdGZKZs4H2DNH7j04TtNWt023Lw+31
         ldfg5RBBA/TvhZ1XrBgDQT2yO0W6ZzORxkjJzN9jznb0bN2GzpRHOLxpd5/SEBAo5cQx
         nDoClvEi+iMtHSITXobI59epx4WKfob8etv+VGdYfQUrxlEQrjS6PsQmpzUYKDHqXKf3
         k6DMwIbG+vWVGH/Z4SeExH5s9DA+YC4i8ZlN/Qk1WQfoZuaG58WDQEVxQGSVHZl1dYfV
         igdg==
X-Forwarded-Encrypted: i=1; AKwUvBw2DtoCbhT7BrDuz0/k/yC9OWg37oY6Z+6e0d3vYKKjqQ+UfRviWOLRm9HjgmPAIPXK1mBmbF1r3i80gME=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZQDgXTAMQUnO/xQ6aEpkQWVhDXIXaH36f0gsCAx1UOufOuAGl
	ibiY01B1safzj9ZRYukMzghSlHJNgjgLWVdbkl06VB54dXgjdLXadtXY
X-Gm-Gg: AYBFou1/DomHEiZ7qF6IL2HFV6R6CpKK2joberxXaEVmTWVoHZeoMF08JW0wJbt3RkM
	wUlMd/PeYCJ7c7LwmX7eBAmy7FA+f/AtzFcKEF5owju+JnFGJfrdbO3brkcYgRLMdtMWYnKY+8E
	7YmrgcZEZv/8pZu27ELIivE2LjHNbvb02yjywn1fZ895SE1hb1+qS7TEfRhwpwtuY4mIPSjmqxu
	/vXiEvrWwcAEjYutOXt40SmUf83Ea6uZjllrkutyQ+hkyuMlcg+X5JopMyZkfxDhlBZM+7AYq2T
	3hmISShiFvPGdU+fSwQyPygAALFrdhFA4hoRD+SmvkFnsYMuVvA3rlPlilDU3E4qsxQJOtbsBDW
	ttgu5eKkNrVWb/qeb8YGAquUYwnFYVEVDU97XQgKHiFoaJ7DmpJaT8HfgP4kyQq/9idN8qsdUCb
	80PfHjQ3kdBUIiFIjkYQu21hFTcsBg8aD7yA0l0Ga1d2dfxspPHVY56N+/PZnqddhpbdaFiX4qW
	XuCZmQsHxyvtcT68dfFoxDaFRFZnBqW4D1OuhJSyMNNA2W01sDmVtbDY+EhSki4/qTZFDCRihEp
	8tnFRSrTOUfDiuRn5RPfi1R6pHh24Nvfin8UzcHD6ZDnD7LHWUYvCPc5fK0GxZjr/Vz/c8dDRKu
	o4SrBJA==
X-Received: by 2002:a05:701b:454d:20b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b23b5bb847mr11221092c88.8.1793857177219;
        Wed, 04 Nov 2026 21:39:37 -0800 (PST)
Received: from localhost.localdomain (c-73-158-21-37.hsd1.ca.comcast.net. [73.158.21.37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm12417912c88.11.2026.11.04.21.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:39:36 -0800 (PST)
From: Saad Varshani <varshanisaad@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saad Varshani <varshanisaad@gmail.com>,
	syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: uvc: Fix deadlock in uvcg_extension_bm_controls_store
Date: Wed,  4 Nov 2026 21:39:00 -0800
Message-ID: <20261105053900.20082-1-varshanisaad@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Removed su_mutex locking in the function uvcg_extension_bm_controls_store.
Done this due to the deadlock caused by the mutex conflict in
fs/configfs_write_iter. Validated commit with the C repro provided by
syzbot.No other conficts observed.

Reported-by: syzbot+300213c2b5b55c0244f4@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=300213c2b5b55c0244f4
Signed-off-by: Saad Varshani <varshanisaad@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..78588366f656 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1114,16 +1114,12 @@ static ssize_t uvcg_extension_bm_controls_show(struct config_item *item,
 static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 						const char *page, size_t len)
 {
-	struct config_group *group = to_config_group(item->ci_parent);
-	struct mutex *su_mutex = &group->cg_subsys->su_mutex;
 	struct uvcg_extension *xu = to_uvcg_extension(item);
 	struct config_item *opts_item;
 	struct f_uvc_opts *opts;
 	u8 *bm_controls, *iter;
 	int ret, n = 0;
 
-	mutex_lock(su_mutex);
-
 	opts_item = item->ci_parent->ci_parent->ci_parent;
 	opts = to_f_uvc_opts(opts_item);
 
@@ -1157,7 +1153,6 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
 
 unlock:
 	mutex_unlock(&opts->lock);
-	mutex_unlock(su_mutex);
 	return ret;
 }
 
-- 
2.55.0

