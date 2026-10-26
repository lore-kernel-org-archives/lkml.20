Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010559;
	b=ZMnrevjm4OL4abk513jYCVfZVlvY9bLzppE0uYGlXC3wW6OXfzH331kY283XIQAU7zbi
	 CVyZ/WoEST7BhKLZZJdMOIOPh+bsfNocM3OSqzqf2mn5M2Hn/6e1sRl45ERm+hEhf+P6U
	 DC48nr9oMF3AdwVQhzXbZ1BjlChTpQyoyNuhlFsZh1i7Wumqppk0X+gY4LfKkTTJE1911
	 SIFqzzlEG0gVCi6lYInEbtRzK1o0QaI+JkmBZiX+Sfm8PrrHYCvNjYs/sKwZH9uAAVnCy
	 IK5jq9IgkkXvzWJ6bkrShbCmrQQL4QEdckSNUqJJ7rxMV+xELAcZWUWt/pjE2tvF2hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X80l1ktYVTyzYo/RbFVbsXtNEdr+d/QH53RjktV2YY8=;
	b=AtHFVdZEWpK1IquHVeNRhmguWkxswQp+ttSGtcryqfZpBijNSoPUqTYd7Ruj5aKDDtZK
	 GHvHP+KMSiVw0Nibyy/pmKXDu3+7pg8k1PrdWrlBTVfSuy76wE59IorCbP78SK84iY9fR
	 OS2UiWih7vaTOM13ApkkRxLcHKxUNyEumFaGPAVqpKv7PiJk9T95TB1i7BhGnIcvdSuet
	 ugol3UblQLvFaDKfO1qVcdCBQr6dSlINIbg6H+68DTfq/ETP4auEd4GoZdAJw2anD+rc3
	 1y5ulNIUZbT5V4ZvEFaDirSlTX02Jbqh9ODP0gLBB2VaL2RRrcE/2cZ/Ms93Ou+8PYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+LKHZDF;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB1E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+LKHZDF
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso1250017f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010557; x=1793615357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X80l1ktYVTyzYo/RbFVbsXtNEdr+d/QH53RjktV2YY8=;
        b=m+LKHZDFEscz+sodHOusqm5YkfAmtoo4ISEaPlnWzdLVIL1X8WB6Jc+NFt8+5fKvzn
         ylkMs7azPwn8742b6eJ3BQwBirl3+AKUPG9Pf/dwh8zC9j12sgeBberI7qWLNkDTpawe
         JNSGK26YRqVT1m/dHf33BL8/ewzSeeczJxBhR6jCxDxMZcbxnim7ygu5Zi0s3tLBY2T/
         s/AmxZ23kW7QOPZACn51zW2rQb4udc7d6Fvuia2k7vmiS52v5c2atA6KWpQOLInF++Cd
         XHf7tRounlVBHuO1kAop7BW1ETWPnanb+3JsKrucbIQxsEaT7rsWky6mgeG3XDMmtZVt
         218A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010557; x=1793615357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X80l1ktYVTyzYo/RbFVbsXtNEdr+d/QH53RjktV2YY8=;
        b=Dka/VF28wdn0tUJ1jjNjawODhqqzULUuUo3XZUAUEY0s1Mh06vToZLZ15hpg/7t3/v
         bPfHNuzdkuKylnbY0iYXcdaZAG24sZAsfTn8hN9lSd7dIOVCCRefTVtd6U29ulIFw2fT
         I2OcAzg+t+JvpuvhJ5P1Qp2oNIhvO8zKkSddSXd6uwlmkKah5Y1fUGScTyO5m4DBFBKu
         Sx2sCbDenIUbStzO7tQLmlpq4vrJuswUOjvmBJZwQI6fgpEgg09SDrs4+/JA0Flyo+S8
         wjoAY1Q6U7k1hwJQr+EX9yE2GqrTEoL68dLIrP8q7fk0gwic9RCkzMBn+gNVwtc3YmCC
         5rOg==
X-Forwarded-Encrypted: i=1; AKwUvBxyz/ttZrtv/tVT26tIjSO5xFdh0qPy2qZ6TFAfugDEpachMwHU9g9xsSF4aeSrHYnYIKuzBl6e3+Wpick=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkoOTfQ5J34HQRRk5cnksF+taCgIWNHSm/BvHB5EwrKTg54Xky
	ZF4ttVF/tdR8H1y7etQqwLF0z7S2VRN9GOKpnZNlaAnNQFJ/z58ycToG
X-Gm-Gg: AYBFou2UIBH6eouJS8i9soACletgimlJwH1bXSaJtCV3Rc0rThX5aiQbhFMeBfXrbbt
	PK25foXZ24kktEGzTxNEk3nh4tTy/G6D+0LBseGe+VoiDlRtHKCkl6w+L0r288z6Ljcu5W0KqSe
	63VFiP8OFTQjdoWFbzl3DH2p9EO9FcbnAKT6ttvASRLkLhx1pF1y9LPnoTEwLh6vqbij9IOxf7Y
	/QvQyWUiTxHb1ohQm6vkyBGFe+eRpEDOllxFeh1mtvykqWGacSS9fRXDNHTeSNFoPm6EC9ikfv+
	T2brjdYho5es1lb7U4b+3vK2cmEIYSfRh7oyB/+c+2xnxCWq/gMYz0490tY38xF54e9YcXZnKEt
	kWyojX1vTBGUnbi/lh939tR53iXm1+JsrBPUz+m/9L6lWm8sPTXJeqb7YsB3ebIv43w/K0zctyw
	QxfFS/3+9kpHrD54FeDMZOEQ0qtQT7EiIcWIlx3WIythOEKVt8uxdc6nvBTveVgKPbcoslM1Cwr
	xgWbiXxTWPeP05hBRkv2zK8TEnqYPgyN1jxBjam5zmoH72IxNCGty27Vbc/BUGSCUMcKedglw==
X-Received: by 2002:a05:6000:98f:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e3eba5d2fmr12088523f8f.50.1793010557470;
        Mon, 26 Oct 2026 03:29:17 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48eesm15574100f8f.30.2026.10.26.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:29:16 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:29:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: remove unused fbtft_init_dbg()
Message-ID: <at8reTB8v7iU-IaT@stanley.mountain>
References: <20261026101815.73722-1-himanshu.bakshi478@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026101815.73722-1-himanshu.bakshi478@gmail.com>

Please always wait a day between resends...

regards,
dan carpenter

