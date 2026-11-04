Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800129;
	b=46w+0jP9y4eel14mfv0Y8arhOUiuVCdVBRrFMfI8tGzhwUPQgUj8a2QC4LSyWvacuaz2
	 QM1tGab+zPEAlb7ZynWtlWRQv1sgOg1oDzw76x6Sf8RJj24fe2G9B0tGG4vUQ3vFyg0+X
	 Ncmd2XJL06GuaNQoweDHQtGLsO+auO4HQSHpvLHj6qGiMDID1nNKwhltfN7awPl0jikGd
	 dKq29EVGFRyLLsRbylv5cggNI2XQiWXPkAKTxMlEDltSBGXJTtPvNM+cO56WmDOHmsI+n
	 gXB/7RHJ7JOynjL/BOreDRKRnpZw1ztfNnBProID2e3JjYpXBd9ZD9ash3DbYAtuuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gCKhCVXJMv9/Bm/v8zaji1RU5Lk+HQKXjmOYbZ5e9vs=;
	b=sKgzRZq4GB9w3JdrnpOU5yuujKl17Ecg7CMLq5/bjARJ6YJWLwwqPMZtjIOsqAuGafeU
	 DuVylXkvh4GlNLVJ1E5ylT8RH9b+GaFJ0WpWnypixGIMF4c3ArLmPyYvaz8a/8v6kD4lp
	 uBWnkAx3P46rVMmmDnxmBAUqN5+NcuDGU6uBZpA5f7w7czdd2stnrAsddw5+qmUqWctBj
	 DSDHY1tACuymWBeqY/haBTakNte5waSZyGImoCBBLytUI8dD/23aZ83dyGeAFnx74A5Bx
	 wF/pltg+bd7fKicuxzuK2zHBLN+jwUZYyAGN9lITxIoB95eX/t9rjDgDHN3awnKbOQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rcaJGYl/";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E4F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E4F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcaJGYl/
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36d1b3b9974so44566eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800128; x=1794404928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCKhCVXJMv9/Bm/v8zaji1RU5Lk+HQKXjmOYbZ5e9vs=;
        b=rcaJGYl/vnAIvZO0CyhbAFybKqCTxJuzw4fe8Y1bSl4/2uUUhPGY8KBYNGQu42I9Np
         oqI/tQH3b9H9zsojusVTaj5t2gLWDfGcuM4iDxz8f/fTai5c6pSALPmHx5R9VykklB6g
         oi2n7HYaKlnFeTXFAGKtyJdJiT8dI0BfXQtbgCbHB2zUWZO02Ra2C/l20yKs2ntJuiCj
         RCNePa3s97qrsK0hMqYlmBUoJI/lJBgP1Jr1eyH6JtDnVzlK55Iid4kzkyeXUnQeXet0
         GonhUOech5zQvk4WM2eeIw6q2tUwoa3l+HICCvBPNvj77SEuRRCnSC+GHg4ekMax+9kv
         scSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800128; x=1794404928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCKhCVXJMv9/Bm/v8zaji1RU5Lk+HQKXjmOYbZ5e9vs=;
        b=uUoUAhOtUvG6HGiaKbeMeHrb6es2PQ4ePn5/7CDTFsoOV71Nf8A+nCNuL6Zx6jmi1b
         MTHzxpYMPZdsROhIl4IfnqD6LOK7vYqwvn/j6c6JFDsaHaJwY7FApKSE5dOkmyhLqp5b
         xKL2W7aRDeq+EMywk3B6uo7B8wV8PYhAHNUaCXe6KJpZQx1MW//cFE5UwhYatSs/0RyN
         q4gFdnkVXJa8bKAbh6i/CVB7v1M0yCiePVU4izir+87434Vlju3RsTkIakmN28xqcQMM
         LkLbkUXnHNQjc7O3yn4M+OXn/aiOFO34MCggowkmpsdrkXBTvMiTYJM/4Dr8w52CDBJu
         IFIA==
X-Forwarded-Encrypted: i=1; AKwUvBwUzdq0eykM6l3usGolAdLEKj+JBkAW6khh6mvUSlL3K4sO8jfTJyQH56De6UFdT4gxt6gpL2/s8Gvz8gM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rwg/4U4lM+ds9/CeMTKH/Y1b3UXJ9jUs3iwuMLvbjBwgEcETM
	Fm5RxIggh0od7tLSl71jIklDTUDpNozwH3e5FiEEpKPEeGpXRDhvzBti
X-Gm-Gg: AYBFou0D/mq2C5ybT3618Ci8si7ag205aa6g3Z7NuEHsG5hRA3o1lxukzzxxqCGWUXJ
	ns2s4JrG2jIISfSO1Fo+4mDbAjzQHWwYeS4x2XoTewu/IZwZwJ8ZZU5C6y6ridIUSeKFtLT0Xfa
	Kxq1GxKAWE9qODs0SWq28SMl3xOq8T/MyRK36MGXD4sT/n/Ae8h9b7w+ZfDwEcDYi/nls1Mt6Gf
	IFvPg+3UTAx1+9XhvndGzmN9rY/4S/jMY1kCSQ68z0Wb0+rWWi8IiX6uvyPXesbu6WIgCAw5JXO
	0BZPvygb7/DxIqKIuekVBJgzC33jy+k4VjhcKauVGifG9L0OAKXbttPkaMy+Y7oGWu/7h5VrBxr
	6qTZgp0RwyjZ/43Y7lppo6KOdua5Hh57DmkS5RmBjBy/r/xtDKm+mi7aGjd53rrgBtpl1Xip7Fr
	B2L5XJTbJm9s+R5ENigrXAlaMvXg1MymOLwbFKRlMtXK2theWr4j0/fhM0bKe8YLDg7yE3UhTTq
	BsRS8hBPKrTE5FTXbG0/q/ymYdut+gqBv3hRYjnayxM0Esf7JyZ1RPD4B03mn/mu0zbPqjeJHDl
	+FktfL1EheHlzJs66KtM0u1DJ9U5neeW96tVgU7a5g==
X-Received: by 2002:a05:7301:144b:b0:35e:d21c:f33e with SMTP id 5a478bee46e88-36a4220aab3mr34973632eec.1.1793800128103;
        Wed, 04 Nov 2026 05:48:48 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm7148327eec.15.2026.11.04.05.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:48:47 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Chengyu Liu <lui2012qwq@gmail.com>
Subject: [PATCH v2] regulator: disable disable_work for good in regulator_unregister()
Date: Wed,  4 Nov 2026 21:48:38 +0800
Message-Id: <20261104134838.326041-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103174911.1600930-1-lui2012qwq@gmail.com>
References: <20261103174911.1600930-1-lui2012qwq@gmail.com>
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

regulator_unregister() stops rdev->disable_work with
flush_work(&dw->work), which is a no-op for a delayed_work pending on
the timer wheel: flush_work() only waits for a queued or running work
item.  A disable deferred by a consumer's regulator_disable_deferred()
therefore survives the provider's unbind, and regulator_disable_work()
fires after device_unregister() has freed the rdev, dereferencing it
via container_of().  Use-after-free.

The in-tree users are ASoC DAPM regulator widgets with a 20 ms
power-down delay (sound/soc/soc-dapm.c): the window is the entire
deferral period, not a race between adjacent instructions.

Use disable_delayed_work_sync(): it dequeues a timer-pending instance
and waits for a running callback, and keeps the work disabled so a
concurrent regulator_disable_deferred() cannot re-arm it while the
teardown proceeds.

Found by static analysis.

Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
v2: switch to disable_delayed_work_sync() (Mark Brown): also keeps the
    work disabled so nothing can re-arm it past the teardown.

 drivers/regulator/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..4ba0457c4747 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -6300,7 +6300,7 @@ void regulator_unregister(struct regulator_dev *rdev)
 		regulator_put(rdev->supply);
 	}
 
-	flush_work(&rdev->disable_work.work);
+	disable_delayed_work_sync(&rdev->disable_work);
 
 	mutex_lock(&regulator_list_mutex);
 
-- 
2.25.1

