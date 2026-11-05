Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882929;
	b=SmY2ByrDJi2SLZ4oxt2zTLpuhDQWKUlo1CjkIJBVgn+Zexrg7zT4AcgJnOFwWaLgMW/2
	 3ofPIvyYvKV4PWKeh6gAcyEE77J6sfSd0TcififnDi796d71xWiCEcok39IR22fDNsxXb
	 OncwjHYnfC1MpiJaqjimBToptU7BfzVSNT4j4iYy7IwS6jwoDX3zaeFYgZVPZ6AJwEETC
	 yjBmBCyQ2qNanb/HdPnp/QnL5mSQOxCcUgSc/J3IMHBqVa4S6A0aB5nEQjzHc7YL6aSeL
	 3Xckz5nGPqomcWbIXFwsOc0R8nbHFfxIdFo2hNKwAKudedUDuza0zQE3k2eAW6vH8Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FpsCnQXulO1zACpv3lZ/XLdDu6HqgPswy6BO1ThvjQA=;
	b=r1o+p7/nIqY64/Yb82miGbhvYOpxaMxka2GDeUCZj0xkuUnFeC/u1mdCga3muDK2xF2h
	 i/GSGCjsl9ijY54IK3Ds1o+Iua5wu7c2S2Rz/NCAHZLYNKzoL6gSnpdWT5ISYUaSwirqu
	 Us+5aNmUKhYp8BR8U9X8iIjAM3d3os0TPiABGoRaLdLOoDgIcuVt6cNSovfMl3LEOYFp2
	 c84I4zzti75D4qj/OhtbA6vx8B4l1vFF4jMHn6QlcQZRMCx+vMeElAct/Kflf4CVWSApG
	 LjA2dGedvLOuJNfA/5dXXINRE4PEo5GLS75MA+vDOmeo5FJDfDV/ciKXwU/xDaDy6zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HA96C3Dr;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6CC606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC6CC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HA96C3Dr
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso438273f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882927; x=1794487727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpsCnQXulO1zACpv3lZ/XLdDu6HqgPswy6BO1ThvjQA=;
        b=HA96C3DrHLN/jyqIepgGp+YvWNWAcP74Bo3C5bFpShRZqhxLdK4Z6rSNcGXqcUkGXL
         WHpTDpfC1e3ghpAjayvCaBXpjGaZTr5WfrOKl5HQ08Mrd04oTpJTbrM2nqZcLG1RbcH6
         pE1KVs0SNXF+CKIt8JXdsZK+g5BDHLasMRGVpqIoaqLScK97qdYh+yQn85LpRwaZ0D88
         38d/eBGJu8n5QinTAy8Eha7bFtHCLADDqY1rIOXS+k+UT5nv/SXGE7A0iP8+Nd8foD8J
         tXhpQLLl2KXm8l4Jtn0kC67qJkCI0FcH1sWkev/oCY0iisHx24vfp5Gw2vlzlHlhwASA
         F8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882927; x=1794487727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpsCnQXulO1zACpv3lZ/XLdDu6HqgPswy6BO1ThvjQA=;
        b=W6P35LwZ6hTi3gSZHjrcy1fj0OtZwJgzDIUUlysFKIKYcmQ0kWrWsQ25xHkieuxZLm
         XRwWYcdYzmgNpl6HAXcCB3lmdM0qUFEJB87GRUE6Pnvn2nQ0lR1Fhr2LUAH01hESzdTa
         zdiRxqnsxrhXipAwZ+0UNwvbQd4kzd42svzpBgYTtwZiIH/21uXPE/FgCBIC5NxGQkRy
         soxRPbmbXjzgNp78FXu+DWYOrXzeQQGgzcaCZUui6EBvFQrEUiZB7c+cbr/KBDYe4MRH
         tEzkLJ0W9PtlVCEVOSkUbSaFivtSAzH2XXdQqWxaz2FVfKIKc3J23Obp/uqWjYeugmr7
         Or1g==
X-Forwarded-Encrypted: i=1; AKwUvBw0TyuUP2LEnmPCwLXlIIQBbctCxglYvCveYMAiAWbOvh6++gnOI/XU4D6v0rVNUtCs42WYrKcAI9zJUCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wBvVGXYrnBDxmcnJkFOTNsjAJhKvF4hYSKrT9KcbXXNmurQm1
	zv66b1QCrD+MsGnkPnQJ5YImG6nJ3/eKh8PPSDxFlVb/vaNWsoC7SkCE
X-Gm-Gg: AYBFou21o//6XThD42u3xZYry8d0in4hNMVT2mm519X98SZkjGB5MOW+SCQdOoL7eFD
	wQWwGq5nIdjPPI+2deG7mzR07jnbjQirH+XENIHx1DEA2vLVVzEWShmd9hFyElgvjj1TJ+G6EP6
	Ozsnl8fJsMM2Q/c998FsSZc7Lm677ZylMGLKXiZ2XsIpfyeoZuwwnaOYh0pK1thBnQvekPKfPrL
	LJTE6pCRhjNSRpUXfsZMptqjKleaDjb0RqcMWheQUAinKp9HTcg7/QPCRBgrxK6/hvBPcnHEtDI
	zc4t/ae4S7x+0IEYp6PmFvRRBjtKfFLNU1UQeaUrKdblejb7gVyXRC+qczmPChhQ39fQTwBFckm
	9rLbduppm/N8erd0z8kPyKk+oKB/wBk1zQCEIEy917EnbEsdMzlKTfbPirTVFATOGU6IZybuziv
	KHiRtl2MbpxLVvSzTL2AMTfWMEFBMVi1G9xUliJQuLa1ZYbcAwQsMLpGoarSQMFNT3Mzn2jxDPw
	fMzTWRDKSNIao+ZGe2P8r40ABa3mNrTCjw72lIMdsRThJxIBeTM292UvA2usByqojXXhD9tJiib
	CT671JDj6y00YG4X8ae9p9/4Nj/sInKocpDSXhELSM9+3pKrXpAaZcMowIg/bTRi48Gq4bnxEjV
	AiGcp4mQxGx17y2TfD7r8SfRmX+sEhVK2sCHheHfmRpgsUkGfxKyUckeKKxZbsajSgmc=
X-Received: by 2002:a05:6000:1847:b0:491:e477:6820 with SMTP id ffacd0b85a97d-491e4776b1emr2280105f8f.20.1793882926933;
        Thu, 05 Nov 2026 04:48:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d2bbsm10342778f8f.33.2026.11.05.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:48:46 -0800 (PST)
Date: Thu, 5 Nov 2026 15:48:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
Cc: outreachy@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: video: document lock fields
Message-ID: <aux7KmnRHloDL8dj@stanley.mountain>
References: <20261105101222.5478-1-husainsitamuwala21@gmail.com>
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
In-Reply-To: <20261105101222.5478-1-husainsitamuwala21@gmail.com>

On Thu, Nov 05, 2026 at 10:12:22AM +0000, Hussain Sitamouwala wrote:
> Fix checkpatch.pl checks:
> 
> CHECK: spinlock_t definition without comment
> CHECK: struct mutex definition without comment
> 
> Add a comment to each lock in struct most_video_dev describing what it
> protects. No functional change.
> 
> Signed-off-by: Hussain Sitamouwala <husainsitamuwala21@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 3a0445ff62f4..d60be8a741ed 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -33,14 +33,14 @@ struct most_video_dev {
>  	bool mute;
>  
>  	struct list_head pending_mbos;
> -	spinlock_t list_lock;
> +	spinlock_t list_lock; /* protects pending_mbos */

What I want here is an audit of the locking.  I imagine that the result
of the audit will be more than a two word summary.

regards,
dan carpenter

