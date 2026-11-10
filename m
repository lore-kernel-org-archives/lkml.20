Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285922;
	b=U0ZPKgtpxH/yWisxJGXHP4wRoN4sStAT20Ar22sg+yrI205K9s+a1cEm6cq4Ge+oGWLI
	 BUfu6FL7exzP4lLnAZ5lodORjuIhyWXKklJiwwqU2XvOLwniDQVpXip88BEaukP/JnFi/
	 kLIUGpok6YxnjQlSPGNJ/5e0Aw2LKqMyntIl1VioL3HCizMftXRak239IN0dsWoRhBDHV
	 mPQxnRc/piqcZmHzDfRs5XjeZ63B8ePk3nqBxBlKveET41fqvqY0JTUxF/LptsHO+Rer/
	 ACEW8iw/6bfffQAm0L3xJj4f3+ZEv7YjR5wVnkGBAX+aDYxfceKGrJuGVtLmTR5V1ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
	b=eNCcJ/T0npTBr3xn5nN14pvdgaZQLH7T4Q30DnGSczS4mamH9w+dQS86xvkHTgTD+Z4e
	 4CqiqaMDQcipTRhj6hvdjN6Z0QG930QbJtpf6ihChoD+LPf4exwhFAUbVYqqT4Y6bz6U3
	 NR5iqcwkGQFyueTJKBuEu6RcWr72JliUS4RhSy4SXxLSqOvJnXOFFjBqTJQtsN/LcuLax
	 OYxQcJyBHkyxjnarY6yNvlOJX0g6TM7LbbU6Jx5iEAVZ0UGifQS0a99qRnSwo0dPSDwhJ
	 Zu/6pUKxDnGndu3zQc7slI2L8EG5+VQ0iHJHP9/FtNixqXkBDkvO+ColHWbsIIwgnyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpvQAnGe;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A5460A2602
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A5460A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpvQAnGe
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6f8a519e215so1346104eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285920; x=1794890720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
        b=YpvQAnGeaiLzPbJ4euSR0B4PirTCrPQ+YecWNXQoSZtXgTLwCbb19td5tZ0v2jWaOm
         0VGeln38dQIdLZPScbh8mF8u0utVIojO3flwe3aCwj6coX0l6s+l6jaKFvpiU98Q2oBM
         KFgOf6denC2CqqIipfUYYx4KsSR3IxLpli+XTxX6Gq5cPVcCtCLvDuFHFrXUEHpT/xCC
         lDoRYHzMHbiZ0kPzs4Fgk04eLuuQV+g9WLkL82IA2+M57pAcdoHI1+fMTj4AApbE0zAQ
         yDZHtGO4hBx27Wo4XLOdbXMK63Q2LVWNc7BMwTMqtFMJJUZBCOkNBDXH7mo/Ai1wSYb9
         yuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285920; x=1794890720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
        b=21t/Z/Dxh+VoZ1lr8YNzeDLjb6U0n2rSOoNoen+5ElEiHn169DdnZuLeSptPAYGLbA
         NKjmQnYSDWUA25H+L9IajM9jJbqU9KwnwwUp5zIy4///q9ob2EN0upWZHf6CDpqmuOGY
         uMp0xy+2YnGw6VJgdVYrXxwMu5YJ/saDoFyqeJFLC1LdpfpveSeW3iMqZz+cT+qUWQOd
         DFTyytZ3OWxDaPw8QcBRFyi4QkSvyIHvV+GxLVTLymf/VYzVaZmHrrLBb8MAp+h4pQvL
         n6D9Tc7F/UYYkQ0mE/vjAKae6CMAgWzWirdLi84eMG5NpP0xH78/tEVHT8tDzf/Td0li
         q4pA==
X-Forwarded-Encrypted: i=1; AL+hErGIlQwBKOo4Dvt323QwRoJQ2hVFL9Zva5dUnes+5kB4/1YfSNxR2sp+3zgGTyOumqfKAxszN7tMSgLQVI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZVDXkeCS/R39AUfHAEx/+5MyFDMfhPTm7tRyzKQ7TowA/pFsl
	tLxMGsOGkZOoeCza/IFqPtx1vGbEkNJe1zlrFth8L/Ot4MORKOrQWupG
X-Gm-Gg: AYBFou0YJ4gJeg5xWwGkZ3+QZkpjzxV4PI2QppRcsJhmbhe5s/7sevSNB2U/vKqqAKk
	aKaxQfy175Q1Ve69gd1FIV0v7qBWlgf2ilbX82yWvJWAnsk+Wj3OqEIugU5jQrPIp6LbbaAnR0d
	dP2U6XSXlgqB70btdWdN5azqa9nkv128GmhV6V3p55km/jFITPLWWu0fJ/nsa61DfbxJRIDbPhn
	JrN6/DejJsdXVjflRcTwxiiLi39yInm+9b+7R8Kl9fbQokL+8E5jMQPdEOD82Uen4V1TopTK7XP
	CAn1/SbrBU0Hw70h01QTd0wRhAWxzBMPeCA2FUFtWnAOloM/rBlHYLKriKb1iqe87fAcYfKQ+sg
	r/12Vie2fvbQefE049KDPAk7vMew2SrSx+2/sdrwz+Ep2bRbrql1imbS7OCK0/UNzr/UiyW2UFo
	1DMxdqBaOoc0k+ci2WU9eaxVmylS7svWpqwxKSK/65WF9GAjtLXHi0IGDPbf3gjBZEnPuq79zzh
	L3+2YsKPByW0BM+Oot3YYoo8HXWZdHQjYhYo1Fcu/Q+BM/A+QXSHc9rv1wvydmviSPSukNRKYJK
	I3OYXMCvVSlCWmN836AvnH6UGYvV7gFBTWFEzC+sem1l6RHWtCwxkTOQuDyX0aBz8JMbjf7mjhb
	YI1Ls5w==
X-Received: by 2002:a05:6820:c2c7:20b0:716:e2da:28c1 with SMTP id 006d021491bc7-718a77f2696mr394873eaf.39.1794285920417;
        Mon, 09 Nov 2026 20:45:20 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a40b8a9fsm954836eaf.0.2026.11.09.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:19 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Mon,  9 Nov 2026 23:45:18 -0500
Message-ID: <f1da763aca9c4978dd7cd9a363548b5e53314656.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
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

Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
for the accompanying initial board device tree, so it can be identified
and validated.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..37a7d713ac71 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
