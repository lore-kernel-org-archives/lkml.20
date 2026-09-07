Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F23B95E7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807013; cv=none; b=PE+5Le0LRvca6YpuULJcrWcVxm/0l2sKFKpvD6FJgRjLeMuWsRD6e3m5hcWIslgfew7+UDGAZ7Ekm9UPtoZcBoqvhmf4qzdNgyXrJy3Pbunx0XL5Xszb0WLWkJ1ZGfpTkGXXCLtIM2psHyXnSVTqPs51PFAyDOx3nYWfHzdL2Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807013; c=relaxed/simple;
	bh=7lAn9DyPthGZJ3AuAXhRiq1+5CvwYsfZM+FVyOjiqOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MnE/E1JcOn10nQziTlhjoujwn4EXcxWHc2N0xIEhXJqDZdZxUgwcjorzKpupkI2wDXO48P9ubRP13XXYl5exylFsotn8r7USFdmnX16fjSMIGikIHAdAYNml3KNOr3hBekNDqIP35VJfdcqHER2zw6US01fBe9dVtfIjqnl3Q3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWREDrpv; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWREDrpv"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843af75de5so331295f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788806999; x=1789411799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSTxoKREPfRs18shMJ68qZqf1s/IL7UP0jnRf+EkoNM=;
        b=TWREDrpvvAV7RfNWhZ7egw1oncGNZHpXrt7JS5WvdViQxijblh4jr+VaXGcDlMEiiJ
         BKAjpyO9UaNwHUyhHUs3UFHlYqUrtfUqhTalRhM+n4KhUNmqpUuTrmb2bK9fe59qcgDD
         57B3vrMKjnJ+zwqEYM74ZQ2MnUveb7wlhkz1UOdZAwGvaRLWlAV3wxoMU2rOU/VR9lSW
         1wNG2H+GFLlf/MUztu+2T88ULOOpL6KxjjeL+ErtMnFXZqL2Dy4/P0uUdtOIVlZahe2n
         ZM0Yyi523HLWxhQ+62hz/um4M5Auq5Cy1QXO34RFxHSsfziZh2pE0miUFToHD/AiTtVZ
         g97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806999; x=1789411799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSTxoKREPfRs18shMJ68qZqf1s/IL7UP0jnRf+EkoNM=;
        b=qqfzxvlIvhURDI9N09oD1jLtNKx957/++iVnaJT/IAGOfG9sp98W0P9Z/g31p6ZgQq
         5OFfae1gcVMxZvip8MW/wRQL7FHTfurs16RlSlR2euP4OAjixSFJChS94FErrQvv+EUH
         g0O/7gI0zgu4bRWLg8PWcLM7cRZrCT4VAm37blZOmU4Uoxv5DKsnXpPthM6bP2qwOv3d
         4Agqe0NWT/N9Vq6fB7lQZUxdzjRPuev/3l0C7zyZMQo+I3xKH50a7HXruMdAL9zMWXUL
         BltL8SOd8Gr6Vabh1ZuX2Zlv31RWEhesnXK1jmYxbpMOXVyDGWj3WGpQPSErTx19eQdc
         bm3w==
X-Forwarded-Encrypted: i=1; AKwUvBxZbCS6p0lSgMBgsNg2ta03RyJshRgAcVWqRLp+SaHFFcYYmNrvBQe2vMZQEV+aP3qc79GbagWopf6JmOM=@vger.kernel.org
X-Gm-Message-State: AFuF++lXklc4z//VPlLS3IGTJYinap2FIJNkP66DveSSAg04ERnIxk2p
	afl34sUNBJnfpVlm5yYDIgIB1V7dZ2hG8ZK6I9niY1z+KZ5t/O2nldVVlBZ5udd2pM4uhw==
X-Gm-Gg: AYBFou1W0j/+bTL7LigyRctmJfs8agERliIIiJasExWRT5HH1VBpO+8N9SygHFI1u+X
	IA9/aPB1iGxsasW4NUZ8fKfVjUUkM2G5hkbUzBvF/3qkqi9O1OJSuMZD7UJRXZ21jiqZwzEp32S
	PcmcVAshIXyQaNldLQBKSyfrMlnzlaYPT/l+NAdzHvilWkCqVO+3vQu5RRaaTU4S504EUtTxNyW
	hkvKGVIY58lQQy9LKN7XpGPzWNGalcddPzKngufkzSdxjZROSxdrFmWABXwHQoz/iF3ALEK1M1V
	0fna0Pmyx7+scYh90y48fTtgsOmhMFvU5PFXTgU9JBzdo7wA2sx3Lm0TeXRv4OkC7j1Kdq8P8IT
	Bjr56diefuU+TEzL0Gw3ImwrtRxaILBzkV1H5YZP3falIp4YSsnCktmWadlHWfbVq+m2zDBqtAy
	1pDBKvXbuE/3iqj+ZE51/F1TskeK22Yyn/VDqaqggL01POchKHxqKLumj6Gw59lJ5zwTdxDnQwL
	BP+khlK0LdNEFxw1w1By/Z3DRdy13Tuf5BDPiVhKiUoY10FRWNlQadNq5Un5KMw9zM07qqPNkCq
	18mxb8fBtHBh6g==
X-Received: by 2002:a05:600c:a012:b0:49c:eac2:ddad with SMTP id 5b1f17b1804b1-49d01dc0137mr148601185e9.1.1788806998881;
        Mon, 07 Sep 2026 11:49:58 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm308995295e9.2.2026.09.07.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:49:58 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: stable@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org,
	pengpeng@iscas.ac.cn,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.15.y] Input: aiptek - validate raw macro indices before updating state
Date: Mon,  7 Sep 2026 20:49:56 +0200
Message-ID: <20260907184956.1567815-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengpeng Hou <pengpeng@iscas.ac.cn>

aiptek_irq() derives macro key indices directly from tablet reports and
then uses them to index macroKeyEvents[]. Report types 4 and 5 also save
the derived value in aiptek->lastMacro and later use that state to
release the previous key.

Validate the raw macro index once before it enters that state machine, so
lastMacro only ever stores an in-range macro key. Keep direct bounds
checks for report type 6, which reads the macro number from the packet
body and uses it immediately.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
Link: https://patch.msgid.link/20260329001711.88076-1-pengpeng@iscas.ac.cn
[dtor: fix macro fallback in report 5s to use -1]
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
(cherry picked from commit 95dffe32a66cbed07fbfa7afed39d56d5014e04f)
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 drivers/input/tablet/aiptek.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 1581f6ef09279..64113810e16dc 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -658,6 +658,8 @@ static void aiptek_irq(struct urb *urb)
 		pck = (data[1] & aiptek->curSetting.stylusButtonUpper) != 0 ? 1 : 0;
 
 		macro = dv && p && tip && !(data[3] & 1) ? (data[3] >> 1) : -1;
+		if (macro >= ARRAY_SIZE(macroKeyEvents))
+			macro = -1;
 		z = get_unaligned_le16(data + 4);
 
 		if (dv) {
@@ -699,7 +701,9 @@ static void aiptek_irq(struct urb *urb)
 		left = (data[1]& aiptek->curSetting.mouseButtonLeft) != 0 ? 1 : 0;
 		right = (data[1] & aiptek->curSetting.mouseButtonRight) != 0 ? 1 : 0;
 		middle = (data[1] & aiptek->curSetting.mouseButtonMiddle) != 0 ? 1 : 0;
-		macro = dv && p && left && !(data[3] & 1) ? (data[3] >> 1) : 0;
+		macro = dv && p && left && !(data[3] & 1) ? (data[3] >> 1) : -1;
+		if (macro >= ARRAY_SIZE(macroKeyEvents))
+			macro = -1;
 
 		if (dv) {
 		        /* If the selected tool changed, reset the old
@@ -737,11 +741,11 @@ static void aiptek_irq(struct urb *urb)
 	 */
 	else if (data[0] == 6) {
 		macro = get_unaligned_le16(data + 1);
-		if (macro > 0) {
+		if (macro > 0 && macro - 1 < ARRAY_SIZE(macroKeyEvents)) {
 			input_report_key(inputdev, macroKeyEvents[macro - 1],
 					 0);
 		}
-		if (macro < 25) {
+		if (macro + 1 < ARRAY_SIZE(macroKeyEvents)) {
 			input_report_key(inputdev, macroKeyEvents[macro + 1],
 					 0);
 		}
@@ -760,7 +764,8 @@ static void aiptek_irq(struct urb *urb)
 				aiptek->curSetting.toolMode;
 		}
 
-		input_report_key(inputdev, macroKeyEvents[macro], 1);
+		if (macro < ARRAY_SIZE(macroKeyEvents))
+			input_report_key(inputdev, macroKeyEvents[macro], 1);
 		input_report_abs(inputdev, ABS_MISC,
 				 1 | AIPTEK_REPORT_TOOL_UNKNOWN);
 		input_sync(inputdev);
-- 
2.43.0

