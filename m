Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B012B94
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009852; cv=none; b=ixcB5hurwTn7K5rVvGvKlFdJH8tFPw9E0srxdG8EYKm1pF6pI97o0aThMW1S6KLHxQsJdn8e7og6V1d/fQcqWvTrh7AinUF0ggmGgqcnh///Dfx1cAY8JjKt9ogQ79GxWsCxY3W+nsgAkoRnSXhtRmey+S1i+T9IjNopEJZLKyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009852; c=relaxed/simple;
	bh=PfBGSGCbAABd/YEy9xw7R6Q+FzWP354c+IfDeJO7RrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UE1+PVwD6Lji71O2+mrvnnUCHJW9sMiIG/kJr9MriDD3aV80OE3CTC3FfHFUqux17GFs7//8syHyyCDl7OZ6hgSvQdBiI/v7Oh979ej99ewmsljY5VSv9eT2eVRD+eEPupMZ9ptZMygcURSbKzrzpIyTd7kkJXOQ7P21rDK5uUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=Wo8uuQSD; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="Wo8uuQSD"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53391022dc0so51465891cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792009849; x=1792614649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJ6C0cQbZi7DUkbDV+JTTS7gIU7UG7fhtx07+1Sej4c=;
        b=Wo8uuQSDT9UkIVXZvm0claCuQw/jn2PweLAbQ3ICbYk8FMg7FrUKWDNUmQldWSloWi
         2dhaB6YHPuE7BVMHg/VAiHoIymxU4jGKLkbigmX9AfCkbbS0L4LOXaIhygCxh1Iwe168
         gFljg9m+o90vFCtkXyguwpwxe7FL6MVbV5dID0Hwd2QMdmeHCgCH0SBgYNAXevOEwzNv
         mmvZIg/Bwga4ohk00tF0dNBdI0EWIFzkrcFeIcgwnHPdOVpNcvMxsTE455N59BbGsNDR
         7DIku87qJi3hDSQQRzv8jzzXW8I6lrKdM06A2bukM5nwH1XybMbSl4pl049I8LOOWZ1s
         SWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009849; x=1792614649;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJ6C0cQbZi7DUkbDV+JTTS7gIU7UG7fhtx07+1Sej4c=;
        b=0Fd4FB6XH22SXnaDFk7lTojMNgTA7fxPbonOvz9couMGm7YHddQXMpzibMYWU168p9
         YbGKBVAdGLpZSXdso5HbM0L/ljSjawgnWTCrrhM+Pun7Wv2dmwtmw++R6CvTTSOg6PUk
         QFfZ8co3g2T+4B8uZiZBI5wGHro2TmO2tjaIY+FcKJ7R7tm5kevbvsA2le9FrDsytRRz
         JcT5OZPp8AOeWn287D5if6mtyIC/1G7yVcMGLEn8BKeAJgB93fPglKXVVIYUluVa2ONm
         aP2M30sYrjqI0aQFG+pOWxOmyE7f5ZTpjeHX40xMvLQQlZKxOSqzE+ZzRpy4i1aUS1ag
         XuNA==
X-Forwarded-Encrypted: i=1; AKwUvBwIouxIix6MZk+XTB3V9HfJi2Ne/c6AwHIazCCxrUG655KiPcIC4t4s/3ak1LuuXf4RswPoNQ4UYByH7SU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvs84yqmy0z5E1sIhUbxoz3q4taVz0pKQbaAh7TYVLDHLn9Ck0
	oslLGmS4C0BiEiRukWCksI8GhufrtcVla62bPzEovINHYxq/mpL/+JjKiMie/Idzi4Q=
X-Gm-Gg: AYBFou0jd+2sv4SNPxyZ+k5jIKQuX5KR/bQmnxDeHW6Mf/hfBO9r93pfeRSfUbE7ftd
	MWysJF/aP5Hy3MvVvLiuusn6TUxHNAq9WKnUxDI4ycB6UzIkykaRUw2MUVxPn08qF/IhhFfKwzj
	+tbepy+rdK3Q2Bi+OoHOHnHMF11V6F+sCL5d8MuEgwPvdW523luc85DbmRGaWuR6JDMt4Euh5BC
	9e2JqDdcc/m0hfHt79MWypr6Omszw9Do3xu1uMgPCDUlrB7xJXx6YHa3dG/wYuk4gD0IK1k8z9m
	yR3fu+Bat/mmxwoXRZy+iGnhAoU7EudrP+Nu2IdjMUGtk3Q2lb91zY/qHrdiafhPfvkeaDitj7Q
	SfBkPyNenXEdMvAE082QxcMsmQYmovb7QUdPKxKGuHBt08NViqhovbmHhjvpq/C8mqQUybZ4/ZS
	xjDOvhB9TkA1g66eo0XVVdBO2uxeYhVpYtI1UZD8Te5vy+m7i5DEM3CIB6/iyTL8R0TXWk
X-Received: by 2002:ac8:610b:0:b0:535:1b18:20f with SMTP id d75a77b69052e-5359fb287e9mr250799621cf.29.1792009849141;
        Wed, 14 Oct 2026 13:30:49 -0700 (PDT)
Received: from localhost ([2603:7001:f100:5081:9526:3c0:45cc:5ac6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bce2c5sm61949726d6.36.2026.10.14.13.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:30:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:30:47 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm: memcontrol: remove page_memcg_check()
Message-ID: <20261014203047.GE371161@cmpxchg.org>
References: <20261014-memcg-unused-page-helpers-v1-0-240b37c53831@columbia.edu>
 <20261014-memcg-unused-page-helpers-v1-2-240b37c53831@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-memcg-unused-page-helpers-v1-2-240b37c53831@columbia.edu>

On Wed, Oct 14, 2026 at 01:08:21PM -0400, Tal Zussman wrote:
> The last caller was removed in commit 90f095b816e2 ("mm/page_owner: use
> memcg_data snapshot to avoid TOCTOU in print_page_owner_memcg()").
> Remove it.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
