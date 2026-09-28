Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7D4D489E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606099; cv=none; b=nb0+OvXslWHgePEc6FBhfQKdgKxJ/6QTFLgO3lR09f0dHV6JSxNApofN0/oZXC0SfezFwf/wUGsdZ5Q0Q+36ChnmObY4hW83NyD7CVBl0iBwZXDRsoWm6+dlO0erUKvRnCyNVC0QcCbe/KdjfeQVaEygY6inlJb7oyBFo8eNrUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606099; c=relaxed/simple;
	bh=btxyB/WLVckW2FMnL9chr+o0X+NcLEk/lDCNp3gdG18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jq6sS3vasjuVoreYWfFfVn62mfNeQCSZvU8uyzbeiaDxwU1R4iosBp3WJPwHz0Mg1harPnEoTjd567KJ+ySFXbaf5kki/lYuYiKb//7HVw/lS/mYGlwEFeY2c1mzT+z0ZRsGmI/EJjQCk+cNJWRPtJB0hoV13C6kNL9M6AskhJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYTZ52o8; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYTZ52o8"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-6730c3bdb35so1918652d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606090; x=1791210890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btxyB/WLVckW2FMnL9chr+o0X+NcLEk/lDCNp3gdG18=;
        b=VYTZ52o8AeC5jdJBK4QvmB6nZJLiz3H9J1E8O5C6Ofua450fRG5tuspTappes8IkL3
         PE3h33grNeuRI8na5tkBPwOhPtZFY1LYqMSD9BAXnySdYfXPe/p+vGH6x5ejUpKPDyi9
         7wB/Yj5Gh0uEi5SdJHMJ7BjG7JXWLZS+jRHzo8eFvtMBB4g5sW5leAM/6B6D840icXOD
         uvAasCC75geNJv2XMe3htQ+R6He3zUU0MUgz51o9AP86ZTACOx7P2FWlTHybct3SnVqy
         cKbvs58yBQcdamp0wxYkw8sYtm5U8zg3vQI4XfSwBf6knj1O4PyDrsKTXK5qHfl+jfGg
         vP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606090; x=1791210890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=btxyB/WLVckW2FMnL9chr+o0X+NcLEk/lDCNp3gdG18=;
        b=x44OY+EIKiLfRzNnIFagQXSVIktSMnmo1oUNyRXkt9i7Fc26ty4+vSiGddCUy5NVuD
         K+Z6VnKIGBrVaVf928a4fsRhmJJpoi/9jhTJUNel5YBNT3zPxOS8HBxY02NLCxGf6eiz
         muTyv1si1XGMfwsTErr06o9qap05gCXOSylW7n59/mONCNXRaKCNKtMlJEJOF/XAWYfT
         pejt958QjpZ4rjnQ70GpOCz4VDm3/KFDMH8C0mjQ02MWJWjVkZPropGaX/jXg9yXrHcp
         Tm9GXqn9gZH0no8E09aeeMmBarrJM2CThR5csnp/3pf0N+n6JdTqmFMGorbew2PP4N9Y
         H6VA==
X-Forwarded-Encrypted: i=1; AKwUvBynqo+uNb6wWyLXlepNblgznHZe+tN8az3Ue/lMj4sCSCSmoll1lIfF2cMPlIWAkJZ1fuRteMO9e4t1ttA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC9LplYKkE4LbnoRT61+e9hDeWV7V+AFOtZ+sB6wXxfmzP5F/2
	LYL2u94A/FHAbuzjZP75tPn3a1rkkaejhgFKJArPfg9dZMJMm1Bf1bCGVZ6KikFgWg0=
X-Gm-Gg: AYBFou3nqTu6bY4lhFTDbKRelTcw/BoLk6pi0Avm/K/h0oUeAYECdFiAY08HZIkcpTo
	hdZmc5EyU699FIcXKgpwjavtATUoNT5v5SSAKIdCbC4X6Qq7CzwXJhngzCDluctsB6P9n+xe05q
	+Nqv9+tYifcyc4Z+R6ihYJS4nK7PRLB+9SXZr120XeItVAEcpcw5rWIbs71Q628PB4SMlOAmh7R
	YW8qZykdWIT7I8R3Ch0gBQgNBb1TvhOCHNJN/WTGiBbftsWV//vR0Ay3Qa1tn4tN+8TqwOvMqop
	neRzJtKA7AAiDdTYw8H8qh0o80FsuxycjsoBMz1y/XNJwj9z6A0oQll05c66fv5Kk7l9RI0naNk
	Vv7l7IzGrAK/M++gdOyoOfVC0+SsX3ayTy9OsOoygz0IFmFsIzG5Hn+T34ifLBOnPnJdbWx2c90
	zUNmWNmhaFJ3Cb07DHepkUp4543cHf3dtnqmHLsCLDUirhuX/ZIA0WmQ2q5P4IXWPJ4mT09FwSt
	bg2JcxTVXSl9SQA+sEQZfvmZceDtFV4wZZK/9VG7RBBJNaa6qK2uA==
X-Received: by 2002:a05:690e:d0b:b0:674:13a6:4d15 with SMTP id 956f58d0204a3-67413a64e76mr2852568d50.3.1790606090098;
        Mon, 28 Sep 2026 07:34:50 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6740efc941csm4577404d50.20.2026.09.28.07.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:34:49 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Mon, 28 Sep 2026 10:34:48 -0400
Message-ID: <20260928143448.757683-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928115713.GD157191@killaraus.ideasonboard.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-4-jordan.mymail@gmail.com> <20260928115713.GD157191@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurent,

On Mon, 28 Sep 2026 14:57:13 +0300, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> The device implements an interrupt endpoint. Does it report control
> change events for those controls ?

No. I checked today on both the Tiny 2 and the Tail 2, with the uvcvideo
status trace enabled (trace=0x200) and a stream running so the status
URB was submitted. Neither camera sent a single status packet during
commanded pan and zoom moves, or while its subject tracking changed
pan/tilt and zoom on its own. GET_CUR reported the live values
throughout.

> > The vendor has been asked to fix the firmware (support ticket #8220,
>
> Any public link ?

No, sorry. It is a private ticket filed through OBSBOT's support
channel, which is the only way I have found to contact them. I have the
confirmation email showing it was received and is awaiting a reply, and
can forward it if that is useful, but there has been no response since
2026-08-04.

> This belongs to the commit message.

Agreed, I will move it there.

With the Assisted-by tags and the shorter 2/3 message, that makes a v3.
Hans, let me know whether you would like me to send one, or would
rather fix these up when applying.

Michael
