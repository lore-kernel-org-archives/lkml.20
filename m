Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38827446821
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932348; cv=none; b=NkA84/PIBZvWecyV+ekjOXOvQTILCHB7+luiKGNCtFY+1nRipqo4vCLJgVA1mG7IKLPTLZKo7HRInSXzYN9wQsnv+tTfbdBa4W+bZkKMcofvRemQrYiVBWagS/dSrlkI94v0V/Z2hKQXDmENfBKiSDnhy4M9dSQ6eiFuiNCfS8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932348; c=relaxed/simple;
	bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AY2JqJvVIzoXUmUYckTIZj55+lrQcllgf42VIqFhxCETNxpUeeMaquZ+2Uei3Gw1PS5pc6C69QNVYZ5UUXvAWmKXUpBCR6mNE7CweRpoqsCTKnm5nm0qOVY1+mg1VIU+X5LzfViQEwcfXgKlUY0HrJUt60O6iVUONDPL1YMlbM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUlOulem; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUlOulem"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso35290645e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932344; x=1791537144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
        b=UUlOulemOCwBjHF57moMGSfeGIyvCpB9muYs3CRfcO9zkKbV3np+EIF9OgJLX/xTFe
         iR6veeyd/YpAqFBCkNa0nv7VPkl8xYgmPAZTYfWcE1UGws2U2a5+pwiaCl4stJQHeuei
         l8wN+krXoXY0ThC9stAutIDpTbZjJxf593SRw/6lBpnhZUd9cQkwqjuG0wFYvO86tA/+
         aHuEpBtQKhdJBzmjUvCQ+C4suL2KhxYs/R1QnSJkOwMz1q3+pWwxEH5Onp9ULpPyIeeS
         rZCSBpL+RNS9TXP4tUeF177ziA/8aNGcyfa5hYHhMLfU5MSdpwtSct+tX5eig5Kb2Bnq
         y3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932344; x=1791537144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
        b=TYej6d8bk6jgUwUuMnPzb3Y9W2vqPz195CA6rxBcJl57AmcZ1u6q/YMwfJuxAn97C2
         CvXx5uaI/mJCVY2NUqBTVZqQVVy22377RJUiNb47hZcVIbNiC/wSjgWiKWPJc7BUkItv
         F2SxRWEbiQKijQXOqtJz7NylLtVDHotWgINRe12X5yOc8nSjHKU2wcpfFatahyRpHWHd
         14dtp6rPhApcqxGM8r9LFtZm7D6yJY9F0GnbhWdibErFGEWMjnaaH2eu85U+l403g9yH
         WR8KA6GMh318IopAJubfrz3oOyZXFU66P0lJ1y0EoVAaunknapwOiaavT3bMLRXxS69e
         N3sA==
X-Forwarded-Encrypted: i=1; AKwUvBx5xMTtvuqo0xUVF7bFWboMlFRzeeFmNN/L15qHOlGawCkQOgQYWbnNzQrxXKoyFkGwh68nZXTC0mG3tgk=@vger.kernel.org
X-Gm-Message-State: AFuF++lp9OYAztHyaDqYnpEvdaJ1Wwm6fftwVsv/cAYNaCscoisVf1wZ
	pMDsXWxbAeZpJIu8bTnCldP2aSV3/kUJzH2AwjDMhmIod2u5zMtjSLdm
X-Gm-Gg: AYBFou2eb1FrCvUny7kOu23AtSSPdJOQqMiADaDY8mYsQ9R1rwlpwpowLwy1wuoy2qn
	G02dqqVTXFfhVKq5jezp7u7K8tzp73ynbRAkgiJ7vC0n8CzHPPVGL8vcRu6VSiZu6OoXTbSfUkM
	LNf33XwTb0B+wTnIpT4Oo+ED9vSmxEC2sWVMDNELojVcKQL0xP67KYrXtkCsBcrQP504AFQKEIY
	a5Tz87CrFeJwXoynoIaniuHPnnaZsmlaBsIKijkv4l1Y2H4Hv1CEw/hSkiC9wGPlY4pWlbawTxz
	1pNornWvenxLCqGKiB6wYP6q8LyS3fY9OZ1kGWKJMlnIO2tfggQvcKcUy892kQYW0mrSg+/Tm8+
	Z9qjpT90oHds2MxnRX8ueMm3CYiAidw9vC/KoBdYiRNxOH0NrobTxPTvVI/TBXo2f5wL0jwP7v6
	TGXHhdcaSIIFPcIXOFFZ+le+ofaRC+clRTzC15vKSM6V6jv3ZRotDH914EMox2AkLzdsazAQF3r
	P94oMMtzi2V3xqJ1uhrZGoeM+wDBhhTGu3p5n50nV4pEN+4AMGv0H+CUdc=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a0276ad704mr41194525e9.27.1790932344110;
        Fri, 02 Oct 2026 02:12:24 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38307190sm4006072f8f.45.2026.10.02.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:12:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
Date: Fri,  2 Oct 2026 11:12:20 +0200
Message-ID: <20261002091220.534813-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar9wlk34f_aNlIyz@stanley.mountain>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com> <ar9wlk34f_aNlIyz@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You're right. I missed your reply before sending v10. That was too soon,
and I should have waited.

I will not send another revision for at least a day. Any further revision
will also wait for the v10 review and CI results.

With Best Regards,
Maurizio Casciano
