Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD544BCB4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773492; cv=none; b=QEqsms5sSXojZIrldsNLEFYMUQLsICH88EZxDzjb2DYwjGbIWUUhqCJVuft+pEqA89izEZNmzausewvWlnq4LB6R/DZFHWOg1IDJDpigmGkZxnMHoV9pwTYfGTUX3int4n1JzFaPzqHHToWbatc+IZt5k3MbyuECNteisogMH0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773492; c=relaxed/simple;
	bh=Zp/+v2Vdp/68FP8nvPJkwjv/YSJdHbM846ABrYm/C4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evF5D503ltqwrYz1SRB7TWwEDeVQoTA1Mf2vh5NcAOL7bWkFcLY3gvL/5YgJsL5rnhgnZDmfWpdRq9G2p8ffW5KKhCiKlyOO9RTFtvrfpWg00Xu+gTq25jA1dxkVSQeUTReP13iz9k3oPqwVZhi3QRUdOcAKPu74RjT2h+i2SqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfJhq6q9; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfJhq6q9"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so1862294a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788773490; x=1789378290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arhJRzLGcFh7QxAKla9Gy2qjsP8Vk5xX1TysHcLnx40=;
        b=gfJhq6q96en7+v0MQfhleA5RVWwJu0Drr3sq9CgpWOoT94WdseTSrWYMQasYNK+Vwn
         djDjMjO+4Vd6qM/x2uoBPk9l87RLobxmvJbWeh0QgCf0Hv5KLa8oTj9y2fZTzXtOOPkN
         3XxEFwc8iq1euzfIoBJtNuj+JEwTJq8bakTX6XFoz+Jau2bsDoS+NQVA/vsaS8dw2sjy
         SGFaXKmpaWrobdE0xbJOqCVvfyh3ECLh3ite+x/RBplKBwFWAgQX48D6yPpUUTlLWlki
         4OKF3dAXsxpO1xqUON+qQOU/B2v7PdoK0Xs7+WJb3XP3npHmRIJqVe+t3hpThYAHBrLW
         cbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773490; x=1789378290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=arhJRzLGcFh7QxAKla9Gy2qjsP8Vk5xX1TysHcLnx40=;
        b=cd0ixSnh2nGP1EfIW1dZLQYRoMlYgOg2CVkV+W5Bb8hViPFN9kPooClaGHWSJB0866
         Ht9s6/AKkjP4oZmOQ6Rt37KwuBfm3QebdT3ZwHBWj1TVXsIn4JYL9dkXmF4+/6/afDK2
         qmd0i54K2pCE26APnYwVvw3AyOXhHZ7C6/aQfh0byi4sg92fw22B5ke7iEJy8vrNd44M
         9tv74YUt94LTV4KDyobmEyiU4fwDNzl18rOiuRCCegAxqr2tFmR23ZYIycC0cfjvMcDC
         OkiHikfOsr1X1UdqHhNerMhX1FBFRzBIcW+IjEptNG41Z6b2eUs1uQkfrvYf5ZF0xvs0
         rHfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtTRZxH4JFOUBVQphg2f+f/xfKe0eF/bs/1apILgULGN3NVQ5WvrUsDnzzr8Y9H24OzH/t2u03qju5NHk=@vger.kernel.org
X-Gm-Message-State: AFuF++kJEYLDpbsC5LocOVqc+bgUy5GamW/h/WhFE2WRmh/C2Fb2gZOl
	shXiKel7ZFRFKj30aYLVLNCMkY+cQKxip7NnZpXTuilIbO93X0Ialq5b
X-Gm-Gg: AYBFou1XwiQG6P+aSTDxjxr2xDmEjaJUdt3yd7Q5FicveACYzL/xZPCmT7lDXk6r1zo
	moyUXV1G9cgvGL4JgJC5rxjcVQBRX9+XuUCxMBvVAF/pD1zEdR/s9t29lMotNiYiGyC7YKHxXBq
	F2/S7nBr27ujwODfQ3WvrhUwkpUTSydDFEL3NwfGfKnoGkOKkAvGa4CdOQiHJk2LkfE+7GZOTRA
	AU7iOxbLJgZxNkiKELQmCwQge96JTSAr6viIlDASLJ78osKxvWGn17duCOJAyx6xgCNTyTnOzMT
	NEXcOAnrgaMf5luavIMYXBLCHZ4uBDuSotWeuCncf5hYDhl5ZCnY8lf19rI6IfneB9OB52/s8Kk
	DjbG8cX2TWSb/DJQtA/6gHaAasHvZV82goh94+Y6m+6rUrb8VIqW38c8fq0ooVrhV428p9XkRdO
	+djSpl0ZsGXYgx9DLaqLgSaSn8gFYYArAtK1tg+ybrnd+tCpv2awXOlwo+mtkL0kRa48A9GLeoX
	yOlRIpOoUJnyrpfzK/UMrwMwg==
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr38517893a91.16.1788773489864;
        Mon, 07 Sep 2026 02:31:29 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm25503181a91.8.2026.09.07.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:31:29 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH 01/14] f2fs: extend folio state for large folio write path
Date: Mon,  7 Sep 2026 17:31:22 +0800
Message-ID: <20260907093123.2438228-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com>
References: <CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 13:51:06 -0700, Daeho Jeong wrote:
> +		ffs->private_flags |= flags;
>
> Is this field protected by holding a lock properly?

Thanks for the review.
No, it doesn't. Thanks for pointing out.

I want to change this using per-field atomic read-modify-write ops
instead, to avoid taking state_lock, like below:

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
@@ f2fs_folio_get_private_flags()  (f2fs.h:2719)
 	if (f2fs_folio_has_ffs(folio)) {
 		struct f2fs_folio_state *ffs = folio->private;
 
-		return ffs->private_flags;
+		return READ_ONCE(ffs->private_flags);
 	}
@@ f2fs_folio_set_private_flags()  (f2fs.h:2730)
 	if (f2fs_folio_has_ffs(folio)) {
 		struct f2fs_folio_state *ffs = folio->private;
 
-		ffs->private_flags |= flags;
+		if (flags)
+			__atomic_or_fetch(&ffs->private_flags, flags,
+					  __ATOMIC_RELAXED);
 		return;
 	}
@@ f2fs_folio_clear_private_flags()  (f2fs.h:2746)
 	if (f2fs_folio_has_ffs(folio)) {
 		struct f2fs_folio_state *ffs = folio->private;
 
-		ffs->private_flags &= ~flags;
+		if (flags)
+			__atomic_and_fetch(&ffs->private_flags, ~flags,
+					   __ATOMIC_RELAXED);
 		return;
 	}

Please let me know if this lock-free approach looks acceptable.

Thanks,
Nanzhe
