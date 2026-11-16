Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851542;
	b=zPtEoimdWqyZNGXD4xciwQ+mhLQrG8Chwcw8Ag7EXyyy5wVNgIA+jOn57RFfW/l3fU1a
	 Gi4B3YA9KTOlxNF8ahXFRAjONYi/zLJxF7tBXTbioILRSYHp47nwgm17ghuHW6ZOmb1CD
	 9B8EY69IBfmcB5HvyRe05EtEZu139NEH3TpZ0VFo85edxWG/5xQILbT7peCNf2GZuCW9d
	 owT1gtWJrEiwyfj9G2PdnlwxU3zwlX4/CfDDXsmCrBp7rF+eNcp8owYWkUrfZSiyopjvY
	 SuH2nvu+NGi9DtVzyDRoKK6Xd61xBGae8WGoBYaQjB1HPez6iLsJyB1+SUpk3TpPs3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=deg30gp4FJD2VsHY68a4c6Rl8U4R5D0htrjtOqd5+Qc=;
	b=UQmivjKMSYzfejqtfuKueWTGBlbk+HOYXa4VOEqt8RDw7PQtQQmYKBH3bHYvozg2bkrw
	 rUT3sh4tULArbuhEfrDjmb1eRzCieXZnN6/2SVufAYlTOmXKDfmNvxgu6OxwrHBZUFVHq
	 YRr6bCW9aRCFPyv71Uj6lAMLBnRKscqqRQAOw3l6yq97AZRNLxW63pdlYcnlWdyMykwat
	 qHU1CKOAIm2vgDJu/g0VOQHucVovjlf5W6jQZHF6M/to4M9zBuxIA6bzQjhHmwen3rtQ4
	 Iv4Zw8Am878vD8PQuXREzEZu1r6m+9DUwIfnXuzFU+6f/UYEMexLI9T5o0QYvC1HM9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E1hrV0Ob;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E7C606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E7C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E1hrV0Ob
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so3300500e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794851538; x=1795456338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deg30gp4FJD2VsHY68a4c6Rl8U4R5D0htrjtOqd5+Qc=;
        b=E1hrV0ObSHIhJI+dblFEdXqV2DiXCIgjZTnIuU09oypzRm7lUkGbEWPXJjoPCVrpgy
         NjWdcxbQP0Z9ApewgsHXzKxE/yfjwL+D3MbppAcOWcWU5hsPFMnF4VwBXBhZEMh1olD7
         sujLePiejeZxRh4PtCUuPCbGI4llt5legUIoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851538; x=1795456338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=deg30gp4FJD2VsHY68a4c6Rl8U4R5D0htrjtOqd5+Qc=;
        b=r6Zc7ZkKkHJ00zqzkhXyj92BIKACTAP+Z/pbhsz6/LoRNnmcrHK6RcpqTL52YCwfXg
         JTmnZXGBtFaioJnjD3UkiY0GMVxUXRnYOx/W5zn4qAWli7qYGd7Hk5YNyKDIFokP4lnc
         f9ihs5NmDauGk+IMs212GkWZbbI93KVB35e+yFkMdnNBAIapJGnOLTsTBgrpSq1Su37d
         SbZ0IsFdPIM2TR4OCF/osgtBK9Ib/kJKdfZQ0A+XT/nFrQWe0XgTEjHWsK1Fr2ydsYa4
         ASTA46Jg5roksahL9nnA8TPoCdxwGs6T5wOT61jOr7QxVAvzy6FyEf2CsdpHJrecBlfa
         3ShA==
X-Forwarded-Encrypted: i=1; AL+hErGLpmN/ekH1ZEKezfoeaYVsTuQRVzZV91+T7zTipK/x5dVPZsQTSFq1ixTTt5lXihAXDZPmtpyGmSK5l9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UGmve4HNQvnGXKDuUlFY5xUyJKLOvKTaCC/jGCWqucZVPHdXy
	asHXKgNXdqpr0pwgKdnU/nBSmNI73S0rQEnsJN3+9rRsXuc4fUaFRE048Ndk/evrjQ==
X-Gm-Gg: AYBFou0IjMN/lSttkwZpCiu+J8zWEtkESz9+pfrH6pislcSRfxu3V4Y/AkHWhv8P1ho
	j7FaghAY0PZO+Hi66ZImL9JBk1+F4Ux4K9sS8xv1X1lsK0MEXhnjJ/tkO8K/TUaZv8oe3wKlavs
	O2hP0rNGG1z6bEFbq/zFJ1vrjRyZtvOxOtTEqav+jcM971gdKaIk43HEXQB8FooFWAOmBjsbw2Q
	YITzhdKzAAkynC1SgcOe7Af7XHA0pOaiWh7oonMaBRM+Pz2BI8yaLKQtL9m0t9UTBe8akOCk5fc
	ss1FZuermYzbmroY5G1INPKwgI17Jpm/7iDfVUieYdqdh3AdJff2MVmoKennKGGyDbmVG5dZQ70
	quA3VrPSHdHwEM5ubCC52ey3lBd67vczgSDYp43yKwiq82a0xmiv5Spmst/5xRdspGvCXcaa/+m
	bXaFYyGsinf4exs2OE5HoQQGMCGmC3xzkpI8UQT4CGU/ITSg16QYsiDA5WTrYM/Izkvfx5494RZ
	52mLrERYjSwjzu79nPPQ2B6uos2WzZJBy690il0Y7zaQM090bKjJaKowI9M8YF103YsiuWKcJu/
	r3fxHbpNMb1B/gvOQ+iK7J6F7An+BOC+oL4ttBDzi5bUCsA0CRAHRzPgeSxCenqf1+2lsRT/Wag
	YmuCsmi3XPg==
X-Received: by 2002:a05:6512:6890:10b0:5c1:4c4a:f01c with SMTP id 2adb3069b0e04-5c19d2498admr506677e87.43.1794851538279;
        Mon, 16 Nov 2026 09:52:18 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333630sm3391252e87.19.2026.11.16.09.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:17 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 17:52:12 +0000
Subject: [PATCH v2 5/6] media: uvcvideo: Remove redundant payload header
 length checks
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
Message-Id: <20261116-uvc-shortmeta-v2-5-62d4a8176fb8@chromium.org>
References: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v2-0-62d4a8176fb8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Now that uvc_video_decode_start() validates the header length, there is
no point in checking it again in the functions it calls. Some of those
checks are not complete and all are redundant.

Remove them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a822b8234789..4e32600d9326 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -593,10 +593,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 		break;
 	}
 
-	/* Check for invalid headers. */
-	if (len < header_size)
-		return;
-
 	/*
 	 * Extract the timestamps:
 	 *
@@ -982,12 +978,6 @@ static void uvc_video_stats_decode(struct uvc_streaming *stream,
 		break;
 	}
 
-	/* Check for invalid headers. */
-	if (len < header_size || data[0] < header_size) {
-		stream->stats.frame.nb_invalid++;
-		return;
-	}
-
 	/* Extract the timestamps. */
 	if (has_pts)
 		pts = get_unaligned_le32(&data[2]);

-- 
2.56.0.679.gc527c65306-goog

