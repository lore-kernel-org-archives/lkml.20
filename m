Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6729353A9C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136564; cv=none; b=rYVMMuCSaPOf3G2fWo1XLNoIv1pV8KFqV8dA9p1cSqtDBpgnuGqrJHMvA4ubSsyDRuK7tG7YfcP6rnq5JCqt/jcnpFFuEqb6sZDUs+OjhDCcwhbp0ksgWyExldkEiMwN0zAF5wZdkxuZVdjN729RUuVbTFYdD+T9gJEfuyfKMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136564; c=relaxed/simple;
	bh=77jSaPEQqn/wr2ah1jsnAt1nWlrbn0HWyARmuUwIaVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWJc+e+oaC7wKu+7fPorglQYQISHL1NSHPyeNZtYBtTzkkYHvWwdSG7pI+70OwlcZTll+JArRSV6h7uixko1YLCTjMpCmIr8uUaDpA6Wl0hn/bC5cbDn2a7nKuDm+80tRTDEjUQvagBIXdB1xHfxFGSEweJcvYuyWiflZ8r2iM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/3Einqv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/3Einqv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so5903595e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136560; x=1789741360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1tQhcg+41jd4jYbxHs0U+uMedbQ9Wrg5f7CMD2RYFJw=;
        b=I/3EinqvXRj7YJwty6zdvDA0O5cw9fRi1ZwSY8daQgqLgNcOVLv0jxvVtN6XqKIGz1
         O4/1cEHg8poogxMu6Lt5qQHD8nVDsroFL+TKd2uy0FsJre+WNRT6XojVdGLCwknQjaxT
         yUiM+KNwKkWkKz5IKkEmzLbjeDKk/XfrZL+5/89I6GKSDGDed4djCqZKGBYx0gc2x/o8
         5QXxsOtXHo0DGdX0uXYvjFV5E1xnQksLtCeERLU3qmCpHVtRljrJY+gugDKX7q26Ji+a
         nYE7rE91JDhC4xzl0Vhv7gtm96Ll8K6a0Ri98DHnuzANctqmf/+TNdZVK3lal9pdwwfI
         R/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136560; x=1789741360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tQhcg+41jd4jYbxHs0U+uMedbQ9Wrg5f7CMD2RYFJw=;
        b=lXNpNYs9udbVf9xHLrScJOA2YSPWrWeahr7Sf33/ekgKJA3LGxamihuKglNfR4d4am
         B8CqLzw/ExmNG0i1eSwBs0R/6H9++4NF4EvBW2lHx4FD9WCwzYemJJ1p1KampTIPUrP9
         AJ+GbLmyP9/y4T+aYdsQHdepDpMHxG1N9YZOZjnjeSi3TIh4cCoeXE/Wzqgy2VfLZN2j
         Ib7tPR3XZcihBV09XimVkj6EGYdE/sovoRPqkAYInhtzmEQkJK8JtGVZj+Lcsj75Js3D
         Wrpy2TXO79PEl3yn7lJPLzD97poJHIquBlQsFxxF188aMzr+eeJ1dbtvnqnPJcKy8sbH
         DRwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzlwk5pE5pUDVsVZ8LJwDmDs9wNe/CxDa40Ke8xWyBm5Hz4lcPwmCGaps/RxyS/GnboZxhMBUGyVLbqrU=@vger.kernel.org
X-Gm-Message-State: AFuF++lvJ3vEe1aeRLmZYbi19g87OcpUolESzNeNyl/b1oV+mUGn6IxJ
	OJNiK/2yIsLKXYNdOnU77eGilOQA7jh0yzCva92pjqG3Em8AesduSooJ
X-Gm-Gg: AYBFou3hAwo22EhRuhdKHKleMKCnBB2j3+dLLJQCZWGCj8gngzNwRFMEVOdlbsall6O
	SJ3vu01JxjvbLL6odIqUhbwsS8/gf5/wnha9RVkoD9CpW+AE4M61ZrhbpdGkuHEOZGi3H7nv+Uq
	8iJz1nGsQAkDdVQvP/mLXZOhXnEKyOnHcuklW0f8E4LSyuiEKbN0oOlO7dh9JExe5yx9VFGT0w8
	MYAZ55IabKC7xIxQcKrxgD3Mrk0DRoPm66QAmdTtZ2JyAszZn8XTz+TGFOoLm2PJk+2J8XaH2+F
	vH8iAw5HSoKstJicniz//0I63F5GEfxS5sMb+zhTL/9iBLW9PMXlOnDGHf4XPYtx6V5o7M3imZG
	NgEh1F+aOvRBfDhgtNt2tKUpPZhoMfy6NWZE9tgI6GWmUkAl81OoSEUEni3+aodAqQI4EAG4Bdn
	S91iM72VeCtuJ1cDlizEcejcqrY14lUQvVkiu0jZ45Dha1l6jdwQL/tZUnWux8/zgj3meVfBY=
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr131454315e9.6.1789136559455;
        Fri, 11 Sep 2026 07:22:39 -0700 (PDT)
Received: from mobilestation ([185.195.191.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm25861295e9.3.2026.09.11.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:22:39 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:22:33 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] spi: dw: use threaded interrupt and optimize the
 threaded ISR
Message-ID: <zp7o6gc3cvjy7cvtq4tnnbmsvkcjflp745ug6zfqbwgfx3x7ez@ml6dwb7jmz4n>
References: <20260909143652.9234-1-jszhang@kernel.org>
 <20260909143652.9234-6-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909143652.9234-6-jszhang@kernel.org>

Hi

On Wed, Sep 09, 2026 at 10:36:52PM +0800, Jisheng Zhang wrote:
> To avoid blocking for an excessive amount of time, eventually impacting
> on system responsiveness, hard interrupt handlers should finish
> executing in as little time as possible.
> 
> Use threaded interrupt and move the SPI transfer handling to an
> interrupt thread for host mode and non enhanced spi for two reasons:
> 
> "while the performance improvement will apply for both target mode
> has no control over the clocking of data by the host so is much more
> vulnerable to dropping data in a threaded interrupt if the system is
> loaded.  In host mode this isn't an issue since we'll simply stop
> clocking data while waiting for the scheduler to get round to the
> interrupt thread."

This isn't correct. FYI the IRQ-based Tx/Rx has been implemented in
the driver for a reason. The reason is - "damn automatic chip-select
toggling if there is no data to transmit in Tx FIFO." That is if a
platform uses the native controller chip-selects and the driver can't
feed the Tx FIFO fast enough so one wouldn't get empty for the entire
SPI-message handling, then the native CS will be automatically
de-asserted on the Tx FIFO emptying event which will effectively break
the message transfer.

So if you still wish the threaded IRQ handling, then it must be
utilized only for the non-native CS (like GPIO) or if the platform has
a custom native chip-select override.

-Joseph

> 
