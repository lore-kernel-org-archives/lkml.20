Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535648;
	b=ruDwKaZ0Nb0vuu78RAyV3NOOu1JpX4kUebuC1KpPHTrElfYwiM2YKybHKlbNBCT6DmgJ
	 TclBjkxGeNCm1MOgPKe5KskpikGzmfPCgiKGMAzumIozGy8adYqZ/prq8afWVckOUdhjc
	 h5nFOs/338zO5CtHfZk93eHWdisELA2HGRhJLWwBUGC1b851wN0+DVMECzxOt4IVwFyk4
	 Z8rS9uP0h9rmC5EflqYxMy61JEYeMQ76WOhucJs3bX06hVuj6utUOkaJRfZtxnl10QUlG
	 AKX17uDMl6+ZUmS4F1VDMobnNtytNQIzke99QGcuPSAY2VmF+3EjxJga0DEGTlDCX5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ilMa8acf5SBfyXhzvTTwFhD4qHERM2c6bWjfpOKNnKM=;
	b=wZ4h7fRCKQpziT6Qba67/UcV7RF2EvcHnD+x/voBLC+/gd+TFSy4pWsUqAPP6OeMF3ZU
	 W5X7VBAyHvylHv2aza0+Wv2YrgVMXNcOWrqnDw3y4s5IqX5IDa3X+13Mry3oSfAxEkzBq
	 xzSoCnsVaPO7UULaC+Q+/YOUGkzUowzJH+yHiBYYo8hQLgGXmmOMVqw0l335vHCs87wXw
	 /kQ961JjFs6SXQUWlDeSwTS/HFyoL9hmshNnc9PoGRQcvJfJ59pOmageQgj5PKwDYc4Pm
	 hWrSZOjFhTr3qJsXrfhIEwp0hBQwWZXfqyuncITUAPHm++ECWZxCV0ggiLRIps9Posg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="NQhu9Ql/";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B79606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B79606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=NQhu9Ql/
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f036b17easo164549eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792535646; x=1793140446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilMa8acf5SBfyXhzvTTwFhD4qHERM2c6bWjfpOKNnKM=;
        b=NQhu9Ql/WxpK07mU0UC5DGyA39vIavQxoROnA0QiEZrs7z+1rNR9kJgd2HKsdNFj39
         myLsL1n7IAeyp8e1oMK8BORUnkazEdW+kkhIBFkgrXZA3GZtXO9hLyroI5m+KtsrlpeC
         MZnbx6FCQvlhw7KGAzRqtNZLnLQF1dSG0dsmLntfwwqLy4nekqkjji6lrYbDfDkvyn9C
         2ucsuqsY0XiDaPZJ3ZyKxzlIcHItYZ25ZmM8CYogbhQxqwcaSy1PpKBuUXb0+1UewOa0
         /C2oZwYzlvIgneXYkOZG+QrrXCmo+lucbMp/esuxw1kxHabDvKByqJkAsck8mz+fii5U
         O0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535646; x=1793140446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilMa8acf5SBfyXhzvTTwFhD4qHERM2c6bWjfpOKNnKM=;
        b=mP8/51JtWMDQ5HPlxMJl4bW4cRJlFqcEwCjiB5WYIf2CVBqfEmnwEJmA5g2uk3huuA
         lxiE6XCFJ0nKZxHCPe1vdhf17GT+p/XJWAa1sog/RlM3WzNiKhspRY9B9p9QKmO6TR5U
         dIZIVNv60y2MCat+oCS6nEFWrOJKND7vncofKZ2v5McpQio3tIoox8qyH9A869FM2CeB
         26W2ae3Cj+gMDSU2EMk7rEgZRCmz/Z0K1FJScSdPWjzHf+zSzDD3i655wMNbsfpCm4xs
         CWoQhFT4Tbkk7kb4X9HZW7AiT0+AB3QG0XM8Gv+L0na66/nJiOsmbxPx8JAF9GUKE2Wx
         eyAw==
X-Forwarded-Encrypted: i=1; AKwUvByAHE9Xsiz26XBK/B9z98G+TQiLUDaEWtrWVNVwVR4T2Gu1llQ4hYQxn9xWusvPHEwpsij03aNgkNY8vRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJfZ5nkbrOrbq6UKoXcJjNdXdlFMHOPFx+wPAiFGJbI46kG06d
	ROOGYnzlFkU8HitNPql4OtX6PqEsQ4VQTLSDiDOcsIyDChQGDbrgsDw1bL/9NXEvRT4=
X-Gm-Gg: AYBFou2RRYreTF4SyJnqY4f1H5oFjot6c+EgtyWPttmgDEiFumiPPOCbcnk+VtrHEac
	LLawyo5MLOUm5ykcyUJGEngZnfIjhe0s2qZs0NCwbUIGTE4s/vpHQmm9nBZrtVpSWNwd3Cm401R
	sh3LeXj1nM0Thyj+TCuikfWO2lsMBFjj4YVnKWeu0AXyA6+lIggomgjS45Bdo9MVRxt4ks1Lor7
	DP8DXfMaoUK1f4Bw21oDq1DKyiYCZEfR15I9e9M/Lg2mRDuo3KUHxrxrFSLO7rJXXvrS+ntPVRJ
	HC3F1THDtOC5fqbVSEWKa0fsOf4HoLUP6b10Gr3al8yMehSZGWFRTEUDwwdWgdZw7byPzsrj0oR
	w+U3HHo/0ikHrJ0QZp4HJrqJ9Zr/XgXnC60U8AVDJOw22s5k1XALxWzYU8MHwi/8SXaxppf4nsF
	S+awTQrQH0mTu0fKiREedVuTf1HTchiBcMtPo/o+bYe3af10QnmWu9tGK6rqvCALXa94EeTs4wo
	fbrcEQJW0wVkrMIeawTxFmwhTCowg==
X-Received: by 2002:a05:7300:106:b0:365:f73b:510b with SMTP id 5a478bee46e88-3674e450faemr875743eec.13.1792535644539;
        Tue, 20 Oct 2026 15:34:04 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3674206d1f1sm1519517eec.28.2026.10.20.15.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:34:03 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:34:02 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Md Haris Iqbal <haris.iqbal@linux.dev>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [v3 for-next 1/3] block: Reject unknown status tags in error
 injection rules
Message-ID: <20261020223402.GA1582237-mkhalfella@purestorage.com>
References: <20260928221634.43239-1-haris.iqbal@linux.dev>
 <20260928221634.43239-2-haris.iqbal@linux.dev>
 <20261005084917.GA9160@lst.de>
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
In-Reply-To: <20261005084917.GA9160@lst.de>

On Mon 2026-10-05 10:49:17 +0200, Christoph Hellwig wrote:
> On Tue, Sep 29, 2026 at 12:16:32AM +0200, Md Haris Iqbal wrote:
> > tag_to_blk_status() returns BLK_STS_OK both for the "OK" tag and for a
> > tag it does not recognize, so a caller cannot tell the two apart. The
> > block error injection code (which is the sole user of this function
> > currently) relies on error_inject_add() later to reject adding a rule with
> > status=BLK_STS_OK. This is okay for the current state of error injection.
> > 
> > The delay option added in the next commit makes the rule with status=OK
> > valid, meaning the function tag_to_blk_status() now needs to explicitly
> > match BLK_STS_OK for it, and fail for a tag it does not recognize. Hence
> > make tag_to_blk_status() take a second param to update the matched status,
> > and return true in case of a successful match. If a match is not found,
> > the function tag_to_blk_status() returns false and *status remains
> > unchanged.
> > 
> > A repeated status= where an invalid tag comes first is now rejected
> > instead of being overridden by the later one.
> > 
> > Cc: Christoph Hellwig <hch@lst.de>
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Md Haris Iqbal <haris.iqbal@linux.dev>
> > ---
> >  block/blk-core.c        | 14 ++++++--------
> >  block/blk.h             |  2 +-
> >  block/error-injection.c |  7 ++++---
> >  3 files changed, 11 insertions(+), 12 deletions(-)
> > 
> > diff --git a/block/blk-core.c b/block/blk-core.c
> > index 13dc70e8f55d..c45846b9c50d 100644
> > --- a/block/blk-core.c
> > +++ b/block/blk-core.c
> > @@ -225,21 +225,19 @@ const char *blk_status_to_tag(blk_status_t status)
> >  	return blk_errors[idx].tag;
> >  }
> >  
> > -blk_status_t tag_to_blk_status(const char *tag)
> > +bool tag_to_blk_status(const char *tag, blk_status_t *status)
> >  {
> >  	int i;
> >  
> >  	for (i = 0; i < ARRAY_SIZE(blk_errors); i++) {
> >  		if (blk_errors[i].tag &&
> > -		    !strcmp(blk_errors[i].tag, tag))
> > -			return (__force blk_status_t)i;
> > +		    !strcmp(blk_errors[i].tag, tag)) {
> > +			*status = (__force blk_status_t)i;
> > +			return true;
> > +		}
> >  	}
> >  
> > -	/*
> > -	 * Return BLK_STS_OK for mismatches as this function is intended to
> > -	 * parse error status values.
> > -	 */
> > -	return BLK_STS_OK;
> > +	return false;
> >  }
> >  
> >  /**
> > diff --git a/block/blk.h b/block/blk.h
> > index 2cc03aa54c53..5fa54162c686 100644
> > --- a/block/blk.h
> > +++ b/block/blk.h
> > @@ -52,7 +52,7 @@ void blk_free_flush_queue(struct blk_flush_queue *q);
> >  
> >  const char *blk_status_to_str(blk_status_t status);
> >  const char *blk_status_to_tag(blk_status_t status);
> > -blk_status_t tag_to_blk_status(const char *tag);
> > +bool tag_to_blk_status(const char *tag, blk_status_t *status);
> >  enum req_op str_to_blk_op(const char *op);
> >  
> >  bool __blk_mq_unfreeze_queue(struct request_queue *q, bool force_atomic);
> > diff --git a/block/error-injection.c b/block/error-injection.c
> > index e14bc4b723ef..db543fe27630 100644
> > --- a/block/error-injection.c
> > +++ b/block/error-injection.c
> > @@ -171,15 +171,16 @@ static int match_op(substring_t *args, enum req_op *op)
> >  static int match_status(substring_t *args, blk_status_t *status)
> >  {
> >  	const char *tag;
> > +	bool found;
> >  
> >  	tag = match_strdup(args);
> >  	if (!tag)
> >  		return -ENOMEM;
> > -	*status = tag_to_blk_status(tag);
> > -	if (!*status)
> > +	found = tag_to_blk_status(tag, status);
> > +	if (!found)
> >  		pr_warn("invalid status '%s'\n", tag);
> >  	kfree(tag);
> > -	return 0;
> > +	return found ? 0 : -EINVAL;
> 
> 	if (!found) {
>   		pr_warn("invalid status '%s'\n", tag);
> 		return -EINVAL;
> 	}
> 	return 0;

Doing it this way will result in use-after-free. "tag" has already been
freed above.

Maybe change tag_to_blk_status() to return an int (0 on success and
-EINVAL on failure) and use its return value without mapping it?

> 
> to keep the code a bit more readable.
> 
> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
