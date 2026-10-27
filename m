Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107606;
	b=VhtCrCYJJOstVKDwT67XHcX+qdW9IgtxwUtSL5o3EbF9hptOVJ0sPJ8RjsZUPm9AjDvG
	 JEUpr15WqIHwDnAZERyv4QCl9wbdNQtBhUObgUJv712ac+laSPza6CViqXcpArhifff1V
	 BCs+GtWXUUq6FxT8l9EVY4rz4ooKCwb7+6wCVfisvLFiVfqHFddDuC6OXd/E8tDGz1+q5
	 U4et7Jlu7gq1TtB7O+uqLbhgDdrB5MiA/rfeO/CDadH62O7DgSVRMufhVybASA2sjnnHk
	 Lq1QMOxE1k/OICdWXuBBxWF9c9bgurXiBarpOuhphrtznoSfYDNZ9kScc/TlUUnLqNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UrOpUypNxtaw7z9tGQB7pFWtoYjkYD4SVEoMwlkiYcQ=;
	b=nG0jqTU0Ug5fKxQ8VVMEIytKDgzIH7lAHjEJXEg3tu+SS6PC3hghK8WnJTNHUAtJ3A3m
	 7K122Pa5LxgrJIMHfUVjW8yIalPulcIYlmYw/UpPHOWt+GtLwJHTetAdIm3cM/RotORxe
	 CoZgU6+UBRgff60CsYhLvgH5m5q7r6Yy45SkisxN3lmBo2TPy0gQ8a+LkCKyGkHie3sgE
	 2GJzS9K+fAxPe/qtp5vuzbTRFNABMn0KhDj5vzv4gZWeOgPmpbGsUAxt2n/hm/DCiMko/
	 cgrm7uLxj1waTnHgD7RrUWko5V/pRe8wVCyr+YRv3S9eg4duBTpKZDXYv0NsM9Gcjsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YxGGQope;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974F606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4974F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YxGGQope
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-34c522572bfso536674eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107605; x=1793712405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UrOpUypNxtaw7z9tGQB7pFWtoYjkYD4SVEoMwlkiYcQ=;
        b=YxGGQope3XmIOEeVNsI496jKnBqjPaygkcrOvLN9Gqhp5LWOQQENnmApcZMEfWG2Uc
         RD4meG/tdn9e+IKPZ/jqmx4kBLGjLrpuhgFZ/tvwo3OP8EBnU6+EdErQCS/J5In4ZP/B
         knqGhBRgRSiLn5zIBa9Wx2sIjAh5g3eizE/U2FOQEmDNdwsrlXZDaDsWSriBDI9Dcdjx
         VcakTfZkyoNYPuq+R1QlfrY01iBmJ7wS/LvBT7Ga6GSKcjXisFPUa3DOoL3nF6dooDQ8
         Whgp+/yWcTbeE7sfrFXlI3hEKUrA1oJIzppsXDggB/ND2XzWlZyiQCAcbV0APCAU7mgH
         L35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107605; x=1793712405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UrOpUypNxtaw7z9tGQB7pFWtoYjkYD4SVEoMwlkiYcQ=;
        b=lv8NKD17i+mXYGcv1CjP5UfR5DTABEe8/DSE1Kz5z5BqP971dFOugUcMQHqwXgQfPK
         0FhV8Bkaa5mvp+uvuRi2aVUxorV/MDi6XTsOMHd38k+Ez/pg/7J4nqN5xSt8utioMXFT
         DKQu1b9dyKVoc3S97eLxusVp8fM1mI30XFbbD5Vc4wezErZdbgJBnzTjyOPeJd6Mj2+p
         +aPnmDoDoppI97L2lInImEyQbX0YqLA1SEMMioJT5tioPociD5w4V3CFzWiJdJdiUDTj
         rcZ5xqpJUWoSUQcl0wXNkBFGFRsMzTTQMJkMhueUrAO5GNopGImpyg4FpyHgg4CehCLz
         u9KA==
X-Forwarded-Encrypted: i=1; AKwUvBxZOkJa922EuZzsmYtKotUB54DycMks/uJeHL+262WEkDfgWKKsGEt33m2oCQsx0zgT58GJSTYqP6bAlcY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7BiWf/P/H0bxTBE7rxcRJjnw+RpAdxw+d/f9xSvB8blcNC/D3
	whBV+xa1N2mLq1cu3WAfYaa/WUBUgTeOPvGY1MZ3c50/zsb0zIPGvUqW
X-Gm-Gg: AYBFou1OTSIymXHliYORKPLwdvpGwjqNA96u32JXjwVsiz9KSaLEbgZ/AWWxs/1Jvqa
	7Xr5doGp1Sz4Va4ANznUKQ5s8H2jRH1GibQkEhxS44WhqYd4z/zjzvGDgSmg2RJk45wN0ar6jBI
	yt0Dg7C5mu9qW7Dg9xebxXIhp8sjvgTUSmE0hQol88tX3U/4wE7nS6a/0oypyAY6Pe8BE1rekoe
	35XzbJMHeC+TrVomt9uyjrsDMDe0yYrJaVaq9WjGTJ9BAsxHnB42lAejpt5M0VQF2DuagV7gy6V
	uOzz6LJgcmCW7QPxOUCcQHqG2D/bofXDdO091+7XIWd5ZzJtPkaM4viFnylDVDQGMvtFNiaG0DY
	MVqRqekeavDpy+knjkzvHvauU9WKIjsVJA+cxpEt3b1BPLHaTHPl5t5pUmMoyiJ2pjHimWZmnJy
	+zKR1YL4G2B3DxxLu0/znrQcxWeqHzms0uMN2du+QCsLX02UJbS+3uxF612kShpTF9v6vs2xyxQ
	9lQGxgvEMM35yoVM7+nFS2VqMX1/EmxVlgwmDRlKp4+CVk9QWlsmMJc8w8hjBTCQpgetQKsPlxE
	bYegIzPX08JTpAGCH8YwBNMBciLKJPArIePRPhhVfY+7dYicIbcMjxD3ewjVrGuPvr/d6nW1WUD
	ia4DWUYmAsrIMjEz6OD9qGpQzfzLBye9+nOgBReiMjfrqUA==
X-Received: by 2002:a05:693c:8646:20b0:368:5521:612f with SMTP id 5a478bee46e88-369e81cebffmr26854868eec.0.1793107605360;
        Tue, 27 Oct 2026 06:26:45 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm18478013eec.2.2026.10.27.06.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:26:44 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: dmanresa@gmail.com
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Tue, 27 Oct 2026 22:26:41 +0900
Message-ID: <20261027132641.540323-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <6ae07c62.e52dcaf0.293af3.e647@mx.google.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com> <6ae07c62.e52dcaf0.293af3.e647@mx.google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Tue, Oct 27, 2026 at 03:26:42AM -0700, D. Manresa wrote:
> Tested-by: D. Manresa <dmanresa@gmail.com> # Surface Pro 7+, IPU6 (8086:9a19); patches 2-6 only

Thank you for the thorough test. v2 carries the tag on 2, 4 and 5.
Patch 6 changed after Andy's review (the span computation rewritten,
same result), so I will carry it there too unless you object. Patch 3
is replaced by a conversion to the sub-device active state, as Sakari
asked.

> That CID is not added by this series -- it comes from 5be4154f6255
> ("media: v4l: ctrls: add a control for enabling strobe output"), which
> landed after v6.19. Since 6/7 uses v4l2_ctrl_new_std() it needs the
> v4l2-ctrls-defs.c entries too, not just the uapi define, or the control is
> never created. Worth a word in the cover letter for anyone testing on a
> stable tree.

The v2 cover letter will say so: 6/7 needs the strobe control from
kernel 7.0 and is not for stable.

> 4/7: camera_orientation reads Front and camera_sensor_rotation 0, both
> read-only, consistent with the _PLD here.

On the Book 2 the firmware reports 0 but the picture comes out turned by
90 degrees, which 7/7 corrects for that model. Could you please check
whether the frames are upright on the Pro 7+ and, if not, tell me which
way they turn? 7/7 can then carry the Pro 7+ as well.

The link question continues on the 1/7 thread.

Thanks,
Antoine
