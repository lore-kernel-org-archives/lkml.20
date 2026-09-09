Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C551D50E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949759; cv=pass; b=oUUD3Vixt3+Vm4jmqWh8qIvUBR8kEzMFDY8WWgh6aq3VHzhMKz/opWWb+aFeiGTRl3w0bNRhWVvUj2GbuoY0LFnjy5vBLmD+HmZ/phzwqvsOkcDU12+qCoBcnG0xUBHZZ5yFbLzurpWyO4cRsiBRuroxxS6M/Cl+O7ZYm2ASPT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949759; c=relaxed/simple;
	bh=J47IYNdod02F1g3+6k0lLJqlTKfvKgWjoiv7iAB14FM=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlfbTMPhVOpcY9oSx6f9+eMyzLTApLmth5mGcvuqaUlin66YOkEXrkjtOFvW/PVEJwndf/jhvsyEc2KBVqcEJhrtuYcr3Lj+707rn9vvTDKdMisQkIPJANrfj8iSPx5MgbbrUSESLLyNuodvzghdP7F4ZDMhdnwVaL6MepHXssY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITjnVSwy; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITjnVSwy"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0d31035so871211e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788949755; cv=none;
        d=google.com; s=arc-20260327;
        b=O0jjB08wMbelWeMBi2/BLStFsx8Q8egsq7KsOxCX1FhkUlbc05RkzGj5Lx7cBE8PmG
         7upk+78wSswPE/harjnrS4z/b2EpWp3fPJO9TMa/YPSAPkm5O4iqZfHHTS86aPZuERT9
         YWb9NPmAr67S1KFFdBxVHZEU5PuQaZtRw2rr8KKE+fl/JxazQWpI++7yqAGRV6ZVkz8o
         GOO7rYCmNos8N9jbKBGa9Er/LXYzLm37E6SI8PEXNo1FV99FHcILgzRxhX/NSmAibNZx
         SCQxKupAbajW0m9sciF+sP7qrWQEupx90XWvJjTqeBl72c1VqnOXQ2Ziv9DNtz7UNTLg
         hqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=iQJPNUSAFJ7E51M7cx5Rfc6me1C9+bNgv9Pw72X8t8U=;
        fh=hkjzRmY2Xbh4oEgW/jM/oNHEmx8xyY0+bIWUA2eYVQc=;
        b=QU0H6wLO9UNfc6t6g0EL9Q2MYgYdZj3jsPNFXXknUVnH/IsJwc9Jtoil8JFNztEXis
         +2PMUHpNEvNa/TOhy9Av5cKhhtB+DRCa6CHmlRNsasRFyKWjCtyQP6LK90lFSnB0Vn5C
         ncwkgY7gWa2uxDRbCnd6OKYRueA279XHxXgESsXuTiCml68iUhFjcU06ydF0d9GwLD4S
         RGPhqFvV380Vmv1+SQQDbLT3LLlgcg6CRm+00C3oALhpASEG59vVhXFNa/9FgWreHEjV
         FtdsDtvbhtzbliDw9RmwYVukJqpp2unk/rYFy4vC1RiEYiGFhGQvIe0EmYkQ0KZYMXnA
         +8zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788949755; x=1789554555; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iQJPNUSAFJ7E51M7cx5Rfc6me1C9+bNgv9Pw72X8t8U=;
        b=ITjnVSwyLX+koaMbfacdPUYeMT86TVB6KnRaAnuXc9LxcstfdcY7zF5pELZAx8Pq1y
         wCSt0nnLEp/PJeeGZBGHfXY9+7VjpSlqRxvQ3RgeLjQP+LK7ifwDS3gq6xbtwEbUvOga
         TsAQWzWu2b2QjJvlm4D8nMZ6CvsRqdNGJ7DZ5dBpN43O611gcjTtPWOeTTColbM5QmfA
         UJJ5PMffpFW9GyEFx+CZmmw903cGxNFJun0Spgtn/k4sSxEofcYtmLT9Thbs9gLgEBvg
         LHUoTpGB734C1QQXfXPmAPL2ygKiZ+lYErDixiBGdbgwudT7alnBhlqtoxv+GsB7oI1f
         EMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949755; x=1789554555;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQJPNUSAFJ7E51M7cx5Rfc6me1C9+bNgv9Pw72X8t8U=;
        b=aEDThko4gEU2wnKgHtdVkfSIQWDQk6V6SY5610OWPvN6zhhLz4xBGskjtpIXKg/j/J
         arhSq+k1HwhZLyo7kG25hB0ClLRsDfJ3NpIvtfrn3Ovgupw0rGt/IYIDu/nAVblIxadb
         8/ilX28uv9VZ1FbXPC7i00aN8ATWkutqUrb/Gmw8PwzKuqz3GtBgZB7AXKvkPGe9eTWC
         mO02BymwKS2tuUn7c5RFBCWTjU0GIDd3XXkcRxcK0QJMCUWCk/qCUs4JoI0G0hnJLbt7
         lc7n13V9FWVF5kfv/IgULziQprrEjJm+jHTPFf7SEtT6yLLI3xVqEwkoaBTs5fgvBnZX
         Rrqg==
X-Forwarded-Encrypted: i=1; AKwUvBznDSOOKGXO57fao9xqnFX3OuNqsICQ4vj6tMoDSnWLuaDzuoxjwl9h9NfIwfEpjqttgHspXD8vJv86GJs=@vger.kernel.org
X-Gm-Message-State: AFuF++kkEisKdwegZU3KUvpEbUr0E+CrZN4in0Nfu59UR1sGvQDHNyU/
	ZBb2FsSBugx7XehbL4r9XqiXVlcxM+GXUezT76q1uPn51J1rq+PMJhnJetj5gtZIHBf75DUpoga
	jONDDl8a5MdSntxumsgzMlCyxughOgkk=
X-Gm-Gg: AYBFou1ZeWKJWEL6MEkSFWaXsnFg19ZaIiK1ZfmvJ9n2enJ2qdtjEO+3LAqM6yJXqVx
	Vw2dvBfsnvnYBkjAmGiy5LU37oV5nxwbiojP0kIEPA9dvtdMQqXiMUV5LN83ERYhoOA0sAZVg/O
	Hh8lDB0QMFud9OK3iUE5ZPWitwJUJ+CUyConFKFBDEQp1iuB50UopZbMDdczvhb8rpliHPaUgeb
	V8RxLqiMQrolNzNiyfttEYigM/jG+W8USpmYjzOzyP7vASI0IikHYA+M2Oc79IRxCq9HMUzdG+w
	ml6T1cgzHoqv5kqyvfjSV9GJgYWPpd0xQdPcDvS3UNhC7TwZfsK8PYiF0ZeQuhoMTP4wPjHnCjj
	Eb3Hwpmn1JYtfylDZQ/8er+jb/4qI8mA5o3+1TflQN5qKzYjr1rY=
X-Received: by 2002:a05:6512:33d3:b0:5b1:5b49:9463 with SMTP id
 2adb3069b0e04-5b61705a661mr5719374e87.4.1788949755153; Wed, 09 Sep 2026
 03:29:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 05:29:12 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 05:29:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CABKbRoKwKz+01bBMU_tq55aUQd5ao613v5n=M4zRjcc+j6=HkA@mail.gmail.com>
References: <20260907185001.1567957-1-miguelgarciaroman8@gmail.com>
 <2026090833-mutt-whiny-242e@gregkh> <CABKbRoKwKz+01bBMU_tq55aUQd5ao613v5n=M4zRjcc+j6=HkA@mail.gmail.com>
From: =?UTF-8?B?TWlndWVsIEdhcmPDrWEgUm9tw6Fu?= <miguelgarciaroman8@gmail.com>
Date: Wed, 9 Sep 2026 05:29:12 -0500
X-Gm-Features: AcwNN1U3c5d0ZRbND99B9WQAjVzD5VEcqFI4ZUv6legwqveMel1HfygidncW3Qs
Message-ID: <CABKbRo+qUMG8=+-MnY34KkscgZdPASieN7CgWce9BTCggNSvcg@mail.gmail.com>
Subject: [PATCH 6.12.y] Input: aiptek - validate raw macro indices before
 updating state
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com, 
	pengpeng@iscas.ac.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Pengpeng Hou <pengpeng@iscas.ac.cn>

commit 95dffe32a66cbed07fbfa7afed39d56d5014e04f upstream.

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
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
 drivers/input/tablet/aiptek.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 2b3fbb0455d5c..9e78105bace77 100644
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
