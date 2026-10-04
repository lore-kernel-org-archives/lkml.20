Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5299C41A561
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107141; cv=none; b=QbFB5/geikUvBBEU7qQosk4uBqRn5Ze3aO8KI4U2jx33o4KyAg+rGw2wOJNqi3fKIzElmXz85nGXOHPxqpTGTyZFkmJ6R7f2dVj7kVDK+4hq+LPqa6EUDWotOsS3V48hcVO126ljhP30eKf1B1YqOcg5Yd9Ai5Mn2lWfJkYqnYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107141; c=relaxed/simple;
	bh=uSpJlr9pWB8cp8BrFmQO5ngregHs2jVsmD4SjTxJsbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLEdWKmZdeWMCkUbG+aViIl838nRR6msA7j86cv4xSg5KXXdIa4907dkySvJWzBXHWpGAF2+ctN2qx7j3PYyj6d0JbVxlpyG7TZb1aH6JVxC8sypDQGy5pqAWu9pv2OsRZBlclvO3IrOyc9UPxnJiWQrgZhE0eLjT1HL13WwmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HEsp9s+G; arc=none smtp.client-ip=209.85.160.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HEsp9s+G"
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-53396adbc53so9576511cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107135; x=1791711935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxK826MAOAYwXMvz4tvmAzJFT8E/SsdJVdTSWQcGqO8=;
        b=YA5pHaiyQF3dGKJn5zfPGww8L0MTaXBk58xEgPcfmdhFTIKgsHRiKOo0EtDcs/cOAS
         ZyrQ+EfkE5+eUlAlSFxZTWZT7v0ibPsclYsORmVu/tDFwKL/rt+gTt+VwRglvEZ+dLQM
         3m6lH0TzbsvMGpOKuJ2ANpLQn+rzfchmRsl3dMpgnejGmTQu1yKE43hTSmYFaFuriXo5
         uKHbG8mrz+5/ffI6fHwUVthL/xYsbfYZd4IYk3bc5JCemtrKW4ziXR4HxfHk+wqJpB+x
         UH3xZAWvs4bLPps1zFpiKMPieTFpaxfUbX8ou0ZhYcanPyZr6zYKTS1I9Gch6PArFrD4
         4vnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNdw/1krFfpn8FCks5abikt6LR5sXScRVAIm8Bz0aYbFo44C9CPmTGmVJGk7NNaxQ0zF9PdIPkiebfn/M=@vger.kernel.org
X-Gm-Message-State: AFuF++lQfwU2n02hoItTeVTHa4iERrib5gVVQVNzGjUYZKs9wwgF1od0
	mZK9ztWE80DpSLxd8ltv97ps7rcFARN7P1074CeJZ1TQoZ2utykbB8Sq7QRpW1PYqLpDqbRsZF3
	p4JDCYTwqA59DU9lEWoqZz0MEEpOfvnnJNOBtyO9RNN9wjbT5NP/fLXFgKHUf26u0LideP6xnub
	ShvtWCmUlpcaxOkCbvwOT1l2Kh9M+CuAR1M9eAzuMRfbTmjQJeuYxpjyF4rhkCHU55hWqfVa3mA
	adwoBmA39Kydxbt/7EwhZ8zpw==
X-Gm-Gg: AYBFou24AJ2QsMri7pLmIPJjDh+2OdpEUDNJBmmjWTX+95Qq4q39BuFkgl+lj9gbbiM
	83YPC4MxENBvmreII+LXWYv1IuLJzTUMrztVyCmL+VyZj8LIy2tGy3Kyk2B/8HCGqUk76PSrtwm
	ZPgJuQIS3tfw/Qqm0Y0bbDTMQBKOsVPUHYsflJ18bTcrcDMCZcAUTG1dgCA+Ypbfdk8l2lHR1yg
	D3cMcSNH7+pePmwYLJpuxrEgh0+0ljHKfxT1ywGXUuhzF/969QxFlXHq9MZOAECNrOomCHMwyvY
	NWx3XAj0M+kFdLdDTnfESv+vMbhNuRqGfb9o+VtTxg38sw92gYljQbcGj2+LKro4ZAZZY6Tq4yk
	7ZSvXd0bH9L5opXlCkDPHAySKTPJAjedQjdrekEem8uUP8ueT9sQCgf4lUadFrgwvoYDz7rGkqt
	RHHyZfGcW1yODlrSpDqjxjX8vz9EjDmgxh6OJ6z4IbEw==
X-Received: by 2002:a05:622a:15c9:b0:534:7742:e5f9 with SMTP id d75a77b69052e-53511e9d7b7mr74816761cf.30.1791107135122;
        Sun, 04 Oct 2026 02:45:35 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-53502d345c9sm449821cf.19.2026.10.04.02.45.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:35 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34d80ca2184so1226403eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107134; x=1791711934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxK826MAOAYwXMvz4tvmAzJFT8E/SsdJVdTSWQcGqO8=;
        b=HEsp9s+GXwoBW3iYzUzslBstyzxFW/F1yZb+tVyN99i57PETeOk+yU7gkB5DpukJfz
         PZCnVoAECJu7L/aOx3sdLWUDm9RgL2kNLxHUmawtpXxp1JJmaZso07Al/7zQ2BY6Oq/r
         XJ5tdImn22Fw5+9lt8lUBRyyS2R7MroTN1OeE=
X-Forwarded-Encrypted: i=1; AKwUvBy/kEri+j4iiqaI6ickW/uDyOUzDpaX8kvXNHBZ/HS69fvgS44uxKRWAH+GZMJf0E3fsF03XjQdf0I0Iik=@vger.kernel.org
X-Received: by 2002:a05:7300:d509:b0:351:23ce:992d with SMTP id 5a478bee46e88-35123cea7f7mr2847625eec.27.1791107133670;
        Sun, 04 Oct 2026 02:45:33 -0700 (PDT)
X-Received: by 2002:a05:7300:d509:b0:351:23ce:992d with SMTP id 5a478bee46e88-35123cea7f7mr2847594eec.27.1791107133106;
        Sun, 04 Oct 2026 02:45:33 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272f27dcsm3508030eec.30.2026.10.04.02.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:32 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Janne Grunau <j@jannau.net>
Cc: Hante Meuleman <meuleman@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	Jason Huang <jason.huang2@infineon.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: cfg80211: Report port_authorized for 4-way HS offload
Date: Sun,  4 Oct 2026 02:45:27 -0700
Message-ID: <20261004094527.1324037-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
References: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 15 Sep 2026 21:17:38 +0200, Janne Grunau wrote:
> Since commit 416386060 ("Mark authorization completed on driver
> indication during 4-way HS offload") [0] wpa_supplicant expects
> NL80211_CMD_PORT_AUTHORIZED to complete the authentication when the
> driver supports 4-way handshake offload.

[...]

> Cc: stable@vger.kernel.org
> Fixes: b8a64f0e96c2 ("brcmfmac: support 4-way handshake offloading for WPA/WPA2-PSK")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/cfg80211.c  | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
