Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690759;
	b=jWnFTpK8d1nn6rKaJsJlRBBPbkpa4HqxJGOJRAgrmGV9iHI5zzwkdP1krE24A/67DIBb
	 MIc+e73sECFYICLXHcO4l+kdQSmO9OOfo/qdG1bHycJsYK0pbDapDCFZ12pgyDImGuHii
	 9zzjQDx6N5oqITF+M0v3BhqiPNLyBh2bPdd7wtGqtB/2AMfFHtcBsExMsnZprQsKoIZXt
	 mt9AkgUfiNtuO60K40gAmkA4evQoegYKvU9Gm01cFEBKYwlh4ziMO+Mv7V+5lFPr5l/yx
	 90EtyMtK8tsk1DqXf3Olb/nfGHI4EQ0tRM6vxwfUoBh9okjKNrMn20YmvzW3C8qGTfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
	b=VyW2S/9KgofvNCJ/K91YTlFVkgBUfNSLUbbLBsTlSPeE0k/m/eJ29ofz4PRhuOkDtzrG
	 ecXpCkAZaABTUutQy03S/DP3eO+kwdAv85xzdcC115gCe8NBa6EEbqdop7ms6AzrfZZAO
	 9yYbqhbRS4oqwREYA9Y136MMfkNE20TX4CuwYfoZvy7s7P1Wz6seZ2iEIj3lqrS4KLj4V
	 ICpSdYuKkmAZzk3DLof8XAXAret1H96+a87WQD9gReRyBjHhyCsR2KXayEmVAvEFllQE+
	 0ZShnjBndy0QonD/PSBu0coZkMwNkouK90uzrB/tPfIY5C5yM8bax/7auFtg72AlYeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyFD5umR;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C3B606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C3B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyFD5umR
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so13674275e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794690758; x=1795295558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
        b=NyFD5umRBWuWzXRNHhhTax4Br1mnDerRXAyYQRqz/o8qiZj8KHC/Tp2JZg61hJWeZD
         c8EKK7CxhwCH3BkUdQk3CuYhPMeeGeuyy7RPLATQxOFOTuVmdu1Fzw4pCjVzM71OKepP
         dkY1LIW5hV4G8uVGdCJfLvwnvLZfk2ZpdzJHZsAbLsxgebNvdh9wBmpyQ7e+VRNgsDF2
         7fWJjnv/jyW209F2rSZ369d8XNIyGTqRbjesvAMJ7c3Uo2gt5kEyxUgVxVv+YH1NZNcG
         H5o41mmOUdkevFgYBvMPeo+M5b9Bu/MXZDvto0zw53ZYfHMvfiAS0DpeeYGPSu79zEfD
         4f4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690758; x=1795295558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYKKHnF9THpqWFzZUjRJH65VqrOR/R487VmPofFOtpQ=;
        b=Zg3gK5V9pilutBJPsrwXYBnGQ3HY+0mBk1mXE6z+C1RWaiU4Q+zjSF4pq/NKiN/+aO
         lI4Z6ZZntYEm1Myxr3rShOA6ZA1jveSkDvsMZBChRzaM++Tyy93DH6RZPLq866tCNCyS
         psFOzAlthlwUt2ZdCIvVeTHrgnOBqzHeh2PNC9P+kftxxgPMrX0Q/Zcs7WKgQdq7GjJo
         hYRZsTJ955rzQDvnT37eETOMstGm9XiFXTlZvTXdP9j0KXxXqw9V3GisQmWb49hmjpJ4
         vvLlf3xK6QlSYCRFG0VXrUxmPb6KqHdIJx/esd7evcCkggnNiaPO76PN8MBqKBrMI2lu
         oqHg==
X-Forwarded-Encrypted: i=1; AL+hErG1PiDkuRwZ82ikCY6z2lIUSK+/9pB3S7oFxx/cWb/S7BlkPKF9gnc12fq9+kIRKZUZwRi07y/D33adsEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z846y4t0yO8V5Fw7PVxEOPGko0s3qEV3o+LZ1Bx2SHV869SuXuZ
	Yrd42lC9augz9ejjBAcqvMAXwhEPObzxYiHByTJPTq2+JkYQt8C4s7i/
X-Gm-Gg: AYBFou1HGuED2C+3PNZciCattvW7lJRbUHht0GnsKzjsXLI/4tOseBGZGAp7H0BrHrV
	a8m7wJKMMh/xjZsb+LixvEbGMxTsRPD3N43flH+jRB6IsmsnmtBwxnccMqxfdwQRJwUWD2p0Z3u
	ekkBQKSehLWAKKnUyn2euOHxqBtgQc4Zcea+2ttFjl3RBGLP9XReUzqlexahHBMi2uRD0/VhVy9
	RBSt094nX5BvtR/XDqqhMvn9Og+RSPFrxRt85Ly81AzqOf1TVIMf1Yy4Fy1YYZcF51tDtOB04Yi
	OqLqbehyVKnUA/aCPfGHxerOQW7rpKsHEBNbZy66RcSJvCye1V6OLAWjq0AcQQjCHnnS4h8HLlR
	VJNnQ63Lddh/gdIN1PvqyyGQXsXKgmQ6rvJ2e+e/1d/IceYZSFP/ahq0DyCPBcn1kqrJF2SxvEi
	gP8uRlbqnhEK0B2RQKpx2oCKSKMmWTdlAYFvuOV9IJC8NXdao1GPyO3ZuwXD/4+pVd1J+eWhvm/
	P6aQlwIli2G3iQK9uQeICMX/zgWwrLsfMl1jFW0g7Twiq2oMWqjxo0icp5Xd8j1GxRD+kMftjoZ
	nPFPT9rsHM4T2LSmdXVedFi3XNM=
X-Received: by 2002:a05:600c:e557:20b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4bb55a583bbmr84669175e9.11.1794690757810;
        Sat, 14 Nov 2026 13:12:37 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm267895855e9.4.2026.11.14.13.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:12:37 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Halliday SoC
Date: Sat, 14 Nov 2026 21:12:14 +0000
Message-ID: <20261114211214.1928927-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113-doberman-of-unusual-beauty-ce6a57@quoll>
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com> <20261109-halliday-icc-v1-1-def7cf786f75@gmail.com> <20261113-doberman-of-unusual-beauty-ce6a57@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 13/11/2026 11:31, Krzysztof Kozlowski wrote:
> Why isn't the rest of interconnect patches (bindings) in this patchset?
> You sent it the same time just split. Please organize your work
> properly, so subsystems receive all patches, not pieces.

Thanks for the review. I'll move the OSM L3 binding (14/17 of the DT
series) into this series in v2.

Best regards,
Stanislav
