Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536EE282F14
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789349043; cv=none; b=NO4xtxTk0xZm6PcUrrj/fd+i7BKzqu+rGKIW9ubOFH/m3902DrpI+7lYNHl+IF9yUzbwbcxjUm00aXHvGzfG5FvTNNtjSGGvH4yQP/Yd31GMVs0Xo3N4g5LwfriNhLiAkIUnX7VdwvrNXxbfuVVK85l6x9T9at8pNqGLdAlSm8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789349043; c=relaxed/simple;
	bh=jFM/DwXHjkKXAHQoUXYqUXKTlLXJhLvu/J7v6hlyZnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn5txNYmQ1IxFno1jDOB9KeoE4oE2VY6bx08xiNYPdRO9Z/ny2dr057g/MBUgiIl6ytcXMdUtQTfwzOqKymo0E5vxks3A3bupVcXkx2qggKEs2hTRCjtr4J5D44qrYBtZX9tCRsJkV9zw5HgVWgTJUrfCNOgAQsAf5PMm+XDtMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0BWg6mJ; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0BWg6mJ"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so15241805ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789349041; x=1789953841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hnFkbktqoVqh7KvfNL372TtJBe46jI4r1nKfWafzrAI=;
        b=I0BWg6mJKTHFG3nGKLsrqQ8/73BBIFltQA8KnZ2K1B8YSyy5hpzd8CA0pb5kiL5gyD
         fRSLfKuJfTGIu/Eb5OPAqFMaAYPQ5nryUdskcZTfMyn/0/2so48vXFc8+0czd2gfyTRm
         FA9IFsOL5C11iBIpxxvAA9DWv0Dw+uv75OyGXHaVTPA9BJxiIebM3rswBXFB5V7O+TkP
         m6d3cTX+chg2io9KG3kkGe70QW2iRCmwe/0kWObYe29sRK6aoxn6d6DdHxjgzlxICGYi
         YU6N/AE2H9e5S10Asypw/9SZ0ZfGJmQhN9AXwyUXRnFJ8sD45cGvktgnI7kz2Lx07zab
         QJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789349041; x=1789953841;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnFkbktqoVqh7KvfNL372TtJBe46jI4r1nKfWafzrAI=;
        b=GdNFNViHiHsMVsbXgxf8DapLKN7dYfiP9vyU4oV2hl5/HQXB2hw/84tFuBNrr2zXZh
         fI5xmBUH4iF7IRcEYKcbJA4jyKB3v9gZTp1cUhM+bd0Av6UlTjoJO+/JUu+ZLc1Pnevf
         5xyzLktw8FwNAz21VIFPbYcnMp+Y6mzI6WDJx+kqeYw16se71zRLZPxjJigyuPL2uz45
         9JyO6qypGl+655mRKUPNOfUrf0upiLXlVKeld9mfh/QMhVghbAhLlE+IEEWvaH6YTO37
         A57RdwnXcoHNImIalHNNVJ6k3vfQq3DFzWuZPnK10W7G+8xebV2LSVTbHCkMt5AYetr6
         U55Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEBkdJ4HDPM3JiURFLHZkd1NrTAwORaoMMfcqbvNwKc0fLsmiHkNL/mP4rpxYghWfMgY4vInvLc5uF+Es=@vger.kernel.org
X-Gm-Message-State: AFuF++m9XwKFVv91iBKzVyTpjTbCNIyc9ukLtwZcBNE/jTM9ZePmhtWc
	W/aoh5bXf4yQ+ViQrsbBOdpguz3ET25Q76JpsaMoL/1zgvrJ1jJip5pY
X-Gm-Gg: AYBFou1xTulfZFgKqyRubukVqugpT6MqOa3MCpz3htKEJbWvq6zeTY3b6fkEJ0qvpqp
	1K4+zJVdTFmKz2sn4yUl47G0Jq/N5zgko0hKlJXDplbmjh1mOo8V4WGm+n65UJoYbxvtKJH1RwW
	diaajkfR3ZRB6RgwOVG0c4hYhZ9QgErcwSCqhxxTuhHPv2odoHfCgTlIxRfY7ogtZfLsgrTPyQ3
	7NJe9sBN9mjeBhinSdcoZK4GiPqEHcN+mIN4YIOk3JEeZrYfygPjelrXoOd68dECS0Emg5orisV
	GfWxZhS5VQr3i4NfwDF+UX68gFTJQFBoVO+LzHAJtSnhbudm1f5/iMAhePPgdEq+oCnZX1kHw4l
	VOEWfnQOeN1fTVd9y61o19wms21UamVD/bSzP3TFaBxBsayNOaBJeeaPib49L4CbBYAGsFeb+aE
	xDvj3xyhPLoLMQN9Pj6Ou8vZU6l8wqw7yTDDWnudekYT0ZGKP6Z4DfmI+mhe0vgLqZe/HaNuded
	oxbA7sxIkgophbIo1CZvsZ4AElJfo6+2s+HVWTPSmmBbqPZxlE=
X-Received: by 2002:a17:90b:39cc:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-39debf547abmr1067411a91.5.1789349040552;
        Sun, 13 Sep 2026 18:24:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm20363582eec.30.2026.09.13.18.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:23:59 -0700 (PDT)
Date: Sun, 13 Sep 2026 18:23:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] Input: hp_sdc: shut down kicker timer on module exit
Message-ID: <aqdMplrLuOrSU08z@google.com>
References: <20260902154004.3595416-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902154004.3595416-1-runyu.xiao@seu.edu.cn>

On Wed, Sep 02, 2026 at 11:40:04PM +0800, Runyu Xiao wrote:
> hp_sdc_kicker() rearms hp_sdc.kicker with mod_timer() after scheduling the
> tasklet.  The module exit path uses timer_delete_sync().  That waits for a
> callback already running but can still leave the timer rearmed.
> 
> A callback can therefore leave the timer pending while hp_sdc_exit() tears
> down the driver, allowing timer activity to access dismantled driver state.
> 
> Use timer_shutdown_sync() for final teardown.  It waits for a running
> callback and prevents rearming after module exit begins.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Applied, thank you.

-- 
Dmitry
