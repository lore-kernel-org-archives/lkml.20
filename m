Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024815;
	b=Z2F5yo0aiOIBhZXz06YCGLFCLVISIhLF79MAG49FP33l4ghI/rhCFr060a+pAykNa6tK
	 oNcDZB3aj5INcyO+UJcPV3F+pVFNz4VpYHoiHdGic7YvvjDGbNVTyMKsYjVSwkHQg9vSa
	 3mXYeLP7RhFZTrs7UFc+B7efKJ6XN1uuP2xXRt0Fh2tGrxXhsdLUqp7mCtJ1GA0jMfJSa
	 q0QQYks/js2k/FTll46xisayj1ylBgw0+j7tw88j98/Qu31QkH4QVhtMXwO08D0G5cO+/
	 NIi2KJwYnqdKCpaaUozjblRil5Ex6XAdZ4W3mult3lMPgusuQN1IWchlLiKfQkEs3Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kqsneomx7oxt7G8JgkY/wgvljJcG1r2hAmJ3TT9dba8=;
	b=iXdQXqyQYb31TkyidA/cvl3pJF6hSDEaqQVgWXVCQ5aDm3Rag20NFcaOR6x9F6jcMRs3
	 W/kBjf1NXQEYfBjHbS8SvFB4+aod508rgMrVjD/p31sIqXkJ9S3b1VzF+XhOockwVSp6j
	 Dgw7pwGCCFSb27vSj2Q8K8qITdcgqvY5KOnzF0WIwTinX0waijjNVReIisKG8c4dMgqhx
	 pL9f5fcTVcw+LkXJdyFXip5ggNGvKpFrv4b63RE9Ydn+WSx4+KGbrdknhANpAWP8uzvpT
	 6g7xFwtfRvlRrw26xDEnuyq7+dwqTKeehj9cQ/fRa61ai8sSSsZodP3IuExXGI9JE0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernelgen.org;
	spf=none smtp.mailfrom=kernelgen.org;
	dkim=pass header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=fUBFZXQx;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05616606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05616606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelgen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelgen-org.20251104.gappssmtp.com header.i=@kernelgen-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=fUBFZXQx
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48af4ba4425so377323f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelgen-org.20251104.gappssmtp.com; s=20251104; t=1793024813; x=1793629613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kqsneomx7oxt7G8JgkY/wgvljJcG1r2hAmJ3TT9dba8=;
        b=fUBFZXQx6lGyWMoSQ21EiEhm1q0JIJItErQC/zLQ6moUmkaaEHN/OTa7A9i2kOjyip
         5ytxXNBgVOaIJOwfHEB0CuJUgz6jAF7kLshRaDQUPag3q6Szv/ndtZhLsl+sEh3g9CKS
         RA4rjrjcfvUTLvxXgiRddWCkGTEn8NmGjmRAQun+pVBtvhsS8rFme7P/WfR28hU1pp9I
         K5JFy6RQnHPSS5hL8ZY0rasvsuKEhAK6uRmNubrlIjML+UOK56TEtVReZYnqSOtInPjR
         /md7WD7FoTNTTygRNH8I4tCsu+tgDsQvD6SqmaeTTxysvIivQcUKhUY1BDmidDvhgESn
         1lCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024813; x=1793629613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kqsneomx7oxt7G8JgkY/wgvljJcG1r2hAmJ3TT9dba8=;
        b=Qs/TSBaVjXrG3TYLFCBJiOGHpYLQYlVX+SIC2BZPjdj91WGSPit0T7FU7OPbagpaGf
         wm2xHbB9ZuMGSaZByYLkcU/EwRsuTSIRIkkRRTQF8T5MJMXrRVw3F5fg/+QBBTA4xanX
         JbFg0ZwlF+hKv2LbhI5XPQJJPzyag9fRKtAE/5hnDaA2nxvknkQ61aj6NQKc22je0d7C
         wODqcUTuE4QXyQxHXqpMQCYcPdenziScFMn8D+FO/29VQmuLHRxRj7dM/0DSRqKjMvDm
         nBSBE5MJslVagWxcw9/y63FvFDtswohV4XIX8GjQbKnN3LZYjKbrqXvB6ShwZOaG3d7m
         N2vg==
X-Forwarded-Encrypted: i=1; AKwUvBzr1Gu8HsvM8YAfx2b3Ld8BIlVscaQbNcrZK7g/T04BMd0Fc3rlcG5p8XU4ekNKGgXlwLH33YX1Tm5XR0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHWVqmMtbinx4PGNU857MQMbJfecgkLEMPmnWL4izZ8+k25NaJ
	Va0qoHXFOkgmrUz5eoA/Z4WBl1+WFT33yJrTP+VTgH321ZeqbfVLFEMFNaksUDtBJvw=
X-Gm-Gg: AYBFou2729ZiwdZHIOXUCTzJpnomHlE/zgVaXCmfso3cCKEBMt9R+7KOXpRvoZZBWd+
	qf9psuonAiyXjem4T/ptrnOk2DerteZ0WLxI238ff01YaLvS5hIHYnWb11HTseBv6jJB+IZvhVE
	4HfzrAcZqwJV9Hf6Uz98vNPKGTSF9zdberBJxFBOSGiLglywaErEN2iJp9vdjWwCoOqV9Q1ueYT
	KHGWe7QjnhOfJP9u5W9xvu6oOf0Aynk9DTxKH0hEc9AOL/tCVJqeYliAGRkauUzY08fqnX2yjb+
	jwfKcM40kryEVL/mF9d9oGtkChCJxHARlsPvhBkarJlC9IWFNxnA2z8u7xjqOZApBq0p6BlTyp0
	gTfRU0XvdjQ7R/r+Mwgbdn8zwc50Tklh1tJoBZP8TKsC2KUv5qloUqSnxmEEMQGP0+cN8nbNbUk
	ZowfENjtGocNMyVLNJaFB4dunM+WSbEjc4y/8KqNm+C0K/zdgJMH2PgcRUP0ES4fVAxmh/llL9u
	f+FrVkCs5BTGgTOEt+gZGAqBC/I6wQoYTVSuSuGA4jZephdFu4UCMnhBggZj6e0cvu+VBn/qRPp
	7NV3iHWcKUoEN62U111fVlvDjesRR48Ohxq4egaiirJ9mXiS/3WvpN7Y0PCI/G/dG0Hp+H0BxPe
	MZh28HZoWwL3wg58775E=
X-Received: by 2002:a05:6000:40c7:b0:48a:f5c5:d067 with SMTP id ffacd0b85a97d-48e3eb36376mr14822402f8f.2.1793024813472;
        Mon, 26 Oct 2026 07:26:53 -0700 (PDT)
Received: from kernelgen.org ([2a04:ee41:83:91ea:29ae:67de:9d1a:d368])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm16400703f8f.4.2026.10.26.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:26:52 -0700 (PDT)
From: Dmitry Mikushin <dmitry@kernelgen.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dmitry Mikushin <dmitry@kernelgen.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] Input: synaptics - add LEN2072 to smbus_pnp_ids for ThinkPad P14s Gen 2i
Date: Mon, 26 Oct 2026 15:26:48 +0100
Message-ID: <20261026142648.2567233-4-dmitry@kernelgen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026142648.2567233-1-dmitry@kernelgen.org>
References: <20261026142648.2567233-1-dmitry@kernelgen.org>
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

The ThinkPad P14s Gen 2i (20VX) has a Synaptics TM3471-030 touchpad
(PNP ID LEN2072, firmware 3324237) that supports SMBus/RMI4, but it is
not in smbus_pnp_ids[], so psmouse drives it in legacy PS/2 mode. There
it is limited to two tracked contacts and shares the i8042 channel with
the TrackPoint.

With psmouse.synaptics_intertouch=1 the touchpad binds to rmi4 at SMBus
address 0x2c, reports four contacts, and the TrackPoint keeps working
through the RMI4 pass-through port. Suspend/resume (s2idle) works.

Add LEN2072 to the smbus_pnp_ids[] passlist.

Signed-off-by: Dmitry Mikushin <dmitry@kernelgen.org>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 1ed9261bff2b..b007e642ea76 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -194,6 +194,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2058", /* E490 */
 	"LEN205b", /* T490 */
 	"LEN2068", /* T14 Gen 1 */
+	"LEN2072", /* P14s Gen 2i */
 	"SYN1221", /* TUXEDO InfinityBook Pro 14 v5 */
 	"SYN3003", /* HP EliteBook 850 G1 */
 	"SYN3015", /* HP EliteBook 840 G2 */
-- 
2.56.0

