Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92958175A5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296421; cv=none; b=YXuA64aiFtXpgbyGPaHJMnkXj4g/0iuF09v8yg69Jh6U9fc7tG/NCWBXwvKdpyW5KJ2b04BBmsTaIlhCPur2JJu0MsxbTFbV7+hsznmispmhWwFdnX0MSMYqPnhvEbgaeSLucEnpYEvCdaeaJrdhqzd8AmwGj9kXyyI59nWORhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296421; c=relaxed/simple;
	bh=nExcxFMh2biVsi0UDJAw4H47m+9qt4oHDND0s8zA6tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNVvqgSRPeCGa7zE8Xo9yiC7qTcrFFuMK9XmiyNQUrO9x3cRrqhS3LEX5sIebCVCTEf+HBPjSY2LWgdIoF4SWmx5Q+dcg+zD7dlCFRVkDEmWFCXTqnd01dcsYrz6yfItkntKRZntDz861MUf9VnpKNb2DYDOzjp+nV8JnSWQeCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUDRPoCP; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUDRPoCP"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877902c99so254360f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790296418; x=1790901218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nExcxFMh2biVsi0UDJAw4H47m+9qt4oHDND0s8zA6tk=;
        b=iUDRPoCPqd5OVpNP9+6LjlUF9XJ1d/ivdMvS8R3kg4Nnq5pvUbPrk/Q40HKKjqz1eF
         pJToLOECXBZvgIosau5NcpryMDZr5eYkCqMQrljGcaleZ4v721LB13ITggQp+OEJX4MT
         JK3UshAoZAE6wGcLU93TCNyxwEHLyBa0duiYv3zFPc00evY8FMyrP3zuQmXgmNm8GIDX
         jAZfUGmbt2a7d8dVrQ/t5xSxfIQfUkzEr6smf+nR69zcJzu5aK1+NX/6uM/TnfgPvRfM
         9KvCL/aSzP6aIMOC8aJ4DpvEC4tNi34ruYtzIiJUVWO5XOQsrvcD1MHZyskVHt4Cgvl3
         rSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296418; x=1790901218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nExcxFMh2biVsi0UDJAw4H47m+9qt4oHDND0s8zA6tk=;
        b=tVQwUcbmBwEpnePPUxAroahE7a3yZpOyxfN1nRNgp3VtpFdGQY0fU4IVabJFhspe+L
         jeZ7TmSHDtVoiQf3HHMmjcp8pOMrK/vNKaFbD+JYHDFEGl0pdwfUGG+IKUO8vUDg7BXm
         4xgWU+pDLeNf8NvIt84ugvOpqBYDCZOWNhKBExVjdOlNgAwjuhPx5wH3n0H5jqZp8Goo
         V95rVhLL7BIt4HgsifDXwO8C2D1O7MAZS3kIO91TLpHtT3mlTocKKG53RanOUjyq3AY/
         oVZqCd09FjEvJLFZgqt6sMDM6q8jb274bT5zqX6aczzcjm/KiWHQlcBxRqUdri3E8R+T
         EN5A==
X-Forwarded-Encrypted: i=1; AKwUvBwWYmjYvin/2yoqhFD58lU+q8uQwp4Tmdwj9Gk/AbMduk67r/IL9QwANBIoOeEmG+9ECdiMrKCInL6DG1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kDGbh/u81YHgIMri9RkHzoU8OXHRbG1LRM7ssfOsoq0Sr9DyXf
	8V2gSrNl0y26+j4Ld+Ti0LLCqI0cg9J/WRP+6b3vAx1y1EVUJB87RBOs
X-Gm-Gg: AYBFou26Yby1QuERE8O9hMAHp8yF8HcifLc8Pp2X1sioNvS3npMPSVmR1EBgDpZWX/Q
	PPR+Lmg6LRqlRnoIKE2y/KoFDkj7rLgrBULDRFHslrYeekqhg4mf+gpqGJUPusrHXiYgNKzPcG/
	PYHK/v0/sv0gzoBOeSQhnD7Bjs33PYMMfoWhWwi5f8Kb9GEa+hi859IicDOppouHf0Q1v0iyE8J
	tl0zvCnrey9KC7waS0K9+keqV7HtEK0QP0GziH4OKU/MTeUCsAfAHrkgx9G5o2qKwQWXUEPC3h0
	zlgeV1nD+1d8gx+fZychlLLuyUgpVUzgTEzVIJ0TCUXY5AU+sLVAY6sigp9qr4aQWeZoaB8vagy
	BrBKps8qVn1NQoj79WMojcGzvHezOhh+ePuJjqT2ELMq/tkCE6IWzU9qgWp+M4U/MAy//E9YzO/
	bZIEPtiINCwaLWXk5b4p3EKVA+jeHTK0gePSpnt3iwmMxfgXFoX4ogTb7YTx014kUJAPKDJaIHT
	kadB2UDPnNZpG+fK2aJqTwwbwy46cmO8v5gij/aQJJTEwgzQ3C5QobS0a9gxZNb6e//256gPqZp
	BWkQk2BhK7y861ae
X-Received: by 2002:a5d:588e:0:b0:487:218b:bc01 with SMTP id ffacd0b85a97d-488716c9720mr8222639f8f.20.1790296417643;
        Thu, 24 Sep 2026 17:33:37 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3627a8sm3412551f8f.23.2026.09.24.17.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:33:37 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] ASoC: Intel: Add Cherry Trail RT5677 machine driver
Date: Fri, 25 Sep 2026 02:33:33 +0200
Message-ID: <20260925003333.1080085-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aphNzNx3G4qDt9X-@sirena.org.uk>
References: <20260902123007.769820-1-mauriziocasciano7@gmail.com> <20260902123007.769820-2-mauriziocasciano7@gmail.com> <aphNzNx3G4qDt9X-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark,

You're right; I missed this review. Sorry about that.

> snd_soc_substream_to_rtd()

Changed to snd_soc_substream_to_rtd() in v8.

> Shouldn't this be using an ACPI formatted name?

Changed to "i2c-104C227E:00", matching the ACPI-enumerated component name
and the existing Cherry Trail TS3A227E machine driver.

> We ask for more names below...

The later requests are for "speaker-enable2" and "headphone-enable".
Those are RT5677 GPIO2 and GPIO4, supplied as software-node properties by
the Yoga Book platform/x86 v3 series:

https://lore.kernel.org/r/20260829225729.395270-1-mauriziocasciano7@gmail.com

Only "speaker-enable" comes from the codec device's ACPI _CRS and needs
the ACPI GPIO mapping in this driver. The v7 cover letter failed to state
the platform/x86 runtime dependency. v8 now documents it in both the
commit message and cover letter.

I sent v8 as a new thread here:

https://lore.kernel.org/r/20260925003030.1077471-1-mauriziocasciano7@gmail.com

It is rebased on ASoC for-next at 74612d0b448f and the two affected
objects build with W=1 on the remote build host.

With Best Regards,
Maurizio Casciano
