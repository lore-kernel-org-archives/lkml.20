Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870076;
	b=5bxa/Xj+QT9ihLnbCy05ptY/tti5qn9qFUJ/svE0+DN+4I0qEgv2ae2McJGM5j5AA2zc
	 LtnleGgoKOn8P8VriD1NE80Dp4Rmh74lBd//hAsu2Q1daIXAoi7J81Lu0ZuwkSnWKMHOM
	 VcP6k0C8lYCFi4pt7LlycS/vov9k5aBQ+MFLKhSFa6jMVD3JTbZSvGZEmcCDCjMHFJf3f
	 oNGh+/FSZ8kcYrPEmxcl46slXUx1/BGyUuErtxloz1+XyGgUwgXCIyl4n5QRB5ua083Vf
	 BvWVPEnb9ZQpGCnggRXTYS/B+R43jrrc4sq0Y1bReWOIyNe13X3dwDblMMcc0vLPBuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870076;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=c46WxFyETwEcqtsQp1SFSIazgQf/H4h26hFEZAFO9Gg=;
	b=IpIO7lID25qpzsSZSPN0sIg4JN+s3DKrn2A7eh7iNfo1pfe5L6sQY5hD3EBcXgYQ5moC
	 pe+z6mba6Ri1fMxCn73naiFvrfKY6FRB2QdNWdt24deQ64EpPWz8+Aa9n4SwjrNMxXqWy
	 W4viiwExpSuFM5gEpgS7Qrasl/AapWr2JKZxuVZYh6UwnFWE6eVjkY1ktpK0kc7upsDX+
	 jLiNvXrR2iVZz41xmqu3klQ1NlWVtES0EqS8DAuwGnkw4QetqZW5nx3Rh2gP+B90VzCP8
	 EjdksY0ox1INa+9lAdZcfKSYgRFtHtaO0ZYbN9qG+/f/t+MxqullmUJfs35Tr4fZ7Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ktfWI8Q4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DC8606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ktfWI8Q4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB501F000C1;
	Thu,  5 Nov 2026 09:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870076;
	bh=c46WxFyETwEcqtsQp1SFSIazgQf/H4h26hFEZAFO9Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ktfWI8Q4vvZ/Suk4u/Z5aTrQy9i9t32YKXfQ7yPPh20KgnXPYhbqiuTQoFxlte3b2
	 FHbD7Mg/+M8CzYWkjA5G3q1+wv5vevr3Vm4KuqVqYWWWQENVeixLJWfdUxkd12KwY3
	 bwFtNiSHJq9ZGMSfvXx3KLZrJJuzRwzpXdtQB5fEaa5MwPD8e5rmMTguT61iC16BjL
	 c+D+XMIrtz35vHDxREVACmLuN6H9ELmk36dqz8zpDcL5+ODLi0fVMOCNYp2W5FK0vU
	 sBa875lovxXJ4/lIIEjlwPfQ9CSUpJOey5NNbRj/lZEAAUs8Ykr+g71BvJxxZbtiNI
	 mMk/dUWiv8HEw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Joe Perches <joe@perches.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] MAINTAINERS: DRM DRIVERS AND MISC GPU PATCHES
Date: Thu,  5 Nov 2026 10:14:28 +0100
Message-ID: <179387004596.656088.1969311294761983783.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <576e04e1d8f0d5ac0805d450b9c87e69f7f0d2c8.camel@perches.com>
References: <576e04e1d8f0d5ac0805d450b9c87e69f7f0d2c8.camel@perches.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 01 Nov 2026 00:41:12 -0700, Joe Perches wrote:
> There's a small defect in get_maintainers.pl that allows
> incomplete file pattern matching.
> 
> Update the "F:	include/drm/drm pattern" to specify only
> the actual files covered instead of a prefixed partial path
> to these .h files.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[1/1] MAINTAINERS: DRM DRIVERS AND MISC GPU PATCHES
      commit: 5ce31e96b5eea830f87d43e603ee715f4b4479c5

Thanks!
Maxime
