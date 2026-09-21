Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506624A4EEB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003362; cv=none; b=TVS3IM/A3MTPSTcGsBz/L1yAWBkN12SP860d3K/1kCk6AFfu0e1xeEjAA8kJbwOQ6ZhY8yOhfIbTU5u+sHl/r8H8ToFSZScv9LyQ+VxbV0kX5Ua6BxxWvzWCU35H684ffQyj0QjS/+yO3llm2eCPuJ0a9/GNoLeo3QwTaMSTqDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003362; c=relaxed/simple;
	bh=2hLVo973TL+IdDgfOfnl6vgwTnq6FuS1dy3gn60sYLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcjM4AXbDQhbEfySLLNEbibjgAbnyDvjDqLqMbfTP0jjHz8fS43EdNLd7fZR/U8WyjzUAHTvG7HkXpu9BYGkoXD6f9KNMHNRAlSBQUiO65O0XSl3wW2EFNVcngdz1epR9Or+N3bw90xo8L8NRRtKCOKTxv4ZPp7A8/u91Ec7MF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH72MC95; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH72MC95"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso21103395e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003358; x=1790608158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=;
        b=YH72MC956xs4c6UPt+L1dZzoYftqbb4MBD6D7u/v31+xQA9evaUUjKsQ25q5h+xv1n
         TRIi/GC1b/7/Ous6NWjF/Pn5wqlxwLv3CnUUwnNfdiegSBiqiadDMEUPeD+Bm1gP57I6
         I/oFARha+Q17I4+pLlmUl+pqyPirg9vQ2V0Vcmm68D3Yw/lZZ37aFeaTaKKBHeFsJfy8
         K7lE09S38Y0fG9r8rReFuboEYaWDSOObj2Ti4A4GhYX5cqoLa4lev2QdqV7L7yNYPvTj
         MNebcEhU/mLRQzaLtCiET9oNi0VxBmpd1YicKTCKq/Xv2iezSXRmJAyqP++BzZBbHBuk
         016A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003358; x=1790608158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tma9B921bFIX7nBVsJuVx65bgAYnceU5Vt0UE9WRrLE=;
        b=wOKwaO5XsEJ3nJe+rAkYEluMKKb+Lp7OrQAVyKClc8pAbINBOqm0gzjYfRKa/FkWWt
         CBgnbZfvV2/g1O9/dQ5MKruf5R1T4FRwqxrD2SDq6pf3U/Rj2hbS7E/4TxSJJV6stJ0F
         18HWxs8P8ZUad/MSAEYLCyqZ5bX9pR5QbVbAyQRBUYTUoIJrqXvUsMHN8yNAxe4OddmN
         TajXjVllifNt61hkGBwphPEEOHUUrZHO/4BDeA9TvoGmyWtTFKLF4AW1c8XFXXs9Nlti
         SAQccBY3IBmyjlPXsdvWMk09Oza2IoZEWVa4hSwIuEg4AJ3xrwGTzzLHPAMucN+u/8RX
         k0cQ==
X-Forwarded-Encrypted: i=1; AKwUvByDu2ofLSeP4daCkB5wFr50DRmAtAc77BDKE+rZY8cprJm7343zrYK+2tMuX2CIMa46bqSKDsMRUlNYUp8=@vger.kernel.org
X-Gm-Message-State: AFuF++mHmemRtkBDNwsZkRfoqOmpQTHMF1kp1NpgGpIdontPaRce4Gn1
	Le8lAeEJFC4AiksjsQP5mjpSQztExO1cPrjYznvSn18jKq80HEuZ32Qt
X-Gm-Gg: AYBFou1e3rNBq3tiYMMHUXHQicDMi6CDYCLqsblyyg4zmzWprq45srWfnqOE6eGtInk
	QiiryJ6VRAPl7SAGkkSDtO0VV0XmuRECRYngdQ4p/K4DDe6guZk1pnNrGkshDbEyuEMulvGmCAw
	kGet5u+GqFZm67is39e0hm/1HeppMG/djXLqN1zmHux1XHrgtrCpPJWMXt4FBAELxSW7YsHFmrB
	17kK8hFxqojQcjalOs/Sd7450F7kujegJRVgB7JIZQ4kPlrUiqEYMNJT07YIc0r5T1qvxCMyfN5
	gSSpbYPqX/1/C3UfqfTUMy0w4SRyi37Z8fxAD4URFzj7l+9WA+OQVFr+QAGPHMq6jKqf3PcdGiR
	0fIdYjRYSx4hnEfV5VggDfWdAT0hD7NTlv2yO6YQwTWqOLV/kAs3kUcafr4pqkveoOLivgnDHUX
	xMtimvuDUeP3/PL1bp/D0bqalupBBzDedUnrSqLdetZ2QTF/4zBT9dUchYMUTVa+gfrxAXRd+gq
	C/Rh0SU0Nk4sw5WmhIRorPropQOdykGzqZJBq5pVsXf6OqgKwSviTsq/GBEZqKpA9w7/vlyOIMM
	7zx0/Bhye8PDD68y
X-Received: by 2002:a05:600c:3b04:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49fc56aab52mr150433145e9.9.1790003358551;
        Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Mon, 21 Sep 2026 17:09:00 +0200
Subject: [PATCH 2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop
 reserved memory node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-2-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=930;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=2hLVo973TL+IdDgfOfnl6vgwTnq6FuS1dy3gn60sYLo=;
 b=8vQxbbljLHi5ctbjXGnvpx0s7hUcmZwoEqChv9f7UFEt2WHJsgauYQxdmsMj3k2QtvPq4Px1E
 aqvlQO9Z73xCWko1NMLNcKEsCu4lGQsSo65J/OH2o+UPbItGZHFeTDN
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

The current FSBL can load firmware to any address and can also
disable the coprocessor. Therefore, FSBL should modify the device
tree at runtime. Remove the node accordingly.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index a2797c0bd767..d4e86c15664e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -36,17 +36,6 @@ led-0 {
 			linux,default-trigger = "heartbeat";
 		};
 	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		coprocessor_rtos: region@8fe00000 {
-			reg = <0x8fe00000 0x200000>;
-			no-map;
-		};
-	};
 };
 
 &osc {

-- 
2.55.0

