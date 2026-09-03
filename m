Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B9F7E105
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412757; cv=none; b=nJZn9a20EvXJMYIsDl8Yo2312f9cwePo35kCIzFpEjsy5gSpQ/kPIvmBCTirRlhQSlRVN7eZvNkeAA4FE/B14vhG4/RiYxhIdjpN2yax5KA6grlU2IoNQURqAk8Fojwui57mswcvDrs5BUgFdfyeyq7O0CzYLpy+5yeq/QbmxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412757; c=relaxed/simple;
	bh=VQXrH/5YvCkZkKz+MCTLofseBdofVsh7itTlSswqiIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uLfZpG6c06HqgDKBXyRURaTBPU8tNkWJC5kKWbd/QkMyaDZUB/nfVum3aUI75seJ0YQR8q3UPDYG/266E2hhF2cU4Qo1UtmgAw5atUj/NCb9gxUiXK6V7ZdjVe2GoAWgPD9iC8xFlTSaCgCspRJoJVkq3yXQATVwcnXG65F9qA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDITZ/Ph; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDITZ/Ph"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c5ac25089bso1006501e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412754; x=1789017554; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fo61YL5u3T6uBKlZdk4Zu2YkV558WWJJYbN/I2BPkPk=;
        b=HDITZ/PhPgCUkOsoF3QM7xFO+UhFfkLcix7DVrlG2f3xmKgylviwKZX0d341uwz/rN
         sm+pC479+lxGnx0pibDwVBrlsTrYtXmQwafriKYVr5Qp/gwnmKF6Cj7NaocPsb+IxMkY
         mMCgAdHD+QK7ZmZEydcebxnvQCAZsgPf43QgztAqdgz8KjbOtDbOR0vCxUYm4w1ObUSL
         rfZjtI04RSuZfK3fRvs9+pkbmGr1NXPC05mffvDRa7KI4SITkTVII0s0DmwD7EQ+32bY
         2txULtBlVajHcXXzYGsBjXHbomILWuHvDg6nw5sqLItR5v87EzAa1wkLhon0ANpeU290
         EjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412754; x=1789017554;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fo61YL5u3T6uBKlZdk4Zu2YkV558WWJJYbN/I2BPkPk=;
        b=jsNeNTAVZJK5KgaCAK+6dMtjrA4n58xZqASSQaxzWmwHBu3wmI/tBfvE52X+A1i8Pa
         zon3HmHGSTqW1phD9AdYB1JFc3+7HCHNmIHeMWXPoTH2gjcZ+fCinEMlX5lsCoZVDX6L
         mUk8+0h11zFSPGkMCv3cf+kGupx7hrFikk90TT5s9GJFVmragVblIX3n4fw8Yllu8Meb
         GeVBcW9NtLZ3dvEl0jNzrVhxbOz69htrWm0y9VrWwDL40lDoZ3OWFAk3BOlutdWyRiVS
         UaV6Pwhk+aDRNZzyfFbfo9Ur+XU0IL2oYSfvmfVzDMYlo3kV/Uk0sIXvF90vLAAFtd9z
         4lhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvKxSOiHTCCmr2I9fUxJIKQIG2yW6VSxHC5wiZKIHfhWWSC6ZASF0KtEgn9ThPD/ik6dc8UIdxE0HdK3g=@vger.kernel.org
X-Gm-Message-State: AFuF++k9qS0Lr8yas2Y3vEGYvdFpUPsyEjudUtr0ecJ5Ehhh9n8NrgxU
	6ox8M2Xs0pLafFSGBWhOuM4wurI4dUDup954F8ddnPYO92Bf2YvTwi/aawy+ow==
X-Gm-Gg: AYBFou3kBMBn51h1DwAIbTrniAOK7HUIV4pLz2SfAP5G3xW+7Hb9BUbefPC/V/On0pl
	bg1gyE7xuUz9CyWDRqBHZea99rVwTWeLJJWrLfmbVjUmwwA7DMR44LwcfsZ8pwHB+jpg+jmJfAh
	qN9mL21PDZbQqsxJhrjj4BcCwEuCF1wrkmecRkgfNXn1YQgDN+qu6ZsToAbZljFsE9DdQWiz2z4
	t/1cKPyH4Ytp5NU3EdNvQTCDLxQzAz/+NIKiIb+AvVADNJutQ4dbaAcEbLNjeo9AUomQBYvjqwG
	/T1wsmO5T+rhmjzDaMjYDs4tomYFLvYn55kvpgarstJVzWCTVXXh4i4v+BnPTITMJvSYluyTFQz
	j0IoDtD3aLyA9v4LDg/WNQnIeFmlKQPwvoCcSLCeqU3H+x0JrT94hThhkpsnEnfNCxt2dHxH8Ue
	jiZmRsn7t64pXPFHG3qdUG8MddNLUaDwCiuzl28D2mJtJn4Ra+w7PNFZKtf1w33o6g
X-Received: by 2002:a05:6122:4f91:b0:5c0:fb8d:9993 with SMTP id 71dfb90a1353d-5c7d2397666mr3866911e0c.0.1788412754395;
        Wed, 02 Sep 2026 22:19:14 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:13 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Subject: [PATCH 0/4] staging: rtl8723bs: refactor issue_probereq() into a
 single function
Date: Thu, 03 Sep 2026 02:18:06 -0300
Message-Id: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4DmWoC/x3MMQqAMAxA0atIZgs1iKJXERFbU83SaoIiiHe3O
 L7h/weUhEmhLx4Qulg5xYyqLMBvc1zJ8JINaLGxnUXDqidNuyRHQodxS/C+DojYWsjRLhT4/of
 D+L4fzbIA82AAAAA=
X-Change-ID: 20260902-issue_probereq-bdfcc4f22270
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=1089;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=VQXrH/5YvCkZkKz+MCTLofseBdofVsh7itTlSswqiIc=;
 b=V2c6kwDHjH7Hxk5ujwCl3ah3YxtOSfoViMEiIC+FfwJzZdLk/bM1CmM9NotyrDTD9DToA9aJu
 YGBV2kmFcDEBzAG90ZWsKZcSXitO5O41YNYXIbwrO+76P3eFnhZZB80
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

This series cleans up dead code and removes invariant function
parameters from the functions issue_probereq(), issue_probereq_ex() and
_issue_probereq() and then merges them into a single function, making it
easier to understand what the difference between function calls is.

Compile tested only.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Leonardo Martins Martins (4):
      staging: rtl8723bs: remove invariant parameters from issue_probereq_ex()
      staging: rtl8723bs: change issue_probereq return types to void
      staging: rtl8723bs: remove invariant parameters from _issue_probereq()
      staging: rtl8723bs: coalesce issue_probereq functions into a single one

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 98 +++++++-----------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 -
 2 files changed, 27 insertions(+), 73 deletions(-)
---
base-commit: 758be99c46265b74476d5e1173d781abe325533e
change-id: 20260902-issue_probereq-bdfcc4f22270

Best regards,
-- 
Leonardo Martins Martins <dev.lmmrtns@gmail.com>

