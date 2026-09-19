Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588B44F563
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814433; cv=none; b=d13eSUaQiHtgc1fhbZEvdP3FNtEAVEvM1fLxQ0qMW5YSjz/VCy+jDjfcVvkz3Srf1mPbP+l2z7fUSXvSvT7kgBOB9cuTNQAGCGNnpAEw8eWb3uZY5H/jBKCokpL11TyXeWJjwm1uUcPP3XFOhJWTtLNfdjUjs5e59+usS/w5LpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814433; c=relaxed/simple;
	bh=VIlPKBVlHgmbaZc9Wtvv51Izc2ziBzHYlBLpPbDty5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyoGSpPWnnZvGRdKm3Ato/SCMPaQLWP2j9cKTq+x5oM0yqFmhN3AkH0O+4QEZmPjzxCQ4SNvDAOpViZTGNla1owy0anj0VFYwOjA/kOVBVKfGNmzQn7atIKeUw57LCfeY98o2noBeYfVpcoQ39uZGZ7INgmuZTgAonlaCLcABBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyW93Gj5; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyW93Gj5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso881060f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789814431; x=1790419231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfnsloL/wCnbrkfyDwFsxsv9htsOG10LpVReejUHfY8=;
        b=fyW93Gj5AK6aa6iMyOVHGp9qIJjok0L+CNlw/J9wq57OFdUoaxBdNmtKMVz2AvZgt0
         8eL6UVSJg9xGSD3lHdxDFF1PRmO0obsvBVHi+MTjVSt2ShZDNbcIbYlFR5+vdNXZD6Mg
         fsNFphFJrGmPqBhvVG9G0OdE4EAdNWZRdgl/EW1gqGj79zGKm4iRRoBeVy0o6c/n8/5c
         8P5ucUa49EgcYLQme4F0Opge82YCyehoOL6HavxtZ4GjPSZlCGKPtKBWJ0CB+Ez2LCLo
         ouNglJ2pmJBJR+RCJyEZsmQjlrabejMFtHMwfg3x8Zni152kZkKZ+jVA3bwggiY+g2ec
         YvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789814431; x=1790419231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kfnsloL/wCnbrkfyDwFsxsv9htsOG10LpVReejUHfY8=;
        b=sfdjNWCLmTTG5OYDJHQJd75R5z2OOcb4NpRR89DGn14wQAXelLjRZPDMg9Eyzu+q/W
         mCgY3VN4+hVb1S8AEbs2xihViyBgeC8UDeguAA2TN0lJWnh9fGKEOlddUqd64okh8Ssm
         LGALvaSrSyIqnHKnGHBvhnuIY11rboMYxM39eNIOfH0g3HuQtjf4wk9KzI4fv/zv+TpY
         vbrYSi02OfBaGVLf/XBVAxPRUdc50am/jILaXEl+vGvOA7wX+q/uppWvum7FZDi5cTyd
         tlu0vPXW+LsEg4WtZ/T5RAvApCWxPXwyIdyEmot8e7ttvZI+ZSGQljtbZSgg9If7h3kA
         LAag==
X-Forwarded-Encrypted: i=1; AKwUvBziQfGbmun2Bz04axiSuRoXw6fTUO6x57ZnBQTdxz1rf+2SFhD3DvomxmCKLsye7aDgzjF9NkS+gCQKYTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lELIyVThOgQa+YtKacf6kSnnxANik/njj8Qh8a+SGEawD/oq5J
	u2uPuyMK8eSEmR8SbRhprSjsH6O/FVPxnndfXOxIPBPAq8WcqvrT4a0e
X-Gm-Gg: AYBFou3fw044ErTr/jSZ2LfA6f9bz2YFBwkkdsGYa7XdyKQlaYVhGXwnmJ9d62nRodB
	adNhYfqIN1JLDgzFLgx0sU4D2ziTpKGs8qP72y04DCj/+2xavJ0KCRSu2G5CJLqi1+oWdW9bmtK
	jZnCS0/UpWaC5xAccPSqv2Eal6WkCmGQRPLqXNs+yswyMIAHj7uxJywmL/rnsfT5sVf0nO+5wG6
	lDSYXaHb82LUivr9kv9tC5sGjcO/HR3Dnsh7VuWnVLknHmcqQQt6ElykMnpAauS1YKtcCEkMuIl
	eYtRBRDUTMgaKikSiurCGwnYIr6WVjS7DXUZAdGYNild8IKYLv9ymVhvd91TkthswxhneSUgICY
	BzK/E0vJ+OjLwzVbBixq/d0QvjSSfftSrvAjpWUAjfOgFJJIYcZMhkrBVEeGLSoDiBokNpGAWXJ
	jGncS7cBzw/Oi+3i0osZlhpTmOjxWa34RCKCrh7XAc3LxNDgmsOU2IcJbA4gEXSxZ6sIy2eEeha
	g4+Zg==
X-Received: by 2002:a05:6000:178b:b0:487:27f6:a4d9 with SMTP id ffacd0b85a97d-48727f6a70fmr1482923f8f.41.1789814430518;
        Sat, 19 Sep 2026 03:40:30 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229d5sm6576617f8f.2.2026.09.19.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:40:29 -0700 (PDT)
Date: Sat, 19 Sep 2026 13:40:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: remove ia_css_circbuf_t typedef
Message-ID: <aq5mmSZeWXYBrs0o@stanley.mountain>
References: <20260918214132.1135549-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918214132.1135549-1-vladurares@gmail.com>

On Fri, Sep 18, 2026 at 09:41:32PM +0000, Rareș-Mihai Vladu wrote:
> @@ -320,24 +319,24 @@ static inline uint32_t ia_css_circbuf_get_free_elems(
>   * @brief Peek an element in Circular Buffer.
>   *
>   * @param cb	 The pointer to the circular buffer.
> - * @param offset Offset to the element.
> + * @param offset to the element.

Don't make unrelated changes like this.  Also it's not really
correct.  It's trying to describe "offset" using a sentence.
"Offset to the element." is a sentence but "to the element."
is not a sentence.

>   *
>   * @return the elements value.
>   */
>  uint32_t ia_css_circbuf_peek(
> -    ia_css_circbuf_t *cb,
> +	struct ia_css_circbuf_s *cb,
>      int offset);
>  
>  /*
>   * @brief Get an element in Circular Buffer.
>   *
>   * @param cb	 The pointer to the circular buffer.
> - * @param offset Offset to the element.
> + * @param offset to the element.
>   *

Same.

regards,
dan carpenter

