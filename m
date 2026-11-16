Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851542;
	b=wVPgHJrG+coPMNMUJBC38Xw4Uw4jX7QlHcGQGVypYJle11BjKt2lNPjx6DtHzDJM2zx/
	 dK0AiO1htrHrYGWyDF/XzFkTbKexeRY+6jHC+BsWVrhNCN9hdzqWZTFMsvEz3NTIfF0ab
	 S6bFrZ95PWpEi9q7uIbpu0SXzUmFGxP7x+8hQqxmEhtcQ0Vx4Q8IUn8pUDqhMiD/BMawC
	 CbMAL0LY5pBqS6SXC50tK2KT2fEJC2e8ntB/6LJecDVb/A4j78Xswumyom5WFlzgt0lMC
	 HvTut/GOSga40G0ADzB+w1+TlitTqFANJAZKQ3LnoowvzNtIoiC0MTs30gwOTa3sKZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wJ8TnT2XfhDoFSzBoirS9TeHlGIUWbru6eIu+8n9Klw=;
	b=Bpv5u4ZkcNQos0/AHpQitTekzF/fjikMYKPDSBRu+WEeMTazqmGy7uvqiu4CWAnOnNud
	 5WWOh/NWJ6QDdmYY+a+GZKPX3Ld+YUuJQ4GQu/IDhqWX47VweE3TTjGDR8kZElW5l5Yae
	 4CVdgwX3lLXC600jaR3FoG4v5tZt9EdQrnFFcuIrb2k36vMB4xyAlNXbXTY0z+lvkccaF
	 4WKQTEwlfQ2mYXFXSq0Q656Hbks7vcjRd8pg1bc7fTJ3vOh+0R/6OoLcHHuynDODauPjf
	 rGTECd33J0KM4+cD1hU7QjPobydajbsUrrmolh/G4RlyqySDBayNgGEWWRe9Ep6QBmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RDOf8EIy;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E36D606A8B4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E36D606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RDOf8EIy
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso3061556e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851537; x=1795456337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJ8TnT2XfhDoFSzBoirS9TeHlGIUWbru6eIu+8n9Klw=;
        b=RDOf8EIyDdPhIhwkU2Y+kks81uAo3qI0dVnrzE44118r05BQIWANGKQxYwZzuOX3vD
         zwNEJmtE63iju1pVjGWF1qU7xBKYcDB/bbsbsjpJ+8qc/knq6XU0HAUSZUmLJe0wm7w/
         g3OIplPwGclz2FdxlBa+hCMd3/BvncIvoq0zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851537; x=1795456337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJ8TnT2XfhDoFSzBoirS9TeHlGIUWbru6eIu+8n9Klw=;
        b=zwar8slgjwpMSTtpcbHDiLGdrx2Vd1a1O/NtCF0uk9kh5UIkM5R21NHl/XH3Lsmgj6
         evdjBgUnHa01lB6ZG/YKFY1srnGNFwOU6diXfD0IlqAZDxFi/nxl96bKzNMCaC12LZT2
         NOcQRPQ54UqUfWi3dexAG3qA0rkbsKc4sfLbEq6Ye+hS8VpGWEQdUHC722v67CsxbCXa
         b2bu3rusXA5wrMKEBXI96uiwFF3oHw1o42t5Gk5Rukklfm25vsicJ/uCZmSWX65M0sAF
         90gTAgdiUnUqLRfjVo6YEbqD25uaNNNgv83i7TZigssy/AEN2yaEKnSYcippr4bWc5IM
         MuBg==
X-Forwarded-Encrypted: i=1; AL+hErHymjdve16DzT6SV+Ji3YEgvKVGvzVpVjnegY3ZUslK9i/t+ZetOBepdIyjHo+l6hcrP7lwJXwP0XyBzOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F1ncrvx6/QCDSp57LaiRyy9eiUS5cfTROYJ9RqeMOHA4YlF+J
	urYx0t0v8mOW6virF1bwZH4E1iHMKWQoyJYmH8VmefiY5kmjDNRdDaGDj3JRlmWsww==
X-Gm-Gg: AYBFou0cYoJdj6wJAwbNBP+P88KPTT1DLYK0fpe0ZVhCeUT4LXaBsW6cVXLv2L7gFyp
	DoxI6QihuzM95qxNtu7dYy+w5VGPMSOJV8hbYyF5BZKWNSMTtBplcSg9StpTICfDX3hPejb8bmO
	MUfE6rQsZOB3yIek8j3NcFeCnNqE4+3LCO6pofSUPJflnVjt28PWvudGAS9zkDPObqWaDU+PzBB
	bfHJ3D73/UD0zcqi1xe84FRxhHpDLK7jFqmJPRne1IE6a/4EnBKBNhlfcJJcX3QUTT3VwvxMLki
	DylLwHHItr62XHoqPao4D6tgTckibe3dPDryOofF/Tt3CPKHKoociBieY/rGDKnyVugRbud8ZaO
	h9yk3NWncPnGzpuZ85/qoM6p0G2+hfmSrHXXnmcTaABlu/SmCVxV+2nT2nB0lBEletNB57vY+OB
	JES1mE5biGKu7vhB7uAR941678zHxYZTbk7OIPLjpBAaiCR0OQIaXmkUYhFixgZAFYkyQYI5nFL
	Q28xeGUkIwp8HV5KwOBuDPSHXcBsFhd3LapLx2yV+gVDXFrT9r1CzlUZvp9BfMFwr5NnTGLVqqx
	v2K0vNdsOOwwvgipKfLQZlXx0q+8GxTu19Xo9wGKWnnn9kCeUuLhJF85BWYbqzCVdSXCiqMUMhX
	u8m/VbFJUxA==
X-Received: by 2002:a05:6512:31c3:b0:5c1:4f6f:564c with SMTP id 2adb3069b0e04-5c1709c5b64mr4239145e87.39.1794851536662;
        Mon, 16 Nov 2026 09:52:16 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:15 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:10 +0000
Subject: [PATCH v2 3/6] media: uvcvideo: Use bHeaderLength for payload size
 in stats
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-uvc-shortmeta-v2-3-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

uvc_video_stats_decode() does not take into consideration extended
header data (e.g. MSXU metadata) when it calculates the payload size or
decides if a UVC packet contains payload data or not.

Use the correct size (data[0]) instead of the minimum header size.

Fixes: 7bc5edb00bbd ("[media] uvcvideo: Extract video stream statistics")
Fixes: 25738cbd72db ("[media] uvcvideo: Extract timestamp-related statistics")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8bae91af03ba..ac8e0c3a0c71 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1016,9 +1016,9 @@ static void uvc_video_stats_decode(struct uvc_streaming *stream,
 	 * their first empty packet ?
 	 */
 	if (stream->stats.frame.size == 0) {
-		if (len > header_size)
+		if (len > data[0])
 			stream->stats.frame.has_initial_pts = has_pts;
-		if (len == header_size && has_pts)
+		if (len == data[0] && has_pts)
 			stream->stats.frame.has_early_pts = true;
 	}
 
@@ -1047,15 +1047,15 @@ static void uvc_video_stats_decode(struct uvc_streaming *stream,
 	}
 
 	/* Record the first non-empty packet number. */
-	if (stream->stats.frame.size == 0 && len > header_size)
+	if (stream->stats.frame.size == 0 && len > data[0])
 		stream->stats.frame.first_data = stream->stats.frame.nb_packets;
 
 	/* Update the frame size. */
-	stream->stats.frame.size += len - header_size;
+	stream->stats.frame.size += len - data[0];
 
 	/* Update the packets counters. */
 	stream->stats.frame.nb_packets++;
-	if (len <= header_size)
+	if (len <= data[0])
 		stream->stats.frame.nb_empty++;
 
 	if (data[1] & UVC_STREAM_ERR)

-- 
2.56.0.679.gc527c65306-goog

