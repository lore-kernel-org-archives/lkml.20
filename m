Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943018;
	b=llfGjE2MITNDACRggEypIrh2O7MEU57EAQv2bz0P94Cq4u7mJU5KpZUqoR1PWiJ4MBMz
	 FosirLEu4GBnzjmv85H2b8ObbFksydDtTMR7XLijBC+yYr7Knkyu2vDW2XzTjmO90Nfkv
	 zj1A7emUqDwXK3phoIslZnnSrngTFnGVvFMWl9LTUd11MIqfKXcCc6h5W2n8ajq6iiKDQ
	 fGbd6i8puhsIQvJFB2PiEdy3D7WfUU/xYa5aQ4ovZimI5QeDqVsnAPmXsv1pu+aVa5W81
	 EFed4So7D+P1dpgFZ8n0z7QOeQlQsLTUcfe6PDWvQJ9f+Qfw/pox8MeXjrrx1h+N77Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1FUSnHVHcPId5S22oV48SA/we3+CcYQkvgHylRUM19Y=;
	b=xFQB4duJYOq8byDWN3DoiXFNye7wzVXF33cCEIjfGIekdUqbqWvetBE+VnznZcCjmKUS
	 Hqcv+8uilBRqGLavkAVufXbRceA00G8ntIPIzaalrQ8NyUT6THchV1lRvRcxdP3dXl5Vy
	 ePaNelDoGJBRMY2kFf5jk7TJ2rZsWt5aztIxOARAP0djAQS6uMuaa/I8/bQwOnCJYI8b+
	 ATlcIL5x75PeyhFUD0RDyKpbeJpUg8Fdmn0F1RAtFyASQZ7KRNf8qZIFwkN3Nnf/HvUi/
	 Dy8UEizaLCgKfT9J5RwadSX2WSsQiVBNdI/w1em+IJjT3d8OWKwKDmmsXGrGDGbt8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="V/j3H/8D";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E9D606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E9D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V/j3H/8D
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e10a70540so1255606f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792943016; x=1793547816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FUSnHVHcPId5S22oV48SA/we3+CcYQkvgHylRUM19Y=;
        b=V/j3H/8Dz5yLeU7UEx/pte6igWWrj/on7qHbW6xsFqmrPtH4R7BltZfiW1b5Gyouap
         I0kx84ObUiu69I0LcUakgsYPWtHFCjrz3lMO5DrzruR2Hj+2bIq7C1etkFPM6xVZLBRm
         mEqzTxOT2QzrZDdhOctA4UuYGvDwy55WIsHXFQPi+Ddq1Idm2XOMogZqcMYekVca1sxo
         oHFga/vBmUflb7OLjiIWxg/UZTkgO8O/0dKZXQ95Y7MjK8C0a9uK7EB9+P6woMmdjskO
         bxKGtHRT3c5kxjYaZ/DDcqtBWTdkehE5Uy8GefeOg7sp1pE5WAbLKdKqNDX9Quu2te0A
         CvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792943016; x=1793547816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1FUSnHVHcPId5S22oV48SA/we3+CcYQkvgHylRUM19Y=;
        b=kNEJoRC4AWtbNfMTlf8YaK96n+UlKcBQQtI5Pm7vovAgSFde0UNsrfolIj0dcpBFZr
         5/ZKZ/Lt0Lb20xpq8zkeD97L+PZlw+CNj/bKoLzXCDVDI3zAV1odsJi/EiCejywmCz6/
         HmWCpitQm9NLfalYYePv+5slju4ug04EfVxBj/dnmXeGnXuaYrcwB9zgkWAnUzxkRqa5
         WQYoUCPGiQd3IW2fWLQkBJw2uLINaxHC96iBPOEJzykYFBhJlaGr8oi3FdGYklVzEqrx
         q5LcYAdSqaAil/17PFcGPMETnPMgTKeT9l8mE2LGdani2Md6u+jAnsxGrGru0mf6hc4m
         CwWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmLrD+8ctXfYoHErRrP8euCLX7O/k1q+ksYZ9LBdruBCII7ywTS1GFriP0B+qJ5Ntwi6IlV5JYVDYOWWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPrzppwMksBfrCvwq9VBTJSEnbFs/MtgrfzDlBXGgH9fz7SYGa
	GEpx9y/wVIYUvNAHWpi+BOS5rQmsh1A2lid6me7/V4ZPw2JFNZOQu2NNQTxf+RmA
X-Gm-Gg: AYBFou3Hmce00qOg4MhQywatpFXWqDRITaUlgjCP6f63QPAQ/fDGvggbjYG8gjShpSt
	37EkXYcM26+sAMR3Ep1FdsJSU82woOai9ED2+ZtWGuC6g5LTcSX/gSNIkonYPhJai4WegrQp2zj
	GnA0LWxdcvDTg4VDMpIqPWckOttDRvGB5AWItrkGcMBXw4tif/GoweOI1OAye0P4ZX+YC3aK6W7
	58j75eFNvQtpvoK1xEDRZTBgEqveitpK41BB9me6hjX8iWtI77cQw3HX9uaGuZgZ6J7jBpbmi+s
	CRBufm7zXVR0zFYWiyNgyzdGKweIscjWbKJqQJpX+jHLspBppDKwKjpR2A5xxFVxsf8PYMG0U1e
	tNUwldREExBM5zINJp+dB0y/i3731Cmrzy6D57q4LKNSDKiPm8no/RJ6CeFbcmdj1lJq2esa1LV
	SE7/r6G2SjbQq7uwMAPGMDHNenkQDodyfveEEPwR6/nCYz0FXkjEHoOgahqeZBkg4t5+h5j98oD
	W9BLdT+zXXs0QZHMQ6a1THpFF1Mp+7aaaNYoKOmGw0/AqXQPlPO5j7U5pousfKHWZIcbXV4qHBK
	xIKzjyPt47Felg==
X-Received: by 2002:a05:6000:41c8:b0:48b:677:f80d with SMTP id ffacd0b85a97d-48e3eb83fe6mr8660776f8f.26.1792943016228;
        Sun, 25 Oct 2026 08:43:36 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4bc5sm10533498f8f.34.2026.10.25.08.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:43:35 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Simon Kruse <simon0x+git@proton.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5693: Support control events
Date: Sun, 25 Oct 2026 15:43:31 +0000
Message-ID: <20261025154333.34707-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010142042.23253-1-simon0x+git@proton.me>
References: <20261010142042.23253-1-simon0x+git@proton.me>
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

Hi Simon,

On Sat, Oct 10, 2026 at 02:20:54PM +0000, Simon Kruse wrote:
> Tested on a Microsoft Surface Pro 9 (Intel Alder Lake, IPU6, OVTI5693) with
> media-committers next at d7e7bca71. v4l2-compliance 1.32.0 on the sensor
> subdev node: 45/46 without this patch, 46/46 with it.

Same result on a second Surface Pro 9. With v4l2-compliance 1.26.1 on
the sensor subdev the one failure is the same subscribe-event test:

  without:  43/44  fail: subscribe event for control 'User Controls' failed
  with:     44/44  VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK

The front camera still streams at 28.64 fps, as without the patch. This
machine runs a 6.19-based build of the driver, and your patch applied to
it with offsets only.

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6 Alder Lake-P (8086:465d)

Fernando
