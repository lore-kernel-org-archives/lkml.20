Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D543161BF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628126; cv=none; b=EsL/hqFsr8NeLaYRTVLcfPYsHg5Qy6l1d3nk9LbalN1uMIjoRKj5YnlmhvQ9soFzrNEujv4tkC9CypDvYAf+tTYxhPR9Ube2Br2eAYk0QXRbTmtWHXox8FvkZMy5GS8clC0wtmP152iolJD1Als0Sr4pzXQT6WteH44fJI6OljY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628126; c=relaxed/simple;
	bh=J7emkB9A/GBF554pJGWYB0X8xAbrySJveNGfoOUE0tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version:
	 In-Reply-To:References; b=hv+0ei0XYP8c+t+ZfAgHOVdzn9dARnB8HA46r0cGSxkOv+79Y2s7lAl5OpbRdhVRFXkSP22oH7wqbOBXqXY/xK5uP1Ydj7Jk/TN4/U249+lIdOyUR7vBBEOjWiQ6y6SoIW4dx0jWo8QwuPGfprqt44SKD19WXjOq0I60zspGgzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYZN1wiy; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYZN1wiy"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so343020a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789628123; x=1790232923; darn=vger.kernel.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUm8IylK3V7lcVuZn2ulYwmszlPFrNkvTKkjAabL9nQ=;
        b=VYZN1wiyohjDlcQ25L1rn159eGo7efw2phuqsRnsVuJvahr1E2mHo+JIQoR2g3NDdW
         YPST6Z82S4IybDmJTUZEDawHg2tcaCqUTSZfAlaVQToXDZvzH+pUGlac3bcCgvHilGrw
         thv6nP0m0QUz4wClCxjC+T03vEg+wzKo7vGXnHe0UFUWo1BpbulXb6VZGWPaGlOm/Y7S
         aBdFjQkOlmPHMT0KxEBxXIg3Ec3Z8AbCiRWWslWlRFdh7ft0aGHkMN0BuOo8bgp89XTH
         0GMk8RcEVh895/T4DgzXDvEctJWj3h1Yr8B49Gd8II7NUHHXzVMUS2NSGoy8uJlm1mnk
         sxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628123; x=1790232923;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUm8IylK3V7lcVuZn2ulYwmszlPFrNkvTKkjAabL9nQ=;
        b=bsEMEnvuQ1SZkk6PYw1XaWvCgUxeeObdw7miLjkaok+1Pjk1Y1MIYkbePQEtAp9m6G
         KlzAtM/m/MQqGurtTlz8l6TuEc5TiTvhryTldG+6VYSgkA0PfR7qEt6dXf5DkL18FcLb
         okphjWJP1+NWukl5Yn7P2tPosqXbJ6SgsRhNlGdw4J9qtxSOuLmfjWHpThV6vNjEoJmM
         ImI4boZKpYpNmR4JeoDtZEjgS1lBF+EQIkWHkSrjGm77d+Oct+dGQ/9qAorz6KnjOPFP
         Ajbaj5ItxInxiN6rw1pRERQxgAGxZwcCZmvjw9oN4LficzOErSojm+l2VXbMKNM7dblF
         K97Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2vagt8TZJMkK2PG264Gz7IXTmH+gE6IF8j10dBtarOov8HNAbmLQZdTFg5SpvajuozrxSNOVO2g72Y+A=@vger.kernel.org
X-Gm-Message-State: AFuF++npWRmQSS9dhk488ItL89gRPMywcxWg1S6mpmEACUW4f4eWn/uI
	Cwt5WlEDCutLIAOS2E7In9g40U97xX+MaMAIFP0QzhgB19V/COdoKcPE
X-Gm-Gg: AYBFou3D/MS6jq1nUkkb+hBnHLTIZXNWbO6Xl0s0EoDWz+cQZxtHXKOldcGwryjZQki
	HnEYcZ8/4Y+qSNbFX3UDKiCQVxeWTSmbM1Jl6lkgxu/lV3FM3reevTb1+Zm9eH1hMfWCIT2/1Qf
	ayesnSM5hRvyiz08ilTfHaxExKihwTt2ipGdJfYeu00aMIBVD1gmYe57X+LW6huTmjdoSoTV9nM
	+ZQW0sL4wA/8Mh8qaPRYOjC+cAiARoPbEdIp9rM7ih2XxGNaeEPpmUrUb5TwP0nHF4mAKqCWSUv
	AZu3BM+bPf706HVNVwGqPF5HVqbw3wHhDE06Rvha661cQqtgRIExbzCae61DpREPhUgeXyDn63z
	iBh2F4jg4H6RZNfpKOLvFASzUbmPb6fNYSNOWbF0t3oeANSsCRidz5S5QaMr91Wj2cMopBHngvO
	+YWLMjGjwz/DjVRbQpmr3vESzB0unZprrRjy0thh+oBGY+a90+Twh7zfGyu+vil18zcfHb9ZHtn
	6s=
X-Received: by 2002:a17:90b:4ece:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e1e491176mr18804302a91.16.1789628123381;
        Wed, 16 Sep 2026 23:55:23 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35def1f2sm3334653a91.5.2026.09.16.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:55:23 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
Date: Thu, 17 Sep 2026 14:55:11 +0800
Message-ID: <178962811102.1264013.13698060411191875408@gmail.com>
Content-Type: text/plain; charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260916051618.2904439-1-lgs201920130244@gmail.com>
References: <20260916051618.2904439-1-lgs201920130244@gmail.com>

Hi Guangshuo,

Thanks for the patch. Calling mtk_ppe_deinit() from the remove path is
the right direction, since the probe error path already tears PPE down
but the successful remove path currently does not.

However, I think the cleanup is still incomplete.

mtk_ppe_deinit() currently only destroys the per-PPE l2_flows
rhashtable:

    rhashtable_destroy(&eth->ppe[i]->l2_flows);

This only destroys the hash table itself. It does not free any entries
that may still be stored in it. In this driver, L2 offload entries are
struct mtk_flow_entry objects allocated by mtk_flow_offload_replace()
and inserted into eth->flow_table, and bridge/L2 entries are also
indexed from ppe->l2_flows via mtk_foe_entry_commit_l2().

There is also a lifetime mismatch for eth->flow_table:
mtk_eth_offload_init() initializes it, but I do not see a matching
destroy/free on the remove path.

So I think remove should first drain the offload flow entries, using the
same per-entry teardown as mtk_flow_offload_destroy():

    mtk_foe_entry_clear(...)
    mtk_wed_flow_remove(...) when needed
    kfree(entry)

and then destroy eth->flow_table and the per-PPE l2_flows tables.
rhashtable_free_and_destroy() with a small callback would probably fit
this better than plain rhashtable_destroy().

While touching mtk_ppe_deinit(), it would also be better to use continue
instead of return for missing PPE instances, so later PPE instances are
not skipped.

One more minor cleanup issue: mtk_ppe_debugfs_init() creates the ppe%d
debugfs directory, but the PPE teardown path does not remove it.

So I agree with the fix direction, but I think this should be respun as
a complete PPE/offload cleanup rather than only adding mtk_ppe_deinit()
to mtk_remove().

Thanks,
Wayen

