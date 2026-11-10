Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331921;
	b=hWPhVDkV6iSdKcLXf6QDtBck4LXArItO8slkZY1KMKJVgPQYU0o4eZES4YjT3PrheAX3
	 LmxfIXuRXhN3J3eYHqxIY8uydvfq3kUSBIvUmmuyJX+WyMInkwXSA0gEIWYnGVk3tTrjm
	 sjYAREYs8fUks0zobP7d5JO9lKlWly9tAplcIMqPavi9cBMqgrb+adOkczXs/QVO3Y3ts
	 hEp3chyFiaeFIc5/YvPtekglBmwD2VF8IwmuFzU4cVtJPWthuex+O4rIezViMHvs8Pr2Y
	 kUb/dGLtcU/n4bUoWLKlL8iG1C6jMSzo+C+sWBNhJ5XlF5CYC00xGDCT01dwrSrGP4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=yE8RUk5F65DsrfpnHDuVWA31H8kskcbAMcGhVlDu/Xk=;
	b=10Sh56daesNprLerIGlfH1yHCEu3brfcUc2qr4BmfJAxBuSbnxxzyKxiH3TIGJUe43HH
	 WBtn97A8OCsWApJFwUGHBeyc6hVUAaDJIRFT83ujAPPqS84QBTa5l33Q9umWNbZFjLh6g
	 xgIBhHSs6rBGDE1zhKXslQKT3nhIGlbQ3ow2ioA+98wSV+gnM2jkFHQT/mtYtKT8oYGgR
	 cxgTdRSDEN/k3AWEFgyoAgvKtLjnfetTUHT9B7n0kyYvL9M4HImmiczXmY2B/w9faxy7k
	 fKn4+V1CwSefjTY9/bYWPlObokLC0vQqeaG01pZHte9I2HtIPDErZMNWxv2jHa/Z6jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtX+QMRW;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495F606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A495F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtX+QMRW
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3653937eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331920; x=1794936720; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yE8RUk5F65DsrfpnHDuVWA31H8kskcbAMcGhVlDu/Xk=;
        b=qtX+QMRWcHelEaPp+zH/VWRCnNWuslAuYoNqAhGADiBa3DGx+5nFvOgKICPel5YOr6
         isBQndJ3/Zs9dKRI7CA8YuXieaFd1LdQcB5AOzyUalwhx5MYJ5JAsgDV/9PT8GPpRcX6
         NVvDHwCUbTkOONSEFx22w4ldDABKesrxJxbyjizNjITeozA9wLLPywJlk4KZcs/v4R0U
         GK8wCrAN2KtzE1YlxnPhWg4aS7Vux3YQcEauGkixOQ/mwRc2dX/RTS7gRED+pA6LLI/G
         59LTfYkb7TT7h2xoN56U5KYcg3r4W7JtqCn99zPVe/ocgNe+iycK7bKsZB1FMWeB/F3Y
         DP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331920; x=1794936720;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yE8RUk5F65DsrfpnHDuVWA31H8kskcbAMcGhVlDu/Xk=;
        b=oOUv+6jO9PZreKflQRn/jfzZt7E/4xY1MzRYwg6I59/HhPcv4AWjxuJN1dP5CWpxtE
         dlQyC/tMfxAIbteWPrgErVUkVRvWfQS41IahKSHkQ35PbVLFpCKDyfyrcl64fdF9gHZu
         mDM83y/pUhWW8R8rdxlp9blt2Sd4MyDmmrJ3uxtbJ7TTlC08HHshTgZI3SG8zfUEqhZ2
         0QkEKawDnvL4K3DdJwv9yYws04iqgyoa89yAtWR4DiM/NGhKRKchcu2638mYzzonVckl
         HH+bERSNDzl/LAGJmIUC/5qOzh4hiuhiqTQuEQ1Hw0ikDwLQ5pGk5xO5/0WJ5z3cOgk7
         v3ww==
X-Forwarded-Encrypted: i=1; AL+hErGicWZLelemoOZlFAchkDylp/7RSfHn7o4UKgwoGDbjVXv97mxaLkJ6j836bWzz+ZoH3DDliWuzwdcrtZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zqMSNfQKBw5/mD4r4Xxo4Yzhz+P5m0mAdJcWeOfl2J7WpA9jN
	i2fG983HX57jvqg1Ccip1qKlSInkj3q2Uua1hlC94j2MWEYO381gWggy
X-Gm-Gg: AYBFou2B8zWvxqCKQYWDNmgQ9cql1J+ichg9TsrWBuQuGPaIumMLzcAEuDbVCGmkxYS
	19K4ibpbf2O8XNw36N76WhoUQfeC9m6+3uv5LwAg4ibinwtGwzh0X7DBY4bsQnJWySV621sYZ52
	UsMZuIaVQwTdqpO6gT5STeLY0PvVGjnM5XRpOs9PavFheQut4HRI8A90+zpOfTp+j4XHK99+A6l
	VitkN+RzWQEHquIfWlEFJ/+T6PeFEyQ3c/JmAPOBsD8vZpLp2k1wEqc7a2zbAitMdqBJAmQFpI1
	sgaWx72EOEG7MsFjvkN+HYK1ZQ/Fevi3ZBmoEVXkdcZSx9t9wkmlExfMoYCE2xlhiNeUT08JExX
	oO5uk/FoRtr1RXgy2KS0E1YkLbMPeb9L1aBng8G0EdMroqT+Inn3r1LSFfydpmrzqKNAHs7elTR
	yiCa441fXNfInG6vtAbM92RZ38EzY37dXKwBl4vF6zH3wEYPmIAB/CmSHtZ7tIv+VMv0aJHYXky
	zC3pHGhVCsdaXKL9eZLvRgMvYrNOKyw/5lXFBQ5DqYarWj+308d1FF5b0CUWCsOrbdGRjK65Pdt
	HxE/HzXGyc6oJvX1Htl5Fo+S09LPqhjE+53aVA==
X-Received: by 2002:a05:7301:fd03:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-3751ee7c2c9mr4017982eec.7.1794331919552;
        Tue, 10 Nov 2026 09:31:59 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:7392:6aad:f285:27fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm9239979eec.21.2026.11.10.09.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:31:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] USB: legousbtower: use stream_open for stream
 semantics
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: starblue@users.sourceforge.net, gregkh@linuxfoundation.org, 
 legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028182802.25212-1-mdshahid03@gmail.com>
References: <20261028182802.25212-1-mdshahid03@gmail.com>
Date: Tue, 10 Nov 2026 23:01:36 +0530
Message-Id: <179433189678.152716.11457478975708955224.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi,

Could you please review patch and give your feedback,when time permits.

Thanks
Shahid.

On 2026-10-28 23:58 +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> The LEGO USB Tower driver uses nonseekable_open() in tower_open()
> However, its read and write have stream semantics.
> 
> Use stream_open instead to mark the file as a stream and disable
> unnecessary file position handling.
> 
> The issue is reported by stream_open.cocci script as potential
> deadlock between read and write operation.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/usb/misc/legousbtower.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> index 18dd4115befb..b849bd0e9664 100644
> --- a/drivers/usb/misc/legousbtower.c
> +++ b/drivers/usb/misc/legousbtower.c
> @@ -313,7 +313,7 @@ static int tower_open(struct inode *inode, struct file *file)
>  	struct tower_reset_reply reset_reply;
>  	int result;
>  
> -	nonseekable_open(inode, file);
> +	stream_open(inode, file);
>  	subminor = iminor(inode);
>  
>  	interface = usb_find_interface(&tower_driver, subminor);
> -- 
> 2.43.0
> 
> 


