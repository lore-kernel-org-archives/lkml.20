Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC24CA292
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158641; cv=none; b=WVOYm3+pw5xkFycnRQydnOZgmrcyrpo42ayxL7Xkd5lOaXlDihBUzh34vbzS4CnIh2cqCsgFPKAt82xY4TA7EFb4xTrCRn27TBxHeD012OSz8b4JHEaDh18XoHPx5LABhr7MHZxPtRRjmnFHaXJ4GmGjIgNNRfgHFNTC13/rfJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158641; c=relaxed/simple;
	bh=JtWUgmwXdpydz6sojSijM7nIyyfqJH8FXKjubNi9ZEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cumWLv7YuERkc9jDA7mWX8lkGBaY19wLjSxJz5zQT9LkqTEW7T0T4LQ9uwTfdP628SvgeGihNu5vzWwd0AbuvuLnCGdg6fKJkUKMiXDTcMXVrJmUdYjsYh4eLIlqB0CTvpx0K+J3aUCGtBbhreHpCSUOUZbzCD3m96RO7OT1Z+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qCFQOcdM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qCFQOcdM"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so23003a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792158639; x=1792763439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtWUgmwXdpydz6sojSijM7nIyyfqJH8FXKjubNi9ZEI=;
        b=qCFQOcdM/OUIM2ay1ToK1u5QDmNQfJS/ac0n1pwTIORQbPiLUpQZkknOdiQ2SuQlie
         fAHqWh+JVHxcHC2aDJO4/EoaTrmXm/ooOBiyRKS1uaCTG/c1snR9FlEJXgOC4IvDrQOc
         wgT9GW9x8oTS9UBosl2TKDjU6b9mjS0MR9CUTIBZAprPVinBP8TE6ngaUIkVZREcuE1m
         MzS3V0ghJ+AsvQFmIvvfPevh/Pajla8nsqwoAQbXEbO2g/VY3SXbLP2iwZQanft0VCfs
         sZI2Ncjph9i/GZLAZr6I1w0+nkBt6B1ogVx2ykeLk+PZA1Oolo8gXKPlYLEmFA4j9C8w
         t4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158639; x=1792763439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JtWUgmwXdpydz6sojSijM7nIyyfqJH8FXKjubNi9ZEI=;
        b=m1EAfRvIJ1I0KWPTUGoCySNqqL7jxfLDcIxdIMUwlDu8eH6fZCumXPjNrUHSRk4O0R
         GqM9tz+/245sKRHDbuABK/hjIyutsnvlghRzydc3AOM1inGyIDFCL7FdLdMfJ0NXLMLE
         QBTRb+5jPVKy0ffFuGVZUtjWz7l2pal7/XUXXyqLbm/Zc2qKOMwya5khuMhgQ7npYF08
         NOk6+JVuxBAknv/KBJ3reqJzBWDFUgvecd98aopGnpk1sslcAdHfp2OkbqQdEArW6Zbz
         q4WejIPmIqB+yj7kOJ+3/CL59CW+5w4gyXiDnsdUPkHfkJnhKJNxE/ReNqxwDFAwbmOt
         K3sQ==
X-Forwarded-Encrypted: i=1; AKwUvBweYnAX6wwC7wu42sADUWAL83uH5pt4Xu1g4YwUVBPqFrMh7KX6fKJLrQOIE2IDd9v+tos2zDDm2ordF0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ165H4Y9ggWpZhVYIVPgcWIk3sIDu1alRhsjUv/FSc7mfasWwC
	y2xbf8hCEy49HHJR+R2vfIKUgElItVuczLgjGbqA+4CBAAd4nvsRNmmN
X-Gm-Gg: AYBFou2VfV80RrDj+3V8wtYIX2ZNzutf2IffjL9AlettcW87PK60sN1xDACkMw8y7O1
	Ga4/Sw+HhcRyCo5CRB5pMF4cIOjkjf8YR6PvNAuoyQ3oeELBhwwafUTz9HFGis6dhoOBe68ob4s
	K6B9tTBTYVkvGqjD4vnfF/NKcSyjEIABVj83+Al1haIb/i/6Jg/SzCdy/5pE1EbYQKZPO6IEafO
	pbaGZ4Oymh4/Rc7oxw58YwpN9XQzZKNU4hpVzRfb9Mpde7NPAS19GqXCMIgOjOJBHepLudyhLzD
	Qpf+PaMA8Paiv6ZXIBkjACGvR04OFADN879V4onfRZsgLGHFtjvHWbFk/TkXzVxRgfieQXPKefu
	vCXKvvCMzaSPEjpJBA9qu2Nd5IhZZI9/E5s/BZ+1Pkcx1GI2anbRwZ4pAcGfTnQ0GeEojc8iEX7
	avTfh2Z7d3CShuInGEx9Hyd5ZxF46k1FoPJrUBxwrx01GhaXCzK/XC/XL4Mqv4awN7YUE1tlm+H
	I7LKR2QX1zFpQ9vVxW9J4g17sWpOUd7NNsHgZHhrIPWK4I2vn9tVAO67Y0dCbsOwTWomPVLFA==
X-Received: by 2002:a17:90a:1101:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3ab884b6b4bmr12069979a91.26.1792158639135;
        Fri, 16 Oct 2026 06:50:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:1467:1666:71b7:b993])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc487e509sm4348279a91.9.2026.10.16.06.50.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 06:50:38 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-msi: Use str_true_false() helper
Date: Fri, 16 Oct 2026 19:20:11 +0530
Message-ID: <20261016135031.36131-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20261016101506.14084-1-sinha.aryan03@gmail.com>
References: <20261016101506.14084-1-sinha.aryan03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an accidental resend of a patch I already posted on 12 Oct, with
nothing changed between the two:

https://lore.kernel.org/all/20261012154537.42113-1-sinha.aryan03@gmail.com/

Please drop this copy and use the original. Sorry for the duplication.

Aryan
