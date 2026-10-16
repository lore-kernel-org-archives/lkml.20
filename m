Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60877335564
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158582; cv=none; b=EYd0dFZL4+j8ulSdoVcz0RjjxxTXbb0bQ/DVYTPL6LcdXBBQpRiMdcvTUSc6BnFjA+nfFXYq5Y1hsQIIyZc0PlpCtq/8WZ9AM4LqEEAnDV/Hx+4rytKa1TuBfgj8lVybSCwQalvKFqG02ED8j9282q4tbtL0KE8iQCprQ5VxXP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158582; c=relaxed/simple;
	bh=1mrwer+9rG6x0Ix2L4QYhOLb2chGH6YfSMQHz63yd7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDIjh95w128kALFq19blm68RieXD4s7GIAuYZqoPyK7gM9Z2EY8x0ZVvE4/2Z96JAMcTS4hvRoGLEpvK+Ifbr15GFBB0GYa5XfrysaXwQF921eew37/LEXvARJyw/N8GkFba39Vtkv0BE5G5ikkPQu4Eo9ypTQ5ewGW3S7f9zNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS491+zp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS491+zp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1450048a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158581; x=1792763381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1mrwer+9rG6x0Ix2L4QYhOLb2chGH6YfSMQHz63yd7A=;
        b=XS491+zpHe1tiZ2AUfBW7yKbzxJJyx8hRpBkNAknvlpuUNEjvKNxroYak54OtndkhC
         ccfxlCTspn8ibW1EJYmyp9u3KDRgmkG/OTgSRanTbC71pklGt/SgPkqg9CUr52twqrbu
         lKPtkep3T3I/gc3D65uco3rQbO9ClIJIzRTx07BBKpY1rvGPQlk8drcyEnZ1L6ny/3fx
         XdEhpd0Xq5ets/I31yGBiYDjpv6iRCt6cMf+WacxpW4FwTqObjwLabxXzOEgeF2P1BGi
         1Pn3DBXFaTxVKaQM7DdVyHjwC7s+urSMrJ2+xg8uf4XcEP1pry0s60cBCcLtPNgvOV/Z
         gLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158581; x=1792763381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mrwer+9rG6x0Ix2L4QYhOLb2chGH6YfSMQHz63yd7A=;
        b=lwf3pgsAfB4zgcI83NOq/XBei+6y2eXo6fhddZD7gFe8wM1tn+ptutNfMAQ0KBPWjN
         u2Oir6GEIDT7JA8LcIlly6JkD4pUBbL3O4UvyZMUl7ofKonb0d4v4wI286InQ01ANotf
         I0CNov1Mng+UC2ticj99coNrXis/tYQKrGDuC+SSEDje11WzOGL7BrCdFwCCanwCV8J8
         7z0IS56nAzX1K4RJ6fJn3U9Q0Jzfhvy2GIIoAxdLy/Q2RJmpenvQ1WGBpnFiGPJBriWg
         KAc2r/b2yoTQFscg2nBS5DNsd0EItRAbO5U38NJPomjyaJNLY5c5FtkahERzMHaQN5MZ
         /dxg==
X-Forwarded-Encrypted: i=1; AKwUvBwVsa2pJPQyueM8K4tO6MwR9/wWLyl54qziSXHk6EcTw4LAM2NVruHblJ5diBZr5ye5keOscWSxOEndtbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlhmn3myneIjGdGHiBVvOdnKuaZoFyj1/9FEAh2IEe6iwx5lwj
	N1VdEvYZ0ab2Gk5A//tvzW8JXXPUHbaiGR+gYv3HkULOBiMHlePwMC8b
X-Gm-Gg: AYBFou3KfbjrzDVPrhk4VaFaLWxKYcpg+eOVBK4RLBTzu6Ijy/sFnqqUxmMDJEg1+Ec
	77aEzQ+7t9HIJHo/uQk1bbl1EKVSu/axwaCzPnraGHPNgZEYb8z968/VInUdox8dD681B3teOCc
	zjyh2CmPf6qwg8ObrfCnL8Zlb8Bx5x7KMh7sbN89K3secCBGfmnkNhwHpPXe6cYPpMLWlV0VOSB
	J8SiH9Rprht5+2Mvmhou/ETPjLvGtzFFhoMr03dv1nVW8z5YIMdd22g23HJKjbv9kXLzCbV1G45
	rSDUD14w9Vl/ZeyuGx2mfDshtEVLaX2BPAIcUTRcmO3lWwDTR8M6NnkrmJH4ipeXpwyfBdp1dCc
	PHHMQ+1wUFtkKTZT71Li6YXfsqN9LZ6HyafbHVKUfvO9pbohae8ciGEsXfAmjiE3ZGBE4rAN/7y
	KHZ6zqPS3sh+IRLvbCbsGf73Mwh/FIRzBUYAy5Kx3Jv2vehC9javw8wtul3qaH29aG5+Y49Qpaw
	bXYXZpmz03Ao5F9uVCWCw1baCaaXj/D9tKdX61Km8f7vQUEDkYpOA8gkb6VWU7ztTl/WUlo
X-Received: by 2002:a05:6a20:e293:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e16be7214fmr19585384637.42.1792158580457;
        Fri, 16 Oct 2026 06:49:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1467:1666:71b7:b993])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497fa3fsm1142333a12.5.2026.10.16.06.49.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 06:49:40 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vkms: Fix kernel-doc parameter and member names
Date: Fri, 16 Oct 2026 19:19:19 +0530
Message-ID: <20261016134933.35084-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261016101534.14179-1-sinha.aryan03@gmail.com>
References: <20261016101534.14179-1-sinha.aryan03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an accidental resend of a patch I already posted on 12 Oct, with
nothing changed between the two:

https://lore.kernel.org/all/20261012154449.42015-1-sinha.aryan03@gmail.com/

Please drop this copy and use the original. Sorry for the duplication.

Aryan
