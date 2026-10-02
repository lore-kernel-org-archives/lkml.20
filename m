Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F26C4CDDE8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952294; cv=none; b=rNIhLPj+GUN9FieZsdXenHGrVgjO85IkV6O+n768jZlGhAoKZ8JJX932KmxtEYzKAxuuBrcf5abb4jg+zuWAEv9K9VY5dxxY71zFnZdSaaS3OdlG3uADZTgZRMXnvph+kBA5ir/QGkSC9W+gQ4Pm9AG+0VpLUU3RKpZ8QYfXpqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952294; c=relaxed/simple;
	bh=GWsyH6hBcwla1pNANi7ebFerp2rnqJQcWaAcfk29BGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtiQ+UHd2hvj0+9nzsBG2hGT+uxotoaIsxoAhL4nDrYoieHxm9JBMsh2rh3NoKXfwpsQq8LXt3xg9k8yH1j4TYfdLHSjdyfQw1gt0b1XbRMd6OzHtZLmqj0FYL4CEJp62oz4YNwryEtWCZfZjLxHqEfA/j2HjMUyw8X1UqBt0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slKklJhJ; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slKklJhJ"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e23be09baso392772866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790952280; x=1791557080; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uhe1kjp0ioHVkkyq0x9skUJJmlCnM0ROQqvDHAfjDU=;
        b=slKklJhJ5Mz6JlUDJdZ5fjGNKZmbLzqI74q/KJYfQOjhfdNuN/HwC9mIMI5iDGEmhK
         O4QG+kNT4EsbKM7LxMbDmhQzoATYtWNxiHOY61sou6d8YfJjX/K9JsfQntKThWp4OpJh
         4CtbnKNprEHRhDGhquanFs1fb+Ir5CiQEI9Z8cci2oTpX8M/LmucUv6ySnNPzoyW7Tjw
         aqVi/QktktXF5lgLaZko5Ly/06ucSOvx1TuZ/Ik3u3T1eBj/sx9TLe7RiNTW8p9fJyvB
         Rv1ZLfXJ1YaZd4eWr3uWGCvaSMK3x9OwLoKs1oLw3S5boEGHTxE0yF2ypl/od8MduYIl
         wZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952280; x=1791557080;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uhe1kjp0ioHVkkyq0x9skUJJmlCnM0ROQqvDHAfjDU=;
        b=IA6KwUxnzz/cYgqc9dEo1RjiHL+idCfSZbs7oyOoiEiBh2iTaI09zaimdZHoOrMMVf
         xogzSBJYNS0iMU7OePkeXT+YwZUtryUHX9bbjgmTd+6vOMWm8hcB3s9DabpbqLigzJRG
         AFm3M6w8wk06yDrcRzLIl/OMAx862r0pG38g4ojMFKWGPObZ5sQp1ubvuH2AdIxVrq+d
         +1yohZ46g71rBmHJkOcvp7FEmMYWkvEnIy4j1bKs6sOU0A5R4de4yVHneRgwmOgH5EKZ
         LlUo4t/k3NSug1YVeo2r2l98SFGz3SzVjwaCYNgkpg8ublkAdv5xClIcUbITJ47ViZ/Q
         Ngvg==
X-Forwarded-Encrypted: i=1; AKwUvBygffoD31kHpH3ElpC3/Vuu/KvNdhohqz4txGoZxZYeIVV13C6sgjpKHQpsg7pmX8UE02MedygWSVcD89k=@vger.kernel.org
X-Gm-Message-State: AFuF++l25FfakarFT77TCVcY4TElh1FQfaeE7W5S8C2GYI+OZlctm1oi
	5Cr3o2iE7wmL5ikL0YCgez4BsRf+ZkuMkGeA8bCUN5rpWL/QN2ubP1Aq
X-Gm-Gg: AYBFou1O2bAv2QCPqG4kzZM/I98ZBSMDH4PcUs8XHq8ZH4EtcB8m7mmlamFCc6rowKi
	QUPdMR5HnhG84qGJbSqp8EeV/yTeis5BmMHuLMnEXJ/MZJImUf97QiVxmC57BP6LFXlsK4ORM38
	+ZSFtJTGyVtrz3upMkxHXpszilpXmiYticNmFUeb2MQbJintRuR8SPdB5dNBxEsHHXqZm1S2ZrF
	4O+VoPjN2qDIZFLczoB0ztJtBncl64Oi1C9eXGyXXGpObZ4pBQU9EDZBJXhdIXBdgu+YqUk1dpo
	Vj0ikqJSydH5ud8w0aXzTHA+OjK6yAijhlXE/SSEOJylnSmMnIdjmupwOZYYAa9n9CikyeMuLjt
	rzuUrm6AgcaflUKidZdD99s31KSmAxaRC1p6/cril5K+9PW/Oy1SU/Nxr6BY7VYYZE/GVTOszr4
	ppqCZoDo6rQejPHetpRcbYc6DChdMzIrFuF1qMcZiqyOEOfm75vIyv1Qhxy76Cl5l2Cms=
X-Received: by 2002:a17:907:9346:b0:c2e:4627:285c with SMTP id a640c23a62f3a-c2e4ad2cf15mr246398466b.21.1790952280011;
        Fri, 02 Oct 2026 07:44:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa6dfcsm92846166b.72.2026.10.02.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:44:39 -0700 (PDT)
Date: Fri, 2 Oct 2026 17:44:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Peter Huewe <peterhuewe@gmx.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] tpm: clean up error checking in setup_ring()
Message-ID: <ar_DUjuGv-9vPzga@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The bind_evtchn_to_irqhandler() function can never return 0.
Historically, IRQ functions used to return zero on error, but then we
added an architecture where that was a valid IRQ so it went from being
an error to being success (but in a limitted way, just enough for that
arch to boot, I guess).  Eventually we removed it and we will never
allow zero to be a valid IRQ again.

The problem here is that if zero were an invalid IRQ then we should
return a negative error code but the code returns zero/success.

Change the code to check for negative error codes so it's not question
of how the zero should be handled.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From static analysis.  Untested.

 drivers/char/tpm/xen-tpmfront.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
index 3c0cce57c4ae..731444eac5f2 100644
--- a/drivers/char/tpm/xen-tpmfront.c
+++ b/drivers/char/tpm/xen-tpmfront.c
@@ -266,7 +266,7 @@ static int setup_ring(struct xenbus_device *dev, struct tpm_private *priv)
 
 	rv = bind_evtchn_to_irqhandler(priv->evtchn, tpmif_interrupt, 0,
 				       "tpmif", priv);
-	if (rv <= 0) {
+	if (rv < 0) {
 		xenbus_dev_fatal(dev, rv, "allocating TPM irq");
 		return rv;
 	}
-- 
2.53.0

