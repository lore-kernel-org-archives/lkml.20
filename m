Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103720;
	b=XvsUk0aymX2Bmnyy18uZ/82os2674srZ/VI5RdSQiDGyy2IUihRJ0E21rLeLC0lalcfE
	 3xUpyUv51hviDbuW5eWatnW325nRJk7nitl3gGnLPUElEig3ojOwtEcMl8+HkGwyaKY+7
	 C8gd38ZoAkO79FjAWkT8JYiWoi5JHDUWCCqmFddQse5BaFgZNkywhDkfHdhRG9Xq49G8R
	 mF7H3xOhGXkBCb8MUd7SJK8f0wCSvgWZgE5wAYFH7ZgDdiEoMiC73mQv5llASMRcRSkp6
	 wd/AseQuts2ThOpXwAHnjX8o7Qi3Y6Wlht3tfIDQaYngzn9QMi/a9JFvhSSXIUf3tyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CjWvn6AFi1A52TxbvgaZZpyJgGj9ZtMA7w6Z+oUCikU=;
	b=y/8VFMKnEV+mbTlHPaljkeQMlcQ2UPDZkS4vww54l/lgXFfNGqQgZnoIy9y2w00o8L8z
	 jE7Idf3ARfh0fOwqOw61qB8G8nJzBh578LH+FwU+AcL1TR2pFYdOTMGaMnxtZBW31ejzK
	 nx5v8pY5RSXVF4FyFr/YM1zjiXD5aKeT0FA2ToBBeVGP6jduhBOJ57YqXIJK2tqSFLEa4
	 o9jr7v5YzZZrNR7wxnSFOweO4lE2PZZacBXAdpOTDaOZKOeHESRzHXKzQfyU08dVnEs+w
	 lQMmNIrj0s68QF4OTra+OP0jjjunCuKBg9K5nAcIcDGgAfVcnbTbbzuyHqFXE/vKcNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hEM7Vq9U;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA63606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA63606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hEM7Vq9U
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19088465e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793103718; x=1793708518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjWvn6AFi1A52TxbvgaZZpyJgGj9ZtMA7w6Z+oUCikU=;
        b=hEM7Vq9UI83EhmjxiULTmQewGqr2XpeyKaHE4T3ujUWQ1sKYuM2vEMA1NcZKUceD65
         qiNW3w/jA1selWoK0OXpToAzmjDj90pXA45+BSm6Bm0sS0MjJeEQ1k4oEjIM3UqL4AC3
         vIJKGGxOPPGafaUfgbtzOCqSZuV8qmZQy0/luCwn0z8St1VZTTxpj74PMUpcfomeGq4G
         x2hdcXV+YVPKmy2Euy7hLYdrilbjEJOxS+Jdn2l2yqlj3zw3QO7Rb+vKMBMC13JTQMfE
         mKXdSjF4U9CzaMj1sIofPpONo/KUXYYbOgENENs5hNs4KAlJqB25q/uGL7b0FBymaW6q
         CKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103718; x=1793708518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjWvn6AFi1A52TxbvgaZZpyJgGj9ZtMA7w6Z+oUCikU=;
        b=K8T5uBdcW1VepJRpRCL82AEo6nf3sfMzZ84Wf9jTdgxLeCr5omqeWRj3+B77toER3l
         FZKfDgQ380gNCPsOPlqgOmCzyYY5qin/c6lHil58cXapTkDf/9MVGJMnq9LJ8alDHQSl
         BO1GQ2ecv6Gk/lyV00xVl5V9dhGcG/dZRwsa+DjI+KGH0PKs/93St4M6C48//lis6HfK
         L/qjd4xKNY6cIr02vvXXzDk/gW16ON0hs2JddWKcavv4LGP1hwE9wGnbhAbFHqVQWbr2
         GIyut3rGQ0P1thhxM2RJ+8m1BYiQnCcVmo1IWYwCla7dbyWKS4YBGQoJ0vm5Zq90fAJ4
         /gIw==
X-Forwarded-Encrypted: i=1; AKwUvBwqVIxOkwn2ZrAVbvjdPW3kzbesxK+5yRly/Fy9A5yDbBkZvEY/dwUB2mIz3FQn/kqRZXwnSW1oGTuTF6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKlUTIkxji1vGUJHjdAyJUlYjuUgQ+CGKcYzODItHZ94TcIzHE
	qDZyJwBJ3re+uh9yyZzKW+FUxRP7HJoi9EbZ8rEc4YHxHTaPT7Ao7MqH
X-Gm-Gg: AYBFou19km9+I1A4QNRJFOzUfiv5nsLKZztAGLccgHY0F60lSg73NjIiU+mSHzst42l
	IpvDViuyLZRDSMsgIFoSSR3NlRFurYXBY76vdjWUNL29U+UU9GdN9ffKvE7dVpAyvRXi7hJV06L
	vOJMn2TBRuWMiYWBRHbejlRzB2cNgwk6EyDXdjKxw5MNQtn8G0gKkLerStQKfN2dbCPQ85jkNyp
	CXmrA3qgiC6qr5nwr5qq7L+aiqdAFrCobG4APCKMJcASoVn+kanDDHSSH1qS1nyJDFwVOu8WNE1
	PvmYFKuidMZfah+tXiRt4+5tc5SbA5Mkw7MZErrhZ680osIcP+uYiEGQbtDxwU3Ja1Lgo6DNO6C
	5doZvttUiBjyEk+ZHliuXLkgMmDOain+meOowDmpMUz/Lde8VON6bxfZ5F/HJX4dzHBgCXUNqTy
	cXpvrcNDtz9J37dvQga0zgDKkrgjkahnlF0dVckcr1Q+9fXvxyPcLKI0L72qN+UZE4ThQJF0hgJ
	i4Gcrsl6LDHtA1CAbY8faC/Q7wlUhCQS97GpvWgQjezr/F2tR5xT0BKxSY9sLm6wRFlqE4LTtHM
	Twl87Nw=
X-Received: by 2002:a05:600c:4583:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4a35ac963edmr205653775e9.19.1793103717674;
        Tue, 27 Oct 2026 05:21:57 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm325465755e9.7.2026.10.27.05.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:21:57 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before sync_state
Date: Tue, 27 Oct 2026 14:21:46 +0200
Message-ID: <20261027122146.24778-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261021080517.2161-1-okerixx@gmail.com>
References: <20261021080517.2161-1-okerixx@gmail.com>
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

On Wed, Oct 21, 2026 at 10:05:17AM +0200, Oleg Keri wrote:
> Until rpmhpd's sync_state every vote is clamped to the highest corner,
> so that hardware the bootloader left running keeps the rail level it
> needs until its driver takes over.  Nothing the bootloader leaves behind
> runs on the GPU rails, but the clamp hits them anyway: the GPU clock
> controller's probe runtime-resumes and suspends its GFX and GMXC
> domains, and from then on both rails are pinned at their highest corner
> until sync_state.

SM8750 (Adreno 830) is hit by the same clamp, with a different symptom
and without CLX, which is only enabled on X2-85 and A840 so far. The
first GPU init succeeds, but when the GMU first boots under the clamped
gfx vote, every ACD level runs at half the requested clock until the
next reboot. msm.disable_acd=1 avoids it.

OnePlus Pad 3, v7.3-rc5 plus board patches, msm as a module loaded by
udev about 4 s after boot, GMU firmware 5.1.25. The clock was measured
as drm-cycles-gpu over drm-engine-gpu in the fdinfo of a vkmark process
keeping the GPU busy, at fixed devfreq levels. The four kernels below
differ only in rpmhpd.c, and I alternated between them from boot to
boot. In every boot in the table the first GMU boot came 62-81 ms
before rpmhpd's sync_state:

  devfreq (MHz)            342   660   1050   1100
  without the patch        342   330    525    550   (10 boots)
  with the patch           342   660   1050   1100   (11 boots)
  local test, only gfx
  left out of the clamp    342   660   1050   1100   (5 boots)
  local test, only gmxc
  left out of the clamp    342   330    525    550   (5 boots)

Every value was the same within 1 MHz across the boots. On one boot of
each kernel I also went through all 14 OPPs. With gfx clamped, 525 MHz
and below ran at the requested clock, 607 MHz at 539-558 MHz, and
734 MHz and up at half. With gfx left out of the clamp, all 14 were
within 1 MHz of the requested clock.

In one more boot of the gmxc-only kernel, sync_state came 83 ms before
the first GMU boot, and that boot ran at the full clock. So, as on
Glymur, only gfx matters here, and only if the GMU first boots while
the clamp is still in place.

With vkmark's blur scene at a pinned 1100 MHz on the same boots, this
is 414-421 fps without the patch and 831-866 fps with it.

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # SM8750
