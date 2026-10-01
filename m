Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1932F7EFE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851179; cv=none; b=e8FlobdMZqgvQmbcJUgsm0mXFgqaEtv7tyE0fOy8guTF76CtUYPEmShIRFEUStDEMco9yXMBVYC1idAsTNA4MaLWh+Se/qwDWOrHkOeyofSce+Ztgkd7lL+ecq07qUApamYeHBs+VIEA9K1mGObP4qci4Po6r5NmBc+c29G4UKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851179; c=relaxed/simple;
	bh=dpiL9TWBEfuyEktkWYv2DyjWYl7Yr/RiJd4Pv8HE/Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYcVFB02gehqwOX/hljf1pvxaI+Q/amrG33bGRzsfBO18c2ER81V9l1c6LIZqHQvRytzGg6aS32xdaMUo/WPQitD/ZtK4WiRSh5j4O2rRpnn/OGDu5k+OsubJABAFsqFRJY/q4UpoxuiHyxO/cI3YIwyU8kD96+9NZH6WInLwus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeHyUChS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeHyUChS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso38559815e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790851173; x=1791455973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRYLe9rlb6ZBAh72YUbfVfETug0ycBYjwmS9i9Ee2qU=;
        b=WeHyUChSAhyhv5E89xlpEv7JGaZsfvP4YKAYBx16DKQN7jx3U9qDINoC7rpY3E+ULu
         0lLymCGRVh9Q+alEjtx2Iwf4wiZcPWLAiSGbtuWhhfDMc75NGtmf/CLdnqeT04ziVqAk
         hfoXMe/5cnj8ojC68gO1IgbYDyEFxgHLTEoipOwFws+YRY+7geT//hCSq5WZOTyWZDDO
         XTtKzI9IS07nbCZzEt7GfrhBP/O4+j3Et8tL/3wxPuOdW8FjuGygPBm/VVhp1wO8qpK8
         8RStyhoQFeL5F7urna2bODzY/NsqG7xrfkgS2xXDw+UmspakxG0nyi/wUey5o5y7R925
         qpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851173; x=1791455973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRYLe9rlb6ZBAh72YUbfVfETug0ycBYjwmS9i9Ee2qU=;
        b=o9Q2vVZnCs3MEdpsIQgTXvk/qMk1SxZqf/9D6jsjGxxzpMCZ81E83IQc4kGEPxvUcd
         /ohiO9GHuDa3qhGB1D5WPsSwWgtzvtN0EfCyqlJgxE7dh1oscJAy+bYZZNQ2ztZrh+aL
         exR8+ICYZlTeK9oy8mL9meKChPsUC+4E31zmN4lgkVTMC9kOgGJ2x9xITUcnG3f+ui7R
         yOh7OikG2LiDwRXNAUfdWnwNnrzzWSqpJHquu9ckLRn2QiapIu3cqc+0qLaU7LiCRCbR
         qkoCVMYuM3bdbPFao7QEppIPhJjF96/ger2Koex57/LCMyGp6MYtLopY0yVPGIXg/MCh
         rBJg==
X-Forwarded-Encrypted: i=1; AKwUvBwr+vwcin0jjNtTlyz9YumWVG07SBYqw4mPm+hZqjA7T8ir13FUMys02qFIoW3ANYUmteKPgfXO2do+unM=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ99mu80bGpDSaxOTLwAits0mEw0tYARq8CC1l7GNTHdoQPUwA
	oOVczjm2TBhctkIY+HRXQ29tccc79wT4WCOIyHXw09MtPQAXMWxyXR+P
X-Gm-Gg: AYBFou34mdp3WnWSRIdg3bExHPbGcfM1eugRerk9Ze2RjWPp8Tp4A/iXXPoYTzQr7KD
	h0o8fKeW6TISef2jed8pX2xswU01K6WPYeWHhbE5FsrJuVnRUP0MyMv/hzjQ71jpuOqWi/gcYll
	DboaCtkJWmAL/gxqBZTtnW7rHszRem+OunSEfuNL35GCdYtfZaweRGE3RCQi36fl7bOIsdM4UH8
	Iv35Cni1NacEDeoartCUNOuvaR9PxddD4bUuqu2++gGZjmM6s0EY4WmcKTUqIjZCYCeqYGiLq3X
	2p3BDX8A3QYWifz/62Ur0UfmeHRqintRlPVKbfksufFs9OLoKRT2xPino6u2qqW0qHCHJo0n3Ix
	WpWWo4yBHVQMZ+hgy/xiTAsOcax0YKb8IRp1kJr7tlmCVfHaD8V4RFjmr4ekUUYTKyo1w6yQuCa
	SGDlvaDBZTEwWPoOqaDkHRdyAgVP8izsvRwtIVtcexOFlZQMIHJXODSKJeUKHfTT/OIyE=
X-Received: by 2002:a05:600c:354e:b0:4a0:a34:6e7d with SMTP id 5b1f17b1804b1-4a01b11bb45mr68566555e9.18.1790851172834;
        Thu, 01 Oct 2026 03:39:32 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f913ecesm42313625e9.2.2026.10.01.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:39:32 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:39:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: return bool from
 check_pending_xmitbuf
Message-ID: <ar44YIe8blCkSHCP@stanley.mountain>
References: <20261001100441.102765-1-matheus.aalmeida@inf.ufrgs.br>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001100441.102765-1-matheus.aalmeida@inf.ufrgs.br>

On Thu, Oct 01, 2026 at 07:04:41AM -0300, Matheus Alves de Almeida wrote:
> @@ -2482,7 +2482,7 @@ signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
>  
>  int rtw_xmit_thread(void *context)
>  {
> -	s32 err;
> +	bool err;

err should never be bool in the kernel.  It should be int or ssize_t.
Same thing for ret ideally.  Pick a better name or people will think
"ret" is a normal "ret".

>  	struct adapter *padapter;
>  
>  	err = _SUCCESS;
        ^^^^^^^^^^^^^^

regards,
dan carpenter

