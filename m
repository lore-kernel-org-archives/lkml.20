Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388821;
	b=PDgoSe+Jm2jOv5DQwhwTIiswY+ODb/2B4kauPLEnEECgiZZqLNaUtPmb0nd/VvN1OoHq
	 BuDbcdVJWQrK+8xp4APKERZgjzuYFk854S/K/AjACZXO81ZIYEDCy9xPVUxlUu4b1GGW2
	 oyOrcMgZfHrXkAkxA3yE0YIXFxJCAlKUQbQKkXI48kVi0Lb9bX7AZT3Wqncy91QOjh/3i
	 Bju3szmtF0y4n5AlbHRjyspEFrqOsSVkzRQPMrBVp4tjjvfJuDAetLdXfsHKKKeqJosgJ
	 zLZ2Y8dte06lfzEzpjLknXztPvtAoQCsHoNaO3Xf0+vQchGkQDKjJL4PtHKs9UPCE6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
	b=1tlGsg5SvirCyFJly02cAbLAcKoBGW2K369Ama1lg4D+6CWY67IPCCAMWvDfD7IDggvS
	 Pfl65TLNgmFIBO/+QTSBoiX6G4h4XqignsYugIO8pbGmtoNaVyc8doGYK6tHCtJtIWGyR
	 ItHs5w1NZoR1CZzg7+DBdI9HcAPuOYhedeFvdqglEJyxBDhgVNZUQB8KHNrntBrIXJelU
	 Tvetz54w9XOfo/qGPHEwahvJkZ7hfUSQE8cGOSKv+0qvdIoHtIrJziDjDAgARrBVZR5Gc
	 eEheltRJbOiO1f4qszULVN7hYnYcnqGi27tuSD8EgPc0mYmsMbty6QpE4ygYlmvWZfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkwtfUx7;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627ED606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 627ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkwtfUx7
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so1702843eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388820; x=1793993620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
        b=RkwtfUx7lPVh7f38yMfRd6JOWqiCMDkZ5Xot+u+6Klx88GkeGrwkq91B8R7XpX+qiX
         21UGMcfOdlke22CDJeRYW/X7Fp4Wb+VEDiWlCmOneb44AZzua1ObGxWvWNXgCQPgFC7S
         7hg7tdDMUUTkgAT6EQBKDMqbzaxiDxGGfd5vOQRAGayPzI8VtRT+8J4sRJs1J9AuWCxE
         wBBynXzLcdtf5itaQtUW0pqtLVynIFS04hZecX0WwpHAEJjBg0qtyfLduNACeBCvY/0O
         FPOqJDawtNJAQQiH/peypU5vIe8wTV9y5AlZZjOxPg5aFRdOXDbOfDZyLoP2kKgr+VGH
         c1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388820; x=1793993620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghEJXKWzTP9aAwVoN6uwmlIFk1sC5DaCEYh0pbHfkpc=;
        b=KPSPFSV2sygFRv8kP+Vh8YBZr1e5Q2ZuXDRh6wJwREYr++2dnWEFUdOYbGRUf61cN6
         NIzmk85lX9G1l1DOk/i/IVvgxp0nXMdIFrKkcB5NNWaGV6rys/qDWq36dc4k9OsAloBM
         Qt//Fy1AsLLudGaoc0+d0GxB97bppa4Yy2nF75j+Eh8Phk/vnD9TlM3nq0SREVeGVkZ7
         al1xu40gwIo7aAuIeLRemCJOzoZxCaNXGiTvCNa0bQq89NAu+6D1/zdrLOhMFxORc1EK
         a4h1A70n5fQIOMo1ySDLldDJp7cfftVD3WK1gQJt4kze5DA9F7PWiL4uT9ylQvkOuG5L
         XNbQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3a/eibJaRc+bU/Itw65Ko6NXSTax+h+BI3y1ilCP+/sMeuV/1cqebf1pE3ECdXZf+q+XlOLX9waBNv1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFQggUmg4F3kIAKPuCcNWgw1Sy9GJ5APTlzd751uFlXM07Kjbc
	QOWaTQYm4aSI6mdzd0RWMfr3Pq++eaLbsQRfLNQrokb7+QNW0DTo1Lcb
X-Gm-Gg: AYBFou15bDJfoOdqHz/1r5PaejJgXsQQJ4lbK7HeqXtBXhHl8Oy3cJ1AcTR4ECycEA3
	o8P/PAMv40d6cdHOyVUEoMJe7OEwQdxCEO74ugvJomaIXJAJ1WtNWlOS2UrkOMjf2u6izfLUOft
	3rXzAOva9AWqURMOFTILftXHavCCEZAUvGThy0p3ihbfzzHJS8UVVg3oGFKduzhDY9EzWNdHexM
	Ab0VD3fsnONjgDR72XnqGkJgCJShqJCK29dTyF2MDJm0ET51slUNMgbcL4zYdwt+faFycEtLfrh
	6O990lde22ngS7/TV1CAsnTGR/8Ox3p78PJdtqtx3GpCQbTM7gWiB8rdJbgt90IL8KB+5BKtely
	5AVdZNsY/XZQ+tnVMVRRkljHZGW2FhXr1bRAkNQiwO06MPvVqrsRUI7Tim4EOX0SSOS7vvtmmFX
	Ny+9PvOyvrQrlELOyCfUcOucQ6Sky6WR3BniWqscqwWbVJI9YVUv+UdHNfeJapo6Qhquy64E9HN
	XtKWvWhW8DSEKoV6zFn+ihFDCjy5EkxvZdmsImT7yEkpiOfYjyB3UoElPx5z+9tAIH8mnvj3Gkb
	pGby0FAONV8AfmacZCLgdHU2SfEgRpG3Cbl7bwSfYcshc9Q0uhshquDteRHtsNzLgzlSuLE=
X-Received: by 2002:a05:7301:6198:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-36a42602aa1mr4298875eec.38.1793388820302;
        Fri, 30 Oct 2026 12:33:40 -0700 (PDT)
Received: from X.tail7c3ebe.ts.net ([103.190.40.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm10796405eec.25.2026.10.30.12.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:33:39 -0700 (PDT)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove redundant return statements
Date: Fri, 30 Oct 2026 19:33:04 +0000
Message-ID: <20261030193322.13777-1-chaulagainavishek14@gmail.com>
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

A return statement at the end of a void function is redundant; control
returns to the caller once the closing brace is reached. Remove the two
such 'return;' statements in hmm_bo_release() and hmm_bo_vunmap(), as
reported by checkpatch.pl.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401a1..4ceb8cb41 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -483,7 +483,6 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
 	__bo_insert_to_free_rbtree(&bdev->free_rbtree, bo);
 
 	mutex_unlock(&bdev->rbtree_mutex);
-	return;
 }
 
 void hmm_bo_device_exit(struct hmm_bo_device *bdev)
@@ -957,7 +956,6 @@ void hmm_bo_vunmap(struct hmm_buffer_object *bo)
 	}
 
 	mutex_unlock(&bo->mutex);
-	return;
 }
 
 void hmm_bo_ref(struct hmm_buffer_object *bo)
-- 
2.43.0

