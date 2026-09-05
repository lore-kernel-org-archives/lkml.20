Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686DA3F326B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788597420; cv=none; b=Y5ZFKWRg0gpkaGWdYt64duVJv9QOP2nlWYUF07BZUOUTh8Uq3Du15PaEUSv4BZSkZ7m98yQK+o78Pl1VqIqhkh7PihMY3MUl4wHCxUqtoC9WWLOSkwUckTAcTjjMYc2r1OohJjUrkmTEPWBEmpt+7iyjm7Q0+8WckCvFI3E5vUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788597420; c=relaxed/simple;
	bh=wgggDzjHY+Ah8vECxyGt8Xj8OVmFIHcQoKQNaP/el0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HajBMDx7GuMJVZZsPkAApT0T0uHJ3Qsv7izqq9bTwncAanQDJhLdo/OEzq39EzBjYpz6EV6sn7Il/PyS63TeduYcAvZwHiKa2HwnJPue6ui3MKJRu3MRl7RX7SmUsBWnM+yZYhk2Q0lWndvaXeKan2rtVwiYDRenj75VH7XbAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqQL3s4Q; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqQL3s4Q"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956869750eso14265855e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788597416; x=1789202216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ynaw8qDzMXNFxXhqOFzgHygfT9MJ5kBajiEceTkzYr8=;
        b=TqQL3s4QiteOfHmMHxZLjjyRG4GapJvfOYGHiHSO3Enuk8RdI7KMBObTUXWSnnD/Uk
         qc4aV5VIx7EgUnDw1fW5Ejr63JYchP3dn4955UOtBXX5+DbtWwzO0Ptefryy3vG/HKdw
         v7GYox9BiJkZnmmrYHQv+SqHrX8tUlPYhD6NLtitgdxhmfU1TlRYzyfAm0M7CMapUO1k
         DzaSlDG2HPzlhCAMYH8O3J/D8orB5NdAjihEfyFjJZT1SSaIz1iQ5kHkEyUHkxB+DGGr
         DwvI86rIF1I9pgc7RsykIsuanhkg7Nglz7TXXnO9xVrvJgTOUAPF3JLlka+OQsVRwp/L
         n0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788597416; x=1789202216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ynaw8qDzMXNFxXhqOFzgHygfT9MJ5kBajiEceTkzYr8=;
        b=MnImutJ9bbzU+QdXHxVOAE2/y3ik0ew31ugk63Q5hHDm+Wd7tPydHj5v55P1zYepgT
         cxPrD+7cmYKgtg/2vDh9LhkcO1tee8jf572mWcvocMuP2D4pfKRPpIYyyS+UrQ3zjWN0
         sumYnENa7mJeK8Xk1eqnMTNeylJnEYna5r/VSGd+ztqUcdk7UQDAl8S+5SnIk1DtfabB
         3Y3bQuoyZGX56cRZeKK5+B+kkEbpLwAAIZ/IfZTyDFoMzP/w3BOEfJwVUmYjCZHyiy7J
         2R0z7yhqW9HCXTgVja+AqAeXDkaAbPa8pvvMZ1M1nbWuYztnNvQ6mWk5zSdSSCFbVu57
         Z09g==
X-Forwarded-Encrypted: i=1; AKwUvBzXlydy//UDRttgTbueHCKB3cX/YB9ZYxc+DGHqMUR4vIBXyjbV7HuYGcoeX2jYzHEL3SQ6/eaSJO5a9js=@vger.kernel.org
X-Gm-Message-State: AFuF++k4X3iDFc07VatlxjyGL43m2f8keyV7jCMtpZ0VsKgIX3RlDMH7
	TxKwkxR6b5iU67c057anB6mE7sOEGnDRtkVMK1OjDoDChSzZ13GDR95NSnK3MDuP
X-Gm-Gg: AYBFou0GjIv2xBZYsf255LIbFWy8INYv5rSRh5j/wqs8vl2vagoURf4fzWgUtNXXbJg
	EESx4/3aq768xMn+/w2Sew5p10R4dUHWTY2bSUEHd5bpfDfOrehkfvUd/zxXhKEAxqitF1on4oG
	5Pt8UlQe5y0ymWoKH+UAkyR5DiVm05l0ofP+o+HjudDiEcib0Y4Db3MZRIJmNgFjPCXpjlb/p78
	agsoNJte5f4N/lnui/uRj2LVE83b1APHprtSVuiapHojauCaPcOqmMrckk3TEPCrMlrWINgOmny
	6ia1IJLhAylV+qRPbPQUuJbaS31qe1V+dOKYRWgfXRN7QWUtVhodwRd4J6M02uBATBbf3ZpQO0L
	1r9yo1Xj1jssZxZo1do9J0a8oHOH6j0zoB3BGuXZb/rJdulR98JQVxuybHPooA8FBEWCjCGmsyz
	7zwUGkDV6xzs2d88qdf7t40N73ndRvt9DJyXutTsqw+f/+e2j6xC/zbBwbsa26gO3+mwK6kLC2J
	rUFrmajjN5NqIMsDA1lJ/obPy+wSS6APbbjnlNfxvzHQ6/bvU3x3sSfODi9PzkZGtlsMJPHZpp6
	UqcJZLtBwTQRhp66IMBlCXo77j+nUQnPIXvlyv3phmsTxiFDtnvuzxHxDJdE2nGxdak=
X-Received: by 2002:a05:600c:524b:b0:49c:fa20:cc08 with SMTP id 5b1f17b1804b1-49cfa20cd2cmr88077965e9.31.1788597415955;
        Sat, 05 Sep 2026 01:36:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm517436035e9.0.2026.09.05.01.36.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:36:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-serial@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH] Documentation: rs485: Pull uart_get_rs485_mode() from serial_core.c
Date: Sat,  5 Sep 2026 10:36:48 +0200
Message-Id: <20260905083648.39026-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

serial-rs485.rst asks include/uapi/linux/serial.h for both struct
serial_rs485 and uart_get_rs485_mode(). The function and its kernel-doc
comment live in drivers/tty/serial/serial_core.c, so the directive has
never rendered it and the section shows only the structure.

Add a second directive for serial_core.c.

Fixes: 0f4648a1a6d3 ("Documentation: rs485: Mention uart_get_rs485_mode()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/driver-api/serial/serial-rs485.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/serial/serial-rs485.rst b/Documentation/driver-api/serial/serial-rs485.rst
index f53043d21071..98d8d83718c6 100644
--- a/Documentation/driver-api/serial/serial-rs485.rst
+++ b/Documentation/driver-api/serial/serial-rs485.rst
@@ -50,7 +50,10 @@ RS485 Serial Communications
    matching to the current configuration.
 
 .. kernel-doc:: include/uapi/linux/serial.h
-   :identifiers: serial_rs485 uart_get_rs485_mode
+   :identifiers: serial_rs485
+
+.. kernel-doc:: drivers/tty/serial/serial_core.c
+   :identifiers: uart_get_rs485_mode
 
 4. Usage from user-level
 ========================
-- 
2.53.0

