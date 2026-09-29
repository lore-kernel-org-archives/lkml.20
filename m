Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446E5335B6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699793; cv=none; b=a2dq1+SWHUPUVZvpzfw72nZC1b/j9avQ5Hk7MOYVUAe1bLYboQ7pXJvqKYuLvyxAeOQTMGWXxOEyX1cpn3vh2M+95nyTaRBwtTN/9KxDJyk7J0GLbI+kNkTOMWHjHozAziPQ7+k+3qVP2HjnJjdinLIr9TWVCd8RwPTOjZsFjmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699793; c=relaxed/simple;
	bh=pjYrJ9i0qHLTf9O3mi8TxMKUEWpf47OoDqxCYILUe3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l9XR12c9fHpt8VE/GjnvUnypVduftnJNoMnyUC88jBOXvHchOuo3uQZZJ436SWzrSZVIkwIR4mW9wcceCQBbFgxFDsS8N8NsQnXDh0ObKvu2CLSG+oeiXqkdNB8HDDjRmFgKqgRjhcYnZqbpM/v5DDBnauJRYDrQl1EGAXIqGPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNTZD5aV; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNTZD5aV"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666ee9b3bso34660847b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790699790; x=1791304590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v87Cgp68PWMd8kFdgdgVYnaWP/CXIf2dW1oTwO9m/XY=;
        b=LNTZD5aV7IMmmnDEIdaTXnRIyuV2vY/1f5AgHux8GY6Ex/ox8iDUhrQveaHZyTNzjX
         Y4UusdUBRYouAjQcI0XzFlwwxRMBesofftzpoAgVQ0E3J9944wUD9XwvkWgsnwyTFGN3
         nHmy0tQXkmqao6fE6xOQa1Qkv6OEwtlgBRPfd09EbkrvonHJznH5/b97+fYo6VPEQ0Bd
         LE1Grrbao0Ua57FPBaaaPsi/ieWjsj6B63tEr6lSCfuelboofSIeChjOpyVGPvn9gtpx
         oLYFsJ0CPp8EaLY9tzGypVpzJ7ViT50+8EIuNJAd68V1pY3VW5SMwQxBqT2xwvxzpkgQ
         S45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699790; x=1791304590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v87Cgp68PWMd8kFdgdgVYnaWP/CXIf2dW1oTwO9m/XY=;
        b=1aMmNKT2Tn4YvvVSWStNdKWjvgzTGDkoFtNewe2kMkQrSwU+CF45/HzaEC+wwX3+LQ
         mlVOwhXK24qeWMunAj5YoY/UFJT3amnr6MZ+6nyM54Z44IIPwA1m8k2IYOy0SMr3326V
         QLy18RJEciceVqVn6qWxx7zSHQXLDNPkGjjVscXNnPFjwxZ+L1S3z97GtydUHZKUoPay
         U+UCvEJkD1SXLXHa43nIJhqhtm9Br9esB5/QV4sGfz8tyoOIXBuSQSSmLltuTcvTaaBB
         UjoLv5S0TiKVnbLBGDhBvU5GUefGutw0rmUK1bT58FEwY00nxFLGBqpfcUKUNTuQJjG9
         hryw==
X-Forwarded-Encrypted: i=1; AKwUvBxUaTiTXXKPOzTW0qK1pR2hx5Ci3oNIv3Y8z9YpTm+83XUFI//5q3yIMuFS7tu+wXP3NPzpOSws5p1MrWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9oCbglo/bM1tLqbYqsw/P6wE8KHnHwELNm1jfFlZODCJjCjOq
	1PDC5dpC4WYCbyayBxcQ6kcSkysTTzik+yEgOHIv/oMqv1ED3sMyLw08
X-Gm-Gg: AYBFou1dgjg6yXWGudtXLZj01CO+pyxX6ggyVedxmKdG/Bq9MsA2fU0Yb754OchPmgk
	DQTUmnyeP17UI8fqg1qy/9PCkU1K2U286Uzvlg7dYrC0eDMVeB3Rn70kWtvO2jKuGOfiJ2Dw7Gy
	0/SsYNdzEtA+I0+U1aM/mTbzWAfRPS8EORHksmpteGL/5A5TV0Qw95PkA79gClJSekJzO1z71to
	ad154hIQmt65OXiDqhwjBhOX1qrizlixnlvgeyGJZUgB3jWfO1s9520L/GcqgxmlJIXoDGWsVY3
	w0nX+fuZ5b5NVL+MZb8kl6eKuIorqC1Akxdsz46d37mYO3Y5a+KlZGYq9RdSLBL3oQfMYlmt/zz
	AyBsKFG1XjUMk6AukxOFA8VUSna74/8VVkvPUVW0pXkoqvRPgcckBgPm4CaX0jc+vGoJimbPBSm
	tu/vAANjQFp2hMEc/99UyCsoqZgqPsGue25xoI1+XotwQwSDAH08DiBsG35b6wYXYhyflzveAft
	vVlnJ/XI9WzCUS8ULVRB8GCZnCxakrJyWD4TAw2uqk2lwEa3uzYJg==
X-Received: by 2002:a05:690c:9d:b0:820:1014:526a with SMTP id 00721157ae682-8a649591e12mr103054527b3.29.1790699790606;
        Tue, 29 Sep 2026 09:36:30 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8abc8549056sm1027117b3.0.2026.09.29.09.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:36:29 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v5] media: uvcvideo: report AUTO_UPDATE controls as volatile
Date: Tue, 29 Sep 2026 12:36:28 -0400
Message-ID: <20260929163628.1004589-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report AUTO_UPDATE controls as VOLATILE, and EXECUTE_ON_WRITE when
writable, to describe the driver's existing read and write behaviour.

Volatile controls must not generate CH_VALUE notifications. Filter that
bit in the shared event path for writes and device-status notifications,
including asynchronous completions. Keep flag-change notifications and
initial subscription snapshots.

Suggested-by: Ricardo Ribalda <ribalda@chromium.org>
Assisted-by: LLM
Signed-off-by: Michael Jordan <jordan.mymail@gmail.com>
---
Changes since v4:
- Resend only former patch 1; Hans merged patches 2-4 into uvc/for-next.
- Fix the EXECUTE_ON_WRITE explanation and spacing (Laurent).
- Filter CH_VALUE in the common event path, retaining other change bits.
- Drop the Reviewed-by tags because the event handling changed.

Tests on 7.2.0-rc4+ with the rebased UVC driver:
- Tiny 2: 31/31 PTZ/event checks pass during a 302-frame stream. Live pan,
  tilt, zoom and speed readback work. The same probe records 32 unwanted
  volatile value events with v4 and none with v5.
- Sunplus 1bcf:28cc: 17/17 ioctl event checks pass (v4: 11/17).
- Synthetic controls using the production event functions and real V4L2
  queues: 34/34 checks pass, including async completion (v4: 22/34).

v4: https://lore.kernel.org/linux-media/20260928215021.819064-2-jordan.mymail@gmail.com/

 drivers/media/usb/uvc/uvc_ctrl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index c633ff7dbe72..70f724d5ec6d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1841,6 +1841,16 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 	    (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN))
 		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
 
+	if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE) {
+		v4l2_ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+		/*
+		 * The driver sends every write to the device, even if the value
+		 * is unchanged. Report this behaviour for writable controls.
+		 */
+		if (ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR)
+			v4l2_ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+	}
+
 	if (mapping->master_id)
 		__uvc_find_control(ctrl->entity, mapping->master_id,
 				   &master_map, &master_ctrl, 0, 0);
@@ -2060,6 +2070,13 @@ static void uvc_ctrl_send_event(struct uvc_video_chain *chain,
 	if (list_empty(&mapping->ev_subs))
 		return;
 
+	/* Volatile controls do not generate value-change events. */
+	if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE)
+		changes &= ~V4L2_EVENT_CTRL_CH_VALUE;
+
+	if (!changes)
+		return;
+
 	uvc_ctrl_fill_event(chain, &ev, ctrl, mapping, value, changes);
 
 	list_for_each_entry(sev, &mapping->ev_subs, node) {

base-commit: 7a7c915d6bae574d8f43a205d566a837af0d0868
-- 
2.43.0
