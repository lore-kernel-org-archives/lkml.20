Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079529;
	b=sizT84ZOHeiYZNRP5ttTRST0Sw6r1SJ4BrYTd5USVl7pha9yy7JFMVoH8xz8PIulRCC5
	 KOjNcYdGhtFN/Ki1B6Jbq7BrjBUkA9wQbgIR28kp2bVndf6uakA/ZPLec5yRtwFz0alms
	 IBq9FlwkdQZblRcWQLzTt2G6/g3clI3NlfTTBCuWLDPSnzt8gqeJqBpD3GDULLoBYvJDe
	 N88zcM/n3+VGNIewz6bVxLE1oyCk96YsepxybJ+YwFhJs3U30NfbCR68iw7YPL1JI4dBR
	 mZ7IP8G8O5unyfdC6gVgp1yVbH5Xinml4X9HV80fXknEPI1POkx+KR5sSaFAc3Srr6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
	b=aIV+358IENMtIz+d8jytSF3VWAo0NokoPKfm68l34297TKoFfhTjN49MiVvzp0qlDVWa
	 XVhsoIp97IvI24grp2TSGK1Tosve9qIpli8BYfW3aZ1hZaikDfKQ1hL1eAF0SeRWwWDVO
	 BWBWh6u0KR0/VXasHB3l4DnWJZQ1M4lg2YusA7CW+GZteVySEqYrZ/72hHG89WGBxEm+q
	 105uPFLXjdMxqZAbxh7QBbJ6s83kwWd6sn5NEQ6f92VoyOKx2nnM0xsmBVFbW1O++YMbZ
	 +JaRsk86Wg+xWPeUaGS2gbjAs3rXHbjjwFUMR8s1S+HON0dJiopnbuPhKz4u272ozAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSkQFWYI;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC46606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC46606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSkQFWYI
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so3095335e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079527; x=1793684327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
        b=TSkQFWYIAY24u+ILeLbmhdWwPjIVoVVXpqG5lie4a0TD0iurDBdtWm2LBlRGSeSCZf
         6QfeRhnWM6Vrj5Ub8z8ZmIrrNgO8EB8XgQo64WPWLLr7G1CU+HjPgI1StMuuSWc0gCLS
         QDjM9FXGo6H5PRN1URiNXrIGjaTNKQgQgFeEhyPBQUSrnxnfBxdvMGkeV9EQKyhx/6gS
         ax4CXmlwEya78+lnBJq0AosH+5p/vX5yZclku6vtb5IHoV8C3UAWakPgRaFT+4wBhl9S
         cO5/j4/Bp36DFC1zXi4hwG83TF++b6LaI9gB6CXf2SPtbCFDEVKglVDCS10L2zm0vUvL
         2c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079527; x=1793684327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
        b=icwup0SFVfa9NG1hiMvdT/kYfyNm2HZsXRh/ZqxXaI8yaArIuw88RAyUNORfjpj0sv
         cyKsG2CHwIyDBLkfpnOfoRSlm815BECcMqA2lIR5PgFfa2WcBgBatVmp6wJqUioaJ1vT
         T7fkX+u8XXSju4YA3xFH6xBL6KnZRtyHiPowIqtYZ2lH1OVyvnpt4KVWaxEvcN2qHiqF
         +uWpldOQsUc0+diTF/8FiF7hVig9HjoezRQ+txFtdX68inTG5oDmmnkdwJwW9jtE7alc
         WnXMqHSKeFEw/lXSHjQj0v9PhSY+YDp5qWCEdnAWni7KHak5IS8RSU2ja3gaSg4GIhu1
         pg2w==
X-Forwarded-Encrypted: i=1; AKwUvBzTy/66Nib1QG+Qn6JWyB66pM+PWSFTCwG/5aWvUgP8C8fjmyf/kvQxYhC4039p2p1GOtDazX0d3Xn528k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFsqFediVz2yLiwjHIkSlURvlbrlyM2YDWZMlwv5www00cX+er
	NnqBztXow1wF7r/9Vq0e4v37NTyaa3rcHzp02tKsGsTVAabBszeODu7V
X-Gm-Gg: AYBFou1nna2qWuM3uilMjwjLS4RDPU0dB4GCr+2aYuIsqC+7q5L/zv37E+F/iEVP/gA
	Oj2u9gioa4s7QkSdJ1VIr15Q+VimqIgOLnr2bnZ0zR0qcnYrM87ktkhhDY5TtuNwNpNszYQNX4u
	Oq4uKZ2pfVtw+X5Lt1fUJH0kx7tGIOfpdnV6QygpzE2W0ENv/FVb71/G0gzCYa7/m082GnNwYGA
	AXJm6bYD5Z8mJTJ0AfRaFDj14q0zcIk/1cMapb+1mnZeMVNWpNV6bNZAtxWWMzTd89dHMkhbBlL
	mu/hNz3znxzHyi9pZJ65dNK1BtzERicOO54jyN4fXMFR+sTy6Kjw1lr0VFstBiPxmek+08E/EVu
	ls7FTludECmIh1Wy5C0pfJPdsoN/P/upZ7F2/aaYRxSQEWJIJiXE4O3YSuX4RsYAR0H3BvCi/9K
	ioUcak4+/2MQNaAFfYt1cklH6LIz6CfKhhCzojiVp0nrrIc3pxGRtakLUZoh5NmaOjfxpDOW3jr
	uk6KvuvJSpBvo/QgaZgHdr9DhZyuwd0FQ3Ih/mCkjnNSagEfGjm
X-Received: by 2002:a05:600d:849a:20b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4a7c3856e2fmr26530125e9.6.1793079526864;
        Mon, 26 Oct 2026 22:38:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm20057407f8f.6.2026.10.26.22.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:38:46 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:38:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: dan.carpenter@oracle.com, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix memory leak in
 atomisp_alloc_dis_coef_buf
Message-ID: <auA44kPevsJUudhR@stanley.mountain>
References: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>
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
In-Reply-To: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>

On Tue, Oct 27, 2026 at 12:19:40AM +0000, Abdullah Mohammd Sifat wrote:
> Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate
> 
> fails to prevent a memory leak in the error path.
> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>

The commit message says it is a bug but there is no Fixes tag.

However, it is not a bug because the memory is freed in the caller.

regards,
dan carpenter

