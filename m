Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830207;
	b=DqGWjarxYRl6oAgczgIuzU8uBcb7B8gWjX8rALXDUPlx+GWTeZ5ScTZT0KTZL53Wy1XH
	 sfwS8yAIkIpbEp3Q7t29FblmPa2QOEQNBh28aNfYH+D7OmwIcBsqrfaeRcZ2uYrQP2hgH
	 Ro88Eg6DYShAeHNkUFfw1mesNM4sEMgMRsK2/sKdJmA2vBWqDC3JQOG5KXvkgqiejTCCO
	 kpQPM2dCyrnPuycqUuKW9tJOcw+5IGAwXyMUlQYWS3rMQH6XFb79rOglcE8SaH/PBnDec
	 ORO5JT+P2Nh/zAJ37wuWbmcatkbe1UjWuCt3sbBy7robO/BXXXNKvICL1FAqzYKoWRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jSBrXKq0EnuHM2QzrZ5bmia2mjHZUO+yHmfmjk5qeGg=;
	b=z01fwJTZKFQwO9KoKymRawEHZrr2RH6iGEZIXg79cwr+erP+Snb3Ee3IRkhtdNpk0PII
	 fvr14RHWFjKckdT0wozrSbP03bprphKG+GfrYGWZxLQrZ1LvmCTy6HKid5tN7GdoHCzhO
	 7HQRP4JjhQATbhatdih7LN374RnFjCyrjAZq91o0tpvFmwfnJAmKH9EHkF81nuRs8cE3b
	 0mxqV2/cQ2GHMXWNYyLoAUlbwoibUajzKlxqxXHK6hUXRHEdtdp2baRuB6nFz0gn0Cs7Z
	 SJxhsZ5u0roQKh71Vk7R7oNK+Tf2w/5IXTsvT3kuGd3KRXSYuOekPzmDPeJmNkOad8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mRh1AYSc;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9B606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F9B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mRh1AYSc
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c10dc41270so3490429e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794830205; x=1795435005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSBrXKq0EnuHM2QzrZ5bmia2mjHZUO+yHmfmjk5qeGg=;
        b=mRh1AYScEGf3D/c9eYuqNCIYkBP5lw38Q4dKqtNZVW4VN/wdjSr1zqvbsC3WAXBzvu
         48VgeS6Bl5WhIcYYpBF8EaTz5+2QOYbDC/Wr12BLbrx3evKxiqBNLy2vrTdCXAGlId4/
         hHZZZFAbjXpkwLtdZTCYTHT9Z7qDIhwswq5m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830205; x=1795435005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSBrXKq0EnuHM2QzrZ5bmia2mjHZUO+yHmfmjk5qeGg=;
        b=s/J7ydJKZwfR6WMGq1GOGATXVGC087SLB/5vlK2xQ5A3biWbT505cbLmk105ATpo2e
         GpFokiZri/9FMMbPLw/HOk9kOyi34t9Kss/EUVgZH4/yzKndU6VOzgoMxCzvvZZn7jaA
         SR5pZe70ZipcLb/A5EinbJfahVInttj6ZSFof2m+Q8E1zZ7gN6aVF6jlXWImhEWuw4mP
         NZkzuFGuIZDLGWA1nyVoxejn5woonpJNtM/CMFeGWCsqP7Q8jucsMkzdxjWQsCoUAYML
         EPDgvOD/NspUdasFcxtVXgQsxstVxJzWteEtK5rnff7xNmnNdFMz/kFTLd9jmvFpZV38
         xPKQ==
X-Forwarded-Encrypted: i=1; AL+hErHBXIR7hruMtPgU3LYirQ36dwh4k+DbaNUTleZ7PUBP0JyWxXjlBSXHPe0kLP4yvuwTzyWMavt4xMj5Luk=@vger.kernel.org
X-Gm-Message-State: APuU4Z992ODdknA7R+bC13IKpd/5VYyv1UdVIkgToAZD2r+VHMQTlEkS
	Drfee4thVoNsG30ct6DZZ9L6YgrZ43CGZkTyMa+rgBr8zqgXfcYEYKIqGv/h/KG9QQLJpoY+Iwt
	kGluULw==
X-Gm-Gg: AYBFou0NBja9V6+7dOWtllGonDbg/hODAsF6TJU3jQ0iz8XUkK3Uqz2E3BCHyT1s2HB
	4aMx76yOf75l+PLJNiXInvPzPLON2lPXvE7BuJ6thTN5nf+Cj/fTqdbAK2sxz9nssz1rNFP2g3g
	+8rBQ3DYd0YBLVcq1SSd6kW9G/rlaSrARWaMW8+JcnseDQPBPTkKtNQZh0RpvM9VGehTHubZPGG
	Om6E9+3DX8wShcdmIC6+khtL4slyLjoIajVAV+0M1rqVy3YIbIA2dNppVSwvCd70tMO5rDYUrCo
	Alm0RjgAKdWtbWXsrLtT0PUvbh16Hjt7B/gpAYSz0oPXBQ12gTBNuC/+HhwI27rQZfnmbKCPJpk
	sgW+r9djZF1qJrzT64+UHRlsq+WrDimmxGzkA38NSD17ApGi2RW1N7bLjUIFagPPgi2QD7oo6N3
	hKvmoPRDK3nuLafHmqVc50tp2zKbevEpXlK8vPYyP3vcnenTlfQJVn+LMW9uU2U9fjQvCdcjBjR
	ya7LhQehjSM+GneMjvaZW9FLG4CqSWL+jerf/inOPZXSWG6QhO3r88C0fAA+U+OwrrcAJCUKIPW
	fLxCpDdlTJAmq4WbkXtRNIospwK6EFIBBkQWwrwo57NWrS900iVCkweP9aipBgpSuqqhN43RPHC
	pUwD6ddaOOw==
X-Received: by 2002:a05:6512:b06:b0:5bf:dc6d:3153 with SMTP id 2adb3069b0e04-5c170b46db9mr3813859e87.67.1794830205068;
        Mon, 16 Nov 2026 03:56:45 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad7dsm3183754e87.9.2026.11.16.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:56:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Nov 2026 11:56:38 +0000
Subject: [PATCH 2/3] media: uvcvideo: Check header length in
 uvc_video_clock_decode()
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
Message-Id: <20261116-uvc-shortmeta-v1-2-487cfe42fa89@chromium.org>
References: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
In-Reply-To: <20261116-uvc-shortmeta-v1-0-487cfe42fa89@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

In UVC, the header size is defined in data[0]; all the bytes beyond that
length are pixels.

Currently, uvc_video_clock_decode() could parse pixels as PTS/SCR
because it checks the bounds against the USB packet size, not the header
size.

Fix it.

Fixes: 66847ef013cc ("[media] uvcvideo: Add UVC timestamps support")
Cc: stable@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 9cc5d83acbc2..e9be0a627033 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -582,8 +582,12 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
 	}
 
 	/* Check for invalid headers. */
-	if (len < header_size)
+	if (len < header_size || data[0] < header_size) {
+		uvc_warn_once(stream->dev, UVC_WARN_META_SHORT,
+			      "UVC non compliance: payload header length %u is shorter than expected %u (flags 0x%02x).\n",
+			      data[0], header_size, data[1]);
 		return;
+	}
 
 	/*
 	 * Extract the timestamps:

-- 
2.56.0.679.gc527c65306-goog

