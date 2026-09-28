Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A42536B920
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618542; cv=none; b=KT/vDsvcC9iTLuOGHWexLm/VHTMcdC8/x9NvnuGEPCydeaHvBB1rwh/iF6hapWi8BhPMv1kKk3SPdgP+jHTSvGwN9zPnU45lonGl/9IMSHZDJSYMvxWCMa/McEfg7vN9TSGPUexGbCXsGnruCINeucLVo9X8I/OfunTtIzeXjXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618542; c=relaxed/simple;
	bh=KZQA10YBDq1AylwXHXUOFyKjs1PPXoqJzVaib0gTfd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H07gBQYxhNfm8ndP1J7wD4NAwVGWWNZfcbV3n1ZajpT6O7mfoTZflNBHedaQf+sljv0UGvSltcXUF6OMGKMepWskhZoJYks6lZ7shlL1KuLOKKsZJoCkQYNxGoZBFym+bK1b/bJT+g3emlaWJa5sprVbBu5Xd+9GfZuCb6qPrgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDf1yXCU; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDf1yXCU"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so47623277b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618540; x=1791223340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZQA10YBDq1AylwXHXUOFyKjs1PPXoqJzVaib0gTfd0=;
        b=BDf1yXCU/sxH6HRS/FLfjGwWB6YAcICtMpov/2QewguXMK6GGd8o++p2zrJZ1ZiquA
         LiqW2Gs6fgv8j47No8Lp04Xrrmy/bhZJskltmREudKNabO1u7fa/+HSBiE7zksyK8rNa
         ie/TXxQiP57GYrwzcl6YEwn+hdeM3SwO7OkmPKddgaNbVVk9EFOlV+jbjvoqIO9c+7T6
         IL9FR8mkLTb7iXDQxTUIViv0W9BgZde5pn3n7yeiu3qgUom19fpIKzk8ax1+edcbC02u
         0XP0W9+5pd/bpwten93iSTw0tPMMd4ST6hN3+AngOirgrUajf74fGK85RTc3H1kD1t1s
         56BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618540; x=1791223340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZQA10YBDq1AylwXHXUOFyKjs1PPXoqJzVaib0gTfd0=;
        b=t3izRc7MX9NMsz1gVFcEHKC1CLhUlJ8fT/2OIIAP9UJthfdLJyqyy09NRRninDkL9E
         x27vo/m4L4+2cE53QsGiORr7Yyt3jTgL4BfS/xi1rFjAkbktl9hIE0Wb5M05GgstJIIN
         G0VOyZ8JHDAtEiu5qMa5zARraRt+neZAewTh0ws5ryv/mvtgjF1mIJn+5sTcYPUJ1d6a
         o43aC7G47p5fvAv+zuSEzNYJZ1K4yPHgcHggg1sXSAThW7qhy3b7nxNDLpVRDf7qv5Pt
         K9fAds6Z2yxEGwg8vjteZLHE8YAKdKYMeEdD+uRkGpwD78qA8Acn0gqo8uePV70adI7D
         BHww==
X-Forwarded-Encrypted: i=1; AKwUvBwU0zxkJC6+Sp3gX5XXyEe2cfJU7rh7friPe1qYTUFY2fvoS6npf3K0NHCr48/olCyqCI+1CPw9BKSMdlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHxARGShiI3imNv9JbaY1AsbrL5Ukkd3kCnpqAhVrsXHaVlxkb
	OZ8pTOzLf3dq4Tg7Cr5C7bpwCgNo/3znz0M7MZYW5pZsjzsSXPZpVZO+
X-Gm-Gg: AYBFou0HUnKkjHB1FAtsVou9g/+R1pa9LwLymDNMaff/7ljKEJDw+GNWuj3Zu30Sy8V
	F31kxVzWPK4RDCKPPwoS2c9aHuS+ryw8RI7fpXDfwKJjc4bqdUy+z7zeZbBCEvr+zSsiK0JcjaP
	aNHXJrykDJcpVPeqwgbHQdF3FXQlsMziTGQfe4KG9Bi/UFq9wTBXelohJRnTO6v83l2Fk7Jank1
	zXILKUCfgnKRaT1IrqO5sbRoxvoScOctdP4GPAmiohhZ6O0Hp4f4s3vHqgsisqiq4MTACpq9ARX
	Z1PTCN0Bh0wA6mPxG+vZuv26dtt8IC6/VgVGwogsy40qIFxXNMe4kDbVe99GfeFcNsGOHAe/Dt5
	Ar9GY1sxf7i3PbY/Ub9carTfAwA/f+FyzmUAISFOGw2OvZ0MlqUjd2iQLVOa/owPN7xopAOX+Jo
	xGcUBVbWV+OUH/BGXjSnQGGQj7zCM2T39JuoS2UXAsUSI5Ov7dNqlK7wZ7/RN8PeT+tQ/ZiJg5L
	Ax/eMFiT9hpjw6+MhJubrv3kfjot8NG8EYKBHs9ci/X5krNc6b10w==
X-Received: by 2002:a05:690c:e3e1:b0:854:b86b:d206 with SMTP id 00721157ae682-8a6461b8773mr74828367b3.12.1790618539927;
        Mon, 28 Sep 2026 11:02:19 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860326244sm47122057b3.6.2026.09.28.11.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 11:02:19 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Mon, 28 Sep 2026 14:02:18 -0400
Message-ID: <20260928180218.788643-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCv4R-ogez_NaXdx+q+ejQLKhPTqdR6Dx1-HAk6Y3EHKsQ@mail.gmail.com>
References: <20260928152416.766957-1-jordan.mymail@gmail.com> <20260928152416.766957-3-jordan.mymail@gmail.com> <CANiDSCv4R-ogez_NaXdx+q+ejQLKhPTqdR6Dx1-HAk6Y3EHKsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Mon, 28 Sep 2026 19:50:01 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> nit: I think that the current way is to not mention the model version
>
> Assisted-by: LLM

You are right, thanks. It should be "Assisted-by: LLM" on all four
patches.

Hans, feel free to change the tag when applying. If you would rather
have a v4 with it fixed, let me know and I will send one right away.

Michael
