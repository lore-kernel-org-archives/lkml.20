Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85B1233134
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319241; cv=pass; b=RrOSjdx8vxEX3gqXd93JPBhmIFl8BesTIqf50rqNDpRFDotYnvlKBL95yLKLjmNZEEALPUoysxM+rUHyQIrzf1AtvOMRdqV74vQbxVGe2gxwkKX5zzO83scwQPiMmUqwaRiT8kvicppu3NsVfZac5GWTW+wj8Gqg0GkZaT2SOBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319241; c=relaxed/simple;
	bh=Uzv5ZOutoGMcYzpdmAuuzSMSJjkqPNjX/lcdxHqeAuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wm4XkSJWVIdYchUfCHb90f3IvO/kCvDs9NjG96uYJKvn9LyH11uxpFKB9hUfij+vGMgFROneJE2ln9keol6wtKpWIYCxBS+56iUb+dIMSyTsc93aPf3OJoVvLIPHXYDet0qA49j0FCtxIwPplnMFPXK3ncNVV7OlATSqp1ySpxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZ/ax8I8; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZ/ax8I8"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66f78cba2e1so632567d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788319239; cv=none;
        d=google.com; s=arc-20260327;
        b=Iy/5bdFSO5FoAbw0Qut9lgpRqaMHgWPa3JobNJskzpciSQ9MouM2irSoVpU9WYoLjM
         daaGbGwlbnC9SnBfsrLo9CHWlqM067ZCucX2q6X00KmI/DZZqsRHgZbglBAm7Hv7j9E1
         D93lIYTr+o2EC9DKq4n13SaMr63h75p7lknANtRqXoNrJojK7phdJuMBoiI9ryYKhGxp
         YMszczvEJskJCTPZTlSZ/Jpe9dUJhIALgUx4K0Ac0haLT0pHJmZIQZ3QtXoWbF0qrUcu
         0Z/95Ht7wbki/UaJ0NTlQFJVYlBqqF84VhZXrQ/TyuA/lz+hqwuFQOEwbDCNUtea0zgA
         4SuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uzv5ZOutoGMcYzpdmAuuzSMSJjkqPNjX/lcdxHqeAuk=;
        fh=NWl1HlzGRILP23evHks4Bvo06oOvzgX15R6lswlKmhw=;
        b=F3cnS89s1vsSIw/t9gWoDjwcE7hLjlLL1pv9GPw97VX53x5Vk18M2+A9uhEtyUU8qg
         rY+s8VjtVHONrGbbSQHhLRdbwm29uluaQiEuI4gNasaBuKzjFgw3Hbz/FOCLdTU+XF/J
         aB3+dUTcjaf5iZqT2vrdpI4DoQp6J5bD/Vx9k6AAe8VPMiXFTSFjB3fVJi8y9sEdCZMf
         v+Fk5Nf7Wqdx0/KZOikTk5N1PozG94oSrmwJ3eSncLUrCjgoplclvAreI8nWza8u6VkB
         sp649KgU9MiEVfhUDEm7d+fnLeZUOCB9/7ZQ4ao0sV7Gl7/T8i2YJohmEelE3ZFGgm4n
         FloA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788319239; x=1788924039; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uzv5ZOutoGMcYzpdmAuuzSMSJjkqPNjX/lcdxHqeAuk=;
        b=aZ/ax8I8HLoT006CgqfXSmECGNeWd9hpsDHefXPmNA9qhjwclmnmLJ+p1UUKuAQqMw
         BqbaEEYBiSK871JVp8hqtOZK/GhqONpzgnEH/uDQjlpnKtZroU8VM4anaGJhOInxaxUm
         dBwIr8mwROfyZviSIL4d0rZWVWUf4xDrKT2yftpz5mYs3hBxrfsewMN2v+RgTV8xPoBz
         sTkO/YnL1SKl7tPUOTvbwodjonvBaW81Rll8fePsnT5Wh8kX18KOXvVBOji1uUZYbKgZ
         HE4wBMCzEb1NoWCqgSROh+WLWJnLrbXPssszJhctMj/5eemNgtUUYMthbiBr5ka6o/nX
         hNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319239; x=1788924039;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uzv5ZOutoGMcYzpdmAuuzSMSJjkqPNjX/lcdxHqeAuk=;
        b=S/TN4weke6Gmq6AdbBWotuzsbh0DrWiDcE5MX2xDCVEwh1am2kospd0G7tTyyfAQfn
         ia389N56aKdnaTRaFntXB5VKpVrfnBmqCyoc0f4O13rrUD1QlbPcDdXAVj39uc4uz23H
         xzbqX7Ex/+9pr9N5D9m4TFmiXu4mW4rItt61kqxrwnC0qy5MZqVb/gU9RrUKxlf5ygg4
         iDOf4kN5KKVsumuxb8EbB05CN3iE+9zZOaOEN/Rem4V5Jg0xSbbCE+rokWnz2tw0Mw6L
         XasGaWflohp75slGa4Z/mHsmOV2cZETJGYlSG+sybEe5oQ2cB/mCL73XjmNrpoDtNq9N
         KPzw==
X-Forwarded-Encrypted: i=1; AKwUvBx6uMFJYWsuXIov3tM2RYma/50rVpDPnAeBfts2KvPmklKLzszlPZDhmMyH7RZeypAP/EcUrKnSuzQsl7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n2/iOkN5QmL6BeSyW9LJ4F7xQbXaHjgbFSEA6X4pNJ4rtLA1Mr
	/GdsCBuPo9UEHgAF52wDQqncm9fYYqgW74vfdwz3F/yef1lxJreVHC+d4qFBnZzkXR8rRz3fhEh
	TwZYhDPQkYeFPKTVdDK0Xd7rBRUZGg4M8b4iNhAcwKA==
X-Gm-Gg: AYBFou0Fu8Y5D6mAMEX8+GZEZpUG/k4auXKo8NqYJ5TM44RB37ZAWJXEWF1dycQ0grk
	Ct15g6CEUovRiot9XaavI4KxYY8SnIz99xupf1jnZcZ03DPFGx6MHqckAETYmeihjpRGSROe5DG
	7pMdzba1a9RPKalQJRq5+dT34Q/Zumxrc2aisqfI3xVgtROvYOraSU1W5OrNxMCDp0IooNUNU7E
	eVIE7jvJ60JHnRLlAetaE2TmQVEJIKGvdPHRn1hc7Q/dCidStbwt0ZjxcVzba5eKGfTW+4P86rI
	d0JaSKJNyoFr4J9gtYv9NbqCbXhK4IxHvmwYsT0FWmGRWUVm3uHiXAUCow==
X-Received: by 2002:a53:de12:0:b0:66d:151a:8390 with SMTP id
 956f58d0204a3-66f9ba447acmr526157d50.3.1788319238504; Tue, 01 Sep 2026
 20:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
In-Reply-To: <20260727-msm-next-quad-pipe-split-v21-1-965dfa5b669e@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 2 Sep 2026 11:20:27 +0800
X-Gm-Features: AcwNN1W4J5dkjR_DtUCGe6FED1QpsI5DSrYSJEiFhZPubNDnqUDs68CxVjgIcz0
Message-ID: <CABymUCPO4zDFniBNqicyq20m3NptU3AHB2it2fS8-7zvreZmug@mail.gmail.com>
Subject: Re: [PATCH v21] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
To: Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

Any comments on this patch?

Thanks!
Jun
