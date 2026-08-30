Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879E2C08AC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102367; cv=none; b=dQ8cXN9ws5Juh4HfEp5LTHPM/Og1xDmOh3CTVAJtuIp6tKjKGh5y7MY6DZj5DBQTD42FMVW3VJgYIefMd0VYHhQNkUf+9r4dk9KWEVKQgRQ1j6RoI6ZWsBg08EWmI6x1xMfTh6xxmKt0w6/qzHzK9OMMFS/E8icPmEc/eUTbESs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102367; c=relaxed/simple;
	bh=Whl5AWtLQfu0CVlY/27d81zPn+/1xmWN9O128g0xJhU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=kifRE5gmT9aOM1YliR7HSdvG1sLSzxEefj13y4bt8+JAX5b3Ox4VNI8Zfo5ksrg4WQZnAU8ZhumNcc7FFfdIA+ulp8QzfjHGFUH2zMdZ6QEZbQGbHY0vnDfaC/+ttqNG3ZdFbuHcnpk1Go6ClNdDI2GKfzanVqUZRi6uZuXiyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/LFkwkh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/LFkwkh"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3968e063f84so1804173a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788102366; x=1788707166; darn=vger.kernel.org;
        h=to:references:message-id:date:cc:in-reply-to:from:subject
         :mime-version:content-transfer-encoding:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Whl5AWtLQfu0CVlY/27d81zPn+/1xmWN9O128g0xJhU=;
        b=U/LFkwkhsZNm2GMGzbKw4Pc0O8nbvdyJMiqviJBbGbdJpB2n0bApJK6F8EQGzCyVNC
         cPKmJcIJ/efgNjKXNpRRde7Nh7ja47JzbjXGE0ZHCZy3JyVgMQvNohzL+W47bUgmdXtS
         HYR2tXvCVv82KYT5AmFAQl8chR0Jn5PS4INGgyf5pDPieXsvtv+mX4HFGHzdZLTBbn54
         LGfhw/bQCvL/fxTSn6i0YyAjKCaGCAseeS0TC4+rcbLtdtC1SmqHeoZy/gFWtYxuqLLN
         oFtdihCy15HalMGZpwENWCSjQorJEKJLH01DTqntMkm2dhjWiYtVwndUi8XxI2Y/nT1j
         Fhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102366; x=1788707166;
        h=to:references:message-id:date:cc:in-reply-to:from:subject
         :mime-version:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Whl5AWtLQfu0CVlY/27d81zPn+/1xmWN9O128g0xJhU=;
        b=gDqLKUI4Zo4g5dwf87K8tE008VTBOLHlKEylwTfGPwCXf5sw+XBvlo/5LFekZp/inG
         6ILp2rB4A/aDtld6x0lLadiohCyMUoBoWNL1bxHP62DFjLRX4frjzCPjIlIb2DjXWHyx
         oos9uS947Cb69TZHnvPpuZhDl87GYrsMgw0ab/0M3zefuvNplwP7mPC8Xs9c8I73k4d/
         5EgRMKd0dbDSkyLjIiW3dGINV5/mZcMaFb/wtNJ2r7jlHwoNFBs3wDPWo8nd0vePM1we
         RAz56mLN8x4ZdYGAWNsQpe2Wmg55mrfhEOj3GQndqpMZPSTzmzEaqKsfImMvJY1a0uXc
         u/XQ==
X-Forwarded-Encrypted: i=1; AKwUvBynd2ZEe7i0NXWvBfZK9vqwU9R9Vsw4nY/EhtSUnOKNnmBpNpgL2PI8wnIaNVDDPszFKbGySplTGbcisW8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKUT2uvz0TQHfdr+LzxXErOLogEtjeCZoeC1Tbi0K5kCId1ezY
	GKYZnM40HVKWgHc3FCvBj3CZJp1aeGbW95Qtho+3VS6hIjfbS1wmgTjJ
X-Gm-Gg: AYBFou1v+Mrmph81To+cJ3ZyrV+pFTgncCy5Eo8FQ0N2A32ifzNChOk2j+xK2NqoGKn
	OyRFJFa6YxwF9PoMXxNXzT7ivZD2aW7LEyAYonz/rnwIcJ2NItRhe+YsNM5YESg2qkFuhHa9Ese
	eibAuCa+3nAYKYX4kzTfCBGgt2Sx1BcovMRvXHShVh5IhGyDGn7xbAvHNyqtHjLaJkHCdf25A/6
	+OwNijcxe4RaknCwgZxGwK/imI0qGHbD7uLFBI7/v3rbfs0XQi3tVlI6E0kVEqPni/o0YjYvPoX
	Ogbe32KAWuVThRECJXy4qd1Ql11gn1b3jcNiD2medqzNlPhmG23rkmIfV6PQAf0l46zep+JLPEB
	MOn0GBPYcN8HRetKgKFaNdtKb6KZKZlFQfKuuwPrc/RTslrM6KaHNRwU8XixVdOHGUa6pWR+ETy
	5oBgic01pbMwxuni2P5KZvNwRhBeVIHAx8ZacHd0OmBU2UAxfHjrnargA49X6ClggqF1P37Z0Oe
	YuxZWS+iopTHEPnjrZX5uANTf1mSc40gUQ=
X-Received: by 2002:a17:90b:538e:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-396d0e20f00mr33757597a91.5.1788102365812;
        Sun, 30 Aug 2026 08:06:05 -0700 (PDT)
Received: from smtpclient.apple ([2409:40f2:2043:7abe:e5a9:be2e:54d5:bcfa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea80edsm16746905a91.1.2026.08.30.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 08:06:05 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 2/5] HID: hid-lenovo-go: fix the FPS mode DPI request
From: Aditya <mradityadash@gmail.com>
In-Reply-To: <CAFqHKT=jEGuDrR0Ci-ybJ-QZrr=0oejr-2hLjEKyvPnxUCvS=w@mail.gmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sun, 30 Aug 2026 20:35:52 +0530
Message-Id: <D8651095-5ED2-4749-9E50-D61966AE2CC0@gmail.com>
References: <CAFqHKT=jEGuDrR0Ci-ybJ-QZrr=0oejr-2hLjEKyvPnxUCvS=w@mail.gmail.com>
To: Derek John Clark <derekjohn.clark@gmail.com>
X-Mailer: iPhone Mail (24A5390f)

Hi Derek,

Thanks for the review.

Upon further testing this seems to be an unneeded (and wrong) patch and has b=
een dropped in v2.

Thanks,
Aditya=
