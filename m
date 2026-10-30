Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377872;
	b=tqx5lHsxltWJFzDhwLpU6plP7bvzNclmH9VOl4+9OB0bORg5EONQjPugfrqib9H5qbRM
	 OPQJlQ0VQ4X2ZixeoaIO6Rv8IyUZMl+5bCMufaGg/hB1+9K/xcsTnDKcEsZjYCutQS3Xw
	 Blc9yu/6FUbJjWE0ENbxnmb4UArxWEma0AqB3VSINRRnDp2yv17rAQGtgif46LL5SD85W
	 ycaOVFO8FiGHN8SfMIiJjPSlcJO9Egl6p9ihwzs27ksFBArxGd5DsXPQE2TCNW+CivejH
	 3ZnHlR4+YdevqGVVt5ybMtpsWdcWLyCwws0qyqs7GpySNmE78JEtXEwKuD/UymiOggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377872;
	h=DMARC-Filter:Received:DKIM-Signature:Received:MIME-Version:Date:From:
	 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
	 X-Originating-IP:Content-Type:Content-Transfer-Encoding;
	bh=trjDVectabIdkuJHUDjygYRmElT+tmJTWHnK53SETIc=;
	b=rwfW6SfD37dhFKz0uByuxeTaTfQJNx8jBgZbi3lJEOfPNmzJdxzinIQrGbraerpMMSS0
	 jCQEBXNEK+efI77jnHE+mjIoG4SKQFC5rwFOYe5uY1NMrXjV6rldYMKD7DPp6727PnBYc
	 TMuGxi91eMNe88CLtHGdmaONoC4gEF/Tv9BvWNec9VVO3r/CjdwOOOEyrAgmZ1tiohavX
	 HMAhwpWztzxILDa00AR8Jx7sYIBE9uI8HGZAGPOfZddODCshpAz94ePqCrJ4z4nP7xueY
	 YoWPMRLBwUEY8Uav9sn9ARhwsDXiNFVHhQaLKcgchKJvylp+7x476Nw+IYKAk4Ynxjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=kyx2QNHG;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93583606A31C;
	Fri, 30 Oct 2026 16:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93583606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=kyx2QNHG
Received: from webmail.iinet.com (web1.iinet.com [52.129.46.51])
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPA id 7CC12B40708;
	Fri, 30 Oct 2026 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1793377865; bh=trjDVectabIdkuJHUDjygYRmElT+tmJTWHnK53SETIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kyx2QNHGDMYXjNURb8ZA5/XU6VJna+gTKmRjvTIf/Y7Nez7E1/z7frKLZi426FOfC
	 BREDeyLSYZj5AWIkPzdR4XuScB0Z7jZOdc1tN+8R/bXZnpJP4NEO6k57az+rov0c8O
	 ymtAEQoJE78KefajSG3YJYb0Dv6qe6qj/i+N6CyrWcDC4l8I9uBt9KTXMccgLiTKUc
	 Mp9nT1eLS3dph+oGzjXsBOipD0qsTlWYBxmvlDsNDhVN1tASvfp8QU/0e5iZOyTT2w
	 N+iUsqcY8iJfqhsKfEZBZadJXj/D6Oiwb0oQHTroqNKPCaAiZjguR+fnaeXG3FWHyj
	 PqGJsWrOTMS1Q==
Received: from c-98-203-133-45.hsd1.wa.comcast.net ([98.203.133.45])
 by webmail.iinet.com
 with HTTP (HTTP/1.1 POST); Fri, 30 Oct 2026 09:31:03 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 09:31:03 -0700
From: kaf@nwlink.com
To: Francesco Lavra <flavra@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2 RESEND] usb: gadget: u_audio: pass channel counts
 explicitly
In-Reply-To: <0bb53b3f00e9a1a834e32979bd1e08ecc4517411.camel@baylibre.com>
References: <20261016162534.384844-1-kaf@nwlink.com>
 <20261016162534.384844-2-kaf@nwlink.com>
 <0bb53b3f00e9a1a834e32979bd1e08ecc4517411.camel@baylibre.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <e2d166b9580acddd69b8a8cab73f4f60@nwlink.com>
X-Sender: kaf@nwlink.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-10-23 03:39, Francesco Lavra wrote:
> On Fri, 2026-10-16 at 09:25 -0700, Kyle Farrell wrote:
>> u_audio currently derives the channel count from the channel mask in
>> struct uac_params in several places.  Instead, pass the resolved count
>> explicitly, so the shared audio implementation does not depend on how
>> an individual USB audio function represents its channel configuration.
>> 
>> Initialize the new channel count fields from the existing channel 
>> masks.
>> This preserves generated descriptors and makes no change to 
>> user-visible
>> behavior.
>> 
>> Assisted-by: LLM
>> Signed-off-by: Kyle Farrell <kaf@nwlink.com>
>> ---
> ...
>> diff --git a/drivers/usb/gadget/function/u_audio.h
>> b/drivers/usb/gadget/function/u_audio.h
>> index 9512b8fccfaa..46e1d6b5ca4e 100644
>> --- a/drivers/usb/gadget/function/u_audio.h
>> +++ b/drivers/usb/gadget/function/u_audio.h
>> @@ -41,12 +41,14 @@ struct uac_fu_params {
>>  struct uac_params {
>>         /* playback */
>>         int p_chmask;   /* channel mask */
> 
> With these changes, the channel masks are no longer used in u_audio.c, 
> so
> we can remove them.
> 
>> +       unsigned int p_channels;        /* resolved number of channels 
>> */
>>         int p_srate;    /* rate in Hz */
>>         int p_ssize;    /* sample size */
>>         struct uac_fu_params p_fu;      /* Feature Unit parameters */
>>  
>>         /* capture */
>>         int c_chmask;   /* channel mask */
>> +       unsigned int c_channels;        /* resolved number of channels 
>> */
>>         int c_srate;    /* rate in Hz */
>>         int c_ssize;    /* sample size */
>>         struct uac_fu_params c_fu;      /* Feature Unit parameters */

Agreed, and thanks for taking a look. The resolved channel counts 
replace the channel masks.
I'll remove them in v3.
