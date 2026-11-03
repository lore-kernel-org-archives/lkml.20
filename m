Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718069;
	b=wpL9G9gKImkCcJ7oSAMeZ5ZXZ8+L19oQUSTzg4w2zz1DzlvQJoXbZBS7zLFfmom8MQCY
	 tTGCWZz6qVGsZYi9xbSEHIB24vqOal4xs79zo03Bg4fK9z0bsmiVmu2vrQV95MpGQYRBP
	 do+Mgzg4RiHruD4qPKKh1sPcGDd/6zk8TwohgI+850a0gft311O4B/qJvIhneAVeh8nbk
	 38xXT7NijIeGmGAIVOpznJ7QMBJcMRMtfyPFgtcuQzp+iJQFM7nudOo4H2AeDExzKwkAq
	 Gv5NMH1ttBCWZ+O95c1t/OuwXJ62dnozHW6u4lL5sr8CvcZJhyIsWjMILjcvqfGfCDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oarYStm9NOVDCd7EiAguOaCoaegl4vfok0wEv8pYK0Q=;
	b=cCjm2lTjuCOhY5QN7xZx6z1IUBg7sQvcQFK6ELRrMSjEQmgtbEjtMM+iXbAr/jviyyo1
	 IYojT7wxkz+h2Y9l+Y/YhJQLbUYSgllYUos0fov5q7sgXtDlVhNVBB4krFZpS4ai7VIsE
	 OWw6bb8TdRomF/gYNFzVthVXEftW6Uy1PcPhiy9WqEdAIIwACLSjg9rhkR6Drz4ej0R5U
	 mOrvrNeguAzrZJ6wVlNB5BrdbI79rki6A+i0FeUZCqNLX0wX2oLwN4PVOFlQ4TtaLMCFM
	 gxhRrb7/NaX+xS5R/remCFYM8ea55CvyB5lofUs0ZqxUW2QXFUPSrBaL3VmT9H5Q28g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgcBUlaJ;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765BA606D837
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765BA606D837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hgcBUlaJ
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b1ce85287aso2211865c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718068; x=1794322868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oarYStm9NOVDCd7EiAguOaCoaegl4vfok0wEv8pYK0Q=;
        b=hgcBUlaJtErrc3m+uUjm2gCtB27SdD3Yc7Nf1T3P0f2M/naeWrNJCeVUCtzqHm4UbJ
         rrmZxcSfhdtaZqrC0CZXD/WoiHcwOlQflvcLc8UWDXBwL9dFXpbENBArZrZPdXAhHkcJ
         s0UWN2q5qJoDheZztFWaOBfvmjk6KmRriNiuYsYFAjiX4+QHf9/eZPMSY644UyAmKUM8
         s79hlNFRSZWf8HGTaDZMsIKRhFBFzrA5tJuV48XXGOgEkF6BO9eKwZolDx2E/ozalYp4
         lTk8CTHbdsCB/ytc9eLJn5M1tZ5JvKUdwoAXblyrRpN0U65r44J91sIyvrxBp8QZturn
         V24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718068; x=1794322868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oarYStm9NOVDCd7EiAguOaCoaegl4vfok0wEv8pYK0Q=;
        b=hO0nLH7Q1Rr9nBb8wRy5DFmIXEfvmXgJYp6YrGRYi5sMD7jEmehtNqps3Yl/Wpwg39
         TVgiCKFL0NEuR5+zQXi+Bi1Bu/x1BfvugDCTa+25gAqa/XBnHmBp1kJ172yZFkfoA0DK
         6HB+QEkNNdtKEiEWQrgyFMvmHy5mgspdaA+1reAdFyHVwNg9Rc276hzJ+DsgGN51Yr+P
         9wqASxIp3rxqYk6oRuBNrZhfD4vwX4QAaeC6k+d6lmWCCKEKHtgE6VYTNsl/bDJ3xiuH
         euqqg3pd+2iawWzCQVjjSOswN01v07J/7iaYpQvlN680UL3kquzM6/sSq0XFLdxsTJiY
         CYZg==
X-Forwarded-Encrypted: i=1; AKwUvBzFu46IIMdUMEinSR1+4IXGlcGatACyyhaFMy0pBBHAm6feIdC5FBBGHIDTvhALzScZARG24GVJha08Jzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iKMjdx5v4c0oUbFrIm4ynPERGNydf7WGKlnaFZjJtgj3S2RQ0
	M/GRX7oSGljpa7s5fbMjoeYpN6CzMq5RZWi9KIWeg3GSW5cMFC891u0=
X-Gm-Gg: AYBFou31Oj3w12QxcjUofn9ym1JVcnVCSO8fgD6yEBdPC+VApCEJ3s9WXJkFCGzg5NC
	AAdF4UvrELXOKW3b9R5kVb2hx6SDm7+3eRC350wR0tnVDjdEVyFvYKdRKMrAs6Y5Fenql0J6YE5
	ZxhXyqPkrWBoxq3J9eFxujDtT7Qm3ugE2s+hEEjWUTxw6oMLJUtV/gJ+VdDb/TyIR3yYZOVibZq
	WPNJkQrD3Dn25Vwk+GlxVRfX9Toy2BdmQUo8aasE6TbmC1955PI0zDD3YOLWzW+PNrwXOkMOGfq
	EsAMf+yh+eXnTvoi8ttStk0qT9/szNQe/leQoG7NjIkK5svWbz8SxpU/tRyECrf+H5aVbWJAug9
	dLzlJfG4jmPXYa4f81lhjasfdrAtwGKvuvcpiJYo41QEdOKrThY4UKd1+FdLreITRWa3AsNZ2Fz
	IxmNlBNRMABjSlHnxt4d9bcfdNjs+BNtTdW8CRU4DtXdE06rSdoqlRpv/UjImXAtEaSFKNzwAea
	zkBMA8fsX+RaxtXP+9iTCg6TznUDzzRNlnBmlm2sSVVdyvY1vx+w3QApPzU/Y41JRBENq0PraZ0
	C92afZuM0GVTG913Weks3zO9wB5A2/H/S2O7VXGbwyfeoNfK+7c5dUBRdRhwCg==
X-Received: by 2002:a05:7022:3f0a:b0:151:6e80:ba7e with SMTP id a92af1059eb24-1ac56c9ff26mr21254345c88.4.1793718067762;
        Tue, 03 Nov 2026 07:01:07 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([27.60.19.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9693232c88.4.2026.11.03.07.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:01:06 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	christian.koenig@amd.com,
	dev@deq.rocks,
	dri-devel@lists.freedesktop.org,
	ed@aicharmers.com,
	kenneth.feng@amd.com,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
Date: Tue,  3 Nov 2026 10:00:57 -0500
Message-ID: <20261103150057.1227-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
References: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
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

> It is the same issue.  I don't want two fixes for the same issue. I
> just sent an updated version of this patch expanded to cover more
> macs.
> 
> Alex

How is the problems same exactly?, Does initializing UCLK later change the
PPTable?, and as said this is not even a solution for iMacs, so why are we
still trying to upstream this?, and btw initializing UCLK later with 5K,
makes it not initialize at all, so the patch is just wrong.
