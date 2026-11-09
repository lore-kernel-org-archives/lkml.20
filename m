Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192718;
	b=ZbNAzgeN+6fbiPggqnobVQ44wdtRk9GWpQGYSWxKGfAjokREqRJeA/dh7PKYqlmej1Vb
	 qKS9tBcjwmfwfB0uluN2ni3uc+3+hN5t94mURpqPQU9rpR9qw3li8OkNAwXE66cusBLwA
	 R0awVlUMO7299Gs6fIiWjxxmTs9+gPPhHmEuiOIdLUdrlhlOeJEnK1O2m/MZWvHHqC80j
	 OpS2LJ4ecRzLaqW7X0qq/Uxh/KePMyGkkSc7CGq6Zyyq++jKGaxVAakTolVSxaKd3IBhj
	 Tqhppi8gPKk1E1A1ye5KsYweWjIiHxoOrcnPz2+Pi9B97cHjspw85WaMpVWbqbmE+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ThjTfZ/MJMf53cu8iV1tYBuaT0UO+WOxcCiqTzZZCs=;
	b=klbv0jiLOeCyowMkQkOOfYEbmlahuLTEefsmyIP+pZj9CFW/edOtdGkfTrY9eComPS8f
	 RV9IvuIGbz4ZZ2gmWldYyZgZYRDTVTDUEC6Ha3KxnPL2mZfKYtZHpubEDXwZR4Q72jDeK
	 mmTgHpHjXeBdkXhGYriAtcf6aa4Anh0C+1SdmEefWOMkKXbFnNcP3Ged4VCmEg2FkIhGy
	 TzQljUSwGVl51jo+Ec9Qh6cIYvVRfG7WS9Udp0JBsfQyIJMiEiy+lDfKjgb2ohVTF6U0r
	 3zxKguvB1SBZfIk0atl2RUn91F5/wujHIAzXUFbq1HmC3P1iY5r40QmpC/mPjSU3Ing==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=R7+ebgAD;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86BB606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A86BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=R7+ebgAD
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e635220b4so34631785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794192716; x=1794797516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ThjTfZ/MJMf53cu8iV1tYBuaT0UO+WOxcCiqTzZZCs=;
        b=R7+ebgAD+hN4IT3q/lIQ++EVXLhiTty+ji0qMGcf4HyiNwY6sfg7abaq2NZz+QkSS1
         MvTAHnIB/Ps1mdD1tXRVQOl52uByTrXex0lUqQIvSuLrSOolkhHv7pW9PFpq9qd/OdRz
         1wcmfa89RNI4HV0+8V6nCVwqTrINwgN9P/xCFArokSTSS5hf3e3pyrcm/v3UMPstVaS2
         lu4f9M8Bm5Eh7mPuQN5uAGwqoN0RCHCKte4QG0tgmCejwGSCbqKGbu6lmlsQzs9iCz+A
         0MIvzJaP3YM7QNxXC9bTVOsD9KaKWhvyQGNNw19nZFnkFlsOSp2xYFJIdMwzzJNqNcjk
         2lUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192717; x=1794797517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ThjTfZ/MJMf53cu8iV1tYBuaT0UO+WOxcCiqTzZZCs=;
        b=Yv7uVa73bdNW0AHTLAOudsCqcPyshVgRQJbf0XYXof7QPgYLpOz5VwfhiSIv7rDWrz
         2zI+/En6OmX06oGdeaEkeRJBAafQgB67H/T+Vc0OVzGlk1A6Ls6T7fcUNLl0aGw9fjuX
         CmKLxMiY1SOuABJJ6hM0dfz6wOulQC8FXguqq680MnAJs9V+xrOG63DgNTwlTMHryNc+
         XRZYrTAmaXF5gFNh+a96UqKcK3AN1f49+Kvd5hubtsdOjx5dYDwcOY8wmcbuLPDSppod
         QjUqIwJnKjj9+FevL4vzATZY99aZ0eUXCmfYocu63CjR2b3CtVmUt9y91I82v6fLY0nV
         uNpA==
X-Forwarded-Encrypted: i=1; AL+hErHlDyXbJ8HubZqYh22zjI565bc+DSFM9z3VtWfsCJb/4pX1TJdXRYHLTrn4SF1hj9PBHOWpnUn6GkkIqcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QHq+DC2DAyWvAk3ESjDTa9HUldyDff4tEQPtsoXkqx8uJDfZg
	T1OoIVPBbk3fmb0bxLiBm5oGxUfyVX+6IFUIaWm9ztiV8F8LT+Rb9M2uk+GaL7zvtIY/o5Pes5y
	F287dWkIY
X-Gm-Gg: AYBFou3NYGrbizPDtAJFaxSlRsk9Yk32YgHRxbAMJln7mEHSN5qyegfaifvV6Z+8ilt
	RDHmlewRkU+8WxH48A2RWI2+sCF+ORI+Vg3yPDkB8ri/vPdeLCLoTNHuUWwLk+dSpdZi3MNM5Wi
	32q0gUsq3KGUmAcj1wTnaltVY/mPU00RUEdjwCgOPTjGjAkSZSg0bSYSxNFkxeReDRReVI6kyBq
	gdoeEUp6Je6O4PnKZG8FWfhNlFBWn5fciidg+5VuKH2kCwH7oxDjS4LmZZyv6jK3rNbpc1xGfyQ
	LH2j8+zizXO0pCotatRuC8gdOq5z0wkU2wlQvwO8Hzipy4GMg5EsIgtqxw7HDHsLAfz1UyAC1BG
	FPXq5OwBoaOGYvzAJgxZgDA3ejxOLfYAcammRCbmLBsQhutK+qtxR40p7yD+tSx89jLSdduu0Vt
	rbR4wL8PBtWqqUjwt5HfUPhgLhWq8eLv4Z56kQSjuKMeIdlzbYGiP39mUfj0fthb49LNBupMEty
	38fptVLLyG7li2UqX8OMwC/aoMavOyKpJudAl0OBzEcFGEKxbGKx6ZIObgsXP8SvfcFDDv0hCXu
	kceeLV1AMh+EwwpKNL7kbU7QTM7r
X-Received: by 2002:a05:620a:684a:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-9478429958cmr426106785a.60.1794192716567;
        Sun, 08 Nov 2026 18:51:56 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecee18a77sm32225636d6.26.2026.11.08.18.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:51:55 -0800 (PST)
Date: Sun, 8 Nov 2026 21:51:53 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 1/2] usb: gadget: gadgetfs: fix ep0 request lifetime
 on disconnect
Message-ID: <bcb55195-2ed3-4b20-9afb-44b5e0efaa61@rowland.harvard.edu>
References: <20261107-b4-gadgetfs-ep0-v4-0-86bdfd684b54@gmail.com>
 <20261107-b4-gadgetfs-ep0-v4-1-86bdfd684b54@gmail.com>
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
In-Reply-To: <20261107-b4-gadgetfs-ep0-v4-1-86bdfd684b54@gmail.com>

On Sat, Nov 07, 2026 at 09:46:13PM +0900, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active.
> 
> With dummy_hcd, disconnecting does not necessarily drain ep0, so a delayed
> userspace response can leave dev->req queued when it is freed. This
> triggers the warning in dummy_free_request() and a use-after-free when
> dummy_udc_stop() subsequently drains the endpoint queue.
> 
> gadgetfs_setup() and ep0_write() can also race on dev->req and req->buf
> while a control transfer is in flight or while a completed delegated OUT
> transfer is waiting for ep0_read() to copy the payload to userspace.
> Overwriting req->buf with a descriptor pointer causes clean_req() to free
> the descriptor buffer instead of the request buffer.
> 
> Copy completed control OUT payloads into a separate setup_buf in
> ep0_complete(), copy control IN payloads from userspace into a stack
> buffer before preparing dev->req in ep0_write(), and reset req->buf when
> control transfers finish. Track whether dev->req is queued, reject reuse
> while it is queued, and dequeue it without dev->lock before freeing it in
> gadgetfs_unbind().
> 
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=c73e1942197af9f54ca3
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>
> ---

Quick question...

> @@ -1781,15 +1842,21 @@ gadgetfs_unbind (struct usb_gadget *gadget)
>  		usleep_range(1000, 2000);
>  		spin_lock_irq(&dev->lock);
>  	}
> +	queued = dev->ep0_req_queued;
>  	spin_unlock_irq (&dev->lock);
>  
> +	if (dev->req) {
> +		if (queued)
> +			usb_ep_dequeue(gadget->ep0, dev->req);

Suppose another thread wants to submit dev->req, and has got as far as 
setting dev->ep0_req_queued and releasing the spinlock, but hasn't 
called usb_ep_queue() yet.  What prevents it from making that call right 
now?  Then the request would be active -- same problem as before, right?

> +		clean_req(gadget->ep0, dev->req);
> +		usb_ep_free_request(gadget->ep0, dev->req);
> +		dev->req = NULL;
> +	}

Alan Stern
