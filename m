Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A93A4F31
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983105; cv=none; b=j1o5mtAq2yMy/7big/1X/7Wb2OyKyVaYOKCYD9muRcEjhwBNKaNLDH6ytT3Bsu4xbyfLcKF0AFeXD3fh+9OEN1+ROgIaccMHkDtSQP43HPmDkxEXbjRZCL8o5FFOS7Kjrdb2+Xh5LxMrkXiG0+9aLwL/tYnYeIyEsgzlI8bFd5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983105; c=relaxed/simple;
	bh=OGBlKDaU57aWIikOZiQTyHZrPvYCCbBUnGOYY+jW1ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmR+jVjbSqjuFeiW9KsAnb2KBr5DIaPiXhcGMDFMNsrF+IhfTsre5HzSwBKDNl00Gb2lilMyxCuOc84hopjs9wS0EPclw4G+oN3W7t/wBZZD/dkkMMXqVFnDJkJRMdySEfF6RoQ5B0m8IICQXN86Qi/tFOLYz6pHFgwAUxsGDqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1p3+RZs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1p3+RZs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so86777135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788983101; x=1789587901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GhNrf9Y0LRp1wv2SdNEPv5kSwEAJbrBydSJIZA55Rrg=;
        b=d1p3+RZsToAkeyyK6diGP78NVNKR7EfaKpTbm+LDu+B/76IytOqH9iG+8cIwGw3e6U
         mVv9g3IfXpippSxktCwwAIEtpfYHqw6ALzLtjNBWtZ86w/duX0mwTtDGKDufvEQc+oBa
         OjHbWIcre9dD7hdNxTKoem2xQnSqWC4dbwMFFrqi+PpHnlcIEWIbNnEsAju3FN0dR71L
         rRYyljt8sf9Bwun3RGzSHF5r9mI+D1LANG9qyDfOc5lWd/BPPytqUR2roQ5Bm408Obeq
         INB22N6pFStp5SDf5q/BmzU2GsA0M7Siu16bA6LeSeSrk0WiuwaItm/nluL8DYB5FCBq
         rgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788983101; x=1789587901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhNrf9Y0LRp1wv2SdNEPv5kSwEAJbrBydSJIZA55Rrg=;
        b=N/grNor85igTatfzgJVJMMZgVHCmVVl6dDUfcfW5jjiPwtbPAf+eHSRNwBZ/v5ouRK
         EQ3KiU/pCY+9fkalHASgCHO5ExLcURnLCAsU/KiGiftyJdQ+usmYH0AT76gLygdgpFSk
         /OCCj2xHWq7YbQGh4BWBDRKTCsz4hyXynbbYvHjoqneokcH0Tfm55I8h1X57BlFYRj0Z
         7yB0A07FUDNADlZVLXhjgkY7AS4bHbfsiZK2RT3xs0Wv1IpVIY+twQoY2LBv6J/CHsJw
         Fqs/NbfA/mMlVyz7IEhZxaGo6gywVjZlMcDf0YrfPErPyn8ZJ5XKmgZiJ+uVDCuKPBkZ
         oHHA==
X-Forwarded-Encrypted: i=1; AKwUvBwlWTBdmtLdZ2RVHOsFpR80noLcKLUZ2DrjEWAzPBtG1YxpLI4OG0xU8tP5OfkxiaXP5VHozAhkAdddqNk=@vger.kernel.org
X-Gm-Message-State: AFuF++k78LnJobxGiccx/+krPWmBzMw/UOOlLJT3HU6vp2uU6KUTjbYX
	hllvBVdkXdYHRfYqOVj1fo8kqltqKllwNWJU/C57dVY0/4PeRvfmiT/GzX+yIUFD47N2sA==
X-Gm-Gg: AYBFou39V8Ng713TPH/XbSQ9UmhwE2OUprmJu05XCSE+8c4Z9pZEw3XLFUwDViDhXeG
	BZcnKbHbcjhPa7rleNP0Jjm1AgHiNKNfqa+8KpyaFCzim3ciMroTNheE/MAdS9kenfawxo58/iW
	t8k2gD3telH3ZoUfHnkp4lTUFPKcUglMITGUqWWBxe3ZiJtve3IaqcjZzVbbWQ+e81COIvWqs9v
	VLYz0xb27p1eTRkh1Fg6ZjSlt6YGnX0JpPQ02Ru3gwujsvpXNrjBQhoL6X3cxB7aA9NwtCBg/0w
	BpB2RzFHAYy/CrxIvjer43nZK0ORsnA84zM5PSpBII6py9vShZrZ0+qcVnlprjZdL6J2/QgDR4k
	Yw62S4Z81+ag8ehTNzp9aW+8HjTzj7lt4gpPQgMvxe5i0WhWj6ux8uZ5Gzz04PD5ov70mtGfbTd
	rXk1olxuHxo1By+HplZvkcfIQZ5341IcMO3htsRepNwtIm1VbG4TFrRaC5skZq4QnkPYQ=
X-Received: by 2002:a05:600c:c168:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cf826c5f5mr363033825e9.13.1788983100863;
        Wed, 09 Sep 2026 12:45:00 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm12022435e9.10.2026.09.09.12.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:45:00 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:44:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: contectforbusiness@proton.me
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rmfrfs@gmail.com" <rmfrfs@gmail.com>,
	"johan@kernel.org" <johan@kernel.org>,
	"elder@kernel.org" <elder@kernel.org>,
	"greybus-dev@lists.linaro.org" <greybus-dev@lists.linaro.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Subject: Re: [PATCH] staging: greybus: camera: fix potential overflow in
 debugfs buffers
Message-ID: <aqG3NyxZE-Sj63vb@stanley.mountain>
References: <cfUNtu1Qjzp-pieopsMQtanXUJTuVi9kZQ14w2f_jp55EwWn7Pnu5EwFUNI2vAWw1vWe3jD7Mz4IK6t1iZLQLE1fEnjfYfQdBV8tZF6Q4aM=@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfUNtu1Qjzp-pieopsMQtanXUJTuVi9kZQ14w2f_jp55EwWn7Pnu5EwFUNI2vAWw1vWe3jD7Mz4IK6t1iZLQLE1fEnjfYfQdBV8tZF6Q4aM=@proton.me>

Your From header is wrong.

On Wed, Sep 09, 2026 at 05:15:54PM +0000, contectforbusiness@proton.me wrote:
> The debugfs buffers in gb_camera (data[PAGE_SIZE], length) are written
> with sprintf without any bounds checking. The four places in
> gb_camera_debugfs_capabilities, gb_camera_debugfs_configure_streams and
> gb_camera_debugfs_flush do:
> 
>   buffer->length += sprintf(buffer->data + buffer->length, ...);
>   buffer->length = sprintf(buffer->data, ...);
> 
> If the formatted data ever grows (e.g., more streams, larger hex dump)
> or if length is already close to PAGE_SIZE, this will overrun the
> PAGE_SIZE buffer and corrupt memory. The driver is debugfs-only so
> the impact is limited, but it is still a real bug and the pattern is
> repeated in multiple places.
> 
> Fix it by using scnprintf with the remaining size:
> 
>   scnprintf(buffer->data + buffer->length, PAGE_SIZE - buffer->length, ...)
>   scnprintf(buffer->data, PAGE_SIZE, ...)
> 
> This is the standard way to write to a fixed-size buffer in the
> kernel. It guarantees we never write past PAGE_SIZE and will truncate
> instead of overrunning, which is safe for debugfs output. The return
> value still accumulates in length, which matches the existing use with
> simple_read_from_buffer (it will just show truncated output rather
> than corrupting).
> 
> I checked that this exact conversion has not been proposed before:
> the recent greybus conversions to sysfs_emit (light.c, gbphy.c) and
> fbtft/vme_tsi148 scnprintf patches do not touch camera.c at all,
> and a search of lore for "gb_camera_debugfs" shows no prior patch
> for these four sprintf sites.

This paragraph is meta commentary.  It doesn't belong in the commit
message.  It should be put under the --- or just omitted.

> 
> No functional change for normal sizes, just makes the code safe if
> the buffer ever fills up.

This is a frustrating sentence because it means "no changes except the
changes."

The commit message wiffle-waffles between saying that it might
be possible to overflow the buffer now, or it might be able to overflow
the buffer in the future...  Someone needs to do this analysis.  Debugfs
is root only, but if this were really a buffer overflow in the current
code then we would need a Fixes tag.

> 
> Signed-off-by: Vaibhav Agarwal <contectforbusiness@proton.me>
> ---
>  drivers/staging/greybus/camera.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index 62b55bb28..efc83ceff 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -890,7 +890,8 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
>  	for (i = 0; i < size; i += 16) {
>  		unsigned int nbytes = min_t(unsigned int, size - i, 16);
>  
> -		buffer->length += sprintf(buffer->data + buffer->length,
> +		buffer->length += scnprintf(buffer->data + buffer->length,
> +				  PAGE_SIZE - buffer->length,

Better to use "sizeof(buffer->data) - buffer->length".

>  					  "%*ph\n", nbytes, caps + i);
>  	}

The size parameter of this loop is 1024 or less (I think, I didn't track
this all the way, but I assume operation->response->payload_size is less
than original size).  We are printing 3 characters per byte so that's
only 3k which is less than PAGE_SIZE.

So this code is fine as-is.  Still, I do like future proofing.  Remove
all mentions of "potential buffer overflows" because future buffer
overflows do not count and we assume that future programmers are not
stupid.  But using scnprintf() makes the code safer and easier to audit.


>  
> @@ -973,12 +974,13 @@ static ssize_t gb_camera_debugfs_configure_streams(struct gb_camera *gcam,
>  	if (ret < 0)
>  		goto done;
>  
> -	buffer->length = sprintf(buffer->data, "%u;%u;", nstreams, flags);
> +	buffer->length = scnprintf(buffer->data, PAGE_SIZE, "%u;%u;", nstreams, flags);
>  
>  	for (i = 0; i < nstreams; ++i) {

Here nstreams is like 4.  It's not a concern.

>  		struct gb_camera_stream_config *stream = &streams[i];
>  
> -		buffer->length += sprintf(buffer->data + buffer->length,
> +		buffer->length += scnprintf(buffer->data + buffer->length,
> +				  PAGE_SIZE - buffer->length,
>  					  "%u;%u;%u;%u;%u;%u;%u;",
>  					  stream->width, stream->height,
>  					  stream->format, stream->vc,
> @@ -1046,7 +1048,7 @@ static ssize_t gb_camera_debugfs_flush(struct gb_camera *gcam,
>  	if (ret < 0)
>  		return ret;
>  
> -	buffer->length = sprintf(buffer->data, "%u", req_id);
> +	buffer->length = scnprintf(buffer->data, PAGE_SIZE, "%u", req_id);

And this is obviously safe as-is as well.

regards,
dan carpenter

