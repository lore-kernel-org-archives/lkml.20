Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D53F1056
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584801; cv=none; b=qelE4l2KrGP2eqgZpkYZh3QjHQJVvIVeYdvV/Gymr2Bjme9LadJGs4+yUc8drj1l0O/4r48/qkxJnrlUbbfpj18EwA+2PueIR/zJrG5kogZnc9ZxVg9tE6dcq5LOCfvNe++GT7YDDYZ7dqkIFJtCHCSXSPZBx3iLMstrVdIxUG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584801; c=relaxed/simple;
	bh=To/N6sKAD/JUTbP1/yzbIz3c5H7WcyV26UjvmgEl9WI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uT1zuM0RRhGMcXY0Ioi1TzSStG83+2Lixx28++89GhIPGxRFcrCf1/xjGWsGKoRgce3gSAQlyriqyzvAytZbhIfVRoQbnEM77GukTrz+3kJYraFPwTwK/2zNNststiSjpD30tNWHA8jsZogZBXb5ManiNxesOTRx1s487XInguE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F3FJbA61; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F3FJbA61"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e60f9af6e6so1655235ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791584799; x=1792189599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvdzzoNUmS3cRm++6obW+ZK5PMthoIQu11Q/B6OTMpM=;
        b=F3FJbA611llD7M5Fym+v/csGgtk7YlyMS/perdq81TDF9QXpxd9JiENLHDCgy9rpSK
         wUObdWpray+nzTtfVS3ryzlusHagFRnIQuc7I+KLyLdZMpu3JC1OV9blRo/CSmpyF1di
         gV1d2mhI7rlto7/ZYhCkw+JYU/wQBcBB3hnXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584799; x=1792189599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvdzzoNUmS3cRm++6obW+ZK5PMthoIQu11Q/B6OTMpM=;
        b=RZBqA9JJaQ1jCYx5oJztBE3l2nvSQCpvPzm+OwZ5fqOkRb0dKqUTR7ziFvxal25hsG
         xvNpUqpmbx5RumEBtjBx+rQOysFHObJTbbyw1g2/M4eDQX1eYuClhHLwcAssiEPmHXPy
         C7tr7ycC0CX85Odg2aQqulzBlU40LFzKpYsHzM5tKXpNzg4JJjj5tHkB2aYaT0/i6voG
         I7teQ7so0scDETaYZxVDIK9+i8AbaB8OSsyh9oahpuLhm6UsTxWvoV8U8AD0GbKh/wPc
         K7uuMMTZKnZPCO3bZfRwgMz9mlbAyhouvqAKeZ2HUAn1XWMDTNU/S2qgxHqCvm9QdiA2
         9rBg==
X-Forwarded-Encrypted: i=1; AKwUvBzIZW1/kgUQo1g+hiWpg7dboZx9Yg5Cb/lLhTMT2F8DgX/rhpsYSJkX/7Uieea5SHHtfk11peY9C3p1EBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX0/EBg4KVN6e6kKbkdaNr9pZa13sG90DsMjFT5oduE/NkCBaW
	ORCHSQucxVJQkGeyanFOiP+EOMfh9b42KVJahp/w6GVwcfAiHl0WhuxPlXuF6G2PVQ==
X-Gm-Gg: AYBFou3/unV8UFwe/cuRAOO634kdX7/9tAM2wRLOKxSm8Hhad0WnnePwwMIVvk4BNRk
	IKVVEad8E8sbE0VkfQZwfdQjk1YZhWpuicGIkKqWlAHRYkW5ZljIkA4s4ruhzOu/SFGZBniKtk0
	3s3Xmn474ejcDXJlabZFj2Pd+NbHiBQ8J20LwDgs1luRJCCG3s9paAtuJNxlM3CnZ4u3e2IGK+d
	XkJNjKgHTE10bUh7zcvX/s081orgSOk/3/ewD8ZGoKDOp1mT9dEouSaqMZG4WTmdAt9bx+zEuI1
	+C0oa5XGqq45o+8P/rMaY/Z5fHEWerdaDuOavj6G+aUBaVRG9HBiOGr7SYvVFv9I8Qn57g4HyNG
	xIb7ccehq9/Hxf+MBLsWp4GUAvslCZtymx7pOjLBzgdmh5+FUQclyqGptaiiAnmjES8xnGbN1/b
	vUgXSjRtrZAoDmmVpTh598JCG0ErLJvcKxp3mKG79qTLs0dmN8gJlYrz9YRBa9Y5xyioA9X5lbW
	QWjyrXi/O5FbOSIwMu8ydWviQYRWc0ZGsRhedNDdWWEMpsdxLV4zuYuPHRz8zfbHLSmNXS+FdHP
X-Received: by 2002:a17:902:c943:b0:2dd:c100:3133 with SMTP id d9443c01a7336-2e842f30fa7mr27271395ad.47.1791584799011;
        Fri, 09 Oct 2026 15:26:39 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (35.152.82.34.bc.googleusercontent.com. [34.82.152.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e503sm16660725ad.17.2026.10.09.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 15:26:38 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 09 Oct 2026 22:25:26 +0000
Subject: [PATCH v5 01/11] Documentation: Correction in HID output_report
 callback description.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-send-upstream-v5-1-384af01da3ee@chromium.org>
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
In-Reply-To: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791584797; l=1256;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=aFkj0W7tNOjBci2pknGWJKhsT02OsUboxe/LcEHUTNI=;
 b=IbSutf0zd2qYpnyGDgn4KNESCycWkwDCX7TOGkSC6MXTFypJDD9VDtz+YmrNGl729DbFEHvvo
 LcNPMDv4SPaA4aOAuHecBFRmpXSqIJ+au1itt9MXiiW/Nq5XKf3Fj5g
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

Originally output_report callback was described as must-be asynchronous,
but that is not the case in some implementations, namely i2c-hid.
Correct the documentation to say that it may be asynchronous.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Dale Whinham <daleyo@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 Documentation/hid/hid-transport.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hid/hid-transport.rst b/Documentation/hid/hid-transport.rst
index 6f1692da296c..2008cf432af1 100644
--- a/Documentation/hid/hid-transport.rst
+++ b/Documentation/hid/hid-transport.rst
@@ -327,8 +327,8 @@ The available HID callbacks are:
 
    Send raw output report via intr channel. Used by some HID device drivers
    which require high throughput for outgoing requests on the intr channel. This
-   must not cause SET_REPORT calls! This must be implemented as asynchronous
-   output report on the intr channel!
+   must not cause SET_REPORT calls! This call might be asynchronous, so the
+   caller should not expect an immediate response!
 
    ::
 

-- 
2.56.0.385.gd3acb90ef8-goog

