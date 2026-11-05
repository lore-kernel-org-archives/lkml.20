Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912005;
	b=Tt//vrbGtsyhIiMuydhlPMUCSGeoHvoeUo4/FaFrdQEsUzj5z4kRZx/1AJ1xMr1z7+3u
	 xjUbJ36ejSVcGg7gVIHaciNEckyCLkzBVHOYCTue9MVc/F7PFM3xDXSdb0OGNowlAYFRC
	 P8nsxRbzALp7zSVfZmirnYNCOcTY3S2lfebM3TnCwfuifyCkQ+FdBjFvuRH4FPl48K+ak
	 cYCmjNcXkY1qFGgw69RXV4zkkweJ5FwSVR8TQqnae+XFimRKWNDEDiD82b7aFEd3eHAHc
	 96uqPE9aeq6Qnq/zwJMSlzwfJljq0wcHTdNklHoZbkjneCILoNex7pDP1qDEJ5QHuLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vyz8X2IVMnrruurpCtF0gJRtd7l1YmKPgdLWxJdXL4A=;
	b=nte+mNTfmqd66Sw2ssTzJREySdYj0HfklZ9aWfA0PLrTrg82qV1zonOlGlYUpmjw++xY
	 kvqdUfy9PmardmI/4xfl2HkhFjZ37M1ZYDb+dpgKbwHaQ4yVOQQKf3dhWqPuWKamFylQV
	 wVBN06q9lF3Owrsx1oOVRkcQu0hhSz2qejq4o3mSVUlns3BZKfqc7vSdgJ6VZz1ptLcPU
	 F4PAkx2bLGnx5jOECcDb7ZwvdspVDQT+/9Utr0l0p9rZXyL5GzXV7HCWLtSR+uj86gQft
	 vWZ42t7lTw79gEyvvsWg3dzHdIu+9Rtoa6p+LyVyLGvUuUI46BX1eDWfL4UeKABdAoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik3I7FnN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35EF606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ik3I7FnN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21901415e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912003; x=1794516803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vyz8X2IVMnrruurpCtF0gJRtd7l1YmKPgdLWxJdXL4A=;
        b=ik3I7FnNvyvNyXzPAbpplQApSSJoH/llqQRkI3xGINTremiplDSXi6YBQer6lGZu8c
         gX1breYwuVaY3YKYJlIy3/HHkA3zXXWuXnBz0OTL6e3kbaXi39z4hU2SfgLI7HgKmsck
         5Yrr8iY0JHBD+sTrCp4j5+Ks541puJOaiG1gymXQEuXgPq/u6pFsBJhLI7v6Mb9QhdwQ
         XXQXzpUt88RNiK28jAo7OjbW+hTwUsHMxFHE1doSx26mRvXzGTGI/8aoGVDyJ5KZb43M
         vFRyjtvfpH0BakxJyCw/diLAh94YtNoAEuOIeuT/sqk1VsIQhbx4N807HdNrm2n0/u+N
         KpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912003; x=1794516803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyz8X2IVMnrruurpCtF0gJRtd7l1YmKPgdLWxJdXL4A=;
        b=xKrk8XmG1y3z5MPE3DiQx3Covzqu6n13hKqhu9FiRAh86M14aFbkK5OZWBmKtpnp3F
         SO8O17xd7HZuoJ+0uhGvhfroJ+y4WXJL30qciBGjV+83BOO2uaZClqcDakON2lRdxwi/
         3lV8OzgX7YYBfpaI+KYFhzj87DNI9zfq5im0K4yNwro+HMiRdAASGgkXuGvQCUiGv2zJ
         Jp7aYJ72j+wRMiDFBCPgMVmjyng3BnG9yFaHX9rxq1+KNjOMCJRoscmamZ38ZWWBNeyA
         1/iwQreQU57PRigBR5+2M3chSCogfaG14OnLaNRHcDH+Z1nSREjtjmvO0vJ/c/ilPPBu
         OSEg==
X-Forwarded-Encrypted: i=1; AKwUvBw/YYWpTeNsEayC5s+JkhfBa1q2NtvY+4YYw3P4yz+VHk+vj73xwxrK6DrrsJ0lhVIa3CksNdTm43ZR5iI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yiRJH6w+pvrWO+iwv+5TnAUYMQ2CJBF3j4YZ2u/8jyl3BLa5m
	H5E8HXLmzzBb6QSsPRb9UyQZkS54oBpMJSI1ylZL1DnElDiEUDXx/sLe
X-Gm-Gg: AYBFou1vWMVuLPpYFeq1azdcdF5SnOoO+JXPqDMtIpUVwCjogf/fMC0jgLAum1XkfQg
	so9S5r/RyCBtk+QTXZb/w5LV+G/m8vQi4+GxP+3OT+P525NuZlWcDj2IqFyYYwE3oKNXn59MHR7
	2o7P/eQWVhqa/qcVP93gqRDhPxrYSPrELM39tFBlrRQYOZfjdHyyTqIsGRi/ivhLEm3Ssg3luET
	wr8z41Iq6rxQFF275UW+Ho+fp5PIyJf4kPPxNsWBsBeEraldEwACHuDMSe/TuWy8zxU5Wk3JLfb
	Ia/dGk7Yp8Vdy0HGmV+htmhOL5dUOOfxS+zkFPKEWTPt/I3OjMZAnzjE9RHwH+DJI3AxwhMaQRj
	viJ2pE5bKZy2C6BzAZ9ulXU2vj729SNNlt2K2vmJVCozvl0jGBrhyF2142BF4ltXvmlx/XyR4rM
	w/LBzwhBCbAwwHoG/gF1og3ySwgr1xwQ4meNMPAalrFnq9mhj4wytNAhMsGpv2tJwYjjIgEacPv
	3U6x/BoN4uGHyGcbm82SR9Udw69dZFgoJgAZTTDUwcOa9o+cywsUD/d0mH2Fc//zBUc22GfoEw2
	4MTEdqCDTFR0ZBM67pwuqOdXblzn+ANDp+h4zO6XQ/OCHdcNTyKYk4uEA5wcPjZhf3fWE2RjVbZ
	tbijnbdjAbQ==
X-Received: by 2002:a05:600c:4f81:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4b6de69168emr4225715e9.20.1793912002832;
        Thu, 05 Nov 2026 12:53:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4532916f2sm167407535e9.5.2026.11.05.12.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:53:22 -0800 (PST)
Date: Thu, 5 Nov 2026 20:53:21 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, dmitry.torokhov@gmail.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com,
 morbo@google.com
Subject: Re: [PATCH] Input: mouse: vsxxxaa: Replace strlcat() with strscpy()
Message-ID: <20261105205321.7b303231@pumpkin>
In-Reply-To: <auxrRmyg50gvP1HE@devuan>
References: <20261104062319.288360-1-nikitash.mariiaw@gmail.com>
	<20261105112813.13210334@pumpkin>
	<auxrRmyg50gvP1HE@devuan>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Nov 2026 12:49:59 +0100
Alejandro Colomar <alx+linux-hardening@kernel.org> wrote:

> > Personally I think that while there are issues with strlcat()
> > (mostly to do with its return value), and that there are often
> > much better (and faster - so sprintf is out) ways of getting
> > the same result, the deprecation really needs to propose a
> > sensible alternative (not inlined strlen() + strscpy()).  
> 
> One alternative would be to add strscat(), with the obvious internal
> strlen(3).  This would be a drop-in replacement, and wouldn't have the
> issues of strlcat(3) --mainly, the DoS vulnerability which is
> consequence of the return value, and also the more difficult error
> handling of doing '>=sizeof(...)' than '<0'--.

I've had thoughts of a more general function - but I've not tried to
write it.

int str_append(char *dest, size_t dest_sz, size_t dest_off, const char *src, size_t src_max_len);

Where dest_sz is usually sizeof(*dest) and the header can substitute that for
  a constant zero.
dest_off would similarly default to strlen(dest), if -ve the function would
  return that value immediately.
src_max_len would be used for an effective strnlen(src, src_max_len).

The idea would be that calls like:
	char tgt[100];
	len = str_append(tgt, 0, strscpy(tgt, src_1), src_2, 0);
would append src_1 and src_2 in tgt returning -ve on overflow.
(Further chaining would then work.)

But, as I said, I've not tried to write it or see what it would look like in use.

David
