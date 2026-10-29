Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278596;
	b=a5zJIE7KEWLlkGO306tJgRsH5YGfEaqSsWGFXHm9Q+QeMzI3hxNQoa4AUo1ZFlTGl+MK
	 Q6HJoRcibvSSJ+VFSD/lyRS/YZnWY02HR6Ky/p4vs09DCvY5hQfFoMgRb7ka/UXBtOpfd
	 cCJ052vR5HsXpN/kU2zOt1UbjIk6+jrgzc7zFr2UTjVo0enxacZtZ3yS/1ClXo/tmj5dL
	 rh4jOvB9lZ36zgQ3tutwwO2qctxqPKfa+aBccb2/oNDzus2eT8S+5ZRrez+sopaneYZKc
	 nQlFljHlSzvBrolKpBbhOMFuABpRJeVYet6Zy3VzZKVebUG7QyWjl5uSfWdyD6TqfiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F0Wo7TTbK/Som58VQxcyzEkXGQTAIvUVBDkCUTj913o=;
	b=ezNqx1Am9GpErhUeftADmcbKr7NPA5kO1vBAP3DyYMRqpemtSObIyyFvHudU7MBkzcOz
	 yebUailEakPzUBWYBX7N/dllVxg/oPsItdbtqsYJkLe5At19CFVSoO8pf0ZpZavagWcus
	 fVDk9QZPRQnh6JXMydVFKqdjPs1nt+AkOEYNiho9WiECzb2FSCVEz6GJ+WRAzlXhnJ/zJ
	 REhMvlrsQW5W0iRyypff7KqGcslUd8dodVlijBn59kvaKlZRMAfiYkoXgDgeQ0rGLcOzl
	 7GABVY88+cBnRyB43ECUjIYcJa2IdVlDpJPa009B9RdVt1QxwFBi+Q2WraqBQBZIcgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpkGXqll;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpkGXqll
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9661805e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793278595; x=1793883395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0Wo7TTbK/Som58VQxcyzEkXGQTAIvUVBDkCUTj913o=;
        b=WpkGXqllcpaOtVUp1WiDef8+FU4QYF21b+R7GKBxnBh/VxVJJtVqPqMXMkTU5sYEn0
         ghNrF6Hsd4juhbXHYY0Pbq8zmM5nCDNAcy2a+jVuMacGFDTfEgCmqfex7C1yf45ZXQdU
         qsiUng+5MCYDbpy7JmJfjWM855F2llXFitxodea6mMwRlZEhIg2+6/pJ4RlAnzxAUUpk
         myYz+asg2wQtOtm1CpRgOf8y9tJTwcK4aeGR7fhNloroh0+Xdl5vwmphrAOQ0uCICf/I
         JOCrOWNZwMq71Q2I5xlrtDCeom06d37uCREup9Fys/pCZFBi2NgYdg5SnsZ+MWV13GEC
         81mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278595; x=1793883395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0Wo7TTbK/Som58VQxcyzEkXGQTAIvUVBDkCUTj913o=;
        b=QrqQgY9nCh55ysgZu7GqX+0lzgOGpUR4Qo0dp330ytsEzMcu8+Y3RYMYAHXp68g6GK
         oSDuwO086qcMnrtCYnyH9IRBP1E5HzEFkv6Dps1cWj1hHVdhjTSlpH68XxdDU5Ger+4q
         JREqIr0jix4kT5HHH2ouIElSyXWTTd0xy/ForE4Fae4JFzmbrEF0qNyDrrqAu/y7FxNz
         lbRQ4wwvfjsdp3u3Fb/EpJPwwdB/+jOvny/mcnJnVKp8izHgpkK3gr+s+pl/AOPro4xP
         2JEzNEIszeuDJALqA7f3/oOyEfCaSJ5j8MdfDJ4ZR5RYDrofgqO7TM1vIa4RCFmcX4GT
         CJuw==
X-Forwarded-Encrypted: i=1; AKwUvBzk+fBwDW9SNxov8vMhy76VM6U2Kuipk16lRdvpKFvBKiWJRPjwkPe5ydawFTxx7plbGMn3hk+UQY1Hlxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhi4WOBa515amIfvqpjOvVbXPN8VChbQnh9twRNxzdRhBmx4P6
	l8aWDW9spfWAQVq9J7SGW+ldZGo7SzzkgPkZH9BaZY9dNAH9z885Vrzw
X-Gm-Gg: AYBFou0CdiDtLlXGsYZDBII9UrDbbyGkjA5/4D5dLdc9BdDIXOmr6dWjywHEwAqXABy
	n/xyCrBfTsGrQz6VEkmNAaGCUH/huUQHVE8n2avkc2GcIQ5WkP8BaMh/b5/abxzhQJ8DjLDMxGD
	tLIV/R1b5X3Zv0kLBUsyipXc9Wu6yTQk4JAXGa16brm3SQu+2LwPx5xRY9efE6y7Y41GNuqhY6m
	3uvqJQIDtnzT5E2X8EpjAxI1RFKv/JqaiXsZ0vJH+5ZhaXCCEgXldul5qOvrA8hIsDBgtR96/Ec
	EDyHtj8+26h1Hs+BpN3dOXWwzCT6qQ5IE88+6HBpoSOn/ONH5Bgk9/D7hWyDBhDP5L2YN3tl/rD
	RwhD3M/SIRJMSRdSC6iLvhQ7GKGSdppU944CNjW9V9FpeYWCUBOqu1W9ITI5LqPU2GMa0Z6AN8E
	j1UPzLBW96f4c8RDIFIFNGf+z5Rj6LHaou+60o1xK0KOgC/wEFzeSUkSLo+3SyP4V6z+Er1OO31
	AF2D2p3OuTpQDfZUD1UMzpIvgeedqc6rnKAyQJi4nwQRg0UCDd9p+v4525ORPYJzSXPrNVQDmoK
	K9aFGd8KUuTvVC1ASM+d8ugR6qoEiIP45aM=
X-Received: by 2002:a05:600c:1387:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4aa877ae8b3mr64502615e9.11.1793278594547;
        Thu, 29 Oct 2026 05:56:34 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:ff14:b834:842:6dac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80285b2dsm64711245e9.13.2026.10.29.05.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:56:34 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] slimbus: return port disconnect errors from stream unprepare
Date: Thu, 29 Oct 2026 14:56:32 +0200
Message-ID: <20261029125631.1551141-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

slim_stream_unprepare() ignores errors from slim_disconnect_port()
and returns success even when a port disconnect transaction fails.

Continue attempting to disconnect all ports, but return the first
error to the caller. Keep freeing the port array after the attempts
so a failed disconnect does not prevent a subsequent stream prepare.

Fixes: abb9c9b8b51b ("slimbus: stream: add stream support")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v2:
- limit the fix to reporting the first disconnect error (still attempt
  every port and always release the port array)
- dropped v1's retained port state, selective retry, and stream_free()
  change to avoid blocking re-prepare in existing codec callers

A complete recovery solution would also require the codec callers to
handle disconnect failures and coordinate hardware state, retries, and
stream lifetime across stop/start cycles. That broader work is left for
future submissions - this revision fixes error reporting without changing
stream cleanup semantics.

v1: https://lore.kernel.org/r/20261028145508.1111792-2-thnkslprpt@gmail.com

 drivers/slimbus/stream.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index b4e70a7edd1cc..220e22088f8f6 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -448,19 +448,22 @@ EXPORT_SYMBOL_GPL(slim_stream_disable);
  */
 int slim_stream_unprepare(struct slim_stream_runtime *stream)
 {
-	int i;
+	int ret = 0, err, i;
 
 	if (!stream->ports || !stream->num_ports)
 		return -EINVAL;
 
-	for (i = 0; i < stream->num_ports; i++)
-		slim_disconnect_port(stream, &stream->ports[i]);
+	for (i = 0; i < stream->num_ports; i++) {
+		err = slim_disconnect_port(stream, &stream->ports[i]);
+		if (err && !ret)
+			ret = err;
+	}
 
 	kfree(stream->ports);
 	stream->ports = NULL;
 	stream->num_ports = 0;
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(slim_stream_unprepare);
 

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0

