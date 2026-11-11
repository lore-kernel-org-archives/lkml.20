Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432987;
	b=qQPT9QMIAuW7c4GhrwGWJBLqI1rzmg5NQDcvtIWlmOi6QYwCWndcsDO+dPCQGGk+uoaJ
	 WoXf6vm0rHmk8d5uRMLuBmsGUqTAwUB0+lKr8v6X/ym9Ra8Ge7SUkdH7/k5PHyQjNKjSX
	 WltJ0NV8B8t3aEoeyRBPv2qgubLLQlhY3km4F7e/Hd9DJkn7hznnpfsVWJ8zYJF7V1o/I
	 +W3p3MasLVK1YQH7n2pR8AdRSTjxBxXuvhQAzVlc8RbFt9z1cW7+c7rzNrU65ZtDLPlcR
	 X/ZUbOUSI1BVG76dZbXwmZwmLWZE65gUX8hfcEJwC6hUkoo/6PkKZnayBelRqPYmOTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IpkLNmGIFXERWPmUEoHogDFCZKFpd1SbfnTThFLywHE=;
	b=OC3Dlo7YShJWE5PB4bsPgZOGQoGnqqNN770WdGQcDRmDd+1eIZEioWVWkG+3tl3DImQq
	 mwbkdaxlXJoAjeVvPzxicSZsFiWmFPk8fRSzHu0S4qGDgQH/zWYE57+ZdiWrBzNfwZ4X6
	 xFExmzVjgl6u6h18gFp9pq4PlKVFcc5ab7zJQgZ0Z+YpevwoF/Ntq9l90iIV0HzdLPFMt
	 gJ7wCUbJpES961NJjtTG/FxDW+dQV3TX0FMV/7jVLKdUkVayqHS8K9h5qdRga8JeyUbV9
	 5NpmMmlQRTufYT/hLqcaWWsAn6t/9aWkmr4eFn12a+ODs0jbBAZOUhjRgPFZpY3SszA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=philpotter.co.uk;
	spf=pass smtp.mailfrom=philpotter.co.uk;
	dkim=pass header.d=philpotter-co-uk.20260707.gappssmtp.com header.i=@philpotter-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GnBpcmMs;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C61606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20260707.gappssmtp.com header.i=@philpotter-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GnBpcmMs
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2115126f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20260707.gappssmtp.com; s=20260707; t=1794432985; x=1795037785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IpkLNmGIFXERWPmUEoHogDFCZKFpd1SbfnTThFLywHE=;
        b=GnBpcmMskGd9l/IxsKoy32ItXSvzyoIpyWiJVmW8inYtHzSYTrGZJmWEoxItUBaa/x
         /Zd00UAOp4CNtbPaN0hLyvvKyPEWZNHCg8IEGECAHqekCUgoRDCu5HHjgt4lxKECr6py
         YE6rUj8WQpEE3sRpBqPtNwAQqOORGX/UJPmOYJuJ5NK25RuqZziPGW0EXbRf8KksjW4b
         ou+aKC+BCUpNxahr8uozmdSGkg8Zz7TYByVphBX3SVN6q0seggrp7NKKQbCqVjOsoV4q
         mvnuS8ON5BznGdKvdEPfN8TpuwDgtiks6x3btQ2GP2uScDTaUi5Z7l49e15/taJGikul
         LnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432985; x=1795037785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpkLNmGIFXERWPmUEoHogDFCZKFpd1SbfnTThFLywHE=;
        b=EHO1K6roFWGVDo6wtCmrwDucDGUn+3zeRifz/RqW1nHCjZhX1JVrtx1xCrJvtMvEPq
         FWVpQaCJy1QD/e16lQy926YGafuGxuD67wT1wgK8nGyE7/EISzMufV2kytgf87BmSHbd
         rvjVWkJmpJlTCUwVleNZunQINQAM3cJoQ/hdEsWqfOt8Lg7a48gnPGb4yLMFhEMZ4Sa5
         Pv7NYB9cGimg47kr8puk4xX9m7JIEDnHjbGLy+j7MJG/enKTHHAU/iGHFUWioaM60IOM
         mu4YYyN/RkEwPm/ficY9w3rnz5xG95JhbYogLSzKYigVpQ7DlkM4Q3dB4V3JHjEvWquQ
         c1yw==
X-Forwarded-Encrypted: i=1; AL+hErFQ6iydAO1qo8mAriot8gm7QeN+cftF6V4Q22LdKTExonn8MV809E6DyT5bvUJmKDebyWReykIQtSLT+Qw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ht6wFj0ZX7yPQCeUFlUX5hbb1rD2SWkm4wtEzDnQh0YPVEo8J
	rdFUyFkqhyMZbdx6zaQhW0pVoh4ZAhSecHf0A/DYRLfWB9jyf35BWlQLcw1oZ2ZPftQ=
X-Gm-Gg: AYBFou2YG93M9HbrMp95cpVn8pwUrHiHQ9iv3WfkfAtH5zXexn8Svy91/LHegIf+XgQ
	m6DlPqT/shmhtOYgl2PJGCzCpoAJNNSBQLl/07rf91ffYEPGlJHngS+FDb0Vq9S9y/+1peu7LP7
	3+7jtbVpMtZCcHiyg2AZp6Eho6MMxFVktfjpiD3zwbNR/ilmbFlCim3qt1bC7XjQXomRxuTRP+d
	+iNjZkMCapRRB+zOxfsdITbODkDPuiEIm/GVElorLvFdNa9FXA2lm0M4YhLfudXnurhgZExFl0C
	jAtmMvFBLLjzqSTygRzMevnh3pGe1UFXAieNV8n8J4pu+1yOXctSgmRXCD1FGjDVtIjRSE4tQpi
	BjpgzMYTjm4BgEnjdi/UwxWU9edO3A3CCwyZ1YKFMtlsjYtc4GLnvJFX6abaRHlRLlxs34V25v0
	y+qyu1XXZINHsfvAYefhC9nfYI3XJDP/bC1j0dX+V1x/g8rPdcleTTZrApyFZZYPp0niehhaHjI
	Kmj2Lx9euqkUI4UFMLapgMBZmz782A4MhFye+6pmowaFwLrm00gCVomcCDjm1VIwhpvN1AQKiNA
	X2N82PjtH5A+MpMZKpZt
X-Received: by 2002:a5d:588a:0:b0:48d:f7f9:6a29 with SMTP id ffacd0b85a97d-499c75526a8mr6569706f8f.20.1794432984795;
        Wed, 11 Nov 2026 13:36:24 -0800 (PST)
Received: from equinox ([2001:8b0:df16::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm13114191f8f.55.2026.11.11.13.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:36:24 -0800 (PST)
Date: Wed, 11 Nov 2026 21:36:22 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Jay Vadayath <jay@artiphishell.com>
Cc: phil@philpotter.co.uk, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH] cdrom: bound the device-supplied offset in
 cdrom_mrw_set_lba_space
Message-ID: <avTf1rFy2Ks8Gm3Z@equinox>
References: <20261022181955.35758-1-jay@artiphishell.com>
 <avOQ66kCxOghtFp4@equinox>
 <CACd3oYMZ+umLbeK3q8oaJUwZHC4zbbFOe1YVEAq3s2v4B+d5Dw@mail.gmail.com>
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
In-Reply-To: <CACd3oYMZ+umLbeK3q8oaJUwZHC4zbbFOe1YVEAq3s2v4B+d5Dw@mail.gmail.com>

On Tue, Nov 10, 2026 at 03:08:05PM -0700, Jay Vadayath wrote:
> Hi Phillip,
> 
> Thank you for your response and for taking a look at this.
> I am happy to make the changes you requested.
> However, I wanted to clarify if you would like me to start a new email
> thread with the updated format ?
> 
> Or was the idea to just follow up on this thread and repost the same
> email with the updated format ?
> 
> Please let me know how you would like to proceed.
> 
> Thank you.
> 
>

Hi Jay,

So generally, I would submit a new patch, with the subject of:
[PATCH v2] cdrom: bound the device-supplied offset in cdrom_mrw_set_lba_space

And in that patch, mention the changes after the ---, i.e.
Signed-off-by: ...
---
Changes since v1: Updated commit message


Then include the rest of the patch as-is. Please run the completed patch
through scripts/checkpatch.pl as well, and make sure there are no
warnings.

Few more things:
- I seem to be getting duplicate e-mails from you, one in plain text and
  one not. Please send only plain text to the mailing lists.
- Please put your reply underneath the original e-mail/portion of the
  e-mail to which you're responding. Makes it easier to follow then and
  is standard for kernel patch threads/commentaries etc.

I hope that helps.

Regards,
Phil Potter
