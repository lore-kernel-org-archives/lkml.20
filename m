Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970474;
	b=AfM6x9PV+0NlWMGAPCtcm98GoVDx3atzx+YPcl6VfZObHrbqIt2quryh5qLEdyMkmuG0
	 TJxYcb4bcTF/HkkPYpnRqbutUZYpInE7P2TmBK5OSwyuXQ1aROmAU7vsEurOd8UHEE0vm
	 cw+Yy2eJD7RKW14+dpzOre8sx1yqBE9kcZ0u8z9nYX2Pw2RgzVfkq0MDl5oDeFBCzjKmG
	 hgZ0tfyZQQCzsy/LLZqBufOYV9R2QcyO+yhrgYXXQwAM1J74rKGe4zK1KkZOhIO9L3Aty
	 PXM2iW0Z8EsPtbdAwVNsK7A0qURLU23D9jLXuRuV8UklS5F3DSApBoesuCVTFopYRrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970474;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=uDc/LaJHkfDT+RuC4ygk/L2U7lArOkaZD3mluMfE4wg=;
	b=k8i25zdR4S//53xS3E4nlcbVvkJeAC/t64nVGKo6+kUhcoFxk7ebSjYLX4JEn9kEG+JU
	 RNdsRWHjalAWXmHpJL2i2gu6LxiIfGHB+Fuevkug0pIfLOwO55Bl0gLodYi1KkYWewruC
	 BcHZakL0e6Ag1iOrtARDpL5445xdJap7cytwYSlFSf6pLMNE5P1T1eemf0tLVz6FcUFdX
	 22/W0OuxjV7cLSHsGJIXKqSeTGceQMkRWXR20jaNLjp+2Vy5sUeJDQAK+/VSFOTDJkbQy
	 eVaRKfLVFkFO7pzbifgdJNj86xobVmaBfAap5izNvwK5rdFpzNvtgrZOKiBEHHpvd/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVvCAWFf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A77606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVvCAWFf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42A61F008A6
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793970473;
	bh=uDc/LaJHkfDT+RuC4ygk/L2U7lArOkaZD3mluMfE4wg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gVvCAWFfjfOXD7VkdB3627PEQDVBAG59tlwi59jlrlq6vlxI56qKEtty2M9v2piQG
	 DcMr9m+t+HBol7f+yKhhRdohAVArOcHOXi5WXCpKOl/CD4xo1QmsZ06100+0ZvVaZa
	 QXY1SS1aFnVLfBycczfAfnGH6ka+WD+rHkBVbEs60eLxyGgXSCwbNZ8LWFON1OknqF
	 HalpxCA2xlISRGURL1zq3fQHUUMRE7TIttLj+iz3pxGT80OiUptJ4tJG+DLKgljmyj
	 Q0zPPAPHlUb+fbVkEBHB5kLKlEhmmtr8G1whuGbjD0qUIyIgqOTvx/z8TMGikQ0GxT
	 WKvjkpy5jO/qw==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-679965fb848so594022d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE+5ZbebuuKbVMea71KoUg8Z5ud0FisvkoppZcXhEz4gyOaL0FKicRemQqHyVl12ENhOgXFLZFNNlCKn90=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RSXcqCvL1Mkv19qsKbyfUaWdFrceFZX5S7B1/HYAt+qiFpEll
	8vjhSp6Lnau9lFISFMaDZA4ClBBQ+VbRw3fPNqXPc8GuCBunrO/jrPgqwHRUFIH87yD8+5Y9lt4
	se5W+rFmGiWIYp17QleRKyX6uM+Opo/4=
X-Received: by 2002:a05:690e:1488:b0:673:5042:76f5 with SMTP id
 956f58d0204a3-67c1461786emr1295872d50.91.1793970473041; Fri, 06 Nov 2026
 05:07:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106104842.441067-1-pkfxxxing@gmail.com>
In-Reply-To: <20261106104842.441067-1-pkfxxxing@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 22:07:39 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-vcfTwiXkAU85=+jz3T0Y4nfxuhcEcqP9ZCdzLE+soDQ@mail.gmail.com>
X-Gm-Features: AclHuK-ZNY_mwZOQF_e98A8heV7DdZ8uvP9gqOWB-8hU1qZCDIy4ykpSRDAcVbU
Message-ID: <CAKYAXd-vcfTwiXkAU85=+jz3T0Y4nfxuhcEcqP9ZCdzLE+soDQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] smb: client: validate ACL lengths and compare encoded SIDs
To: liuyong <pkfxxxing@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"

> liuyong (2):
>   smb: client: validate descriptor headers before query result
>     allocation
>   smb: client: compare owner and group SIDs using their encoded lengths
Looks good to me.
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!
