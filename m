Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC55336DA1A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854436; cv=none; b=cVyIj23mRTlTs0JWaY2DyixDuUOU6lzaqeqtk/qhspdAZirvZlLCDjSQPHtebez8TFiPLCdpKUV5vy++HUdcnjYz7XYniy9Dya4Fp2VR2GDZyO8KWlWX1lcrEI7mYjlqGIOzGZGE7JCZRZ2Njndg2ggW7USEaTKSlh4YyKeI5VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854436; c=relaxed/simple;
	bh=9fjGgqTfcH5UmkgQ23yWI0k2iV507NzTO1K8KV7kOgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqVUtvEYL2Hbkv3RoIHFFnqFFvgyipTb1mZT2FQuWLqx9OaF0vazh3kHBK+ued5QqKvkE1GeAJ63YSI5f4xxy1zHIbPltUJEPG9B0A+zoeAAA8GuMkVwB8XQvU7UIePALJUY7g1CIXUevPRqTo9Y+CBQq8FRGVH1TUs05hdzhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYItOoaY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYItOoaY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso352115e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854433; x=1788459233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fjGgqTfcH5UmkgQ23yWI0k2iV507NzTO1K8KV7kOgI=;
        b=JYItOoaYCekh4/UsmK6IzcmdLj6IcR9bOzTycLGcTfXavqD9+f2i4RMnw/ZPYzaV4W
         V7jTjeEEBd92LvqElDYeiMZ23H1EbpVdmaE4015YXS6SDSrV/jkcUGpF6shaD3DJa0dr
         7n0SRoj86dzflsytQ58LbQqCpoCgW+Qf8qCLi6gZcNr4ksNW9993648TMfZYdHvGUf0O
         4ZQHB3PZjByRWBzKLWNM1ExC8tq7iZNhuC8gZSQe0x41xYj5cfghcGYW3qtJHw+HtZXW
         M0LtTRnhlTJ2w2DPLWsdgeBMsL78/optbApLus1muzBrJBz0tvohY6ivD/9KYVNbVtxz
         5HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854433; x=1788459233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9fjGgqTfcH5UmkgQ23yWI0k2iV507NzTO1K8KV7kOgI=;
        b=TgIbxGEV49QC84n+hHnWdz1cN7KYj5OBbhRJ5SSpIk+UikrIHj/aZoho+oQETlAi77
         wKxdS9QKAf1mN3SLOAB81hqVnahb4EOyQw/ubf/mDEzz9KABnVsoSKNcmUJGOZ2u3xqu
         YscZ9DMPPQihubBFEsqmGPhmyjZzGka3zfBTG+/7FqiC0MgVeGGFw/4JYk9cF2Rrq49X
         j+O3Sheh1m3FcYqwagQdhLms2zXdETGKgXx6bbLOr0tRccZNa9y6UGnVp/sR3T83mRGw
         FAAyARyAODc8SWiI6/xx9J3VLmxbNgH9l/ST0QnDrgkwS/Cp6Yvj2MzzsuTtwjKGh4xv
         hqPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEtHYUCF5tDCSk4mfKL/CgLEdKReQs8P4JQkE7zj60XuCDvPzq8VHsbdA18zahqCFNNhUZ6czCJy/iZJk=@vger.kernel.org
X-Gm-Message-State: AFuF++mx2qOU42DrY98B2pxT5EiNc2eCqJ3cxiEgB0nkYE1lL+CPOW1j
	+8beQN5GBWXzVMUwEFAd+uZ4MGNnDNX0RQevetMZUa/E70n4WYkg5ACh
X-Gm-Gg: AR+sD12niLSPb2VxNGvCnUc5sp1y7J5kybIyRua75rCmxVfuYQ3ZP5Wjfauk6+7d9Jp
	rYE8LVVMetQSNa5KnUEMzWHysyDN+YqmVA31QnzNpdaT8a23+48AH0ud7MncToS4mSMwOMYTsHv
	PTab7XOuX58gCLBE5e/GHVsM6h0HdMfdDWD4kBGZdupxhc0cnuRZlo6HtpawIpcqhX43EsMk7iW
	mWHUP1hNXi0bKfiDoBU8yzj/rf/c6Y7WrGJVt/+TkzecgAcJGX7izNmv71TFLlcDtvW3BKUr5W6
	SafytWxD3iGs54cKTMjPNJ5v5pCW0bu3HUKfMF6logY1hznBg2B5gJZFKxuk16N8DUJioTa1zEV
	DCh4KyD9kAhMEJJaP5QhPwy+22cyey6EV3nM16OI8qzZNf4QFDu0U/Rxf6HJPetB+H6TqSDJtwU
	SzwEbc1Ovz2UB+dPmJsxVmQLcHAIYehCHFEMQZQoHK9ndNpgm87Cm9yf3bGnacSUHsbXOg3+Nso
	u/shGyKjE57ve1qK1eyjnVmI2EBQJsBIuRKMwOTDOMjn//k+VOiXRU=
X-Received: by 2002:a05:600c:6748:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49b91c57449mr12695565e9.11.1787854433172;
        Thu, 27 Aug 2026 11:13:53 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm63879005e9.14.2026.08.27.11.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:13:52 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [RFC PATCH 0/3] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
Date: Thu, 27 Aug 2026 20:13:49 +0200
Message-ID: <20260827181349.2423728-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <538bbc27-8796-416e-a10c-3033d6168bcd@intel.com>
References: <538bbc27-8796-416e-a10c-3033d6168bcd@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You are right. Posting this as a new RFC, omitting Yauhen from CC, and not
making the relationship to his v3 explicit were mistakes.

I replaced the RFC with a versioned series based on Yauhen's work, restored
his copyright and provenance, and completed playback and capture validation
on the YB1-X91L. The follow-up v5 also restores Yauhen's Co-developed-by and
Signed-off-by trailers on both patches and addresses Mark's v4 review.

Thank you for pointing this out.

Maurizio
