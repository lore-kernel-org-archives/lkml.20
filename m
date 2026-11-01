Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793501756;
	b=lKx9QRCwcWpqyGtlIGA29cgjtKaJPf0CCB6j951ZnO5fP5JIsUlq8kiwvNGsRdxWwy8k
	 SBuw0RorbH7U7VmfdcsSDV3b3cH+PwaZLWSEpPTvyYTu2zferM+BshL88NTfvcaIfUgAT
	 8sFXNpCWUqD6OI6xS8gjPEj/cnfrnUpKLdkA9bPEAVBk1j+a00V5EJcfFqEPcGpLMdouW
	 9uaz2ik5mXYKhc+552X7tx5D+kAZJ4HTdUaL7yNDjSPcQcIwReqkhIPf1EI2vdUFPXgmV
	 oU2/l1qRhNo9Od7evOa8UiIyx3P5pidrHT63zE9ARtUwHZcJTuSQCZ9QFxwuRoQUcyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793501756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rbia2ZdVtMV6lCwGNxC4eIg9zkBp56JlTOTvsadIUzQ=;
	b=CO64zfv6hhdBtqsSn7oDvzjA1nO71xCIa4l2hbNQL0aHTSLD4WSvMsj3vcDeM8tcN4WZ
	 UJIDOZQ+Ct9mmX0+4mAEQyUva+j7u+D0rGbvjxBuE0e4ueSBG5Sgb0fuJdptuSSuvDdiZ
	 15VYmSAu18LupEA+F4yxmybTQCQLWMYTvB3O95xXU9kSggNntjuEODn/wPP64uG2kx4tC
	 Coku2CvBKm+pZQFP5MLUrU0+rf+me4MKOLiGJfgI4bcr7TU+K+0UMyYSPY6RPDRi7Yd1z
	 VWLU/6GlvpstWNhJ0i3z+UlkvB+hatKHQrR5zFgomFFYpM8F+7uTx6AhHV+0BEu1jig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GQu/yWwE";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F57606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F57606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQu/yWwE
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso784527a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793501755; x=1794106555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rbia2ZdVtMV6lCwGNxC4eIg9zkBp56JlTOTvsadIUzQ=;
        b=GQu/yWwEo/ufwz1xx65OMIDDMJqQ5+BrZ8RU/sQlPM0BdIWEUCaUTrcWJi+DPcMav7
         nnUdQncF9BHfL+Gjk+F9j3DI5OkeQfQ+yXY6ypCNZ/Pt7g5WWu3i2AbqnQXwvk6BmQnE
         nqO/ILx/dIJmgaQkmYU+7mEETjh6IDS5oTYHrTnId7owiVrBZ5o9M4LLxhXxW72sRyzf
         vFW4aOpF13nTjwWaPFfkvd8lxRlSgx1HqkhuRXaPQQw8V+YsQR6NNYQfQiw601kjmwGy
         ZQ1ZrZeVweKpDlsOfU+mNBNOqB1F/vYp+7hLQCHQ1NSHh7U6fdQ2P8slUIMx0f3bDxXv
         mx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793501755; x=1794106555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rbia2ZdVtMV6lCwGNxC4eIg9zkBp56JlTOTvsadIUzQ=;
        b=GRMwjgpag9RlgyO+xCaZQmtbbNNCseOjPe6ECdVhbCdaeqUv9ZNVIgPmiubzh9szIY
         emGIlUjMzPbKt9AZ9cttpvFTgiJ9qmyoXVZ12tiiSuw8EGNq64SpuPatA9mZm/9cv95a
         cvJaZF0jVSYJiroDOTqReL1YmZtr5MInefRIjirQvkuot56E5l2QPL/b/QkkcVAJ9rsC
         JU8keRZe/cR4Meb+oTGTu7HMvdC06Dx9CGtUidkbQM5iOdVenwV8YT/J/HDXo5t/9XMP
         cUK3ScD1gO3xNpICLlUcID9TIJCRIY58Do5vLuzSZeqe3uXMnC8iK0AOLmB9B5qGS/4K
         3oDQ==
X-Gm-Message-State: APuU4Z9HEGLXsWRT3+qgTe2sPnWQGvgWmv//8jfSpfRJW2rfnjdeJjsX
	cd6CL7nrhcZa6UoPkzb1RhZ9MHETunRdpE9IOxhPi616ht79RFv36BEK
X-Gm-Gg: AYBFou1mgLYrkODtZ7u/RuseneSODCYSQWF0MAkSNKVEtZduzl3UbssJYX3RX0QYYex
	4Pjq9FoJTXWn8VtukETLGVAiP/IqDo2asIX3UUUQ89bGBWtRUHubj3+TuNcB3GCI9vyoZpBpJjb
	UHmM6U28vU3uoD2ID9M0M/YXgZoy1XlPV7vjtXnvEYKWOpQpdbe8ehNoHH6VHBM7xnrZSJYMTjv
	tOdyf0yq0205/yzi33F2Fat9Nhqd6DyECzHxCbmoRGNIu/gVbXPGaEN3A3SwciBpzsshpt16wMV
	zxFaf5hi1o2n9+2mLkHMBhBxm6zhMUPkeB5R3WZnk5Z1q7AxD1V3Kfhzw80ZZIszOWMr6uYN3ZN
	PBHgJCDZnJVjmUutuon8rKZb29FjJe/o7gXlvVQp//MbvsjKfUAOFF68ZBRn2kaZnTJmoiNDXQU
	6XHNTXaSgMVNTRGozDX7O5nUuoqdVLaUd0nFdbq94dPQP7p26FvnwyjBpWHUFl5a4kforO0zi2S
	+Lev90b8Y4tk9lsq/sVFIvNWDyXC4eIsssli4EsF3fgWXd5OpF5oHB2TslCi1Z9uadQp8VgQ/+j
	YRWQca4b902BYsVYPS0dV+UNeWgFF0EDkg==
X-Received: by 2002:a17:90b:4b8a:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3ae89771679mr5168991a91.44.1793501755440;
        Sat, 31 Oct 2026 19:55:55 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm8980297a91.4.2026.10.31.19.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 19:55:54 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Warn when firmware leaves PARTIDs disabled
Date: Sun,  1 Nov 2026 10:55:50 +0800
Message-Id: <20261101025550.1633447-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <8950f9bc-8ca9-476c-a7d6-2b434908b80c@arm.com>
References: <8950f9bc-8ca9-476c-a7d6-2b434908b80c@arm.com>
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

Hi Ben,

Thanks for sharing the direction. I asked our hardware team why they
implemented HAS_ENDIS: the motivation is power. Enabling PARTIDs that
are never used does not affect performance, but costs leakage in the
registers and combinational logic behind them - with e.g. 32 PARTIDs
implemented and only a handful ever used, the unused portion is pure
waste. Their expectation was that software would enable only the
PARTIDs it needs at initialization time.

For a general-purpose driver that cannot predict how many PARTIDs
userspace will actually use, that is not something we can do. So what
I plan to do is either enable all the PARTIDs from the driver, or ask
the hardware team to drop the HAS_ENDIS feature.

I am happy to drop this warning patch in favour of your driver-side
enabling patch.

Thanks,
Ping
