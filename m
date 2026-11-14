Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627639;
	b=otUB8WrtkcYRgQI3q3/Pb2gRrL+EBQoqy/T7YJ9the/DB/HtY4a790klBwCj7YuXYFQ2
	 GMLtT7ORgDa4+90c2wubfCQ/eSfawUa0jzPZtX21NWAuTOSP2MWbHrOPMd5I+wO0qjvee
	 QRUbXF/tb0OFfCFUAon90rlU1VgCAfDEWEcklcpOIj+4zV7n2d295ce3yUJzNkcl/7/uT
	 kNpbjMARDZyf/Aqbq5VlGqmZSn7kBwYDeUWMp0DtN4h1/2T64BwGVzESY9yOa6/nmRGmu
	 BwmSp2yNNztCjK7c4V1uPTzgkmkIcqUyXqHygAkfw1psuA7jSyIz+GjDBpgstkLNoeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9lfiTmTTwOsXaOAg6UD5myto87YZ73nIULewOuV0cPI=;
	b=pSlEh3xVDuhlrhrdzCtPKX0K50wFwFOm4L1/qKF1uv0c8C7X1XWiWWQvML1RO1QZtNio
	 1J54i1zOOwqIjIMe1CGiHEIlkyBQEAeASRW2v3dAqpMsRKkRLwxtKu70MR56HtD+ACPtE
	 S87U1/z2Fi/ymZzMH/tYCsAGYnbvd25dljtOSzpR3grBTR5nrpJBq2WF4DrWEMS7RaG0x
	 PusRyaaEMSegLtjtTIwcw+t22T1VffX5RhaYmgsbT+37eoPtnG+ptp+lQK19Yr2GtJY1G
	 1xKJF/UO8Oa7CsaOxRiERXIoRJVlpy3m77EZU3oAyx6ZHSZTVWGpP6QHhHjDtlDB89Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=wtimMCrM;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D709606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D709606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=wtimMCrM
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9496400270fso30054385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794627638; x=1795232438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9lfiTmTTwOsXaOAg6UD5myto87YZ73nIULewOuV0cPI=;
        b=wtimMCrMvYIMRdde/PNMpOaHC8qTxk8XBZpiAcCBnmfuVKHWqVsrHRTlWcJbDsBayI
         kMac6vluRy+qgsg4Z74I25x3laRgAKSM+PyKPrO+fiN6QIiH/l7Jn6jf0Z7kAqiwZcrW
         LdItXH/FC/+XQ8tFS3GqOg+i+OAxqXAmDp0+9VbkIEyYE28kExx6KFohZKqDHhOc0+OD
         yla4LnCrtTrXJEe45VlN5pmxy7yzom44ReYse++ObV8ZkrUu/0W6W+cBV6MtgiayJpzU
         ZGVPNgI8mLXf1PLYMHXockb+EYVuzXYkaXthwUVBViNipfxkRNWhfhZnE+6qi74j5sWo
         a41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627638; x=1795232438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lfiTmTTwOsXaOAg6UD5myto87YZ73nIULewOuV0cPI=;
        b=Z/ZJ3GLctrC6gJJdtILQ4Fq6gWXyi+iPWOcjU90zgSYxN1xrG+GfzQZeQxrhDzgY0Z
         XeA5v8lQpbXx4qyAnA3sYJM8pbBHAEi+0xWwBHQ/E/qHy4GLfu5o5Q1yEojvIX5Tbp38
         5bD5JGq+PQBVHS5kgXkEIqN/7W1DFtzFthE58jQm0+R3+XobLww2iXsRyCfzjBe5lFRU
         fxeTbZrH9Se8h9m2KGJOv9LBbA0EUNjq0YeGty1usss0TD1cFd5QRJ0wGF1z+Xiaj5Wn
         Q+F1H4rfWOrN2n+Lc37ZemqbwcgzMYggFdaHsDJBRVI9u8V90gZBPhLCb3ROLou1tm0t
         uGVw==
X-Forwarded-Encrypted: i=1; AL+hErGp8pWvMUxqxof/sd5joWQSZTjwWVYfdOdZTXs/SdJS0LDWQwOzx0gGslLAihgu+Ze52Gh/0TWYYPgg0nQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NTGlBGsaqn8JLsPvUxNsbgY4KgfyRHOHJjTR5HVRfVaXnrA18
	FNErGD+6zAa1axgLNjdKE1VyjjqaVD/iCb7kUBHwRIcxo72DtRNWs75W2fS0tfHBgw==
X-Gm-Gg: AYBFou20BXVKcCK7A1usApy0E1km0RHqHisJFJL3van55ISTQfv/4JExRTG0OjYAcZ1
	61EY3RqERgKiMpLBLV9PLCfRRxexH6/dvtLb3IyehLCMw9XleiVKXIBVsPH5rUhMslV6YbHQNgK
	ssc3eEB5smikn6C25YDdE7Ovn51SNJytT0/fid3S+jsm45kpG7cZvkavLaxTK+ROZXxfTXjgKAx
	C3rLrSlgioKFTTQAmqtN4RXoh7+1N+dXMNHTX5W7/QTJCNdrIYlzQQXMJRduBvDbBEMF1LyePaQ
	G0AxFoDFJmdRyppiQHpvq38Wpkz7aQH66vyZ232z6FukMATUyVvZenXJb1HWg0xzMHPYtvgiUoi
	u504lmPw7SvuEVs8mDEet+D7uZRSuV+IVno5OWuGNnU0AV79drVaw+A3Q53LQyJSf0WnlLl9z4O
	M97GNecbzSEjLlo35OE+/ArHZ1RMkUba61BdZlIMDD0F7qtwhevIscEt2QKGJMNzpO99E0IyTHm
	jW0RzgCPrzcIJ8k/EAMOBPWJQ9G3qee4IXwvauG0BCzIbBRB/V1PV9vj4gBlDN54srnEoTQAcbY
	tkw64rRiwE4CYUYSAoV199m5FNlhVLX8TZKUbFZfwck07pMqmS0=
X-Received: by 2002:a05:620a:25c6:b0:93e:f97f:f245 with SMTP id af79cd13be357-9494bc260a0mr686194885a.30.1794627638105;
        Fri, 13 Nov 2026 19:40:38 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9cba8sm34619686d6.1.2026.11.13.19.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:40:37 -0800 (PST)
Date: Fri, 13 Nov 2026 22:40:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: Re: [PATCH v1] PM: runtime: Update last_busy before calling
 rpm_suspend() in rpm_idle()
Message-ID: <3430548f-6871-452f-80c1-a25613a53575@rowland.harvard.edu>
References: <4789427.LvFx2qVVIh@rafael.j.wysocki>
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
In-Reply-To: <4789427.LvFx2qVVIh@rafael.j.wysocki>

On Fri, Nov 13, 2026 at 02:27:23PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> When rpm_idle() is about to call rpm_suspend(), there are no reasons
> preventing the device from being suspended, but if the device uses an
> autosuspend delay, it needs to be taken into account.
> 
> For this purpose, rpm_idle() adds RPM_AUTO to the flags passed to
> rpm_suspend(), but doing that alone is insufficient because the point
> in time from which the autosuspend delay is counted may be too early.
> 
> For example, if the device has children (or consumers) and the last
> of them goes into runtime suspend, the parent may now become eligible
> for suspending, but it may not be worthwhile for it to suspend until
> a certain time later.
> 
> Quoting Alan Stern [1]:
> 
>  Let's say the last remaining active child goes into runtime suspend at
>  time T.  Let's also say that the parent expects none of the children
>  will need to resume until time T + D.  Is D sufficiently large to make
>  it worthwhile for the parent to suspend and then resume?  If not, the
>  parent should remain active.  If yes, the parent should autosuspend --
>  and the length of time the parent should wait before autosuspending is
>  on the order of the value of D (let's call it D*) that corresponds to
>  this crossover point.  Thus the parent's autosuspend delay should be
>  set to D*, or something close to it, in order to achieve both
>  objectives.
> 
> Moreover, if the parent's autosuspend delay is set to D*, it should be
> counted from time T at which the last child has suspended, but that does
> not happen because the parent's last_busy timestamp is not updated at
> time T.  That leads to undesirable parent suspends occurring between
> child suspend and resume [2].
> 
> To address this issue, make rpm_idle() update the last_busy timestamp
> of the device when it is about to call rpm_suspend() which most often
> is right after the device's last child (or consumer) has gone into
> runtime suspend.
> 
> Updating the last_busy timestamp when rpm_idle() returns an error
> without calling rpm_suspend() is not useful because the device is then
> going to remain active for an unknown amount of time and its autosuspend
> delay needs to take effect later.
> 
> Link: https://lore.kernel.org/linux-pm/fc43eb13-816b-4cd0-9711-848fdab605ef@rowland.harvard.edu/ [1]
> Link: https://lore.kernel.org/linux-pm/CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDNbp+eQ0S-E52DETWjQ@mail.gmail.com/ [2]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/base/power/runtime.c |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -560,7 +560,11 @@ static int rpm_idle(struct device *dev,
>  
>   out:
>  	trace_rpm_return_int(dev, _THIS_IP_, retval);
> -	return retval ? retval : rpm_suspend(dev, rpmflags | RPM_AUTO);
> +	if (retval)
> +		return retval;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	return rpm_suspend(dev, rpmflags | RPM_AUTO);
>  }
>  
>  /**
