Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937C483BDA
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206379; cv=none; b=UGz2wVl78Pro/JDztk6+EIKAI5WSu4zF75ldaVgeUjF1P2QEXz5OszlZwyrFGkxIdS24A9KjPnLNsd+kmasVnqHWL92vR1IQTp43+rQyWKc/xHRrfhlIAN/D6UPWO0EnCWGqliaXR6LNedGwWyU1bDE9k5rmARpMzFhx7/inOcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206379; c=relaxed/simple;
	bh=TQcDEPHQuvk84dygC2jHVP5lgLPf/585eQhSiS8edoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTJ3ADaYmo1ZA4PBBFtxlGSai+2ANkcVbUn8tKpuVYHEYxOCSLC6dL0JotA0QWz4bl15E1UWoXq5d2mYnFMuACkrBsVGl/g5QI9lD1aj0vu0Zx2NLEijkElkulJm0F2+IrbPyiwilAiosdZVX65vKzJS16n3qHVjVtdzDdwAS60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJAmhuD7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJAmhuD7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so11903485e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791206364; x=1791811164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wj4EfSjz+wE6HqQ6rbJ3B724HNCWPLF0koA1iQ/DmgI=;
        b=eJAmhuD77LTYfwcP1G1vMymdaHJXSWn0JkFJndmgvGbbl+PUF48UdnKUsxJ0PBy44X
         Y2mLX3ADVkAbJ4l6lfiVLVnyOQ8i4L8Eb9GYm7tTHj5WnC4YXybkEpu2SEtQOqBDdJr+
         TLH46XeWV/nD7kXIAqopqxHV1yo9oNwqV1z5ZYMo3IT7R8lePqkqj7x6dY4PauOvzNkC
         5vmEJgyG01WjHokL4WR3YDKp+fiKzrgawHeOX29pz3IzK6Umd5ImPn5G/ZVAlbkDLpEt
         vbfE3/32OxU7sn4+Zyig+3AJ5I0OLilQkq9kVO6+kjiZfI5jEEl4Sg3Yltb6JCj+9Tlh
         DejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791206364; x=1791811164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wj4EfSjz+wE6HqQ6rbJ3B724HNCWPLF0koA1iQ/DmgI=;
        b=NdimINs7xWtNpuD6TypAt61lvLGnn57ZZGXylb4roZk4qw/cSsN1VQVC5PwkMqUTBU
         AdasNmgX1hUYfiUaNRQpeZYFvZJ7ViQLD+gNw8eULtfIBJp4zlsfGMXA+MrGKDsmm6i1
         IFNEDuYflCnViuvy6iJtHdUjjJy6nwYZPvw6QYGOhe3rupN6GfWzwmLFCtwHWQF4nck9
         BEMfN/+nX3a5xgzidIfGjeLN1COgg7Am7a5Ia7s57rpZ79JIUdY2vTjjNeHYIYZj+C79
         ayplJ4+pOfLAMeowZn/PX245cIxCg9skgB/D7jVS7WiuA47JRmuWGqcjHuWOTz+dnZnE
         AkrA==
X-Gm-Message-State: AFuF++nGFMHRqpgaBvpCxvYuWqqo8bJu7GwNba8ijkrqOJClpQmuHqru
	CPpPxu5n5pbPKAD2DJxdI0c5zxaNayTs8UgH6U8BsViUCBdPUvcL6OZT
X-Gm-Gg: AYBFou0DBKoI4/dzKOWvniTh5cGw1IuJfyMdExf6U3+y985mMdlxq9duN8F+wK4GqOY
	HNYTAmEe28MiVGOiJTqfw8C9xs0Xx0Nc9gxv8HUz5/Hi6s2FlFEe3D/8k766zJ7z4n/0BHFD9CU
	CSevDjvni1htjNHVVbOoMPknEf5pmpAEUsFYQELS4Q2VPUod55nI/1op0q/q+fXEPTG8w501Zqo
	Ibt4pNi4+n+zxSUX0YYJY7gvocmenzwx+JU3SZjE640ELbr5OtXrZqiTp6a9d4dzsiT6XQhUyLH
	ynRI+ewQCaZ57ZjXJvKQ84o1/qBPLJ+QCJPQk3FDHpOq/VolF49JCPD8hnZEDGvku1hQE/5O8Md
	HVTjDSoaYydu+2pnAvsP494mQZrZEDuNMZiMMuxj9FJ/NEoqEE7Nluv/uEK/L9gvMxhYFMOJEFh
	IDIJdJtqiECbt/afwN2HTbq7ZjrX0JIalqVl7NBq5y2xkX8Qj1+N1T87EyS/N2MM1hS18ALwN+S
	/CTUM0M8r/KEa7um52kklmBG4WbICedALwuZ/4+/KFaoF+pqI7g2XgOLX5L5Vw=
X-Received: by 2002:a05:600c:c16e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a02769ac74mr172330855e9.35.1791206363598;
        Mon, 05 Oct 2026 06:19:23 -0700 (PDT)
Received: from nuc.fritz.box (p200300f6f726f000fa633ffffe02074c.dip0.t-ipconnect.de. [2003:f6:f726:f000:fa63:3fff:fe02:74c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16d6295f9sm259642465e9.14.2026.10.05.06.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 06:19:23 -0700 (PDT)
From: Johannes Thumshirn <morbidrsa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Filip Jensen <dev-Felipe.Jensen@duagon.com>,
	Johannes Thumshirn <morbidrsa@gmail.com>
Subject: [PATCH 0/1] mcb patch for next round
Date: Mon,  5 Oct 2026 15:19:08 +0200
Message-ID: <cover.1791206167.git.jth@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey Greg, 

here's a mcb patch I forgot to forward you. Thanks Filip for catching my
mistake.

Filip Jensen (1):
  mcb: fix kasan read slab out of bounds

 drivers/mcb/mcb-parse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.51.0

