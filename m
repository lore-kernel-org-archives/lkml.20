Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207494;
	b=b4hU9tqrSMVLU5MBsxCXh/Tup882t1at9JHrIj5Zu+SQbpQLBVl4MeLnGSBGm+7AP0XT
	 2hGnq6D3/fTJpZc5iWFtWyBvc3WqlPLDryRBbq6cBWDbHghA4LNGl8rRzSE/Xgvl8+0m4
	 wskpUMkrEQ3wildJtRuxIyiCLaCOE31NMDSVZoM/lJCT8HTlcR2Z588qLcAQdh34/Vu7o
	 AVcq0bVwi+ZO/easGwhWf72DehU/uJOtrdy15zSEh4aL5TRSK1GWTh7HgTCLz2nfF3HHt
	 unPJfD5yj2IF86Kjs5hbWJoM8JJI23//IW0thBYe+8SOus+gDC9YyjQMWRGRlIOTIAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+Bj9TlgMdx89QuvYDbkkZB0BkYmkkE60v8E9W6mG4wo=;
	b=ItrJDzan4JELkh4RjlFnnmn7u2yvYo4BQ+AlzgnAEp38ObtwjwrI8wTXEl9AVI8OpCtq
	 eVk2spngbjZ/SJqoGtxKrMSIBi9U7zfoxYQAhYm+qH4rFa6xnjiLWC+OIdOqgHvedPb9A
	 EwLie00f/dW+PGFO+//hj2mwO4+vkqYZrupTkT/7JJPVW+e9P7tkVLXNs0i2h3ZkzheuW
	 G86jGhYueghci1BzBLSNWgm85pxN2105Wfl293A+u6pEJf64p/7r96YJn8cmiF65p1Qym
	 ECdFy4+23YNa8zyGd1eB6SLPRGiIpSIQCieQ2bhhwwOVf6ZZ1BpHBpsnMIC1Mo6Ofbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCF6Kdf7;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21271606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21271606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCF6Kdf7
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a121bb8c2so1532024eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207493; x=1793812293; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Bj9TlgMdx89QuvYDbkkZB0BkYmkkE60v8E9W6mG4wo=;
        b=yCF6Kdf7jT1vWrSUhvmxbzrJPzT82r4X3xQu0Wo3MziGTaes8IDWLNaHaLqoZVWY9v
         F6REPENUlsKN8TJFDiLwXcarZDvtLI+C7mFIgLuvNZ8pNVX+awq0kC3s8ux/bKs7CCei
         +8ULXgBy4LJmNDtjCwvVxcZ7q9ZhMBq3SixIZEPA+9pYLJGadkFbyBbrd3MWxD/wrvEe
         FeRIzj7ATlRViELe6KEdrDPqHTT1/nE2y5Y7nZVNLe/3OHzSr071tJmuQIBcYT66Gged
         5yqpNcWw+MzyPgAaoGlTfxxndMV5ff69vdOwIPX5ta49X+lGDmKxyxRFRTSzEsp2WNjN
         ihTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207493; x=1793812293;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Bj9TlgMdx89QuvYDbkkZB0BkYmkkE60v8E9W6mG4wo=;
        b=oozac6b1+F6vRtO2Nt5QRNF/ykQNIsmKubNhnsZX6fuETf1IuVud/8fPssLamOGbMh
         7TYEtff8VLh1hpnCn/YPrGLHs7LoQ0KpFE0d5rnYH/AAP+tST/WLrnClV6azBMoXZvmo
         EQVLAOHVD+E44FjtTE2jTUfdw7PVs2hJPQp88M1idelFMOAY7lOZehZcVZbV4qB51UY9
         3+2iLDHSi1kLHuN5eozozs1yWAPvWArlXOrBIPWqrF07VaYtbJcUnJlf/JklXJjxUU7+
         BLiW8KVvzcusMRlS9aO2ndGUEcEjUAb2emIiLfUmcYKnxrYdz21Ws658dHyG1kXXo/rA
         O3Kg==
X-Forwarded-Encrypted: i=1; AKwUvBxTAGklIPh1icw2SpcgNbsTLQsayHFVJ9dSahpeiNlMN9MXvCwzlYcQLn+MZgPQ+UgZ7EtGXZZ6riyORTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaqods4A7zKh+v2O50t73tsOa0I6Ue4RNycoVzDA3D8Ml4hbuH
	zVvZzJ8A46IB1yn9U2elH6wC6iZ23gE1W3KIXWcp4FVLnDvwrZYSiRFN
X-Gm-Gg: AYBFou1U8548vk1n/WCRaiUOhWX25RCbKjF0VEckLHyMyZEhtLxzVtoUAwPGfhX9fnx
	f7LGajZUyp6yGDRhejT8FTZk2b9FUsC6bsOTYUYc0eTKYX/eS03yZTbpevA6JSh3P6bTzUKbQ96
	R2tEchhFiD2vjsTSLspy4CSnLQ1pYuV0kyJjin2AU9folQ9HqPKP6VVzp8FUOmAPqLgZLxGXC0a
	BgGpGMPtgYDG3fPRHL/MAvd+t1eVWR1gkLWvbOpk7XUg5csDbxS/6JehMNDR/pXsTVrzS2DoUcf
	zF8JYTGiC/Um2n/3PPr1fj6hkt/xsaylS/Dlem8M3yOAhnF1oX6F5aVTBRYdSOFv5Q+kjvkYZ5p
	5nKeBsof2aJsr9PPOiCiv96UYfdJbxN9cGDoIB5hyJMtesw2LpNjiqzX3uvFPLuWJraeUjKzTlF
	lquAfF0D+aajs2chR+fqA+ZVmadMs/ziDZeo7/etc90pEVqGyiuLB5dVNAqlKQl6TG1ERx+EHAS
	Fvu28wavDxRhUApGjdMgRETi1jCMx4W5TJ6BT6XrkJCu/G/9hDTJYSzE78ktA==
X-Received: by 2002:a05:693c:6393:20b0:359:3991:ce1a with SMTP id 5a478bee46e88-36a30051a55mr162933eec.16.1793207492976;
        Wed, 28 Oct 2026 10:11:32 -0700 (PDT)
Received: from [192.168.45.62] ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239198c9sm7789683eec.15.2026.10.28.10.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:11:32 -0700 (PDT)
Date: Wed, 28 Oct 2026 10:11:32 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
 Ido Schimmel <idosch@nvidia.com>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net v2 0/2] bridge: cfm: correct CC receive monitoring transitions
In-Reply-To: <179320630061.3327.303082876376528510@kernel.org>
References: <20261028164730.253238-1-pocj8ur4in@gmail.com>
 <179320630061.3327.303082876376528510@kernel.org>
Message-ID: <179320748112.254617.2096305115405815674@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Both issues were raised in Sashiko's review of v1. I had also identified the stale interval ordering during an earlier manual inspection of the CC enable path. I validated both changes under ARM64 QEMU/KVM while preparing the two-patch v2 series.
