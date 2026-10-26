Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793004711;
	b=0Y75EJUcNWFL+79itN19KI51WYTyFDI3hd2TxkHNN6JW5bNRORESUkM6B5Yf5Qoj+CJW
	 M4a1gv7sCfHeIVxRQgvPdak3R5xMMXqJrt6S2qO8Ykezus2xaKIwuYyL0iy9uv/HbGYEr
	 90ujGo4+n+fbQFzuDgA2ebUidAeWf5bUEhqcs4LwEMaySw/3Czw5DZM8LUl+8tvn9qO4s
	 J2eDQOV4S/pm0c5suamCNjYxISmIKFXEvcuMfenE5LwKExIwkBbi8l0KHleHjoR7PRzRd
	 W0z1E0B+5se8nsQbHugPPaxOM3iEFmHetrf64F9jk4fRhu44tFKeYUr/4EricE9ReVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xWiTlDTyc6PTyNRCBNyeHOu3tzSbgoo2LUTk5932AiQ=;
	b=RxDqd029O5zc9gxef3iYAmonVab1bkpCXPwGYmLxv7lo19R4lv5xW9W9Pk1IsVam0BvU
	 KqrisIwBpA1DjH3LwWyPAaqsPPeu5HtQ5UsPRs114bHKS+Y/+hJIHCVVibNBKZP1ffBQ6
	 J9viATvRofPb8usr9AjbRaOuswcNQa/Yxd16NUlrEz3rpCRx+kPTHwVpqIJl9jN0V4O4i
	 4B0JPZPUNF9A8j4YZCU+LwanZ/OcJklKLsGS/BNup8kuFARdEE75bKAlyfzkHJy5KDv1k
	 ftMcpMFoHMTL3ZFXEHU1ay3nVxbkNziCwvh0bbiWS9+jR92rSImH960h3J+b31zYvNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J5ysOHc4;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374F7606A328
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374F7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J5ysOHc4
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so4269835e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004709; x=1793609509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWiTlDTyc6PTyNRCBNyeHOu3tzSbgoo2LUTk5932AiQ=;
        b=J5ysOHc4KnG16Nsx67Jslwk2ZoEGuq3b+fT/Vmj8nf4Ee53HTT+mun/PygW+NpsNvm
         JCwYAAlcSpxpHR2LfJ9/IaQf+4RPMz/aC6rE575ITFbduv/UTAEmY7ZyS89vbIRQCQ+L
         eiJobtD3vxxRluJSDSIhxfsRkyZHxUw2DLG5qDqE9i3fgrAdN34M9kx3/arpQdJPdVUF
         FWmM4D6k4OYrmvDe2xOR8FIWXxB/GJCoZDvBxwCT++ls96c/hdqi1fzTM+IHqzID6kYg
         VqGP8b9ryQRCNstRFjE1p/+gqpV+4q6E3pqCP9LsmcxPjWv1ujuvms2lz+nqCHvHH9u0
         lnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004709; x=1793609509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWiTlDTyc6PTyNRCBNyeHOu3tzSbgoo2LUTk5932AiQ=;
        b=vgEAZM+XvezJpVZunfJqzvFq4zs6FcbLZejCMespwbhfhlNdoZNcp9ET3AWt5GbtjO
         mS6QjfW8sq+qmEmkehKbza2Ky0qNIen0ySab4Nq2ARu8BPlJmzjcd2EO1RazGCeCYC6E
         JXaHDDUirirYS2o3OlaTaY9eOv5SlbzlkO2xSYhxQCp0Z4WrvbuGRSOBS1ps5kAwTchd
         g+ygyCSyPeR4DSPt0bIfudE758ktn8T3Jd2p+SQPHBlEBTcsYS7/pTQGxMcKLPqIwcEC
         h0jYBiL+lEbrYI7s/G/zY6s4cUZCqCzZWYtZM7TwtwhvtjDctSvDxeS4DvnaFciKZnLX
         Uxrw==
X-Forwarded-Encrypted: i=1; AKwUvBxrxnkFOTFhgePpk3xTLtBcn9IGbpzS1yM80hLzJ6Wx2OQae3ckXGMOcNIx+iffXAWQGr1rIo7itJj13b4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfhQuSqchsTB3C13/2PSeRzIUFfMlnvgWq2LNxAQZ58munzI0O
	E3wsHkZov4LsYFZAQqirXDw87lZAkTerOAMcmKoqu0PRn9RZg4RcYFsYtxwYrX8ek4+w4MPT
X-Gm-Gg: AYBFou3I3krTZnoDUAeIi5hQFGIpqtcIX1XEJUMGDnJTjKEnVgsIEZoCTDkSjFLbHQr
	Yy7Y+Z8RTrRr2Ky5lJZhzF+6+JdUKkVa3TVeuTGvoN9VMZu2X7dWblrnLE7FsABZwAhvdiE9Eec
	2CvziVFUbWR+wrTsVmhZgNRip1DOf1PYZDC1OchDXGhWu8WXv+A7CvIVZXl0P7BLl0Wh1tjEucj
	75QxSXf2eo7La8hTxOEUk+NA+Nc1o3M/z2h9UTBb2xNh8vcRwbhIYqtmze+xCJx2fCHZN+klAEY
	1P5Bi1lcxRF1a6LHIj+SWHOHtuuVxBNXn/WeLVHiGrSS7uj4btQKa7fYYq2vQ4g4lMFkB65Kidp
	z2R+CSqyHxCdmPDK5WPOX8GHcaEJRjPm0K73vPDB8XlDDQz7tENjwaFJgjdWXkW+XgrQxR4oRlF
	Jj2enB+lHMRaDecb7q7Ug4pestmhxMqB4810Y5xx5p8hCf8OQ238OHO3+l6Pv/FPb5rcWGRI7wH
	pZzHI/CrcjCbPSldLZN6B7qVZ52YZ5TaaS1NwP+ocXkaQjcHoCJ
X-Received: by 2002:a05:600c:630f:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a35ae9e071mr121463405e9.12.1793004709351;
        Mon, 26 Oct 2026 01:51:49 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm224781085e9.4.2026.10.26.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:51:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:51:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: fbtft: Remove unused macro
Message-ID: <at8UoLDzrO9ypMeR@stanley.mountain>
References: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>
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
In-Reply-To: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>

On Mon, Oct 26, 2026 at 01:48:32PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> fbtft_init_dbg is not used in drivers/staging/fbtft directory and
> since dev_dbg messages are good enough, fbtft_init_dbg should be
> removed. After compiling the driver, there are no undefined macro
> issues.

This commit message is sort of acceptable but a better commit message
would be:

"The fbtft_init_dbg() macro is not used, so delete it."

1. () after the macro name to show it works as a function.
2. We care about the whole kernel not just drivers/staging/fbtft.
3. No need to discuss dev_dbg().  That is unrelated.
4. No need to discuss compiling the driver since that is assumed.

Otherwise it looks fine.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


