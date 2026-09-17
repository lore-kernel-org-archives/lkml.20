Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CD83C7DEB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657975; cv=none; b=OBt7v48usxy2yHtbJRpCgES3PIk90IYQw8rNtGRedwrpMHvfUlBKTiCRQtHEO3aMtwoNngc1a4GvgSsq0rGUrZ4cq+egku/O4onRQDP/CdgIh0TtZROQYjow/rs0Zt7pwuiqaSKHlsVpVDbE5LNOYCRwF39rfrxGp8BAK30VxyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657975; c=relaxed/simple;
	bh=CbunwsL8JbHZjO8IM65+jSsP1jsU9SGK5nn8nXpsnhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uA9Ci2v4guYp4K+G/gpI5d5TRXtxXzOdxH32CAC16QB1fYFyoR3KCnLdSNsqlwjzLC70Ee6NsBsWY5MZ1JCFuzH8xmySYRGRc3rM0LWkh52TjUuP8jEHAxml36viQmwiCHuuVpg3C4zp+C+SbUbuw0WnW4R2o48pyAUrUqDauzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBxp71sC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBxp71sC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39647184c73so752790a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657962; x=1790262762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WgO5G/ZcSEJPK2YjMAgrvF67kRqPqqguP0ntcBM5S9w=;
        b=LBxp71sCtwg/qMyTiTQjc2/3DHZHqKjlOFpphNN4oFo9CBqN28bopvWFeCnkuk0Jv+
         0afo460+y04GE9fiHCmQYkb1m2T/CX7HeAYWasghJLUNB4uMOHuK+nw+3FvU2SAERM1l
         39BZdjS1jCQcACWEkGkZQCMBf7owZim6Cq6B7dC5rmoN2qyY0vQTYvNUcBhnuHBQwGwY
         JbnOY1MDu6v4CG8bWOIDWt4kpOETbS6LDEWZxWym3Cde723tIAQKYDyPQl3dCgiRDnya
         fQlhfBJxNJPUvybMM1TXgeusNwiah8BkE/kPr6FYC2VWhM3+cWIxnnk/lTN5MGODB7PP
         UJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657962; x=1790262762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WgO5G/ZcSEJPK2YjMAgrvF67kRqPqqguP0ntcBM5S9w=;
        b=e9nTU7JyxVD4uDiqdCX/GAI1cSU4l2yX8SAfxYwh10THIdJqKFAP0AwM2JvGVabNbp
         RBznmIBPiwxqFMxrL0BVvLHISBDlXw8M0ggPiOCWQRAW4i6mgVniGSvGh3i229lpO37d
         VO9wQHRO0zhYOAmI4fZ8J1CkAcPut/H0gONdHSfHVeAlGTqXhejW9Uvb4/vUww8TXlIX
         YpIAS2qE3V/u90RV6JJM9hNdOeE8zPI5sHQdsWw5CQ31dnaS6KaRomDk2Vf9myl4ou2f
         ZTqzX3XQJb5jrASsZQF54+oaZQ/W2oKf+6jZJiwWFWvMDAA0ZgEuuShHcxSvGnqXVyfB
         KONA==
X-Forwarded-Encrypted: i=1; AKwUvByFlCldG2LqJe4eltAj8LknJgy5dIy1nMRurZkpPK5S3umwwYiSx1pODDiGaK5B4UmbUH1Mrg14k9Oms7U=@vger.kernel.org
X-Gm-Message-State: AFuF++lHuoj/qWjRieI1hKCkOKEe22SSe3OyIVaa9CBBsZXz1cpGqVNB
	PunFtGp6U+SiMSILJbbtrXXqfgZZ8CsJl0V/HhytcWViaNAd36WModJZ
X-Gm-Gg: AYBFou2TWhQpez0fFJIGyV/ZQzgzUrwXDbRFTy7z+AnTqtwvAPTPLvxzeYlK+f9eF0S
	x8Mmbm/5UW+uMdB9odpcoovqSgtSZVZkM4pvKPpK8xYvcIhr7NbR9rpbP+hiUkyJoS/QStS06qD
	fXC/TtRTyBjy/wJ98vX8N/+uDFi858W1GyhW2WpThKDV7//FigdD39NmeaAiEn+BXxpD+n2L2ON
	kSFRhcvAun91F1aUxotLkoMzDgHBPY+mbLsximdQAm11baRAjItP+nJN/qjXiRcF1aWY9eARNMZ
	wh2Wj2le8MpvueWODYpS6HTWZDA7shTm03SuLId5sCZLqKzcbYeVIJZTJt+RXfdrZavaQ4m9tYZ
	2cGNi7JTw5YuoQB7I1UVIUKhiZHf013549f6Ud0IjCvdni61k1poP/1/+nAWky8HzR+Bkb/uPtL
	r9ecRU0XJdVkGP3GxjZbWfaJ8J+CXdHWcI1DEF3Ur57x34O1CGbIBxuh0j6G+aiMFEvcotG5j5o
	CGu6ZKavZD3yNDGhk/Fv9avvLPoE7Xmtqghlz4B/3xCpDd3bPE=
X-Received: by 2002:a17:90b:1c84:b0:39e:4c97:ce09 with SMTP id 98e67ed59e1d1-39e4c97cf02mr704994a91.42.1789657961827;
        Thu, 17 Sep 2026 08:12:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:48d2:6852:2cc5:a7b1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm13251302c88.11.2026.09.17.08.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:12:40 -0700 (PDT)
Date: Thu, 17 Sep 2026 08:12:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	samuel@sholland.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: Fix i2c_bus OF node reference leak in ppkb_probe()
Message-ID: <aqwBtYAcIiwSSMmK@google.com>
References: <20260916184721.2093344-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916184721.2093344-1-vulab@iscas.ac.cn>

Hi Wentao,

On Wed, Sep 16, 2026 at 06:47:21PM +0000, Wentao Liang wrote:
> The device node reference returned by of_get_child_by_name() is
> stored as the adapter's of_node but never released, leaking one node
> reference on every probe, successful or not.
> 
> The adapter only borrows the node, so drop the reference once the
> adapter has been added, and also on the error path.

I do not think this is correct fix. The node assigned to the adapter
should stay alive while the adapter is alive.

I think we should convert of_node to fwnode, use device_set_node() to
make sure both fwnode and of_node are pointing to the same thing, and
set up devm_add_action_or_reset() to free the fwnode at the right time. 

Thanks.

-- 
Dmitry
