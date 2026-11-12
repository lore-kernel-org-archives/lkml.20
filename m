Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480691;
	b=gApyCzvE8wcip1xLFM3myPiznimY5fxKPXesBNCNncf2JCaci04UT3r4kyWPex7WWIQK
	 xA928v3LiORvEM/zpOWE3u/C29eEQzrfrJZn9RE8u+3p4emjfzn+qO9SasTl8NkQtkKDk
	 XzIzDrij2jbJjS4ltEcOJaE5I+yJyh1Gm5QBYZipwZK5z3eosf7PKxvKe5PQDu6SckL9a
	 FtX8OgQAlKF6HcLUedgvJQBtrIz4xs0sz2t4+0wU6YdgQvvy4/Ix966lP/KFpIDyDiTX4
	 g0A633+lszFKf0mOZ/cyfhQ2yHpp4W7qx6YfoQlGou0dEzbNFUz5PTQIGy6jtYXL2rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ei7oe26oYP1pIuCcwgZ+hnh5XI2lMWOHH8yz8N46X6Y=;
	b=O4BN5jiOo/HCN5zHPLJBaZ7PuAsB1R2L0dhUkq3ZQBmDCvXVxw7qAy/aCC5L7vTaoA+N
	 YIkiWpnIVdcZn8db6Jimutl1jCrSxoms2iE2N/12w+L7AOgfBw97dLO8H/HKJx7GKl7F0
	 vD6FzlFbzl8WjEnrzWsQZEoQE8CdV15qxhJN7Xh+mN7RfLly4H+Fv7GuTk3h+0WjnWgfs
	 rQmZGwKPxFWvgifi8XLXS5LD5DjpYt2+jrExGJMyl14ounXYYCUqdY8h3aeJACZBIYnmi
	 zJ0jyvR2vvIZoIRJr7M2hNhb4SMIIiPCI9rr4oXPRbLelLXso9jvI/odUFxQwbbGdkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFy5xjcZ;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E40606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E40606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFy5xjcZ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-372bdb942dbso5292054eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480690; x=1795085490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ei7oe26oYP1pIuCcwgZ+hnh5XI2lMWOHH8yz8N46X6Y=;
        b=XFy5xjcZMqEFdcI3AzendICQp0IX8KlL1UsJyQ4U4XEnPM4S/EQG4GDL/kJGndJoPY
         8gg4trQBY4YkH2Lh2ydAaHD+drX/dFXm83B2UHXRer4DsvKN9gLgHtwXc5MvRjBH0oY+
         3hy2RjoVcVAxusv2rxbM8yPBvZzZwlIjxDNhZiat54vDJlPvY93MNJGyDyK7VTGiy/BR
         uKPBctIBqAuZ1KLmximC9Rh+yNfBnLycm/e6IBg4Gla0l1Bzv2Y3TwXQqEfpbAnarV7x
         GtopKcFexOkD7n8dQMqEiiKiAQ8oxC2de7+7VAVi+xSju8JwMQdF5Kgh3xLtr6Ld1xJy
         +NjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480690; x=1795085490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ei7oe26oYP1pIuCcwgZ+hnh5XI2lMWOHH8yz8N46X6Y=;
        b=jY+ULIFvcnFEj3KnQsqZg27/8Pfa0DM/EEwsavSc9xEGSQ0xMA5MzqsevIgIZUyvjN
         myNMbrwaZb9HlfjB65BARpQbp5OfRsXo8QozjXBjf/uHEvDxICHQ1aCnuJPPHOHfZUzH
         fbehQDZ3Cnlk9TMGzljzCQid+kyMmlxIzQLNJNhFrVnR+sotaKYWm1zqWmKOgBiN2ad2
         8qa3iCcjfutWnBDsFuDdJXmeUWqR2VK8htuoOaNc/DvH7faCBT6Q6E824Wg8Vnm5VvvB
         914frE88GTwYLEQcahKh9SAqIeD9fF522MZILDUqQ6/qNnQtNFfNv76QPn0tmdRIz6uU
         JipQ==
X-Forwarded-Encrypted: i=1; AL+hErGhJtkIkHdyr5hLIjXjgQYf2/1DsiJ3tHO+Tbqii3yQoSBBU8rbucJjN8JpApQrW09rKZ758Ri7AiyvYDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ahoRxc8pGyq+1j5wvGQGV5wW7IWN50oUxx16ucIFIcqCeuuKP
	8U9cGljK+64MXFTgEcpq5YwoGYKuPm7MLQyRY0tM24DI5jtLIGQnFFAs
X-Gm-Gg: AYBFou0N9RmqsiPmAImhI2u3yqFIjrpbUFQZ82UkOMJUTCaisa/Gk3HxnFzgMnfdJM4
	JroTmfo/oFRmaHAh7XC5PAqtwW3RDEZvr13U2fVU5Ms1ho7Rz2Yr9faIGcgr715++kn4d5IKEAE
	dWI0l1OKk/ON7QgcFU9cm7Oa1pWGbIm7edl9LJjJilFGIHuY1mbYCtsAG+0b2db+FdLUWd5mvuK
	Qletud1XzseUgJ9arGZV3pQXZb4UZgr3qxGKBSPaVGSSgT2oh4aoK/5VnHag3SyKc6wRo47mPLw
	RpkbTPw4U6wi5v7ZzkwZGiXdpSiAnG5Cu4ZG1Lbfnt3AYQ5kpkyjdZ9xk+i+wzRob1fxqhMYnFd
	oR9n8IoqJanqhVtp3dRFJpQsE0Tvj5E7gJHodARW6RgQFw/QE/5OU2OZfyw2mE3NI6YiqSaKzRO
	LKBFUORmhFW+/gAIAe70cBYtpfZ6MNqYPWjLGWbi4dB1MjSXY8oyoMm7Et2gq17ekIEVRaZxvxj
	jBvfGExL5t+kExEULEZXwkcjbNKLQUGat1dvyP0Vo5EsuYfZoRAlgkHm3J8ZSdI9M2bWNb892O3
	N/7YwK7BanVg/gujw+0pyuZVCebScjabU9w9rd8wpFjqFYvhsxaWsHWXHasXWOwnW4nRDLdIQHY
	TfvZ3eGg6XO2T6x+TiQTkbzzfYltHsiVkP92t4o2MDoBB
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr7982100eec.10.1794480689606;
        Thu, 12 Nov 2026 02:51:29 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:29 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: fsl_asrc: Fix probe and resource management issues
Date: Thu, 12 Nov 2026 17:51:11 +0700
Message-ID: <20261112105116.32274-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling and resource management in
the fsl_asrc probe function. It fixes deferred clock handling and
runtime PM usage count, ensures the IRQ is requested after device
initialization, and moves runtime PM cleanup to devm.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: fsl_asrc: Improve probe error handling
  ASoC: fsl_asrc: Fix handling of deferred spba clock
  ASoC: fsl_asrc: Fix runtime PM usage count on init failure
  ASoC: fsl_asrc: Request the IRQ after the device is initialized
  ASoC: fsl_asrc: Use devm for runtime PM cleanup

 sound/soc/fsl/fsl_asrc.c | 92 ++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 41 deletions(-)

-- 
2.43.0

