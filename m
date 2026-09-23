Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA7B488747
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159437; cv=none; b=mqdFj4E480X5OCeu115uHjfLDdz8nTSDk74kFPMeI2SY0t6QgNEEv+AIjQxYek3MwVA/ou6PHYdwqbaBQA+B53+f6Fx+cGh/zulA8BM6LF4r8uvFHj+oOGswfOkH5MsqY4k2Lcnbk9vDKelpKWwxWv5Y8IYCHes4pAJLtBQ3j3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159437; c=relaxed/simple;
	bh=4A2rVpCglcElPTI0FX/kZ2D+r2RLsiom+HOo0azm9N8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sKOziio133cLVmxtvTzfFzkXrZjD+w32OVy0zAObCootp95QSJDfmJKyE2DcV7dtPtGGjCZYBcX0S6RcWMAAzXCYTaAypYHytpX+SUlgPVMvHEWHdMdO6F1qcWOlYjNv81eZL+cZbbBh/aqqQbs+/lQnJH1idWnvF9AayynyJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFfhvlb2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFfhvlb2"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8633a38df87so362990b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790159422; x=1790764222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJQcE+RNdWTQ/Zw3ZZ29eF8rBGAX/7jKIXho5Hbkepo=;
        b=BFfhvlb2YkH3g09h5WLKDhAtqLoJ8CVC+uUPhVIx1QFLiUIfMAkqttQJc+ZteSS1QY
         ggf79iexq7eT7FdAFJ8zJZQonnPRm09xH2dSgkwcEsu0HDz7v7a7Vtpth5wr83IusWhp
         iBlc5rLC1cyneu8QUKYgx0vDSCkXCx4qrhgQ+tvLGjyHrJmtQLt/C+9PNQ6OS01XaKOD
         /hJrwFdR59ESMo3ZUa72OqZ2XHZRLHVGAwN3v2VW/KnY+1UpHGepu7x18ywm09xwfF/h
         OM117WKmsJMvSLq7SyVKQdiXq9Eyeb05KNVmIw4rWTuhN04OKbguUwz8G/UoaobFnVIq
         CYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159422; x=1790764222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJQcE+RNdWTQ/Zw3ZZ29eF8rBGAX/7jKIXho5Hbkepo=;
        b=eiY+Fhvwjdcq9fRfFXm3QYTLjbcShJBe8OAI/CQNxYH+38mzHdQCYHBELJKqYgAjIm
         NGSWMwZ4K3+SwN3cmDf5YEVbK6jSDVZoYK3psqQq6CZ8bQJiwBpk+NIziR/y3P/UzyNW
         n7jZ3tuCMKFFaNQyN30wYa0fsMCk3S8C3rEJzVAyYd68f96I2PDHM96BQny9tCab4OSZ
         IBe+Rlp+WV9JLYqGRAFeTyxEnL+N9acyDhSehHRJtNrH2s5I83X37z/4jdVA4YFt/VQ8
         KpeFX81GQdzqqbMm5o60gclpc9p+y6hkomptqMJi+06pKzfy+H/gtdTaTMVQ+S/c+gSq
         r1nA==
X-Forwarded-Encrypted: i=1; AKwUvBzD97SppIGjgQrr1Z/BM6qn8sLPHKKdV+gzJO/Ea1H94N+Wvw3DFPaMclPm2+NyxB6szxM1wO17Pn3jkMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nqGj813p8qZ1Nxxae5I+vyhO7xfthENQjEIP23HTX06SWLEh81
	8n5YC9F74pr+qhUUlAc0pxNueotVhozSHty4M+sYze3cZuF2IN0xahbz
X-Gm-Gg: AYBFou0oPgKL5YSkgyO3vEQWxaRQJntcfiW2qBf2X4/x1GGQTiFa93bULsOCTSpY8e5
	hcc3+zP9ns85ybOTzcLUgCmdu3aMvmXkf1CYnWBqKG6X4VzZILEscbht3N1kwU+jPRLFliN5jYF
	/Y+SDHwKUOvyMob7ghXMfevo4yVxbzfwpgM/XRzrmdDQv5Kua9pTIIQEYEIXD6X1aQdhIScmIWn
	eL0ufz/Xw0STAFanTNEi2WDNip5oiqYBaz5DHhSDRZv4m3qkRGW3xT6MOuJun7UtZAl+Yd0I9Tt
	2+0GyJXwP2wO08uWrcP0g1c50WqohYx7pc65NRNHY0MniNDOx0QWRojIH7r7szUDwG/fcWVfpmJ
	dZJgg3f2JUPq+jRAGy2D7Pgp3xQqxwbYau8ZV602mpdL1M1gybnR6f0QbSOVIj3Zx3TLiIwgrA1
	jxLAJZkFPQAwjEKNgTvdDhu6tVhuXN5rmvp828Hryvj2E6FWn39ReNIMp+NNjz9IiQGgxUeX87V
	P2tOyyJysXmjBPM
X-Received: by 2002:a05:6a00:1489:b0:86b:b308:b926 with SMTP id d2e1a72fcca58-87d1a2bf425mr2002629b3a.14.1790159421340;
        Wed, 23 Sep 2026 03:30:21 -0700 (PDT)
Received: from ROGZephyrusG16Air ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1f21sm1048685b3a.32.2026.09.23.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:30:20 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [RFC v7 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 18:30:14 +0800
Message-ID: <20260923103015.2365773-1-nbg2974@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

v7, as its own thread, addressing Lee's review of v6.

Changes since v6:

- The driver moved to drivers/leds/rgb/, where the other multicolor
  LED drivers live.

- The series is submitted with git send-email this time, so the
  patch format is the standard one.

The SCSI device handler attachment is unchanged; why it is a device
handler at all, and what the in-tree split should look like, is the
open discussion in the v6 thread.

Everything else is unchanged from v6: the hardware description, the
scsi_device_handler that does not claim the sdev, the multicolor LED
interface, the protocol handling and the known caveats (manual
attach until the split lands; SAVE on every update writes the
enclosure flash, wear uncharacterized; NULL-parent LED registration
to avoid the sdev reference cycle).

Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe
    enclosures

-- 
2.55.0

