Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0285F4B7A41
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659550; cv=none; b=E8+w1kN67v67rYWYNITYBR71uO6acNZdOybAZW464VcJ37CYsiz6vt+BT7zYBdMcI+fsXquG+TOJ9ap5WM0SGSNfem/+Za4HHV3mC7/ymTZyhjeuEJkTen0N6JKROUAJO7oRqPyX6bRIklvvWqG/P2C6e9A2aYnqsyoroW7bwd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659550; c=relaxed/simple;
	bh=tL1lU3S6y66CYudldJj/uj6mbDDp8Lup5C09IlTTtlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3QL7DMTJIyXCFdM8d9aR/GqA5AcbAmGLNioDxQ8TATtGplqate9xGu9rWDfPr36dM9mAFUVb1QwWTHT1Hvmu9owE5jZOYiYcoWiiWzF1Ds1XiWvOtjPg6rMbKm7GN7ZOaCRCPh0QF/KeBr5heTy/gcgATlqq3rHS8Wx2swPzqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dITHWZII; arc=none smtp.client-ip=74.125.225.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dITHWZII"
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso580591f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659537; x=1790264337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tL1lU3S6y66CYudldJj/uj6mbDDp8Lup5C09IlTTtlc=;
        b=dITHWZIIOXYOGvtQ7uv4SXeffJmzqUnQPhv2Uj+bOODsz72IkLCgMU7zwkN7FeI+dO
         hfU99AIIAaXivM9mjUCJpGL1hY+8u3VKWgMJLdpxjZ3xQb8E1+3IESxigo/YKKeVFQ7r
         TOnFk47UzukMreeoY2IKO7Vp4WtqB8Ri3iuILcTW+IXzLWTs+LrPGnKuAO1KjlB/A3r4
         QbiZ/EiP7ncRnU/4WRO/IBG+Sed+rTmZxdVv1ZeZULsN47NUANA0gkrFQfDCcB2chWJQ
         OoVjyCOOO5+pA5Fr6VC/loA5fevaJJgAcbmYPXb7Kks6UsRKrsT3oUSYsrO6OBkMaJUh
         RMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659537; x=1790264337;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tL1lU3S6y66CYudldJj/uj6mbDDp8Lup5C09IlTTtlc=;
        b=GckdL9uN9hDFi5P6tl0K+gybNC0Xis7+H1zTI4mlbwubE+3zXo9qEUmDvGogYsPwkr
         cfRAso9J/RB7XsHMsg9Qz6Dn4mybwRFsN5uLMCmfm5ysNWVMSUQngaNkStFaxplnnyqk
         +62kJ0Hl2EN7XH4F+jUXpMVc/IvQMYzf07HDs1NwxvJUfl8vGA60CQ5Flc7tQgc3Md27
         ycVTJQpQTiUYdBdOLLzuZw8W6vXo+zkZbkF4Mh3+4vUF4iFD1nmWcqpsDTOUTCkS9kR8
         bpmYLm1eXpyp69XuhT89UEK851EDonAcTjlQZetvyw8Mv3+6qn6B3AYaxXuuI+ksppi7
         e0ZA==
X-Forwarded-Encrypted: i=1; AKwUvBxWNH69qqgqbjO5QjbKXey9xGzt+bFrUfR6W1ChmOOqpiSn3dsNnRySN4hpsykMWpvoew9GrCd0DX15+qE=@vger.kernel.org
X-Gm-Message-State: AFuF++m29ttD8DYScuGNVLWsIjrtmAr383e+T+2cLpHb+aa35dIvkrCA
	Q59nGiRddWLeCv9Ul/axvb+RRUDxxg26LK1Li4BW8KizBNVz+Bjc9oQm
X-Gm-Gg: AYBFou0VDfuD3U+zm6/L4ehTzI9q6on7Ewz5XPxfNWpE68R1Xv1Zmi+iqKmdJv38dlj
	qqfibaTk25CHAcfvhCvAs6FXCHZPLt5mfLosSxXBEwrHT8kAdjamM6qK9hG5f2DpqDLxLfyERoQ
	bmJotebbOnl9DN6xDRxjtdj1YEdoQlORAe0+r28K0Mjj7Eomj1O681SCAVkZpc/0dfyC1ex0Z/N
	pdcpfb2ro1sRs77wb6K5L6iwZXa2fzzj7Pfcshs28T5RoxWfdZAZ9bpl7Qltz/FO19/yfuiA4TK
	97T37hR/IE90wQsAbUQ0Wkzc81wCBomvWYiAMh1+PLNfoDeNleX8Hb3qAjlTaeYEgLyLhJIQ+gv
	RaKkeAlbpczuRjnBzFD8F8DW0JcJbMTNDpmnzK4qXUitgjJ1/8vmJ+UkX5KLSXhZnvJbCGRXurj
	pfcMH6GR5+EXC2mtzEFbEA9Y6+yie2bwKXF+Eu84JfDBTLZSWJJOWFZX9xHOEOgWTdFbE/pt69J
	Ii7wVGl8nHenbASOH8=
X-Received: by 2002:a05:6000:644:b0:487:4ba:97f2 with SMTP id ffacd0b85a97d-4870cf27ad0mr9119569f8f.3.1789659537241;
        Thu, 17 Sep 2026 08:38:57 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf462cesm15872185f8f.37.2026.09.17.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:38:56 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arch_topology: use the boost frequencies for capacity_freq_ref
Date: Thu, 17 Sep 2026 17:38:47 +0200
Message-ID: <178965952769.2757.5034972953349001664@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bddc9273-fe02-4984-bfe9-5078e9e6e111@arm.com>
References: <bddc9273-fe02-4984-bfe9-5078e9e6e111@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dietmar,

On Thu, Sep 17, 2026, Dietmar Eggemann wrote:
> Ah, you want to fix this for 'frequency table' drivers.
>
> IMHO,
> https://lore.kernel.org/r/20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com
> is trying the same at the moment.

Thanks, I had missed that series. Please drop my 2/2 in favour of it.

Patch 1/2 here is still needed, and becomes a prerequisite for his series
on this SoC: with the reference at 4723200 kHz from boot,
arch_freq_get_on_cpu() wraps and cpuinfo_avg_freq reads about 524283 kHz
unless the multiply stays in 64 bits.

I will test his series on the Yoga Slim 7x Gen 11 and reply there.

Thanks,
Oleg
