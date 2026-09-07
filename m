Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEAE486BBA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781332; cv=none; b=BwQ0kBM5H9z6HiEy6c5LPHkn4eZGpKabNe4uX5Fy5g6zhxA9BPASwODDrLb378dO45qPbPYw09qRE2QEYwvlljMbiZVyUXN8K0JWa+RXy1VSH99iaYsi0C9QOWMs8oBXx+T8M8qsyoHk/aNd9Ng9WuRNQMp0fgopdOC0j1bQpnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781332; c=relaxed/simple;
	bh=C+eLPiFi9WdfK84iABK0goOyBk267bDzFYY1gpNX4aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaqrwuo6fny436ivA6TJmGMnsmdtPD0W+QEGRx3ynmMHO+iuPYZ6UgWxKOZ7r8T6oPM7j3gal9GL/SU8wTQM8qwhynujaVrzeeWKpIDbesJ2aFxsY2SIUIt8At+U1gCvnRiO7H38/QK4XAxjBlRPTRm28lDyQXkzCRoe3D2DbZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atApHJdc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atApHJdc"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d8fd3b729dso27818645ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781331; x=1789386131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HFlAQzgEIbB8YVKSTeZ2MR1Rp9Uw4tUj/0oWZttTjE=;
        b=atApHJdcxcTPpV3AStHKq1VZy3IRPqVb1M4iIdEpSJwpjPlui0Nh8HHrrat/VbDlWl
         nsr5CAjnR4lbdYPJdMVFPvBP/gm1n7NorHhRqGxfDNYpYgZoY7/oR1HFJaIrf11hWJOX
         /s0FCWFkYnFkvYEML0biWszJezI8tq7dS5TZeHsZWCz8dX6ug+Ej5LZ+e0Uc5vB828Xx
         BlOzAqRkjPum7NIQBRqyWKvJBNZMG6OQhxNeOGmk+3gIcKzG/5tf1iSpUaE1HuOC0vEY
         6PqOz+6PlZj7Zy/ivlepE6Wb0qhF3poVC3aZuKg3jp5dVWtlXMynrgMXevwJGf5IiV+6
         uVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781331; x=1789386131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8HFlAQzgEIbB8YVKSTeZ2MR1Rp9Uw4tUj/0oWZttTjE=;
        b=d9RXotnDKHDYrOG7H8nF8WiRB2/LERLLehmkwqtogXdSteZgJZefeVHn2SeE7+WYVw
         AWmOBd8hP0OpOXj7qs6gk4gmrDJ/M0vOS4hYXdOEt/qNZIwUJxBG1/IIvVsG+YQjhr6/
         f6j6N59cYy6AA0w58o/1TI9gtY0FADGBO6SV22mLCrI6JXKNkMeByQoymfSSh5DwTo39
         lm7zlxeON8I6mHj+9qg78c8FRC+u3fempKOaVF4zEgjgCx+DoB619UaF4QZL+AuE9JyQ
         Ni/+CQEEWnCYqhfhO9beYMwrS4cf2y7lSZO/ql5giIQfi34FwCUt1mCfPEMK6qPJKuNz
         P72Q==
X-Forwarded-Encrypted: i=1; AKwUvBxm/VNNFy/gmLxW2qsTVK1vDllRnkDel0czNCuX/0w9wQCffpdDJly3Rmwan+iVunxEZp69cmg3EtcAl4w=@vger.kernel.org
X-Gm-Message-State: AFuF++noH3qeXzPphfnEddPWltFNKrLOXBlcfLWQUBqtGgrspgyS6NKW
	hP/4Z89V796SetKGw+EFYuwS1FKy4cnghUKeR2FksNeJ/4jSNnG+3VMz
X-Gm-Gg: AYBFou2suk+snhBDORpmDipTeTvEJ4L8N4QnP2ECYj9JNT3bL/5xDDm94OBXi78S071
	eOdhAdNI2mED1BsEbEU17KtnpvcuQkPbCQ7rfJVoNWlvVGn/NuFV98oKbuO543UbVpANQKwmFke
	FNoI1bYEK0X9Mxa9jq4iBcK0FPYIZXuUB1RC+d3xKZw9IL9KSqO98c53dQJujwMPlprjG9elM1q
	0kBFXQFNfsAFKAT+BngahDGLV59XRfXSSgWUF5Mdow/9V719XphkQTvhpCHZuqvwhctMFp68yEf
	21chnvkfwGfCygRhP3/AcRtiGmarF3hSYJc2DKpKWHw9a8nFY3wTLoOrxHLpkjZvHYtVsmUpopA
	StIlvzxRv8nY36FeazXkuQUo+uunB2Mem2/imxHA1lLVo79D3lawIVVCzjBo0HZTMr4wYbBv7OA
	1G17MqnMhNfcL8Y0FITmdz1ZKbSbs544C1UkSBkddbEj48v/FEWruRoEO8E0e3ND1bYVUbXl7Cj
	HbG4MtSEUTC0Q==
X-Received: by 2002:a17:902:db09:b0:2db:5788:655d with SMTP id d9443c01a7336-2db57886668mr77258275ad.22.1788781330592;
        Mon, 07 Sep 2026 04:42:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33825669695sm5249874eec.3.2026.09.07.04.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:42:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wpan-next v2 0/2] ieee802154: fix typos in comments
Date: Mon,  7 Sep 2026 17:12:02 +0530
Message-ID: <20260907114203.40171-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <87pkypwf13.fsf@bootlin.com>
References: <20260907095132.21244-1-hemanth.selam@gmail.com> <87pkypwf13.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 07 Sep 2026, Miquel Raynal wrote:
> You should not have dropped my R-by tag though, given the fact that the
> diff is strictly identical.

You are right, and I am sorry.  The diff was unchanged, so your tag should
have been carried over.  I rebuilt the series from the commits rather than
from the posted patches and lost the trailer on the way; that is my
mistake, not something you should have had to chase.

Thanks for re-giving it, and for the note on the split.  I split by
component because maintainer-netdev.rst asks the prefix to name the code
being touched, and I could not see how to name both drivers/net/ieee802154
and net/mac802154 in one prefix.  Abusing the prefix is fine by me next
time.

I will not resend, as you asked.
