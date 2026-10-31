Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440513;
	b=isUR46geRbS7Kmyg/HlblSwOnCj8OVWGZxWk/tB4AjMdoeKdFgzRC15Fc242bP+5aAyP
	 O4AbHrk6+9wBzVc4LESoAQmpCPb/5zrW/ZopeJsfHvdf36o2/ipaLdgFbY7cG3rlHi+ji
	 aRBlww/Je69Q38WDyA6LQxhpjgabd8kftGYOKAtSkcK7kiRiSwQ7ckl40vBy0mcGdzlh8
	 0h4utxnDn76b02BAhaZ7UB7yqHrlL7vyh5N4A/afFRABmTPHbBf4/0IwjEvBVhBAktIai
	 aPd3n2t5DZQkMvpMUJiytsKwpwCPRQvzERz/iD1q3Dr1z3jOTzjK5rBeA8kpB3FNYnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zUoiAQ/eIl9mxZDtmdwiOfm6Vo77qK+7yYPtMHdNZHI=;
	b=VuSshOUacSIaQ0QF1X+zGHoxNM/qbnVLgAZlZwycYVqwhJ/TM5qzuyhXb4kcoM8TU1AN
	 97qmWhsgvEo8PFrHNEKdgYb7FS0ZZNiNT2CZ7epBOyjcUGBQ7VvVTW7el6yPyGSvoLfgu
	 Jg8iV6NsNEbypN+vfO18coMr9dnBitf2W4CXNg+Cr6dENS9X1JeLhnqgC7yCuYSvp/laT
	 5AklYDLzBc1p/9mzGmSWKwBha8bpj84V3hgNPSMGprmgSUL3o3lnxMaDhucIcKoZq8uUU
	 ADIDey+zAtr48yi0GpPbUsVvG0yctLAUtESYTalG1jRBLo/1MUajPEoTr6+3hn62Q7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BL/zvNX/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4A606A323
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A4A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BL/zvNX/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so14690075e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440511; x=1794045311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUoiAQ/eIl9mxZDtmdwiOfm6Vo77qK+7yYPtMHdNZHI=;
        b=BL/zvNX/tBrF6IXRqpOnI0jDf796deWz5IB9oDGIraKRvWYUoRZrsdlICJzU7YUx1L
         A5lY7thvAKSAPQfvF7IpAVWPxnH5oySXW9I0vKfHnZfsg3RWY593Y3EPaFgeh0e7OFGB
         Q8SJ5KMqgR8Xr+52d+tZkXlv6P1XsPoMuvwo3yZzUXLdvuGBUebZo75XB0nvudrG7ogS
         PXoOkVU0W+Z/NwDEw7JTePQsMh+gJXaZYAFbDDqD6J8KfpC8ns+AGDMHCkamXHsPJ5S5
         Nw62fFp3kik8vLKa1FR5MfPzCy6RMgjQRDiv15YF875DzK+IpA/VGQmldHTRzxg82A7W
         Czxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440511; x=1794045311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zUoiAQ/eIl9mxZDtmdwiOfm6Vo77qK+7yYPtMHdNZHI=;
        b=aFjq69sjdX4yGrav3o+OYptGSu8REZNdiF6OxnlxFs0A/+hoPFYls7nNiLexawj6VJ
         ZUv0fWLXr2fp2JtJkrq9u1H6yHxN1+nMGXcZlRWVelXaGrVrVbzpZqoa3alarXTrXK0e
         9xAM2hxYIYX86Czu+LWpsm/JOQ4tu0PMtipZLX1EG+Yya8YiWGcP7Jc8iZWRC7/AT2x1
         gBghalDucEUEnyBPDniqMIWXr+5x0TU7ZlT7Iymn3cAXwzBkvou8b2nu3EWcXhPlBC+T
         Z8UGMIDhUULIn6utA6GtCFla3ttLuAP29YADVkYdaO5CvctI70Oz3BNan5d/Om/ibzqL
         fGnA==
X-Forwarded-Encrypted: i=1; AKwUvBwKoz2xbZwHrY1ryBSQGnX4T/dFeLZ1srpNpucSkGmv88tjP/5qtpfwFZXPUz3UKQKUHPD7aBrqgdUsyhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbLS3yqmxb+hlS6br2EVdUdHbncQ7wxuS8mYXycoWzkL+JFPvh
	UwbYyf621kUViP6TbD+GM8T2gKsWCoVUJ0SA1hNyi4tqXYSW1vSs1N5u
X-Gm-Gg: AYBFou2GIfHuo+WVHJhRj2khHKifCleZPXsLxngHI2MSR9rUUSATV3FvkWjL0daB4qP
	zfRt0Y+nodU2/kp8rhut66jFjcl5SWPq9W1SDJSgMpVPBS+zRDcecG3UX5hELuwRj6Q7JGAwG5M
	Yuc1BF8heXlPuiy71pJVEbpCA1QAdYl4PJjVtk1dE1tsHjmnUSIwXPMmoIx49H2KIKD+w2JNGBd
	1LU9GKzens3SeWBnnGLMSpMWCPXTVPAET8VwTAP0G4fRqyfmzdtTj4b5liQabqv1XGHhUeQK1Vu
	jHSsfCIqioaKdL1lqsfFR/HWG1q+qSW9gZNsaN7YE61oJSLzBvhtyeXYt8rheqpashTuDUat7cx
	Ai3WHSIV0mcGOYWmK4F2yYOpAkT7rqF+Mgbgxdk+hLiPq+9QAcEPUn+dqglBUwK2Q8r4Va0V3Y3
	sta0XBI0OYOHIidgAfsJch/nsYSayeaRGy29eGLOYiUmFssjkQbbd8sLyJ5KuI90scFL0CiAuQs
	Ul3eYmTxd60HOrq6rSuIfvG+qoJSJurIc8ZYAtlxv98G97jcaTm5pwzusIQuNVeMbAWaAac4gh3
	w8RsZdM7eU+W7D4TuJBgVLeYfGQL/lLFk6FaZqxbstWb1bmwBeRq5eKTpimY6+2/uWL1BQTXxWG
	96SLsL+Nji4XL5uXnUOdLrU3TfKDqZ9f9N1Rs01NlSPGecTsP01BpPZgUIBb1nofoWt0=
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr114344385e9.16.1793440511385;
        Sat, 31 Oct 2026 02:55:11 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([95.173.233.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a6bsm7869505f8f.27.2026.10.31.02.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:55:11 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	patches@opensource.cirrus.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: cs40l50 - fix work item leak in stop worker
Date: Sat, 31 Oct 2026 12:54:35 +0300
Message-ID: <20261031095438.3070451-2-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031095438.3070451-1-ismailtarim7@gmail.com>
References: <20261031095438.3070451-1-ismailtarim7@gmail.com>
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

cs40l50_playback() allocates a work item for every playback request,
and the start and stop workers are responsible for freeing it.
cs40l50_stop_worker() returns early when pm_runtime_resume_and_get()
fails and never frees the item.

Free it on that path too, as cs40l50_start_worker() already does.

Fixes: c38fe1bb5d21 ("Input: cs40l50 - Add support for the CS40L50 haptic driver")
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
Build-tested only (W=1, x86_64 defconfig with the CS40L50 drivers as
modules). I do not have CS40L50 hardware, so this was not runtime
tested.

 drivers/input/misc/cs40l50-vibra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index 68f0c40ef..cbe69f6c7 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -384,12 +384,12 @@ static void cs40l50_stop_worker(struct work_struct *work)
 	struct cs40l50_vibra *vib = work_data->vib;
 
 	if (pm_runtime_resume_and_get(vib->dev) < 0)
-		return;
+		goto err_free;
 
 	vib->dsp.write(vib->dev, vib->regmap, vib->dsp.stop_cmd);
 
 	pm_runtime_put_autosuspend(vib->dev);
-
+err_free:
 	kfree(work_data);
 }
 
-- 
2.56.0

