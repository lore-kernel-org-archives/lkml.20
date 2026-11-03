Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.199
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793732835;
	b=LuAT5XdrFM32xEm8Vf+EYzdD3d3eK+mylnlVqju/rlyAwtb3tqY/8jhklT/7NgYonL4K
	 H+jVHJYfnfMshhKF6xoBy4hjc/UHrwyjCarrWNEuv69jo6ady01EBg1imSEy87WjxW3d8
	 D+M01kX7oD7Wa5Y72Fi/GJPcrpFwluvEBqYHksoYETCCHP2+SIQAwJzXHfb0hYRtAGZjQ
	 pc2pzecXMe22gdupDNsxwBYKszZGzz0ZkRQR7T3V3Ni6cdlRALbCCXCQxJLa6md5hyxyw
	 moODE6tFEMzVjGNp47X7Yx7vTRWQIgfDoXZDPwxk/g7r8HfQC3A2tgwSk19wbwG8xDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0+u/BWUffFdCK5nAB/ga6GWLedobIPyeWluDDSR1ayw=;
	b=peFBgQop/RmJREWbm9WWpZDphXv/n9JHNAG5SK2pUKqkHLLz2hJN7gDeT9eWKIcR5FsC
	 W91JU7KEexH1UWax+/5hCLNgNOop5REqS1j0A8fBaqA2X1neDfeDgunsB/gsYTK1aJutk
	 h3vS8cahUsD4KIdkuzvsJm5CQqajO6D5RMqVHKyIsAV3j4JYs/kgymeJ8iRbEIqEGdJhl
	 uJCLZtx675mvsIb+dWZm8zVBt0Lm1bewFOoo5a7ZeX7h+ayyr42mM5X5ao2Cbq3ryB4OY
	 mOIP8GbPJVeabdqY7KVERINyenHzQVA1PF0D+n8GJk537Qaak1Mgjx5cBO42KE3fWAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFPmZ9oB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.199
Received: from mail-oi2-f7.google.com (mail-oi2-f7.google.com [74.125.231.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192A606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C192A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFPmZ9oB
Received: by mail-oi2-f7.google.com with SMTP id 5614622812f47-4b39374fab5so2512614b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:07:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793732834; cv=none;
        d=google.com; s=arc-20260327;
        b=UqF7KqTD//DY0qTP/uo11q1q1n07tubWCG1M24CjTkuaaBzAQazWBy1CkMyAfjNSDr
         OPOKe2S3t0Dvg/8/7HblfzxVpqJa05LCryob0yYWhYV32fWjmPsa3WF/bXYYwroQ67cx
         1f7/A29DICbitpuimUMuivyiUGzx4HfyeBro14PHFn9oF7cGbFvjtAthjeoiOQiWQJQg
         RQBlzqbE/XuWFfhDyoszb7AmkaKzcN7mpPIoYt6BbbZrtkdEEDuzJzqdOqwrPl5FeGYm
         lU0SmUM0P9mWzpCJQ2m03dcdb9f8ZhIB/LrLCGHTmHMVK20Yh0AczuzH+m65B5cKnJHS
         1vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0+u/BWUffFdCK5nAB/ga6GWLedobIPyeWluDDSR1ayw=;
        fh=uKt9tRbxHUbxoOXAaX1I+uMyxNnBRcfwmG3lOKjTO28=;
        b=HirKyaXQA1PJH8qJgksSwHeyPXeBzk7snO4PlnzgYbzYG3wK31Zg/oePK/jmN5m3PW
         OA0g4waiMvXBxsDewv5esnyevqOfEK1ciIaOc8nhdMUp+heFZslNc82FA+/Ch3PaLHwy
         Xwa9Te3XqXHLcbHJgWLUtJxCPsH+LcYo0277gSQjXI6qOhbzE5becwhsqUnufJMvuy2J
         dw98ueg4sroxEqXAXLtxraO6Y/qeN8pLzPPxFfpmyDDcIOfYRp4eKwyrSNAQNgeFRMv4
         qmJdPmUh2ODsPzy41Z30JexMDfTQi3BCjJZDEXSj+XGZUC0GilmEk+vp8LZGA5mqSdFc
         vnIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732834; x=1794337634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+u/BWUffFdCK5nAB/ga6GWLedobIPyeWluDDSR1ayw=;
        b=cFPmZ9oBtx6sPRiaoSpMhTsu/UgMBSoUg22SmPUWKZtTiPqs6CrMsI/VE/th70956B
         MVR8J6qRtAb/eVlxAs/9TsKwx2vnJ0sn66lNOYbIGzCABHlV9KKjng1KBw+OVpYu/3kx
         40eO71sWgNJSamIiN9eY5SbzLnTaU4WxNvhggS1NPAD2r0+anEsUsOi1dPiOpMJ/QqbH
         Sdb3LxWrv/zmiWA6L7yfVza5hciJIhXQIHdZqNVu9TCMKknagCQf8HD9A/04gnoO1O9T
         BgRYpijIJydDETK6pBBNJrJD5R1TOX8EvtdDdCewmhiLmn6ktMfYAo+LuB5MJHfGzc6L
         7R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732834; x=1794337634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0+u/BWUffFdCK5nAB/ga6GWLedobIPyeWluDDSR1ayw=;
        b=KiyNlKvYNo0jX7JiIeTH5xHZspnxIvcRUPpsKU1LPMm8/m1qF5WBzvbgCmyKdTj4mH
         3gksCXswrMnjHItGHYLi07CjwzC+R4NgE1f5EZUKBYxLJtgNhd489Q9PetQuiOX28L1n
         nqx3Vwjg0vMaQQl3CEcoualskAaquC8FLTebcxJXfM9kLGRmb4LovZVUlfggn4V6Qau9
         tHK97P18+Dsul4vA4SWnMQL1oRojuyU4wcrVimueFZ1s3oSIMw6kQIlt5AlHiX+XZPg1
         qBa7769uOldY1d1xwp3fOhQWQFUeSrkWPOAZu+iyE4tt8wbdCp4e8PzfCzORgmkqsgsC
         yVNg==
X-Forwarded-Encrypted: i=1; AKwUvBzDojZbq0w4A/rbQrUknVOp0dpxCh13iJ3VxiEB7tM3K0PJZQuhZNuv8QWnkCMtMLIg+EwZVAjvFVQQvyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K3UQAT/Oz8/Z1hRgS1AqjC0pwf219wTC31PConM0lmDH7+eRu
	Ww9qDajaMP6ARa++EnI9Lqzj8h4nWHk3n10PQ01/VqJqjSwuTL7GjCx6vREF1e/M20bkUZBTaMC
	jMgwiBjYlS2ezp+ad8EcAAzv6EGy9H5Q=
X-Gm-Gg: AYBFou11xDT/7ACHxiqIWuG00U0rQQgNB8QdMrpxlh5kMLER6BJdhV6B2pwB4VujdIx
	bH3JG7za1VkmmXkGR2EpTMqG1f0ekKtr6ys2F48oWnwoDPOSFJXwpbwjx3UeOanfub3EHLvLUPq
	D71ZXR3SXUQOQlP9mIWwcUsj+aL9kBgbISsGv+XNIpj1acPlDl3YLuskEh3uT5jptdMouG0tT5b
	eAiETPob9ipPa1BBHyuJSfuxk3HIvplBgHKw5bDImL1u592e3yPHbvPjLzrl2sKA7X4QB5llFeB
	BVk3Lzi3bfL2fHsXiI7Sqlmdr6RIeITOeCIGqguuRfLDbBPBTR6wnokiTMFOSnV6sxOmqThs2a/
	4Ei+2agynu3m+KGcQpNAU/vjJuGGWMhs4ZnJucG+bQwmuYDacylQrg0e1ELpkUnbuvbIh/irkPE
	GYsMX0Wk2NzR0wLw==
X-Received: by 2002:a05:6808:17a3:b0:55c:928:69d7 with SMTP id
 5614622812f47-5640e0a4dd6mr8734775b6e.67.1793732833765; Tue, 03 Nov 2026
 11:07:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103072234.55611-1-dennylin0707@gmail.com> <aunPPm1d3G6yVCLC@thinkstation>
In-Reply-To: <aunPPm1d3G6yVCLC@thinkstation>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 3 Nov 2026 11:07:02 -0800
X-Gm-Features: AclHuK_s_h176gaiDao9usKlX4K0x8D5lo_mqJC-t5QWJ8dGUnHlKYyTf7Wz6B8
Message-ID: <CAGEkeHcANE5wkbQHkOZ0E0NsJJ-_JaD45yidU8XJatw56tqaGQ@mail.gmail.com>
Subject: Re: [PATCH] buffer: avoid extending i_size after failed writes
To: Kiryl Shutsemau <kas@kernel.org>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	willy@infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Do you want to give it a try instead? Or want me to submit a proper patch?

Thanks for the suggestion. I'll try your approach in
generic_perform_write() and send a patch after testing.

Thanks,
Hungyu
