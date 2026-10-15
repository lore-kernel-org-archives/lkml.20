Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417EF2BCF46
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792040786; cv=none; b=M/Dkb3HMG6Fdf3bGHSzz0w8qj4AEK68aP4x4c7epBIF3dQi+OzMvttwe6pY0vOqdFYUl3c/6mJzSNzuUlgm+EHS4IXUyX3G5BtKbdEG6Z7O5BS7c3yKjxSB85DOh+h9CWq7wDAdvIq+hhwOrwXg6sGoY+TPzolQW4x7wHPHgheg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792040786; c=relaxed/simple;
	bh=cxH/hMZE/AC08HsgZbXRkmn12fLokOsUnbhBRljJda4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMHGUeiRBlbof4dMFAYaI7325ZjXG4kGS7hkBzhOGL6W5EoyFt9J8HiaJ0EKCiO584qdU0tiZWHhioywBEgCwwTkxmU5IoDcdtluNZpFpf9DgPwP2rjcvdJ8Ts5d8YwP9RQ6C+YiU3HTf40yFDHpbJmoGvxEY+DRNTaRKvA/k5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfTpMHWB; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfTpMHWB"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-85377c8bc96so2123154b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792040784; x=1792645584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxH/hMZE/AC08HsgZbXRkmn12fLokOsUnbhBRljJda4=;
        b=CfTpMHWBdS7UYt4NB6fY1+KeJ+jxZuY+ll1gb/9loITxuCLC+2pZWoo7tLuLJCvS+f
         jd64zng1TM1I+Ps+vyMc8Sx+HMaSUp2FdqbkD/u7tC1WIe7WAGhCq/jZs3PVqea6fF/Y
         HLMdLWqwJOsjSfMISpJTlXH+7zU+k+vbjomksefBef0llsC3W5g/uLaVsxf8aWImxQVc
         EY9aRq7AetSMKr2aN5uyHNMVa+yFpFQPI84Ok9/tKVkJwwvLhOa8eU9SAdoGreMCB9XE
         P2cvSW50AowHqYv/DA4vjuIsHVBOGx8AQSjuErrBCcZJfXoEY+aM1fPVDEuP9SLYfAY2
         jJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040784; x=1792645584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxH/hMZE/AC08HsgZbXRkmn12fLokOsUnbhBRljJda4=;
        b=KsCreBqcIj4hrJChVvkUQeY0481QiCX+LIoh4eMcWzadl+wu5r1yM7qc/PHX+SXar8
         j1oEkJKsBxNF4YQs+YneKzGLc0nr61SG3L9NXj/0xUtycAOZHpbU8aQE1BADr3IFMe/K
         PYy7U2m/EP6oy0ZplynLbbiXiDEN3svC2UygiM4avYtk7RILWl8Yvjc00I9b5vC1CAGM
         E2i0DlaXx1fy1ZfadeYK28ClCXwDcBDpc7pBuf0cnHspOpEw9Hp2AOZu0N644qBnUk20
         sPCdxf8f+VxL/3MnTPJF449Y9uqRkPH1ZdbLSOq8u+M9fz7kh57UXwXcyRkFmIh35Dd4
         GgaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLuT3v+9UH5d3aoD3ay7no1+rbr41/g8e6MnCmwzaq74UrD4JtSbkxhUMx9IX2L4ydkIgTkG8b3XLCLf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpReaQ5S79h2v3d9GU7Xl+aCCZjHv9nNfoRsRIt9jOu9vgSv0e
	j4rPISKdWRTF9DYG3bLe84ihfiLPeaNZ8+Wtlg5TiKBChAG9eUKDzWvn
X-Gm-Gg: AYBFou3UIxs9PcdSqmmW6F1BvhU7HfaPQ9agnq1G2kN7oeMxf3pDHHMbdiiCJKl1JvY
	GLEG+Oxj1o09CSailWX0+8z7a/Ohu3wjrUv52/oAcQSPWF17Np4O0/rpDOJfqhX6D1TxMhBB7NJ
	lc8obMmaS7ipRYcDKQhxJktl7EYpLL9p8b2U+FD++E8OBJQnSwM1uc3xG1VG6z0SuYvqgu1wOx9
	rUpBm+YPzJbH2Xnyt8TwAytOhTxrNvQCMLR6EjR+1FhE4grk+ZM/MZXGBl9itNIKSn8CwstsaSv
	Qb1x23qdzVbAJPiS0MuOVCZOKfjbt6AhCmIr8XmCoQNAsNRGKk4rjWaXle0n+ktHqf//ztWcGk7
	yZK2BGwsEh1PEFSN3Q5xhoDP4xv8nLTU9lnO6QPZByN4JVHByipac2Obj+9xiI+tBO0oJE8M/P1
	BPW8WmBR5vvJNAf+Cv0rtqsjAc3eiMXSEGoEb6kvhUMhvSbAyxZQpmjnaQslisWT5AYt7dEO90n
	YvYEyPMys0=
X-Received: by 2002:a05:6a20:6a1d:b0:3e0:df81:23e8 with SMTP id adf61e73a8af0-3e16bdb632amr16747581637.24.1792040784494;
        Wed, 14 Oct 2026 22:06:24 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cdffa5sm635724a12.29.2026.10.14.22.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:06:23 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Daehyeon Ko <4ncienth@gmail.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 1/3] ipv6: serialize address publication with device teardown
Date: Thu, 15 Oct 2026 14:06:05 +0900
Message-ID: <20261015050610.1836863-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179161099408.434549.14449036924552933828@kernel.org>
References: <20261009054042.272944-2-4ncienth@gmail.com> <179161099408.434549.14449036924552933828@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch 1 Critical is fixed by patch 2 in v3, but serialization appears
before its cleanup prerequisite. V4 puts the hash cleanup first and states
that both fixes must be backported together.

The other findings are valid. V4 describes the stale hash entry as a UAF,
initializes ifpub, cstamp and tstamp before publication, and adds a fourth
patch that does not restart DAD after teardown has marked the replacement
ifaddr DEAD. Thank you for the review.

pw-bot: cr
