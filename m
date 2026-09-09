Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F25238A733
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936659; cv=none; b=A6TkWXMgqEkEg2zlvmv5PaX7USfU52bGLD06wrLICebIA5eeNgEvEkESgEkQIkOyX6kjNzzZI5qSqVZIpEVYF+RoVlq8Y8Lg8EsG6k/kBYxTwAgA1WjKApx4S1bTJXV2aAOOvtzTYID+8M0TBnk9Ob67boQwbj0L3JmvXpsXg3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936659; c=relaxed/simple;
	bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdsiKnrXEX2u2QWsOTdNs2RE4QHzfGhMk0qN6+2QB+2Z50cDI1RGSfcsT5RQzaTpjOvjSFtUqlawJtV0CSIXnvAvSwuHwwhM55kT2de2xhcdODUwDUBImUEfYikF6NoDwT/BM+Hp3bTD/Nknb7CMxwZw1hckSHP/28jiUeYq1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhG8vY9d; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhG8vY9d"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49557167508so64397385e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936654; x=1789541454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
        b=DhG8vY9d+eTinmFNQm775o8Q7jFYyvD1+u3MTW/5lSvEBux2eigyr1PhU5mahAEzcP
         dM/Nt2OYBu262Q5l5hHK86R8Bez+xHclP6auZyDq+STfLywu1/OK0TseoQL1ElVYfvtK
         lSHQbb2s9eCEc/lxd6nzx+mWaQjtyayA3DDq7M80BCSvcebflez85PaMXHgMl9DyOsPg
         ZGv1qBv52krNvgf3OtBtjcn4t9ebevLKaQmNEHoo/hRvmET+0Q5seEqqd9MTev5qjDXv
         BWAorjpAKi5RUnst19QEjks8lkl6QpIHUkDxsN55Rg/dnmq+QP+eUVjf+p7WIYbEMxVk
         8abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936654; x=1789541454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLDEXefuJ6ysr65joIrk+CDBT5nG781r89dk8ZxIZWg=;
        b=aa3b+0ml+MZMXzjmcsj+FUb5//r/BQ7r5MaK/KNK8m/hIEmCN1qxWQf28d5YVz6OIJ
         ADuyU46wTMSbXUkhZ0GvGrNWpkcIR8urUdcYSXb2J/KQrFKLXstR1L31NZI5AB1qEohd
         lyAD6Ntuz7CYPSSVP8CK181mJGtcVBAAOTGnCA2O0pvwG9gma/wBnqrUDDAbI5jOH8CK
         e1gzyyd2o6K37DrfjE/nrYMh4egkdXhylZ09+knhd4qtmt2l1jAzInSBK51g0xfuXKNd
         EYkM3Vw/w74wTr/5wDaS+wsIwZsICKBoB8tX6MraPQF7Azv2qi22B4F3bYkcGt2W3sG/
         Ll1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjExtVe3z3beCpOm0UEzKmNe17MiH/h19hIQTGorJwQXWCgIyzVN7qTZBwSvK9v+q/jmHYdgb8QOhVxvk=@vger.kernel.org
X-Gm-Message-State: AFuF++ljhLOnvagiB2nTUrG4jxquIFPRw0feVs4JSxU1SngximhJcr5S
	HBnqaiGyGuWqYA+dj4trmSp8oo65iDlG42X9gWznux9hTM80AOe7lQQ=
X-Gm-Gg: AYBFou3bg89Lot5oXdlRcYxREz5n1IHkdIDfVT0ohk8QbGtYBzb3zLufb0CGGVRVkj2
	lut/tMaWAjgU5dPM6IFF8Fp0Haty87vnrm1k885LvCjTSOxz5NCWJZj9SLzB30nkLeALYaFmJ9U
	uMv8HYmJVkqui8n0ifty7EPVgF8/VMJ5MYWyzEJNGf4KTEHBsvDIhiLdnrultfvzYtpAny4MIGH
	CBaJIhbfQGtWYzF6QK/MziKXpIQ4Ew86/Qn/kQWTlYt6yfp+nHpe8YDtkD9SLDvE+TpE8RBxjhT
	mYQ1SkHNP4Ug2qsjfd7eDYt2iSJuND1CEQcFHTX2zyJiVvRNSXQAenJGMDo9GMigT3q7lhzevsL
	r3fZp/LZWBM6eOQ+TSDCMOvhL0iZ8FHlBJKgStPL1RhExa6KViEv3vYchshZCKFBsFuPoK4pcx8
	OQS7u6TOxt8x9lsVlgJIhykzlwtg5D3mUunmHu/dcEBS0SPre/JbHV/zGNqRkaFk5sUbWb6Yr0g
	ZyqF6AGOoufPzL3Itox94zklvrRy4CiPQ1NeOJqrYOBuVEk6aiadYzg7Ws=
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr219717855e9.1.1788936653490;
        Tue, 08 Sep 2026 23:50:53 -0700 (PDT)
Received: from latitude7275 (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm443215855e9.12.2026.09.08.23.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:50:52 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thierry Chatard <tchatard@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Wed,  9 Sep 2026 08:51:04 +0200
Message-ID: <20260909065104.15817-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqDkwTkAsvs8Escx@ashevche-desk.local>
References: <20260831160754.9857-2-tchatard@gmail.com> <20260908161629.335223-1-dmanresa@gmail.com> <aqDkwTkAsvs8Escx@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026, Andy Shevchenko wrote:
> Do not fold, just add into the series this one as patch 2, for example.

Fine by me. Thierry, please carry it as patch 2 of v11 with Hans'
Reviewed-by; no need to change anything else.

Thanks Hans and Andy for the quick review.

D.
