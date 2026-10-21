Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606608;
	b=PMtU1pHi7DHdgrzUkEAS+2llu/Qgj9pVVRFKFfwG7oL3J+GUo3sj7A2WhBg4VztM7PwI
	 YGSXpOj/HITJ5xd4osW2LZONwBLs32pH+hhNTT8ndgPvryp2pFnIvzYHY8prNDVrmNUXQ
	 stt5zLauJMtHELplbFoJeofhph7lqMN4UvXaBemL/dIyuFQo4fyFhJnSevaApnhEdnyfV
	 6bPhOsMzXf5wMQ9LVntJV1Zi4AsrwCT6H0gyMw6BA3qnjugKeUSTn33Ubc2fix7AYEYhl
	 iPOYjaazPfEDCcagx4C3nyZP8+oAdZzxzAE5RQv4/ES9ffzUdmqBCBJ52dJ6HV2dkrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yEhVZPhGMEYsPhUdE3zVy4aLvJE9Xbyd5jbdjX2FImA=;
	b=r5ssHMIi73Rjxkj61JityTWo0SLhrXNB9iUbpnlXjmsTiXPlbjq2oWjK0sldpTfHmcwv
	 qQO9CizML/ze7gs1e2Hw7qyjobBKVtTKm9T8CGN/w1zcAco/71ULlLnyVOXLQeH/N4v9S
	 0khnpvl1y5Br0APhYvvPOyUR8h9O5cQhgXtuIZi5BeAgy0cKPTkX2melI4ZJkhQnfd0rz
	 P/qC3gQnu2bluG964XZz2vSqlFzBxtSeNPRUSbiGAfeh3f5/oSKDe4DaDwi+44CDnxgxq
	 Vj82IAwWFBfO7EeRQo+ODwyNYZvF2yQpW0fWBZCM2ReRagoporia/66G/R24AMqZY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nK1eZqMZ;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6DE606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6DE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nK1eZqMZ
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so894419f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792606606; x=1793211406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yEhVZPhGMEYsPhUdE3zVy4aLvJE9Xbyd5jbdjX2FImA=;
        b=nK1eZqMZ7+PSQI7iCEqS+Fc64a20N+Lyojhw37axMqXg6vIJ233XhS7EedOKzdtRzu
         QHc3TsiyKpsQHMurFC91Jvuyx9MY+H/5LM6a6IPnHD+9yIlUO9e2ipkZIgArrfVqDt1e
         LgQGVpPTZmpsdimBc9AfEMN1Sd2W35rod0fmj2UtrRYv7j4k/f1+23nmMoVZg6mBYznZ
         U8QXY1I2ZbJ2cHnXcEkRErGJNJzlW6YOY6bgNQ1z6Hk1u4JLYF1kYivzVvvHO1FTdmNn
         vNEXTZ50/4iNxoLIrEB3YR2vxP8eVf92fOEBjDLeXAtXgkOhORe83A/n41607XEKi9/4
         ZlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792606606; x=1793211406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yEhVZPhGMEYsPhUdE3zVy4aLvJE9Xbyd5jbdjX2FImA=;
        b=w+J/f8hyukUnIRCPbA2j34kEdEilMaEYMP7P/oSiA6HJbFR3711HwWdntOvqyZy/Lq
         P4wCEwHjqcRTamNE94syTPhnK4nfN+U+kCUUjXpEePfHKlzUef9HHf253CrGVctx8M2T
         dgrZXHE8EvVxjAAT+rHgFP6xvQj1cI9y73lmzQtIUZLQW2RM3bXYwy+/rr3DbJ5XJe/M
         XO0a3bclmKKPSlg3d+n1hXb0Gk+biDBLqbirDaa+uERjs2RCzsAL/3ZFFAzpmbQ9nWfh
         Y5ZFuVZAasqx+6b55/7pdVkEzyGBJ9RHqfzGAu88yzHMigSzMaQTNyaRoqEmRaVtRrff
         UI3A==
X-Forwarded-Encrypted: i=1; AKwUvBxdtElp2cavcx5YPl8zAGPPGFHN/bk5hCDrzW/YfW3Rhc8jIzhXsYR2xazqyzkJFmiZ4yEHWU6VFZOw9ZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj2dGOHChQFoNJ3fy5+Cupm7X8155ulY9wI7CIJaZShRSarH+x
	y3xv+HF02C1LE9jzgJhDjxNt6Tih0clgCnCsifRsFyOhfpO8MTexA6tftwrDrCbwA4E=
X-Gm-Gg: AYBFou2q+IFRVLinTg3E6oaOxmok+CYTcH/LJu1m0VSz3J1CyXDFGYeykiKvXlbjB4/
	+EuGV3HdWr9XYcXQKPRJ87vm5gNjUbbg6M3g87izH47TwKmgChtzgN/TnQENQy/DVYZZbQkWBG8
	gzCtjVw1gvO5w/LNMKDnd+1AZr/4vVrunikdmOt9Tr7kovgsmrURPeMEk+30c4hJc0eqzAxPTCq
	BjkA5W9Da45hUjVHlWq+2P51TcKXBexIt0GbJf8em2bgCR62nhIvJqeCooTq2ZTsMYjEZx45Mwq
	Q6yDvQLHWTOF2bJLAw6E1w5PfvoAJkKte70UjQwZDpF9X+xyy7W3SCE7/kgUQ4dy+yzgd5D1EEa
	otLlvyvAHovt9EntL7z+tzxEFxJ89cGgiq5gRKLch3NlyqrGnQfyk78PbWePDyk/yJFvMnIxAy7
	YDkAJt81+sjiJkWSJEDVgrxCresFSmDf4wOjOHtGTkUNClmWZblTBlBF7FxALPrbTQAArc22fe0
	7RFWtIWFwbyg05fk3FtNVqTSokpanRj0xMTrCNj611w/TNuYen0mPuxigA5GrF/EoZzi/z9+ail
	2AOhVOX4mkSKefTJ0+eN8YZZqftbsq1gka9trIN5P21EYZHwL2asW0avdEOlFdYAnvCro2rL2TR
	qCmZzxVo329N2ba7qQXrGy4+pzcQVArCnwHAITnapi3EhUxL3Td2lEOJjpLDiipA+SEIh1Y1Vag
	HKvhZf1cLsxlAiboZqwMHSWmSrRCHJ9g==
X-Received: by 2002:a05:600c:3b1d:b0:4a1:d41b:5060 with SMTP id 5b1f17b1804b1-4a1fdb1358bmr65477465e9.22.1792606606135;
        Wed, 21 Oct 2026 11:16:46 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-fbd6-1bb0-8c10-7bd8.rev.sfr.net. [2a02:8434:fda5:4201:fbd6:1bb0:8c10:7bd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200c1cc03sm28195805e9.0.2026.10.21.11.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:16:45 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/bootconfig: Fix enabling all events in bconf2ftrace.sh
Date: Wed, 21 Oct 2026 20:16:26 +0200
Message-ID: <20261021181626.2004489-1-edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A bootconfig containing ftrace.event.enable makes bconf2ftrace.sh try to
write to events/enable/enable. The per-event loop treats the global
enable key as an event named "enable" in a group with the same name.

Since events/enable is a file, this write fails. With --apply, the script
exits before it reaches the code that enables all events. The same thing
happens with ftrace.instance.NAME.event.enable.

Skip the global enable key in the per-event loop and let the existing
global handler write to events/enable.

Fixes: 1d8365a553a7 ("tools/bootconfig: Support per-group/all event enabling option")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
This is my second submission to the Linux kernel. Feedback is welcome.

Tested with --apply in a temporary tracefs instance on my Ubuntu machine,
running kernel 7.0.0-38-generic, with recording disabled. The original
script exits with status 2 and leaves events disabled. With the fix, it
exits successfully and the instance's events/enable reads 1. Per-group
enabling works with both versions.

 tools/bootconfig/scripts/bconf2ftrace.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfig/scripts/bconf2ftrace.sh
index 850c207343..7745c97e7a 100755
--- a/tools/bootconfig/scripts/bconf2ftrace.sh
+++ b/tools/bootconfig/scripts/bconf2ftrace.sh
@@ -218,6 +218,7 @@ setup_events() { # prefix("ftrace" or "ftrace.instance.INSTANCE") [instance]
 	prefix="${1}.event"
 	if xbc_has_branch ${1}.event; then
 		for grpev in `xbc_subkeys ${1}.event 2`; do
+			[ "$grpev" = "enable" ] && continue
 			setup_event $prefix ${grpev%.*} ${grpev#*.} $2
 		done
 	fi

base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
-- 
2.53.0

