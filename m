Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528111;
	b=ckQCyroz9IwFDhGGAa57Uqd46/gp+UbPTjLRNFeTgem11tZh+OofHO8KuYqRldCrKNLN
	 oXNxX4m3tRnAvg7uhNXpnw2TVSRvgjF+bfwVnQOjDTiEoP/nhtK6NtIQk0ytyZTMmyKpq
	 5M/nYz76qPZvP4wrnQnNbCnK1dHCWw48GgkFpMqQljE0j25NzMiHE9DkQKzXHPaCQBEnb
	 +64DZgZGb2585emWQi6BI5IviEkY/+SXT5cjfbjwByfuURkHt2ROy6sgC17Lv2HrUVLXK
	 m1Esl1plPlhHzYbMRQkbEbL65djoeTs18k0VfQ17DEerEP0yxd1ZF+uETTYv88YSwcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
	b=QtdF7rbU584AcGPg+0vasqi2DLFK/Sh2yJCnJnQ+adOnEqHv5Ep3QOPGQ99bZmU1OC8I
	 inWE/4M4dGbNf93zYTQmPYHg6VO6cEoB4WbalVOt+dFkMVsFcX5O32jnLnvzVUhYFIqEv
	 r+FzmWns/E2cOqrlzKIYSpFGkeriQNOV6mspqbD5Ylmy/lkeIWRE2UOqljmAq4VnJWnBa
	 CUlyeia4AQK386Cv/LawpnNAwsiWiYQujyr9i36IKRlHUKSSWh40cKDfQW6+mLs+xkP+/
	 FqVnYKrtC7qD6tCE/6LQmJIIuv1hh3glgYLY5pXv/eD7McI0EXjONnBO4WzenjDDQxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFE6606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DFE6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso614961fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792528110; x=1793132910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
        b=AWU0KiMCQabspfqJkK9CfxUvhC0CCjGRLp7SAqZU6Rc6n5torA6hasvYpWaTV2N3ji
         Jw0FYcG2XXVhTr+R8zjSN8ITdr9miql1hKSRtulhsSD5yOJHtwUPEUokoMiJoZEbPaXF
         9dvaVfjIdr705QrfFXguCgF/8R1xzSnxYnJ3ppeIBDMenoU0rzOASd6YmepZFqbXjfRI
         fVcyHLXCVnUDW31COcZk3S2+Ek+9jH10GqvZKz5mPCBdMsPVNLMMKelgmxwOCPJbcVgS
         ZI7zFmtYew2OObafY/IKGvIlvM4FHVXbnQma71ENcRmeYEfC+naiMqtrfsUxdKifnGsc
         9smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528110; x=1793132910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WD8/5T9Ciuv9waWrVcsqINmUY5GBTSG2x1F4rJwpQ/U=;
        b=q0BYttcFH2oQXtKds8Jg7DwpqOmU5nXzEzqBaVZHxVyUvzKwQdkAH3hfbLfZ4tfpei
         JjXzZ2Ey5ychr67Ffm8920ch7Z6ftBABG2i03HcitaTej/e68Tv1b3vyefY7gmk4Upqx
         QbgHh/+Y0YODqPcedEnM42jo6ijSRhDhTAX1iDXYamul6eoVGGO6/JK8rs+zbInTRfXR
         bqoWZGB9JKWzZu1GO2idIEQw2Y35CKwYmMgUw8GVsqN9GRt9uuza9iBJ3Jf8PfM/53JE
         7a/BRCWge7yGtBgQ/L9ewSQURtHYyVMaFd2336nbVTrQXFXKHllVSq/3yUN0qKp+3Juj
         /7jQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ9yw5DsqNAVfaOByG8k7CTsyrJ8UQF3lmOKnzTvrZ5fiU09PAciXtuE81JS2fubz+4p1ElfhuIXa0AOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgeqEmHe6sQKNBsLe2BYaaqt0DLh6DovP7FR+rVhAERAlu7uix
	ttRaX6o4mSsolDdEfW3/NguVEpEECJ6xmQOKaaxyVxW03SmDObCQ03bI
X-Gm-Gg: AYBFou3UOCuup4USnKAULfns+D9jdefmKSQpENZtoK2gKwX1JTEAwmBWpIBMHJZNU2j
	kZmdmevxyMSzuYrKE1xgpdorLCKmlCFWda2xLwEVVZjGobjRUDzhqSWg+aG67XdzfomgEZnH/XY
	Si3sshy/CHwARN48Zj5ufrFWrHo5mCVlftOSCiWWRmwxgSosUNSvihQPW1GedW/4Er/r71TiYMi
	3PtQwGhKaQgaDae02XU1mBVEVkcoiEF98YfRFl4dfq2XI3/sUn9a+g0naQS7JvwweDdUpsWCnAw
	fXAxCUYDZp7RFOW+U+FRrOl35Wm3ifF/N3Bi/AVhvrCQrB3YAO01f/uxgL3/6yWfdMi+A3Rcp9z
	LVqJu+FxCG4IiFQv0Z//U3N4wx6M6OaRIaMMeseZYA1l4TRe5T7sL/ePNg/KaUxBdl3hp88O6QJ
	IOGKYATix0JghISzqW6PzzmXMmjp+vmw6cuyIr+OmyYwcbegLdNCYMew+ZasPinyJi8uyPwc9Wv
	kR1bvrrrWuvy+uXOlEy3KQ/CCvuJhP8AdFZZ2RJbluZPkcsed1kwneIVAl6lWiZyFXXd4DSfvOs
	glNBvnYF/ylNhtadpeC5isfl/Uj1TFjyC18My2VIwXWQW7Tr9ybAzNO9X+vYTTtSV3NfQXX/jGs
	DSQ==
X-Received: by 2002:a05:6512:1589:b0:5be:680d:6e18 with SMTP id 2adb3069b0e04-5bfa1be6184mr25360e87.10.1792528109517;
        Tue, 20 Oct 2026 13:28:29 -0700 (PDT)
Received: from kompukter-Systems ([83.142.235.16])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1230c48sm88136e87.66.2026.10.20.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:28:29 -0700 (PDT)
From: Andrey Derkach <gabin278@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: ath10k: make in-order rx amsdu buffers persistent
Date: Tue, 20 Oct 2026 23:28:25 +0300
Message-ID: <20261020202825.1178464-1-gabin278@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020195021.1133728-1-gabin278@gmail.com>
References: <20261020-ath10k-a-msdu-v4-1-670b69d39059@ixit.cz> <20261020195021.1133728-1-gabin278@gmail.com>
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

On Tue, 20 Oct 2026 22:50:20 +0300, Andrey Derkach wrote:
> Throughput is the same as with the old version, about
> 60 Mbit/s here.

The 60 Mbit/s was a board data problem on my side, unrelated to this
patch. With the right board data the link runs at VHT-MCS 9, which
exercises the patch much more: during a 120 s TCP download at
172 Mbit/s the firmware split an A-MSDU 211 times in 62,700 in-order
indications. The patch resumed all 211, with no warning and no
recovery.

My Tested-by above stands.
