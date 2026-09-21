Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BB94BD10B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004858; cv=none; b=TUrabpWRWlED90vpaydwFvO9XvW6q0kLaT/t5gmiSZytHHiHSPyrGeHraMCJd2L1FfGfc3jsEFVlx507vRXfoZnBGjHVjlSaJxAim/HsIk7vDL3AK/QFYxUZ8ku4wrmWom3k+8WT9cc9nCBZm1P2pj/wFBKUPICY0g8OjAcUQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004858; c=relaxed/simple;
	bh=wGmrIqcdIcZU3r4B3ZiqI9AflO7CJwQ1F6YuHGdbybg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMKzo0OGRyufsSBEZifTCduws5+t15uxpBrl9xCE2HXsHRtDTyZwFAdaUPDd0tnEMVWWexk8X3+hgyy1BtwIxDjQkL/T8uvo03E/tUWh1vEjOoRXtNKKuX798RoPOoVshOPOhUNaqWsgJ6oeiH/7tE+xQD0E7oI6ccLGClkiM1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgKPeAxT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgKPeAxT"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4843e397f74so3339f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004855; x=1790609655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqhSWBti4659IVEid5ZOd4ooKHmp9n0NkC3/DOwtaEQ=;
        b=IgKPeAxT1AeqOypFM8ZZMbFKuriYWxHceGnvJdeQRpS3LPQmQcrtOrzVyfMtGblIvx
         la8x4BWEHvXu82Suj6WVsDqJ+O0Dgr887ohQ+8kWS1SQAX5TXikSxQMN5fvXj3r81xKr
         oHOTZ664M4QUoczuu+s2YU/jYfT3obzVllq0oncqH4A20Obc/fTCCuYrOpNxa5dHgcmJ
         CYoCOd+BEmsN9+bGUUGm7o3aUsuqq4p+SNJ3q+NZmYYLtQS7SVlpCC+wmVdsBgcnEzaW
         rCrntHh+a27qrRy3w06UMaL7QyQCRp6fdaPjk5onKL/h2YXfxYYBA5uFsfONacHwSOvV
         lxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004855; x=1790609655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqhSWBti4659IVEid5ZOd4ooKHmp9n0NkC3/DOwtaEQ=;
        b=fjIsBYrL879NA05PLGmNAWRnLyG6oo2bzAearKEh6RlrCd+oCUyfYwn0cDbrD6EKPh
         cIEIJB3/SJOBd+M+KNTcoxKQoG1KMBZ3VXb1gIF9v7N1ow7TTMy/ZP1JaEWaqfaBkqwX
         Ch2Q5I86SCOYZEUK9ngw1pI4cat6/IVH8F7RCJUCR4/8J1+pEuuBzh4zwAzvKuND1YFB
         VGCzmzeZzbSPmBGr9SL5MqZo1sed8VQDZCweEuD/llHkD7DhNrG8lucmWFAbG8vZK7NR
         +eeenuMS47F5KqoiZm+mYsp6NGTsCiptN7uAC4GP9wF/G8Ii/bgkecK2QCH2qPnIA26f
         WoIA==
X-Forwarded-Encrypted: i=1; AKwUvBwsmC6rXQI9QM/AKlSmLSH8Zlq40KERQk25U3XrWdjLKuM/mYMCcMIN2oFIqn1FzHVBYkiQe84twTHSDek=@vger.kernel.org
X-Gm-Message-State: AFuF++mQkYNmgd2zU+S+lhlIJvowpIcPBhmDIlEivUMI1pWaF9/jXVBQ
	B/YmHtv0PkdLaerOP6jQxnyJxDE3tWlOtp/qj/m2eOhV/b3uNMv1x4s=
X-Gm-Gg: AYBFou1FbFhesMD2pVgmCNzD2gfg9Lham+HAKsEnsL3p746UugVBRt2vlaOjv8be2+7
	z6A+8mTzsoo7j9Xtl3eQdRs9/4T/TbNnMt5lICBXTbnPOiw+ZGFH9UBawWYpo5RuDYshCFuyBzn
	GbyMN84uZ3nTOioyvbd4C3wX81RFwLTqO0W3RtmyGgMO5iLeEhtHEcZOCxmzrhxXmuus49YsWNC
	++k/oTDHZ2KB2otM+bXWl9J7icDKh8S59tPRtiwBjfoBtFC2Ia7T6MIqwdbS9PtUkU0XtBkXieQ
	yn395f/qkYjAq3V6AUbXVzGik7Ox6lCgLNieooHlVpguDF+dwJYQPgN5goLaYqdk8aWdJxr+H1P
	73VMyQdp8p3x+E4q5d11n5EUAl2qommUV1ZkvOMwv10yVqXH2aUyW8VXcFb1wpF1kx4DpSoEm2Z
	2C8I4kWGUeDZvjo0A4fTumirul4dIzzesTzc5r4A9yZwariDf7/Ht31StOisdFuZreVerY4qMhf
	U/+qYFhBoLoQ2PSoxstuwb1WgflZkiGsOg48gH2bgkYeT8xRH4VU/o=
X-Received: by 2002:a05:6000:4008:b0:487:955:e6c3 with SMTP id ffacd0b85a97d-48860f27ad0mr103491f8f.0.1790004855209;
        Mon, 21 Sep 2026 08:34:15 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456ee4esm22668564f8f.21.2026.09.21.08.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:34:14 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v5 0/7] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Tue, 22 Sep 2026 00:32:57 +0200
Message-ID: <20260921223257.534258-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914180807.150971-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260902142322.73523-1-fernandorimoli11@gmail.com> <20260906073932.24090-1-dmanresa@gmail.com> <20260914180807.150971-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026, Fernando Rimoli wrote:
> The series was applied to media-committers next on 2026-09-11, and your tag
> did not make it into the commits. I have pointed Sakari at your message in
> the follow-up fix, in case that commit can still be amended.

Thanks, but please don't spend effort on that. The coverage was the point,
not the line in the commit.

Two practical things, because I am donating this Surface Pro 7+ shortly and
will not have the hardware any more:

- Don't hold anything waiting for a test from me. That includes a v3 of my
  ipu-bridge series: it stands as tested on 6.19 and on top of your v5, and
  anyone who wants to carry it is welcome to it (Sakari, on Cc).

- The two remaining literals, the link-frequencies values and the lens-focus
  name, are what my 1/2 fixes. Take it, rework it, or rewrite it under your
  own name, whichever is least friction.

Everything measured on this machine stays public, including the register
tables extracted from the vendor driver, the Bayer-phase matrices and the raw
captures: https://github.com/dmanresa-saes/surface-ipu6-cameras

Good luck with the rest of the series.

D. Manresa <dmanresa@gmail.com>
