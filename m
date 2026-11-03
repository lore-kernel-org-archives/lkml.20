Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746771;
	b=1gH2EZg/Ftmyogumc98QZ4PYIuwg8eOpvLCDYq7TMxVIswAbklAMuqz2GWsSrQv0SQ60
	 cI7FoFguCH1jj7HVmXq7FEVF6ut2KJSndqqwOSg7pWs6SvgHfsKLU/5ieqoQOsjVw+Om7
	 pP7Zj8jnOAiWBtaKJpU0zC6Y+wKmijqqqUuzdSAV5aN959FVPBF+ApJ2uoiazc6IYrg/I
	 9bxvW9PNzMkkngNjj7MnPfTIknMbACeQdeITXHo1cluUzTXBFYRgeInctd0rpm6kHfz8k
	 484dP1/z/9SfcIwd4sKpZ/n/9FTAZdfUO0aH2dBXk7Tb0rvI400+aE5zhDibPz8jyWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NpSqWnf1WT+kM3nlRcG6tO5fjhwFoYLjYPpGUhC0vJ0=;
	b=ENFuirX4hWAW3CpF0ry0fvVOBZOSkGH1giqO5sHnnfP2YP/NL+4z7A988bOBrbAa8A/o
	 wS3yO1zZJ0iL0g7IX0xUMaMB9JZ1QpGHWAaDIGRyj+7AC6WSqy+BaarOrTPG8OO4AqL2D
	 aV/ok2EJZfQitfiffpiX7anO2VvBbxevOtP3NSi/ygB4LOnjR8YF+B162hev2Ex/0v2Sf
	 VtLG5MPcOXx6T1o9hpFXHCqvjtjh4sVzBt4I7YFLHsDSv2PzKXWsDw+SWy2+GrNyrAx4c
	 Gej8uqlJv/DAU0jVMknMoRiSqdBOKM8mhpuzcg989OxVvawn2cufpb1FDcuuISNluQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ph1gOnlD;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94503606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94503606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ph1gOnlD
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3282db206d3so111378eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746770; x=1794351570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpSqWnf1WT+kM3nlRcG6tO5fjhwFoYLjYPpGUhC0vJ0=;
        b=ph1gOnlDegiQiQZRWoj/mRXGskH1KJ/1GwEFCydAYlJNBEDdOZmsPy/KV3B9iOCKXt
         JcR7EQbXfeiWFLJVvnFPJ+JLdvuO7VM7nUxuM1TypqCmArX7cwj4FiOr3r3F6GuMJuAL
         s3x0Ugmoy2+l3b7D/8Mwxb/xriXtOCy4gX7PmtAwPWA15A2OfmOpo+SW+38h/bY+/Wg3
         yD62t78MjcL7eepEFnkn1ckKFChcmlPcFQEcCrbmhFXf3eyqCSG+9HNt6d9JKYHkCtaD
         2g9HVpByQ+UZiHAqQEpDKR1oPgYmLrTKNMfHcA/T6nu3msg1tdt0fLeWdrlfnY8qeFJw
         oVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746770; x=1794351570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpSqWnf1WT+kM3nlRcG6tO5fjhwFoYLjYPpGUhC0vJ0=;
        b=vRmJ8ul+MkokKIKucLhMtb5sJUhfRcO4W4ccg4/6+41YTxmBeqsh5XIRwGnLYeO2H0
         1t02aC8SwLqmHSskVwNX1TVCV7Ir7kWTFhVYOBbdxXOEvUjRTp8JMluPJNXLG8dN6IAG
         aBrX32npZ/MRXDBUdRjCJpyBoeNKRb49fVbTykimK3b14M/a3mFqmtOC3h0QhfLiTgfO
         u13rQxLpMqIYtBA87kKgYaro49c4/kcgiXNwU5s5APF6scMaQhYVvuog4zniAjkilmTz
         fcKzEGqP+6NeYAaFvkuC0aF8mu1vAQw59RFGRdQ//f4E5yJ7gKvcbA6cs5+MF3TLxq7y
         xXag==
X-Forwarded-Encrypted: i=1; AKwUvBxJBVw3ZPivzhmyA5rNqMczDEe7enTublKP2pt4dtP5l+MjwXoYiSnOJV86XSosuyrJqzF+qzcRxz10wX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2N8xkqGu7FgXTljGcmw0p0i9URlA5BaoEp5d63yFBX2AllUYf
	KeptuOLaI21fAb+TULPkE4WHgzwOg6BA3qanWISvsDadnMGX0+Jka6So
X-Gm-Gg: AYBFou1Khudv19lfTWWeOmL3pvH9mFhMqX5sngBpCeI6MKaPreocTVjhPzvXnN65ZUg
	VNiEWhws+BcotYqM2MKvFHI2Nj+LjpIm7xq4hXwvYMDumcUVeR0T0eX1OIitAxpuhxIkOM0u/sO
	uUlViFKFNuff4Ekw96PeDnMiXEKs2J4FsqpcTYIY5uAO6rf+vjzzsvNiXBmyegOCM/K01ZdHgf3
	XbmDXZJFUB/VRti7evT9OrV4PQlfdco+tkKmqEDAQQIRY6Kb685rUF+h2SEMAGxlq6oWTMtaKXB
	OSrbzOPPGCdiY+gdARvitfASAppx9tpXLAQfn9hpKkHAS3RJ5GXfd8FgazgA/1I+YADq0EXVknz
	WjX2+GhjX+0UwSHTDdSp9n4FrNlnLOHCYQaEx3trEaonxvqYB9qWbzKbpx5rU0WvNgMdmoU90zk
	23CrdUC6vYEl02RKQOJMIKchZLWzLmlchPtfKJFUx/P7R+kogY0g4GuBA0wJPuY76SfHkAnoCEB
	Cx1BeYCHo4T9b0mZ5i5j2z+bzodqE1Rlt1oSNJ95oJE5spcg/KWbjdCVj0d3FWxV3QCch77PC0R
	tL/c4GROOVElTLOWpG8WUY89W1SwXhBiPk559B1Z8iMtrWIp5qKChz9gNGvn5C1tdWmjK2XDF7W
	34+bZbKqVZIfatsPLKw==
X-Received: by 2002:a05:7301:490c:b0:36a:1819:4d0c with SMTP id 5a478bee46e88-36a42438ebamr22641043eec.41.1793746769329;
        Tue, 03 Nov 2026 14:59:29 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm1187111eec.8.2026.11.03.14.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:59:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: stmfts - do not abort event parsing on non-touch events
Date: Tue,  3 Nov 2026 14:58:41 -0800
Message-ID: <20261103225923.3892612-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103225923.3892612-1-dmitry.torokhov@gmail.com>
References: <20261103225923.3892612-1-dmitry.torokhov@gmail.com>
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

When processing hardware interrupts, stmfts_read_events() reads a batch
of up to 32 events from the controller FIFO into the buffer. Only
STMFTS_EV_NO_EVENT (0x00) marks the end of valid events in this buffer.

Currently, both stmfts_parse_events() and stmfts5_parse_events() abort
the event parsing loop early upon encountering non-touch events such as
controller-ready, status, user-report, or debug events. This causes any
subsequent touch events that were already read from the FIFO in the same
batch to be discarded.

Update both event parsing loops so only STMFTS_EV_NO_EVENT terminates
processing, while non-touch events complete cmd_done when applicable and
continue processing the remaining entries in the FIFO buffer.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/stmfts.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 727dc8041518..3613c7f2ab15 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -391,15 +391,17 @@ static void stmfts_parse_events(struct stmfts_data *sdata)
 		u8 *event = &sdata->data[i * STMFTS_EVENT_SIZE];
 
 		switch (event[0]) {
+		case STMFTS_EV_NO_EVENT:
+			return;
+
 		case STMFTS_EV_CONTROLLER_READY:
 		case STMFTS_EV_SLEEP_OUT_CONTROLLER_READY:
 		case STMFTS_EV_STATUS:
 			complete(&sdata->cmd_done);
 			fallthrough;
 
-		case STMFTS_EV_NO_EVENT:
 		case STMFTS_EV_DEBUG:
-			return;
+			continue;
 		}
 
 		switch (event[0] & STMFTS_MASK_EVENT_ID) {
@@ -442,19 +444,19 @@ static void stmfts5_parse_events(struct stmfts_data *sdata)
 		u8 *event = &sdata->data[i * STMFTS_EVENT_SIZE];
 
 		switch (event[0]) {
-		case STMFTS5_EV_CONTROLLER_READY:
-			complete(&sdata->cmd_done);
-			fallthrough;
-
 		case STMFTS_EV_NO_EVENT:
 			goto sync;
+
+		case STMFTS5_EV_CONTROLLER_READY:
+			complete(&sdata->cmd_done);
+			continue;
 		}
 
 		switch (event[0] & STMFTS5_MASK_EVENT_ID) {
 		case STMFTS5_EV_STATUS_UPDATE:
 		case STMFTS5_EV_USER_REPORT:
 		case STMFTS5_EV_DEBUG:
-			goto sync;
+			continue;
 
 		case STMFTS5_EV_MULTI_TOUCH_ENTER:
 		case STMFTS5_EV_MULTI_TOUCH_MOTION:
-- 
2.56.0.385.gac671c819a-goog

