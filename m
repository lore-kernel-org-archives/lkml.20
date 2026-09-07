Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7193E49FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750309; cv=none; b=aiIva7ExHWXhLTMzvvSP3nYD+SLzgOe+TOJKkGJWaDDOeP9I+u9jkI2FFaL7mO9pvxv/jhyFSFt1a029ErCsrUeXsypLuU1p3T/1pfM1Z8wgeP1Dpo0N5f5j7qVBCZouxF+apD5LbM3ntrv3CiuT/OGbH21YzeW8Q2QgwR30Uco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750309; c=relaxed/simple;
	bh=jDwGIeZSxmQ+QLCqAsPbZtWRi3JWDzSBa7tgxRNC8D4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ArJxlX98QgAdPaUOKYuT5tPbjPZUVWzsrSbdDtRmLa6kKhVM1KmijGuU/2MorfN7pNlEUE6GYXXa2ppwO3Tw0AmupG0Y62EzDbglqDmOjG0VFjAUytgdXwT72FrlFSm+UsSuC9Njof7K5aDFxnLRCBiYKYLBS9vDhqV1lr+39IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7lKvrTD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7lKvrTD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso30328985ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788750307; x=1789355107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDwGIeZSxmQ+QLCqAsPbZtWRi3JWDzSBa7tgxRNC8D4=;
        b=M7lKvrTDwucm7XxMywJCfAx5ed/rSba4V81Ds6CFJBLKVX7RAnZSk/3bvl6J7xMvnw
         BnV5n2XiG+eYVSHIJHy5Ikb9pWTEMpdmGqVbkJMJDoIWrYs8RAiFPB1BVgB7psexciIH
         eKUnaCTnTMTEOZpjRGNt2pbi866ALd4mDGw9CxvAGDIwYjVe78XHrARzsYY74Js4Y+zx
         iYik848iU08B+3ziFaHF1GIwag7s2ixNOrQPFk6M7TD+Se/TpJr0c8rvqTvaz05EFdp9
         LYCLyez9O5VDi1DCqyMqAyN/g6N4D0tVimc+D2t1xkd8RQRSTcIeSRuqprt/2mI23Av8
         CnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788750307; x=1789355107;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDwGIeZSxmQ+QLCqAsPbZtWRi3JWDzSBa7tgxRNC8D4=;
        b=edw9LszdROWbQKBjjedygm7i1sR7ac5/VR2gS+PVMZsqagR4/I2XbbL68kXdynPlpp
         9Md2Qb40eKYaKezwuLRzBvM2gqugSPF8uqdWE5noS3nf+Sc3sq9GzwJZKvl+tf2C3XVr
         2gIVuvyzrXWqrHXP6bix/J8QW9qW5w2noX4f1UkW30ScVPioiizqB2K3wCElhNaAl+qJ
         IXoFqSzK5KdTYtMhL6Gm6TOGRj26QxgcxY4YQTHarna59fOpdufkHf4kvhhQwG0z1sGd
         auJjvBBMmNVtfCGb1M+Cjt0qYejpCgMaqqS90j8YtkWffyvwY4j6WSgIOMDc3iKm5h06
         0CgA==
X-Forwarded-Encrypted: i=1; AKwUvBwa0nUg0W0sMjle6Bjix5sVS+W+VGCMxSU/MmSBooZrG4jU7tBVpwbW6T9frL+azOVE6Z4NvmuMkRvLRpo=@vger.kernel.org
X-Gm-Message-State: AFuF++l2nslzgiZcEtued5GkMKruOzImo4gd8lOFEBAGUxReck+nqOxN
	T+z6FcURvuEt4V66eWsmZDh0APFJvUrzIcHDb0/Lo95LeVoDkNu0qLJZSYPwSa38
X-Gm-Gg: AYBFou3oHSQoSM6/sLCoVTysjCLL/vICeCnhhbe0A6Z0bybCbdP416ilE6b+XBnAGlK
	iyiAl99+nsEurrOejsnsbS3IiuMKnnMF50ZEGTVzDbvrAtu/imqMLQYDcSXHrluMCxyFUub/wwD
	0dghVhNimomdhcDSPu9Axz6AZGlKcEhXo86u88izO7uXsnTFtMISoPq+jX9cuzukFnx8/7bw1Qn
	jj2s7maLCYOIVJEACXfyX9a9yv//HrrcRzsfQ9m6ABr5rmHHBYhiCXeNKzCyDFhLAOfMfXzwnA2
	sDWY5QGncewOXY6SAhdW/G6lEZ16qHCvRJOB/MC7JNaKz8sakmeGGg2Bj299tumPGGME/Om2tnN
	yElUuz0LDqGXtU/PHRZwa67AHgeJ94+zvvy4ATCz0FXBVas/RFYah+rbcOWDRsCz6Lyfzv1GRcn
	o6xU1xB8s5M0yUMfLK9N1UPbX+J8y/a+F6QM52ExeOBJIsPeF2Y0RfAYDqrSj6xmK0kxO35/o9O
	qdYhQnZ+9fvAf0=
X-Received: by 2002:a17:902:930a:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2db1236f4femr206645485ad.6.1788750307334;
        Sun, 06 Sep 2026 20:05:07 -0700 (PDT)
Received: from mi-ThinkStation-K.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db148404b8sm38593825ad.2.2026.09.06.20.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 20:05:06 -0700 (PDT)
From: yewentian395 <yewentian395@gmail.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: yewentian395 <yewentian395@gmail.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] can: isotp: implement N_Ar timeout handling for FC transmission
Date: Mon,  7 Sep 2026 11:05:02 +0800
Message-Id: <20260907030502.3049789-1-yewentian395@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6ca3c6f6-91c4-4f0b-9136-9345dbaac1e0@hartkopp.net>
References: <6ca3c6f6-91c4-4f0b-9136-9345dbaac1e0@hartkopp.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Oliver,

Thanks for sharing the patch and the context. Understood.

Best regards,
Wentian
