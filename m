Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB63BE17D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694532; cv=none; b=GOMuhp97bs+cRTXOwj0rKTl1KREa/qbV1VJyrhnQD0ebPBV93bjeSuB5+M02vup+9ktpCo1LYIkFUpRn6uRM03+OaBMctN91/9X1/dWtf+bgU2Eg3oK4zJ0SebTLtEBQtZGzpyB7xQXD+IXyuhIlA5ex6pHB+o7puRiOH5ogD2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694532; c=relaxed/simple;
	bh=1vm8W791i+oyZX52KOmmX+Et2MEUrtULENJgW2hzL3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZfHeMs60fwgm8S28d3uGFyN+0C3WwPU2cf3a80Hl97izwz3SvuqiuRkJDnHeBPpFMKrNGIzFfY5T09Kebg57PYWyoqnhad/Ut2KAoEb/BajxDY0yAo0xWi9dfxu52HhkLsTEvzDnHDU2JKkWSgXnLavAMknWWJEy3q/giBPPx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OfLpl+qM; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OfLpl+qM"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so196469f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790694513; x=1791299313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dnceoXDgkpFRLenSH/o1spO3Q3H0E/MswX6GkcSHu0w=;
        b=OfLpl+qMH77WcnsVV0mz/HbEty4tCBbv3g7RhVUa8/jZadfQLfJGiJiv0Yd2P4Ji/m
         6aUzNBwhh6HuGwf9niZzAFLss9dzdLGemuo7wTSrrLK89yOyGqYY4swJ9BJm9wae0an5
         Qrf3gS+ZjmQbjNHvLhSI8MyD6IE7S1Am5grm0Sn+oHWbNIVEqpJ5EBjl+k20OOOgZJwP
         075yWHlZR7a15YM5j6R3f/MyZR4dHf21PvOPirIA1XapEJnBCxPIIqER0ymm+OiZu4Zp
         o7G4M/nynAFISr6YaLeElh6Uj65moxg2HO9GG+YdA+JTa6VV7tffZAYmUFgoq6prr9dw
         hQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694513; x=1791299313;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnceoXDgkpFRLenSH/o1spO3Q3H0E/MswX6GkcSHu0w=;
        b=BMwG+bdHQf/O0EN+u3LTzyzZaBTScUh+GEX0+HcpQLJsNoE7Tdetf1GIb6k1WgaD90
         8noOdPKWOIskf+61oIPs7NrRSBm0Bl18IH4UFmW4oZKx6fMk2g9pMdE2rNT81sOaMRof
         sDfBVXvaKqsWhXhMceYR1gzgKi7u88mVDJgVKZJdYy/1RlsIH3qDn67BO/xD+7auspge
         afftgjhMQF21RFRUVuJj9Dn0YTuDD/SfLzEn5pT65FwN8DlIEVBzMaKwwlspIpYA8ypV
         dWALU8D9yRgTPp3Ik/vcKvJQP/qAr1/rfDcMChbBmn5c5qOgtgBk8LzBA39W751AiGbU
         BUzA==
X-Forwarded-Encrypted: i=1; AKwUvBwmR3j3M56sZ5zDl76TVN9Qqn+O2i2k3I9gEu60BYf5/LgbDaAtSL+V3ivQ6ZeIE0aDeAFV1k1ZRqkDF3E=@vger.kernel.org
X-Gm-Message-State: AFuF++kJYSvJlj6+aaXzLx9AxQBznO1zr7ZCJ6XiZ2KDW00e2H56ME5b
	e9WybSxa/KMgBv1bXEn/bPgzg4wvn3AhKutrEuHttr0BmamremJ242KH9ScdRabB1/Y=
X-Gm-Gg: AYBFou2wpILRsg/LuPn/PPmWvj+lpv8CVoPc2kYMGovCrSgaB52qfh29grfHgZ05fU4
	oeZJkDBwEwd33auqRgJpXgT+jmdKndeKAkWyxmKv4f71f6x2YxIfrnfD2Kbbo4A2wvLNG1whObD
	bIWfHvVRmAPuagi/YfuY3T8NiDFp/sijVpFuuSZbdaALGZyXJDkQZMeBuLOCQVM89NXHPv0IQfL
	kx5pqQPcQmojlP3qPNheYQbLOsjrYfRpQB4XhnhOCyiy9M4RoaI/UhG8hkthY+kLjB7s9u+CVog
	7v5WxGLWZDDY30WzQMvldasIWKB5FcC+0F+dwM9AYy/De+cAD8UFxXrd7dqAbFbGq4XjbaL4FVj
	EkEYZsa0c9fMN+70CQOqZrTaUgPPXoCwxuryHh1HkZOZy3QBRKhLf360Pw0hFsd76qHOp+LBmHR
	1gKmGq+AO8bUz1gwJqaFy2l0tqGicfgIHOv9lb/Lk4HT+EOapAiWpZclfhys2qvay9O4z7zuY3v
	2upkq4BNAgKA6c=
X-Received: by 2002:a05:600c:8b10:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a00d780b78mr53514925e9.17.1790694513382;
        Tue, 29 Sep 2026 08:08:33 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm113635015e9.9.2026.09.29.08.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:08:32 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:08:30 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] printk: increase the ring buffer for more than 16
 CPUs by default
Message-ID: <arvUbm5ECzXfa02K@pathway.suse.cz>
References: <20260927091756.50831-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927091756.50831-1-ekffu200098@gmail.com>

On Sun 2026-09-27 18:17:54, Sang-Heon Jeon wrote:
> The default LOG_BUF_SHIFT is 17, which means 128 KB, and
> LOG_CPU_MAX_BUF_SHIFT is 12, which means 4 KB per CPU.
> 
> By default the ring buffer is increased when
> (num_possible_cpus() - 1) * 4 KB > 64 KB, which requires more than 17
> CPUs.
> 
> Remove the explicit subtraction of one, so the ring buffer is increased
> for more than 16 CPUs, which is a power of two. Also fix the outdated
> comment.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

JFYI, the patch has been comitted into printk/linux.git,
branch for-7.4.

Best Regards,
Petr
