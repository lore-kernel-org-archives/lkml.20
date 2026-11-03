Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721117;
	b=zw6dKTPunAUNuHJDht4bxX8k3zKHNcXc1Y4DL0HFSYnLqOx3SvziZ/MHtkriAwgu4IHe
	 fBE7/4Np7xr8GcanauawLlf1Ow9aNQC2koI3Cr/sXNilYEt8U1v/YFWWqitgpH6XEP2Qx
	 XhBtTL9Wj+PTzITAseiEi7FCQ69SPbv3Kdoqtbodd/bbqARyCr7q3vGJriD5u9Oa5Cmmh
	 co6iu0h8FzJP1KkLRMjTNKRM1417GRTvWjfXk7PwitjIhYJnXRfKkXrNtYuZd4Z5cEEpj
	 /wsOKSEdAnGWlLTeY0G9gTimTMzeG9uGnUZ0ZDKP+HVVPg4+7ZT8jb9VLsBw9P+DXiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=48ZgMUAmWUootHlVRFgHd/O1MI4u30L741/hVXfoBok=;
	b=VzJ1rUWSDSZ13EaxwlxRVZogCAdTdTCetnn/TEdrv0YL2h7YX3Bu6iCeRU4URBrLU4Ow
	 qPTPmBeA/9U2vdrzhJDU3eqQslgrTlDWUMZTM+GRWVu+1spAd17wH9GporjNMQ5vKEp1j
	 mSc5ruq7rLziGy1ZH9cnbfY8Qkrlczjcx6b4+fNda8f21UmKeVCzjZ6jw8KryfbGl1euT
	 ndN5qxDweOF7N/XJhvh75JFcCf63osVJi5ABxSYZF9yzlCyHJ8oyCsrhWzYve6ml3qlMs
	 FySn5H2u803zt7TwMWQH7J/f1wpKPKDTlzI3UW4nH+yKxeUcJ6r+Aqf6Y1rGBJVC1SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnliSMnd;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C2606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1C2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QnliSMnd
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so564293f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721115; x=1794325915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48ZgMUAmWUootHlVRFgHd/O1MI4u30L741/hVXfoBok=;
        b=QnliSMnd3rlXtRor8SHtaOolv1WFVAVppgOyQH/qNf5MKmkOXTHkzQTiWRPaPwWA46
         cBb7O+UM5NyRBoA5bhBrtzYEyyJnOcP/jysxngd+AFlBAanf8ZsUY2chdshUfvDaS5E4
         Dg4muARPLfyIf6u1eZ2aAZUoKcWoZRK6qbl8XY1cWFKHUp+O4yjg8CrcwEQ2gySVONsK
         OHGjxF2W3FjFZecA6ehjE+NQPnGXkpQUwDQhBrB67/G2Bua6QrIc8y7ectJX1Amxec8X
         aMGsqkIAHx8ThqNj8J/c+DKYrXJLjHKwnGt2vrOUaZRellJCf+13HQbxVnZAc5zrmy98
         Mrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721115; x=1794325915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=48ZgMUAmWUootHlVRFgHd/O1MI4u30L741/hVXfoBok=;
        b=rfkWHdqPwZdv3N1FHTQ0zhoKEPlaAEeKabc3UcbK+/ZwFMX+W1RT+QWuPulA31h1qc
         yBp//YiuKLoSWMNeCH/FEbqrCfiA2c6gx0/riTlptOOocE2G7yvubj0R/jZAEno8DZJX
         ZjRi9xw4Vd4Dxt69w/EB3itEEHQiQqTAZSwS0a6FpgeyJdL5qKeGnGFnv7C/tO7I1IwG
         EOUxo/YQSs4TFFRiU/oT+YEJf9XjQbuSJUoaGS+hKOtJbbsI3qHMK5wDVJc3ycqNY9kZ
         vCIqvv7T+Yrbo76cG+dtAWZS51tSxd9iSI7G6Zc6KOJmqnruybkXPwf8jg1/wUCCqDgK
         ms7A==
X-Forwarded-Encrypted: i=1; AKwUvBwgcIzf65Lg8asU19HPQbus1+nI48sakwfHIkdNTZ2+4uM83O1RdZbKP9eStcV0Zfej93y3XN+FmfnS88Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yj4cnMDjfQJ90DLZzNlW1nyAYG66WfjNbM642UuawWAqHcemY
	ewTkJkKLkn5GLL/2u23iO+eaqLEby4IwLzQZMliqFeH3ZGVznor+KHYb
X-Gm-Gg: AYBFou3t6sOYRt0IYimU5iih4WejwdknzvgbRp+ZWSlkiXkQb9vfeSAEp03XGv5xL1Z
	3oHfv+6M/TEETykM/BGXJhB2nGniijlZmARjjzUVY2kUDOvFhOXv7sGrT4OP/HhQRgang3BcCrb
	1EFdyKFPaJMdP8VZ5I19nu5XGHbb8QSGwNOS7kPly/dTLxB89KxlFmgM/cS/7BJyMFE/cUbAApC
	DqWWddD60nQ9JiJXuHJtxs2NGloCZCkM7b43pOSFLKCd+nwCRK+2hJRHSeasiYpm9UioA2e5ICS
	3PvZPolNGoajCEhpO/HzV+SrBx4M9X3Nvg3/n5SjDg5JOPD9rdWypNXhneStzFxa0h3tjazVS1M
	OfFCStfbv13OPO/h1WbCk8cEvqhnTNgtwObj79sH8lZGOPzvSgZWYQuaTk/HKxWtdq6k3SrAHA0
	P1P/5J5sEhGg29rnDDidpWDErCc0WanZ9Wey9oakp4MSvQxHxdCWkd24NbesBIbgrBebBVZp6JS
	Z0AgTNbBv5aZUU6jMQZsM/0Td6cPJwMCezqF8NVHA03EJuFhe06m5gN+5gmqzQipPIFMBtzDkv7
	Cfg/rExT++AsUSj9PPzAuFPE/cQWgWOp3ALsedNzvRRhPXToQ5dcuqBE4rJTQ17C1JSnKBkRv32
	SWbr9enAUKnHfiAilqvK4zhY4X3TcVmv2BxG2IwH4MXcWzm2EFbYx
X-Received: by 2002:a05:6000:2c0d:b0:48e:661e:8766 with SMTP id ffacd0b85a97d-48e661e88c5mr40085813f8f.17.1793721114894;
        Tue, 03 Nov 2026 07:51:54 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm25680750f8f.46.2026.11.03.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:51:54 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luan.r@variscite.com,
	alifer.m@variscite.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Johan Hovold <johan@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Fugang Duan <fugang.duan@nxp.com>
Subject: [PATCH v1 1/3] dt-bindings: serial: fsl-lpuart: Allow wakeup-source
Date: Tue,  3 Nov 2026 16:51:25 +0100
Message-ID: <51b4d26521bf708d7f74f0ccb49fbe515d673ae6.1793719239.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793719239.git.stefano.r@variscite.com>
References: <cover.1793719239.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

LPUART supports waking the system on receive activity. Allow the
wakeup-source property to describe ports intended for system wakeup.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index c42261b5a80a..5c1237294a62 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -74,6 +74,8 @@ properties:
   power-domains:
     maxItems: 1
 
+  wakeup-source: true
+
 required:
   - compatible
   - reg
-- 
2.47.3

