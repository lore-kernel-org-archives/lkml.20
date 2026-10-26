Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039119;
	b=PyxLIrbcA2G7RaJct8uK6Ev/dKBeJfMZ9FJLy87O4HKl/gu6nW2/HL1xvdC4X5w5ywUu
	 cwlxh1vPSHsoatN/S3/kUjdlje0zw6SpgRwrkCmXDPOOji66emp/t5jm0oce5YxuIjWy6
	 RvlCI6HSuFsNxiEEzCZOfnRUjoxI0IqCRV1cPJk+d8N0vBNNC86Wlh+z+dcaMf/6ayON3
	 8boA46ECUBAdOqvJki+MqaxTRocRIgJK8JKbHftBif34EglJSv4jcKfEStr5lpll+39+y
	 KYqQP7S8yElAAe2xGidQDUiAreDMDQmXD4znNS/BJ5v0Tbr5Oiywkb+8SzNdBvsBm3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xjLdymjveFlr5AB8o2EJE8s7wJtnRZqg0vr0IyW9LqI=;
	b=EAmWPAGWTOBiLlPddT31vcfzVm6jRX1VqJ90fOmZ2yT6cbAEpZ8YE7e0UP9WFkdfbz0O
	 w0xa6ijyL+TzQOIKG8WlvbDnKh5tqdSG9h11Wg5dnAyP+NpH/23mrmDjB4fM0zX6JooEo
	 FsHhSlibo3I/WlvLVsCU44UxTWXDylQ/JQmzcA6UtYkQq2bvOlAJ2MqqmJJgPrSiJLViV
	 322gEd/Tb9R5fQ+Avn99OjrK/C8Vtew6FOppeYI9/1HxeJujT8OZgW5rhZ43OPxXdOnuM
	 6A5f1Cs3BYDp97NIbQZ7Huxigw82SCzp483XMyNBHN2TWxaAxxhk9bP1u4o6mI75xxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OOVKfHBz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBB7606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBB7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OOVKfHBz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a610c7e61cso1420615e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039117; x=1793643917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjLdymjveFlr5AB8o2EJE8s7wJtnRZqg0vr0IyW9LqI=;
        b=OOVKfHBzFKwn3Wl1Yd5z9CMzUFn7IfrDS4RhrnrA32AZcLNs97y9VRxUDwlhMJwkRh
         uAmUIJAktzuWlVxPjCUJEBNFLM6aRu9HDm6xH240xbvGkkB04bOqqr6cLrX2CzTxvjdL
         5Tkymv5d6XmgsylrDXsR1S2Pmhynu7WScrrza13lN3E809Rtr98XsxG+Vb7TffeowCs8
         tsA+XXR4drLBoHBVTiAwHw+n44LIQ5GbU12eP/AHtpLOAYrvCTP0/crT1RQMWONW/W9x
         GfKa6bXujJj5nQCk1LxzPk1I/x5HRVN7EC2MSoQdRTh8nRUGe9EjnZGkMCfZlWmN5RVt
         jMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039117; x=1793643917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjLdymjveFlr5AB8o2EJE8s7wJtnRZqg0vr0IyW9LqI=;
        b=zAHWI+ge4gj8dkCRO2Xp7AmdDU893P+/NuWXBSRofoLrglrK9SGqDFQKFSfjmd9qlX
         QLolsE7YqIj+w42EOyNJdwiYqNyGN0JCj/Foua/uKdnU1dlkYtZZQPzSgPi7IZ0YDkRD
         ftrmw9XEAshgmxcdDSfWTEebg5PNrqAkVNrQHwRO2WvfhCzHEDGYHxPc7HRGUpD12kxw
         qG9x/qfrEuO6ko+XXc6hxzddNN0SOA4gx8f+hQz5h6l7pTqMP/8K5x+CQSH2FWeRRZZM
         YAI3WVIxA+F7XtNA56Zvh96nga+ylPNFk0jay2ET6vgXs8nyZxQTBuYuBjkFgmxwk+Ki
         luSg==
X-Forwarded-Encrypted: i=1; AKwUvBzGOEa76Ws0IRqB1fh6X/GXgs/h/L7z3rOBIYLyrGqj7TRoGYlEDZDGtTu2OQlHdcmeS4/TlkJje+P86oY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ68StnGxmRLT8Vk6oaNtPCJb63pXtw2EQhkGLZ2U3oPO1XdPLg
	4r2m2iEBkuz4A3ZzG/K8MPoK7U2YBjDC9dRbkw5kaRWxnUrZVIjbWhNk
X-Gm-Gg: AYBFou0WouhMeKSyZupHMBljm58s0iiRnslxrI5yhy96aJ8oI5WA+nep87i1NSsFVP+
	KQIc7pFnbfxzI4S56KnpK/hxB9nm/qNDTQD5KMM7gJwRN+kKZDglTLDFEYUYTSvgQCJ+CUANWH7
	mEdQtyX7KEWZWD59pH2OJ0PmQFOx5SomnQuuazYvo3x/+W0Sn5qlSczeq8qOhuxEXB7UwOj9Ow5
	ddfm2VeBESDDu/OZsuOKSZd8jv8Aj3z7qCpecHNgYfxRfAklm75xhRkQsa0SaZUokrwQxvL+2a5
	7wwjB4DAZBDZi9Ap0YAcUwhSXaFxcMQouXLiPZRJMKkC5qNr0gmUFcR7+Uewh6ZAHWatCPxhN4F
	YKvURNFWJCFkKednCI8LZKc9YvFItpElDGqmb/kjd66qnKWF+Vb3cDDDLx1s1m5o9ovSJ2H9TUU
	grFxH/1QuuV77ljVxDcvKG+abnJByb5EwH4JOS8/K4HpE9Ep/eQG/m7yyv3ivrwV8K+aXvBqxMo
	FpKjMViV+n9R7H0saMCbph8yPXbYcLn9rGZ9jZhp9ZpIxVemn6N1wEWoTX/kQ==
X-Received: by 2002:a05:600c:6088:b0:4a0:1e9f:64f6 with SMTP id 5b1f17b1804b1-4a35aae2effmr133448675e9.0.1793039116855;
        Mon, 26 Oct 2026 11:25:16 -0700 (PDT)
Received: from Termis-ROG-FLOW-Z13 ([2a09:bac5:521a:254b::3b7:76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm211673245e9.2.2026.10.26.11.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:25:16 -0700 (PDT)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [PATCH 1/2] media: amd: isp4: hold buf_list_lock while sending buffers at stream start
Date: Mon, 26 Oct 2026 21:24:41 +0300
Message-ID: <20261026182442.229869-2-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
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

isp4vid_qops_start_streaming() walks isp_vdev->buf_list without
buf_list_lock and passes each buffer to isp4sd_ioc_send_img_buf().
Every other access to buf_list holds that lock.

vb2 serialises the walk against buf_queue(), but not against the
firmware response thread. Once ISP4SD_MIN_BUF_CNT_BEF_START_STREAM
buffers have been sent, isp4sd_ioc_send_img_buf() also sends
START_STREAM, so the firmware can complete buffers while the walk is
still running. isp4vid_handle_frame_done() then list_del()s the
completed buffer from buf_list. If that buffer is the current entry of
the walk, list_for_each_entry() follows the poisoned next pointer:

  Oops: general protection fault, maybe for address 0xffff8e6944d97060
  RIP: 0010:isp4if_alloc_buffer_node+0x37/0x50 [amd_isp4_capture]
  RBX: dead0000000000b8 ... RSI: dead0000000000b8
  Call Trace:
   isp4sd_ioc_send_img_buf
   isp4vid_qops_start_streaming
   vb2_start_streaming
   vb2_core_streamon

The oopsing task holds the queue lock, so the video device can no
longer be closed and the module cannot be unloaded until reboot.

This was hit on a board that is not supported upstream yet, with an
out-of-tree change that made one isp4sd_ioc_send_img_buf() call take
over a second. With the stock driver the window is much shorter, but
the list is still modified concurrently without the lock.

Hold buf_list_lock across the walk. This adds the lock order
buf_list_lock -> ops_mutex. No path takes them in the reverse order:
isp4vid_handle_frame_done() runs in the response thread without
ops_mutex. isp4sd_ioc_send_img_buf() only queues commands and does not
wait for a firmware response, so the response thread is at most
delayed until the initial buffers have been sent.

Fixes: 2ccf48af2270 ("media: platform: amd: isp4 video node and buffers handling added")
Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
---
Testing and AI use: see the cover letter.

 drivers/media/platform/amd/isp4/isp4_video.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
index 856a2a0b4..58ea8d6ac 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -567,9 +567,11 @@ static int isp4vid_qops_start_streaming(struct vb2_queue *vq,
 		}
 	}
 
-	list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
-		isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
-					&isp4vid_buf->img_buf);
+	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
+		list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
+			isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
+						&isp4vid_buf->img_buf);
+	}
 
 	isp_vdev->stream_started = true;
 
-- 
2.56.0

