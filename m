Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217484;
	b=FbbHBRU1SDzVMQmuEszBrnil1GMwSoBxyD1NdlQVJh4mr85m0rd7l0mKUGDVuNGFCuXv
	 0x5T1cEP1Uf2lin4ynG9lcmuwWWNK8jmzRUcepQ7jvuBfWyxhBDiVE8jQiQBRb2bHqR0t
	 FK1fyZNSfMqIN90OfJlieS4mDd/d/A/yrdfBwHlEizQoa2TRe1263fXA1RvWsN4tGdah/
	 hmMRxeGl90wBwjLfbm6JfT8AjS+aJAOqT7Q/Uw+m7W4qZRw04Q9a9UFqE6PNkTSoiZsx9
	 pd65JUG4LUF3JK/Uij3mchZ4o5VlNwAexfjpGyns02GbkC1nllf3kQYUsa0ceQLONcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=+YUTUU/Oh61z8CN0ior4Fb72s+3vtuOG9EHYvb714Q0=;
	b=Z17f/YmPRIBwDyAPcyOKMg52LOBvb9zfAKVwQshXLora0STWtQ9yDgHr7iaiH5S1IQyT
	 DZK3IuPN3pR+fULP6cnryawXL15o5QT+fjd98fudxOaKfpkq2VYfBgnuKeGcOIGub2Cg9
	 QOY2aZcqN0CiIn+jzcR0pnyrnq4vrBTBfXHfslhyKHKxA/K786YQgW7L7+YPBQxzQkxK4
	 BTvkN4CIemXHyM3EjIFBHqIEBZoHP/r/rrvVVzLa/NcwpwCYgA9+AOb6oOtbOFr23tzXe
	 h1cisdGtF68/EY61UbNzgn+OP72hq8glKPLTWK2PPr3YSqnlUSi8OM9KXtCHmtrocWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tV8PhDd3;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D481606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D481606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tV8PhDd3
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4322d310e7so86778966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794217482; x=1794822282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YUTUU/Oh61z8CN0ior4Fb72s+3vtuOG9EHYvb714Q0=;
        b=tV8PhDd355+0kQCWxNYoKmw9zjYChsQn8E5NpzD3e0HdlpOQQnFJGabjr4qby7kFWB
         eT5U/0nx3savniE82cVkgUH+wYsoI+l38aTM8FulKR45ZT8K9SMmp95F+Pztmvbhvdz2
         rJUhMZgn1TWiL6aqyuF2vJDuRrTaDnzo0gT+IvksjLBUj+9TG5o+ztGmpg6lm4SzaGH2
         DBysk7/W2i7ET2Y43CmxrJW69yzQIr0qKEU8J006uJgRwukg4SB3Aqv/svoWp29/fTiJ
         xAarqYr9v8ggJE0bH1R5JarZwDyJyzHG6Cqk8r4+m4iEl66dq4Q/uFVXCaQw8zr/HqYS
         fyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217482; x=1794822282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YUTUU/Oh61z8CN0ior4Fb72s+3vtuOG9EHYvb714Q0=;
        b=xhAk/3nkIv2sXtcqHvE+wr1/ZeG3/vEyxBLFitix2yrjXryOjp3r4sgIGXmvVuex0Y
         WPxZZ3lLz+copoOFKeBZH0oWbJt7WyQJLt2aEDMtVPTHDw7MKXMgKOM093Z/wJKgOZCX
         R/zfV1Oi0s7WW3r6kImDGexmvbBRdphpO/B+US0qJTO1X3Dw4YZqyHQu8FwEzeTtOQS4
         /WgGEf527dlJDNq7aRoqfjZ3lYH+SXSgJ47OxHKVnUYMAdktYYwD8RBCiEi4VGaEubZu
         4KhD4ZPR1xQHY5S5SmbdiX0T3A1h4lkGs8kNixbzDmMMyUSU3tSc3TL+uBUzoFVgVF6O
         c5Vg==
X-Forwarded-Encrypted: i=1; AL+hErE93g634pZQr/phSbqFV/++oUDte+X1UMnCzMIA2ldbgVVhabcWy/ReaBnZpHRX/qMY35JFHktRNdT0Q0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c9H5b5mCF++jGhfL4V29lBokoWuaRvhK1RbknQt5ZraIT3xAN
	GYEd5sovY/xsAJnFCeI93HD68vHXYRqA7iIilJwX+dUNk2/Lwj7qClfx
X-Gm-Gg: AYBFou0oz3K7WyaqEHZAz8R55jm15Q/swQvk0SRyIAXGuibGxppajHHPryM0Thi8TnK
	o6KEzoF9yGv2RtdamxDEDlbPlW+NEriWqLGCC7uOdv+F8c8DIDvi9LmnLWcvlJMJqzXCS6sNBfR
	Gt8+bleo1a1rZKSsKGKVqoQAoAiiDRVPBJc5IrxRkCQ/8A3X0PH0wHDr1pLs5+nEtFG8tXrxM5N
	xzPuFRu8XXV/pNKeRSWUsRj/NwqyQJMK+pCo6RQhIXMkdxJ0IVH+ZZYReJST8FZRxEMAs3XxJu4
	XV0wZQ2q2V3GmDYpHTwJgLyOkiRxWidggkOcasyAQ727WTlEgcXnhY0iwL2xrfYaD17ik0sm4K6
	Wl3TSfzFnePCHGvHpslLK5IAp6H2Edzww6DGAH5IQ84QaFEQw2LeFl6ph2TW8gsyRLK9Vj9RZqO
	TvTrVOx2K1Ns/NiT5HaeNV8DvHBz8aOl/T5AYnBqQetbkMd7z3ZQVwI2Ru91FMg4XwXtMP3yi0R
	C3tJt2LOEgkerGuQC5dO1zugYm4nneLYdkZgNJQYiOJAVvRqmDLxN0Nj05hy1ZakeAo76k6i2zY
	sRoz2I/wWRZ3Xzm9XuwU2aE4TVm7Ug2XMV5pYHU2o2Iu2FwtPGPdHBKbCA==
X-Received: by 2002:a17:907:9622:b0:c4d:31cd:9dec with SMTP id a640c23a62f3a-c4d6d7c3deemr218179666b.30.1794217481952;
        Mon, 09 Nov 2026 01:44:41 -0800 (PST)
Received: from torstein-desktop.internal ([2a01:799:3a1:9700:6e3a:d704:53e2:f00e])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c4d6a4753aasm137786866b.45.2026.11.09.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:44:41 -0800 (PST)
Sender: Torstein Eide <torsteine@gmail.com>
From: Torstein Eide <torsteine+linux@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] HID: lg-g15: cancel LED work only after stopping the hardware
Date: Mon,  9 Nov 2026 10:44:26 +0100
Message-ID: <20261109094426.1432465-5-torsteine+linux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109094426.1432465-1-torsteine+linux@gmail.com>
References: <20261109094426.1432465-1-torsteine+linux@gmail.com>
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

lg_g15_remove() cancels g15->work before calling hid_hw_stop(). In
between, a backlight or game-mode key press makes raw_event call
schedule_work() again. The work then runs after remove() has returned
and devm has freed g15, which is a use-after-free in
lg_g15_leds_changed_work().

Cancel the work after hid_hw_stop(), once no more raw events can arrive.

Fixes: 7705b4140d18 ("HID: lg-g15: cancel pending work on remove to fix a use-after-free")
Signed-off-by: Torstein Eide <torsteine+linux@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 drivers/hid/hid-lg-g15.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 592c9747738e..a341b0aca249 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -1927,18 +1927,19 @@ static void lg_g15_remove(struct hid_device *hdev)
 
 	g15 = hid_get_drvdata(hdev);
 
+	if (g15)
+		lg_g15_unregister_fb(g15);
+
+	hid_hw_stop(hdev);
+
 	/*
 	 * g15->work is only initialized for the models that schedule it
 	 * (G15, G15 v2, G510). The G13 and Z-10 leave it zeroed, so only
-	 * cancel it when it was set up.
+	 * cancel it when it was set up. Cancel it after hid_hw_stop(), as
+	 * until then raw_event can still schedule it again.
 	 */
 	if (g15 && g15->work.func)
 		cancel_work_sync(&g15->work);
-
-	if (g15)
-		lg_g15_unregister_fb(g15);
-
-	hid_hw_stop(hdev);
 }
 
 /*
-- 
2.53.0

