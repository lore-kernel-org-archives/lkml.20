Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409BD481FCA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862961; cv=none; b=Bz5YkhAA6iwMW9gaQQUzQ8z3YaxPl7nirKuZRWs5OkEWzuYnZFaTuYPVM3f2kgdwzhqDfT2QWTyIhjC6JvDaambnS8ahhu0yBtOt3LnWF4Pb3YBAz0KrF4IH2D1lGg98not/Nwuva7KlXzAJmigmTxy9w16bfoL77AIU6MlaX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862961; c=relaxed/simple;
	bh=vOJczOjB0TyoKQuVkW2orzE70JFVuyQyf49j8eErCTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6BPiKGGamxWgGac6Z5oUzyuyIF+AiLt6FlnhljCnbDfjKArYdrHh2fDddRjbrHjiTH+ruxxfOwLakt/vJkwurcap4lWHQnTfS3miwuRhVwzpI2KsIVgTTODRnzZy/Fp1BuTdy6zL570ed2nx4Z/zsKFfIRyixH2Zq57DqDyu0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dL7/Qskh; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dL7/Qskh"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso4257848eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862959; x=1792467759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jUpAcTrC5YTZFZzQ8gUcjDGHz/C/y6LLOxwXLI1DTw=;
        b=dL7/QskhLLhR9SP9+FZZekIxX856Velzj7ahazF1Zt//zguqFw3lGjmS7wfTP95zBV
         xJ7pI+IpvIJkA+7gAmjgnWN5DixYAqrSd0AT5LUpVup9LsPclxnKg2qWaSO+FAqwIX7q
         e6+V4vu3oTVNIVA9jofoet4s3ebPu35e2a/Sen+ss4z5dQyB/VGM69ZrvyfDzZY9mTHr
         h483MpyGkODTtCml8J4eDCizA+eHmj0lcC1cLKo0C4n8HYupZyHRBZFeUBt8Z5kI0c95
         cT7mD+SM4VO+UGMb1VRYbJURBwWQfscy+nbBvxcwrlC5PU63N1FMrJ9gAx1JXKFHRlds
         dPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862959; x=1792467759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jUpAcTrC5YTZFZzQ8gUcjDGHz/C/y6LLOxwXLI1DTw=;
        b=EAmIKprXeFBxPRRIB4B3pkfHQEBGuz+s52rhlbPvzCrm1XeYEYaVg2dtojyZiu3w/o
         MPYUAXxMyVKQHLoN/sOw8zJ7XPBT1bWRbztpGwkP7islLSufUkfXMSTDmEFyWlSKheH/
         ak0L4mRpl0uuBq7a5E7wKHRjM751ig8UnVgC+ETCuYu9vjQplj5Vc98vfTSrlWrdjjmD
         DlIhfZksF20mn/QehedyvJ2AoNVGntDr1KsadRFpHCeK08l5wjgBG7FpuQ6wfXXdD3XY
         ebtVAyLxSqA2vBnPL8Jf9+mWtI08E9IcPNlM6rookbcePimJklQrO2N8fla/HXkf44Hc
         jhgw==
X-Forwarded-Encrypted: i=1; AKwUvBy+3kapIReMoe7Dj0Ygw0El4bYPfMuSEX0LQc8hyqR3VOrHYCXibMK0+ThvNUF2AWIgxt5FJNunAJPn7Zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhAwsepEjPP7c+N1SWkakcbkLoy0ap/C5CUEKWJq0rSL0rw013
	mzm+2sBs+HclVx5AS5V4HDrGKLV8+kIvn0Eo/9s/UcY9yZAbHIwiDqzn
X-Gm-Gg: AYBFou0IemTOdZnQXpoiJwpUF2RRA0H2rK9UgstxZzELCtShlufuObohEwXkPF8yXSI
	DMVwofXZvbe0RvHFM6EPMciM9nMWnTlxq529aGmeu0A0zn1E0AyAxJipw/hkdYyEWekpE5SLD7K
	AQOuTm/kr3ksFilk47OBSqqr3lBvY6dX/INwMc84LRWQaBeOUz8xJ4T7tO0FmbJJYLYeoikqq+I
	a2Nspkhvd2L7Mma085CJIKI8KoQRIGITrXoFy1b05fMdaofBuBalVSIOzQbdb05GS+9yitNAvma
	IT/EY1HwpLIew2eg/iYyuLFbaAmLrm8/V4KRK9GC8VjCZ3pI2P/ebApEiRcgn1eSdaR99/sQegs
	qHbuc8J8X1y58byXLjvnCatAalHAKLpw2gqnuFhkMzCWXu0WoaC7+1YgSsgz0jQwRKDWGgu01lw
	I6LR/S4+Wd2ACJI5nvFbgw6T6dxqWlpJhmIySLFq7ldAbQSm8lQ0tRV/VkrSMwAN4KYEy2D0iJQ
	aAY0tFLBIxEevojx0Ssituh9nM1UfG7f1y35uLmJy2HtMy2E1sC93Et8P3CiLU=
X-Received: by 2002:a05:693c:4151:10b0:351:70ec:1071 with SMTP id 5a478bee46e88-3537e0866d5mr17875344eec.16.1791862959195;
        Mon, 12 Oct 2026 20:42:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:679a:f35b:7c29:e0f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb68e56sm35268677eec.29.2026.10.12.20.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:42:38 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 12 Oct 2026 20:42:25 -0700
Subject: [PATCH 9/9] HID: playstation: Drop redundant report ID validation
 in ps_get_report
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-hid-core-report-validation-v1-9-e0dd5cb60b2e@gmail.com>
References: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
In-Reply-To: <20261012-hid-core-report-validation-v1-0-e0dd5cb60b2e@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 David Rheinsberg <david@readahead.eu>, 
 Frank Praznik <frank.praznik@oh.rr.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, Even Xu <even.xu@intel.com>, 
 Xinpeng Sun <xinpeng.sun@intel.com>, 
 Roderick Colenbrander <roderick.colenbrander@sony.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Shashikirana H K <shashikiranah@chromium.org>
X-Mailer: b4 0.17-dev-e56a4

Now that the core HID request handling validates returned report IDs
for report retrieval requests centrally, the report ID check in the
PlayStation driver is redundant. Drop it.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-playstation.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index f9dc9378cf77..de51a22ecf0c 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -813,11 +813,6 @@ static int ps_get_report(struct hid_device *hdev, u8 report_id, u8 *buf,
 		return -EINVAL;
 	}
 
-	if (buf[0] != report_id) {
-		hid_err(hdev, "Invalid reportID received, expected %d got %d\n", report_id, buf[0]);
-		return -EINVAL;
-	}
-
 	if (hdev->bus == BUS_BLUETOOTH && check_crc) {
 		/* Last 4 bytes contains crc32. */
 		u8 crc_offset = size - 4;

-- 
2.56.0.385.gd3acb90ef8-goog

