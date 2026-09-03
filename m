Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B79367B95
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421774; cv=pass; b=oGqvTsw+f4s02ZNyE7hf9Fwz1MUZvQlMNIpiog/EyqK130lyFMM5kuWsVzekA1atLTuKtJersSblYcKGEv+vasqbTFZAriu298R34MYooPRu03SkOdjlssDaNk7K3vgbX/xvEjnb3QjhtP5smC0Fq4nR1v68bJk/MtGfwrUS8es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421774; c=relaxed/simple;
	bh=Z+NPJm3/F4Yvk7odWAe7EADRWFhaUf6x0bt93hbRKNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjplMrRU8uNHRWm8QLCDWnGdF1KMAOESarHeD/aADIRaaqU6lOQaCG5oCzhUG0bWEh39UUXIR6aJSEoyoIzSReukKmhu0fdGyyIowUzNS+Yp87t/YsJbvZXPbWp+yGjRzOsrEst7ZNNuhDxKmFaY8JFKr5DEe/uWyNdqMth45so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLrjBUj4; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLrjBUj4"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84eb992a881so1816619b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788421772; cv=none;
        d=google.com; s=arc-20260327;
        b=IJoUyrSuM+baPqed4//BtDnkqqbel/9k67bjFqEFtUB5AQwz/c/M49sxulVSnbqs4p
         S/J+TpG1uqfhzp8oXYbMqLBqTfMp341pdYHqDRlrQ7t8s0jGKiVJBpauYROY0NOaFI0T
         3m2iimvFKc7+/nFGBXMZnNcGcYeKI8OJend6noCl8g6k7mzqyT+jBPxuPI8D07vMUcu/
         vBgLA6sXsSwDynwhZxCX7TXWPWdeLmd+1TbFA1jUC1+km9VOdy+GUVOyla9pxlXAI1FR
         /nkNbJz/oa7n/BOllMCItzK91Aagc59jVsLNDiu85zcAPP/9lOD3qawSGy4+Cafinrh+
         wjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z+NPJm3/F4Yvk7odWAe7EADRWFhaUf6x0bt93hbRKNQ=;
        fh=tYmFs1AsRCxJivSaKrC+KpoM3DmUzdMHv2AeKZQU/Oc=;
        b=rt2xSZeK+WGtrMspYoyoz4VBNwFAQ7W2/pwTwu5eMU8uF2TPp+rjwuBBLvRjVJVuVA
         9lrESY1jPi3jlWf6uXo6ISU2UTetRUkY/+Zaq+2jQ8+//ysjdWaAEai8dzsn1GaGyXeX
         4VxKgLlgd1rGAtVvuzbtPSJRo+/35i5QnpzEqzSfl/RCxIdSk92hv/4bKp9+XjnZXQT9
         d3cgUjt2jRC002qU0e7+ctdvuiW6T/xGUErTKyymXBykTZ6J+A5N01+iO8S8F9wge5IR
         L0T1xVKwjJ0fySPr9z0P4dilGjnv25fg3OawgvdMuC2a5qSiEqPULbdvcDO+fpI0nGiN
         x+Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788421772; x=1789026572; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+NPJm3/F4Yvk7odWAe7EADRWFhaUf6x0bt93hbRKNQ=;
        b=FLrjBUj4c/dL1+avmON+q0nyINgTtYNP6HMARJCLDSdL9zv5Wx/Ni/nuFhhJ+cBEPQ
         BnuOELgZ4kNr1aiS8OtUymz0TOxB0A0KGEyz8CGpWfwGDzS0SpgBozO2u2kiGWpzV+K7
         T+hm8HiuAtgjPiLubCsJXt5+7x3x/hXwHgmXA34FW8DYgjJ6nopHybCi/mMc2neqGTiP
         cVtStYAdEw0/z4J+/bh2OGYRtUaq9GdOnIhjOIwNJTVNIarx0dFFyK3XgR1JeVormP2J
         BzVjIl+uMnBeUKckbH7kdnlHvK3tS4/H9L0CaRgVWl7dIZroHbJ6zc2/z56Ow2CunC30
         eElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421772; x=1789026572;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z+NPJm3/F4Yvk7odWAe7EADRWFhaUf6x0bt93hbRKNQ=;
        b=Qcsu3A6Iu4rfmuO43ta0sXWNauNUVD6Fz+6vQ9cb0gcl/fAAg8VhQbFoectMfxPKAk
         MRcOIAbb4Nthi9QUC7FFU6uJM+ftmoa3uUXEorEzJfV3IauoppEcYX5nedTeSaoclG8j
         2SwEjHrYiMlSHJ5o9mTPIqq/Nr32sBkN6AQaOylDfG0TomrPOOH76VTVo6k3cKofbnbp
         rJ0HO+nt5VAEGs2+umwEzKGLdRGoGMHBxIccddqmk/JisdRmulPUTMwmh5aEYA9pkUq/
         MYlY4dDKRrl+Fb+JJhsqDzr0LIURLk6VvIdMbdbwft/XEUmHrc5PKm9D7ijlaaLmeZic
         jT3A==
X-Forwarded-Encrypted: i=1; AKwUvBxzzNerIYmBfIvGm9DodW8CRVQs4+c1/czgATZxyidyoiP4ATE4ijkxI7ea2macgVOcEXuVmygfwqi2FYA=@vger.kernel.org
X-Gm-Message-State: AFuF++lgulVAbr3Hx7n+cCQIKmaPIOE6OcM7Lh2apefehS8rdhVbkl8n
	v8zr8pUehbVihlnzsb9VsVlpSyPdwwiYi14wc7iPBk6AA6JHjufWMDQ6FYD66BHW/Cwtn8vnI20
	XNeBeZM2WfMbyDQxiF7v4b9s+hPPulms=
X-Gm-Gg: AYBFou3EKyQGZDGNxkKNEWDU62RbovLK66jk6Rz3sgBdARMZ9uWQDaDCBmoyuv9mWBk
	okw8ywMGNjThkj6ViUX/+hkx/+iWloJSy3WukxwO3HZ/WMhHTenQQpFr0VhTeNVH2kGXSQ5SvSQ
	83EfCo4MUNjpuXIOMGYlJsuWoRoKvw3ieNP41Qyv6DRFB6qhOWPKl4x1/ylRmcEli18PoD0d0jx
	cX6FvqXyNTY3fX+CdObQMhuH1E+eeOKs97Lv5omjuRJjPdTZEaxaLcfB6XO1/FkEIwpeu0r9cWb
	8dX0kJJWEW3TGNm53U+Ks3o0P+jWV686j1UfFjfibOdKW+ZA+x+xZJHPUA==
X-Received: by 2002:a05:6a00:4397:b0:857:7317:cff8 with SMTP id
 d2e1a72fcca58-85ed4b21177mr15299064b3a.25.1788421772181; Thu, 03 Sep 2026
 00:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072419.1485256-1-yi1.lai@intel.com>
In-Reply-To: <20260903072419.1485256-1-yi1.lai@intel.com>
From: Yee Li <seven.yi.lee@gmail.com>
Date: Thu, 3 Sep 2026 15:48:55 +0800
X-Gm-Features: AcwNN1X-vSoSXYVOWj3GC5Kk__19V18MGkeSjvgHea1GqX_QFYbmP-LQSIwPwb0
Message-ID: <CALX8JfQ6dT2gV2xbSf+_9j=P2i+0K5pXVQ2YdCs+zoxp_QaC=A@mail.gmail.com>
Subject: Re: [PATCH] iommufd/selftest: Fix wrong return value in iommufd_test_dmabuf_get()
To: Yi Lai <yi1.lai@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, joro@8bytes.org, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Please refer,
https://lore.kernel.org/linux-iommu/20260902085414.549830-1-qinyuntan@linux.alibaba.com/
