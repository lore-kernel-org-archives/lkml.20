Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700708;
	b=V41txCypj8xXpOQuhIbsPXcKSkIvYczuf69AZaI6Z0Ovn8fLQ0UtWj52S1XQzj8/o6KT
	 0dyyoZGwbX3KzbNpJYDLhbnZn045QZKSyK9uXpNAuCy1hatLcqNSDHG1h51JBlLlgjtBg
	 tljio/JqT6hPt6NkZJDvnP/RbsJ/+Xr3wnbNZADEmzU7LFvhL4TIm+FCAkNftHnPDnJuC
	 hUUjQhG3EbOjqcZ5f5G+KSX6jbMuzuf1AyMV9BvTNOeBX/6A6F3KZsnjHZISOCu2IeP0B
	 iQa1NnKiHFrdC54y26UQM0wU7hm8tAd4EXKu60UwGEyxfbFV7/x810UaX1o7mjVDeJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YlblYhcykHoL947/Q/nvx+AeatTsVJAcpdiRSXriyMw=;
	b=MuX6SeVZ1QzH+It5Ld0XDy4tDjWtP3rf9o3f5npwzUBVGlvWHhdXGL7jMS8o6zStdoha
	 11oKZ8HwBNwURteZjlS5cBmDwGdHXHRHwy3x4zvCnE71beQk2EB0BtecWFrYCxOzlmAqg
	 oIDP8DpwQgvYqhfO/8fsqsm7+6fB4YGghfYPuv3tAJ5eX47xjdMEIASfwak5X3KZ3xamL
	 rdCKrAUtdV48pTgL0wWoi02zny7X1mNhBezE/3ncowQPmtsAEoFlAWgnTABI/Co9Qzykj
	 k2vZNi9GXVQlp+HTzNIo+rl4GKcDChjBW7MIT1/x9+u2P7Ohxz8crnjVI5t6QsxEnMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="lr5vktD/";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6330F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6330F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lr5vktD/
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso604793eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792700706; x=1793305506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YlblYhcykHoL947/Q/nvx+AeatTsVJAcpdiRSXriyMw=;
        b=lr5vktD/6CswC/F1Uk5PKrnZa2f3WBlIHZUm2oIg3rkwp3Q0F7WLaxbTL/kGZsTxx/
         dh4F8xHb+pCnrG2znll8Cs1NOsoKCMuVc5gr4e7Iy+J1OIEk9tKYtzDGiPe68Mgs0TL1
         Fu0hrQlkBDqRtjyo2sTaPv7gCewKEK+ZJstYpmC4Yjieg4LCERrZyFz8zvxSx6m4ASQV
         mdoiTR9c7GYAEBihSWt5UJayWa8T3pDgg/JJzkNhNA556A1HuRzlugmeGVI9MNzZT/ni
         wgxHo1Ke8y5ebYZu5Q5AyhWnD4yG46z9Skt9oG1ojcJDDNmYXoNw5jI9fCgGl/+9E+BD
         T3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700706; x=1793305506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlblYhcykHoL947/Q/nvx+AeatTsVJAcpdiRSXriyMw=;
        b=hVFrHfoD+l5jO+xeYrjyjlISeG2yxEmwFtMBmLhJZAvdCpQk4KjfiXkpMoTFj3ECM+
         wY7roPKAgdfWc4PJuN71i0dzCi8wooNViTPqM+LsH9lxMAVOOvEDVPxmNntQCRPn8rhy
         vyslNX2qNyvykovUTplOuEzkFrTZw/3rJo0dFZlfIQt4qyu0Rse316S5ldV7FUBUUMct
         mx6LxPVi4oR2uGfwaMe6n3l+bGpg8lkxiIrxiZ3q83f8pdNTw/6XZs+59mAOMPMWt175
         3X+1yrde63ZHKnOjDLfcCMswlsnOyF3tteg3zVyvjoIKKXu0cbcCglo9nLFWQa0bFSe0
         6G0A==
X-Forwarded-Encrypted: i=1; AKwUvBycXYnLYqa/knrKeBgcbpY0oIA8sPD/M5WUnj0HLEgvabFdvpQ90obTQjEAz8kUPPFtg62g1IlWn0ASzzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYInW08wOrPUQQ2hrHyJl+axdDZalF6gnw+77b5Emacxwz0blml6
	L1OwcyGw4oDLOTzkEsAIeQWNJ7T+hGIvDhHOiOtboFPY3pexN/XExPp2
X-Gm-Gg: AYBFou19KC1zH6NBhWtxiuxzu9U4P85pq0qwKUZd9DTNOxAaR0Physg0i8F6q6wrc80
	s38VBledKAjHQXLzo5tcWfSlnDf51tF5BdqG/ZOyfiqFh0jsq9ga63G6fAiOJPadESbbyRSdm4R
	/knZ+yywq5ziy9UmsK6AgeU+ZxUgqDRvclrntjU7jgwWU5Nm1kXxgi+pSBGouMDKGc2JgX0rCah
	Grufphut7BkMYd26ibZ6tb7jeBMtR3BICcLQE7L6GzLJO691dScBjZqBHa+isj1fVLDPMfp+1/T
	M1IbWfpM2v++xxtc3+KEAqZQNwqVW/BI+BuIM5Gpie/uR5ZkjmwsFHEnAwqZOkV3aD8OKFvwwxU
	JNzJhF0Qo+M+APK5diSUoUcj6JQ8uC7+zsX6Z5vDoQjnFjwafIU3BptEUPh41XBnjqDWVhjdPzP
	pLKfvcv3cXqpaJKsiyldFuselZQ8h4BTDDJKgzA/UY/yyfdk63ZQaErUlK3oTyd/tJQC9dNUTub
	gKNCZVNHweqJSkzjza1giWdp/wW6PaDKE3LihYhK0Lw/cz/YvmyhkGU6yx0oKAC
X-Received: by 2002:a05:7300:e9cf:20b0:365:f73b:510b with SMTP id 5a478bee46e88-369d971f2a0mr324415eec.13.1792700706330;
        Thu, 22 Oct 2026 13:25:06 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:5e95:3be4:ff57:f0a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm331332eec.2.2026.10.22.13.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:25:04 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: greybus-dev@lists.linaro.org,
	outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
Date: Fri, 23 Oct 2026 01:54:55 +0530
Message-ID: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
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

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

In the loopback function, usleep_range() is used for short delays
and msleep() for longer delays. This requires choosing the delay
function based on the requested time and converting microseconds
to milliseconds when using msleep().

Replace both functions with fsleep(), which chooses a delay
delay method based on the requested time. For short delays,
fsleep() allows up to 25% extra time instead of the fixed 100
microseconds. For longer delays, the old code rounds the
requested time down to whole milliseconds, while fsleep() rounds
it up when using msleep().

These changes may affect time between loopback operations and
the reported performance.

Suggested-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
v2:
- Add more details about how fsleep() affects delays.
- Update the subject to include the loopback module.

v1: https://lore.kernel.org/outreachy/c482704b-903e-413d-ba7b-5bf31c0a6104@riscstar.com/T/#t
---
 drivers/staging/greybus/loopback.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..2fe845eaef29 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
 		gb->send_count++;
 		mutex_unlock(&gb->mutex);
 
-		if (us_wait) {
-			if (us_wait < 20000)
-				usleep_range(us_wait, us_wait + 100);
-			else
-				msleep(us_wait / 1000);
-		}
+		if (us_wait)
+			fsleep(us_wait);
 	}
 
 	gb_pm_runtime_put_autosuspend(bundle);
-- 
2.43.0

