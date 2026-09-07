Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D81443B6D3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788820378; cv=none; b=GswFSvek5vdZvUnqqQBQK9Z4Za4WUKyUC6JIExQamHMlhoMaZ8U32MeqFt2hc4rThzuP2zMNscOshbSXqZ6CJI3HmFCaJ0MYQ86pcOuurNU/Dx6j4gxHWZOa/ZI9lz9uUXByi1z19a24fIkI8LKyAdE1INnEYjcgB9gBRcE+eE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788820378; c=relaxed/simple;
	bh=9RNlViBMP5gSfl6YGM7J6Ko4HkVsFl5+nPinarDZvEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blAdLGw2hXyT6hZXuV6Jem+L3UYt0bMeNCONp7YoTrb27XGeMM362lR61oyptZODAM82KVn5rO3ju1+WR9NJyR1H/YgedT3vrb9X4dBHKYj4S/2a+K0W9+mVQmmYg7CX9ELWyk67FDvS0sJr5oNZwJjyhfglYY96keYNWx7BE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWm14lAR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWm14lAR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so38885275e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788820374; x=1789425174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnujOlryOcOB2B/LvIPxTaLmbwXh/kZV9FXNR3oxSFM=;
        b=UWm14lARKYLQM+ND1gFensmfZyfXbYFhflN8KeZsSjpLigjKDh89DrUCkOrImEbPTF
         JR9nLfnLiSVriZSXzabdDDA6LPWs5IAaAHFEuhGIRkdC7nIPNTT+Gq6t+uqZ3dyoVBj5
         94mHUvmvPGJIPNcHogt1cYmeXsYkoQXixg/RxNUCa9rXuTjz8cr9Z6EhFnsC+71MFl8A
         xdE/vOWoJ1vcWYd5/BsQ4CSoyk5H+1FbJoBzdBmilX5EKX+7Ga8xpjJFqPxELpxUXMXs
         BwllPAFP2eVxdks/aBLXMO4h1e0Gioh6kbwG+YsZwMZZQO8wgyUJCI9S7FxqR/uAnthP
         Wqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788820374; x=1789425174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnujOlryOcOB2B/LvIPxTaLmbwXh/kZV9FXNR3oxSFM=;
        b=k5OwWcid6wAdRLLBFvDxzuCLv26Has2z+UHmGVXW4jcN+q7LISffc5BrQTyPVZeJsS
         lk1AAuYmPerr8MqWUl9Pvu9v2ewAYTijQIXvXUhpQIjB4/i2654M5CFbJmDSbAufaCfX
         qy4ypuDRV2A3HARA70VdV9GE/D+JaHHHxseYy+LhNsm9uQJ7Joo2XwpgE9uPfJVU2N8/
         N/6Ktz9maclej9Apk/pAK5bEVNRx0+VupXzFqebXMoVx7cSKmwhQxmulv7mLB6eNCJIS
         1LgDAxvsUOOUyy4BsSUt+JBupv4Vn7MO6R6wGqW6kfZckThivXjcrK5rWWX0goAuCS/3
         YXAA==
X-Forwarded-Encrypted: i=1; AKwUvBzg1myboTBASFAlkTsSzSvBxD9JEXP20XwMq3yzlcCPhn517E8h/PED7RDJl1LThBnAtw6bNsa1BJMvU9M=@vger.kernel.org
X-Gm-Message-State: AFuF++mQRl9h8o7+zx0k5jBBk1EXSw4Fv8M5ZWRWvZ/ylQ/eRUSW1Sup
	EVzRx0y6EOAZphrKtTv9xHgiNIZMcuIGiqBPcOBGBi086xLHYruqcPwu
X-Gm-Gg: AYBFou3kMtDTsC9SjpDXeDTbfRSVOqMnNMUJrKn/34g/3gKldeZ0LdRf3l8vf6qM1lY
	OtBgDj6yN+xPxKOnQl7baHIzik9fclqtH1rh9QRRu1RKgyT6424XZ2o8HmvziTQrMAmgju4EANK
	tYyRmP2aE+VeNmplNaI/A/sQgP3A+PTnPh3KPk2R7XyCRvpevN0PUv/Wb2tAD6ZnztphApC99aT
	zMdiiF42B2wosVVc8DY2oxrjNISJ6i7Qhgxu8Hew/Iq5hhnxrIMdi2ALXZlYt92ewVNXCfuPTBZ
	yV6GF/Tjm0bU/hKyBx9kGOFqQ+VLZImCpAFqyN05wL1Oh3KIbbZal6hL14S0vwZfkxvIowUpHOR
	qFDvm3PzWws8p9366lOK6EZFOrgUl1MLLiHAjgpc0IC+FMNIZlxnPYcRb28jhRRb3pK4HBOhjx/
	X4ZA+b1jXuK6NsIBO8S5gs0XVbfrEX7WH+0aSbCoRNmZn7K+wseXQ8gp62GghN2UbHC49l0wtaa
	9ZXwoY7QovYR9ZLDpyAkXpFtsDFEs6ISGjwnYZ9geFtkfe41RLaZqDBMg+8suwJy+mzNsvL9Vt2
	ARTTbbOMN3JAZZub/h1xN3JiRJazMgqUdwNL6XcJaNKM7wS/1lDP/QsZpneXeGyBvVE4bMPy7vg
	w
X-Received: by 2002:a05:600c:a0a:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49cf81e6cebmr448618745e9.4.1788820374459;
        Mon, 07 Sep 2026 15:32:54 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-b0c9-3601-cdce-ba4b-d0e3-dede.310.pool.telefonica.de. [2a02:3100:b0c9:3601:cdce:ba4b:d0e3:dede])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm289518525e9.2.2026.09.07.15.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:32:53 -0700 (PDT)
Date: Tue, 8 Sep 2026 00:32:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, 
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-input@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] virtio_input: stop callbacks before unregistering
 input device
Message-ID: <ap87JrBAxjbPe_jX@gmail.com>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260905152059.89560-3-kmehltretter@gmail.com>
 <20260907174559-mutt-send-email-mst@kernel.org>
 <ap82pFlX8enNG0gZ@gmail.com>
 <20260907182153-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907182153-mutt-send-email-mst@kernel.org>

On Mon, Sep 07, 2026 at 06:22:09PM +0100, Michael S. Tsirkin wrote:
> > 
> > "Assisted-by: LLM" is the form Documentation/process/coding-assistants.rst
> > gives now.
> > 
> 
> really? not what i see. in which version?

Since v7.3-rc1. Christian Brauner proposed the change here:

https://lore.kernel.org/r/20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org/

which became commit 816d9992d9ed

Thanks,
Karl
