Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE14D8D8F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791830352; cv=none; b=DTxzCrHBZ0K9AHrQbMRHvjpEEkneYWndIlh9N6wSi8CQ1k8pPSQCC5tv4DKdkvhRRKTi+P2/vDMVXC6/MRjOfKGmECuwwFxpJsDhSJUDovkSSndTtb7AhTtkdaErK19xTdR1G4rvP9QK6e6ezRQzBiyTUhzMqDTXrcd8fksqG0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791830352; c=relaxed/simple;
	bh=DWG5xbSbtuZQ3Yi/ma2sPH0E7BKe08p6QVtLH+Y436w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j13nUxSpkS22rifhZju6t/8kCQ/S9GxluORGTtFrMhTjaPgeJexQhKxDRcyVVniRU5En5wVqdDdg0O2V1uk4elYrt6uTfPmusSBvg06bUvOUeNlejSiNHdC4SalR9dqHrTD/wkQwX9HDcETWuIv7g68nJB1bgibxULLVWQfAD0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=gtjMJfGW; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="gtjMJfGW"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89a756e5d20so1479892b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791830351; x=1792435151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXwD7B7wFoNoD+47iCkliLk9LICzBNESzSCZLUAHn0M=;
        b=gtjMJfGW+UNdqPN0p9ttkTOxHaLe+y3dttIESgXagpQO7BZaL7d2sSDMZEUHjBuIxu
         gK2737m24egPPmnAU0DI56gO8z307tSEt1+9VXiOwHVrvZWHLiee4ExcE4rG5Htz4noR
         DVkPUC1Hms0bD8H+1C5yW2/WkDPA6Crg8RKYm/JvatdH5NNUIcTvfDl6kPBqqnNmCY0Y
         OXDde1vKAjXu77m+Pat3H+aJaECpm+1XAUmVPdNvH8VkzP2qZXO6Dbclm3okmK1XNGm8
         TIqvEIpKIvuwoZ3Gwf0UcDsjsNy5EjzN3sqc6rMOyfXzQy6vH4TGlqx7ZDrf9gjmMB+S
         738A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830351; x=1792435151;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vXwD7B7wFoNoD+47iCkliLk9LICzBNESzSCZLUAHn0M=;
        b=zdexAK5P2pXr4cqjbD3BWjhvs3cVe8n5LljfmeMJvpR0nwvnMPLSb7wnX4UhS4BMPr
         h09RL1Ep6MZpaOyEGdTAWnPaegaRlOjw/ujTuBWqv6jwJRvVk2Ic5p948zJ04A8qJ41n
         Ka/TQJ+E9qtYufYHSp0Y0u0M5R23vttP5xjERiOhB4t5lth+02UhIAuIPONHpcocHTII
         IjjSfc3vRUh9GfR4V0zUrmnzDBynMiSQG6amgeDAop9d1aeEZdNng9o34xXFyQvjITiy
         2BGIpBnNIDDIVzNV3R7yZd1zgkqsn2Yi/eR41PM6N8euyjsk1go4A26FEn+waV5tz1dt
         o4dQ==
X-Forwarded-Encrypted: i=1; AKwUvByf7mch7jWPyQ5EZSLzQ8dltwI53yUmYnjvpwMBrwmTs1KP7WXsY9YNslNviT0Go6KYR7uRo8ScwG59n14=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDqzt/Q+szbQMHcZOmc8mtRrW+yub+1rngw6LafE4+CJPFT/Sy
	PDkl1w3P4umHF05yCtWluPd7ZrLGDedk2twK+wYTHVK7k11U7jwnBi0HLuVVTZkdkSM=
X-Gm-Gg: AYBFou11Aqsx/X0n0y6KvO4f41fjxKg9/XTwG6kxy7lKfBrlTjLzlN24p597aOh94Q7
	eoOGBfweuis+CTFb2HyfB5erowbzYnXc45t3yz2Y1GU44kyz4sY6Pds6AXA7VJqSyV+IVLt7JQw
	fA+gfrMfDJRVjgdGnFG+8dplkqZ8VCGLUQLWYYwj1OZdRfRoGeWNfBT3dLCS6SWBGtm90A4sJtv
	VBCmxblv75yPhzo/eVzW72kJmkYYidnvCZ52Z7+hf4RW88Qn73oapgSHhPOxNJGE2e1hhy4/Di+
	wkCqAGfOIwDdQNZJNFpdracdzsZzCnsV4yshD461CsxSn6vQLNXU+nwH+uh3nt0s31Xu1WemTUU
	Xssnu8b07wLS2b8WRiVy8EAAKsak9ZltWez/rNLmSI81moa6rrhp09NpLPWAHwGYBoaLd6VCsN0
	ku4DCUwhR+epvPtl9fXjxZgET6sF+JNVpmTDYxgVeWr+dx1g07y7j+Q32CdzWsevyedh9aDXfLi
	UoPYJWr6q0=
X-Received: by 2002:a05:6a21:4d0c:b0:3de:9d59:4d19 with SMTP id adf61e73a8af0-3e16b794290mr8792696637.0.1791830350766;
        Mon, 12 Oct 2026 11:39:10 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08c89sm4506558a12.8.2026.10.12.11.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:39:10 -0700 (PDT)
Date: Mon, 12 Oct 2026 11:39:09 -0700
From: Joe Damato <joe@dama.to>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Alexei Lazar <alazar@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shahar Shitrit <shshitrit@nvidia.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Stanislav Fomichev <sdf.kernel@gmail.com>
Subject: Re: [PATCH net-next] net/mlx5e: Rename state_destroy to
 rx_mode_active in flow steering
Message-ID: <as0pTSCMTCOAbs0c@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Alexei Lazar <alazar@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Shahar Shitrit <shshitrit@nvidia.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Stanislav Fomichev <sdf.kernel@gmail.com>
References: <20261011093100.769149-1-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011093100.769149-1-tariqt@nvidia.com>

On Sun, Oct 11, 2026 at 12:31:00PM +0300, Tariq Toukan wrote:
> From: Alexei Lazar <alazar@nvidia.com>
> 
> This flag controls the enablement of RX mode handling (promisc,
> allmulti, broadcast, netdev addr sync). It acts as a safeguard
> that prevents new FS (flow steering) operations during device
> teardown. When the device is in destroying state it is set to
> false to indicate RX mode operations are not allowed.
> Its name is misleading, as it suggests a destroy-state flag
> rather than RX mode activity. Rename it for clarity.
> 
> No functional change.
> 
> Signed-off-by: Alexei Lazar <alazar@nvidia.com>
> Reviewed-by: Shahar Shitrit <shshitrit@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en/fs.h |  5 +++--
>  drivers/net/ethernet/mellanox/mlx5/core/en_fs.c | 17 +++++++++--------
>  .../net/ethernet/mellanox/mlx5/core/en_main.c   | 15 +++++++++------
>  3 files changed, 21 insertions(+), 16 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
