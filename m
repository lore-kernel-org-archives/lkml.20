Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84862471D05
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866406; cv=none; b=k9v3e9SUjtBH/rGFE1tI4vYTQFg7qJNjWjB7wwiMU7arGEFG3pnxIgxXaSUKUt+yZp6DytuM68xxjjghS4DLV9y46rTAmt4TzpgEfppsGoYyMtSF4A8ydj+GYf/LKAVfgbK4sBYZtsB3bwifmYyI6ZZFIw5OCcy8OD+FKQr63rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866406; c=relaxed/simple;
	bh=vddV8l0mQz8O3IHzxAknbEihgxflXBN5+PEEZMLY3zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRDIX/fShnLGE4W2autkVY6t0fxiF3bLGVigL9tJS8dfPIQTM/6wFTM/Ky4Y6PDdMfReAvNEA0YFHXLz8c/rh8s1T+/MghwnBNODFM1uBJ3VHjb71HAhKx2AxPMciLwOW+QJfN8dz55UhqLzCOOCnzpHNyI1A290U5fbYhk7vqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=dEbxDzBt; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="dEbxDzBt"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1043606a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791866403; x=1792471203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnG57MFg7PrIckZ2E9sIhy4PvUmmL/cUOrrKMINTiz4=;
        b=dEbxDzBtqGfbAZgvAPS6kvBfBLy0B/zNie8YP6Z5HtuWaA3npHZH2cSPOvKFDU8v+u
         hxSRJMLDC2y68UTkAu2xjjeDaXahCfs1k23rUe7kCFAeR1Lp/0sOu/M/IiYYnnHoRzxG
         EcrKRpwsiiZVf93zD+VB8x26RCQ62ZWLZFiicaxeBAtuUuRMLG0ZoKycd1AaYtRm3cnl
         E2+y1xblZ3WzBMPheM16ZXfTg3Hyxe8/jQAtjUchVSAlljzint807TeXVHjVJHMv1B45
         3F+iaEzZxHR7BjBd/tZ1BNIrOLeR5pXPyQgFXyNGmqANXClGQUM9Oy+JGoabU4f+qC6f
         MJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866403; x=1792471203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnG57MFg7PrIckZ2E9sIhy4PvUmmL/cUOrrKMINTiz4=;
        b=kByIWpI3JHegWlFJrKv6F8f4P4eu1dwjkPXhX3n9ryzjR5zq3wvkhp02/Di4afXdPu
         J7xz1jptqUq3Aaf9CgB85nxQgKmDyp3zpat/CJk7mmANmfDZUrR7XC4KNdhZah1f21c3
         mPY8GoYlVBrzQ65BiiNHp/NwtVWjG6YNKaIPPaSAmAmrai7EToZplxUNH9vJyRxT5ruv
         riaMQTmTzqbYc1fkiXOptr3UQgd465nMBQhUUfr51b39axq+8LaBQ8VMmOJTf/OB1MFx
         o53LWzlJNsadQgt2wQfjZlVbYOcALGu0D2iLx/AP/tS9tni0fmQT8zKu3pnUx182V1Q0
         IP/A==
X-Forwarded-Encrypted: i=1; AKwUvBy1u8xNEc/wZtdfMo3E3/fDA44+NAB3WGHBfx2GsIop+6OSto5rJurGafeIzwkJR0+TWAWYOR04V3+9cAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeBX03hAtWbpwVwTXhVFrPwJMhGdxDCVoot+dMzT6Am5lXsaF1
	AD8XoCarzYtGemRZj413/16uOKvy5+lw+GUtHesuu9r8huU3SrHC1Byks8ViYwaB3e8=
X-Gm-Gg: AYBFou3a1/X98zbUhx3g3TvCqwZisJzlnXOipbm7a9nL1YLhBa0hGQJCQEh//Y0VcYy
	TKLFI9mozZNBO7JyNmbyp36eEiGwwI7SWuMgYGqGAyYysNjgUM7IsHMHbk7bv/M/OGVXgCxtCWn
	ScxMFe2La9E+7cYjrtmwtM8n/58YpHejP0QVK5wdRxyO4OzXq+7YjV7gHsbD0Q5eYJ/xuOVV0qa
	UA1M5HTFJ7X9qEPiFoTcpP4g2XQPlue1dweU71pmOrTpT4/T8eFPUXbfrAUz3oyKIQP8jI27nE4
	x9PwE7MLpgNbDLv5xw3vuEKOV99oZMvcr+O1rKTOY0DJaDd/Ivyom4325FxPIcAbEHWVvxvjfGL
	S9s5YfVRAEW2DZ80po0Vbf/HJjH6V1xbfXLKv+zNBR6SoZZSUevRMyP/CC/OgAnrpxTB05IbbpS
	L+7OJJh71LFdzdwa0d+HDQRB8xTC5tTjMuClDmDz/N7Xgtj0LnCJDC24UDksdsHbHR2lhcrHxZL
	/UUVg==
X-Received: by 2002:a17:90b:5864:b0:3ac:38dc:6b9e with SMTP id 98e67ed59e1d1-3ac38dc6d80mr1310335a91.25.1791866402713;
        Mon, 12 Oct 2026 21:40:02 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm18861327a91.3.2026.10.12.21.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:02 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 13:39:51 +0900
Message-ID: <20261013043951.2534225-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbg_data_write_cmpl() copies se_cmd->data_length bytes out of the bounce
buffer into the command's scatter-gather list without checking how much the
host actually sent.  A BOT host can declare a larger OUT transfer than it
delivers and end the data stage with a short packet: req->actual is then
shorter than req->length, but the completion handler still commits the full
declared length.  The tail past req->actual is whatever was already in the
kmalloc'd bounce buffer, which is not zeroed, so uninitialised kernel heap
is written to the backing store and can be read back by the host.

Fail the command when req->actual does not match req->length instead of
committing the stale tail.  The short packet means the host has already
ended the OUT stage, so mark the command and report the residue in the CSW
without re-arming ep_out to drain data that will never arrive, the way
f_mass_storage treats a short_packet_received.

A short 8192/4096 WRITE then commits nothing to the backing store instead
of 4096 bytes of stale heap, and the CSW reports a residue of 8192 with no
OUT drain queued.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v4:
- Keep cmd->data_len so the CSW still reports the untransferred length as
  the residue.  v2/v3 cleared it, which reported a residue of 0 and told
  the host the whole transfer had been accepted.  Skip the ep_out drain
  with a command flag instead, matching f_mass_storage.
  v3: https://lore.kernel.org/linux-usb/20261013015416.2503787-1-yhlee@isslab.korea.ac.kr/
  v2: https://lore.kernel.org/linux-usb/20261013005854.2470384-1-yhlee@isslab.korea.ac.kr/
  v1: https://lore.kernel.org/linux-usb/20261012154422.2436134-1-yhlee@isslab.korea.ac.kr/

 drivers/usb/gadget/function/f_tcm.c | 14 +++++++++++---
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a2..d686fbcf36f72 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -120,7 +120,8 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 
 	csw->Residue = cpu_to_le32(cmd->data_len);
 
-	if (cmd->data_len) {
+	/* a short data-out already ended the phase; draining it would hang */
+	if (cmd->data_len && !(cmd->flags & USBG_CMD_OUT_SHORT)) {
 		if (cmd->is_read) {
 			ep = fu->ep_in;
 			req = fu->bot_req_in;
@@ -1090,8 +1091,15 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	if (req->status) {
-		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
+	/* a short data-out left the buffer unwritten; don't commit stale data */
+	if (req->status || req->actual != req->length) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		if (!req->status)
+			cmd->flags |= USBG_CMD_OUT_SHORT;
+
+		dev_err_ratelimited(&gadget->dev, "%s() state %d transfer failed\n",
+				    __func__, cmd->state);
 		goto cleanup;
 	}
 
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/function/tcm.h
index e1d5a93916127..1f9f7181603f3 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -88,6 +88,7 @@ struct usbg_cmd {
 
 	u32 flags;
 #define USBG_CMD_PENDING_DATA_WRITE	BIT(0)
+#define USBG_CMD_OUT_SHORT		BIT(1)
 
 	/* UAS only */
 	u16 tag;

base-commit: 2c3418fffa9d037b2038a6db48be63f9e2291806
-- 
2.43.0

