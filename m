Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886998;
	b=utyA1qrcI9v7uB/c0HPzLekCiDRO/welbkfuds3FBL31iA/Us5nUrI4NdGf+G0YG63gC
	 zZ+lYlBxLHo/+I8xPJ71muFYKmXvW5fZ1EzdxyKG4H6t5UkIToHxP/uT8o15RiT0OIwDr
	 QKSTVWfwfXwXV01iSlfaxmrg3YF0Mtz+F2GO+dGXx4IPDShZcqpTY9nBSd1Ul8x/zaIFN
	 hsvpCshcpcyWTEOFHyB4owOifCzmkNauojvGp6OZrSGA42lJ29X9wHbghoAyt0ZAR2333
	 dFXHJ1JqpFhR/5KWH/524aiTEhic/IaTLRwfN5+SvkE1r/S2CtL2taFs5OWREFdcoRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9sUaLBG4g6dzJOc9/4AaliEDYmASDrXp9FJ3nYk2ywM=;
	b=dzpxWhp7dEj3+oODtyg1hkp3W9G7Er1xgwFrfC98gT4nD2jtF3GiEZ5zKANkkmKyn7P8
	 NwtldRL1ZLJNQQ9glKLbirAcRW+/R3gP/2ywZ0FC+HrrC7ks/IBkt9vjSjeGocEUaMGdQ
	 zHJOSJNOzfdthTIvDpC8JMRZ7t6KGxPaoroW9oCSUn7EanBLe+MgsCZ+bJNCDaHdV7aSq
	 laxCWUo43MUtUQv/LkNm1arKvnS4+7/GgGX03Nk6DFP/Ms63VORAsw1yoqr1hnU5N/fLl
	 OKKHxZTUUvWg9ziNVu+WdFNJGkm4R8B98lLenvzfur/qbAmos9TMBBbCKn4ed4fqiFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+HFWFMo;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AACF606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AACF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+HFWFMo
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f6295304dso3598778eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794886997; x=1795491797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sUaLBG4g6dzJOc9/4AaliEDYmASDrXp9FJ3nYk2ywM=;
        b=T+HFWFMoOFKw7GyOZo8LVPrXSiF2tlsYmn+gcTYIjEYUa3QAlOmkpHUp4f38dIAyZm
         9PA/qrhEittVlTmtIOVGgrikVlQWz/zDFrm++nZwoUHk31CWcnA5PQtQpmx4UOabIN+S
         2wD9qzLT7xjndiGoduloq5poveNYrWxEkNNl+hrY2pUcCpGiJtU+Sl15CYng6qts5VrI
         ka7AuVHBrmDCjPIGkx84qrWeQnaMCfqI5N0TrtcFbT0o+3jrnITnUJi0s3Ccv8fEa4+P
         W06nqknX0dq01WR4xWbMthdU5CXCc0PuQLvhaWe02u+A3WAdbydyZrx+kO1lr633JMRC
         2wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794886997; x=1795491797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9sUaLBG4g6dzJOc9/4AaliEDYmASDrXp9FJ3nYk2ywM=;
        b=hTcWNYOjfuWofW3kHUIVQwcG/WwcbFDyRLtkzc7K/gkpkqn4Gtv+w0tkGFozasMZaD
         6wEdGpoX3pEX28hJUCBRLVGPx91kXFDusncVwp4lS/6Ny+/xjeIUcJFPDrWBexcabjUU
         6P5cGnZ89iolsLmObZiSS6DKxg2qEwXYaKJXFK1Iif52hYERSLnuUsNifN5ozj/VRM6j
         Z2WpDZ9L93pCms6x49mA7pZuvehVT25aFVYXoceTpFDUpslyka5okqvcv/MqhU77hRdW
         Q5u3KKLYX56ID2Jz1VXyIMc+aIf37/0hdXk2UirFdd5EmC1MmcbiZ/qvYRvGcmKaqh+8
         L4fA==
X-Forwarded-Encrypted: i=1; AL+hErEJ0KO7tIXEgU2ZXm/T2kaWjOTbe7oIsKN8vlDtEwMJJYOU/PNM28FCoAipWIx5KPODwQvfaaAh1W5X97A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Db+jQ79MQh88FY8hEpFfrYnzUfPtgSfNisVLvS+doMHwEm+Qo
	MbOojK0iPgNoPEfVnpnfXSS9L2GRWiKL+3dFbWTA+XdoWeKOeUCzGDWR
X-Gm-Gg: AZFdTZdmXuzrh70zAlV5NMxG/0QSj//487xqHgwDSVhv7bvilLGwLkRgB/ixNt9uQF5
	im4CQz/IhCpxJLiHxF35eYZgXkT9naySuzUwWimmu0LTfuOP24WQyhqEZkTes7XGoGGzEi5fEv9
	O8Y4MbQcBfXwH8W9YcRhQ0LtZJpCCaJRFYlGHMV2lJL/2sog8pxyEDwNzHmspCbBUi+dPSw6MUb
	83SQTf2YLmwfWmEiZMHoIgPR7k1JfDwk2ZZOJPjeWdzPSJSZnpO8xLdGU9NNw3EQfXpemChHTII
	dQa0t2g1f51Zed4uEp+SuWqJzhxd4qm53CftaTn/zOmOUp+HQejfdJHeMF5viu9KTJC4x5B6FhP
	692CdScoQVGKNp567GalhZFlS7sMVC335t2tavRNiXXzQ+R+vPGxmYvPCwJWxKPEyjOkeaZwGtf
	lxuZ6W0RYJwGZTjCErVUTngdqQEHAtDWO/V9YLN6raiiKShmxReVXxSE+oAAd7SKF9orA9POVNH
	KxiyTgl5ugEP3Q03/j6O5Y8aVWLXXbNJGOs++lFkISAlcoyO5zeB+2VT+SdcfoDSdFGz2Vk374v
	Eyo2EMmvftF9aTBVI27LaFAXRzr+oOSDqVUJaiUyo8qmCBpC1FRAlm7JPdsupa36CdjV1u9AA/x
	5ERuAldnEi8c6hQ==
X-Received: by 2002:a05:7301:182d:b0:376:a6d7:8f60 with SMTP id 5a478bee46e88-37967ae21dcmr12790578eec.40.1794886997205;
        Mon, 16 Nov 2026 19:43:17 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm4037710eec.24.2026.11.16.19.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:43:16 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: use the clamped bMaxBurst and Mult for the wBytesPerInterval check
Date: Mon, 16 Nov 2026 19:43:11 -0800
Message-Id: <20261117034311.538314-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <77330361-136e-4e26-b5ac-9c4259f90978@rowland.harvard.edu>
References: <20261115163701.226491-1-teel4res@gmail.com> <77330361-136e-4e26-b5ac-9c4259f90978@rowland.harvard.edu>
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

usb_parse_ss_endpoint_companion() clamps bMaxBurst to 15 and the isoc
Mult to 3 in ep->ss_ep_comp, but then computes max_tx for the
wBytesPerInterval check from the original descriptor. A device with an
invalid bMaxBurst or Mult can then keep a wBytesPerInterval that the
clamped endpoint cannot carry.

With wMaxPacketSize 1024, bMaxBurst 16 and Mult 1, bMaxBurst becomes 15
but wBytesPerInterval is limited to 17408 instead of 16384.
usb_submit_urb() uses the clamped values and rejects isoc frames above
16384, while usb_endpoint_max_periodic_payload() returns 17408, which
xHCI uses as the Max ESIT Payload. The same endpoint context gets a Max
Burst of 15, so the two fields disagree.

The rest of the code treats ep->ss_ep_comp as the sanitized copy of the
descriptor. usb_parse_endpoint() checks and fixes ep->desc the same
way, and everything after parsing, including usb_submit_urb(),
usb_endpoint_max_periodic_payload() and xHCI, reads only these copies.
max_tx itself already takes wMaxPacketSize from ep->desc. Before commit
842f16905dfc ("USB: remove the usb_host_ss_ep_comp structure"), the
clamps modified the descriptor in place, so max_tx was computed from
the clamped values. That commit moved the clamps to the copy but left
max_tx reading the original descriptor.

Compute max_tx from ep->ss_ep_comp.

Fixes: 842f16905dfc ("USB: remove the usb_host_ss_ep_comp structure")
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Report: https://lore.kernel.org/linux-usb/20261115163701.226491-1-teel4res@gmail.com/

 drivers/usb/core/config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 0e79b7f8a73d..2f031ea6a437 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -170,12 +170,12 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 	}
 
 	if (usb_endpoint_xfer_isoc(&ep->desc))
-		max_tx = (desc->bMaxBurst + 1) *
-			(USB_SS_MULT(desc->bmAttributes)) *
+		max_tx = (ep->ss_ep_comp.bMaxBurst + 1) *
+			(USB_SS_MULT(ep->ss_ep_comp.bmAttributes)) *
 			usb_endpoint_maxp(&ep->desc);
 	else if (usb_endpoint_xfer_int(&ep->desc))
 		max_tx = usb_endpoint_maxp(&ep->desc) *
-			(desc->bMaxBurst + 1);
+			(ep->ss_ep_comp.bMaxBurst + 1);
 	else
 		max_tx = 999999;
 	/*

base-commit: 3149e8b3237f58d4dd440fc64c45c93404c4b064
-- 
2.34.1

