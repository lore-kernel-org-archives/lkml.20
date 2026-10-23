Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772307;
	b=E+IjSS/sWUQ7p8C6ynGTH3XhBRjiKv9L9TJlJV+HtpLkEP1YoqDIKrD/fDyw4/LezavH
	 CjEppwythUN+roUrB+vZ6bY1NIvBTO143L6dou7nkZIB5vcrECaSqoP14fBMbCqaNEkxi
	 f6Hc3rcrgccOG4bdNdpQ6h5OrTxPXCIhoOtJtF0b4zZ5Mm1WZ+bPtY1jiY0d47F2q3UBV
	 Pfw+NEVfYSTEOZ/t29mFs/kyK/4+r7MPaf+9iXJKWS90YadHwhogXnDh6I56eyJkI9FUh
	 6OhHlBHwkm3NVAf+3MIzIucADu0BdZZ5c8z5kUrWQpFINUuu2m3SEuF7GAXPoFpS2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QP7Z5nq9f3M+wzua4Vt0AE8lDl1n5BDSlA4IpFM8kg0=;
	b=q4SpcHvufDFD8zSPVadX7qMaEDKyyjKHHDSvFBd6rack4H6YAGQkFNGYMVYptWTOZ4i5
	 9ekK2p+5+2U3lg3AisNMA+t49ALYZgG4/mm8Z6KEZwS7YHmxVpg7MY1z4p0FABFEgGJjh
	 BzR+dmPQZQTTnZPlzRrCw5YnBL5mjHl2z/oQrqsbqFfPT4jDRGXW/GNRrbJhzKGmze92O
	 PwBPHqDaQy1UaT+z05C3u8X9gjN5u6ZDuvjDdVo+OnP+c52AV2BD65ojM6aDN1fKr4H+/
	 H1YdwZ17rHOWsLgGQOWIu7EXCjk9hQ2edM5Eq6r0Z0S3jm4OE9t7wqiuSdpNjvbDSwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jJqspCSO;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64252606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64252606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jJqspCSO
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b042c0759so745552f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772301; x=1793377101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QP7Z5nq9f3M+wzua4Vt0AE8lDl1n5BDSlA4IpFM8kg0=;
        b=jJqspCSOzBGAQlcvubxG20AZvgx1ZnB85D3mbTWBg7EXiCUhLxM1XDskyy2fEgGdV3
         X5RDz3Qa8o13wLdKOoJ6WRmx0kuvikveEyLGFE8RaRHVg6q8v+f4YQAw4TDwfOKpBVD3
         nAdjj3ZczkFAGjLRTs2hINVdJs9kFPb/yHqHx20CpmqfdnBGFm55snNd18Kkpy1oC2bv
         5QmzYvIC7e794jecEnZr16sYju1oR5OOB7Rceucq+k3w314AEB2295n37MvcF8dL1XZP
         Az8T1Cq4LvkhOvbQR9JUkJxty2Cjd71jJRI4ZT0sDi78rKOEGTuf1lHWhL4sBr8pZOs+
         sAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772301; x=1793377101;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QP7Z5nq9f3M+wzua4Vt0AE8lDl1n5BDSlA4IpFM8kg0=;
        b=Te57A206LJ/VQ9Q4PZzxAQu/Y8ZMUHeiIH4NeSA1QKRpz/TPgkvOr1Wk21v/ZhJRgz
         EkfE4wXhtsVIl57tGC16noDF1A4cpH3VltHuxYTtzNm1fUaiaXW/cfzK17Tg2k4rl1bd
         xSEK2j2g4dUCQMXrLGzj2NwpzI7pD6Cbl7sVkMV73RJvPB40oHmlGkMlaFAT3d/DZT0x
         fOGA71um/hqAq+KXKjx5ce3bXRXewY+vY38Ug95FFDAo3VrCASnb6YkXXoUqolQ4ATX8
         w7SznXZhuceOIktR81ve80flnlPgGEC6TRxLFvfYeIXDEvCBMBMf7UY4IDMNP4jY1HY/
         cFYQ==
X-Forwarded-Encrypted: i=1; AKwUvBygCC7UB8OO1VmA9sigBLN20ff5hfV2MkDCV/MQx3GOmxLLd9eZJGsa7T9TZAK6dtdoJ/9wsKaWDzA5WZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBs0j83emlBc/4pyAVI3HnZH4/PHO/A+lQlGnQkGabL+MBaHHM
	Poqn0Lskllv54yStxJaZzqcVeRgDXBJ60h4uaGokLRk1IYKoPHXtIDJT
X-Gm-Gg: AYBFou0SX4f1x5Pq4bzBE3LXTyICJzl11uFPTIe8GqTzQ9BmXCmVVfOGsGABndcvLX9
	CSa7sT2Lfg8p+9lW+u8lejBmn/IE09oXMTpsts2eqcK+kadXDw7k+pVri5F967gWkDJwAuopxxf
	Vk74eXuESt3FazQB5cxbOKthOpr+y0PYO79DZpG3vZdpgEb6ftlqwdNAyuB0L9mt8kJQ1Wja/N5
	YREJwkHHCzQq5R3Uyj/obrheOB+YERaWlTw4pMQPZMmSawEApARJouZqWyDhP492YPw/aU/Eq23
	W+X72IFnGpXkJKKi8IczEAf/Jp/W13Orem5NGGdhSy+D9iadewTb45Vdoi9J1G7GHBM4pm26PTw
	i0bQ+eBCt13TbgKUIhULE1jyBpU3C2sd6hDEHyPoh9kBwc/814Hi5wkvbIti4CLFXPxwxE1C0s1
	0YRmZgeDfinr0oFCRegGvILhpXjhmZfnO4tDAkl3mNFyoljx/Pa6t5+IBetZeC9/PTZJ+jNj4VX
	Bo+xTcvXdeNaeld7zQnnhBk2c+sD9uT/i2qbvzBGip1tg511Su6
X-Received: by 2002:a05:6000:2005:b0:48e:a13:7c8d with SMTP id ffacd0b85a97d-48e385ae732mr5020513f8f.49.1792772300560;
        Fri, 23 Oct 2026 09:18:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d421f65sm738672f8f.48.2026.10.23.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:18:19 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:18:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shuai Liu <847807867@qq.com>
Cc: SudipMukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: sm750fb: remove unused macros in
 sm750_accel.h
Message-ID: <atuIxyy427lxFwag@stanley.mountain>
References: <20261023141143.183061-1-847807867@qq.com>
 <tencent_6CA7B248C9B3374DE2DA88094C98BB5F4B0A@qq.com>
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
In-Reply-To: <tencent_6CA7B248C9B3374DE2DA88094C98BB5F4B0A@qq.com>

On Fri, Oct 23, 2026 at 10:11:42PM +0800, Shuai Liu wrote:
> These macros are not referenced anywhere in the tree. This is part of
> the TODO item 'refine the code and remove unused code'.
> 
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---

These are macros which describe the hardware and they're useful as
documentation.

regards,
dan carpenter

