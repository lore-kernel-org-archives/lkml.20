Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1A737A4AB
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792212376; cv=none; b=NjHjFTx86s9AJ0eqOl4dyKgH0u+lRxR9UvUyauc9yfEI6Dt8c4fd9cWjhaUEJOMCKFsEqI03QYvlQvoe1f0SPQTBMKdvTt2OB1TRylexUcafevL4edSFKoo6NrBJg6KhlagYLb2LJxyTFeIzpKHwca3+59s7OacF0beEKShRy/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792212376; c=relaxed/simple;
	bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2p+OSFBLg6ceDdmSexznxaZRJHZluyiV80nPYtqbqlOpok+tK5j1CwF4WMPDxTvFyBot7zgHAZ6WASp/DwRLAD5X1LPvq70i1afk81TL2F9OqNFKDt37KnDKZOXBb6XETzxrlCriMiRj4OJ+KJiMb9qy+gmV3Oe02RRkpOAIOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1WL21RS; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1WL21RS"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so701632eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792212374; x=1792817174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
        b=e1WL21RS6tS0XoVDzuQ9B9SK8tzG62Ef7l4g3F3ts6Iw5QMJI7yYtq4ZMMwoCOzkLN
         HexIH1KdxO0uAMZglXBHATrb4jE0XpVtzi9/15220aS+zy1pAHxO/z4A5FY1qGBiuIGM
         1XjFf7OGqGN9OVzZm/lea1TrBh09Hh/GZyd7N5+JYpkL1fEFM9CMTnAp2bi0lye8lG7u
         SnsfFeWqy1XyVlWdTV/N6uE3z/YHTx2iyNZrw1ogHQtmnHk/phNF8SWigO2lZaQ8p2z5
         TkQoff7gBFQh7188IbSz62L0c9OyTpXQTW2GCY/QiLfvLftrLcSwRLAEsQlLvNMtPhu9
         qo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792212374; x=1792817174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=muCKNnWoqVy1ZH4pwYiVJW5Wll4x8vXLppsXL20sbj4=;
        b=O9+FxlNYrGiC1wZsaiQ+OW0X2RtZFSqvEl1om3GMhRqFPmpPC/sP2KabciKF+n4WvC
         /I1LpzCaBKNsq3GAjJFK9NVgUs16//XRjqzaAOByC6cGCLf4vmhKecqEcXwzGAjywPlU
         dChNbRGcGe77TwAcuPAMykX6q9e/0BhmEJojlgtkURAjmgLzCG3KqbmAT2H0jY5PWKzW
         hj15z/ao56QYoWln9wR9VcgrB2sGUnCLqTS74kC3bThzvKzAoT9+qFIGCmS+oyW1rIoa
         AQT5O0BWCxT4JMqhcYOtjq31oJuU1vgeSZh/tta5XyLZnij+Y0jc4nv6kmfIEYwJykv9
         ZnsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsgtIpK224PvWzNZI5Sycn7vwZnqD54PC5kw3E8eRHsnKwA+TZhnbbxxGSa0BcEW9h8qbarV3xoKo0Xi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhpC9hsiTOo0z3OHdjVRirINksUaENh65JCcx+cIHUqdePRmjW
	LABLiApfoDtW5CcmBp3R47Oqrg3fQlPobIeOouoyNX+YRJlv+nbz20rT
X-Gm-Gg: AYBFou2tHEjZcsorjzS2VYP7l1NNTtsDO3VS6z0r3Ap3MHQqvSAPS349WVAD45ncm5/
	hsVD//2M5EDYfi+3JY6U8+e/0VAASciNxnslGtU5C6/MjNRuAL/OFHxLl2SCJk15GVQrSDCSpLT
	an8ReIkw39xS45akVihRiCMxo7twTRDUR/ZqXu0zU/ninNLzH5dCcewC5pYHoMsTXOjxoGG1MRV
	iXFCJHZW6sIKIbs7u22STvjo7JGu58Co6JEudIaUg5FdwLXKvjuFZv3KB/69+3/RakO+/TM8den
	W10c5PJlQYLFauujUiEJWIBWA5V/cMXi2XV0+1Ofm9WCI1ZSSzJ0+erQopiPqN607MNxy9cbcfO
	oQOoSn0IU8t03n3yqthzSXqDRNhx+UcQkmYrgSlZYUkQc8IkqPC4aPvG9FCL9kZ9GngsmixaNR6
	+sdrJYyS+alt5ARK0V6l1TWUWIoR8Ra32fmsPZBemjqV7YB222mRUOcmSa+3VCSku0SMbJiuGqJ
	4DHwATK/b428ZBULNwK1KiKKh2xL/sHqGRwxMGhLrirYX5IXx4s
X-Received: by 2002:a05:693c:87ca:b0:35b:c1d2:eab9 with SMTP id 5a478bee46e88-361a2e3d3abmr2168722eec.39.1792212374109;
        Fri, 16 Oct 2026 21:46:14 -0700 (PDT)
Received: from samaritan.sole-larch.ts.net ([38.78.160.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm11170734eec.25.2026.10.16.21.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:46:13 -0700 (PDT)
From: iuseacosbtw@gmail.com
To: mohd.sohail.biz@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to true/false in rtw_mlme_ext.c
Date: Fri, 16 Oct 2026 21:45:49 -0700
Message-ID: <20261017044612.252074-1-iuseacosbtw@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
References: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging/rtl8723bs driver is being deprecated and removed, so patches
to it might no longer be accepted. This is according to Luka Gejak, the
maintainer of the rtl8723bs driver.

I found one of his messages here:
https://lore.kernel.org/linux-staging/5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev/
