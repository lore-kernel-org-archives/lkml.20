Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782905;
	b=Ebh2Ar1Da6zOG5HzUWJfLAl1kKJmPPgFP3brH5lI15LYT7PGfzDqiPf8rp5Dcgmx2K7L
	 PVih417rY5TCtQu0SiiZMsOPxYO03leHQmMhhlrrByNMBw/gc9ijpMVxZ94NKRhr3m4n/
	 zQimLdY6sId0R2XD5wx+ltgM0vGmIaEFRDH8zJ5JAesQtx9fKxfhSRd4/nthCMWVwlzGn
	 0WkWyv504pFjLURMyTcaNotMl9YDlBwKLunrCVXpLhsMUui9f5BvfMP2UXqS3bY4/iTlp
	 RMIkT9JK4iII6/26B3QvLkLKepfq/JBEOyUbSqBsfMU2t76Z8heVa4jJYH2d3zRuo8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=j5thw4aqlZ2SY83bvfjuNvSX/gTNsfeGcVUo4niR+ac=;
	b=Er+8vL+nLa8RxfKZT8HxAlm3hQG3/AGNLeX3w1HfQLnT9860fYatAUYDNC3G7hFu5siW
	 kTNTRHgwS4YhLAsPg9IqrSo6xgqGm0NZ+OmgmcseIidliMwxPPQ6sZ05slEWYkAIgyOL5
	 4h8ED2qCm5l3BTAtVyxkyfCb/0z8C3oRKKjvG12ZeeqwXq4UhfU974qXwmM/EhNDNWTnz
	 ld5JCHLay/DrTMsJaxYmQ2BEKLoPg84hC9BSiyWJ0myDjauFaeqIXw09P/5osCN98eTya
	 o2Rcxb+vZr43KYX6RzwWdoXXxxis2+WQflCh2FZZFMtzRP3LLK4CczvAmIN/PcpjgsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=syjqtj6f;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8B606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E8B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=syjqtj6f
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-930c0f9c1b1so113700285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792782904; x=1793387704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5thw4aqlZ2SY83bvfjuNvSX/gTNsfeGcVUo4niR+ac=;
        b=syjqtj6feIG5AFFf7XsgD5piN6XF2532Bj5zlfb4nzUPljy+bmkRWUkXg1dinX+yOZ
         jcv82rXH2puWYPvWiIvfzdl0WLMMtLmGDBPbvLh0kJI1Fqcz1Z5QDRcM6E4GVhhGbnaa
         9b0OXcpAfew56ijeNQ9zPxYOuRG1tcHwm5876MnoFzA+OMXCXLgomYbmygPbNAhjGk7O
         Zho+OAbQFnyIt9i4UjG1mv7yyCTMO9XEIBFodHObxq/u/Cj4OwAn9FlkxUvFaA3A0JZX
         W985Ip4/rYLFkOr31rQEBf+ikjWqPSHFWup4IAik3mt9CRODLCvLSTuhraAngsP0Zxrq
         /xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782904; x=1793387704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5thw4aqlZ2SY83bvfjuNvSX/gTNsfeGcVUo4niR+ac=;
        b=zgQuSH4iQAUxYwwJWlGGnbKrBDH4XQPcpXUIYYcCQhCeybT0dpADqIHNKwqbnRwdcf
         CRmE41TvNMUf/jnUNAPZpFhHwIBjJeokuYMrRiogkq4L0c3JB/SUuSCVw/0MVg/qO4b9
         tUKGMsvU05kFy93qSezA+Dzo8h3G7gThLhybafjfr0ysTp24OHXhFzfiWzJyZ0NJFZh0
         Gx0TVzMFWfXt/gdbLqx+pVu7B/4qXNP6p3n8Sm26tLTPPI9VpqDSpFR1vsnlZhro6Vtw
         zvp55yki+Hm0++2ynZlfcclBDkK83SmOkvnpOFkR0qWAqub7lA7vn0rspsrfzPivo+Ji
         WVdQ==
X-Forwarded-Encrypted: i=1; AKwUvByfBV/cWDCGugo7T+cMIt/CR9iXymwc96q9dLRVKWI3eOQkUCmyNQRO5mO9Oq1xlSQmFx/puSjLHyNCKV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/XU+EuWejC1A5i95J8Y203BJLnGJ9rnktB2NmdHVAuV0AussY
	Tq+hWfwQBhiRtZRinoM+fIpJcr71jhtUveTWHF8fQO2CrzoHKao4kY0zBhSzqJy/WA==
X-Gm-Gg: AYBFou0Fb5LPtm8G/ZTc6nRnIpYyE3iNowp02m7Ze9QnxF774MqPygnjS/GXLpeZwY7
	yaRlfKVsXzQqQuFRP1e0GIRvwD6U2TqU7RD+eYghe4o87zuXMjCyrYx7xdNyot0uSqHXZHkpeSZ
	JL98GATodlgvuSquiIooEXvdic4WiHCY3lSkagMHD8eItcgBNd/m1WLlOop6iiVTfeAkiTVsJHk
	ORrjpasD3trEqTOfngi1XMH9w+AmTPY3SXxiZdYBlJletOyXaVhOlZzZcOpHbCmYTwJFDZwgVUE
	hKNm3nX948v1lFY9M4wGZg4ZtZhagCSmf1i7Nmm/+5STRnaJm7OtPwQm5K+h7mDD+hebgWUzS16
	IbBFfMQZvrsFpFkrYyXDs6qa0s4qP2CDNLjKqE5T5mvIYIsFxYA42M7bpixWEELD5UgG61DarxO
	iaW6Jw6HPV1rLiMJoqiKrBMrErEUpVyHuqOC62FT1bfJW6qHs71qbpLuk0wz14qeWMz0UAT/Odn
	4EXo77JaLdwZ139oPIPifoN+tOPKEwyhR0MTwfgIyGdVfFD97ARh6fK
X-Received: by 2002:a05:620a:439e:b0:939:7683:33d5 with SMTP id af79cd13be357-93f6f79bc6emr542030585a.19.1792782904116;
        Fri, 23 Oct 2026 12:15:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9404722eee0sm92440885a.14.2026.10.23.12.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:15:03 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:15:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: core: hcd: cancel giveback work synchronously on
 stop
Message-ID: <e16930d5-375d-4d61-9e37-94dc9a83ba64@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
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
In-Reply-To: <20261023174015.54793-1-igorpetindev@gmail.com>

On Fri, Oct 23, 2026 at 08:40:15PM +0300, Igor Putko wrote:
> When an HCD is stopped/removed (either during module unload, driver
> unbind, or an error path in probe), pending URBs are unlinked and
> completed. However, for root hubs or HCDs with giveback done in BH
> context, the work function usb_giveback_urb_bh() may still be executing
> on another CPU after __usb_hcd_giveback_urb() finishes.
> 
> Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
> after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
> the embedded giveback_urb_bh structure after it has been freed,
> triggering a slab-use-after-free write detected by KASAN.
> 
> Ensure all giveback work is fully flushed and cancelled in usb_stop_hcd()
> by calling cancel_work_sync() on both high and low priority BHs.

Sashiko's criticism has a point.  If there are any URBs still pending on 
either of the BH lists when usb_stop_hcd() returns, something is already 
badly wrong -- that's never supposed to happen.  Whatever it is, it 
needs to be fixed in the driver that submitted the pending URB, not here 
in usb_stop_hcd().

Alan Stern
