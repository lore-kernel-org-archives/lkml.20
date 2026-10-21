Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576113;
	b=zbwQHOI7Of/QyhZsFC2MyuMIKku16ZgImyJvl50gJVhvbzeC76ffwSjOfng187eMwZtf
	 WPNiCyKqsQCe7pJAwABWCAYUvPsOrnu+nh1sL7UOMBE0kJLp7NzQAACFVeYmX+GrvOB6c
	 wepTzXu/l7fPW7XBNsMSdI1lhgxGRsHiD5djZru8l4u3gk4Cw0ijsNArgPOsyXWaGN1J+
	 7cluiIT4nzoMZIL5lqImz5HEWVTRsH615upYIoW5fEPXB7aHmc32XW+s3aY28xrnE9KQX
	 rRzjXEZ1ghGkTlAvW3z5u0FUb7PIiKZ4RiAbUPgSI5dFoh99/62fc2pByKtv0sePy3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Mh2Rxs2VVxQVMwcaeQdPl7L+AKjaYhQ5G36WKv9mHbc=;
	b=3W8ao+ObRsZJsKxNbSDQFFtQnczkiKY4zsYBbhoilsrPYul/m1EOGRtEU01skp7w1Stf
	 lxc2j3hzFapps3L+fUd7rtYxS1H/vQ4ylmci7Ff0tBoGzerguUbqdooYpaA761rQ4UKkp
	 659BZjISB876y8JBxUNMNydS7GqqcHnszC2/Nwzm8j30CK12LkT7MrKPJuC83FmA8ZXqe
	 xhyGzHHtj2wCK/Ivby3JeOhQLWVUBi12He6aUsvLsUnZR0SJXc6ku5BwSpuy6iWbhfd6j
	 UhvMeUNeeWBZZOq5NyKtXUehQmu2+wQxWXqSfe80bSDmxlrBsk+fgw0yT8vl41oRqqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VEo7U6w+;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BD0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VEo7U6w+
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so5615135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792576110; x=1793180910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mh2Rxs2VVxQVMwcaeQdPl7L+AKjaYhQ5G36WKv9mHbc=;
        b=VEo7U6w+K5lNtp1WixdupNPOgBRrmsCJZ/k02cdV4zC9cyLfz92921MRsKkXmw+MWr
         rCtqk4tfhUTdyXPGVI4woj2+Xak/sxXrc/gMhmhL3k807fVrwG9Dgvs3NywHhC0D2tr3
         PckadojSrN4Xd7hlGQjNmXcw1jTsx1UO4+mEkBSR+Wmb53qnROvJ0HJ9iWG4qPMv23Pm
         LM7qJmw+pQxmsmFvdSDCqDGT6RU1es6gRhz/mJFzzzGSJ7f1HTihf87fUk+3wSapBsVQ
         nQSMZyvXLHwMVXcHzstp8if78ZcxBYzNXPOasVLg0hHiqqBFyFHWH2Q0NNQcJFw6Izci
         mBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576110; x=1793180910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mh2Rxs2VVxQVMwcaeQdPl7L+AKjaYhQ5G36WKv9mHbc=;
        b=jbKJ0LKS6CH5xmdO6/n+JCsI/iof/bxnL45d5qandOwdt+JvQ8vmmbCThQuGF916El
         mJWnedO4bwGDQ3DtmE7d7ZmUT9IYz+YG+dTuD7dnygZTtH5DNwZlscQEDHRrXpthGtHA
         U+j5MCIz1MwOGb87MWjII4hYeJ17/J4EOgwDtON82Dncp++Tx6fe3BBXqoxICFamEjDg
         h1nseHHHqcXucnN6jJg4eTre433CqONPjRCS7PB+3K/UO7DPASUaB0CeTHRMvEjXuCAi
         NoBg8JQP47mRw86byu5e3K1AMJD7/2X7TB+w/DLAGc5O/F/33JLa6tcOreGxTIT627Ox
         gOfg==
X-Forwarded-Encrypted: i=1; AKwUvBxQLxBfx9kTBgf0Y+DyrMI/SyCjlCILhjGG6EHnKFsor+GG1QP5ZVDb2hoQXBcPPtkDWHb/IU1R59r/fXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfndZXEpflSQfy81IgUHsupy+wJL2yHmD0fWdt1DSwzFH+NI+Y
	K5N98FO+vrZ9DbJUmhVX7fZqBFhyRCwdETLJagP3+rNSE8vw4G/10XJ1lp4Pp6sY2Eo=
X-Gm-Gg: AYBFou1vwN96WBYD/KZizj4zzfLLXw31unP9G5psajlUdxR5Om3Auz7LCwmSCen2zR1
	w2zBY70uvXWkssMueHPpkO9piUtf9IBq56FBnDyylUuHLiLdUzQqQDJhsFsgG8Pn2TZHxE5lmQ8
	c3GG2tvb0lzrl7M+FJOGnFwvpNLKjeTJMfYqeVg4ElTwBfWAOEh/ONVoL7IKzoVFjfpB8rphJJJ
	qZuOTIuSJEBu6a4lBivQkewP9WNa2CoI36yk6DuL/yQWWR5Z5yFAJQ5fRItxiERRn7ApNS8kcWd
	pMJADDLZjO+9KaJ5XTR+ABawAKvba715WgaUcL5aDp2Qa7xX1uvHrUW7dKZNSnz4bwNG9bNOaUt
	GyUOLCLe1QN5BjC451VPLtDGLkNyeK7rI4wQeyh2ssg25qA8FRaW/Uy6vdKUOqAFgAylki0R+Yq
	R3lYl6EAkSrxFj+MapNd5ZHojYj12/VsAjdm5KQffgBKTveqeFJv+osqWjDQbsqyoJoJsD6pQxc
	g+BbhysyspHLGmBtJjpk2CYmIJWiYVq3V4o8FlGabjuTQ8zQlJW93vc1nkfAHAeaLy3YPO/Tm8o
	CifGkxpZLjqfNS1+OZodrg==
X-Received: by 2002:a05:600c:4e03:b0:4a1:d492:1604 with SMTP id 5b1f17b1804b1-4a1fdb1d1d2mr30473685e9.11.1792576110418;
        Wed, 21 Oct 2026 02:48:30 -0700 (PDT)
Received: from ?IPV6:2001:a61:1355:5801:38e3:fd59:b268:ce87? ([2001:a61:1355:5801:38e3:fd59:b268:ce87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm157125735e9.15.2026.10.21.02.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:48:30 -0700 (PDT)
Message-ID: <d7475b92-a7c9-4b0d-98dd-37d081cb46ef@suse.com>
Date: Wed, 21 Oct 2026 11:48:28 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb-storage: option_ms: bound probe-time bulk
 transfers
To: Lee Yongjun <jun85566@gmail.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: digidietze@draisberghof.de, xiehongyu1@kylinos.cn,
 linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
References: <20261021081616.89976-1-jun85566@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261021081616.89976-1-jun85566@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21.10.26 10:16, Lee Yongjun wrote:

> @@ -112,9 +114,9 @@ static int option_inquiry(struct us_data *us)
>   		result = memcmp(buffer+8, "ZCOPTION", 8);
>   
>   	/* Read the CSW */
> -	usb_stor_bulk_transfer_buf(us,
> -			us->recv_bulk_pipe,
> -			buffer, 13, NULL);
> +	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,

You have introduced an additional failure mode with giving a timeout.

If you run into the timeout, the device will not work. That means
you can no longer ignore error returns.

	Regards
		Oliver

