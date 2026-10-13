Received: from mail-qv2-f10.google.com (mail-qv2-f10.google.com [74.125.230.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5C93876A7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791858757; cv=none; b=ik4/2Qql1r18WRLW6c6o0bHTICa4mHwxdv/Um1VZpcP8stX82dptYSQ870t8nqOC5l5IBzDMf3D3Fre8JyVrWQdijvaQHi8JnVzGATlFnzx+6LBHCbL3YgCkFSBc9mCbvLMXlso05VXg7GSwAhI+TiXBpVHEtlFAsk6DNt3QbO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791858757; c=relaxed/simple;
	bh=+P/g/LGUKmjbAkOqhmx9Uh2mgrjhhJe9dgSQhP427Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbemC+pTv+w+MOXCp/2ZckNBd96st5cvttLX5hjplD+o4/G+WCAzNv4ejH0NN4RM2xJpg3Hx5N+tXhmAWI2155BnosUt83FDG4Cs3GflUQzOq7AETePUQUTqrYGHNPRGgnGoXUfq1wDRMjjjr9bLv99L7NHoxlJm6NnQ+3EtwWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jprPvzpq; arc=none smtp.client-ip=74.125.230.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jprPvzpq"
Received: by mail-qv2-f10.google.com with SMTP id 6a1803df08f44-91b851030dcso6363396d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791858755; x=1792463555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ePY+63uYRMrFDWAptdadiuSJ2ZP+/koDWoDpXgbL1M=;
        b=jprPvzpqmC4t8+9cUUnUyrJombWx819lLX8kdGi5mtVa76zuKUUIRm7kYx9kg9FxAO
         o+AFzWDdYAKE97Pwt4ox5KDR/2EK9FeIIriH5KeFK+F3Ib/n94aHtvHFcc/KV0kmdjqN
         sY3hWdkRt9zXIhS9Vv2QoRrdYb1TjC6nwHCA9OnpNaHCbfxBxH0mQWDUpckFnsk2q8TD
         3nzNDkFmM4vpq++22HTz/6j4ulfSX+obtdJ+g0QsSp2oDm8c7VYog0kmiIK1GYOKMHEf
         oa4BBfHWzzw+IO4bYns3H9G1oJPhHa3sKCKtG5n6qxj+yNVjG5d5BMvmftp0RJvpAZJT
         yZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791858755; x=1792463555;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ePY+63uYRMrFDWAptdadiuSJ2ZP+/koDWoDpXgbL1M=;
        b=JdRwt8OmVrLl0dvD1djANZZe9emadwszl5GXyW9h2faExzCG9k9NSBq2OoFsRGsZ9W
         j29Ws3QQdI1m6K13V1VYfY3lVqj9HEuc3pikn65XdEEDq82o26B2KBdTCV1RdE/duwB0
         dF7lHIQZ88iYXV//Q1pHWSi67MY2Z8hJPgKoSzrljS6BzV8lD6pikqjBLNhy7dE0rqDj
         UQPtpfeuNnnFIkSGZ+AM4F+b9KhHXGFYm2nn574U7qzttI7H10hl9LTumm3dYokY0JNC
         qpIn7uQRSRVVG/016NOBeOUfzMu0ia9cmE2bdUn4WAgh6/MuGjZ1ejBaDIVwZNpQpvW5
         kttg==
X-Forwarded-Encrypted: i=1; AKwUvBwwEMEszm8V78EKJnU2kVphZOCQT1hb08xxGVDezulrO13DUuSPNyYWkTMtjzge2vttRTleSUbuC3yZNSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvaF6Mv8VKGHBj4uFOA12VtK+/INRpByu4HGSAivITcXh7bDa4
	6bW/bud9IEew7WF4Irm68RzbHpbNQ04pPCDzdlFYNzUqddzq1Mz/bldp
X-Gm-Gg: AYBFou1zb9kwOyVbNW5+dP6AydiSnRvA1/bD0UbhjcGDNP9fE0ARbvXIMKgmnlysBWr
	YGC31uPSz/NzRZgPtEyTODqtFK8q3nBSEhsfKS4cVbyCZS0zZann/GXh7yiIG0Ng92sY6nyTAjJ
	irBS0CmBbrI9x5HqgKqZzhbV29ufQxEOBe1MkojJ31aBHn06lZ2kY5FxuypbUAtOGu/E0eE0jK3
	Yvnc/wtzHzLVGs98Vo1Q1IyObTFFa1K/OTGjNZ77eK9v2V/kqBUbOWosKY/RNIy9+41AG++J83S
	YldSnmaaxeX/OO6b+c+ma4wb+RLNolUDwQud0Xa2QnRW/gi68E63yg9vITkf8FreDd9Wy3Eusdk
	bug//F74p22ueek3STfu8kvf09jjvfONbiD81lEM2nZRU5pnBSqe8CkDH7uylqhk9954dtvbKtI
	4QgfWfgH5OSpFCK6xdP6o0whmEfkBhnSj93u9kzKGLABJ1XE19MuvY4WPU7Qw4+BoGub0LjfG4o
	Kpmwf0=
X-Received: by 2002:a05:620a:4552:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93ebd231201mr1979508485a.50.1791858755323;
        Mon, 12 Oct 2026 19:32:35 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:8019:c46c:3784:400f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500973asm134755585a.15.2026.10.12.19.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:32:34 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 0/6] AFBC fixes for MediaTek DRM
Date: Mon, 12 Oct 2026 22:32:22 -0400
Message-ID: <20261013023224.2195490-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cc128facb246d89408cf46aa7c9e250c56900940.camel@collabora.com>
References: <cc128facb246d89408cf46aa7c9e250c56900940.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nícolas,

On Fri, Jan 9, 2026, Nícolas F. R. A. Prado wrote:
> I received a suggestion that the Lx_2ND_SUBBUF bit in OVL is not needed
> when cropping is not enabled, and that removing it should fix the extra
> pixels after the image described in 2.a., and perhaps even fix AFBC not
> working with MT8188, though I haven't had time to test it.

I tried this on an MT8189 Chromebook (Lenovo IdeaPad Slim 3 Chromebook,
board "quigon" of the skywalker family), and the suggestion holds there.

Setup: next-20261008 with the posted MT8189 display series and this
board's DT, plus patches 1-4 and 6 of this RFC (5 is MT8188-only; the
MT8189 OVL uses the MT8195 data). AFBC announced on OVL0 only, which
drives the internal 1920x1200 eDP panel. Mesa 26.2.4 Panfrost
(Mali-G57), Hyprland. The compositor picked AFBC 32x8|SPLIT|SPARSE for
both the 1920x1200 primary plane and the 512x512 cursor plane.

With the series as posted, I see what you list as 2.a: the top 4 rows
are missing, and stray pixels show up after the image (here right below
the cursor, on the cursor plane). On top of that, the IOMMU reports read
faults from the display side while AFBC layers are on:

  mtk-iommu 1e802000.iommu: fault type=0x5 iova=0xfad06000 pa=0x0 master=0x21810410(larb=1 port=4) layer=1 read

(always larb 1 port 4, two different iovas, presumably one per plane)

With OVL_PITCH_MSB_2ND_SUBBUF left out of DISP_REG_OVL_PITCH_MSB for
these layers, the picture is correct (nothing missing at the top, no
stray pixels) and there are no faults. I made the bit switchable at
runtime to check that it is the cause: with the bit off, 0 faults in
30 s; set again, 20 faults in the next 10 s and the artifacts are back;
off again, the faults stop once both planes have been updated.

What I run now sets it only when the layer is cropped, going by the
suggestion:

	bool cropped = pending->clip_left || pending->clip_right ||
		       pending->clip_top || pending->clip_bottom;

	mtk_ddp_write_relaxed(cmdq_pkt,
			      (cropped ? OVL_PITCH_MSB_2ND_SUBBUF : 0) | pitch_msb,
			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));

I haven't been able to exercise a cropped AFBC layer here (the
compositor only uses full-screen and cursor planes), so I can't say
whether the bit is right in that case. I also haven't tried the
resolutions from 2.b/2.c or the external pipeline (OVL1).

I can test a v2 on MT8189. The board's patches and notes are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy

The testing was done with help from an AI assistant (Claude).

Thanks,
zoan37
