Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560392;
	b=1XTqagvmcwJkBFnuMG6qU6sUhZQ98fRZoDHmI+S0OfkshkpUtaV34l++O04sNyKPvPKI
	 OyLEC8Dp+RIiS7JuaNPMHtIx7QOMdZz1Be5at483ShmAQ2ZxmXkP8dTtnlw2QhTyKwey5
	 Y+BRSWlXzlFzE1PhPlFJGnxnrzo9HOnGfo4/1FgKCtLv40UT6w33a1tl+jjAJZGj0EEr+
	 DHmX0HWLVci95HFavlwsgKj9OtH8/EZE0TGDZHrbErn2NEmzEG6UwNGfxSb10kfNZ1aeL
	 T7CHbGSCX/O4bk9KK/t4/TrjO8KG1OmdWzcImZtUKtuEVToxr1IBEc6jSECfqNEGg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7rNzRbJ/55BT46qZauMU9GkZ1yJMZW1L/iinWzPbSDs=;
	b=ZgbqtvE3YDMXI1SgLfIHYP+C5xigC4B/LX5H0FI2M8+ZstUXmgAusUHCk7R1Y6qhP6nR
	 dxZ9ni09ZC+lulOzrpV+6a+QNVk/A1XtNp05lF/xE7KClRyJt5EhWJjlPDKaluEIQ6Nxk
	 FyKFCSIQ425uF0Dot1Orjb0gyxw+hLORe6Ycu9cnpQIQO8bijdwsscjbu98UToIxsyFrK
	 o0zh49fBcoIKBnYB91TuTZ40k1Q9XJeLYkOhWrQjsOEMdi2EpmFn9XfiSfOmR+fiaibS3
	 MF+zOdydkwcoC187UdS0efIVyRi1C84XpW3/bCrP8DFPQHQJusx3xg00LFS4RFTjuYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b31261e8a9so5251387b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560391; x=1795165191;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rNzRbJ/55BT46qZauMU9GkZ1yJMZW1L/iinWzPbSDs=;
        b=TLX27eU57WsCOIcHuShF54SgnbpZV0OVg6wfhoOsmmj72+exM1ZcW0ehdv9OZmN18c
         H/TwNXjQsQh48dmodc5mv1KnCDONuoWN/8ClujHjhRomL6Szwyzj825KIvCjuB+b1Do7
         gl1UDHB00u36Qf/yDWP5DyvynR+g4DXhvbTp5ZMp9splfQeEkRR3MhRu3MqAFhbYEGMF
         Yfpdhej7U2RyoRHtkdV4cpZq7urX4n44dXy7vx1LggLoe6vRQdrh3mRz+BtkPVXXIqWK
         TxuaLE8a9Vpp05K2LTq56fIzkc2s2zVYlJJzsKAI6a22vJPv+2n8GOq2g8e4f2joLLgl
         BpeQ==
X-Forwarded-Encrypted: i=1; AL+hErFHKKSQ1jDxew2g8pZHrwuVYjNZXIsWXoyo/oSyv0bPwYPW/M+7cQVPzUcx1CgNwXlbOGYDAT8X+BdPhVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MxHMyRV9tv0lanYTKaZpQ3fbkd4fnEjS10FCNb0W04QI1HskZ
	Ure2TpVpzmoEyasDq0RfeU/NhA2r3jG8kbLvqSB3jWiUg8kwp14uHk1o
X-Gm-Gg: AYBFou2ZFzbCvftKGyh74MqeR9Q+IbBORHgI4zqFikCMG4NS79YuSiwJGQK2ZSH5otU
	YNt9BVTh6BkuCgxaH3ya7J4DWm3I7MjA89YRWX2LyoRKZzfGkQizZ5DGZLNZWlufjhFPQgbteyn
	aPF3vx/SEP7deRty4d6C53AafnDQoLUGe7twPldTp/JvNrofnrJxrsViBus8rLHBJfJY3X3nLc4
	kvW68iNuwAygJ/TGab2lvqdOl1ZDvVlL8PbSMnyyRzJ9nFg/AikrX19X0U3exRK6HCWAedui35V
	H2P2SOCno+XmsafKjztQ6MFyBS6NoCmzS0cyuRmBdS5muBUV/hRrK6q9q8dZZjMWLR/q3Z88iRI
	5HCvkaPTznaF3mwKbfHemiWDLyEVB13yZTUKGVp1kM1nUYy8FmZxDoH24+GVdTPoM8beOum8ppm
	gT3BIzrtwem5FhQk3RBo7+FYOmc1282dWfZjtiBS1HAFxd4Me7sX9hHTrg7Iovui57XiBOaGLAT
	9w9qXzLqq9GC0IKNWm6RUrAAZ2RyLEBfROgUhTrSi0a0WnwYMySoVdRHDqq2Pht0fm6F9m5HARi
	W3REZLq8HQTy+2xGq1vmDOB8kuJdFI7pOA1TecZ9q3BswEdbCTj6ppNgd9WjzcUYHr3Fngd6qCv
	21cdIOpgrWeNONxBvdqsqAPuHN8DBZh4o
X-Received: by 2002:a05:690c:386:b0:8b1:e7c:cdcb with SMTP id 00721157ae682-8b4aa2f2467mr15379307b3.23.1794560390743;
        Fri, 13 Nov 2026 00:59:50 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7ee70csm15720497b3.6.2026.11.13.00.59.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 00:59:50 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: u.kleine-koenig@baylibre.com
Cc: dri-devel@lists.freedesktop.org,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com,
	imagination@lists.freedesktop.org,
	frank.binns@imgtec.com,
	operatingsystemsdepression@gmail.com,
	matthew.brost@intel.com,
	dakr@kernel.org,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 12/13] drm/powervr_sgx: Add the DRM driver, power management and debugging
Date: Fri, 13 Nov 2026 03:59:47 -0500
Message-ID: <20261113085947.62594-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <avajebb1alBnAm8U@monoceros>
References: <avajebb1alBnAm8U@monoceros>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 07:23:36AM +0100, Uwe Kleine-König wrote:
> On Thu, Nov 12, 2026 at 05:59:02PM -0500, Joseph Telaak wrote:
> > +static const struct pci_device_id pvrsgx_pci_ids[] = {
> > +     { PCI_VDEVICE(INTEL, 0x089b), 545 },    /* CE5300 family: SGX545 */
>
> Please make this
>
>         { PCI_VDEVICE(INTEL, 0x089b), .driver_data = 545 },     /* CE5300 family: SGX545 */

Will do in v2.

> Don't include <linux/mod_devicetable.h>. of_device_id is already
> provided by <linux/of.h> and also by <linux/platform_device.h> without
> the useless dependencies that <linux/mod_devicetable.h> introduces.

Thanks, I'll drop it in v2, and check the other files for the same.

Joseph
