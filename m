Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655C73C10AB
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458338; cv=none; b=Wwzgb8pnBBCUp26dKAemKI+CRrt/L1Ujh7m2AoIykmN17lxPPkv16QUmlbql/3bJLlXEixZ+apQrtZPAoQOoMsXCfM9sNZMV7CgKi1nQ93Ri7ma5bJSfkG3K5IV3eEN9M1HsaMJZqxRr9GX/min1zElmACpqtzqSPiWv/tg8L4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458338; c=relaxed/simple;
	bh=EExW1k94qxqJzDLBNcXAe1CRJKzbkc8M/lq4PoGuabA=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References; b=CI64FPDVWVeKhn80C12vFiaPj5v5fUm6eHlA+Q052RnyjSahv3/KBj0+3ERgHdH2tr0HxS4Z2ChpnvW25xaWWqwEM4AgNqpPNPRueEeDXhax71IRNEMVUZJuUf4tE5GgZOZyE6BEa5sjLCUGY9GnyHGO20mImy95vCuEJEGcZdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH1GPtz6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH1GPtz6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2db18e5cb56so24309085ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791458337; x=1792063137; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EExW1k94qxqJzDLBNcXAe1CRJKzbkc8M/lq4PoGuabA=;
        b=GH1GPtz6Cy3YRBbU/PvREeBQXKlOijchz1AA7q4CIFlO0ShwXCYcX8NKTT0Y6DWeo8
         nDW5OXSxEeOS1QvHD8PtBdYcv1Qo/Zgy/ZZSVnuItRxFKjbOvpBpqd1XQoTeerSglRZV
         swaa+2DDJhNq1d49Kx6uDWiw9Xmtm60aBayPIKLmzLIv0fEBtBOl6MPdAlbVR06iSvl4
         4zr+UsueseiJ3u4eQU+JQf5XHRsLJPNH4hs1/hp3bs4QHtGffRXpC9mRgCTf/HQLUGDQ
         mbFEv0lgsWTyllcUhP+MLmY/Q4xn2O6WXmWVbZvbi9p7MWmxmbmXKJcRHAI5T8xaE/tC
         XdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458337; x=1792063137;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EExW1k94qxqJzDLBNcXAe1CRJKzbkc8M/lq4PoGuabA=;
        b=AKs9X2iZJxN//X9Kod7wkQMsnf99MkR+jS+pAYAha5jQv9LKaJkifCwh8jy98Fyihg
         TwNMfEhhxTYzx0tLcEL/vjw2EouJx+9Kjq6V+kvnKF8/bhe8CB7CpXW7cVQWk5SQJ5/H
         4dkDNZDg3AbP2/8ehjOqMMqfRvI/QJXxbePKOPpMeuJipwieOxzGkU12WFWeXsHPuRJE
         /9VkKq0Dr5lbD9uLcC2X21H5u7RuQ6Vl4IiOfmyIBNJ4jLKFYj4HiG9i0IpE3ue2Unwb
         KKF7RKf8rUQimd0ZxIwyA1q9toS3B5plTDDjVhMkiYPLh8Vv1GbJix4fHd6xqEbZv+X6
         DHhg==
X-Forwarded-Encrypted: i=1; AKwUvBzEcmrphRo1lryRyrJ5s/Qbcpu09CgVWveLzirtdkjm7/Yb7ikItTZ/SLJ+S1LuEMkblxk7Q6tjz//dYYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiAY5MS3dFJ+kl9XBXAOqQDvd0ogZQ34RIOQOi8u0iJHeNpExj
	sZLkSeKkE+6hadrvJHSswBF27hT8PeKQjJCT3E3T8QiJL1BIOmwtu+qz
X-Gm-Gg: AYBFou2Bxk1BGiful6vRlfWO/NNf7+AMASq+qaliLfRXm0AB0EI3/kkcy9UqWGtzkQy
	aUOvpwfCoGku3WXQz2777p/RzWywtS1zxgl6fbPOr9HlvY5j8VHQDRwsoWo6GQBHGBssE0fXB9o
	XJ4/twhk+lvmpqnp240G35CSajeOogh01+rQ4VGzaxjfDXRIFjc2ibmHZ4Men7Nwkve0SyFHSU4
	UglZXeZqN7FWXmM4ck/9vLDV6lN77vKQMUcM3uBNo1o237dqshZFA8cmtqNf0K1GN3XZK9cjUUT
	OqKuDvnfcQWjQU418QvDjVqlK3CjuQgF8KAzuzi2xTTD3F7VZ1b3AFTT9xaF8FHp5MTzZoRX9cs
	xFhiTEY8dvmPQE+R2gjHCVjTFK12/TJvnpLk2frlbVWrWEkbhoIkBhsD+zaBnZ8FcBo+MRHkFm6
	N7vEzP8/u0A3kdAmgfBTXrHi1HoJRjnXss1JCuSZPfYAku9Rxj+t8y10rhLYiCYBUMIyI2qw==
X-Received: by 2002:a17:903:2cd:b0:2e5:cf8c:633d with SMTP id d9443c01a7336-2e6004e72dfmr41869325ad.34.1791458336730;
        Thu, 08 Oct 2026 04:18:56 -0700 (PDT)
Received: from [127.0.0.1] ([58.186.69.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482d316sm22914955ad.49.2026.10.08.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:18:55 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Bui Viet Dung <dungvn2345@gmail.com>
To: Florian Westphal <fw@strlen.de>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Phil Sutter <phil@nwl.cc>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] netfilter: nft_set_pipapo: skip transaction elements during GC
Date: Thu, 08 Oct 2026 18:18:51 +0700
Message-ID: <179145833177.61895.7787702708373982202@gmail.com>
In-Reply-To: <20261007182057.332512-1-dungvn2345@gmail.com>
References: <20261007182057.332512-1-dungvn2345@gmail.com>

Hi Pablo, Florian,

Thanks for the clarification and review.

Indeed, unlike nft_set_rbtree where interval end elements do not have a timeout
extension, pipapo elements track their own timeouts individually. A newly inserted
element cannot be expired during the commit window under valid timeouts.

Please disregard this patch. Apologies for the noise.

Thanks,
Bui Viet Dung
