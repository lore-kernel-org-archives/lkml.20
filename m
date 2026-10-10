Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE8331282F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791667609; cv=none; b=kCI+tbo6yi9e3bvODi9VSgkroIhIB22ikp9SV305vsqak+gcn/z2aGAqyIgZe85CyDJmdGvoKJStCQwZfWr6fbsGA22QZkSz3Jb3ebGQa2sekJX4cR70Vf7jeePMzfojyAmrf50cJKy2gt8TJEu0cglR/BA0ageCMCX4LnmZEyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791667609; c=relaxed/simple;
	bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJcfCkgzGrTxjSVMe75XQC0PsTRUWsnubZGRxagYX6xT2Wdq1WOx3dK3eXE85rgRIxDQNgK3oR/6Ghv9yyKezQIc9egt06ron0tRl3sAVi1D3M3Emxtui1JrOHM6K/8o07XwAbOxqj/UHG4bdbNv/RS220SLg00tS11vLpMRW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKd6N34h; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKd6N34h"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-487048857f6so753003f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791667606; x=1792272406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=;
        b=NKd6N34hHFAOrbH3dm4SWhB6z8OJXPy/g1M/Z89XhM3bOC8/ZOuEtndUV3C/Dy993I
         vdpQvjqcDOVrCRUfgn3cLExsVUxsx4hMgSqb6L8h6OFNgCTzs6KNE1V1dqzjCDswcAKZ
         cPECDyul13Dsq6SXtqcricppW0MKwNeC7dUjoLQ4AKBDcmFt3r29H0BPwFfhaCUnjNHu
         6RtovI6v9CAdgJMHZoKqdoxio+aO0dQ3nQHncuEq7nWWdeZCyEAfYUVSSlr/D1XpzfuU
         QE6ix9MDnM/qT3+SG8ZI4sHgKHKbgp1alSEtAfbCVtG5GPk86Wu5Gj6Rem0WgstxuyNu
         4CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791667606; x=1792272406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcanjXNG/y1dzMxOcr/CuT3nL3s1yXy3rxN4U86ET6o=;
        b=FU/0Cv8MCvp0jNqTuYaF99LmcbzSwZ3PIGOu27USfCLCpW/dp17t79jU28Wy/bMV1n
         VyCef39Rw9Z7jGDpUcYFg/fGSbffuziGUXpJR6isqJ5UgnFQog9NDM819/+MkpeHsYyV
         g6A70iiOcX2E9o+eT98DWyYpPLdgjeuIpOn+YeRVlfwdDr3v9sqsApbDQfmRv2RdLQel
         a+XjrzSIjsV9Q0pY2xIzrZQu+D6PPhqI8in2xx7bpEVQwrHH1GHaR83HixDEbIMR5xzm
         HbXIPmRAtFpq7YPUnFOU+UBp1LifLxbZq1bSdW+iE960C0WB4ywm8wrsI5x08DfoXjTI
         MC8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw4e4Nqt4WLikW5bWPrYhTlRjTE3xnbFJErA9Jwx/86FZzjvtNMgYrJBm0/4O44Aw3q/hzgyx7/fK//USg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKddIihNVMPuLWOg7ivCl0Y1F1Vsi1bMduXLkrlB2K4fi5NTbJ7
	RIedXkFER/ET+G81ruD6AnK7FBXL6Bvw6oeyFmfBmbvNIs3hyFhmBKYf
X-Gm-Gg: AYBFou2OVBzsWyy2++dL2CXjbMEoOKeV2fAONnWKG43s76PhKr+xbOyJbW0R8tfjY21
	omTpg47TkLfPyZDfK9izrBSDx4hgPddBOSbjlL54oKW4DmAWsJAfnjqvSBRpBC7ZuiU84wKEyJr
	cCBsrxxi62veVYiQ4HY7fKMqdm8vGC8qcPbD4q/xIdPE/iYeKKn4OFi8xJ7RVt8TUxp0qR0coIx
	36mCzFKZFIlH7NLk47GwUE5Lt+kH5onBt4q/4XSyIk4TzmAzCPItopEe/SRxAk7Sc3V+L2S4zmw
	kGd0tEgy1Enhopx5rnAL0E4kTqrBQ+K75qggN4ZCXa70/kfnn8ES+ENkFMELssfq5a0+zpx3BgM
	uAs37Bl+QERl4T2MqSuY3bVWJo6QVFhB8xzbgysLK+kRmKlmbvN0ZR2wLSFDJiPkxM+pGTbXMnD
	p+R8+qiu6M5N4SPioXtMwK+qWE6QqbmuokVqs0BUJbVVQegxGOzXigZVaI78WQPc38iHWtOFDg5
	UxfZr8qyK4k8tkLnPYlSuJjJ/3bhw556rRpJkfj04MDMWiDGJGjSH0jAYoRUBnCB/ia0Ue1xa5J
	DHtcKQ68ZZEaK/iDEHxnYFkLl6AI57kLrMnYrG3poBxqijhPL1pAPbq6lLMdTA==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr8056240f8f.3.1791667606295;
        Sat, 10 Oct 2026 14:26:46 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ade914sm9978673f8f.54.2026.10.10.14.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:26:45 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: stefandoesinger@gmail.com,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 05/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Date: Sat, 10 Oct 2026 22:26:39 +0100
Message-ID: <20261010212639.1662820-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
References: <R4jkIz-qRYm8QZxlEgQNPQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Stefan and Arnd,

Thank you both for the feedback and guidance.

I would be very glad to co-maintain the ZTE ZX platform together with Stefan, and I am happy to take responsibility for testing and maintaining the ZX279128S SoC and hardware support.

In v2, I will update MAINTAINERS to combine this into a single unified ARM/ZTE ZX SOC SUPPORT entry with both of us listed as maintainers, rather than creating a separate platform entry.

Stefan, take your time with the review. I look forward to your thoughts over the weekend.

Best regards,
Navid
