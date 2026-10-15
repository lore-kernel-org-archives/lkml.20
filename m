Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9165C35E93B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792040766; cv=none; b=CU3RrZLnksRM+hyHOLgwn/2uDt1urLJIxizGWfEyYteYhx1JFPhjPRSdSnFpw2fbWhign81XDrR3r4rO8fh/LfBRAl967nB5AL06Ih64XDxQK2es/QV+UDH2mb9LDuTdHubERzp75TGH8qgoJr470XDAGOCs41v2TkEVJFsDJRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792040766; c=relaxed/simple;
	bh=w11y49jbyV/4vIC2F4b6XFOH4Euf+45PUeCl4BzyPVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2mwzJJ6HSuhVQXtLKHvPM++AooeFvZgd4T5HttM24i13RZyLNY8O2llsJdhIxIAyHOJJ4TfjdF2Y1qB+fi7Awsc4Skwz0b6lNNIx9z5xogpSiAeNPKKcRFav5WE9OErnMM2B790oAa2Cjo3PC0rtdQcQoLtpShB3d+v6htInEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGmHK5U3; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGmHK5U3"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89e018e466eso509892b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792040765; x=1792645565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w11y49jbyV/4vIC2F4b6XFOH4Euf+45PUeCl4BzyPVM=;
        b=pGmHK5U3snngF0QolHy6HqPWemjepwXdVLMaJA7GLUhRUx27xqrLkzKpfIAvC4rxUm
         HLfjL6qXdeaM0XGLHROVG2uZYiQ5T/m/UxIB4C1LWONqIo6cHri86tlelfO9CiJ3J3y/
         8c+Okskgh4SLYTeqnw9p8dwRTk1qlND/j44mUUTMSaLY0bsiqqIwnjZIHCyuJA+2g5Wg
         WNL9g+IYESXF0U70hAchIle17YuUKB4OZhyvWUFmL6Rib01c8hHVP7zh08T+tTBsX0gW
         hHGG8hWdvEcbB3B7bzTKerBinYtvVnxVxPCdb4dWQsyVeUcLeekOxCSBYJjfThkR4grd
         If/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040765; x=1792645565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w11y49jbyV/4vIC2F4b6XFOH4Euf+45PUeCl4BzyPVM=;
        b=P6BLd7KZMHwp5l5FheeTnm3PlGYGSP/+qfaD9F5QYvBmsGsuuCJqjtWMuCVCwcUdpa
         X+E/TO/LYay4oGl1VmQqW2Ui1BFeOMhTUWTTtLev73YPYydIXDlJZV/V/aaANeRrJ84m
         Y6H+tp4xRtx5NyJZ6BGOK9+KWpXlQr0CqPGdC0PJNbI2/7ezyNw2nSSKRPsC+J4Tet1R
         gRQfIIfQWpBYNxFp3R4d6trDOgkq0jgPvKVLwNt/pthhTWCq3iHx7ZfqgnbrJjfnsXCS
         GQckxipMBmLmLkPvXU3im6c/rYYInYV1iEaj7HF4ugJhq7rbELFVm75//loP3m5YzDGP
         aXUA==
X-Forwarded-Encrypted: i=1; AKwUvBzMjL+AT5+q6Doqg8FHsyRTfNDrwcGpI46hXm/2VzKX8Vs/trr6z4SSS2e8rJL1LtGGkWzVALa3Fy709+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnv4Jtix4GbSCj+cY8cN/kJtCKb+ZsP6OC2bcaD33LHOlqAW67
	TsfoqL9nBOz91jUx3/ffAeJv3o2GpEu4HTAVk7F0PKz+bmnSFYr6rYDT
X-Gm-Gg: AYBFou3Qitwu5h4yoM8UDUwFPBRlvtAbAl/w+EOXC1HJafvawEEZFjkkByl8/gmtA8E
	dSokevUDDnBWLBJaYmGvQ9ip0FrzQ7F1E4/Nje/TuMFC7f1Dg+X5P3YX/ZM8T8A+PtDbX5unXh9
	eedVO77vO/zfIRaO8jMVf8Bynee6x5jIUTkmdJ9NhVTXaxHd6+rgPCuOWkAT5h0MMaIG2TkHBbr
	6AXsxx0yxbHGtl6tTSX7omd7IrtcmCvmk11DaoaJ0bRGFvBTQeMc54eL4jz5Ku7w5LKUF0TeNYs
	JoQnBo6tStZq865TIx8QK2p/8uiuwHDDasL2Cb5t1/CaRVeMqC16gfvo7lT4LU4YPf7uNPaHusZ
	lsPWY05O6/2K5AiXqXLzGguNCuDalzd31ksb7GlBAiHTRBVnhiTO3ggQpLOKvtsQ603/zGbcl6H
	FS9BerHneYw1IbK6AmD+mWZVI7n3qUUQ0SbR7x7CILabkFMymMP94+hyVmsUaYCrNHI64tycofO
	lPJsmcBenw=
X-Received: by 2002:a05:6a00:8019:b0:886:84c7:72b3 with SMTP id d2e1a72fcca58-897c78d79d0mr14722485b3a.26.1792040764769;
        Wed, 14 Oct 2026 22:06:04 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f51f452sm1726602b3a.1.2026.10.14.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:06:03 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: Daehyeon Ko <4ncienth@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/3] ipv6: serialize address publication with device teardown
Date: Thu, 15 Oct 2026 14:05:51 +0900
Message-ID: <20261015050553.1835517-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012145306.GB779501@shredder>
References: <20261009054042.272944-1-4ncienth@gmail.com> <20261009054042.272944-2-4ncienth@gmail.com> <20261012145306.GB779501@shredder>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You are right. I overlooked both earlier comments. V4 drops the preliminary
READ_ONCE() conversions and the disable_ipv6 recheck. The new locking now
serializes only idev->dead, the state relevant to the reference leak, and
leaves the existing preliminary checks unchanged. Sorry for the churn.
