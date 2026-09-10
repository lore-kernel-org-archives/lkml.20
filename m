Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126A44D00D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036587; cv=none; b=oLAbXCP/uGOpQ7PRF9hkUtpOO08/xbDIWYZSnYa6gWUQ6qF0dupfCs6RL/8kw+wgataLXYUtJp4NECdXex6z9JKq+FPdgBDL9s7SaQDMfjsx05ZBcHS/NPXXzA1Lc4OUmdgRRAvl4zKMEAgALCsNSc7UTEIjjtGRWJQPNUpXSVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036587; c=relaxed/simple;
	bh=c/awOCqUccuwHv1bu6mH5ayUSTzx+jzCTlB1GMYOoSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UolhoM0bMY8A7llvva0d0JeTOkDvU2g2qTwxz3wZAoITUjZabS+Pt7rD7RlTegZsKBtc95ev8mzLuT6GCnWCIXZmqou4HGVE47crgrToIYzYALsphZqaNsp6k8VKHLTvg/RQji6N/h6tHHM6iMtz2+svTKrGT9n2/1XeBZM/1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5Ztca64; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5Ztca64"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso15384505e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789036584; x=1789641384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/awOCqUccuwHv1bu6mH5ayUSTzx+jzCTlB1GMYOoSw=;
        b=h5Ztca64mSFji+xzYHGuILjsU+vsuZBcidj4JpnnKbeWjStzrlpWIvcsH8KtFJPyug
         nFfw/KPsXNnjrGBsT9bbHvESO5EeFU7qlIzfZQZImA8gTQJI8B5GL/iXCIBU5UY6AzPG
         wzSypiTAWJuo95phyampBpj/0e8EADBbrAtXOqRglSdEZFqFzMQjQ766Mg2vqe0vE3p4
         7uksG4+XcoV1N8oR0ubxYGkut1BhSoYt8occbpJ5KZqE5RihERFOCz2MrXalgn/Kv6k/
         axqgDu/QSWsl7uCwB/eJtaBV4z4NFBKzy9V4zpuimOMYDfcUCRrPtGiMGc9hh9jEKpUQ
         d/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036584; x=1789641384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/awOCqUccuwHv1bu6mH5ayUSTzx+jzCTlB1GMYOoSw=;
        b=hUDZRr1PxPvrp8isDA/LssiK67Xe1aI3ddpalCoCrPasb7htJI4tKsTCDzc/s30NeD
         cIO7ua3IkEcKYlQOxRm0dzDXZciM3+rIZ1FdV0ZlhqVJmg+eK2aH5W5MpwRg99TDuYIv
         /apKb0K05nkZRFV0xEecKNuoBZTNqPI9tvgVJf6o9X0q/jZz0mLVN7kk7GIXbIbUp87D
         jlcjUZNwyV6gVmegqskHRj+JK/yCbokC+s93+v7C0znSOtSGqaf+qsnaoTwzfCrru+Zl
         0ulVb1Gb1j7rncS+4fv1KdBdU4Cuvh6ui3aB+mbzSXIM0nB7Jv1DNMKxr/ApgmVHs99W
         AdXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ5O5I9xtzUGzfQG0YJm6WJPcR9Kf3FUbGbVkPLtw/Mz/p7CZxN5zkUHsbdFNcKQHWvq6QEzEFq++iY2g=@vger.kernel.org
X-Gm-Message-State: AFuF++l7iP0oUuz8udmUzGo2TbCHX/uoLEBKwEI8IXGvdHWTE6ZzVVB+
	P6YrgLpAV4Hm5IrixlNQugT3TwFyy3WU2Z6bomGHib6Ri+vIGGvqBu6T
X-Gm-Gg: AYBFou123dq6kk/dW1oRL1AnPRxID9zhOl+0P/y/Qy2ssI55p2SEUQOWlyxvvP1pZ8z
	El55tl93CqAI8AcWspvTvypv+u/1wvuxwugF0IPeSvMDvk8G7zYFEjs5mXcJnlkA3ARvJwCZ1pg
	nA3U+RcjQlKRXpa2qDIJ/fXJlKW4cAjNVy8i4VW+ExBLUXHVMv0Ge3Ujn2Kc0Xv3OyLgrkh6B/D
	jqCrRBAE4X69f7AZ2PTJ19+ymD3vFDCsh/U1y6l7SBcjv7+UeJKkZz5ZlWxw2PivdeG2//dxrQZ
	b4iEu5m+I5HHWf90mBg05wxZ+gQH9T/uFPw1liNTKLKCDJvjqbJwfJDt1iJAQSidaHJ3geBX2nS
	2yJomp2jrfUqU+QPTUHbuOvq53k+fXkJDc8+5WOsGxvDU/2YThsjBZ2BqVs646JW5soKsQ3AC2b
	fwcKGK3nmTo6NWwalSnkXOj1HfEsKJRrjqTaCrtxyUV2MGY4OpWAzAMrayaAg/8QCM8/kG5rMug
	ylgqsOwW4ycrANCxDlWREE6BQJh8jGezUd8s/tcSDutYvuGrYg5Ot3zObeU5Bcb
X-Received: by 2002:a05:600c:638d:b0:49d:2450:68ac with SMTP id 5b1f17b1804b1-49d258dfc8bmr142550555e9.5.1789036582306;
        Thu, 10 Sep 2026 03:36:22 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb04f1esm103415165e9.0.2026.09.10.03.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:36:21 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Thu, 10 Sep 2026 12:36:02 +0200
Message-ID: <20260910103602.19228-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909203717.90605-1-lsa.uz@pm.me>
References: <20260909203717.90605-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have tested the three patches mentioned in this email in the linux version 7.3.0-rc2 in order to test if they solve the IMX681 problem

##DEVICE USED
Microsoft surface pro 11
Cachy OS

##WORKING:
The camera is totally functional in apps like qcam and firefox after aplying the apropiate configuration and installing the IPU7 Hal and bin of intel

##NOT WORKING:
For some reason, when i tested the camera on gnome snapshot (version 50, istalled with pacman) the colors where completelly wrong (the whole image had a magenta tint to it in addition with some horizontal magenta and yellow lines and a diagonal line that went from the bottom left cornet to the top rigth corner) and the image was inverted

##MINOR ISSUES
all things reported here are little details barely noticable and dont influence on the usability of the device
- When exposed to a really bright ligth the image starts to gain a green color and blue if the room is almost devoided of ligth
- The cammera has some kind of "Snow" on the image captured
- The image captured tends to be brighter than a normal camera, this error increases the more ligth there is in the room
