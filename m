Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929F44EE860
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891188; cv=none; b=loAYBNdBUu1sOWhiwrDPdnjqkPgNrCdIVbDseTosbTnhi93MhFijIuld0a0xL/N5DdhoOyi0MaMMzzTwAutSWMGbYHuaFQtH+AEIkH6WRbI9D36bHaaRJa7dL2k9NkkhTCtXC2YFXRYrKAQ1iLOoBWiDLhUHvEeUtpwJ6iu7b1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891188; c=relaxed/simple;
	bh=Dyt5vMpr0stZOUUiRBwCWhlSpsziyIQGipCkD2GiSEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fakYzHL1cXl/0gn6rjx5zswUO93BU7iSIghY9aB5svXrcITxmDzgpo2m3VF1bDQR7+yU9iitnmB/o0duC/xBee4iOdAQJCw4kWCXoBQiY4HicMueajtZEStwaQs8fOV5DgU2TTEBO3ZxVl25w0UnQqKksAPMkRMHHy9Lokn2QR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hwsGlsai; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ahk/3uNF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hwsGlsai";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ahk/3uNF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791891185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BJZS7SNjtTyCzYl0fCzkLKDPQ9VWav3NaJT+Z7d7V7w=;
	b=hwsGlsait2xAMV7zu+26hqpL8zkZBANJDcyJ3NfiBiu5qVbS7CZw7YQF6WlVeNXoBgRwLU
	AaqKRJdYkdg5UdAGW5c1g4z7XUElYUV6GfV/APRppNZuFOy86Vln7nBhLMeAkpAtACXTfR
	i8yRrlp8LuqRRj1AHoUefpQW4koJj0k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-SLvZ3R33P3qommNaZMw9jw-1; Tue, 13 Oct 2026 11:33:04 +0000
X-MC-Unique: SLvZ3R33P3qommNaZMw9jw-1
X-Mimecast-MFC-AGG-ID: SLvZ3R33P3qommNaZMw9jw_1791891183
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b01a74792so2055795f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791891183; x=1792495983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJZS7SNjtTyCzYl0fCzkLKDPQ9VWav3NaJT+Z7d7V7w=;
        b=ahk/3uNF9u3E0JJi2UXIlgtCAE1uPc+yqbKm0TfXlKW4BjodHwHFGpQC3+Hl7e7E/k
         ZYJlacamLHMFxfiF2FHvtyuZjeKNBJke0jnWER3gYRHjwIFnCl1jOe6KkdxD72vY2cg9
         N/6D23V9NCESfyTZz9ad9FSwC+S7gNfuNQ1J0c8xO1a73mfNNvWSgoMQIlykaXlHYn/C
         rYl4lqdUVOv0BKxSR6q1CERNkbo7QV3LoMR8o+7U5+vElWqldLnV59evV9zSgqNnYqzH
         b0Mr/I1E8p+pehIjMrKQuoDh0hpkCCHFLpEwwThAqH1xJq+DvxxEmYoDJGzwq49TzpC1
         M/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891183; x=1792495983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJZS7SNjtTyCzYl0fCzkLKDPQ9VWav3NaJT+Z7d7V7w=;
        b=MwsgO7Jk3wP4qviQcmn9YqfVN+CKWZWPIN7YTt0+Luj9gRyMaxM1do+V26K2c1cBZU
         v+eGDt2C1+PELYUnFjuhps8/ZSdWrNfTUf+u8Jt97l2Xj6ivQy4SWuYYGJXqyMDEkZeg
         17ZEC6btHvbt39hcG2KvXF6ClBM7ZRvfuZJNXlkISdZuNkr7Ae/GAAO7v+e4tNiBAPax
         HUNP8eO80sYjMmCNAcJjDTVO6D4/CIO/hfKl2xFhiAox5ke1lvq+6Z72oW52Fn5eauzA
         s0r2pTyizSqcd0Aqw/nHj6YL+FAUi2wC0C+/W4L8O/yJxNI6dPQY/HuDYef1hMuORWZk
         vgDA==
X-Forwarded-Encrypted: i=1; AKwUvBxL/TPKPhCut2GxtSUHZqONKpTgzmF+n33dYbusEePkIk055F0qUWknvQ6v1VQXSny6cEuPdKRoyjFggLk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYnXYMhMYM59vAIZxyGBMC5OMU3gEhnJk7R4kHFTwQ9TLMc4Zv
	9kGJ6BreOd/ra9cNZNlGEJXWRIIjdkACOROgUUaLuKDpkUsWB8Cl0dWLWgAR6rITIEVumcL1bGi
	houOn70d9+whY3GHj2Z4QGrmsngzBBPZrtP+VcNZlx0UOzQqyoFm1+SuXIhreWnZkPA==
X-Gm-Gg: AYBFou0Ns12bvYjn4RIywK4sMhXstSte3hF0je2ED3l76zW5TjPeG5BsiHP4/i2Wdh5
	mSlsQJ423YFGxkpW54XUCSrFbn08u7f0OuDmrcw0l7RrHf2H3y8YzIQmqggi2Mda0ycY+3+sk0H
	CD5zP91p48AvJAGUedy7PkllFF9uXqhzFFs6qVF4WJa+FzvWB/a5tpGxo4TZgYSaOi6KbJ9iSHY
	OeoEm/w4zBJn3D+K1g2Ly26qAY3KiL3RwM0TEzKjcDumpUSg1P7lRIivfI1YVTbcUBaVCtmuJMz
	RApv0xQUqGbQV2a8DrDEirUfc2Z6NJUkdqOT62Gvwy2Rm3UNz/mCqrcQVbqqvf3gqpRhwBvekyN
	BMyf5DX2vkcLBScpZOgw/AwgUTiooaIwwvO+SO2fg7woMZg+DQ+7xY8KAyP/1rY1IArj3cgboJA
	==
X-Received: by 2002:a05:600c:8518:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a18e4a8ca6mr221725405e9.12.1791891183031;
        Tue, 13 Oct 2026 04:33:03 -0700 (PDT)
X-Received: by 2002:a05:600c:8518:b0:49f:cbf3:551c with SMTP id 5b1f17b1804b1-4a18e4a8ca6mr221724855e9.12.1791891182594;
        Tue, 13 Oct 2026 04:33:02 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm133053675e9.3.2026.10.13.04.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:33:02 -0700 (PDT)
Message-ID: <4758dc6b-001c-4106-9258-f7d902fb01c7@redhat.com>
Date: Tue, 13 Oct 2026 13:33:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V2] net/mlx5: Lag, reset vport speed on MPESW teardown
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Edward Srouji <edwards@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 Kees Cook <kees@kernel.org>, Leon Romanovsky <leon@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
 Maher Sanalla <msanalla@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
 Moshe Shemesh <moshe@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Shay Drori <shayd@nvidia.com>
References: <20261006112415.259157-1-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006112415.259157-1-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/26 13:24, Tariq Toukan wrote:
> From: Or Har-Toov <ohartoov@nvidia.com>
> 
> mlx5_lag_disable_mpesw() never called mlx5_lag_reset_vports_speed(),
> unlike regular LAG teardown in mlx5_do_bond(), leaving stale cached and
> FW-configured speeds after MPESW is torn down.
> 
> Call it from mlx5_lag_disable_mpesw() as well, so the reset is paired
> with mlx5_lag_set_vports_agg_speed() on the MPESW path too.
> 
> Fixes: 50f1d188c580 ("net/mlx5: Propagate LAG effective max_tx_speed to vports")
> Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
> Reviewed-by: Shay Drori <shayd@nvidia.com>
> Reviewed-by: Mark Bloch <mbloch@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
The AI reported feedback looks like a pre-existing problem with
mlx5_lag_reset_vports_speed(), but AFAICS it makes also the fix
(partially) ineffective. I think this late in the cycle it's
preferable to avoid partial fixes.

/P

