Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8E471CEC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190925; cv=none; b=EKetxmE5sFnEgTkuD2VBrPraYBRwHvj0VTNzgHG6kTEePdKIZcY8shlFffqbE0yIF9nVLAzAnpnYIKFzRzpRdJ0imC7595rQYz4F7EBteCSxhJpkOQJHRkLnjnFJZdw8joy0aUnbWvt8gTdjDGEutz6JqZQZKt2QWlsp9IV0wYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190925; c=relaxed/simple;
	bh=VH8QZ7cKZhiK44QMVjMrGW5MytTxffMIdFgoMOpFUJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRuZcTLfbGuZ11U/iIJwEI8SS3+6/lEYGPUx9IzRDjzs/IL5k62sN3JeInXybHqCAISkwd40uIg8PvHVjhNd7me+GRt6MTb5E0Bvrq8IUP2pVQ6DogpnaDeuloO3m7kT1vi+ygRKuMttvEvTIdIzlZnaKSPfOrX23pGJgm7U6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=n2n5uE2i; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="n2n5uE2i"
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CA37C3FBD7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788190920;
	bh=1GfGefQ9EUED0C8C1WTtZnhklJ50/jiUaV3tIS7bBow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=n2n5uE2iU4yPN2vkwABM6Ifka6AcXb+DQcsKTYj9QomYyrvjlCutI/tSmfhqX30Rr
	 xUIyPWiJYxS71YTthXSjjAglBDNSn5Vn7OPbXMkbDstNrAVjCLHV+6slhOtLrd+amJ
	 5jEr5VBJ0mpyPrccMoDH5F1MZ1LEzyU8BpHnQqH3GYWwCQqHaJAP5sLhhm39RwCyqh
	 mdDvVMHi8DuLDIBQJOQ8GCXIqs/Gy4/aIGjgYFyMW7DCa7xIc/4/8v8AP0MfoUj7eR
	 i9sYrUgQQmAa3YL98qfJBsY2FUil/sVCMNtkWVJ06tKf8y1EYEOTnHylspdV8HQ2y3
	 q7jJ+UZgCW2LKIb31OlkwrYxzg/Uh3nvT6iW18GaoZKwx4wkkJq9N+o0dPL1gsQru2
	 3QUATi25OXYMqRwo5+JXy9P8SuxlMWBLSXt0lYsCWzRgp1jg9R/zp+f8YQmdazpw8K
	 frNu5x0Zza3FnlB/Q7qGm1eM5JPYyH/HZ0vR8Y063V3u3w9ByjEdBQOcT3y0OyoM9A
	 p95oVVl5q1Ps7orJr8uVvCoFlhaJNgqWIQVIVYB85/9+UfdK6K0lVe0kNAVjJkjIZA
	 DIfNPfP4Z5mcSHOG2Smsqd2ybpIu2vIPAbkDSM0l61/wD8LvPVWrD7BB1uqBB1gbGr
	 FqvPRb949l50gvhZlMOkFDX0=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so1874547a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190919; x=1788795719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GfGefQ9EUED0C8C1WTtZnhklJ50/jiUaV3tIS7bBow=;
        b=KAFZW54Ccxw2yLMV1yVbOEIdoEVUNZbkHD2+cR+xJw5/5yAI2js2TsHYaguJT946MS
         Q9vxUeksSwiR2MDSGqWhZvh0qKfag0dxvbKigqtMwgn1w1W1Np+0o/QL3crL6Hox++D/
         cR6jLE7iKe6TcVmRRZ9nVVDiP4thOHzg6/GIbsEFYL+iXSoNpZpl4GKfHYo4q52oCCdI
         FEMu4cL+OcgcRFjowmvi+9uiVL9IyIdWgOsli5/t4f3fJojHZmivFIAEykHA9/u5thvb
         wp7F7NDUxOK+g1YwDkqjHPzKowmxpnqEf7DnJt22GU2iMu1+KZrCg//FYlXYy9E2gfNz
         N1tg==
X-Forwarded-Encrypted: i=1; AKwUvBymn43Ebtgx1j2FLmtkF2IdS7GpkEP4he/WUX+0Ydk8gu2dJJcNEYowzikDhBEWzWaX1UDcSB4hKQbnlGE=@vger.kernel.org
X-Gm-Message-State: AFuF++nIPG36j9P5P6o+QYnN1sQ76+mFLtwvgeN6Sq9cK8xDrotGpi7u
	JS9zzQx2XNzXuU4flKEpUgdAIPd1PdZ/auV7CRVGTcakpOu2ixQKSm1NLFiZ9R9pMrzDmJN34kg
	wgQ48iPJRBl4kvX5R3cAstjNC6un5/OZUEIvxTlfVfQssSW77JtXuSoqmASzt3aOQeE22ELxAj5
	l3X3pQ7w==
X-Gm-Gg: AYBFou1xXBUXXODIpEZqiog10Vw086fAUXN30qIPGrmisV4B/26kXeyVAP+BqonTSdb
	HCECF9YaxYYv8L4oaRrBoWZsVKK4fzRCQcciANenwI2j8WP0+0hVSdWwaABS3kJDh5yG83kypdm
	zIEdrbVxqTxY+5pyYMQ9odHW2OSmG3+eIYnyqW9hOKFyErjg1YL8u9iGy8CEB1U07rGUbZx6rKA
	b/A8S27bCYIXLN/FYHOvMG8wuV9qsiIcLgtLoy2yUAFULh9XFlltHYxoSCHfsCqasXFiaZyfPY4
	phvsCvgdXLeqtaMZg7q02AgfAyVFL8u7fBsyNnCID+lGF/yB5wAXLsenA6s5BCj6GZDOutUphi2
	2cNdwCepCqU+L9E+9jNToYsYLnSENCLB/3c6lQfDhcJ3s6HAXIB6Uqw==
X-Received: by 2002:a17:90b:4c0b:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-3989c0c7ffemr25989485a91.25.1788190918878;
        Mon, 31 Aug 2026 08:41:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0b:b0:398:9c0c:7c72 with SMTP id 98e67ed59e1d1-3989c0c7ffemr25989439a91.25.1788190918432;
        Mon, 31 Aug 2026 08:41:58 -0700 (PDT)
Received: from resolute-linux.lxd (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm36228a91.16.2026.08.31.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:41:57 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	=?UTF-8?q?J=C3=B3=20=C3=81gila=20Bitsch?= <jgilab@gmail.com>
Subject: [PATCH v1 2/3] usb: gadget: composite: fix WebUSB URL descriptor length handling
Date: Mon, 31 Aug 2026 15:39:38 +0000
Message-ID: <20260831154139.55811-3-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831154139.55811-1-aristo.chen@canonical.com>
References: <20260831154139.55811-1-aristo.chen@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bound passed to strnlen() subtracts the descriptor header twice:

	landing_page_length = strnlen(cdev->landing_page,
		sizeof(url_descriptor->URL)
		- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset);

URL[] is already declared as U8_MAX - WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH
bytes, so it does not include the header, and subtracting the header
again leaves room for three bytes fewer than the descriptor can carry.

That is normally masked by the w_length handling below it, which folds
the host's requested length into the URL length:

	landing_page_length = w_length
		- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;

Doing so conflates three separate quantities, namely how much URL there
is, how large the descriptor is, and how many bytes the host asked for.
It gets all three wrong:

 - the emitted URL length becomes w_length - header, bounded by the
   request rather than by sizeof(url_descriptor->URL), so a host asking
   for w_length between 256 and 259 has up to 256 bytes copied into the
   252 byte URL[] and bLength, a u8, wraps to 0 or 3.  cdev->req->buf is
   USB_COMP_EP0_BUFSIZ bytes, so nothing outside the request buffer is
   touched, but the descriptor is malformed.

 - bLength ends up describing the transfer instead of the descriptor.
   WebUSB defines it as the size of the descriptor, so a full length
   landing page requested with w_length 4 must still report bLength 255
   while transferring four bytes; instead it reports 4.

 - for w_length below WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH the reply is
   the three byte header, which is more than the host's data stage.

Compute the URL length once, bounded only by sizeof(url_descriptor->URL),
build the descriptor from it, and shorten the reply alone with
min_t(u16, w_length, ...) the way the rest of composite_setup() already
does.  A 260 byte "https://" landing page is now emitted as 252 URL
bytes with bLength 255, and short requests are answered with a correctly
sized descriptor truncated to what was asked for.

Fixes: 93c473948c58 ("usb: gadget: add WebUSB landing page support")
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
 drivers/usb/gadget/composite.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index df39e3487c1f..6c8e15faee6a 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2151,7 +2151,7 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 		    w_index == WEBUSB_GET_URL &&
 		    w_value == WEBUSB_LANDING_PAGE_PRESENT &&
 		    ctrl->bRequest == cdev->b_webusb_vendor_code) {
-			unsigned int	landing_page_length;
+			unsigned int	url_length;
 			unsigned int	landing_page_offset;
 			struct webusb_url_descriptor *url_descriptor =
 					(struct webusb_url_descriptor *)cdev->req->buf;
@@ -2169,24 +2169,27 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				url_descriptor->bScheme = WEBUSB_URL_SCHEME_NONE;
 			}
 
-			landing_page_length = strnlen(cdev->landing_page,
-				sizeof(url_descriptor->URL)
-				- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset);
-
-			if (w_length < WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH)
-				landing_page_length = landing_page_offset;
-			else if (w_length <
-				 WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_length)
-				landing_page_length = w_length
-				- WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH + landing_page_offset;
+			/*
+			 * The scheme prefix is encoded in bScheme and is not
+			 * emitted, so URL[] bounds what is left of the URL.
+			 */
+			url_length = strnlen(cdev->landing_page,
+					     sizeof(cdev->landing_page));
+			url_length -= landing_page_offset;
+			if (url_length > sizeof(url_descriptor->URL))
+				url_length = sizeof(url_descriptor->URL);
 
 			memcpy(url_descriptor->URL,
 				cdev->landing_page + landing_page_offset,
-				landing_page_length - landing_page_offset);
-			url_descriptor->bLength = landing_page_length
-				- landing_page_offset + WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH;
+				url_length);
+			url_descriptor->bLength = url_length
+				+ WEBUSB_URL_DESCRIPTOR_HEADER_LENGTH;
 
-			value = url_descriptor->bLength;
+			/*
+			 * bLength describes the descriptor, not the transfer,
+			 * so only the reply is shortened to what was asked for.
+			 */
+			value = min_t(u16, w_length, url_descriptor->bLength);
 
 			goto check_value;
 		}
-- 
2.53.0

