Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12916364935
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853161; cv=none; b=MJqntAxITRCPixvjleyt1ix+0iLAvIeCa2ofNZwvZi8rYILE9BLmHM4PqQJiQehMYVAey1SdjmWAjG/GXj8kPpFsgod5pZuS4uCQBVlMbFEiQtF+9E6EENDnlG117lptJsOF2mkrA+6WqfP5souYnPhQGU81NLraAwzj5Z6JS0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853161; c=relaxed/simple;
	bh=7D0ueLF5U0UC1KdmFom1A5HOnKTONJlWgvjZkLkoPEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5OztLL3NIGZYHIP1cYFm5WrEGSsYgF4HIoTIy6/DkutB7exjF35hE8GCMd0yZxWc6Bav6WZ3QwFUtXZnmKehhxtVkKmHX4n/Z8EipI9iR03Ls+qKNEKPyMonP1H/kzL/kgSruvVBmbS750L1VvRcRWUirQcrYaEMIQ/IOKgBPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=jYv90Qb3; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="jYv90Qb3"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e618db81c0so19692465ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791853157; x=1792457957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KD/O0ovUlmAuZHc6X9wXGWv7XROc25F1YO2O1JLs2oM=;
        b=jYv90Qb3V8IYczVtrMAn0qtBmM0TuNKlRGrB2CJQYO6A5aTycKQVnHCNCojteZElFK
         ccpx9tLMDiNFuha3hGDHEBhEB7+fO2FLwbnh80d+ROil2ja6VqAmefFq8eAhaeKMxiJg
         TB515+dhw0YEeKK7jc31aKOr24HPlq8QbYFURTZrOCXuDdCT8IPjWvmc+x/nKpWfSaWv
         i3w2c6yoAfLPJJeiQzIY1l7PHpVqDc2+xpy9WrfSQ8T4iKVB4lLQUKijxy4jc2Efiey3
         mSFUFSj+4R6s/X/eDXbNRV8b3RIT2iX3KT3kgP9FPgH7CGV2WYkNQByK3ffbaiST0g0o
         N4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853157; x=1792457957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KD/O0ovUlmAuZHc6X9wXGWv7XROc25F1YO2O1JLs2oM=;
        b=nI/q1Ls4UvIxib+Ucq66/h7OJH7oJNziDZXzlEIcWIoWRC7Orwb6rimQ5eGjjJfpl7
         TwXc9hae7yQZ/exOg0pH31U9A8stO+6fzwd7HOFBk+uVOz1AtYDjFnxq5evUZvVo2FxM
         7xKLxnxmpkhSxuZ7cLPEp5d4PpfvdUn/zR4uosQbHNUJleb4H3lAbsjThcZv7QNCi2sZ
         IITQk6hcO1XHSZYGUazdZRIv+jIZbKMm/QlLPPPt0L7aczWh4uvFV4Nq+DM8FEmY41a/
         h16BAtiPvoycf9mtOn1wNm7yAKknMCSo0WWPXTGIY/1r0Qcp8K0GWtD94ENzHZ0MDRqL
         n8IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKqddCT+co14ANB6m4Lodj/AdnklHEhHNjAZcUqFTX+sOfJ8T4h/qA95AhbrVOQLQ3TIwChGkkWbOFKhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY8rbo/+OfUiR+RrA1gEZ5LuKOiSOJykuNGpQl78QGsdjEKxpM
	lHMecc2Zq6aZpj++m49QMw8NjdQ98dKOdW4uqHWPYL5QnJAyzk/Rce0iZgPq/BnNwj8=
X-Gm-Gg: AYBFou0MoqWqKqJFGCAc2qP0qLucRgZjRQabunkWYptU6d5Eh/r+EHhc7bQDY1goMhE
	mJUvrVvfn4QZELQnHYt/lOlW5UGoY4hxDQSJ7DFB/IhLt4//uRqMqW7CMgpyDqMxUX5LX9tNrG2
	beiBLsLRA+xRLiHVvlzbHEGn4hoM6YnO2+RzrzB1xudwFpAA5o0t4yRRTTk67bZaw5DMaALVOPQ
	XyCyRSK1sj7R5v5iAPd+LEdYKDJNJj2woAVTL14FUcDKVOOLxCB3zOtTaYwTQ+B27GPyWf3AYLx
	ew24Gj3ACVgFcu8jszcS00EJgMhOshxRMVo7LAzzdu+Osa8GoCOMMDMHoL48eD9nL6KgWk1pkbU
	s4jNE5gSj4DjSwjLl0slcXHxKLNlwikE3copYSOOxFwDl4tg42dWAveAFVL3ZpGXguqdBhUt5Te
	2u58sRIL2Niom0b6kDiRCwxaCQDDW87XMVB5+M8YqIHOuhe+/ebsKbdf/QTk/vd7UnUlwUqhavz
	JM9vA==
X-Received: by 2002:a17:902:e888:b0:2e8:4078:84e5 with SMTP id d9443c01a7336-2e842cd449fmr90537535ad.20.1791853157038;
        Mon, 12 Oct 2026 17:59:17 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1643sm49225935ad.70.2026.10.12.17.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 17:59:16 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 09:58:54 +0900
Message-ID: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
the OUT request completes successfully, looking only at req->status and
never at req->actual.  A host that declares an 8192-byte WRITE but ends the
data-out after 4096 bytes still reaches target_execute_cmd() with the full
length.

The buffer is not zeroed (transport_generic_new_cmd() leaves zero_flag
clear for a data CDB), so the bytes that never arrived keep the previous
page contents, which the backend writes to the device for the host to read
back. The target core refuses a WRITE whose declared length is wrong, but
it does not see a data phase that simply falls short.

Fail the command when the data-out is short.  The OUT data phase is over at
this point, so clear cmd->data_len too: otherwise the BOT status phase
treats it as outstanding WRITE data and queues another OUT request to drain
a host that has already stopped, wedging the bulk pipe.  Rate-limit the
failure message, which a host can now trigger at will.

There is no oops; poisoning the buffer and ending an 8192-byte write at
4096 bytes leaves 4096 stale bytes committed before the change, and after
it the command is aborted with nothing committed.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v2: on a short data-out also clear cmd->data_len so the BOT status phase
    does not queue an OUT drain for a host that already stopped (would
    wedge the bulk pipe, reported by Sashiko); rate-limit the failure log.

 drivers/usb/gadget/function/f_tcm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a2..cbe64f934724e 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1090,8 +1090,14 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	if (req->status) {
-		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
+	/* a short data-out left the buffer unwritten; don't commit stale data */
+	if (req->status || req->actual != req->length) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		/* the OUT data phase is over; nothing left for the status phase to drain */
+		cmd->data_len = 0;
+		dev_err_ratelimited(&gadget->dev, "%s() state %d transfer failed\n",
+				    __func__, cmd->state);
 		goto cleanup;
 	}
 
-- 
2.43.0

