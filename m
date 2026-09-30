Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC3745041A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759020; cv=none; b=RHNZFBbMC+syivGu8yAZXjME7hXT+M/Q8zWjhL9a0pQ1rwTAx0EcOj4DU7N9ObSnMXBUyfMEeyNp6EhZlPoNnhIVT57b7fo33pDC2yUz3kePoOVg5VAwZto+46slQf4JggSrGI5NQbm1iLJqiyQdAeEcjIk4EJUBiLxexpn/iK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759020; c=relaxed/simple;
	bh=mV1nNnynm4md9lfuABy40w9KFyX35KTgSZO/0RIffFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8rLCecXn+F5xAWkuco//1bDWQH5aS/06y11skilyWsIkjDE6sVui3hwoxWh5FHh4CXW1uxG18gobMhU72PFLMFj6B6Dvyqb3+4QxMVEU2ZrP6AtRRuw/8MiwEf2wwPRPZlWf9FF14M9nPu9HTgS3wdv2fh9afsC1gNeCiuhufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vz2XJ4dz; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vz2XJ4dz"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so2411569a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759018; x=1791363818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQ3EyRImtKEZ5L5nNxlrjsnwSL+RNEJ4KU3mDLLBvow=;
        b=Vz2XJ4dzyClw7PNiAJjhoUFBe7g8X0Qyw0gU3rYjXp7LlG0CfOZyXiTVFkr2RPG8U/
         Fw5IM8JFbVWDzbt0W7FgH6TQrgwKQ5kjAeuAY+LQHvuKAh/gcwo7zwYj1JrrFilyLpuj
         Yxb4MXaLTxsSAx/AnfCS6EDcBi5G96lKWK5TtJMDChlqR3Gq/mcrB2MNxyluo1z2d58c
         gvDuCedUNCz6ZvFCS51bsicMpq2cekUSkpZLS6z7ZD9ARDiXovFJd0xdvhpAUKPUuOZ/
         JZC4ZT//2rOrC1KH5/JvO9jGd6NJEg13S/tqRmZHC9mJVZdmz8jHykqYQ8DsmoihYGe/
         7w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759018; x=1791363818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ3EyRImtKEZ5L5nNxlrjsnwSL+RNEJ4KU3mDLLBvow=;
        b=paoB7FYHBw1iZbv8VdfQgfPpqIVYpzJJGPWgE+4TC4/prA1TgLtWm5mTiEZSoUkr7K
         jzrBsnOh8nO9GqN3ahz5p8YVwNbnTmo/jucdwVwv4ZLcfgX8a6WiZB2D+RgKCLbAseDH
         Z9UVPJ5Cq0c4QMM13nLMi9qguyIWUSbMS/l3mTnA3iz2RS+XBDc6vnpb02mcS0vCR92i
         ZKMd1j1bsaPKHtrFG6u16PxoI75gb6pxNrUGesMQ/5T10uaemvfQkwCnzilaw0yXotFY
         8ilYTSlnAoSZe51cxI4r3ulUoAYMTfS0KHn1E9OG64vbgEul6I8R4szGSGUFRT6pbRaM
         uyvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaDPnJVTQEAjVwiFlX06s+aFaOiYCgtbwfiFJdfgjes67sQKeNLi2PMt0WmzMJdFz5eqSmc6scr+O1/oA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNBlq1FGQMrvXSWD2tBMg/lpXWaBE2oizwE55jkudxQXJtRbq8
	Zp9npK+aU/7ttNCCAfaENl34nSuIzr6FXD/m5qcbxyIo4uugd998tl0F
X-Gm-Gg: AYBFou17SL7S+1NScpBO8VvSul2WJ6paYD13JQOjHEY17yom3S0BeKLp4at7X8wWRy6
	wzLaOgbriEQxSZMt0VrUYz8Xb3XYbk/DfLnTcBL37QBWwcGlBdSDoUSfS4JsUaBnhjAEO46yxU6
	tNBfa5yLVWrRmJvRShqWmnEgH/RBwJyiRYHbMdE8VJd4RlhKPFt+YRCOQm331HZvAbPx73B3xlj
	MsJZQ8K8HJczBpau6RiN07MMJQpf6etN1lQ8lnxXzk9h/oSwL6mwx7k5Cw3PT0+4Ulukhc7vics
	kyB9ooJqq5P0jJ2SrPm102zTvBtbWZTlWzjm2LZXnVLbFoQqJVAeTxCxo3ekV1c7b98GblgkmoR
	3TSPfu4cgfG0n4BPITCxPnWGOdDBV9NkOo5gtpd0DtxIRMrfXDpcZVhv0yKNf87SpHRIfCnw4/3
	6TrYWjlBllzAZL8xcYsCvbTbwizkYzCSj9yX3n7C8GVHHJqj2N61E8QuqZoGyC
X-Received: by 2002:a17:90b:2791:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3a4d0f022a1mr654285a91.5.1790759018103;
        Wed, 30 Sep 2026 02:03:38 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cac328c6sm2555182a91.12.2026.09.30.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:03:37 -0700 (PDT)
Date: Wed, 30 Sep 2026 18:03:33 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>,
	Baolin Liu <liubaolin12138@163.com>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] ntfs: fix the $MFT bootstrap hang and reads of
 unmapped runlist ranges
Message-ID: <arzQZXZamgPEBhX6@hyunchul-PC02>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>


The whole series looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

-- 
Thanks,
Hyunchul
