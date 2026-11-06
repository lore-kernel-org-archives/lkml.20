Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793984081;
	b=f0o5bz8/9vkca+pUULPgCxI0qQAZS+8bBzl7KM+yb49J0cXLK8ouYrZY7vy91T0TMaC5
	 61/f56u3lDu1p8Fy4Sf5VSpIaJ5YeNdEeZo5XYBRBXzkuUoYagm9P2q6LnRr3442NIg0X
	 S6JJkcUm6Zdk4VgK4xr6fG38V8CUTvT/SQX15EorN1lRhx15O9eoEoOVnv/242A0gLk0a
	 6LceFdYsJRoNfY5KLe+WHipf/0hwACxNjVdMIftuUHN2jiRhtzbGtR2lCD+PtsfYB457l
	 /wBI/q/UuJqGqE2SWW7Xcfh2BMSDGstab1ZEnk+0NYKZTrr5Lfnmy1oA9XvMPqgVCEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6i4oUXdP885wW7dG5qidGLk2DhrD6UR6ZQWDrphycws=;
	b=iKX3KnTZMQOtuQ2Zq6/iPOoewBw/gj1G6XxPVVjLhles/6aj0rZ0tWX+QKyvCaUuBUZ1
	 cF2SlMqxRn77Ia/HoE28iq3fxQXf08KPy2hLhKzFbCQnPogES1AuheW4LKGHO2bzPr4ci
	 qxs/lUu3ZszlAzyYbt0LTQatqhsKY8muDKN21Gsdvul/I4r2+5zysgAO+UJU9gVA5dvSf
	 x7ku015/v4jq7g7Z+kmHZu6Ow9Hz2Y3C/uyPsW/Y9AsVNEkVhz6G3Dve18kzD8OVKrVCe
	 cA6JxVaRCEkjh3SRbyu1UlZ/JPmx9E4kz+8KXNyigwTr3/XGI7ad2GvTadrj3DHgAnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SmHlFGNm;
	arc=fail smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E43A606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E43A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SmHlFGNm
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso5864775e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793984080; cv=none;
        d=google.com; s=arc-20260327;
        b=fDbklkZbL+hBBK7SSB/wozQ2ZK63AOn14JoBRdCqAqVN9dLxrU1h8XykCdYV+Nkl4D
         +tqXJNFH4ie+/H/vXXwFpUXi1sophV7slsQkLtdRSvnv5/feg2cISSuBjVm2gXpqhLiq
         f4JGtsgm+gPGmWvJTWJe7uTsdx5TkLDG521jQuGfoI7N3mzlTsUZY2hZ+5zrgudACCVO
         dJmCmu1/IxZgFP26sBjDJv2p2Z5hQZRZUAj9MsVgtS9ZsjxxWtdfK/dsEeNMJFpAXkXn
         hi+SHfMtYs/wSA95JaMcpSK/fESr5ft2vr46gVUV0JINC6wz9Ij9HexKdf7bts3hyc6q
         kJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6i4oUXdP885wW7dG5qidGLk2DhrD6UR6ZQWDrphycws=;
        fh=dZ1n83eN7LS8STq9/mqyAq6pIKdoNynwZeza7Z2br/Q=;
        b=WFoowXsAHaKp4pQCIMa1kzMFr3YqQo1XAPK6IOOp8DyDFzdl1/q0nnMay9ocEXTslC
         VpW2xiWqsz4cwrtyBQhxl5cakhkjIua9A1O60AC4wWjkso8OAgaW5IDdL5qx2KzG26wZ
         IspJ5g0RoDgDTpSij3OkKbEyisclvFQwKHizJJz7ZhlJm22KOAe4XhsN6FF+7HWU6juy
         Orkud2A2GzgBDrATaDfupAiN7ppo/VADN5Rz1d5FphSUYQ4uMdNiV7IQvJoGKv8nFC4X
         EzVHbxhMkpkHqbicbdBmau76Dw0msks9vytf6VqN/xHECyNbpwL+q0Xv9Kl6V6we/3o5
         ssHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793984080; x=1794588880; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6i4oUXdP885wW7dG5qidGLk2DhrD6UR6ZQWDrphycws=;
        b=SmHlFGNmIjwnF2DR6HyMJZLS9Z0G4KCuS9VIwzgtntwh7SHVYAa+aqmdgqQM58kmzU
         U818gJGJXeEpPlLRbtB5p1E/s3HFYuv03oRspD1QMAEN8ewS0/FFrny6z5U4ajmdEc4U
         ZPXH1FKEhomQbYsIQQ0CnfpJtcQiO+OSn3QZ+ItFPl+ChWgbC0bajWNWVJs8c2/0idaM
         1nFml4+5UEmW0s42p68V40UgsuXOvyokl20xeCfrwrVgYWYTk0+r9sAQmYN2g0Tda1T8
         sLzAzGvF7qDcmwU7dWt2qdZcaINHneZIzv23xaS00rwhp9i6zEMAjUwG2YYoFA6pxrqS
         ntmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984080; x=1794588880;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6i4oUXdP885wW7dG5qidGLk2DhrD6UR6ZQWDrphycws=;
        b=Ig/JbHa7kfNTChav1Xeqc8XOIYH8IbZugLjwelRP4BrAeXCqt4p5wt6eWFSIa3OWFK
         BGNWWvMvXg6DygSOM417ru4xrVkt7b+hy97Tr6RNLxS/CfYeissB7klmBr4cpQZiQLZL
         PT0+KYsiEqk15pR7cTSxYIjjyPc030KlQ12+wqyAau/ZXkzK7wwCX5cJX6glv6LzJLG1
         C4OXkeuoAVtwlADmADCNr+cIC7ckTeBpZ25wnv9yT9urOIINXVb6owEp/RMNRg07m0xm
         SxbM93zKaNYl885fe2rFt9yfhh6LtXfW3H3gzKWcKXeS0b1BVbnj7QbakoGbpRlW1pUL
         aU2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgM4TXwtzE1b35AoT+XSFqiBNOY9c+05LwtOgFk5Ri65YlmZT1CcdgpUrOVSWVWTK16G682PiV8opq8IE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mOsqj0f2dOZJKsy/gEfkmNwW54TbDv2J7PpbQTnVvrvqubd0e
	Coc5RPgffenjZHXGd29A4L7VZL4rMIuR/uqorsHFNCdASYhFmnDNCkTHBgiftDdspvPHHGMIRmp
	5Uo4t7wAFdAQxF00ttqbj1CWB36Ua/nY=
X-Gm-Gg: AYBFou1AdI23Q094Hq0Ggbrik4/cLaNtT7jHxL1nHwEMkkDWnVgsLwLgM7wC13A5zgU
	st7dg5rWRpocb6ij9gPNxmHrL5xtuhfMhLvX0NiSaDtKhkaJGNPaD+Zo3GHqxkQQuuUUCv1Grgo
	UFkCU+OIc72Kw/wImtrBJfAjsdjlepgH+aGgimF5Q/vo19GFP3OciIaa7Fj2BjLsywqQRm7qTPq
	9OQHlWTI887EbKTcdS5D4DUwyJfbgxLRbIVx+wYn/C9rWmbBKAwLOIlQVZQRZAj98dZxJMUBWxG
	+LPJXt0fK2qZ9RBIefvm4HWeVHGMojGuSaGO54Q+HdYtuBoShA9cwgQKcYtZyNqBFStRIWmSa6K
	RSWz4eMAa49aJY2ENWQP+sbvW5cXVq3WQqjLZO9zXUcG5ErXBLR+6KGaHMCA5Yfaf1KXliMiJJG
	ZW+msracqqo/OnsvI=
X-Received: by 2002:a05:600c:19d4:b0:4b4:49d7:bc25 with SMTP id
 5b1f17b1804b1-4b6dfd97b92mr54279315e9.21.1793984079658; Fri, 06 Nov 2026
 08:54:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tle493d-v1-0-3246e91e6394@gmail.com> <20261105-tle493d-v1-2-3246e91e6394@gmail.com>
 <20261106030419.23ca9b26@jic23-hlaptop> <CAFkCdFyi0GD9aWMUZfx=QrZMg1ezjUDCdRr+LTsD0JMMT1DeiA@mail.gmail.com>
In-Reply-To: <CAFkCdFyi0GD9aWMUZfx=QrZMg1ezjUDCdRr+LTsD0JMMT1DeiA@mail.gmail.com>
From: Viral Patel <viral8854@gmail.com>
Date: Fri, 6 Nov 2026 22:24:28 +0530
X-Gm-Features: AclHuK-KYnr_aQ0yTXhRBn11b3ztP800Zk1SFF5R7aNF7AVjePHX5gpKZEe8GRQ
Message-ID: <CAFkCdFztjTpXnm00C-TQuW0_GC0Mbm91gAa-JF-fuincgfAZVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: magnetometer: add Infineon TLE493D-W2B6 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 22:14:42 +0530, Viral Patel viral8854@gmail.com wrote:

> The Pi 5 controller doesn't support Quick, so
> the reset was not exercised in my testing.

Correction: that's true of the mainline DesignWare driver, but the
Raspberry Pi kernel I tested on advertises I2C_FUNC_SMBUS_QUICK and
sends zero-length messages as Quick commands, so the reset sequence
was sent and worked in my testing.

Thanks,
Viral
