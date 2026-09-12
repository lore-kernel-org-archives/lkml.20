Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D6A390615
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 03:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789183705; cv=pass; b=W8N9i+o3Wwtq3XVzmPu9JJuRx4mKhFHsZ2xE1NBcJKuCcUD/yXawP8jCLdcPDvUwP4d6HUdBUN6QXBZSWAiiCWI+oOeTA9j+4raR6Hr3yfniTwsEWdvA3ZVyZUu69VvZjTalPZum72haOyXG5r9l6Dr2HAoT3DqGhABcWCxMcvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789183705; c=relaxed/simple;
	bh=1AXQcspMBuO/2Epym4NXCC9r0j3nKkronOgim6RObNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMAcqoihL7XgXVPRPXlsOe0APwtC/UGglyYQlWIfYr+bGceHiWeiq7C0zL0jKZ56MS69WmHEhmZGzC/JKVNnxJRl4lVZTDRQRjEfAmydgFwfkP0mctZ3T5G2ogINozfNymTWxKX13LYL27gXHa0kMdVnQGyJN8XKlKE6Tjk3xVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eXdy+M9g; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eXdy+M9g"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2949ed8cc3so276006966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789183703; cv=none;
        d=google.com; s=arc-20260327;
        b=Fedr9L3EuDBXtMOXGGgCA4EKVKz3EntUAZs/Ao3igork5Mx2ji1wDTNDVQQR/lv6nb
         rr2d+nbC/9sJU3voGF2twcXEivbJrPcqI10kXZWgranWFZkCU1KrVLituFjluk8VJpJN
         Z7L7SwmWVHGZo3P9WAVo70R/VCDp+RxiGtqacYLSfMOSQmZ8HeOuc4MNngJkPzwv0FOM
         KIAdSgQvlmhVlF/OnC0yaKieQxZXXmFn5DvBqbQxpD6GhiSQ0bvLzhwb1sJhRlBFmXG+
         KwxAyirpHC2uMYBktRTvXTD+1OBMXOdmZIgpkI4E47HScfZNtOwZe4GCDwq3DnMQwbI0
         3rxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1AXQcspMBuO/2Epym4NXCC9r0j3nKkronOgim6RObNQ=;
        fh=/b7rZVHgEry4v9oCK8CEweUsD6uKUnSr/zPp7ANASfM=;
        b=F/NJO8xNHeFpTlmOdDlZ/cAAd2wixuDIoyMBlLB5an8Zysx3eHFDPtfPSDTi7z6diV
         vTGHMn0f6RUaGtS0ssmmLZ0kvFMVDoMYxUibhSQa6VVRdzFmbe8mzjt31oFWK4KeGYMg
         TRW+LLtX9vqv06Bhu1Qez6c3/YvuNeOZxIXYZiCKvGVdUoR6tZqoDxAmg8sKSAmxbv/P
         Vbl8HhnUTBcW4xoE0m8DeeDaO5VxnyrYZo7hcIemP76Ddew9EG6EJ6Y5Ia3v6KXFda/s
         2w/sNrOqVDsf8+5ty+mPYdmMQLfkKlN5NCVqXoqTwzwWGgu8KHcndrKPRTkJO2pcKgY0
         u2Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789183703; x=1789788503; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AXQcspMBuO/2Epym4NXCC9r0j3nKkronOgim6RObNQ=;
        b=eXdy+M9giY6OWfTXYgGwtLUhrm/Iqo+edSs7jzJpU2mZf4VIHh5lZ06ASicaju1BA1
         exbpigdhK0b0HYWr6XlpLvysCpw2gsawwLiBmqmdA1SGPycscTfFlvgC/94VKAN+bWQW
         VdGO988kzEz0/qKO4w/XpNsSU3QemkWrk3YR2CgB4aln75zoAJOBEp7bcBrTD2JWjg1x
         LNhPajP4OFaxCQv0+mXMFOdYSZVGZ+1Yj1XKhhLTkj+ZNV3hRS/Ozz2+q9B9/wygYJ0h
         YO1+YTALwDgoFK1rcr6cQypoGKd3gp5Wh0iqKWfngSYyB542/T30pQBa3I0eZm4DJ/xq
         vQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789183703; x=1789788503;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1AXQcspMBuO/2Epym4NXCC9r0j3nKkronOgim6RObNQ=;
        b=EpEzvJo70qPeQMewpEAQ3DmysqKcDGBkaII1PiMzrc9NZNauCYN6rA2KqMiu3zj6ae
         1eXF6o3/1jnYNNp5/1vG3K3Y0bECm/HtjyooF/JmQ9oJzuUBXGQiZwDwu3gD2Y7Hq6oM
         iL1uRIkwyFXmiorA5qDbocriXUBAwTl4Ss5XY7/RSsTq4zEthGOY79kzc4KsqjYyfrGL
         2QQSxgDlQMbLsTy/Jepdo597gL0tolbuxZLkKW0MFylF/GakNj17DzBgCeu+bOd3jIzP
         1c2ozvAqz59UfnvmJxBNUZw0AnHU6lvSPo45TPDVo8QqAgJaTw0g3v90a06UanyWwm7t
         EqvQ==
X-Forwarded-Encrypted: i=1; AKwUvByRIMclx6QvDYzQOEG7yHh2bIqIlt2M4cEZuOyssw3SPgpfa4aigO0OY/0EEhCXz1MWTa2JehIPVY3f9+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n6r0z54DSh3xcswM1/tqDr0cMfnrmNphwuvYcb0fTiskLukC8Y
	EEBTx/tZOFLpADem+59QR0l+OviotRyOzsRnfqm0X2qBitrmykiGa4ZWWiA+5CzAumDt9V0TZRv
	DgJLJ05K9jbDpnVomps5uGjRJ0vlMJxCQmXZFNU4R
X-Gm-Gg: AYBFou3Bu7sJovMSxTgQQ1zOx3OGWXVnJroO6gSFXFoQcFwQt1prfaqva+/vgzjWXKV
	QEvAAYDI7/hMG7VxODlfjtFJF978lkqlHyxKZOMAwaFTsB84MD+xp70McJ/LRSjSABSJ5pYhjiB
	9OrtkCpF2uVzp0exRMS6DODCc6QZRE8KqrOWB+4meVAb4RHvK1tjJzlr8eczDPJX6vOLGaDRox2
	oa00ZJFL9/0Q5irU/uArbEXDv8wiqUcpkrKtfDWYKAfKi0Y+UCPVYA++9IVcRtpINeU0V5a/aAp
	NlqfbUzchkVCM9yoxC5sdvuPvfY7knJp4OGnAvkYbmsqNnswsJEVZr8=
X-Received: by 2002:a17:907:73cd:b0:c1c:2007:298e with SMTP id
 a640c23a62f3a-c29666bc8e7mr322816766b.24.1789183702219; Fri, 11 Sep 2026
 20:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821050507.2161607-1-shakeel.butt@linux.dev>
 <20260821050507.2161607-5-shakeel.butt@linux.dev> <CAB=BE-QMyzKT-o=gbhdp3g8JSqQgRiTFzxTX9vEBmCttABrmdw@mail.gmail.com>
 <aqRWuffGKczUhegT@linux.dev> <CAB=BE-SjW76gWr0kZcPnEjXOwt90vCV0TJeFuYEGV1Kt4Y1HWw@mail.gmail.com>
 <aqTB1AVmFVs08T19@linux.dev>
In-Reply-To: <aqTB1AVmFVs08T19@linux.dev>
From: Sandeep Dhavale <dhavale@google.com>
Date: Fri, 11 Sep 2026 20:28:10 -0700
X-Gm-Features: AcwNN1VO6EcQR5hpLcEQjEGDOjZUhnBSVqjAAjK3VKqqwhWLJwfDUgsFug31q_Q
Message-ID: <CAB=BE-S-fOqvjj5s=M588tdUDDgDMAxOF7SE6Sm-9vara3=snw@mail.gmail.com>
Subject: Re: [PATCH 4/4] kernfs: Remove kernfs_rwsem from dentry revalidation
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, driver-core@lists.linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shakeel,
> I don't see how reclaim can set dentry->d_inode = NULL for a dentry with
> elevated dentry->d_lockref.count because kernfs_dop_revalidate gets the dentry
> whose dentry->d_lockref.count is elevated. Reclaim specifically skips such
> dentries.

Thank you for your input! That may explain why I am unable to reproduce led by
memory stress narrative. Let me attempt to reproduce this first and I
will provide an update.

Thanks again,
Sandeep.
