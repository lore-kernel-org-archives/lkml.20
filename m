Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4E392811
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 02:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792204727; cv=pass; b=oy60e18lyrksF8td/8enMK1u/iGhPPq7zEDOf4qmqD84JAETMmmVdwZ7oOYwANUV9bYzgtJT+JgdoC/nlNmor3WH56KzHK5Qrs8bOXwBd3U5hNFuXI2x1Mc4gntWNr5pWFsZhS/8iNlqSVq9BkPh4aSOAcp507lAKE+QypAocpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792204727; c=relaxed/simple;
	bh=nOUZa7mPXb64B5PFhied2Fd9elX3CDzEuQcuQ/9SsVU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QLWRBzlWbhDaWMb3f1eEmofoCOX0cCzfIAX3GE1Jf6IRscNpsz3liTI80wq9aZV09mn41D5Glv8dQ36rWY7YV2AJG8xNW6uhJkbBYAj7lsfVb4GOL7BDjDkbibvS3r7wrFxWzrwUsXjaqtDL+/gZWY5Bk4H/fomfCzh6ShzN910=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDhQ22FO; arc=pass smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDhQ22FO"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7c420c2c4faso251346137.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792204725; cv=none;
        d=google.com; s=arc-20260327;
        b=QCaXOprnoPI9mZk032RGsglTPC1L3SmAGiRwnjlro4rz2CeCkcyPSfce7QjDXUYEOL
         sq13uQidw5iZ6QEYE9ZTOXNfHqIkhz/ZQpQ5YsvEgDKSwvI+4edKq1Bqd6NunL0n1R2h
         pMp6EIu0TMi2HsMptWpzLY2llnSHt0p/3V2QOBNTHKRtg8z3AIk/+1OBsc3VC1Li/wVC
         XQHMb4+La+MoyggVhlCUmw9CTiU1OjHk5X5voGo1IX/dczSocp9GvdFES/1D+G+Qj3af
         tTqoFvFuy4/n0Yxojw5MHwg60I5RH8Gt5nrMyjltGtSAU8q0sz6DwzK2Fx9zWr4nm7Up
         PvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=F+cVJX57n5iK3Mle6VsDiyzgCu683wJpJbVw4JqE5DA=;
        fh=df7aCmES6u0NbviXgijIuwLnISzXX0nAdquVuR/JduU=;
        b=Zj/L4ha/xbkyRJCKit5dE4KY4XTQVmjIIkvHxhU2jqrZfwAKaaCcsWGgsF4y2+OpFg
         lQaBBNakwrH6wBVf+IZ0rcNBv+96hSvzbI5a9lbYrLnN8moWAq+zOtUOLUyURRQgREZn
         q3b2+s+2F5jBIq2tFh5ZjIcm5dReVMd8ChY9dpF3jW5txyf+024oWn49b3scnd7gLOQ7
         cQhS7PHpFxdLk4OhCTkfeqP54CYCKak9e98v06w3WmUZdFOVsmOb/1cMaA/MrCtbbWOa
         HAbvVApAnbji6wr3ilT9ODoF3+a2V2LrFvcbsvyi+Kely747LwJYWBVoueuSeIpBuqQB
         0rqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792204725; x=1792809525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+cVJX57n5iK3Mle6VsDiyzgCu683wJpJbVw4JqE5DA=;
        b=TDhQ22FOpGglWO+4nvqHrnedJkB3n+BmoR2WUGm0MBNz2dVPxrpCzBftnr4nG+yCa4
         jR4EldbYdrcseIecVBdWaBGYH9jnyNoSbmi4AZ07Xi3nAmpXH0g7GkHOkZ9Hlz5JV1aZ
         /xXwmeTcVw5ylXmC0Q5iKX/92LADKnHrC/qHedI8BGePsZiq+r+Ah0s1DHUP4Th2cFwC
         RMNP4CK9C9TR6gEXVSjN3hl/oyI9MV/fo3oZIzwqblErtB0Tv1DWFO9TS09onQ6W2+ci
         lmn5/79M8hhkDRmtbqnQPpTFNq+sQT0PVYZFJ0w7/6XZZDmWWVHJgsXx36zgT/S+7yRL
         JoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792204725; x=1792809525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F+cVJX57n5iK3Mle6VsDiyzgCu683wJpJbVw4JqE5DA=;
        b=0dsJe/AEtXWXpVPVW4+h5zXnup+2JcFUDq67PRKZzB+RvOFhN3dRuqe63JFGTkADUo
         9WyeIuZ2nxWh6tDMufOtMMPSC2sARYIqXa1wyHl5J08cYoc0jmpq2Iq5H7gbWQGBPT/G
         vdVqDd+gPgPfqA5RrTVstIDm4BFuMIZt0kcliQEaHXsKevmd5JA6x1kKHtFWxnloCagi
         k9HYmlVqvt0VwyLNAXWFgY7s26IyXad8zNszo851u0YFtBruYVUHLJjQ9youLy+eTgVl
         HzjrP5eN5aIoBTB36P25yRU7nrl0BAJszSv42kPX5l8USFFFGqav8B2E6NHQTECiMI71
         HmRg==
X-Forwarded-Encrypted: i=1; AKwUvBxCkarHziVoUVR7PD+l1bqg0C7JgMTcJemzp+4TILbKcaXsQhXyengRwDC/QV76yaFPm9Qpd99tXnrL3AQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWCfv6zQxqoMYLS7eZ3qilDxUIQrzOdxfEFzJoOclwF4mO/Wae
	xCaVvg/7yHL+gMbGBRpaKRxLUGdgquK/SdhAndmn/jh0jUfR6WIKWF7XG7Hgk6F44B9DlQ1aqtY
	femtezhRT3VL9Ktilm94M2iyh1TounXE=
X-Gm-Gg: AYBFou3g+8bQ7mvHgUBiBXsfFOYacwJRdfksqgQS1KENQ5JxtD6FGaZEm9TOnROYLO+
	HS4fZMSu/Sc5kyUAwEusyK53SXOjXwVNpp3dxTn5BtORBWN3sHaUceor+XdOwncukqSiAKG9JOE
	puu/6GoXg52uo8tXQt6vAoCh/eUxH6ZJV8Hl0+dksZ/9yD+i8dUY2WRUWLdeFy6XLj+7+6VrOVl
	/29cf9xMjkMu6Eyx5lBehuwVSEmaTp97/nqgMwmHeSyolMYINOIahAFyxdXGLIFT9E1nF9nfMkN
	pBU0nXnHg9nTzioikBagwsmpH1qbUvmrk9eKJr6D/ijSm85j3z6HGgI=
X-Received: by 2002:a05:6102:e13:b0:7c3:3f26:8785 with SMTP id
 ada2fe7eead31-7cc36911894mr511447137.7.1792204725618; Fri, 16 Oct 2026
 19:38:45 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 19:38:45 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 21:37:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6LW15paH5by6?= <berringtoni36@gmail.com>
Date: Fri, 16 Oct 2026 19:38:45 -0700
X-Gm-Features: AclHuK8YKaodonu_D7Dy53BTPfOy_XVt1iqiprjUi0LnQxRlVx4_q3w6CmNizuQ
Message-ID: <CAF2O-sPfK96Bvqtu-reg+y--nuV35tM57Med9irz_a3RK1xhsw@mail.gmail.com>
Subject: [PATCH v2 0/2] iio: accel: adxl345: propagate event regmap errors
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Joshua Crofts <joshua.crofts1@gmail.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This two-patch series fixes regmap error propagation in the ADXL345
activity/inactivity event configuration paths:

1. Propagate negative regmap read errors from adxl345_is_act_inact_en()
   in adxl345_read_mag_config() instead of converting them to 1 via !!.
2. Preserve negative errors from adxl345_is_act_inact_ac() when
   disabling activity/inactivity events in adxl345_set_act_inact_en().

Changes in v2:
- Resend with a [PATCH v2 0/2] cover letter, preserving patch line
  lengths and whitespace to address the v1 formatting report
  (thanks to Joshua Crofts).
- No code changes from v1.

Assisted-by: LLM
Signed-off-by: =E8=B5=B5=E6=96=87=E5=BC=BA <berringtoni36@gmail.com>
---
=E8=B5=B5=E6=96=87=E5=BC=BA (2):
  iio: accel: adxl345: propagate errors when reading event configuration
  iio: accel: adxl345: propagate errors when disabling activity events

 drivers/iio/accel/adxl345_core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)


base-commit: 9ee8306121495d2a25aa5d1bfd519f2748786b83
--=20
2.50.1 (Apple Git-155)
