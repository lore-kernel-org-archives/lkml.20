Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B854E37F8C4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788205910; cv=none; b=Gq7xPWRG35VnETLSWMmc6Zi0ByDvkYPPVKqw6Zf0QIiB+gupSQi0PL6who+WE73bPuDouq9wr4o5DRKZxZfwP3XlxiiOrFL+NGzLsLOC3IQtmIkDkKIQep+ILEFIhR9BoWq05tISUM2PFQEjzn3c1H5MlHm9arQJ5r2rqS3pTvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788205910; c=relaxed/simple;
	bh=8GBQbMASl8cHfqRHybIZtP+fZITVL+GKBwJbBDhA8Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKur5va35e3KsfNeaWHzXITd4YOfPtpawUdMZwo+ZIzshnDkwGVvAuZ3yAhKFsPX2fYeL1/E11OrQH4HXoyJfpC1p3cZUSlckqVsrXGEK3E1TYGE8mKEOh/nMp3k+cc3MImO3U/B6fGxDcX7zOtVd4jNyS0/84GXA5JCInsQHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+lWDkjr; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+lWDkjr"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso3832940a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788205908; x=1788810708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSN6irl0QN6cVOL+8O5NBiukOolBZFdP9haTkLxleH0=;
        b=A+lWDkjrLPzJmkreVb5+3hzX0T4ifNL5yLAcaS2kCOF5KiSmK40ch3/kCc1I2e67u8
         9zqGhyLVUtn2fAKtEoQ+awd2mnejfDsOJWEWa0DlNeC8rFGNDkK0ULU2NaTbeQsKenvE
         0B+eBr8/poDFiOK3JBxRUdK/vtBzRUrerOQWZL/THFLHfsckYDByMXmE4+ORHwFu3wo0
         +JDrXTj6oK9OyjCOYUcqAaBBGn5QhTtxxoFoI+RFRqLDz/myilQau6X6DCFQQxnLJrkC
         HUadymq4ZtGvoG6AUlap6sG1TqmMxcVN+i2f+jfhezFw4Fr7q5lE4e7ZpLZxUgDqL0OF
         bNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205908; x=1788810708;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSN6irl0QN6cVOL+8O5NBiukOolBZFdP9haTkLxleH0=;
        b=XjdExd2fFgo/WrxnS+LinQsupKb3TRIPqa4Q8tNAJ9O1Yu04S8avfif5c8t6MdCWz+
         JgL9XFrhpO+jnTQK7Pz8fQzmGnlcAyoMxDbJiRImAD4ZDLLLiQTZ3r7TNDVr5fa1Fn23
         MlTxILUSAQandtU+0dMlYfgkk6ATEu3P0bBjj3je/xf4ZknzX6sERCJThCTKK3QZ6wuz
         gKVuUqU6KT5LefJbsy15NIVWuAPfmu6gAhIHZPckmuwUcr1It5vfaaaXDryISIiH5EpD
         aAGMBGpokMa0grClJJoFEO5X+zFTfFK+8dfm676UBjZxotPxYSScZtciOj7yCFCGU1Nm
         cZnA==
X-Forwarded-Encrypted: i=1; AHgh+RpeVUlMvBOdO1Go+aJ4zTPL9GM+QUAGdMKhJv3id9zBzX4vbwx3WVw+jg1FbvMQeX3gyFX8TitZnzSOxGA=@vger.kernel.org
X-Gm-Message-State: AFuF++mJmT9snSLTE6gvLsDMDgAZvD/MJ2uMb3ugd7+9r1zl9tiv/1hu
	haFy7XTtwpgFIFGI3aX8Ed3BUOm5Jz2IWfXqmZGBZAiZBTLmGNHadOkT
X-Gm-Gg: AR+sD12N5JIxMKWuSZm18MOWblWRAVWjUF3wd7OzltGvlH4YIiqf7UokUspg5J5UzjT
	jdCKdA63iHRNeRBN9vzqW8/3o2jjzdewNKfSWc5tQchodo9XJMGBvALS9f+w5yHwB/ofG5TfudA
	rpsf6vKfU6dcZYculKoHgPM90RyeaJfD31meGSBfZTVrklC7Ad/tD/C2UXCMpb2+70hsk3Grq6n
	+DgB4yvd/i/HLazFkRQcaglbXUIcSJMq9DYFcgPDOXu2fpd7swqbw1Hr4XTnqKPJgzU2ToN3CTl
	GyLgdFkVwxyn3Dr79U2lHvQUtKGiUMnYuOQcWAJKATQYAhr3ROh00ZUHj40M7vDXTW5ktNFSAmU
	ZFyvooZQp8K+WZWdY1fEA8vO1rhONnoGLqQYcUQpXFvYahWAZDIOgDeoxvheIzaQPqtL1QRjQCr
	C6id+AnlhEtkbTyMfx7xehoSuTTsov+5rRXvC8UDgtEdb+FimKfnYktltvnu2PCWGG1/pAtYX92
	pP4u+7jt/g/SZQGyfINhyAvu/RnDw==
X-Received: by 2002:a05:6a20:9f90:b0:3cc:9620:5816 with SMTP id adf61e73a8af0-3d266571fbemr49712922637.8.1788205907655;
        Mon, 31 Aug 2026 12:51:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:15e9:e9f4:23e3:4f32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm37387665eec.9.2026.08.31.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:51:47 -0700 (PDT)
Date: Mon, 31 Aug 2026 12:51:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] Input: tsc2007 - Read "ti,poll-period" as u32
Message-ID: <apXaYJhFnC0UCHb0@google.com>
References: <20260831194352.1185860-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831194352.1185860-1-robh@kernel.org>

Hi Rob,

On Mon, Aug 31, 2026 at 02:43:51PM -0500, Rob Herring (Arm) wrote:
> The "ti,poll-period" property is documented as a normal uint32 cell.
> The driver used a u64 helper, which makes the helper type disagree with
> the schema even though the stored value is still small.
> 
> Read "ti,poll-period" with the u32 helper matching the documented DT
> cell size.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
> index e4d7da0f4434..e2f49b37e18c 100644
> --- a/drivers/input/touchscreen/tsc2007_core.c
> +++ b/drivers/input/touchscreen/tsc2007_core.c
> @@ -221,7 +221,6 @@ static int tsc2007_get_pendown_state_gpio(struct device *dev)
>  static int tsc2007_probe_properties(struct device *dev, struct tsc2007 *ts)
>  {
>  	u32 val32;
> -	u64 val64;
>  
>  	if (!device_property_read_u32(dev, "ti,max-rt", &val32))
>  		ts->max_rt = val32;
> @@ -237,8 +236,8 @@ static int tsc2007_probe_properties(struct device *dev, struct tsc2007 *ts)
>  	if (!device_property_read_u32(dev, "ti,fuzzz", &val32))
>  		ts->fuzzz = val32;
>  
> -	if (!device_property_read_u64(dev, "ti,poll-period", &val64))
> -		ts->poll_period = msecs_to_jiffies(val64);
> +	if (!device_property_read_u32(dev, "ti,poll-period", &val32))

Do we need to handle -EOVERFLOW and keep compatibility with device trees
that used /64/ to match driver implementation? Or we expect that there
were/are none?

Thanks.

-- 
Dmitry
