Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2664BF94A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956747; cv=none; b=IBeoRvvwH+zDKlb2znc+uDcTow9dHGq+viLx+pKNkTW1PHHZmlrf9m1Nn8937FtlBE1K/T1wo4wKMAunhc15DcPzKj3XrnKuoC77+/PU0zysOJRWCoWR5GfCuncZd1oWqWuxASRKzUm3ZRo0l79jhKvI+tVcLt1WFud2HXUGl3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956747; c=relaxed/simple;
	bh=1DNPJeRt0J3xR44Je1fYvtsAtSeKrCZ5Wu++tyEkRVc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jwVq3M2lMIuwlBC/4sQ0a37iPIoIunrEGUA+xy+nJZSLxJO6BmEVcsPuCJV5Zljj1RrC4giMz6IYxOeisIKGe3XFglveHA5eOJyxdcYw0EB+RjAe4VQoJ38guQB7E0fOeoHnDmk6N3+CoN4tu6wx2aaUPKHAtbsHTOvxNI3XhAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BGKZKZME; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BGKZKZME"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso286585e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790956744; x=1791561544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pb1uCq7f8fsDePcoF2HdzhViGioHtCHyGF6zTpmPj1M=;
        b=BGKZKZMEo/oJnMTL6K+KFW+XdwFh+eoXiztNZc6fTwTtYnj+tzLA3LI6XO/b7WBTbm
         JOmz6UvKzljI79hxaK7UWhLr4yx1C1CXk9Xu38JRvrjUa3SYErX31McPFnGEcao7c0eL
         R9yR6KRNeOrBLsOI5l31gZve2p2U9LlCbQ5Lbx59GZ/pCzf41rE17312H51Yo5Fzp+KM
         DTqGw9N/nWIiIoImENdg3aN+FPUNXfc+W00LmdyKoLUrpCON9De4UyD2+IG3p7Msc5dX
         98GRdxvYu3HFJFS47BWyRIm2SqvO8++WkO5naCa9h1NKw4k7Kw4Mhk5bCVrxApvS44xx
         MJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956744; x=1791561544;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pb1uCq7f8fsDePcoF2HdzhViGioHtCHyGF6zTpmPj1M=;
        b=qgiahKFLjEUNDXggcP37lak3D9T5WtDfYlSd3lMMN9bCoRGKTHqvNlhO30HD+SNTBZ
         xSigs+bkbjwuVGO9GzbGbXE4uCYLXqfyn9GERaJFGwLGlJnG/aXxy6nQyZPc9sriqpGz
         ZDmO+z2GOh6xiwpiWQ3tZulvWEngmqnCbpwTIjAa9WhNnh+BVvQP7G66n1s9Ap8JMzNS
         N67oY9KINPtimsn765iuNWVd1f0zSvle4Zz0yj3hdJxP+FJyxtAB5ypoBrAPxiB+vHG3
         xVkR2fACtqMdEu+DXvfR0rXFuhGVQ7l19sSfQQ2NXTNF3vEzc/j9nK0UCt+fbP77/09C
         8t5w==
X-Forwarded-Encrypted: i=1; AKwUvBzNqHLAlCnRX3ik29lKQRCEjUJt4S0snz8582Lh/PYTd+wgxElDuZQMEwWLgnAq4dxToBKWcUDz7IueuTc=@vger.kernel.org
X-Gm-Message-State: AFuF++m3fUe+J1lJEbpZkjO+5tIeyL2Az5x95rRxg07+rXhmp9P9s1ek
	5iP1Leg5i6QGoYI5DwkhsAkadhvaXRep9jmuhCw80npqxltiuWUwctEgwlFaa7xvjBs=
X-Gm-Gg: AYBFou3uTsIp6zf/WkPc3ADtoLA60u6MFluBXi9AqG6hkDpCWbLFBQL1O6CyVZQeGzs
	Y8be9Xrld1DETKyr70outJi6NoFc0co9W0wEOmrOfLxGCcJoAmIopK8+RldxqlKsn7TIQ42HDu4
	KXMYBA6eYcUrnzHsFaVbT+7ndraNlnNNa3wV5aKbGdhUwjsYg7YY5XUwFW6lZ0pMYWUefbNO/Xj
	sbCZ538AP+tCtLor7PexJf0tSR4dj2Jcp6y4MQrfbWVhRbVE4gIBSaY+NlSzaDbMYTwc9rHtzRr
	p+BAWqCilrs3eV5yqVuyuhTDcQMy4qJDuhNlilxZi7QHBxqPh86h4Am7gh1WTHxE8qDdhwvJ4tr
	545XVlFIMD8j6L+6uu+ZJbft7Qx50T95qjDxVBlChS2D0nlu5ULHNUNlSCZ5ajfV1N07uQO2VWd
	uOvQbNJuctq5gPaj2dCv5pZ1W5KDkAgZkCqkUFO+BmTEbLO2dNFpzAM8H9f3JFF78=
X-Received: by 2002:a05:600d:6445:10b0:4a0:1b14:d00e with SMTP id 5b1f17b1804b1-4a027519330mr44985025e9.1.1790956743728;
        Fri, 02 Oct 2026 08:59:03 -0700 (PDT)
Received: from [127.0.0.1] ([109.76.210.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770fe4csm97162395e9.7.2026.10.02.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:59:01 -0700 (PDT)
From: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
X-Google-Original-From: Bryan O'Donoghue <bod@kernel.org>
Subject: [PATCH 0/2] media: qcom: camss: Split VFE 690 and VFE 780/880
Date: Fri, 02 Oct 2026 16:58:58 +0100
Message-Id: <20261002-vfe690-780-split-v1-0-40e15aa8716c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1g3EYP27SuliHKOmFJWJFUG8e
 0ddfov3djAJKgZ1skOQVU2nMSJ9JOAHN/aC2kYDE+cpEePaSV4RFiWhzV9d0Gfkyqppmd0TYjY
 H6XS7lq/3bfs1H/HL+YHj+AOcyLpSdAAAAA==
X-Change-ID: 20261002-vfe690-780-split-c40a89bd22a5
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=bod@kernel.org;
 h=from:subject:message-id; bh=1DNPJeRt0J3xR44Je1fYvtsAtSeKrCZ5Wu++tyEkRVc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqv9TEIkJfCMPpxAOyNKR9cxp0hnmCAh8GZzNoj
 w/viVmUyPuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCar/UxAAKCRAicTuzoY3I
 OqbJD/4ySr8lxhq11p8yYTPL0WKSaBav06hhCa2VH6IdtPQTVJb9D/t/SAaMiqYzADu++GN9eA5
 qFeUhg6NhnzYVtjghJX6VzD34csQ1AVsNSo/Lfrn+8FrgNP1aOIomMT3qnhGmgLFzCmpahSuek0
 M8KdHSZcYJp+nxu5kP+p5AKwBrWMQwkLqRIPqn8dyzh51F/U9gL7ru5ENi5oWokzNdBQYUAF5y0
 JgIGvWiKC4cKiXNC3QKT2c+bx2AYxIld9n+g0yGiNxvXGll91o5YnhaGeYrNFu1+RSOxWyxgTC+
 ywG8yPWgTdY6pgNwwAgkL0o74jr/QuH0YUb7bbjeZoeNDxckpCqojchu9zTonecX5KWrh9AYCXy
 mB7eKHPwovtNBrPk7qBjRlt+bplnIoEA9Y0Us2GgoG6ykMlNkEDrdTxvTO6+MDw117IO+uTeila
 Yp9oGNyYmm85SWhOdbi66r7CovVzGpuMNHmlQG5V9lNqx5LmI3aWwFt7/8DOWZAPoFGExvJhGug
 4hO8YZkzDfRnEP8EGWXJoe9PL/vnm7shFSPUuGOXDpGMLJz/ChtCvJssUtvD7AGV67KUs/gmjmA
 MFwIPGBiEjVwnIEUKGCkfJUev5pNTmQz0D8buYOqqPXBxoZuQ8L7akNLsQKNUMzc8q9VT9Dq2Kj
 xYJW688un8+i5SQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Looking at the write-master indexes for VFE690 and VFE780/880 its clear 780
and 880 share the same indexes but 690 is significantly different.

That's enough of a difference to separate out the logic of both. Two
patches in this series do that. One patch to reverse the rename another
patch to disjunct the logic into two separate files.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (2):
      media: qcom: camss: vfe: Rename gen3 back to vfe780
      media: qcom: camss: vfe: Separate VFE 690 from VFE 780/880

 drivers/media/platform/qcom/camss/Makefile         |   3 +-
 .../camss/{camss-vfe-gen3.c => camss-vfe-690.c}    |  49 ++-----
 drivers/media/platform/qcom/camss/camss-vfe-780.c  | 160 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h      |   3 +-
 drivers/media/platform/qcom/camss/camss.c          |  34 ++---
 5 files changed, 193 insertions(+), 56 deletions(-)
---
base-commit: 89a3d2a2237e017cdbefcb036db71ce74e67faf5
change-id: 20261002-vfe690-780-split-c40a89bd22a5

Best regards,
--  
Bryan O'Donoghue <bod@kernel.org>

