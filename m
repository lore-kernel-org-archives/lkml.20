Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E77483BF4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280702; cv=pass; b=Px1l+Th8jb4EwQdWplA0oT74zFxCV5gmyfGnovN/6pbUb6Uu186iZYU8iJuT1t06QeSod5RnYYedClKn70SdPceqk7WqVm8bSBbLhAGjfsiSoh+V9obN1FH0a+aHUxlJpi4jNXhOm8M2jVUOnBmDhxUEnS6D7aisAeQ1kfv089I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280702; c=relaxed/simple;
	bh=TWVBhHy0WPw0GotWHFiTstZdugISF/16D3zScGhJWms=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZ5JwOSX6YZLplBVIvOxsBWDrE2NbUF0wALgWYrrY5xpxY4LZDkpg6U+PyNpwGXDI3FCoJW3JgfDehtBhEQCXolJNoHbfVZG+WnjsoN+vrrZ0NSxjfjP90ttuOxu9B9SzGn2dM8qQpFJaYJ/OzlAOxzeT2kF8TdEEYHI489tNAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d5sK726A; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d5sK726A"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a60d406a5cso65225a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280699; cv=none;
        d=google.com; s=arc-20260327;
        b=aP1PtuBupBMWsJ3XpzCeypSlL8Hke0qPR9zynzBJ4FUFt718X0VDMrbq2cHTS7C/Yo
         sHtgdnx/KBv1QzkY6Tk0kxbL0Rk8J+PV6mSIkyQPd5F7XBjMIRHsl31iPIfVZ++7rf6/
         2RIOTGuwcbParOwqubgMe7VIIyJWsN9ZQgXOZmE916YJkFH3gu8LZdSzkWaa6PBpQHKm
         cW/XrpluQnKObajpRAIBBm8oU93Oj9b8jaIc36xg3HGPkDqAn3sO1bnPA6Av73S6Wq1A
         s6i8q9S8aUqyqDhGp3lDfhBLcsXFtkNuruodTksmnCMyFivuLOt1hkvzWdn2nFn435VC
         RZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=TWVBhHy0WPw0GotWHFiTstZdugISF/16D3zScGhJWms=;
        fh=CMawcC7aW8fXKFDsOeDl1xmoqvhFaAlnhWzccJdfFDw=;
        b=NfMlGkNY+DDfNiB+A+7XHRooeAzLlBeaFTV8BedUSs7D2ERa8pUHEnqhgcF2PpNXUx
         q8Dph4SbxE7mCnU3LLJUvULcqkNENTXAxIX14ZJQu3ydERt7mwPta8NpTb62M8X4jc3H
         YonthZ8Y6XEO18ve2TuL6l/4tsaey3dLIQo6ANBTHg+biLRj4l9Ur1uNVcZs7OG4Wu6f
         r/0hO7xo4bLwItIul5EgDAJ67lc0HhM//U0FWrsp6xnsVafPE11M4acTwL6sVu+DKcQh
         8fFtYOGlmN7BTdsdlLsBpa9X+J9B8vde/iZHVXe803DKp/LzSlvDGDo6Dz7QzWqooTrN
         6h4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280699; x=1788885499; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWVBhHy0WPw0GotWHFiTstZdugISF/16D3zScGhJWms=;
        b=d5sK726AF7UPLg5vK7Ia7KVmkbBVcTNGNI3H8yS7hXHnf2Zm1EVL6WS3jJ2ISC7Btv
         uzZF9a67OaF8XDnpL6BtZQWZG0XkYJW4I4D97SX8VCruJTQeKbXrdxGGCNMUJy7xg/bI
         sd1aKAnf+SVe5E+i4YiTu5Sz8mKqd66uYXRuAsyTd9g8Sj1fv4wfztS2a5SCq5cXqy4n
         Jr4q3rC2n5dLxET3ZvWY45udBcpJYIx+KfdcFNCFbJIHUdYd9/o3cJw8D/QEAj+xaRp+
         XYJhNfyj9E/ymY+vIzwKM2ttXqSvNFkMBHy0zodYH0V4uc/wKulDt+SLcAQs4+I48O4H
         VQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280699; x=1788885499;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TWVBhHy0WPw0GotWHFiTstZdugISF/16D3zScGhJWms=;
        b=cbfaM4pElyvmdZE+rB42TScbPDZG4k8yF7D/uAoE+dfdP6Y4JWpGw0EJ7rcyh0LHog
         2lUlibUNrZNuCInsWyDj0UzajSsA0grJESl9sGUbUa0ZjSDSlHrVX7DLWfbNAGOOgMDS
         Zb6THXzW5FHmgmy3HVyxefb7Uh5dGGltih24L4Lei1noaeF7+P2yYct1Z/OI7KpcWwlL
         TkTSWJmvMGNsMsJwxm0ULdWL+LK5W64SxyO1nwLslnLrQRmhUGcq9ZVHhadFIim8YfHD
         eOyHp4syGCibr8UqJDEwvOkW0MRdW/I70614XnezNfCe+W0Hxc7vRucjhGrhrxmTHH1P
         u1kQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKWXETNGVJ0JBkazeFbV6HHu5VXyz0raK6OVCTP7JblgO9F9tPZapWyYmHoAPoJD5Mw405cwy1EV7SUHg=@vger.kernel.org
X-Gm-Message-State: AFuF++kNs5/gdo5MlP7GILP7ABkGTPms+R1kIZ8uQSK3kYwxaRbvQ4GT
	w0Y4hREmE4a7qEvajHEocQcAP2NUN0KgLv9me4o1w3s3GQjrQb/2AEvvOU12aRWpRRsSjCw3Wqf
	yEB5/fFJllSTegjT9hwGR3dYanw4vIPQ=
X-Gm-Gg: AYBFou1jAhlKus9x46b1ksW1LZ+uJFTDOStoONR6OILgyLNh1LaQtLaFkDICUb/g/Gp
	o0RU4MuTkx4eTWDOQwYZVl6LY8GS+0z+knXUAEb6Egp3msK8GXx2tSqtOzaJy+IUowbJz7zWiXi
	LGbmKTHthKnzuUFBl5nBTUe409hTcNR6NdpZk3cf8vjCU/S6+dJOplIZnlDFKFTuu9vgTQPmQR/
	k6ixDGNXF/rzh04lzzsprj6klXG4n2S9UM81Y8X0hfo6CUPKsUYQuB6i2G9cOY2yJzE3R4BnIHy
	wcDwEHQFJgnHI2SDplwM9pyUJREqfczOVK8pdsWm3YoWmfeyqI6PdyF4op9JeRfA00xe8wMM6c3
	dYQ==
X-Received: by 2002:a05:6402:21ce:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-6a663ab81fcmr7846829a12.10.1788280699162; Tue, 01 Sep 2026
 09:38:19 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 11:38:18 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 11:38:18 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACOAw_zvoYvdLWjUYpj1ambnjzPpzTOzTp7zGWA-aF=JqNPUNg@mail.gmail.com>
References: <cover.1788213716.git.zhangxp1998@gmail.com> <bb5a74df5ba223cd33b4b7111e725e5aa315f79d.1788213716.git.zhangxp1998@gmail.com>
 <CACOAw_zvoYvdLWjUYpj1ambnjzPpzTOzTp7zGWA-aF=JqNPUNg@mail.gmail.com>
Date: Tue, 1 Sep 2026 11:38:18 -0500
X-Gm-Features: AcwNN1U6jROIjyCl3ulm0qgtURd8CUn-gJJEkY64oOjY0QTlY8-WRb1jNn0TGgI
Message-ID: <CAH=xXfGOQ4zF+4=i5o0drHHFmMFaY-mrgTCp473BB5O66fEgug@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v7 09/11] f2fs: parameterize byte and block
 conversion macros
To: Daeho Jeong <daeho43@gmail.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. I have restored the shift-based definition using
F2FS_BYTES_TO_BLK() as suggested, avoiding the
DIV_ROUND_UP_ULL()/do_div() path.

Thanks,
Kelvin
