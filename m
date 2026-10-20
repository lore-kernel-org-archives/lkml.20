Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484488;
	b=18GP13FXkYfW8IjzqCWSqiBtPfHMVEd/dtthSsppN0rzlvP9OT4x2JMUymW1esCraV24
	 UM3QzyZqJyPNrX7ugH1DM4p1HnGEUukdZE1L8I8wZdjnTOAT0YX8jSFJQJeES4zVztVYQ
	 wf+FoGsrmuibmGxx9SfYPlb408k30ZZNEood1jmF74xPLSLkvwPHG1KrI0jtuWyaMDLbd
	 181ZdF1RbFpP0QqSIy0xRqi+XtFqDhd4y8kZ73+nSPaZsuic5jkwPAt94Feoh/rSPdwmM
	 1bHWTfupTucZyF9fx2YGnISURwJqJf80Ers7G4mtVgTV/9R4yFEj7SrHXZCY8HrdDLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=QfQksp9PS41+54skybmXZINJknlp8A4XjgUEvLqvE94=;
	b=msEY+h8btSnE36xgZU4Pt8GOIfc6FANhAccHwhhW+M8Q+71PVgJUC84LjAYgkU6mvqSI
	 6bzt/pq8zbcN7yKOEJ1xCDaEvEXUmneulISl/XK3VAWbQIaAaZfSbJ2LId7/TynIoBJ5F
	 iJou7BIGE7sT//+8vlhQc4v3YuZAf9hXAuWWjxbnS9t23BFu4qXa3+OlKPxD9WhYJhqcV
	 cFqOZxZ6A/B2VeJRjNnm/YCNgojFV9d5GPut11DW9ZInPXVSI8YA0mkC7SKiVPriyGsPQ
	 MHHsGQhfkBRXV1PUJbTMpDb2jtTTmy3t8qgf69tHkHGnC9yE+5f4XilVjo1RlFO7SaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PmQHgmD+;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B8260A382D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80B8260A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PmQHgmD+
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso525695b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792484487; x=1793089287; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QfQksp9PS41+54skybmXZINJknlp8A4XjgUEvLqvE94=;
        b=PmQHgmD+RqZPhVAOnU2H3tMW2LkFO9svX6eoS+4EC7M7uqAk8qUV3dTdTzhlGGA4Pl
         YYzBw5jxwM/Efc/YE5q03OBcZ/nmIWn7foyyZNnz08SspN2xur0GIFAkHzsa8J5OUXA3
         /B4jT4o8dE62YvvQcwCTlmjiIlbKvbiX9QozO64GDl3HD0OEVPGNaogecCdcencAFQ+N
         eMMTbrfxGmdwSRbFiSZT+ygGdI6RBBqOTCFZ2JG6aE7B84Ivl7HknKNIOK0tiIkivHcQ
         uIRh87+RNHSsu4V1dRzZ1FfGdblGh6/D+k4UjE3qGmFFXatVfeCD7vGIsU59pqwFJCcI
         egBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484487; x=1793089287;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfQksp9PS41+54skybmXZINJknlp8A4XjgUEvLqvE94=;
        b=kURWSC8DSBQBJlu4BOTIKix4oLSCO+pke75zLksd1HPB0uE3YUi4/MkxQvdalzqill
         ktP3jXa32r6WfB2VcZp8y3bdc2boqCG0U6E8YdlfOZCqrSA1wiA79/ee5sBw9UYfkWx0
         7s+v7xowgwY8FpoOVUj/vk/vdregaQlahzyo+qy7NsKJcXnNSjUKaakXDbDIO/Oxqqud
         A+FzNZZHggXat1TqM/vOhL3vxXVzI0qso/x87XLS5XTBVygHp39JJ/HPZy/2sBfBVP43
         RySBQjpOK1hLd8saDA75wAbYpb8LpVhJVLZF64dQYO5cFyBVdEMZn5x+UXKZPuOji+jM
         st+A==
X-Forwarded-Encrypted: i=1; AKwUvByv3bI9Z6cqnHBYEpXvfeT7DBWIm3ta7PJQ5iaMm8a0NqIOt4ZPeA0k7V1wcoMp+5i88E9+/Mgqzgixmy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Mo4RsB7AfiJPjB71QbVg0laIE2QkN0opqPYwrIxrKiM/milR
	vhH+PSlRxrailCLM51JP3k0k+VPhT33rJXAewbglDgtKFLA6FtdmvhePesnrw89i02YNcXLCV/w
	R/6T4O1oIJUOKU6cUIA87rg==
X-Received: from pfnj7.prod.google.com ([2002:aa7:83c7:0:b0:898:802d:e5fa])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3d0b:b0:89f:1b32:29ba with SMTP id d2e1a72fcca58-8a07bfad6damr870764b3a.13.1792484486558;
 Tue, 20 Oct 2026 01:21:26 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:21:10 +0800
In-Reply-To: <20261020082110.3511797-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020082110.3511797-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020082110.3511797-8-stanleyjhu@google.com>
Subject: [PATCH v3 7/7] scsi: ufs: core: Do not release a reserved request in ufshcd_abort()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, aborting a timed-out device management request drops a
clock hold that the request never took:

1. ufshcd_dev_man_lock() takes one ufshcd_hold() for the whole device
   management command. ufshcd_queue_reserved_command() submits the
   request without taking a hold of its own.
2. The request times out and ufshcd_abort() clears its slot with
   ufshcd_clear_cmd().
3. ufshcd_abort() claims BIT(tag) in hba->outstanding_reqs and calls
   ufshcd_release_scsi_cmd(), which calls ufshcd_release() for a hold
   the request never took.
4. When ufshcd_dev_man_unlock() drops the hold from step 1,
   hba->clk_gating.active_reqs goes below zero.

Release the command only if it is a SCSI command.

Fixes: 08b12cda6c44 ("scsi: ufs: core: Switch to scsi_get_internal_cmd()")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/2060a8da-581b-46d1-a510-779f4df716cd@acm.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index ee898f4a5bb1..5d1a9b4e9b8d 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8228,7 +8228,8 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	 * Clear the corresponding bit from outstanding_reqs since the command
 	 * has been aborted successfully.
 	 */
-	if (ufshcd_clear_outstanding_reqs(hba, BIT(tag)))
+	if (ufshcd_clear_outstanding_reqs(hba, BIT(tag)) &&
+	    ufshcd_is_scsi_cmd(cmd))
 		ufshcd_release_scsi_cmd(hba, cmd);
 
 	err = SUCCESS;
-- 
2.56.0.212.g129ede20d9-goog

