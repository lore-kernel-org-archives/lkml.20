Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881076;
	b=XkkanB4I56bVnjKi5QVO2svwxXZb7cMyCPwRHXVJlGB+E9qQJv4bKIXOPpj48SrzpTAD
	 9kp+H52qHzm8mAmjqKm7fyFC5bqP1ORJNe8JEA7x3J9zu3BORgvf5tJRU0ZM1Ep7XKsYg
	 nXhw+LOo7xCTL0a9EjiJOmU6FcSb3qVuaa+vJCzOI93fSX+M+bigW/aIZGzxLX9GDNJuC
	 8SmOazQYBsLpIlLp9chJlJ5X+DMHBEQuxIt9zdFQx38FwCrUoVa4xg0nr54ZFWRmRakY0
	 7pFjrE8Qh8Tc+GvJ21q/qnJiXc3Dk2SbIS7cIe4ibTzBnBC8/9oKCy7BlX/NhXcdoMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b+uH6WmJ4dKpiVVWC0is8ktZTKKWmWBCxyuQvk6QJv0=;
	b=dRfKJFnZxS8VjGj1xJXPvwD+n2SRADhGYY5Qa8nWb/93rTMU5LCdEuP0szE5w8IjpTz7
	 iKewUlk2TpFiGXZBXtSs1klXX/fB6lTQnrzQ9ZraljgPLTNRfvdKCs95iDeIsknttLe3g
	 9V6mb3IPMnJ3G41DjWTKv7zyJWOLXos3e6DUSp+N48eypEtSK7gYbK7dmzNL+snY/3cpj
	 TEzu1w6juSTkjUXRo875phSWWAlmkBAgVZFkbiNbbBAroTNCflzI4+Kfm0wPyMeEGdkpy
	 rVvzPstx7irmtn/5ox6eZeKGwSAO//xDnBw04BOOvGHT590v/o8VlsvKrVOF8PX0gmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOXBG2m7;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA95606D81F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA95606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOXBG2m7
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1003348a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793881075; x=1794485875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+uH6WmJ4dKpiVVWC0is8ktZTKKWmWBCxyuQvk6QJv0=;
        b=TOXBG2m7FJQ3Yh+WQm2NULGJ/tRtV0VIllgqJgUZIusi/Qn3STSU2ImWzMmDAVE3VL
         Q4WJQEXiu/5fZB8B1rYG0BJClWpaXLBgcCxYs/QBOlX3j9jI+HkSUjkE9FZ965f7WQMN
         leQOcL1i+nxlMc8m75D6XZao3PEmlCwGyUk/C/EAIiirOz6VNZn8CKg4GYRtsdndwzCk
         3d67G8JRsh81q62mOAbi7KoDcDq6U/IoNTCY8hV/cpS/tJZGPGX42X3HhPu3p4tFvROd
         85J1WqhrjvrLqvKl5Qmglz8Ej7YksZQmnXsMvR2TtmHs8wjsZnfzMA99dgVJcFRZumpB
         bOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881075; x=1794485875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+uH6WmJ4dKpiVVWC0is8ktZTKKWmWBCxyuQvk6QJv0=;
        b=nhlJVJ2tN1epxU1+q61BmmRPmLnadNzzSBYLZLgrFMngwxp98vbdlohKW8bhYvwoma
         aw3oKRFY3alggmSUNxLLTe+5bzANHQCrDDR5Ay/ipbs6EM6Kjmq2lN5pUiX69sHxbh1q
         EEVUwJoVxi+WMPFyVbFg1umIVOIRiaOpYc6XN5zETDJyxCOS4hgGlyOOJkkrGVHfi4fj
         A00Yx8lrMyjtOiwjNnOr6MxaJ5Rd4SKvAbg119/7fPJ9YAJcgadnFBEAOMbPE7sbrXuo
         rIuOnXUKHstrrlaXimAMActJq4F706OLrFYunxrTR2Xf/gw58RUbRc+HOuaggV0dMEhg
         8EHg==
X-Forwarded-Encrypted: i=1; AKwUvBzSiHdGryLft+6PW8pYoTpAiK59D3zKgP3en8O0e4NQTmyWh+KL7/skiDYliRpHlcb9WKDIyzJ+DBjm7y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HNxHZlAnh6mZvX8RDb0PEekNTVYEKAknjxueKnSAwWWWngFzD
	cG2m/mN1eWCy9e0GAu2SLMIImGTQ6Do/ZidxNqS7y1YSZn2cmcbmwTdF
X-Gm-Gg: AYBFou3Snkwp+JDHCXKFTMSlGz4V1dAoUwgn0pxp+LFx9XY+oNqAVZIzGMqf7y0qa8W
	3bm89xcTG925DahYWoaxEZH4p/u0/bBtjmPHe0EEahDlvdsqdoAwQWcZkqDt/5BHhipgY4wADl5
	nXB2sPgtc6STngWfLtwFtYSWT/CJtf6CftPhUqe8nj7/sxCwxS6zZQX2MTw5wpbCGQNqc2Q/eAm
	vxuyFg9Zb/ZcFsGAl++Xrt1G2GjwH+tft/NLD1L2F121BcJia3gW+LYN6aDuh85GoYRWhbBCIeZ
	vB//fog6fxhnxj3ggu+bYea8HlZzFmXuwYVvBX/FZ6iJgAl96PsWbAW+NZliP83kgyWpZHvYFUo
	ecmw0FMROFhG+1taMujEZRoQ6vpfbH+fWv/pl6cHSO549XTrKByLUojdVIkWdM8XWoHF2vHGC66
	Xg1XP6T8BIYmDsBEBks+cNX11jkWSSrODFB/pbIxAYDufeaGx2jTuaBK5EI3D7g0VMAZbvTO8FL
	ketT9CQi7H/W2FZ00Oe1CgS/pO+8oVq91qL23qX07NwVVROUNgRLyiZSI7bg0FBVCZS9tdAIlhY
	2BlD8oO4WGl7mspjBJqEkBuF8HzrZcgKcZf3Jva8auZTKkrC
X-Received: by 2002:a17:90b:528d:b0:3ae:5525:dc25 with SMTP id 98e67ed59e1d1-3ae89850a1amr15976995a91.51.1793881074813;
        Thu, 05 Nov 2026 04:17:54 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cd6c0sm3645307a91.13.2026.11.05.04.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:17:54 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: au0828: reject too-short isochronous packets in au0828_isoc_copy
Date: Thu,  5 Nov 2026 21:17:39 +0900
Message-ID: <20261105121739.1590426-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

au0828_isoc_copy() strips a 4-byte (or 8-byte, for a field-start packet)
in-band header from each isochronous packet and computes the remaining
payload length:

	len = urb->iso_frame_desc[i].actual_length - 4;
	p += 4;
	if (fbyte & 0x80) {
		len -= 4;
		p += 4;
		...
	}

actual_length is only validated for <= 0 and for exceeding max_pkt_size,
and len is a signed int, so a malicious or malfunctioning USB device that
completes an isochronous IN packet with actual_length 1..3 (or 1..7 for a
field-start packet) makes len negative.

The negative len is then handed to au0828_copy_vbi(), whose length
parameter is unsigned long, so it is sign-extended to a value close to
ULONG_MAX and drives the copy loop:

	for (i = 0; i < len; i += 2)
		startwrite[j++] = startread[i+1];

The only guard, "if (dma_q->pos + len > buf->length)", is defeated once
dma_q->pos (an int) is a few bytes into the field: pos + len wraps around
modulo 2^64 to a small value that does not exceed buf->length, so len is
left untouched and the loop writes far past the end of the VBI vb2 plane,
corrupting kernel memory. (au0828_copy_video() escapes this because it
truncates len back into a signed int that stays negative.)

An unprivileged user able to open /dev/vbiX and start streaming can reach
this path with a crafted/emulated device.

Skip packets that are too short to hold any payload once the header has
been removed.

Found by code review and reproduced under QEMU with KASAN and no hardware:
with an emulated au0828 streaming VBI, a field-start packet (so dma_q->pos
advances) followed by a 3-byte isochronous packet drives len negative and
triggers a KASAN-confirmed out-of-bounds write of the VBI vb2 plane in
au0828_copy_vbi() (inlined into au0828_isoc_copy()) in isochronous-
completion softirq context. With this patch the runt packet is dropped.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Reproduced with KASAN under QEMU (no hardware): an emulated au0828 over
raw-gadget, with dummy_hcd extended to deliver isochronous packets. KASAN
reports a vmalloc out-of-bounds write in au0828_copy_vbi() (inlined into
au0828_isoc_copy()) in isochronous-completion softirq context; the
vulnerable code itself was not modified. A self-contained reproducer and
the full report are available on request.

 drivers/media/usb/au0828/au0828-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -599,6 +599,9 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 			dma_q->pos = 0;
 		}
 
+		if (len <= 0)
+			continue;
+
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
