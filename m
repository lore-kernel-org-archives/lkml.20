Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588950;
	b=uSej5XeiQsXJ31P2UZEerCQZsRoBVPqF2Zl9AqZC6AX1pqCkxCsP06yETQjerob9lJKV
	 opH5O6X81m/bdyru1qqCIDEt3rVs+mFvH+WiDBldD4STbeuXtDNJzdtk2gvemXlIhenfX
	 lTeKj0eUInoTfyRtUzayUngA98NxFOkJU/jT+TUJh1dLRAUwI6Q7NdIPyPG7wHyfiO232
	 CQR3Xo8A87F3hYEyhr7sGGHamovWg2sZU1rfivQAUXv8hgmmRLg72h5mBuL/ULGMEF0N/
	 ghFsXxlnn0Jl7nRc2nkB097yiUfmJBFM26mRB+jAbveBZ72cwrQu+9hk+LlcOCrEOyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:
	 Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=bIMP8jNFFB1peruH3u61FGraPOS4DTGULCeahYfBcAM=;
	b=5phOsJ6GrRCVJZT3IyvIpaIVuwKC7BcyzjJt5/qo7H1N4BZEXrjp/ga7357l+7aFNWFk
	 2coOBdOy8hDPZn51M8dk1EOBXuL1s85VudlBRJYTrnykmFmiRUd2xHBk1R+8x06pISX+w
	 HyxEY4nyPFGx6AsPiOY/3NqrxH3pC5ZXUMUGrV6tTtg6jADULvSq8b+QhK1rhHOHN65ll
	 At0NQZYu7upQhyE0CqWhGXQja/YCP2mYz3Bch+8B94M0KYzcZw0lWFWbnMYSo3BsF+rwt
	 ao1LI6eEjMEEYPSsdN/z4m3Fo5lA7UkT4/S+G4e/nrhhTeCFvo89TlSWYWR1Hssyuyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=replytech.co;
	spf=pass smtp.mailfrom=replytech.co;
	dkim=pass header.d=replytech.co header.i=@replytech.co header.a=rsa-sha256 header.s=google header.b=IIZLrzL+;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C28C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C28C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=replytech.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=replytech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=replytech.co header.i=@replytech.co header.a=rsa-sha256 header.s=google header.b=IIZLrzL+
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so444352a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=replytech.co; s=google; t=1792588949; x=1793193749; darn=vger.kernel.org;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIMP8jNFFB1peruH3u61FGraPOS4DTGULCeahYfBcAM=;
        b=IIZLrzL+BH9lyS2Y81SHzmdDjfWGjiuWmGkNg9EBJs2MhSS+PRr3TfY7xz/YpE295p
         FCFHma3hJK2BQkVNgkc9uDhEd8HgTjGw53HB1dKzLiN/wsxw8QNggbouqcioMAMLcUq+
         y1ukkkX7W5mnP41R4fjk2/afiijwtY3G/4VVuShCVE9VmJIN8XidelIJHLckyvxE3CYU
         3ZvohzrqVcmaBKKQgCoL2Mw8vWcDb7LP1N4lv/s68qriKkNSFEsNZ1H5xNaNLeO4MVse
         RJKxQ3JOmwLzlZAS0cCHAqNnzuDEIrm2k4E+VBs+EF5XILZDM15SZCupkyFXCJ8nguIg
         OuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588949; x=1793193749;
        h=content-type:mime-version:date:content-transfer-encoding:message-id
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIMP8jNFFB1peruH3u61FGraPOS4DTGULCeahYfBcAM=;
        b=DdaULNOifQ8KY8pQ3D0U9MIsMs+Eg+YTlUbmvgYZLH1Az5n6tM2FvKgp8MF846+HUj
         Ykp6cC4TYbx9i9xcxPpyL36PN1c9zPDzC8jfF0ofNgb42EkUZJZ2cE3h5oMuInu5fexK
         Niuo0Yj5KHpWcBT7+NgS1+/uYe2nRXvn89hBIUWyP36AXMdHuC068lrscZbNygfMzEj1
         93hY6udBiKUzgx5P/bd4MRC3oULOWlzZhiqU/GaiRz+/gth/JNGz4ykPGB8tr8P1KLoH
         JiOnPvudmAtAs2ojhstEqT/NAm34vxuN3Wdgt7TVlKU5vcUKAXmzqnAuIxcJGrJy/sIj
         7/aQ==
X-Gm-Message-State: AFq9FYIlSVlZOKPNIaPyNT59uMONffT7XPPxUrdGeGYW+8VkX859Q0zY
	x2BUAsss6vtCG5/4geZhgwTCqNdCrHGSlZdW74fKJFjc0nqsO8yfmyCnvgkbU5+U6pfjBB/2wPP
	AyC0uQg==
X-Gm-Gg: AYBFou36fgVA95rJQVHxSU/CAGD7VK7fXLfQ53VujB93kgzlFd4eGYOTS2cKv/5zl/w
	rhU5r4Z9rH3U+jHBZmXd/Le5GLWQ21SGU2heywHs6x1EHCO7lHWuTFfDfCmlzcbGi4Hx/8MqrA1
	+0xnu17f3fLShVTIejUXwaUJ900KkEd9CfJx+1Xa6lgARWB5Mbaze3q4R/nliqAV+RigUqA4YEe
	LtRoFTY8udFjhAxnydjgs8t3xsW6GS/x37xnSD0EVma1E4N1oxGBE6g3VhJzN8iQtMUSf3fSpSe
	pshD+5+PZLNx3c0a/rnO4HStA6sCdtZOkXi9Pz0aoeSfYSCChRBr4zz99KPUpH6DJ4OvzONWFBg
	HOv2rw1rnxtfS5dg/qy1cVdnugq7fcehy1EIjsHS7Dfjfa0c65WlIpBBgQPNhDywT3Y9sSkSpdN
	+lKQrzOKYeRTLROWZdvIDU2rnu5BJf8zHNR0CbIcFQFIETqsPFjvH3YDCDAVkF6DxJ1jOH6RcAI
	8DOnxH51fuxllAfL+I5mwd5PePbeeyB5Ys0tj+Q4EI21duGAOvnzrk2Xqrd2ahG+IXtXafYDA7Z
	XyvdRR150dvB7Pua+kQmv5Xa/K+Pm62P9PF0drLF+hTEuZo=
X-Received: by 2002:a17:90b:5249:b0:3ab:e588:c278 with SMTP id 98e67ed59e1d1-3ad86c79ee8mr1800155a91.17.1792588949343;
        Wed, 21 Oct 2026 06:22:29 -0700 (PDT)
Received: from replytech.co (ec2-15-152-27-146.ap-northeast-3.compute.amazonaws.com. [15.152.27.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1917737a91.3.2026.10.21.06.22.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:22:28 -0700 (PDT)
From: John Brooks <john@replytech.co>
To: linux-kernel@vger.kernel.org
Subject: Publishing Sponsored Articles on somoslibres.org
Message-ID: <55e084b1-365f-48c1-88dc-548319021338@replytech.co>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 13:22:27 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8

Hello somoslibres.org Team,


I hope you=E2=80=99re doing well.


I=E2=80=99m contacting you from PressWhizz=C2=AE, a marketing and SEO =
agency based in the US. Our clients regularly publish sponsored articles on=
 websites relevant to their industries.


We would be interested in =
publishing content on somoslibres.org if possible. Could you please share =
your pricing details and any guidelines we should follow?


Also, please let me know whether you accept content from niches like casino=
, CBD, or other restricted categories, and the pricing for those placements=
 if available.


Thank you for your time, and I look forward to your reply.


Best regards,

