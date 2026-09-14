Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435B049CF27
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409312; cv=none; b=rDVx+yRQe8YiQi+KR3QlJ3FpF4HO8TYj/qqoFpHiSGvq67c16S9jIIZF7TLtC1Fn7zDAWSM6uFPTFQG8Gi88uofNBkrQgUCsjDBi5IfHvSTS2pN3VHpQYa4IzbMvjqJrO8pPd5amK+vDCXtc0Vm6jn67uBtC0jQ3+XCiGDq4Qj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409312; c=relaxed/simple;
	bh=MZeHia5Sjdq+jl2QWpcNU33wRrn06cJxwy3XHGpOMVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/bGrWDFKKTUS+ppGPpGG40OCSNMUskbkVL7qujplHYudeda1zCARCS12PxAHSJpKw/aLvK1eGmUsFrvp9ZSvfyqil/W6GFZiNpPPFUqNJNSmGXDjS1HxSMdQDYMPAxTdklKNZNtQNfGLxEgz0YOWQ1qlGbQvhHoXVKDfsamxFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBSErzxi; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBSErzxi"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1232341f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789409305; x=1790014105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npapGo+2obRZMka7BZe1zrgegdn0mSsQ3mrLs63xQeY=;
        b=DBSErzxiOSzf2OnzrO7JHkpREcpm2ksOTkgYrGrJ3Tj6qFFgBjyoKMx5qzbLO3fjTu
         rE+/EBXeWpOfJ1kx+x6m7/f+B4HezJ4DBkyv0EKxogtaa3fhKLpGwjgWji3w+IEab9xI
         0jX0p31wqHYxot/wp/s5+A3kiz2Fn5WSm6RVcFQMWivd+3RyJH3UyZY3AIs69gqlBN2k
         XZQjtG8zyCuVkf3H8o5LXUunO/rLs9oKOct5Ms6G9lCctXAfgWzSyJI//5dkdIlC7DdI
         apba8DkWoeqtldJRnrMxzVwDdqElhlBDWpomnhdulwFg7op+yR1rOONgOFT2vNT8A7a1
         abvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409305; x=1790014105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=npapGo+2obRZMka7BZe1zrgegdn0mSsQ3mrLs63xQeY=;
        b=flp0a+OPxsrXysKkHohTXsc/q40zcT2bi5PY74GE/WZe02Tx4Qf357NS2pGmQGTzAn
         0OVl+sxQPIWbKigrWEbV1i/TcGFswigJU3PsiJ6dzf3ks3jxTW9SbV+23eedzhZxsUsH
         2GirzDPJwJ0JYZJPjRB0aUO9VToQyOq6tGRlQ9hKjzA/60qo49/scTx4vbOvOP0cM/CY
         ndJoJYqQyFPtaCbVTB58+a/IdooT+F/Zfg2ow9yK/D8ooD+4aiSOzbWnj9pNPqO3rbwC
         m2hZSSUa0fkibaCD2nTaECt8/mBjEyJ2h1z+Fw/ytitq8+lwMNzEMqdIwuGozPcDr/sX
         TKfA==
X-Forwarded-Encrypted: i=1; AKwUvBzPVfUGVoQT0vUXN8ubRBc8iyukjZGmtg+zNYNfN2VoaRi0fCcJ1FVToo45AO13Tz6ix3L1BfPuu43CgLM=@vger.kernel.org
X-Gm-Message-State: AFuF++m/AXKRjrRGcuRguPG7xSytHj1z22Ervzc+tBM1AZU6pRCitMe8
	+BcCzTWUQ9rX616CQMtdux5NrGeF2aVIdiNaurHNocKOFxomqyCklIRGLnj+Hrx3
X-Gm-Gg: AYBFou13lnGOCghu+9A+h7Vm1qVPpRGWrQqE/aVFXLukaAyPL4/EdKTP8bIjq5OoGIt
	VIXBBImUj4x7mRnKcgMRoCkURYa0e3x/G+iEms84W8NH2M9EDVm2sn5tYRDJMqX2dDsQ4fg42BF
	kiz52UIKETe2PS5G7vWf/ubrzSgcGMTFA+7t8+PDLZFerUeEf6pOKNo0sSySIWe7027+TfCQhLb
	F8jM2X2vf3beSNiU3mWaj6nmaX047Dpx6tZalNv3rej+dyH4XFkGJAlPxk0l0BOqCkctdBeneNF
	craifWq7s57E6GdBqhQfU1LQbPh/xZjNUWnssCs1gQmaAWAWxdzbNACIIxgXAJ1/dRp5q4Mwied
	d3s5vffsFGfaoU7p2NOF/4qGpp2s15MDuQRqmZQaeYHBmoGjGBQFGjyD6V4r+APJE3v2wdNfMvG
	9kekINnLmt/X2Q9Q2BidiImbAq+8Uu6hHZsY08RakJ+mt1e2ja99nRPccuDmxBQ3xwp9x28GuAH
	H839wBhb2mSPKEhTyQ+IkQ71UpkHp+Q
X-Received: by 2002:a05:600c:3484:b0:49c:fa21:e742 with SMTP id 5b1f17b1804b1-49e7a68c148mr52389725e9.24.1789409304507;
        Mon, 14 Sep 2026 11:08:24 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.65.89.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2717a6sm7069495e9.2.2026.09.14.11.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:08:24 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Mon, 14 Sep 2026 19:06:56 +0100
Message-ID: <20260914180807.150971-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906073932.24090-1-dmanresa@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260902142322.73523-1-fernandorimoli11@gmail.com> <20260906073932.24090-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Manresa,

On Sun, Sep 06, 2026 at 09:39:32AM +0200, D. Manresa wrote:
> - The sensor's 2x2 binned 1296x972 readout (a downstream mode, not in
>   mainline) streams through the IPU6 hardware ISP (PSYS) at ~28.7 fps

Thank you, and sorry for the slow reply. Your tag is the only one that
covers the binned readout and the PSYS path, which is how the Pro 7+ front
camera is actually used, so it filled a real gap in the coverage. The
point about the CSI-2 error signature being identical to the 0x2d build over
the same five capture cycles is also the cleanest confirmation so far that
bits 0, 2 and 3 were doing nothing.

The series was applied to media-committers next on 2026-09-11, and your tag
did not make it into the commits. I have pointed Sakari at your message in
the follow-up fix, in case that commit can still be amended.

You were also right about the property name, but I was slow and the
literal went in as 8e3def7bf410 with the bug intact. I have sent the fix as
a follow-up, with you as Reported-by:

  media: ipu-bridge: Keep the clock-noncontinuous property name out of rodata

It routes the name through ipu_property_names exactly as you suggested, so it
matches what you already had applied locally when you ran the rebind test.
One detail: the dangling pointer does not depend on your series at all. 
The nodes are already never unregistered on a successful init, so the literal
dangles in the tree as it stands today.

Your 1/2 is still the fix for the remaining two, the link-frequencies values
and the lens-focus name, both of which are still literals in next.

Thanks again for the review and the testing.

Fernando
