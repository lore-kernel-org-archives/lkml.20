Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF531497393
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993763; cv=none; b=aEwtPGkWr2fF3CiORC6h4C7F7oAdwZxiNoxfoIMgBqLo4LhFKJspXrdVKQIhtdFNJ+2uvFhnHL291qeeTxNrohvvAqxeOIarEv5eXCykcnYpfuzyh7PlJV8eqFL606zc5J8RYGlnYB7q3HdnpdXmCUx2Y7CFuEN6wEsNibQC2eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993763; c=relaxed/simple;
	bh=6M9FazVj+DbUfCbuCmYOiI1XUvXHH6T+s1r+rcmuMfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aqjjKDwkj9JSz2PsoaOE3Kr7TmxQ1r2ciOcd6BVJLksITSt9rLx8Q5GqdoNg0NZiqh8Yw+90jTwINRPKTYUMTtS/P/ny7+I6EJiK2XXiNdNftvg/MBdY4kJge9nkNXZXSBgC7hNOpywq4nFOhHdmW0NkiWEXT3fn41Y/cW0BKd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMMf+yKM; arc=none smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMMf+yKM"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c29390fa872so193093166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789993758; x=1790598558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnd9DS7i3eXzdfiPj8lMjSd3o44xvRHY05JJYgfAitM=;
        b=IMMf+yKMPy7tn4H6dvsobgrtbbKN8dXP9JmdL/oqa1Uumk5kBT8qTIF/xQ1Q5PY55o
         ubM8R0oodptuezvx8aFXzwlW/tUU8SK0YT6RHMJf6cjfK9RPXStY5G+2EmXZuGI3w0X3
         M0z5/oqAz/j5IiXNP/XMlyybDKCufjIT4Azrgvwx4OuII0a9EnUCF2gbxgNi0D/Ug26b
         S/O8fwWIB8K0qn6ZLLCy/rw0MgA3mc/Nw+6K2VAkBfVkvy63gaZvvFmSz2SIvrx58RHr
         cUX3/DsJIK58G0dOdP5YWdw3TwuLrIKD/FEfK4hYtH2WkXJz/0CRPHL7GkptRNQsp55a
         sjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993758; x=1790598558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnd9DS7i3eXzdfiPj8lMjSd3o44xvRHY05JJYgfAitM=;
        b=WWDK3AzqndFsY06EOdpnIGuzLvBmJdDw3pqHgNghzFBHMzrYpBrdP6SkytaNEMg04p
         PjUT8sNPdyYHM/qmMEeVY3wwsMVqjkZRMELvKyuRIQ5WYJ7uRrmrBKgniV/i57ojmCpF
         9wkpx/8rICCiDMxrZ1qXdopJpAQaVM0VlKr/+2WWGIu4HZ2QYtm3p6c+TSoIqJ+dFdII
         keTy8lSiWxR7gTLk417iZVz91+9VLSTCWSNX51vFfg7Y455FmyImBRs7rlrrs3MEa+4S
         8HV+S+lJQIM8Z8BQ3D9yEnM7R5nCVuYW7vG+QwOKonN9K3nZiMnht4UCvjNazQ08h0IX
         yTJw==
X-Forwarded-Encrypted: i=1; AKwUvBzgNuWeNE5UUzAGOY3/lrv+dbbk8GPJvcoIlrBrECWFRHAIJASIiKoSBmhlo/QlAr703iz8l6NmIayL7v4=@vger.kernel.org
X-Gm-Message-State: AFuF++mXuLoxcb3P4q7ZRCFBtiCbCoOfbiM8DAvXnWMvWoRj7isB9ird
	x3EjDuqjqXmt64HS1JyYG0CVx6HWLp7KzdVUHB/CCnw3tCgjiYrO2cC1
X-Gm-Gg: AYBFou0S9HdeV5sldxlo3B09jeaVhm+ldJ7IEcIBrOd4Ewyf2ImakS1NujLtQMv2+VL
	6Z9/Shvn0ll6ZkGzSIy5q4rSk84N+rFQ0qJVKtb7tggrKoksehZepGGk2Zmw+HF7tztnDR0RwpF
	I7ce1tWJhl1xs3BbextZcwl09MGvUWZvRiJgwT0S8KVCz3loPfjys3+4n7DUzRpChXq3niSndqi
	Z5CpjpvIhy77NaolMjQOfCwxNHX99SJ8AbD0PyVB1zpmn00CmIattNQf0CcA80/7khx8HxXsvHn
	hU9OHthnSpM5tqGrvRWMRso92QVPWzO+1vlur8VzZie3dwPTVBaBk0jRd54EbrOYpoIcGx4sY92
	3F3vYntJgMTa2k+ESU+QWxA8+RkWAQSNzHqNTjbM6z/pzN3E8zbSU2v1AUajv7W2HZvkd8KsQ3e
	JBKrc01ruuEHdBfceHNc3i6l0Q6wRSnPgtT3D4QX/AjUzdsL3i8OII/1qO5LKgcN9YCgta009lP
	0MH2A9uHM6uoKvD
X-Received: by 2002:a17:907:3f9c:b0:c29:3711:626f with SMTP id a640c23a62f3a-c2a15aeb6damr863923666b.24.1789993758165;
        Mon, 21 Sep 2026 05:29:18 -0700 (PDT)
Received: from gbox.chicasongroup.com ([197.210.105.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358d32b9sm298863066b.56.2026.09.21.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:29:17 -0700 (PDT)
From: UgwuRhema <hikarialiyev@gmail.com>
To: johan@kernel.org
Cc: UgwuRhema <hikarialiyev@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: gpio: add comment describing irq_lock mutex
Date: Mon, 21 Sep 2026 12:28:43 +0000
Message-ID: <20260921122844.42816-1-hikarialiyev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a description comment for irq_lock to clarify what the mutex
protects and satisfy checkpatch checks.

Signed-off-by: UgwuRhema <hikarialiyev@gmail.com>
---
 drivers/staging/greybus/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 12185f7a9..7f19b3275 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -39,7 +39,7 @@ struct gb_gpio_controller {
 
 	struct gpio_chip	chip;
 	struct irq_chip		irqc;
-	struct mutex		irq_lock;
+	struct mutex		irq_lock; /* protects IRQ configuration and hardware state */
 };
 
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
-- 
2.55.0

