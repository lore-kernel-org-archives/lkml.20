Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC0539780
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906830; cv=none; b=Jn4TBjt2CTmYyFD4sYZ402O0scTZD+FlrxdOmQQxgI1pzV7pBI00Xl9BaRvx/HbJCW/zbApMu1USVEWz4JwKQA8PwIAvKXdHytR68CM3tDg4rpqx0enreZ/O1dzHf+ebzayJfv5S8UkoFfggyb6wCnyRvcpj36nCim1GxfSa6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906830; c=relaxed/simple;
	bh=tM02Joz9t7HVO00dryrG+Vb1mg0Gn1AtgSVS/LJ4eHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUzSQ97R1NwptUzNff5f4TsgczUnJJs6o5C9UnEEXP3qGX54oCeQ46fQdkxC6aQug1itNwwslHFjcI3ENeZ0wC/lMhEy+FRs9pQOLaBwRYc9ICx4UrHXOMerk5NtPRCML2dz6DewCy+uEESemRTr90ojuHGXaQCP4AA0eVMUcP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=Lq9R+323; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="Lq9R+323"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso342015ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791906829; x=1792511629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=weVoMVk7+8IBm1YGLO6BLCJKDE8BQGTsOSBOllMfeck=;
        b=Lq9R+323j5eKecJoQEJWiZPopyykoaX6Tan5QKfJ02sNDheYGP6tI6plf6NlTbGcyi
         9zfOpI9Ew4Kb8t98Uk5FWL/aNZNGKYDBCMBfCj1nxQUIcHNhlfwOgmocGYeSSGbeJTHH
         iVwl5R5O6a66R19Y3fea9rNqAZaTKSp+L99gremNTH9llyVkQB5uVQGFpcshfL6QX2xQ
         eyGqSRq2DIL+bm89H2eR4NZOfJFOLLAPQlTaYAsGlMNIvMXmCDQGQafwa1Hem980HVF4
         NyCOCEjdDVeqZ+09eZgFrw75XKQw1clBst84csqx4lyuPbRSwagehd7edde7tBXmmufa
         dYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906829; x=1792511629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=weVoMVk7+8IBm1YGLO6BLCJKDE8BQGTsOSBOllMfeck=;
        b=Lz7XbMEVW0P3A4IZ4Facd3XTnN/70Idk+2FmPhALHf/6TumquT7vCVLzqSHdoE5ITV
         rD+eiOUIOWA1JyhSdP1PwN2X6D7HyjrxMKokrFmL8p1BsGAAuL67VRNUuDMmk/Qbozgm
         +OlO3vnxr2RateZBDKxBQ55obKWHzsSO42WMJ4eSUHsOgABgwliM1XfgQOtcUQho1N69
         xUzAyJQeiMZEjtgS5TfKj1LBgEPy5qfyJUMDHqvo25VniTdAgTRoKsNlG31KnFm0jSNN
         3TCGy+RhTD3Ci/AYBNsZ0Jthhh0RZ8vNxNF8TiM4Q9s9yc0O5oaHMFsn+IcofBdPEnCy
         ulrg==
X-Forwarded-Encrypted: i=1; AKwUvBxecbYUPbVFULkxvUPpQ4SEMVwVTOZd8kPyMsPMmuOo7CFqdfEtV5IOm9CsuGmeWw+XXKPSSF2tuTmHSxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFosByYMztgMdm1vTJOyCOonBRfyM1SQHOPezQOPiAv4QxIC5G
	B88OuPv9MLyD+IygBv/nl0c8SbpBE9G++/TPK9HtbacHGxKw3xHF9toOEEfy6Wc8+pQ=
X-Gm-Gg: AYBFou3BzwOtO1/cLiqJEN7QzdVoBK5DAH8H/lFtgnkwSVJuTtFmuk9ahXKknhsApnM
	k0IjIRUa9Nr9jHkJ1NZCZ+osr+DdfVTxvxF4cLLnVLmsaaRXVAvB1v8zMCYprQCz+8m6EnxexL2
	7L9CUEmCZhNgNyGAmcwUK27gShyIcgi7KTTha0E88mlQz7PtEBUgLWcdAwQj71O5EIKXgNpCveS
	Unov3B9FHX7FwElOq3i6VpMDbYvxuLx92bAc50cJVzzkXRfyQvVhcQOZfmeKrGG7DjJtilAZdId
	zsH16Z6G8fRcWnLYc+V/DPksdJ1Db3tNZyTNhLS2gb+log5xXkcclEJere7eDr6cBYZw3JHtAVX
	qQbaZWjRU0z9JfLAIPytXmZxQOs7QIxCfODvT40F/c1PuzBgZ13hBSF+VRfVo1kWw7mxFI3Nf56
	Ib79jEXDZYUkEnM0gSB42yabxFr9OZ3OeCCJEwmI4Z2qVqpC9SW5Gim9lmy9yutPnK22VTzBCBv
	twz3+XBzcoQyxk7jV0psu2BGKnEH70=
X-Received: by 2002:a17:902:d583:b0:2e8:3f72:4c2c with SMTP id d9443c01a7336-2e842f1519amr122389725ad.62.1791906828923;
        Tue, 13 Oct 2026 08:53:48 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b5fd2sm59793355ad.50.2026.10.13.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:53:47 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Justin Tee <justin.tee@broadcom.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	linux-nvme@lists.infradead.org
Cc: Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart2021@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH] nvmet-fc: bound the FCP command data length before allocating buffers
Date: Wed, 14 Oct 2026 00:53:07 +0900
Message-ID: <20261013155308.3188757-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013141904.GA14323@lst.de>
References: <20261013104038.3078601-1-yhlee@isslab.korea.ac.kr> <20261013141904.GA14323@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Agreed.  v2 adds a ->get_mdts callback that advertises the 16 MiB ceiling
so a compliant host keeps its transfers under it, and keeps the
allocation-time bound as enforcement for one that does not:
https://lore.kernel.org/linux-nvme/20261013153316.3178656-1-yhlee@isslab.korea.ac.kr/
