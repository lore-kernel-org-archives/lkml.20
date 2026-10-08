Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACDF3C3F68
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467761; cv=none; b=mcaxzDMGxt5QxHiFf4fE5UEkYAs4CK+tBMtB/nDCJ5EqT4sPkAfpKLNDtp5vbfuoVsZQI8PWWQdjGhmUqKWKntivlvslxCi6t/9VSZn5BuKYe2j/pnOp98Mg1yJdIOGn7eQX0TbH9VCUfIpztlLnhNxTlYJIknWyXq2mhuZd+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467761; c=relaxed/simple;
	bh=IugQtka+on0o0O1X2K0wrQ7qAcGaGS8gTystabNm8r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDahd++5NjVcEoFx015G9MiRcydkBKAnOgBXcnoTMrL8aPyR0Jgvc9WB5stbr3C+ER20wWsPFbvH4SmDakJCeqSb2JE4LlgFovAUNFQvTkMJ4Jf9tx0DmDT5vva9MNBIS67V/ZVVK8jvKv+q7E2ljYDZQEPyxbr2CKQw7Hew5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUsLp4u6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUsLp4u6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so28279585e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791467758; x=1792072558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IugQtka+on0o0O1X2K0wrQ7qAcGaGS8gTystabNm8r4=;
        b=UUsLp4u6II0xhEIeDZm2iP/EeXlbI0ANlAGU+a+kfjehcaXyeU0tsk3pSXjVvudqpS
         6aKGwq+9BwoBEdGxhnUIU6wLZd96sL2RxAzP+X4Fxm6kuzQ9kGyywnee/yg1VxsUqvlx
         qnyZkFOQawSZl4XDlkarBYmraTtOwwSky67ftveJkFKufRvJFSt3z4Mph+HKZ4WOrOVs
         KKIivkEg3/B+xBXiL4EHs1Ac2ULYxHkuXUVDdjIUJvfJpxa+eWjfONcpTFEeu3vUif11
         Q0fXYpY3NPqXnbUQVpKD9li7KVEDCkMvjE7VDNcOhHRqtn0aoPe+C94KY4DB7lEkCwOe
         DcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467758; x=1792072558;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IugQtka+on0o0O1X2K0wrQ7qAcGaGS8gTystabNm8r4=;
        b=urSm9Pyc9B7VWtD+btRJnnBi6xLDOZSC41rnyn8JWWAkqeCsO6WX0mNPsy9BkkialN
         +4wk/ylIlH78mcO45go3yhbkxyY3V/3fhqgrnqOF8prv37SM5uJsMBrTic3KSm1FljfB
         1XyaNgrXaf32g+ZE8aUEB9KJCVqIvL/tah2SZ/HflHCn/G26b5rlzaRQQ+HYXIsAlkPh
         sSGVy8R/e0IPPP95mfXA/fQr5A7oWv4+jo5ccQJmoorH9Ge4hYoOhEqODnI/VCQEbAz3
         WztU+WyCd1crPvLua69JqHHyyUNeI+kw602nkzqvu1lIX1Wy/8FLuvWC5NLGLUO06AQa
         VbRA==
X-Forwarded-Encrypted: i=1; AKwUvBzA1GkeosGWUGGf3QTWyaBjQhg71SvNoXKcObh4d569KqPR0sWCztXLDGlqKACAg0EXCnppIJ16SioZNdM=@vger.kernel.org
X-Gm-Message-State: AFuF++nK7H9tU+1eBVtk2KkVaxCpTYuK2sEs07IB//g+V2bnhh1s+3dA
	/9zvYo4KA6iZkFc1qGSD0m5dXXUgZhirJD5b9mMdGja7SaJ4yExva0KV
X-Gm-Gg: AYBFou3BpVCYEpuDWuEgHinNkGuFrh//d4x0f2w8duSfglu4qcsaVLjH+6JqHx1iliY
	vmFUxwaermm9Dc5U7Kd1TjTBKpZwlm0+2Zz0MFm4lWuWlbcNa/f6CuSYwhUp44cXN6YcWcY7FZ/
	GV5RldhZSbPF5/iTHa/3DYHAiQfIDgtnGwMkXpSEz1mTff2+mfiBUKhxWwEBBgp1BSkv3P7/4vU
	xg54OlIRoCd3KCIZWsoRmhON4iWZPgeeMGv8qKrPeKV181UffSynBjF5TylSHfSeu4vNM6wCRIo
	fjqmAt0Cv58R1fgZLErIEkOhrP3ktpxNgls8wRTzwwqjD+BCBHu7YbeBCyj8UuJYs8ywuMjQeqL
	g8LVTaJQwT1FfybOBTfhEmY7R0ARoSkFP/Ege/tq985tIc0RkyZA4oBnsmadnQkfIgRRPoXgPm4
	DT36xkRVeJ5oloNJ3LHcCS1R6qoIBu3wDEgUs4jBE+kuppiZZvbNrwbAlGYgSS4/TTPs7JfLg4B
	G16CcT05Ga0AZ7zf1dDVgQOZYlm1pvqxq/t0qOLVIhVyKkJAEvZQwgCUbC8VQgmoM1Pm78y0ZUE
	s9wTDPsjDo0Co/XkyyydsQBRXkMnnJcM8Rw6ZPc6WHKX1y4C7G2juFsN9v1VjlSoCoNSomCNKUd
	Up8ZqVhG1OVR8z2uOsmv8O7y9YK1b0EkF2T2MO1xF
X-Received: by 2002:a05:600c:821a:b0:4a0:1e68:d28d with SMTP id 5b1f17b1804b1-4a180303f9cmr96009025e9.6.1791467757952;
        Thu, 08 Oct 2026 06:55:57 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm224950695e9.2.2026.10.08.06.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:55:57 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, nicfio@gmail.com
Subject: Re: [PATCH v3 2/2] media: v4l2-subdev: Fix NULL pointer dereference
 in the EXT_CTRLS ioctls
Date: Thu, 08 Oct 2026 15:55:55 +0200
Message-ID: <179146775576.53729.7241687195832895526@gmail.com>
In-Reply-To: <asdz93f28oRR-WPu@kekkonen.localdomain>
References: <20261008042600.275884-1-nicfio@gmail.com>
 <20261008042600.275884-3-nicfio@gmail.com>
 <asdz93f28oRR-WPu@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Sakari,

On Thu, Oct 08, 2026 at 01:44:07PM +0300, Sakari Ailus wrote:
> Unregistering a sub-device node isn't doable safely currently. Addressing
> this properly requires much more than this patch does, and also I'm afraid
> this patch isn't part of properly addressing this either.

Understood. As I wrote to Laurent earlier today, I have withdrawn the
whole series: both patches only narrow the window, and the real issue is
the lifetime of the objects, not something more checks in the file
operations can fix.

Thank you and Laurent for taking the time to review it.

Thanks,
Nicola
