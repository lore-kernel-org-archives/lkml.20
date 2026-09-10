Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAA57D208
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064408; cv=none; b=Uo1KC9vvgZgfBXCxheGHoS+Sex8aAUw0xtCqBqgl6+qmDxnCZLJkqnXVRLjIQmmhZt8rPMb5p+dGy9mjvwJXtgySoUIYr/SGOGpCFfXSg4TNY0D6yrXnt2gCqF25E3wuXYcbFqiOJWqhpLIN3Wea+djvs8pVIHm99UCIEIW15gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064408; c=relaxed/simple;
	bh=qF51l8XO0vylmqZ0r93gy6syKZHssm0J0aqhvYt3uik=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xa4M+ZTIQQpFYPQYJqsBq7bCpd3aDDJNfKvLDWzNg3O6kHFoNYcK5rwsbQdUJimuHRwjRzit3NRyiZ0YhrmKigFaAiaZa4doSWq2R4DknrjNcR1BN+KPaKSkbLL4rZA9c9LtRoJBHjMFMuIAzNz7hab963aHuQ5/69rMDNY5Psw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=ltThp2Yk; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="ltThp2Yk"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4b29fa803so111741a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1789064405; x=1789669205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIF4EGNYV//D+/mRr01nJgL7wM1T2zwMBGkKJveANRw=;
        b=ltThp2YkwJ/W8ZBYvQhFDmWVKGHbE7lgLR+hlyhgMQy1R0Kq6FRxF9jIv+Su3oRXSE
         0yQugKyKzUugP9sIqKh5zraSgVK/cvrNax7gY/ZIaSJ0azricHEOyiAiEKmnqvBvpUs3
         NFu+WfByTgOPRN2Koq3Zz3pljo+KFQEXC6bnfTHNH/BIBxMu7fsNTg5VHRXWRcj3L+Xm
         LRg88IQZht8f0y6yYWNABqAxvX/hWeR1SVdimdOZpz0wc6WG5ijv0XNqNmgelHFLCRop
         0ozwZ3Ul70fdCE/ni1xYSjpqM7VPtWN7T2C+aYDgbsQHBuewIsgM1afQGym6WRp2DCBi
         v/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789064405; x=1789669205;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIF4EGNYV//D+/mRr01nJgL7wM1T2zwMBGkKJveANRw=;
        b=HHccSIap+CLzx9m+6noD/KW2xWPTZFTXlw2QNbFxA3TCXoPq4btmje1G3O78nc5uEH
         6g7e0/XAQgrOfr4NAG3WOqlDlEzumY3BfSkNNPQ0QwsoSBVSO5hK1QZIAi9j1aKL5a+x
         7ApKPTLhNpgXW4IJkhT0mw7sqsWHfgw+sLcVQ3ZbQyZOs6kuclz/hAjtGtEwJ183fr0w
         N5/YFbtVyegsS6jIkTTwFrE6SsP3T9gM1uC0nPwRYEhRb+zJYPBtH3Ul6ujvecPMW28C
         8i61dVveOQ/lMfNwaYU7xcSttJY6/tW5aAN8n0Qz4LKCCNJXC/qfknHMof375m8VXUbK
         I3lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOu68H8Es41l7sQdcDJese28pwbvOlUHI9lZQMtLyU3gJjJuhWNk5kkRvjmxCvAoOlluE3wrQF7wGkjTU=@vger.kernel.org
X-Gm-Message-State: AFuF++mhlLN7Q6sbzLopvWKi8tYL2SgfE8jI7jBsiCJj+hMdjJzNQiFo
	Zl6SQFA9bQd2jITvpd0XvfQOuDlm5MCwvx9LkEUofSWUtUBpmSB7joH2Yc9ID6sjuco=
X-Gm-Gg: AYBFou0KSF8SpNFWtmOwf6+ELzQI3k4gIzSQHk2rhwkZBQv5wbPTdHweL60rZ21EbrX
	7wEZZtB++zNNXYiUrtg84Aa4k75ocWbD8EH4boJCGgrt90+x8LJU92Leecg9D3szNXo0v5XHvsk
	M492Csrv1by/Jv2rKeba7lnbx4yRvlLNCfKqCJKwFdKLdKSQoQCB/BWzWoI/LNWmvmdbdWYvJra
	Njo66TfjeLBtvC7SWd+39ev0QnJl3A0UuQS7dwIa9fHv+40NLAZwHFgBHwNBXOpp5myEtD68tG2
	vE2caDRzF/M+0qBacVKfRBW3H9xrii8gxjkkfw1GQUeYcev/FK0eidhxmBlBCm/5Svj5gK4sz6l
	rZ5ikzykozDzTfIsVcabSkAC+ey6fQWfbBN7DkogAa3r895G3F9EcFXyjukGN1iFNgzuslM+u5z
	SqqySHPP6VBSW7hEErergSdPPfDMVKG3Slt9YO44j+vLP2+UaSGW3SxdhMiRJFK1ljiXggKqlzI
	86lVP9Gio3D/Jb2n/bMdCLzk/riaHs7a4l58fbB
X-Received: by 2002:a05:6a21:7314:b0:3d2:5eb3:596 with SMTP id adf61e73a8af0-3daed31ac5cmr217449637.16.1789064404793;
        Thu, 10 Sep 2026 11:20:04 -0700 (PDT)
Received: from phoenix.local (204-195-96-226.wavecable.com. [204.195.96.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6599249sm101174a12.28.2026.09.10.11.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:20:04 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:19:52 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org (open list:NETWORKING [IPv4/IPv6]),
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] net: ipconfig: use ifreq field aliases
Message-ID: <20260910111952.47068985@phoenix.local>
In-Reply-To: <20260909144417.28871-1-lalitshankarch@gmail.com>
References: <20260909144417.28871-1-lalitshankarch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Sep 2026 14:44:16 +0000
Lalit Shankar Chowdhury <lalitshankarch@gmail.com> wrote:

> Use the ifr_addr and ifr_name macros instead of the lengthier versions.
> 
> Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
> ---

Why? seems like useless churn. Those header files never change
