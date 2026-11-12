Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794484209;
	b=u05oVmrCa1wF9F48VZQbpGTHsLDmIIZ79adjL2okhyYdiG6P2kJXS2L9M7Z0sFsbUg2O
	 650d/F6lJqqe5BvWF/cqG9gug6vwei+GAs/i7eU91dosFe/M8ZQPMBVqnmGGeG/FweiB8
	 S6VYLmoL0acrWhNEdiq4CY0neIlDWvtDKGud+nYM1pFMIx67kiJKmzUcAloNMbXEIXAI9
	 RhNa0CCUdlQkJIcbktXVb21a9/WYsXpHzCXaS8FlPP8dgvAFolog+wp5bWPfDtQnnzFTO
	 bIgSOpHBEZ0NbWICoxKKvREVDKTqjDaWHbM5ldWkKRr3rSmmzG1n/POmsW5Ky1RphTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PW0k9eDKFqfRkgSsOSdWK+l0uZcCJyw9dSbPkXAxN3s=;
	b=3+8wCdgiT6P9Nq6RPZJGNMeQy9Mp7x+YG4Mmj6LUk02lrQbWwf1F8+9CVTTeZcAD0/ol
	 GMTPPAIzV7O+so9nSJAXXAZnQnLXwPS1mKvK/pLEciWJ07qp1tfsycDocxSOQghTJme1E
	 FD2QXy01av6cuT7iATuR4ySi3fL+fA3XQ5G4J00HnNAMJBukLfGtrN4tc4osS55SqWY2W
	 AbOmYSAqtALr/OBWCKqm3u72eADVmpI2a4binjDEbkXRkLCUdqocTbtYpZVG2tJ708ZTV
	 Yweodjx3cfEHLBtmME5VkOlQuS76R0omMO+xoYIoxGIiLzNitJnzK/qFO4cK9Nn7KWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xG1K7a11;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.72
Received: from mail-oa2-f8.google.com (mail-oa2-f8.google.com [74.125.231.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406C5606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406C5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xG1K7a11
Received: by mail-oa2-f8.google.com with SMTP id 586e51a60fabf-4ad827109b4so845352fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794484208; cv=none;
        d=google.com; s=arc-20260327;
        b=IhMJ2s+aXWeNOk9X1cFnP2ga8seca4O8LRzTzMCN1L9cGZwUiR1XIXc0JUp0Aoj+iJ
         STVBABtM9es/WmdQICX9D85N2CGXljuSwt5zRJzkWC3H+/ysho0jild6MTaiI5+bO4xL
         MfgX8u7px65ISfqgJk1wkuwMzT2Zo/yL5TQU3ZMUnRm3aPIalvGys5nfbInYne7ig1Fx
         2JkjQheSkMGGtYhbOn0ozkHNVoAdsN/1Uh8wN5ZEjFWhOOznCE4DPu0gIDvr98ZqWX14
         i8djNhMVh03oxCWKnaRcxYXwqDba4hl4/YiZsyKwPR+KIN+PWQS5QxSE51RiFFxBI4E0
         xTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PW0k9eDKFqfRkgSsOSdWK+l0uZcCJyw9dSbPkXAxN3s=;
        fh=msHq2/41vZVNpjfNR3sjIZUfNERAtfndXFECVxZoKsM=;
        b=ROguqNOhFbXElcoMGqxHvrQF4aMFhS/NCs/pyoAlTrtZBTXVhJ4S/+/m70vK3WsQsO
         ENvuJKYaSkll66EtDt1Juxdo1dK7VlSUOQEo34N6II2ATtvpaBemYszE+QL6PVfAmV7d
         Ywycf5s9wcdaj75BsYYTlxa/ivwVOMCzHkaVWkSLy/HpzQMeDeZ8MCyX3GxQCZtbifB9
         QXrO4g+pmmtWf73mUTJff8NzTFpJjRKddf4d3z0yz+v9ktgG4DNC0aX+jZTVcdarEaBf
         UbR+6X7z5f6hv8pClqH1P5l38VMMYLDzt4EzF1lNnLTm0FXO2Mv2B2NdY9jWhaSO4xK+
         f4iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484208; x=1795089008; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PW0k9eDKFqfRkgSsOSdWK+l0uZcCJyw9dSbPkXAxN3s=;
        b=xG1K7a11d9nM0ZS0KF/dC7iSo7rQARxxJtnwLOUnbxB3uTUzJ0qcu3YUKZqpyl02IB
         Y+h1pQaJfto/4DkmBqQy1nkNs6G6PbSZW4JJ/Lutm/dofhGH1vOlnHsDzd+3GJu99ont
         AjJYIkopoWi85nv2EikKCDPAhO+jqrGdpJM+polyB2Nst6ec3oqEdeOvSJGn/4kJr3ez
         Jm1eO/09bTpMgxsHPiVkMiU6jNE434ysOKf9b8SzGBkMUNF/4b8SXDwjrpUuMhQ5/u1O
         sEPiRGfTFv0HfJsAndb6YbH+Cf0G7msnkevuX7Q2v4X7gJRHwO5UsMio7xST1Gvec+wE
         g45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484208; x=1795089008;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PW0k9eDKFqfRkgSsOSdWK+l0uZcCJyw9dSbPkXAxN3s=;
        b=zXNO8gPRcKi5k4fAl+vE0w2pi+LFAmLjP05K1OnbBJw5ZUg2m1SaXtKWmGMv/zNuQS
         25vVj0kujvutEgdo9+POhFa3yaBKAuy8Im3WEj09JuNDWP6L+g5dc5+2qD18zT6ydftR
         RlMdRx68zmRU9H0rrGG1tLO680yGBIryqHrfQkwuzt8LKbWx2qzzZcpYzWCKtp4yOOZ6
         zBGSa+kyumMYkrnxKkcn4lk2OOYSOt2hleIgMhwVoWJboLTeG2+tyEuM8HjrLDxSH2tQ
         fg5A2dx+XBoNDxO7AHxBYl/y1DuF3MQHrTbl1/hjkjpYgev0d6jgfXgE/sRAoSUEexJ5
         W9ow==
X-Forwarded-Encrypted: i=1; AL+hErGefh6DwjSndeE4lPiHNyG5QBv+anvckZW4G7iEqsQ9AMPXgQcTk2GvcT2wyjDdZTSiBRQg9nw0S1KnOq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ibFb1/ogXTX5jfX+aTiwmud/L+xZgQxOII4KIcKh6rmhocxEY
	AJKbf7Sp1hkPAQ3BGCuxTMbnEVhcX9GPKJQGl2nGNB07/HRr657I/Gv/yfcsxZQPMMVAoIUUpen
	boHYNY2nqyZzOhmdehkNUvwpdLARsM9c=
X-Gm-Gg: AYBFou3/hzIEuJWHzow+A8tqrCNKHl0KjXBBxo70F8RSKQYc6OuJQdvBGRHU0pEfa89
	Vmx7wXIVVjQ3Py0Rd4ejYiYvCx5qqGidyM7tTfRwAqfi3C009HSh/EladNQA1yOAtQ+mYzD2v0Q
	Y5JnivN40vxRfVFoQuGMOvhDs7w6euf3mdSEqD9Ko5I0tmxZo+5iop8UpKGHWNmpDPsWcD0vRlA
	klqhlxEjPPVB0nwSLFLnwCijbIr4oKk37jTidppFx7SCrkYg4vuWwzk3gqL3QQW8yfyJvNb0O5N
	HjDxQMCrCfZUYPbNE9jbipXNm5E7jf/suFT4y6FtphGzw//ry8k+tHuzPcjdaALFC6LriBigVW+
	fzCeCKmYQB2glQNDkl3p+uTlgs0PM6jwjLHWbSKzVv+pnLk1jKzbRrMMjgwNMWmmAgAt+pPyJcv
	0D+hEdUlXQwTZZkWJ2KwV6IeyO2SUARgfsBQxRPIAgnq7+y0MA+mmF8WufnyiNhQZJlJr18/Fr1
	Bo=
X-Received: by 2002:a05:6808:250d:b0:539:dfe8:9960 with SMTP id
 5614622812f47-56b97d2052cmr4847599b6e.56.1794484208172; Thu, 12 Nov 2026
 03:50:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>
In-Reply-To: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 12 Nov 2026 03:49:56 -0800
X-Gm-Features: AclHuK99jfCHnUnNfvAVzgTNdsDa1C0fS3B-XZ44SaSca81MyWnGtLd2YK_PCFw
Message-ID: <CAGEkeHdBri8mbX9zctroRZeoMb=u6mYSn4xAum1x_UkyUZKRdg@mail.gmail.com>
Subject: Re: [PATCH v4] staging: fbtft: remove unused fbtft_init_dbg()
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, error27@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 8:39 AM himanshu bakshi
<himanshu.bakshi478@gmail.com> wrote:
> - Verified that fbtft_init_dbg() has no call sites in the kernel tree.

Reviewed-by: Hungyu Lin <dennylin0707@gmail.com>
