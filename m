Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503EF34DCE4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788223327; cv=none; b=AuKTXDlgKeW2lD2ze5P99JRRppuqTm/oh0xyGYutTmDZbfUFWmyn85dSIDYDMg44XIsOcVmqBQv3qXHxw/Ha6YDsyE9AJh0HIs7AlZjxghrtFkM7OevTuXggkknGpuIM4L2yFPA/WT4pcsEZk1aj+jSl4xoo/j3MMolkrYSP55Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788223327; c=relaxed/simple;
	bh=ZKbSy1xDYTK6vocDIneccWWiWBDPOnMJ7+OXIijoyIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uiYT0KFgj9/lA/U/vZ8Gpjj/FRvpiKeD8UixgPQQj/wwzBt4DkaQC2SI7gB7/uKcIAIA8+fXCM332ArJWPXBLzplklqNae3vbzj7ogCWyCB2lJaon2nXX4i37R13K9OfIaUHSrtl8CR7xX+lze7hFBtm39LFV3sm9LZf8354QcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/0D7Kb4; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/0D7Kb4"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so310154a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788223326; x=1788828126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=159jM8FdlRZa2YNqhQFQiSJW3XN5LbGD3WFOQLqy3r0=;
        b=i/0D7Kb47SEmqoTKdSrYYv+E1h82QhOXqafUmt9GjysOK1Lcw8OGEw9I4yX8O6yIDO
         R2fS/iVcjqfrZtLXfe7VSk/c1gIHmpbozqsnkspaPNA0DiyKAEBYC94sN2RSQ703eaJH
         Kl7BOHIe8xo4f0MVINHo9We3N7perPjN8ryPnI7HDNrsNodaIrGK1r9nrR1/ZGOhHi5E
         W+m+z6YLtWI6XucJDZiO7DJqnaBWBiPmbwG6PRB65h1UdiuTUm2xOo4gyX37jbfCZl5Q
         ctz+EUfCcXH+bsI86aXA2HyVis4otZZAaKsCpqychaJRCPg3/VXS1JxFGvBN77fMpao6
         u1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788223326; x=1788828126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=159jM8FdlRZa2YNqhQFQiSJW3XN5LbGD3WFOQLqy3r0=;
        b=cLrmL5ugrBbcXSDsWfRpwju9zC3GWdltdLHjRUK6ORIBbuoIMIpu+d6c09qoQ8J3gJ
         /EBwnXN3K9vyjz+Hmqhk9eXiQ3ckj8HudtwIdgqxhHaTU60F8PAf5XCSZGqnB7SBv7cx
         0sfnposNWImgdFH5og9/YVHcK/8YqEPn7L89pieTnpG9JbJWVRuC3xUlbMq8nsh+qmqh
         XFDyiHKOsqQk7KTfOKvfo59RImY9HlBHd4jRoUXTsuAz/IyWREuM2ER+wlC7wNLLX8fy
         uimhE8piZCh7ZCJWM2z8Bf3XtQW+touV+KXEUIdymPD+OTiW/EVa3JRu+3RpRLCjERsh
         Ma3A==
X-Forwarded-Encrypted: i=1; AKwUvBxPcDb5l/1ZPHg6sw+TgtkX/w3L6iWQHDyV0IzjyqlGiXZelnevkQsFGpSstOfrwYRLUs7Shh+d7OA83bo=@vger.kernel.org
X-Gm-Message-State: AFuF++kHTBmewn/GZA5QR8qY7ZvhNw7vo9L7J6CSOZwVunt+qa19ag2f
	JJp6k/NibZwZGuLGfGyuzWbW27w04lkR+XGCFtTyNi/Tmp7fx3tigzvM
X-Gm-Gg: AYBFou3tnF3Uyu4hZeiK7/WmMGx+Elc7mkgM9JaeXALg1r8xH/o6Lm9h/FP84fcztE1
	Lu244F9lbNGAKLuCXoilaf/AMuw5rEmM2InjKslEarNN1KYcNvIGCEy3+GwyAcvsCRbszK3SOZW
	YwMIiUJdc4/h6GBbz4kM5A0Gx2QVxNlwGtve5GLS7NCccIMV1/3+PLtp/TNVvYicegxXqGI53KL
	xk40Wa8Deu/8UtK89r6x9So2LsX7Zo+OjoW/pKHYD5TFdSQ20IqwNLWApQmT70g1oEMQ/1paCRC
	riygru1WCg6xWPehxS69k+f6np+YQXBMeqfmfqUon8EK6sFv3NkTVnZYaOr9e5jX/UsnDQXLb1r
	+8plIHBaQAfVoskwJmHBrb8SZ0TqJQdnTEe6EYZHL7Ft1fdzh67wi/O2QrnxDYoLWzMJ/FD9jNE
	4pwe4bcxsjcywqF1bkDOJrrQAT+/l+q1iagln1ZSa7HP3WZsYy2gcGkw4Huz8hXD/DIdKxAf3ed
	0c8yrEGwa72maCXu7N3snzn2cJJGragEtIAnLWSA+eHCYXcMtuwzUTytOt7teb79Mu/fRq0y1hx
	YTFzt3oZ/DLtzIui6pGOdMwdwKJ8ZXQ10kwiBg==
X-Received: by 2002:a17:90b:1f87:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-396d0a6589dmr46494009a91.0.1788223325460;
        Mon, 31 Aug 2026 17:42:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d776d0dcsm6599906a91.4.2026.08.31.17.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 17:42:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org (in file),
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH] dt-bindings: serial: 8250: add marvell,armada-38x-uart compatible
Date: Mon, 31 Aug 2026 17:42:03 -0700
Message-ID: <20260901004203.49686-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Armada 38x and 98DX3236 SoCs use this compatible, either paired
with "ns16550a" (armada-38x.dtsi) or on its own
(armada-xp-98dx3236.dtsi). Neither form is covered by the 8250
binding, so dtbs_check reports:

  serial@12000: failed to match any schema with compatible:
  ['marvell,armada-38x-uart', 'ns16550a']

Add a standalone const entry and a two-string variant paired with
"ns16550a".

Validated with make dt_binding_check (8250.yaml) and dt-validate on
armada-38x and armada-xp 98DX3236 boards: the UART schema errors are
gone.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 8c2c177faf89..f71c6afe02f2 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -109,6 +109,7 @@ properties:
       - const: aspeed,ast2500-vuart
       - const: intel,xscale-uart
       - const: mrvl,pxa-uart
+      - const: marvell,armada-38x-uart
       - const: nuvoton,wpcm450-uart
       - const: nuvoton,npcm750-uart
       - const: nvidia,tegra20-uart
@@ -119,6 +120,9 @@ properties:
               - exar,xr16l2551
               - exar,xr16l2550
           - const: ns8250
+      - items:
+          - const: marvell,armada-38x-uart
+          - const: ns16550a
       - items:
           - enum:
               - altr,16550-FIFO32
-- 
2.55.0

