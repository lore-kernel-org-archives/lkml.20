Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A7C48643C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791452864; cv=none; b=Fb04tNDEWBiGHSewfMhceCVBwxhZY61RgK+Ir9pQ/pH6GuvxJVAoTsrG+353oI2SOSIB8hNmd0nc5vGxUr6ryHeN2E4EOq15FEkyGP+Pfk5+iFz1y39cyHbR3VSl3bqDU82YTGtYIoZghKaLk46T56F4rP+GmGHobPIeAsi36EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791452864; c=relaxed/simple;
	bh=XcwHK6uRd8xzF6/DxitWQzYDtYqQuI+luucpSOQyR2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doJFxI8NPWmnm6Sx+LW4IUfXe5LyqY5C750Izg+Muw8z3XZaFk6E9/YOrBkLE9q7Xhk8U61oftYO21epoR3Xt52R53fUW9Nb+O+jJTlGpBh8aCAnrcjmPvW8I2rfM1cpxFiM42002CBMchu1smcCTs1nG/hDJy9Hom9FzbQ4EAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qioQUycz; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qioQUycz"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-141395927feso4463177c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791452862; x=1792057662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDdtCCRK+vtCeWTEJQTIRUbKMjqc82M6uTiT5DUqjb0=;
        b=qioQUyczd6L6eI6x5Yl4Dbp22cQzjm/mxczVt529CwljZN0ZZ8HzPBaiyc1oPN+rg3
         Hc1ScajY4C3HTBZdZ9y/hUrOWdcMPkTFrbpl9IzWgL7aZoLYPDQ8uPGlI/XTyJoUeRW8
         3Qn9h4kPeOZLVO0SXWhzO97jB/RKYjzOuW33uLRnizwHkzrujKmk36DYnxsbuX9DtEhj
         9gMwA2pTie/J/WeuOxdX+jm3/tF9+TQ5LlhI6sYVOsDhLeGd96DhkYILS4DG4OG6IKy4
         1JRkUFNVJUUyC9cuhWUK6LBZ8I3hMzkXlb3y64HDitGy7VqgrR6TlxF/Albuy69T/WrK
         idoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791452862; x=1792057662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDdtCCRK+vtCeWTEJQTIRUbKMjqc82M6uTiT5DUqjb0=;
        b=D9GZvrnUZOZvg4/po4sd7J76bKEDg0T13tGFAbjbzbZloeFgyG7VeEkXsr+jko/62d
         JVEQ7MDpt2+IjfMhrSctnvHrtOQvtIAkf9DhsGydxwR9XlQmPVeeqFqXF5LWohRxynWS
         PEwi6wu0mP/mpeM35y9sgTTPWQg07YzZl9kYgNXOhyuk6474psKJn3lzeLKL4Z37mBX0
         OqaCERwQXN74QYE/DzjoK6xwWlyzC93K34oG91nlFAL/0TMwKToD+kRxm+p6WRDGmaJD
         bDMrGEldNv/sVJpfOVLUEcOmlWPGnFEdw47iVDjAfLRvWxqgzuD9HUhUiuyzqrhfKo3A
         P4OA==
X-Forwarded-Encrypted: i=1; AKwUvBxnUjCgdtAXkq7YQOdajk4abQgt31Evwak1fFnZpYPaQGrXcie8mHXWylcLlceDuLcaUom73oxLH3kb9HU=@vger.kernel.org
X-Gm-Message-State: AFuF++l8sYUn9qr4zk/qt4mE1hDD52pm7WMy3HyIFnJEh5FICkSimVtG
	+PCfIVmbHic1aJDXQyTbIw6T7rH7yR0DBgFLjdVlrXwY88SJQXH5e4cl
X-Gm-Gg: AYBFou0QIRsD8suTL8KDdvTkbgz+01/If3ghW24bz9fEHnoug+Ia/u54SRgsb/EGsYW
	2O9DzWsfSbzOFTau4+tpVR0qeVKuujgyfpIHBiTqcNtruPTz1ohuDy4O7XMX9jkMikbkB5ru7aV
	LfG4ZxU10gczb/a0oZ0tmDnWPwhQy+Egug1bsDq8QjgGiXcEK2PMvjPDuEZS1EcSj3XDXAIc9qW
	4QKailr24r601lsnAT7mJ3kKqNjGWi3d4Hbu+LIpc9OexMZcTqYtjacdayvkGyex7r2GkHaKVmQ
	+QUt7Nj1nOhyC3VpEYxiqesJ27I8qewY/cHmVEAMiX1PSHGTrAaSIoAXuVuDkK2fLOFrBf1wghU
	i8yRZJC/RyDwBPEvgdEKovBlIiN0i/utYqpbceOqrxKKAAZmSqqtWrV5usiTZ5L14Tl//P4VW0V
	N+RuK6QzbXbzFXZVFOX0NQ6S6PyrZrcKZAKhBj4wS31a3Dl7Xf9U//B3v2JPbLM5pef9ehkvDQw
	SEreLKJesT+i0WD6juXsQz+UKqBIBtXr/6CO3t/jaR5c2PNyaa0Qp5h+tGLYs4=
X-Received: by 2002:a05:7022:43a9:b0:14d:3c0c:79ec with SMTP id a92af1059eb24-162044c07d6mr8099962c88.9.1791452862103;
        Thu, 08 Oct 2026 02:47:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c00sm14994424eec.8.2026.10.08.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:47:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Support Opensource <support.opensource@diasemi.com>,
	Roy Im <roy.im.opensource@diasemi.com>,
	Dan Murphy <dmurphy@ti.com>,
	Yegor Yefremov <yegorslists@googlemail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Input: drv2665 - fix input device parent assignment
Date: Thu,  8 Oct 2026 02:47:32 -0700
Message-ID: <20261008094736.918137-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261008094736.918137-1-dmitry.torokhov@gmail.com>
References: <20261008094736.918137-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Assigning the I2C bus controller (client->dev.parent) instead of the
I2C client (&client->dev) as the parent device after
devm_input_allocate_device() causes input_register_device() to attach
the devm unregistration action to the parent controller device rather
than the client device. This leaves the input device registered on
driver unbind, leading to use-after-free.

devm_input_allocate_device() already sets input_dev->dev.parent to
&client->dev. Drop the redundant and erroneous assignment.

Fixes: 4d10da13467e ("Input: add TI drv2665 haptics driver")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/drv2665.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
index 4f8c1f69aa63..134d65fdcf2d 100644
--- a/drivers/input/misc/drv2665.c
+++ b/drivers/input/misc/drv2665.c
@@ -180,7 +180,6 @@ static int drv2665_probe(struct i2c_client *client)
 	}
 
 	haptics->input_dev->name = "drv2665:haptics";
-	haptics->input_dev->dev.parent = client->dev.parent;
 	haptics->input_dev->close = drv2665_close;
 	input_set_drvdata(haptics->input_dev, haptics);
 	input_set_capability(haptics->input_dev, EV_FF, FF_RUMBLE);
-- 
2.56.0.385.gd3acb90ef8-goog

