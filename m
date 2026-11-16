Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836811;
	b=de/Q7nJC+C4IvJugLrdJHkZCDwZUAXn219XTNX8sroY9mRbU+9/8mCsQZ1b721ge4vq2
	 /+kYh2p6hyYX0+Lqga59SUAByBDqZIs0NA52ZyXEF80JHI/rnmipJjRSsW2lo2y9IEDsz
	 TD4k2rsdiJYgkwP9DgkkeTlqPBzwHV/Rx60w5tUxCaNd3lSBx0Ad50kYESL11QeyuPvgw
	 g/AEafjIlYx1bXz48CAshVA5EwOJo4yJ01A0OBr6PDW+pKU/hqlgvD57v3OGg6b2p93LK
	 ZQKfUkWqaRTGbsFCZ7fgLxYKVScMmTeG8BEomvboiCbcRjQ0+T+3u17vQO/ILyNfhpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=42LazHaklgZGJp9r+8SF35RVYI+ajpaCsB0EAr48X/k=;
	b=jmMlQ6p+/NP7+Dnn3dBrYTa84g+YHkJFPhF/ob0OkC8a7BhW8c63pubDdO9DAEh2I1KI
	 Zc7I9MLtuldAIcDkQEIgcIESFXnYm9wTVPGG+YhmJGVWKPJuaWIF+MQfZDgpkTOacv2fc
	 oUADdVCbV3bxilw69kedqSpnYMDh2syPcZOyI8vT+F+GmfR7AVDlvRj00Ewct+dv0QljU
	 u8onfvF/wWSGn4enJswhv/q0m3HhB/8/3T199MaTMKHyholOF0B2u/xAEnhhqE1Iwtvft
	 6cRF2EjT07sLxgkSTLTEkbIxpE44+4MOrIkWihwXQ3f0Qo+gUgu7zlXnSgWnGSlP2fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kenhou.net;
	spf=none smtp.mailfrom=kenhou.net;
	dkim=pass header.d=kenhou-net.20260707.gappssmtp.com header.i=@kenhou-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KisUGxHM;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D12B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenhou.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kenhou.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kenhou-net.20260707.gappssmtp.com header.i=@kenhou-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KisUGxHM
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so382324eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kenhou-net.20260707.gappssmtp.com; s=20260707; t=1794836810; x=1795441610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42LazHaklgZGJp9r+8SF35RVYI+ajpaCsB0EAr48X/k=;
        b=KisUGxHMK4N3wlyXEORKweunyutGMshOpAydfkYTDZzWwOxe5xjZrHpP0weLCJA6b3
         +awI9P+9Rjm7/Y71OtId0PtpqQr9sinUGD3zRLfHIPSFP6Z62wQFzKoRbKrQeu+cpAen
         DiIg4LtuIaTAghTr0xR8Ucjzc5Hu7n0Jg3d+CTB5ha0mimbbZ1Nuq8mikzgEXijiMZca
         EfweJZDEsn9Eu1iti//WaascW9bw9byad/S4vsfot0u45TETfBWki58sT+9a0nQwrjJG
         M1hG++ERoN9Z2OCYvXttvlpJQPVRHKQmP4G1+/uBXIQZVGjTXe0nUoNciUMSagmtHGwC
         EOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836810; x=1795441610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=42LazHaklgZGJp9r+8SF35RVYI+ajpaCsB0EAr48X/k=;
        b=RU/6g5MAjUqBReKbnwz3wa0OOQlZx5O8pRWMysVyEziUnYz9LidqXEQuMLvpyOIMQp
         O3Y4eU90FifxTtsYyBfWJdrQIa1FuwWr4/qD29fCoaaXuC6gBll8scj2te+VfrGF8jU+
         krfVnxAJJghK2F9Rv2zSCf8beMfZPGJ+6zB0dGNG6Rj3T8n9aNf5NZKTDpd5Uswrj/f0
         Gw7vkjtuP3D5v7etKry0K4aSaVoK0s3Kds1o6/0uE1iCp2zGo/gu2foI/9Remtf7zZa0
         jAsYIL+T4jBlmW1PCBWxfkCZ7baCVz0RQZZASQUk3FRHWnQ/1NChFR+H8hy2zMC7o2dD
         M5fQ==
X-Forwarded-Encrypted: i=1; AL+hErG/ZLhGGPSz+HS7G/xaMhvkxprhA+cY+NF5DdiAutFtI43NUd39+2+i+/BgVXSZFunfn1X9pbnjJ8687BU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gl0+VHO3n0zTiRXB73V8ROgy+kP26R1XyltjG94F92dIeiPp+
	HhwtUHAoUm44k0eEuhXUlRg1lcVSK8ULBQgX9czOzDuogFR4FXVFcVWohT2GQrmMjug=
X-Gm-Gg: AZFdTZetpurnEIUMI8BSzU/LcOZySuQlqX+TICvuaNLeqiqF//Tu1lXOSYnt97neHEn
	SI+01QnZl0pTS+8bjBXZsDoYhXB/vEDkf+QBR6JqJzbBvoIwLTo7Xo1s545F05JDe74qHIo7/C/
	tG3CTRtTZzy6mNr009Ne//G7tlQcE4Kmk317GvGBv50xoN4HjS4zhiEkJoV3th9m2leAR9txEw5
	lK/+U5AVlN4nTYJNrA6Z+3aA38RhXDJis7pMMUWlqXBO0nrAJuGv7fmlbkk9XRSXdoxx7WsjmgC
	hhLoBeyngbIwx9iGQs7hS2wrS65fUAzAQAOwtcqkevBGfTVlpizF+lG1CA8KgHvgC8LCGDQeKFP
	snVM8yUlFmlVRIJ1SGm8jJqjHWw/jc0w/zN2OrUmEZE6vr6+myNU4zLYHiB2PwiPbd9Kbak2w5S
	VL7NIzQwgCk9OPa5T87Q9m45WFT7JvHOsSO81ORHgORLwWdiBu3WRUzeFFvg06PM61+Grg5zpr8
	TLxSdfbKiBwkDjX0fdI8/1gOnrHiUdN6O6I2qKc6gVaOTWvmqDeqzTUZZBEpfWCR4E018NvFKSw
	iKGmHHwH7Qbt/1EZ8bcbCFZWKnsB/jD92cwZf1/yYJhbUwgBlom0fgxvsC3SNnleKVjP8Ka9rQS
	qCg==
X-Received: by 2002:a05:693c:881a:20b0:36e:66d8:1424 with SMTP id 5a478bee46e88-3796047ff23mr15531117eec.0.1794836810089;
        Mon, 16 Nov 2026 05:46:50 -0800 (PST)
Received: from kenhou-claw.tailf09bb7.ts.net ([2400:4051:e0c3:e700:d08c:ceab:2318:7238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm35595777eec.2.2026.11.16.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:46:49 -0800 (PST)
From: Kenhou Iijima <kenhou@kenhou.net>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Denis Benato <denis.benato@linux.dev>,
	Zhouwang Huang <honjow311@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kenhou Iijima <kenhou@kenhou.net>
Subject: [PATCH v3] HID: hid-msi: Ignore unexpected 0x06 ACKs outside WRITE_PROFILE_DATA
Date: Mon, 16 Nov 2026 22:46:33 +0900
Message-ID: <20261116134633.5498-1-kenhou@kenhou.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114125059.17772-1-kenhou@kenhou.net>
References: <20261114125059.17772-1-kenhou@kenhou.net>
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

On the MSI Claw handhelds (e.g. 0db0:1901), some timeout-0 commands
answer with more than one generic 0x06 ACK: SYNC_TO_ROM (0x22) sends an
immediate ACK plus a flash commit ACK about 560 ms later, and
SWITCH_MODE (0x24) can answer with a second ACK about 15 ms after the
command (~8 ms after the first ACK). The first ACK is consumed by the
orphan_ack_pending path; the delayed ones fall through to the rest of
the CLAW_COMMAND_TYPE_ACK handler.

That handler only ignores an ACK when waiting_cmd is
CLAW_COMMAND_TYPE_NONE. If a delayed 0x06 arrives while a read command
is in flight, e.g. READ_GAMEPAD_MODE after an RGB update sequence, the
ACK completes send_cmd_complete early without invoking the read response
handler: the caller returns stale cached data and the real 0x27 reply
arriving moments later is discarded. Reproduced on firmware 2.30: a
READ_GAMEPAD_MODE that normally takes about 6 ms completed in 1.56 ms
and returned the cached gamepad mode. The same fall-through also makes
every expected second ACK print a "Got unexpected ACK from MCU"
dev_warn during normal operation.

Only WRITE_PROFILE_DATA (0x21) waits for a generic 0x06 ACK; reads wait
for their own ACK command types. Complete send_cmd_complete on an ACK
only while WRITE_PROFILE_DATA is pending, and downgrade the rest to a
dev_dbg including the command being waited on so they can still be
traced when needed.

Fixes: a9517958e828 ("HID: hid-msi: Add MSI Claw configuration driver")
Signed-off-by: Kenhou Iijima <kenhou@kenhou.net>
---
Changes in v3:
- Apologies for the noise in v1/v2: the "MCU re-sends the 0x06 ACK
  every ~2 s" claim was my own misdiagnosis. A local userspace LED
  daemon on my test machine had a bug that kept re-writing the LED
  sysfs every ~2 s, and each write's trailing SYNC_TO_ROM produced its
  normal ~560 ms flash-commit ACK. Timestamped captures of the config
  interface on firmware 2.30 with local userspace helpers stopped
  confirm the firmware only ever sends the two ACKs described above.
  Drop orphan_ack_work, claw_orphan_ack_drain(), the
  disable_work_sync()/enable_work() pairing and the .reset_resume hook
  accordingly: there is nothing left to drain.
- Keep the core fix: complete send_cmd_complete on a generic 0x06 ACK
  only while WRITE_PROFILE_DATA is pending, and demote the
  ignored-ACK log to dev_dbg with the command being waited on.

- Link to v2: https://lore.kernel.org/linux-input/20261114125059.17772-1-kenhou@kenhou.net/
- Link to v1: https://lore.kernel.org/linux-input/20261114101045.21986-1-kenhou@kenhou.net/
 drivers/hid/hid-msi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-msi.c b/drivers/hid/hid-msi.c
index 23d731f700..0c30846ac8 100644
--- a/drivers/hid/hid-msi.c
+++ b/drivers/hid/hid-msi.c
@@ -531,8 +531,20 @@ static int claw_raw_event(struct claw_drvdata *drvdata, struct hid_report *repor
 			break;
 		}
 
-		if (drvdata->waiting_cmd == CLAW_COMMAND_TYPE_NONE) {
-			dev_warn(&drvdata->hdev->dev, "Got unexpected ACK from MCU, ignoring\n");
+		if (drvdata->waiting_cmd != CLAW_COMMAND_TYPE_WRITE_PROFILE_DATA) {
+			/*
+			 * Only WRITE_PROFILE_DATA waits for a generic 0x06 ACK;
+			 * reads wait for their own ACK command type. SYNC_TO_ROM
+			 * answers twice (an immediate ACK and a flash commit ACK
+			 * ~560 ms later) and SWITCH_MODE can answer with a second
+			 * delayed ACK as well; the first is consumed above, so any
+			 * 0x06 arriving here is a leftover of an already finished
+			 * command. Ignore it instead of completing the pending
+			 * read early.
+			 */
+			dev_dbg(&drvdata->hdev->dev,
+				"Got unexpected ACK from MCU, ignoring (waiting CMD: %x)\n",
+				drvdata->waiting_cmd);
 			break;
 		}
 
-- 
2.56.0

