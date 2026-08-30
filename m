Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2797B243964
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788073408; cv=none; b=CcyD9557rGhyq6J8phm3a3nCzgCS1ti38oBBbW65KtSOm0p4xQlc/jSStFE4y63ghJhJWOsV9dGCrfCUj6rumwT01ho21+6rP+YanAoxcOxaobcWs02EmrfHUlZ2ASiJcSCNCiR01dUOAWa46TQrPL38+UCHjtB5fqF5/IOu7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788073408; c=relaxed/simple;
	bh=jT2rrXLHMnHsZ11anjGvX6a28pL9SpHa48zbteBY+kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOi/pbiuKAbuZ0ka5gL/qIneLcU/S1rNYrjVfshYqL6LbkT/cDyvmh/wCGn2lF/CY43JecJJ/wacsjulMlO2qHojDvnJeOhoAK9upplM3YiLooqFMBe85dzaEm2ijmRwrAJFQjthegvq4W35brnUPxdpCWU43Kua00Pj4Lzs4SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noX8OByD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noX8OByD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-396750cfee6so1860603a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788073406; x=1788678206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jT2rrXLHMnHsZ11anjGvX6a28pL9SpHa48zbteBY+kg=;
        b=noX8OByDTRa/plXQvOWQJfUnDX91Efy7Q2WgNw00d6F3M2IDb06LSoSvslTSmfzm6I
         z/fzjyq4DbOs5af0eGLIh87F1QOpdlJRG4xpZsCejiVoWbLuZbNWr2gZAsveRf5AKDdF
         a/p9qoOvFh+ESmBY5gy6nFEPf/FE/enjnnWEnks4qzUvccbRlgQhnSdIk4CAYE9V7bnR
         BJ4DmJ6h2L0vLs0A2V6esO1bQQ9mWFBfAzrOcjBqrI79AJGmjEoJ9B5P3yE8rp4lTgqx
         kWhvlu68EQVVnkapaHGJIVdQ+hLeA0W1qs5IxFj+NbON5xHoJXFukZQairI+16d3QN4h
         xpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788073406; x=1788678206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jT2rrXLHMnHsZ11anjGvX6a28pL9SpHa48zbteBY+kg=;
        b=XTGz47Ti/n5S1W78+vvSizt5u6QF0hqDleHGkUhcmHbhHFB5VNk0oQaL1BPNPiJ55Y
         XyRfWRVWGj0jG+lmy/yRX821RJkzbpbYEA4+JmI7jgPH3hOBiTEgaN4Il8AOer51A23M
         9SGVH/BXLvBOpXHAjvO2f+MbIZTt02qqR0TvpFA4qXzw4CfmG4tgCVbL33IHhqGhKEZI
         WAiSDRKKlSJ0Csmsft8gJoy23VePuTJOYVb9wkDe1RlQ3HQYC5sldbAD8hJKNMSUDAUP
         X3dm88s3c1fIsyP2RO/yTk4rQ1oNc3aC8yrZmkon1cWNAKn8SUqP07zWiojPrn+hV3rB
         jo/A==
X-Forwarded-Encrypted: i=1; AKwUvBwwmcdU7AirQqn7mJ+7kPBjP8WGJ1zaIehuIIfAG2yF1oFZupRrfJKYgSVAe97UdQTsU8VE8yvAtFJftGI=@vger.kernel.org
X-Gm-Message-State: AFuF++lbvORDVgF427Iy36yQH6aOZ6TeOd64XpDjmjUYDrBMGdkmiiS4
	JjVnXjwkmkHlgjtOmF+Xe6/qX7PgsX+AAkMk33ZzEYuSojro+J8a9UT2
X-Gm-Gg: AYBFou2d/QpijWeEfxc8ox8QeePeJd913C3c6Zql9ACsWz4qVVvM9ASWGJqmrFTWDSS
	Xy4o7lj6q+3Mpd/Y75O1WfXjqoxMERu6LrG+NjPALs7HS1IBEnvZ1c4DI5ZqjMIYdSrh/IYqdRc
	rtXFXA4twuyZO3m49q69sN0AavIs1tSWXzEtkvW/JFa1o4l3BbkIM8juYw63ix1knMHC0rn/Okz
	SvGBEjBIfcJGnebQXih/0moBg79ndpiY3I7dRPQ212uP+9DBUsM5CKxaKP2eQjfY1zhS0HUtJre
	nrxryxfCIPNWCRJCdbZHp6rM+WMLIYi8PcJPF8Rnt/LKwtvbQ04UhBfMU3xCVn/J6oMI8h3yV6B
	fgWtIy2UW/MHi71/D96TjWUV6iXlfiwn87VCQXdEJMCBQZW5PCzHivtTYb27wYMolF0b4F5SkIo
	8YyWx5aH2UthWF96edFD1FTtDyEOzJ3ZAdRB3/3q8Ldm6gXt4djjPwAbKk0rkwioxaw3iRrDU9q
	dWiG0EIiUykNHj3KzFL3MUIyZoV
X-Received: by 2002:a17:90b:4a52:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-396d0eda189mr27367690a91.10.1788073406451;
        Sun, 30 Aug 2026 00:03:26 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a14d3e83sm7469034a91.10.2026.08.30.00.03.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 00:03:26 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [PATCH v2 3/7] mm/mglru: enhance cold/hot inversion handling in inc_min_seq()
Date: Sun, 30 Aug 2026 15:02:49 +0800
Message-ID: <20260830070305.77990-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827234704.63163-4-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-4-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Otherwise, promoted folios could end up behind folios that were never
> promoted, effectively inverting their hot/cold ordering.

This makes sense to me.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
