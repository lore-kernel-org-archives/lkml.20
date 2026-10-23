Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746138;
	b=LYXOLKvJX87cjbc+xZT7RVWJilkaaRBGP9Dqk79WQLDtoQQZNqpeYedL0l0lmXAUfdk5
	 YIAE0kzMj9CDZHJ7Y2QB6Ksi7dXgwAa8zRVeTIYS5pQ8r7C1mNqjhG6UE1W1BenzOTYMz
	 x/YNgn0aFD5EGsEf9EbPGnpUZ/UDGFlme3qXqur+dF2lTLj21ZyCzD1evAzk2HKYHAMMK
	 EabdI4EY8ygSfyTfNSTWUIPNILudbjvQRctEO3v/HLjDu1dKSs7017KVgOUV/c8sXp3Pu
	 KHNbyFMLEorKr5glg+dltG0xYse5xZqANNDLAvZ+ytRApOeTnV8Tj4mOdYy9CO5EoDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zk8PqaPx3bu25dYVKV81cX4OkbcAyjNl6LlTA7RhVAI=;
	b=PaVLfCJkFHuYV0ytbB+vbGPPxSS+UHtHPRRXRSQ9ie4F9HvLC1IxGOH3NJDAzK7TmDG9
	 rokHSD/6/C8pAH/dCCnmnDc4Ej5JS3EFqrKFuOT0mr/e3FsYS538cWQ3KawuOZIJh5ZEJ
	 19OVmDnMRfJwVrDb40Cpihq8tUyXQRoVYncTv9waXj/FKBsGgj+O21U4YqzNHX1mSE+GN
	 KLLxofR5nJJkwB2VMJOkH5bEcZL4dRy8j5UATQ6zl/fvqmRo351vtBFscyNp3KvRKS8O8
	 Fp0mptGlBfnKK7tuHm3s99RlQJjUf9piDDstmREwKx41lHb0KBXyiaLMaBtKuFpk8hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QEvT0wjL;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A803606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A803606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QEvT0wjL
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so395814a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746137; x=1793350937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zk8PqaPx3bu25dYVKV81cX4OkbcAyjNl6LlTA7RhVAI=;
        b=QEvT0wjLE3Jnq0bzo5B4znv37EdSUY18YMu5mVtGQqK9pEjqoeeiV0AwIu/HUaLqo0
         iqRi7/NfFU1zmg2Nyv5KABLgBlosTNydS9dCFXlsGyZ2+NtS5Z2g4Pz4cYfygLdJHqRX
         OONvGu9Z/Rax08dPjj4cxAlLKmKQ3In33sUha9J4CyKw26iUzep8jWX3b6yzTrGEZg2l
         YGrjMB/DguIK6/lAOeFv2e++1gkdo9oakRVKoHrcKik5L4m0UT44mAEW31X6rA6mjn9d
         3LFns16u5TMI2kKw8EK1ElWOlRHpfHL/tvx4puStO7Vt2fvUGRLqWfU54YVydZaOeT6R
         3BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746137; x=1793350937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zk8PqaPx3bu25dYVKV81cX4OkbcAyjNl6LlTA7RhVAI=;
        b=AOP4qqgA18GVPE6HbVNs1kuBbhMavcIiLepHhPwFxTgbHItJ7R6oPGJzgQmdR63ICT
         49PxG5n4HaUjEmCUee6dWgpaOaR5FB6KYNdUDNEXFNKtbSRgQ2HynUNIYzJ1XMV6LzWU
         nqmI/CeTvd//rkicmTIbJHZ1dmoFSHK5H6ljN68YMMOr9m4uasvMcb4Wk/KbWHOP9wmH
         zo3wd3kG84dvUJLBzyAsTBe5EqH4co1OeUG7lDTyyRLz1WFIfeS+xD8ag5zWbr9sFv88
         yj3d0oVI7RXcVNTdYtPQ1L+UoYLeM1Za8/0yVaBxPuTApiZQoRGIQ+fH9y9qwJWLAz5o
         5djA==
X-Forwarded-Encrypted: i=1; AKwUvBxKoX6nUnTmcHUtF6bG3MDThG7JvhS3O1biS9FikXWSZR1uBtyjON/s2aIOFh0g+Ngdz8muH1qC9wQ7MF4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkXjWq3Xq9N9HKOZjj6MP+CYLsxF5fafkT1rfmeRxBGeBZZ+AP
	x2O+wuwsaFGJuALfER/yT6dE02SAD5XHVtUTcxtOIJVHZDwsm4NvFhok
X-Gm-Gg: AYBFou1TsHyWjruZgJqehgID3L/jcNIx5BAB6JHDrtZSH1tDfdRO0Oc3HjfcVjbKMFf
	Vurh8EX0Crf7MORx7j2HdOlvARMMs/Es6puRlarsaj5neAWlWCLiY3ENxzu4IM/Mi+ygrV3wtIU
	M4Eb6xDjrjJ8xYk6qHaHz49XnkYcBYxvdf3LaqIdv2xPD/Hk6KDSy3V4NXJYB+Xzz5gheP+UBQc
	xOfQnaPOgHI2FGzW/vZZTnlK5Rfo/YNcuXDQlPogQjnZizkTIfaFx+3TvchES9hmm+qnmxULxJi
	MP0mMONB4Uqk+ZQN68Hh7bQPgn3mBVYv9kjRh+EL3uP/Rj66QvysWAEG8prDS8G5RIjKGcsBQlZ
	YY3DMledo4AoVWWjWEXjITlpzfykcVem6MmtZJbyzM2kCqdrYTV/n04UZkl+iiFbkrB2+mSxxFe
	zlNPziwz3pRQBnnG+pUOhzVJlSWeyvQzy/2N3PIDmToQ2PE8Tdc5LCyoQqkUklx7nE/r9bPpsk/
	6l+RgvCzFWauckR5ptTwHsBjkhQMSfkYYURYTFbBkBQ4vACAktv4uxhN77SGRNiuCaCktNRgRU8
	gsQy7gTftVYWpZEZgeMgcBoQk2JQqNRxmhOgrr52EByzrGPs2gHCPcGvUKjtQO0k+9os3sc=
X-Received: by 2002:a17:90b:384a:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3adce0df80cmr1423310a91.58.1792746137510;
        Fri, 23 Oct 2026 02:02:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: codecs: Fix hw_params return values
Date: Fri, 23 Oct 2026 16:01:53 +0700
Message-ID: <20261023090157.518032-1-phucduc.bui@gmail.com>
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

These patches ensure that the codec drivers return 0 on successful
.hw_params() callbacks and propagate negative errors.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (4):
  ASoC: codec: cs4341: Handle hw_params return value
  ASoC: codecs: si476x: Handle hw_params return value
  ASoC: codecs: tfa989x: Handle hw_params return value
  ASoC: codecs: wm8994: Handle hw_params return value

 sound/soc/codecs/cs4341.c  | 14 ++++++++++++--
 sound/soc/codecs/si476x.c  |  6 ++++++
 sound/soc/codecs/tfa989x.c | 17 +++++++++++++----
 sound/soc/codecs/wm8994.c  | 12 +++++++++++-
 4 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.43.0

