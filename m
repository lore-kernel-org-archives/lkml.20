Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F7C2DAFA9
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735456; cv=none; b=eeOvbRVOlpFXFh0blpPawbZmPytCwOCi+AeQh6qYXz0A08DKJ/kTtZnKfCLjfOYL0Mouu6WlxpehpUEfd6HWGZidXKA2wy+3exryC6dKaC3MIyHBjaD4hfhkukDUiCuV/ni7WRyP5G3I80M43KhTkiLZc8Ux/U6fuCnEyxdCw+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735456; c=relaxed/simple;
	bh=mYHP1i0YB7oOLKfMJTS+JLnqxINc8T4sPhpgL6ZDkeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJBPytTnCll/NaGpEnbxHzyworcLz0RmyVPb2EQz/co0dH4ezetDtkkq/WDSUIEIJwaLo4JkmhhcF2Qr8iNmwA00ytcmbq4yjXhMaRHLGbJE4XKkPRoq2mbjbL2L68p+qCyGqVBJVQyzDERHgyMaEu4BpRkW3zg311uSLXjfxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icywRbdw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icywRbdw"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso156665266b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791735453; x=1792340253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYHP1i0YB7oOLKfMJTS+JLnqxINc8T4sPhpgL6ZDkeQ=;
        b=icywRbdwLEz+FSyUoXydfRCRkpZvnKiqsPAugOOvLgvJ1HlPD7gos8cmR4gV7frbrN
         LxJysJ1Q7MHrldTBrJn+OQci5p3UdWmcLbQdRLGPlZUYRToxl82UGU7gWhPC8QJW5bT0
         avr/vv1cXnRpeO6ATbq0SKj/+3dx8gV0sVT6VSgSvDmAkijhm9qvGgjLijglvMeiorjk
         pwEgOnqdjJD+h0UJT0YDCSo+xXL/73/75boNZNnKTvHWN3K8lK1L4eIWZCpPuXG9s0Kk
         4KpdIq4+WwjgHNUGZ8J/8aw9Gbo0aUV9kfFovENC3VjkANm5cP7Tm3412ReG3xzX+abP
         PeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735453; x=1792340253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mYHP1i0YB7oOLKfMJTS+JLnqxINc8T4sPhpgL6ZDkeQ=;
        b=Yri2IL+gr5VnXuTPxttrCNb855Z6S11PoHn5THjfn0I9/oahIzbrbi0iwIyzjiPB4h
         65ICRk0vEjtA/RsounJ7U1hQCAcy9Mio8xzBlRYyHN+iSyqzPndWaaL0iz8VTcPOuJT/
         m9n91L/S1djBRFJHROmyk26S3N/Y877WJonJWT1KLHaCHTXP+osLUXFgQItXAq+u/zpv
         R8eWq/xtVvSFFbxSsTDFIibl/ZYeeil4oSsL4vdpX+d+RjOQLaTsUenO0YiyD7yGTxQ9
         z1EY5BnhPAMvabVbOduE/gyGn+OIvMm+Fbw5vREM5k9OeZMaEBrft/dVCWF9RCsaZSc6
         sUYw==
X-Forwarded-Encrypted: i=1; AKwUvByEGiuFZcEYBbMFXwxlCtcu47tXl9qDH52I0b4cUWd2EJS3adtTkGcCyLbpgte1rjCwJGnDliXFqbiXjqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoX0PvUv4dXqeBa8W63fxtb4sFAJ4aLzt93zvph9/ctEGmJ5Jr
	pJJ+HaRsSSo+xTJONcsvB+UHBCazLmOmyfzmz1RvlxsFtbTMP1gn3poybLoAAjN4aLU=
X-Gm-Gg: AYBFou1VXbjl8mrJ2IC+yDQhwqUiLC8GQNG9jxpHDacKpIn0x9m8ssWBjjnLrcqTGwR
	QktjpZ1EAZPfzkzV3Y02U6R4rOu1EBVs5uNkc1rCIRQVyoMiZUIwmVGev+j5LrHHm7HmCD9UGXB
	ozhVrVAVapIgR5LgmC7keCRfd4YPlxbueW9m7bRl7SFYqlL0gNnkvtN1iLZhQFs4j9bKjiFp7mg
	Fc254nlIW52BmNw2ZUv6HkSosGUETCh52L1CAP/egmxm+E+47wPRye3V08FwE1QyB/k4hxk/+yE
	88XJJ3r1GrHalSXWV17vAvWQvyzHLqVFZyDY3iDOTgSG6G/9kR/Ux8TmoxMzBjeqrLfHLmv8AG0
	WVG+HNp7PDieL68JmeK2ViP2yAyjeeUu4h3PktOEHWHmb4PhvRDTeXgFzpL3ePo36LOtxZmnRZR
	65t06rlJ3eG1hY+IKBv6oqU3dBEGrXP4u0yr/UO/aSviOd1Uc/6MpXklk5zk9FeIu4kOesLPYQ9
	hPzKMCqXV+zPmTN/F6LQzcKpgiz2W/lWaRPHIvB3uaHdSx/9g==
X-Received: by 2002:a17:906:dc8c:b0:c29:555e:bf2 with SMTP id a640c23a62f3a-c31a9fe3cf5mr692093366b.41.1791735453256;
        Sun, 11 Oct 2026 09:17:33 -0700 (PDT)
Received: from localhost.localdomain (host-188-122-3-146.finemedia.com.pl. [188.122.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3805bsm373462766b.16.2026.10.11.09.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:17:32 -0700 (PDT)
From: illofspeed <illofspeed@gmail.com>
To: dlemoal@kernel.org
Cc: dm-devel@lists.linux.dev,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dm zoned: back off when reclaim finds no destination zone
Date: Sun, 11 Oct 2026 18:17:31 +0200
Message-ID: <20261011161731.394-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8d1ee370-2785-438d-9c5b-8363584a23aa@kernel.org>
References: <8d1ee370-2785-438d-9c5b-8363584a23aa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Damien Le Moal wrote:
> Patch looks OK, but is "ilofspeed" your full name?

illofspeed is not my legal name, but it is the name I use for all my
public work (GitHub and this series), and I understood
Documentation/process/submitting-patches.rst ("using a known identity")
to allow that. If you need a legal name in the Signed-off-by, please let
me know and I will resend.

(Resent as plain text: my first reply had an HTML part and did not reach
the lists.)

illofspeed
