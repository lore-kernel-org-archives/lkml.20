Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792731699;
	b=P2BgCMCAnSv67j/xg35EzBE4gSDjE34Ov9CNKPTIlzbVlgYW1tbOH3N03iHynNZEzjjR
	 bdWRz6Trl2Ue42W+6xxeSL382f93Y6afUQDM8IW9NraEaY9u87KwUvP2cvRM5B/qsmGJI
	 WYZer4w3TyBLqwKTQbs9U6Mq3Ueeb5DQCvoOIgH0tGezoKoV263CEi+ltjJE6sfXJMd8R
	 BGOV5a3gb6CjgWLLioffu2llxR9GFogF+BQVz0B0tX2B7NTZPSSbVzpYe7G4OBro6rx0K
	 OzyouBxSD9LrrEYtECP5/65vRTMoIe+Z6NowtEhPvuKUTMgf/7RpbCfUA7YZ5nw1C5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792731699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vGSWPVRPxP6ajcwPiQ6sdZfL0TLUXIf0aO/2OiD6KVc=;
	b=WgDX3xtF2egDpa+0V+x/qyZQZ/PnHf1MnGHsEJkge5w87g00Ek6zHrkFbBRfAfc9SCOI
	 g1M/IvPVrcPVnwBMDfVfgMawPGPWH9wbFMqiTzW6+ydhffK3ctct9ZB/SNQzTtMAvNHyU
	 NrcIxKuwk6Pcxw+RMqrfCKdlhedAzaWHpRNYrU8lwwEE+YpraaYIUabhQ2NK5KUmfW7ZS
	 u0CIHVdXDxskeizGWPKMna5u2vTTLpB+z/OKAH8MM6baAjgNoNAVNgOLu/Iiq/euG5HM7
	 aTcjfYjWcK3zlU9mRVnNgAK7u4hMn0rI2EF3Hed24O+fGKhX+H07Pyo48AVklFt2dGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ekdroZQw;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D23606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ekdroZQw
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15943c9c005so635302c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792731697; x=1793336497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGSWPVRPxP6ajcwPiQ6sdZfL0TLUXIf0aO/2OiD6KVc=;
        b=ekdroZQwFkiPENRkAfQ00zaPvtvBKfdjY97F5wA9e0DnZSRq0JuZCrAYfO67I9G9S0
         4/Ka4+P9QZTzXuqVafgx3IjUbmqLjef4GCgYFSJ2k3KO4soYF/zRRbjE/ppe5t3jEkgA
         BrA4kIhyGBkXXWE+wgB7+l773gYra00oSekvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792731697; x=1793336497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGSWPVRPxP6ajcwPiQ6sdZfL0TLUXIf0aO/2OiD6KVc=;
        b=HNXryd1obBe3T2pdga6z0hBXLGudoz943599oaAGsbu7tAeFIUQAwpFMR77DwrhK90
         ZKeFVykxTd/CKjGqcRvxFwfysHVn1dHifgRtk4473t/Uov35KV5Jj2T+uOeoBqvgTqR+
         hWgQInJMFz9JJLbKCuVBsbOt5iHLmHmkudVRX7742LbCdikpgpbnD6ugLLdB4JeySsxj
         puFyhNUAim4TLM1nGpOZrESn7c7aRJOQ7DGdQqEQQGVmBK/q+r+wyVdzCwcXulcNwIMJ
         7sUvHXypse+BVuhC0YKJyIvnqnAifgkTN1UCWmmzNHZ9ksDugDic511UXDQC8czsSfav
         CQZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6qKyWLQINF1nI7Lzq8vezN9sIJ+MXP9YieZlHXnRpP0kbQYpcAEOiiCSCIIM0EU4Q/KqWY2v4eMLBj44=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr0jZLWvxzpRqRlV3V5GNUQMac5QRhn0tb7XD8JhjFjmXa4pxA
	UBGxJCFk/yNCK6VAgutSrX3zoM7RdXd9KbcjikhtoGgcAuE9s6bUzmlVcngFwbLgng==
X-Gm-Gg: AYBFou2lE6XFzmEBz9vveCXq3CYHhufiWCE5+MR5fgFLiBaqHrp0CdnYlTDyLq2dYIv
	hEtJo9iCMgCAAb50p1lp1o2EsbzeTZcI9ANGY2Ov/pZOHqJ/2YQYNDsqFSIDKbJWtlPz/qawo6u
	ToYDdpW6Gbtle+5Hnm1sVq53HShf6m9+tNHlOTqOece4MpBLfOZJIH1l5RzgXwC+gcEhjnLX2qS
	OcxYbft6OKcChGRADSUZMYNcDMtQUBTwJt6MHcg+7xZRiy6N0oDj3Z+LI6VW+vNJm1ZBlt+ytlc
	svGXeJ2G8eBXKuZSh8u0Cso5DQ9UMfv7xZ8kfUcH9AXoNhp+Cq45tR4L4i2GdPiWiQDaSM5VH2C
	SSZH0kwDWqH0gTy/dHRD64rEWshjcBi85448kbWe5RaoOnPPypfG9rQeqgKb/3mGfcntsYS21XD
	M995C8G+guOLZxoLZzRJrNOuzYF+dUzEU2E8xGojn0V2R5aYOI7XcdzCMScMSw3J2Uqb2kqX2E1
	9pBUMc9dJR47KekDNAEUAzMJHjGOqbejPtRBFPWfRwB8z6BKCB0Bhat71uueusFYl6G2xo5PPk1
	3wVP7sskKI/K2py8xjjlWw==
X-Received: by 2002:a05:701b:2309:b0:190:b2de:1549 with SMTP id a92af1059eb24-195bfcb294cmr2047930c88.1.1792731697413;
        Thu, 22 Oct 2026 22:01:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:30e6:10e1:f7d3:a06d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm5512711c88.19.2026.10.22.22.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:01:36 -0700 (PDT)
Date: Fri, 23 Oct 2026 14:01:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hillf Danton <hdanton@sina.com>
Cc: Barry Song <21cnbao@gmail.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Brian Geffon <bgeffon@google.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Message-ID: <atrnvuQkeldgPqH5@google.com>
References: <CAGsJ_4wMQteCGxQ7wxUKP2g96myo91ipF_zedFVVbxKdDrb=bA@mail.gmail.com>
 <20261022111151.960-1-hdanton@sina.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022111151.960-1-hdanton@sina.com>

On (26/10/22 19:11), Hillf Danton wrote:
[..]
> What I am confused is -- why decompression needs to run faster without boosting
> compression up. Where is the compressed material?

In a typical embedded device (e.g. android) zram write is swap-out
(direct, indirect kswapd, or backgroud service swapping out idle apps),
users don't see those.  zram read, on the contrary, is what users
see - because that's swap-in, read bursts when user brings back idle
app (camera app, etc.) which needs to get back to foregound quickly.
So, the read path is more important.

I tested the series against PE.

readers vs readers (no writers) 3 runs

    BASE+PE     IOPS 1,449k  avg 3.48us  sd 155.6us  p99.99 26.8us  max 280,820us
                IOPS 1,435k  avg 3.69us  sd 322.9us  p99.99 24.2us  max 540,512us
                IOPS 1,459k  avg 3.46us  sd  92.8us  p99.99 25.5us  max 172,186us
    PATCHED+PE  IOPS 1,457k  avg 3.31us  sd  15.9us  p99.99 25.5us  max   7,580us
                IOPS 1,475k  avg 3.28us  sd  14.6us  p99.99 24.5us  max   7,327us
                IOPS 1,463k  avg 3.32us  sd  17.2us  p99.99 28.5us  max   6,816us

R/W stream split makes sense for reasons that we already mentioned.
Readers don't need to be blocked on Writers - they don't compete for
the same data.  And, moreover, readers don't need to be serialized at
all for stateful decompression.

writers vs readers 3 runs

    BASE+PE     IOPS 1,271k  avg 5.57us  sd 1,393us  p99.99 27.5us  max 1,581,800us
                IOPS 1,461k  avg 3.43us  sd    78us  p99.99 23.9us  max   227,015us
                IOPS 1,444k  avg 3.48us  sd   222us  p99.99 23.9us  max   592,628us
    PATCHED+PE  IOPS 1,457k  avg 3.32us  sd    18us  p99.99 27.5us  max     5,620us
                IOPS 1,464k  avg 3.31us  sd    17us  p99.99 24.2us  max     5,621us
                IOPS 1,475k  avg 3.29us  sd    16us  p99.99 26.5us  max     5,620us

And, in addition, R/W streams split saves per-CPU memory.
