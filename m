Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E49377555
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788245368; cv=pass; b=L3+hNkt+rEa+R3jQsXSL2DG/Zn0+FuOH3D96LJRxscW6Rr0ETWvVRPtj/f9zLQw7bN+eQUC/ujVXIwt855wp8cMM3Vd8zrPcChTKVk4XNsI6hV04jcCTLGDJvazwPGuEgmMRF06h7oc63AZx9BJE4heCHYshl2JVFE+mQ3BtOOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788245368; c=relaxed/simple;
	bh=oNGTPV0Nte2s7Q4Q4v2+7pT7OOG+CNawxlnpt/7u8Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d27C7Yv+4k4BvZaEvsUxe6rGgwUV+W6rqhmD2/IumS/yFVXqA0OMkmmEvfAITfb+0ZW6ypHqo+L7cJjVNtZJOX+gmRGbTsDVnMNGCC9WCCz+c+bGIFZGtY5itV52qMTFsQ81/Wv4AeiaNcTucZOJpdnqHxwyNHbsmsCqmPzldbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BpsrGk+A; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BpsrGk+A"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482ea739de2so357491f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788245365; cv=none;
        d=google.com; s=arc-20260327;
        b=OgN6bllv/yFS4gNPY/2XhqMuuYR7UbhsqdZyR5LanyYmBK9hxczXD60MDkuOaWzSm5
         YOQpWW4XPSHQPs8HSF6yRA5ncuPkyxRqYc/ocs60A5HINauF2QMhWubVKnofCS3wip9O
         NPPdFm0Ww3AYE7+yWgTLGfFI55HEJ8aYqYOApcoLlPGgGskA0LG+ibISHy7DRb7hlkAh
         aMrM/d/0xlldSbBPD5+CtzY/QZOl6cKHgo6E0Ue8/iNVFizM/oSSAySCKv2WAcTwotAE
         aKZ8o/jNFMH+Et4iY58MsMZXbz0GBsRH3wirpT1gUSNSsLl8SDyffmKJjQVW85F96/bX
         10Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QZ0kwvuRo9QIP5y4Kks1XO3hGegOKMFKjzEnWHMijtc=;
        fh=3Y2h96h9R0UP2GEWQKt05q3XvZrHi/tV+5SjRSO0vPA=;
        b=ol94xP/EnnJs75GAM/NqzPvUrpJVCQKdwztgLkiOocW9n8EzxYWczYh5xEnyHWlSL3
         dVip6A+o2wnoC96m9ZrTyO2v3E84JAIntRTZW8I3QiNync4lRWCJCCaaFbhw3jcUYcxZ
         f6dimi4GhXjlpW0Ugts2R3KQSHgs1zW9cm38lamRHMn32/xhDSNLR6rMF3gdwU75ISFf
         EHRkkHjqTviF31LwcpnP7VDUGgjzq4AcGOqmV7wCIclYGs9DwQxMLyHiRv1Gu4X+jXbM
         WAoftqfjsHU/cOZe7nHOE/lN7bVTbqzR9ScAiXAVUHG96c+09Oi7sE1DCS9B4PX7WnmQ
         7+cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788245365; x=1788850165; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZ0kwvuRo9QIP5y4Kks1XO3hGegOKMFKjzEnWHMijtc=;
        b=BpsrGk+AP0QMLVKK63eMt9ayptIxw6Zo84n0T/bxYqygIWWDqt4o/f7vLmokBi18SI
         VctIFLw9q0fX64w0+LFO2ybgHFe4GeTREVbQbJN0/5vRwiCdVcN+Mmb5pOZjMpSA1Z7S
         kpvvZ5kIjaP5SjelpsK9pH5Zn0bOLdt6MiOYZXQZA07Wqo+yFVMLzh7sj8oUUKWeHR8j
         yCLsdXRoqhTeTP0CsH1qkUcupJQWoaBjECmFeOaY/xC1Nnh5J0vl2fivHai2xI4JSNRf
         HiMqGBnS5C9GOh66r6Gkvn4i4kkGwvYPy+b+XqfEnZFAwmtqLBp9uwiJagmWlwZlh02t
         NsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788245365; x=1788850165;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QZ0kwvuRo9QIP5y4Kks1XO3hGegOKMFKjzEnWHMijtc=;
        b=cs1EzNLZ5D890oLn2jRw5uHv/u0dk+Pvv1RnNQqmG2iRyaTV8KtbSm5sXHHBPbRNrL
         NVMMytTfbsJV12rCV9Lvgui9yn00HjMPWoHFWiGlzNDokXQ75omNCTDBiluDPb1LlDxA
         1SwdGUID0K9EVXVgDvJkIpPY6qRxg86fFtziLld19Y9jvBYi2zTF9aUrtvij4x2Vjo/t
         0btesyBn4EcSNM7q4z/ukDysa71JCMSZNWrenhvVLW/BY3CwhJ+cZaKDFsK8mNUxdTfH
         AiMGJ5T0NExRJEfSOa3xixdy7jX9jTpbal+gqV6zuBAnMoSW7d5moWIwIHFT5oNRcEz6
         hFtw==
X-Forwarded-Encrypted: i=1; AKwUvBwbVu5L8NDrK9N5EXpPZ+5LdPhAcd1GZfpDQaBqmoUJTUByH5s+3LUbdeTt9zly/8fNd07Hlt3dpPYZlu8=@vger.kernel.org
X-Gm-Message-State: AFuF++mvIHuoMldthqMGWOj0PMsZ0lle0Fl4USkKiG444X4LBrfY3eYq
	EMCO3coxxpVZ0FJkBbZnVuCISxheCxglATfaF105RLPosx1cHwUYt57wSpHH7N8xSUvZRVJvXwm
	74d5oGd2vBX/2jBMCKTVfVX3bjPuYgoNQ4OKS99DEQA==
X-Gm-Gg: AYBFou2Qx3iJOYZ6JkTqcbIHleceXNy2sjQ6HfaysnXI9vRG5D7piW0hczET3QeWMEb
	I1SBr4Rdjj674iyytkaheyPD5+Vusse3KGt7hCwF3mjYNUjOT+IlK+Xeyr4fIZABChSQ601h3Tc
	tLG6roMFOxYo5hNMgVniouqk6fbkxFKFYz3gcE8vdkzap4BROToGed5glewbB0qyl1iZRbdhinW
	ITH5rJQcBYPFlw+r3pcaP6fTpyyPZ+c/xyuyTvCUivR1I5N5j+lhvgjTwBPf9qlixtlDgXhCJ/D
	7y8vDD0ZjKCq7SAT9YyFPveulvaRXv4waKjmzhY40lZZ6mRQ6xVNitfrnYPTEunQP8qjs014wzn
	RmQyFau10K5JmDnw1VOdDwf/3up4igGM0S3d+mOMK1g==
X-Received: by 2002:a05:6000:4605:b0:482:daf8:a3d7 with SMTP id
 ffacd0b85a97d-482f7987c26mr52155535f8f.3.1788245364933; Mon, 31 Aug 2026
 23:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513085340.3673127-1-neelx@suse.com> <20260513085340.3673127-5-neelx@suse.com>
 <20260601230406.GC25574@quark> <CAPjX3FdMBAbz9T5yW=0ytRJD8s6zYHpo+TcYY-9-+egBHL=TFw@mail.gmail.com>
 <20260819155907.GB133077@google.com>
In-Reply-To: <20260819155907.GB133077@google.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 1 Sep 2026 08:49:14 +0200
X-Gm-Features: AcwNN1WkYRRvmrS9cx6H6wX9ppPbN-o7Vdk1JkhuHWMyozjsn6o2JUHcNtEnIsk
Message-ID: <CAPjX3FftK4tz7d-MmwMbHTXbz4Y9L7=TmxkDNnMfghrPtvbqxw@mail.gmail.com>
Subject: Re: [PATCH v7 04/43] fscrypt: conditionally don't wipe mk secret
 until the last active user is done
To: Eric Biggers <ebiggers@kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>, 
	linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 17:59, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, Aug 19, 2026 at 04:22:23PM +0200, Daniel Vacek wrote:
> > > > +     /* We can't wipe the master key secret until the last activeref is
> > > > +      * dropped on the master key with per-extent encryption since the key
> > > > +      * derivation continues to happen as long as there are active refs.
> > > > +      * Wipe it here now that we're done using it.
> > > > +      */
> > > > +     if (sb->s_cop->has_per_extent_encryption)
> > > > +             wipe_master_key_secret(&mk->mk_secret);
> > >
> > > wipe_master_key_secret() is idempotent, so we might as well just do it
> > > unconditionally here.
> >
> > While this is true, it also (kind of) documents that the secret should
> > already be wiped out by now in case of !extent encryption.
> >
> > But I can wipe the secret unconditionally here if you insist.
>
> So leave a comment that mentions that it's not always needed.  Just like
> how fscrypt_free_master_key() does kfree_sensitive(), because why not.

Right. Thanks.

--nX

> - Eric
