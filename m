Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794073429;
	b=sslKxY6ZodhpOvv7v0fZnf6DJHgw0Lxxx4e/2/FTTOLN8DR7CEclte33mWeTUTHhtHfD
	 ishjRoEJgno792C75cNOjDXW+Jq+fqfpQS+y2y72BxXI3zzQS+H2NNhoxltIIhuQ0qVgl
	 YTteM9/ug7p1JBMlZFj2fjO9wemmbWGFbLtLG5shzii7tSMHagSsfcAlNPqvDaaXfx+RT
	 zfWLaCDmnaezkoolJmdcl8G/hSpM9t+tXHisO846kQXQBDqvk6SGXRgMOhe2dupXjF/7N
	 SfbYYGn8pujK2bPaJTFNfuzDgVuIhesJHhaGmKoiFufuJAnciiKE4UHTxHSeOj87sJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794073429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
	b=y9mzzuvBZnYPaeCEzdJrExOWbV7vpG9TCIDGjiqrAV7zPNYvYaz1wrwtL0kukPrvHR5O
	 yLmwaQJZEHeiMRq67ImVBgsMXzX6RDJ60l7jQ0ZRqZYYXugLlLGR16FcTi3e84HyhgVGu
	 akDBf0Ouyb1e3imDyxWcx6ops5N75QA1Xh8yEi/pCT1IsuX8EhhXTRovq2GoYeySnu/up
	 Tb0p0e+JczkijOpRDFl2YZzQNrpvV6CJ1tgabVnC8SV6t3ZeVb24/6aIPq06XVv84fM6x
	 UO5twNctAcimnFz8Mh4ppNaO7HENnu3JIO9mJZQ8+wOt0RtZDMdf407VPzAhzmq8azw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex9UcnXj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BA606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 17:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8BA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ex9UcnXj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so14331785e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794073427; x=1794678227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
        b=Ex9UcnXjVjvGoF9hVF+uo8B30EGHQnW7NrgerLelKNR2YGt4MfMvI8QLWg0NZQajyh
         izSgtygmlsdccSva4ME/iDutWUBZdw5SO7YaCbcbx6vOMezbbQi9vwoIi8JtyC9IOJyL
         BnxCGmMyW9OBQPiVf20i3I3D6H+ylWjJ7ZzRyyPAuhsH/XrrxhJOcRFUUdI9AHymJA4o
         6NUISlCNJ3TFA/aAz9OTCzfsRxumuUi4TEe9EIzP+UGqMnbHl3f2oLCNigSHbs0qhiUI
         5o8w7oMeNJWDG4P5kgBlZe1Jwgc983ZIdodcYQMPBKaIUCYU9vvtczoX2cEHzKRhdU1+
         1I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073427; x=1794678227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
        b=U98aU1dwcAz5RkyHXfGLIa7YLupi254ba+SdAWouXmtWTUskxBn2MLuStI+6i9Ju2A
         XjdKk/gdbv/iixAqkfV7QLoTvq963eSxLaSqDLeTYs+LVQMUiJdTj/xBFF5kZMKCAaPw
         rxwa60ANTsHJm7Hj9W74/FtkTk97z1xpPhVwNkvZ1c8HdR8zDRS3Hex/IzKJuPiF3iyo
         HK1nYv7VACWqY53X3JF6C8yfIPUSAN+7W5BnqagHxh/B8+UnbLswRgzJRORhBqKKMtWU
         kjuNBsjDUT7wu57iEMzX1u4lzg06VvXcehEiE2irj75d3wfkszCRihdbLotdO5XrBWpz
         8RKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8kcYe8BYDadT7RWbg8O3c6WZLMTyTG/m3thzgCzgdya2l+ksJrxIRVzpazsYJNOiDwK0jrXV+EXAtS6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8XV/+/ztfn6fB9NKuHbw5XkFYNINSWnOsuA9yQNz2tOtUinDs
	w5uAZ3AqRlntfs8FHkSBjtpi1jRmqaqFl5CGlDdb9jnzCyaccbIgwK3p
X-Gm-Gg: AYBFou2ub/NTkwX7WT3k1gFEE+gP3rWHUZZ4UWn/JnmhOMlxpf5lThUt/65SENlnGFh
	aLxH8qvnmtHscuJ+Ye0yGhQXbAsNM4KQRl9XzDh+EHcc8B/lO9rstQD5KJA5W3WtbP3tQTY3dXo
	ekltKBP8QOCVAAHClXv3N8JQNBzCkfQKEETg3goVZtika5E8NFaOmixgaKAaDxHPG+eVgtbYhlT
	KFYNBKKr+9yN7YCo3/97HXOKF2wl3UFbSj1A9+lRasU51RWQRM6av94p5rp/JIPoiiyU8YwSTBQ
	7tSC8Rg9HReTcrPBUjKt40FW8Rgx3CntDqe7YE5qNm3EVR0LC9htBTL1L7TtV7E3kQudxPFXRJV
	nSRWw0nzVh2hQS/iKM766pAD9VpGVyaDGQghIXQE748/u8EFjJkuoNNNXpKEPWI9pp7cF+6Q2Sq
	AGhPo98uKCI0f6roc6G7rWJarCCFGDFD6p9bR1RIA/cVIptfeKOMBGtwh2QVzES3V/5zoiUOiy0
	Q44SpN1bt7raB+AbnRa7nTktRdeF9FqWHt4WoriEBHvcxHPhqPBPmRBJxGg2V6zBdUIRzByTc+6
	TkxF/86Zk4g6cYF5px+brST8SCgKAw6hQQ==
X-Received: by 2002:a05:600c:6814:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4b6df4f2554mr125464935e9.31.1794073427028;
        Sat, 07 Nov 2026 09:43:47 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291526sm91814315e9.13.2026.11.07.09.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:43:46 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: sashiko-bot@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 18:43:23 +0100
Message-ID: <20261107174323.577410-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-203084@kernel.org>
References: <sashiko-outbox-203084@kernel.org>
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

> What does "These three" refer to here?  Nothing earlier in the commit
> message names three stanzas, and this patch only updates
> SND_MESON_AXG_PDM while the other stanzas are updated in separate
> commits.

Correct, thanks.

The sentence is left over from an earlier three-patch version of this
series, where "these three" meant axg-pdm, axg-spdifin and axg-spdifout.
Its referent only ever lived in the cover letter, which git am drops, so
the commit message never stood on its own -- and the count is wrong now
as well, since the series became four patches when aiu was added.

It should read:

  Several stanzas in the same file already select REGMAP_MMIO,
  SND_MESON_G12A_TOACODEC among them.  SND_MESON_AXG_PDM does not.

That is accurate at v7.3: SND_MESON_AXG_FIFO,
SND_MESON_AXG_TDM_FORMATTER, SND_MESON_G12A_TOACODEC,
SND_MESON_G12A_TOHDMITX and SND_SOC_MESON_T9015 all select REGMAP_MMIO
already.

Only the commit message is affected; the one-line Kconfig change and the
other three patches are unchanged.  I would rather not respin for this
alone, so I will fix it in v2 -- please let me know if there is anything
else to roll in.

Thanks,
Jude
