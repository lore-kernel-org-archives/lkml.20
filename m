Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CCA3F105B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788124728; cv=none; b=ZvOXFdrRHC4FtYwazTKcH7ZnwDLvfclHsg+gZC7UXNTJI3/3Tx3siEJ4p23uf1fUUw0KQyxkghDrZXxH6nh6GJnkrzBVnZouTMsCwU7w8F/ztU+kflppKTYYvJaiPIPyqAZqT96fBHwIJyxoPxS7pL3C017j19JiZuOU4qRuYsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788124728; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmycYti6/rx5uqfY2NMPNiv4ZnlMuZ6rwm28TUp3IZLKJscj0NP5ChgKWHRNRzWvVDMpX00dMIXR00yoWxK6rp99FlPwpxc1ZHfXNbBSSi1Sm23vjJnB9AwMZREmgCz0+/mYFnskCgguIWepPOFsN2XPPRl7n9bpgKm3hvFN62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso21058115e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788124725; x=1788729525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=Lw7+9RtawgKumx69fYTchUqt+7Zew9bEOOj2RqF6J4MKgDrbXnF/2FSYnPiTSpQwGG
         QwW1u4YVXGVUeKBl9e0tiGAHTZ7j9dYIxAySnLHkWRoT5M6+qpB2GjAM2Ib21lNNz5q7
         EiMPrxn7vw21phCZdiKPOcWcGGXUZ3zLnKVOp2Tk8QM+nJyprXo6toyjswYXc7PfBQnA
         aowFLnmQkcPlA691NgRA85enFOefySgIByQsqwTPQJU2jisAdr+Ysfce48uxH+Npl++8
         pc9EIm1pv4doaTc/LsNf0dn1ElJeOmBNehU9ej6iyS0P+RgQsPvkSEjRW5ifIUaqZLJj
         4nAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrERiHLFIZquazBku33UB2qVgT3iRGDgoEuJxyqzjJ4g2jjVIHR007nXwFu882YSILijg9R/Sn4I3BWeOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lsI11XWW7Foy9eBcLozbiXIlxpe+6o2mnWA5JICTWGNIf63jpH
	er3ArTLMaV8wUPxD5lLH1Z8bhElBJZtqbxHao11lfRv+eqZ2qxH2IxsY
X-Gm-Gg: AR+sD10bSSg9MX1n5ITDkLu1m1ghcAP16ItT58+CngZQquBKUTHWqbULuk9ndT9ag9U
	qp5yhfgCMa7VCUf0F0OKCU8+XI1WR5fVd3y8CHmdCGsZfiJEM6YpPHkEzNV/21IuM0oR0Xd/uTj
	xvTCwmFcJPy8ujqhvPhiIBZu22WR8UICkDTorIBusczNVR0mu91ys7pg4PKvzm6XVPLNIpfalKX
	BhF5dseKbSb0vUEYGxfaMAf2iZwbD2GXzuV94G4656mJXs6vKkUYBXBpHNbcCrVCa4xsXT3iMXU
	2l6zK4NCrWo1aBg6IUsGu9vrhlzAKVQVRWElR+XSJY34oyR/UHf3bcK8Yns6V65/NTVOUevb5/f
	O7Zz4fY1dVVLt4ERTSizxUy7K6xMhRYtkNs7V55LqAhmxTUr29lxrkfgczLl9/gBXaIMZdsNYQp
	PB2BW3tOExNs6MqbpVZCIKVM4B/6uvE0MmK9+XVfRNf5sFqqbFDhgsA1rAk1r0IiKFLIeyAwl3e
	dcEtvchNidaiGGzsRMnvQ==
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr377275115e9.7.1788124725300;
        Sun, 30 Aug 2026 14:18:45 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab5a2csm16272423f8f.4.2026.08.30.14.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:18:44 -0700 (PDT)
Message-ID: <41345fe6-0891-4127-af2e-de3832496935@grimberg.me>
Date: Mon, 31 Aug 2026 00:18:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH nvme-7.3 v2 3/4] nvme-fabrics: reuse string helper for
 subsystem NQN
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
References: <0D24A9A3F19DBCF9+20260827125710.1381672-1-raoxu@uniontech.com>
 <2480D624F1D8ABC8+20260827130353.1390863-1-raoxu@uniontech.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <2480D624F1D8ABC8+20260827130353.1390863-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
