Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D13D75A6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700222; cv=none; b=HIhNGuiFXJw9J5VrKSykhV1SYfVbbH0YLIA3WRJ7Gx9wqGGdOxfHxKSjXUlW2Q+rCwasm6qcaw7/kB+8eHvRBweiwQiTs/8VGkP4ZPU9SVjfpFT4HUA8DyXusQ47sP9ptsGEyovJOG1+Vd0LcZZuUT7f/e5mlLItKHA0jQmcm+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700222; c=relaxed/simple;
	bh=WH/rnE12a+uaVlNTry7gwUg4MsviWYt1nqi8WX9vXi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szBAm78iTDAStS9flJjw9m2y6sXfl3wEh/TU4OCHo7BEiPwSQ/xP27PV3Uw7q29Bf3t9MtJHeyLbvcAtuOn7ui+XOzvfX3+/94kr16Cv3ngnOL+XcIvMaumjrX9GqonZ6jBGLSDfPEjNE4S8vcPVrcpyjHFfmiSwNix/64MVr58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clNNZkJG; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clNNZkJG"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd88a115ebso1877635ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700216; x=1790305016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH/rnE12a+uaVlNTry7gwUg4MsviWYt1nqi8WX9vXi4=;
        b=clNNZkJG562ToNrLE3Cu8NKoJn1kjRqSfvGdob1UUiHd6STXZr07fKOScqWbTRiEjI
         Ehp/KSeIyKyNcJsmKl+x/+kh8BOL644uLZny57bf0uAhnjr7MmT3wvHIY0ODSk1tm7ab
         +haxeFBVHP/+MQR3+7fxX2/JfI5i9OUbtgJl1Z+WCY6UbT+atHc2cg/qaMpRCdfJb0PV
         /HcvpA0ml5TJekYHepfVcZSB6y7MD2F1rEcmI/oI4RINHu1/tH4EBRkxNRK7m3Q4jLkU
         GadmRjScFiTxatV6lzGyP3QGkNaqWALY7Ti2jUbJvaCSuROXrDD2Ii1BYudA4GjTdhTH
         rZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700216; x=1790305016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WH/rnE12a+uaVlNTry7gwUg4MsviWYt1nqi8WX9vXi4=;
        b=PhEXxy0CC/iae0WYiWfxEL7VpnLoBafamhvUofKC3maq3O0TGGV/cEXSgdSnMGQcuS
         f883laI/Jek986BR2RmvoMyKZhvHGK8u0FoEJYZDsCKZNBZuwB3geW+9nhqNyMG6at/5
         /IdNVl3MrxkCV0gDaa/9B0CyTx6hqlYYiI+lwD2UrFWjPq7/m65Z6pdeOn2H6adBuoSa
         UzEzm2qFVvMFsVH9C+LtwPVSeykGte2RasZPo2m/y7Bke1+W1xRLXZ0Ss/DeBKGMJVD1
         fSHu4sMVOT9Lwxg1o+2DUljryegm2oFRrn9AFrj9mm5jt9Dg1RLcB4X06uAyYbdD5Pjx
         8tXg==
X-Forwarded-Encrypted: i=1; AKwUvBzgKWJYCIcKoqm+7mRd5alH2njwLea2o8Ge3aW93F+3OgV15HuvA8tx4+8b9jlpg+FqtKYqyFc+0aIIGbI=@vger.kernel.org
X-Gm-Message-State: AFuF++n2OjuJGCLOb/5JDG8dR8RQ1yfR4vDSAkoG2gGOVBZC7XZTI5Ke
	tyAnKIJfbi0IOmK7AG4FS+1+FZIH3/MnFUCC7VQT3RF1VYpJfAyjnVf+
X-Gm-Gg: AYBFou16YlmYfdYoB50ExZTk4hcE9SKHJXb1Ft1/0WLeQ57S7xvgJUjv8Sjc/Brm9U5
	IwZJX23GHCuNj9pJQy8tLffOFQX9ZareYrm4I8Fggdq8D0gPTZpBmQ8lOEvLIGYt5qN0BCZJUhS
	X97zfHf8wXSj5ZltHf6iJR3vD4FKLj0j+c/TW/41nfnvXJtWHggAgoEQQVgd93iT4mhxqkGIaCX
	5iwEBi6s0LKmJmjPVzcyrNiwwKu69JPgx2kA82WT04GCrbxQF1drr76dh4VH3t/3n0/+Umjeqq/
	0MX+zd3TxAKbisJ7jvqZHTumPa1d3DILVl7adlyQmuJ54oG/yIu5r1LxO+IvNK5jTB2+5HTCBvl
	Zk5Z7WiH9DpZ6b79FxTie5YToKLyT4tiIsTHPVnTo+aIWkOre4PfcTxykytt9RaSWqb4mLZzB3U
	+XDGHSEuOEwM61A126zb5kHKMTQB3zccrcxEnji00ISG/IZOof7WkiJFJrfztwxJ53
X-Received: by 2002:a17:903:2f8f:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2ddb1baf0a0mr24255345ad.27.1789700216039;
        Thu, 17 Sep 2026 19:56:56 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75b52e2sm734085ad.60.2026.09.17.19.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:56:55 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: kys@microsoft.com
Cc: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	sgarzare@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vsock/hv_sock: fix socket/table leak when rescind races the delayed close
Date: Thu, 17 Sep 2026 20:56:50 -0600
Message-ID: <20260918025650.15990-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917220213.56102-1-bartlomiej.dmitruk@isec.pl>
References: <20260917220213.56102-1-bartlomiej.dmitruk@isec.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LGTM.

Should this need a Fixes: tag and possibly a Cc: stable@vger.kernel.org?
