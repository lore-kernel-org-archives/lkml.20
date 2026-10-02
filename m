Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B152642FCD8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925915; cv=none; b=mpepUtoLcC3ypLgAybvdg0imgNr2auYpDp82hICl/ZjKjVcu9SizV1NNv0ylAfDtLpncnt4godKMH0UxUSd6um6NAZf+MgEco/u0DiyzArnNB7NwvxYrdQtL6xxQ1eDlAZ2yK1h3mqQXBYqmHj+g3svGX8zxsbTX0QDAY6tDjk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925915; c=relaxed/simple;
	bh=HiaU+q5Z5tDTpbFQyiafkFs3u8yzq8OT/DxIh5N6uLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9vPhd2uJ53dU6FC5KZYyqEjitvJAh/SqGwiU4g4SuASPK8Mpj7NDsx70y2ZsIAhzBsF34sA+ID77aWux6DMJwEn3q7M3eew6rz+GX6567jveoTCWJqx3AjXIS/q8F2GEZV2c2+6jH2ZewGwkIumbFiVnQ/Ed7b2UtZGYqFI2/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTBE4UBr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTBE4UBr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so2781445e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925910; x=1791530710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bB4mviFaTg52lMAlQb9mClXh9oAds6IAu1vT5YPotyg=;
        b=sTBE4UBrOLBBQ18kqNwMJ5ns8BkpPhnuMWWe4S6OPOk7avl3qVwbUdqYYsKvfa73iX
         Sx9+b3QFYCUsaQ57WL4rzLOuu2zU2snVnmYw5mGymhez7FRZLsrH/9gKjWhL3JPOykVL
         2tQFEtqU5oK5jdGUgyQdkME7o5qUqN0nX+q5kdFY5rw18bArnB8PwOhyottQPKjCQfWh
         yVPbpHoJB7nkvi+DqRNZUqbrw6F0RLI5sUWhxQ5s7Jz+1ts04VgzwZ2w4wHQhzPWak/K
         9aRzJKu5V4mHH8AwUkyIcWABUxbxKVY+8evC0ztHXdCaGWKoPU0UPsToDXu4cgOmFqwy
         GWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925910; x=1791530710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bB4mviFaTg52lMAlQb9mClXh9oAds6IAu1vT5YPotyg=;
        b=rRSpRv1Ro81rebTdr5HlRZbUnm0PE/RKkdGSk7nVMNrG8A2XS4mRbFZT+1V6Ox0qe0
         0/mLOek0xftYONo12nZZKY6umwLhdNM5gnI0+FnPhzVoySa8R7/tF+8W9iGJoGSeqX+C
         OgUXhpoyliK38j86+VlMhZsI/FUFsk5fUQA5otkdTHCbadgJvtCFRsq6zwDiOIge+MO8
         uetLy1SQJQArvfJHvKNlGlNRLgaA0Fv85LdokbL2EqEf8D2hKl6Wd4tSyHy10AaYdJ5P
         aaJwpQbvGuYrt09fiSSZSESBLC2ESUwO0EB0AhmwI45j7/bXUrRnj1YxF9I/jVv8rkXZ
         JsUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpFFoOLplIjvHgA+8TuaGEc2smxixQjY5GENGO5gqAoY3UUWDFTqT/1DDVffLt55IIp4tKhGUHygXDlK0=@vger.kernel.org
X-Gm-Message-State: AFuF++mfQRNFSN20vBtgKwKQntP4jqVlLNMU8P7jtt6yn7vQ8wkztHAi
	W5MhFJCUpvWqrxXPAd4KUbPyynFt2D5Mno0kouc1khCQcDHVf6JMVBOX
X-Gm-Gg: AYBFou1On/EHIaFIV+y1dVmu/GuT0D1oE65A1Ibhixo0vFEQkqfI4G+g2x0Q/BXg/6m
	ZXrk+A+czz0rOO4kuA6n/Yl5hIJf5yjI/yQX+VYdVBYJjCSC0lYLnRY5dGYjTiQTjg6gr6Pa3Op
	kPZWmXqPODfocB39Geb+vazt2lwcUMhIa38gzPSdIVQwAy5ib4faqlhhUJTvoTG7w3lQz1Rqpfx
	/V/Jbib38M3eieS9LP2IAJ8UHokHuSlfVUVXxKaooo2MPvTr4qNtsWQidfo0w82tnl9H3qeWzBp
	LFD9+vyxcBzvb5ABBPcHC6J6hCwPF66kKa2dDO3jyRGJY0ukCxEAnMu1gL7c2VPpQiXhqA4Botj
	Z3O5joeC542uQL/JFo0Dt6R7VRR14gho/UF9RC8/OI0w0UjRmXI7bwsRr1PJEQCfzYqGjPzB/ox
	VYu1XjwD+7CoL/Lo5pimktQgWWL5h6GuyPgZoKSma44u0sWrNfxhtqoyokcKnhV3uQyTA=
X-Received: by 2002:a05:600c:154b:b0:4a0:1559:bafd with SMTP id 5b1f17b1804b1-4a027573e97mr33311035e9.8.1790925909801;
        Fri, 02 Oct 2026 00:25:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm3713815f8f.10.2026.10.02.00.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:08 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:25:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Adi Prasan <itsadi2409@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix ie_length bound check in
 rtw_cfg80211_inform_bss
Message-ID: <ar9cUQd-NEJozKxg@stanley.mountain>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
 <20260921165527.1379-1-itsadi2409@gmail.com>
 <arJXA7q5a40jcASB@stanley.mountain>
 <CAAd6oEjAMrJjx6PLDE7jj5OsgbwFWU9Uoy=_UyO8w-5AyZCxqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd6oEjAMrJjx6PLDE7jj5OsgbwFWU9Uoy=_UyO8w-5AyZCxqw@mail.gmail.com>

On Thu, Oct 01, 2026 at 10:51:00PM +0530, Adi Prasan wrote:
> Sorry for the late reply.
> On where ie_length gets set - there's three places: collect_bss_info() in
> rtw_mlme_ext.c, and the two H2C_PARAMETERS_ERROR checks further down in the
> same file. All three cap it to MAX_IE_SZ before it's ever assigned, so it
> can't actually go out of bounds.
> 
> On a more sensible limit instead of MAX_BSSINFO_LEN.what do you have in
> mind?

Please don't top post.

Why not use MAX_IE_SZ as the limit?

regards,
dan carpenter

