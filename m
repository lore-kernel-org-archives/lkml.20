Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8807045FFA8
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390131; cv=none; b=LCke5/4+ToUWIM6emfGpunl3e/lvpq+G9mL+KRY4ZU0IhMdh4PtPykL1qlquRMg5cF/YKIXqtzcK/800tGgr1bzMcbwXDad+i4YopzoQDUCMpc3QucI5Z5/4xfyJieC5ktvJMC8jDWW9K+qw1EugPvoB0iFtaNPEXR92icBIaBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390131; c=relaxed/simple;
	bh=erbkwzh0D0sXhbJRE5AtavTZ5KI4iVBvPgDqcGqxj90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHrcPy+E2AhYaVUQahT3pbzFjHL2hi+ORUxmSL0zLYDnn8HJOC5LHQpz8x3BQ9OVOQq0Xz+od1GBI6GguKuVjDpiQLqou1Wb+n0MKzPdNOCgr1wyx2p49YCrqdoNmoWDCZxV1vRI3pAs/aaFCFixjCr1QmvQIuvTfwZ1GD3Y0ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bjqdir55; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bjqdir55"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-156cbe59622so23641c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390130; x=1792994930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=;
        b=Bjqdir55vnNLJI5P2XOA3kxnnvpiJZASMQvskO6BPZlc1EjbCU30RQCjP+1jxo0BCs
         Ul9hSHqXfzigf/EDwE/R9sets+YQOyRfdfJf9dCazTs0FI1UctbTYAwqayKtKT/JbtMx
         Jav9XzRalXMjKFdt/zwIbjsWjvLvnzas3oaJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390130; x=1792994930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=;
        b=2ogg6CyZ0lQK9pDaEu8gIv5b7/0SPM/XCDkdiXXwYWXkVGC3YkHka7PYVAIb16NFtw
         FAauYDPQfL2PEDYgz2/Up6VD3jbbkaPb0retNHx8ZRPuvGXFF5QHj/MEKsrHE8vawTke
         ZqeKMAJS0vhGwE84S+pdK6PpFPk3N8Y3Eot63hYNgyskUBdQ/ZnMMQ8R/wnuLaU+kxfs
         dLyFRBc1xQ4smPR8I6zEeE59ATX+IujSMemdR0i9BnSsv6LRoIuniTMYvYQqfNYnK4j7
         KS7MeC+I1BWN9Eb3iS6Fb+BoH3/ekNj3R1RXe4nqJ9vZsvoV40cHHz+UizrpAxFLBF6B
         NfrA==
X-Forwarded-Encrypted: i=1; AKwUvByWJR07Hn1K4Z4EA/ISgIkoHKonH5dfMahrtera04vUIpQYyuxAymK832RYjF3tcpQvsDPJ7IYuC0HvcRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKarAIVJsPdegeqjZ9tiHGQy1tmWqWHY4E63cCX7fmztVHjmsnX
	6YAJidr7M7luzZjZUgg56f7LrsI0I6YwNfeW9U0u+bxMFBbePqYP67DC6t5VyZuPrQ==
X-Gm-Gg: AYBFou2c13PVAmvvnqC/ImDtOvxo+UnX6HmtdS/GXEkVGMfFu3J2pYBZFUVp2v0A91N
	s1km6T+fj7SHXS5A+A1Gn56mv5QTVRvCyzXZH/lBjbxIDhxEpDkPwWOAsWoimXjtnMXZ2CVHGhi
	pJ/ezxAJvDZFcmA5hF9LAoa9VOezR+0RvhyMsuE1QNnyEkS0ZnDWxwKNRd7YfcQGg1pyMI71S62
	HblEdJin5JMzEN7SGb/skCt1bzchx+rFQhML5Kwe0IJM6MjCMaBoY3JUMJ6TA+xDkPc+HsPgCA8
	9NQgEdwKHbAAHZY81VzjKGhrx1umbQqHP+kEfLmFMIHhKmZpxk95SSLZiIp8APiHoZgQx+VcKIc
	9zKcg86LJ1+ZVPdL3xu6P+DO4ZeSypMS4lzN1keJirGxK2ZiXqOkIAUD5XzqAP6WCSiGXbkGjXQ
	bRYls6oVRkyUuHFj5UK9NuvLOwbfyPmLFpK+baEBbVSWXsc0pcEiTyNo+SOwUHLMpURNnjeB9I7
	1VQWZxE/65lv0ZjTDpXZZUoGy1/3kcdBHp8LWppO+Xj4KV5WfbHf7mD3Q==
X-Received: by 2002:a05:7022:170d:b0:154:d06c:e70a with SMTP id a92af1059eb24-1851285ca17mr9287698c88.23.1792390129597;
        Sun, 18 Oct 2026 23:08:49 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:49 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] media: mediatek: vcodec: Fix NULL source address handling in decoders
Date: Mon, 19 Oct 2026 14:06:18 +0800
Message-ID: <20261019060825.4163770-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the stateful and the stateless decoder workers peek the source
buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
returning the buffer. The buffer stays at the head of the ready list, so
the same job is scheduled again and fails the same way. In the stateless
decoder the media request is also never completed.

The two fixes are split because they fix different commits, and the
stateless fix also has to complete the media request.


Fei Shao (2):
  media: mediatek: vcodec: Return source buffer on NULL va in stateful
    decoder
  media: mediatek: vcodec: Complete request on NULL va in stateless
    decoder

 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.56.0.176.g3575e65682-goog

