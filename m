Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FB0364953
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359600; cv=none; b=MI2J+OXZkm5Ep8RCTQuf7iHdYJTI86qwoqRPe5+lF6wNzE4x2rlXNfyHJxABRbV3wSnv38Zejr+LDyDtFVNnuSCzCflpJjsZTawFiAu5SjF0eL3fOdZxtG3YcmBowVY4nF7NZ2ObdIGSZ7w7Y/Hr/l0UT1rR4iVV26rJYCozuGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359600; c=relaxed/simple;
	bh=2LLxhvktzmBYYWQswgIrcAZWz8NWgXBN8qUJejUNK1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPMZnw5bn3td3ovtR4ifMxYwYzWjV9mig3gwZ+JZTQ9LQx6ACnpCNU5jSLusYvjbKvuNyDDx02cXrFt4n0WVxo4gRIr83X6zNarl4bti7Wx36+LfKNvVR15pnlUUrCM2+wqFNJpq8ev1gdDD1MHrzY4YW5cAj0n+YPTN4rqH3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qvY58LzB; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qvY58LzB"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52de50e77ffso12711271cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788359597; x=1788964397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cNINXlRO667kQL9+ZuWO8vECZQV3gK9JhtSG+5bWLiI=;
        b=qvY58LzBYCz9LgS8HMDrg26y1d4DRuDbOWxVlXqA7IfN4pRvXEsgpvPNLF/VdOrqW9
         d+CfkpXnHAM5g44h5tAk7DhOrh6cuD0/jhLMnYnZAsA6eLIaeS/lPdagk+n99zYhyKcp
         N+YLfKd+Cllq/3q4k1DkmKm7thoH+XZJrQQ+pez8OuTOIIKGPdXWmm6WkBL5pEeU2BkS
         ogsL6MK9/TD2CoOT7PdkxDj7OShx46J9EYSsLUU30eGTakDkqi3tYsIE9JD6gxq/GjlI
         w5F8+7oed1XSWpYM2FUDcITVnqqKDvTMiuIlZAXLBCiAbFEtZ1EJ+vhLtmFte6O0vTL/
         lclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359597; x=1788964397;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNINXlRO667kQL9+ZuWO8vECZQV3gK9JhtSG+5bWLiI=;
        b=dYRHSFo4rHZVg2Jqfmxe40zDF1qNqj88OjvlrasQQZD6wk5ZYzbPP+iIhHvzi91VgX
         keqzRCAU4fl2y0FgMSorr1qjhcHUp0ykMXp6ii0tyFN2jr8cOc8cPB3XpV9OM5PyO8Hu
         ICjZVZkKnliyHWJhUplkJu4tyz9l8cToiVbUXYGqo3rtfYSGwU6gIgAGWKWuvauozaoA
         e0gKipuN2rKcpakhjoDPl63ZyMV+ldLyBDJmJToR6CEpRtI4fKNn6gq2tFB1yqwdLVrA
         z6xATLRSfn56ZRve5FPlD57RllqGj4Dp48xDxrCYRd2RIKUZTz3Lbakg0TPCi4WXIU4c
         ZwTw==
X-Forwarded-Encrypted: i=1; AHgh+RoPxo9BsXalNbWl+idA1fAuzZEBgyM0N0PweG4V3SWNkVyt2Q2fsG02Pa+qlVm/0rHQ+fN0MlXfEFHqoEg=@vger.kernel.org
X-Gm-Message-State: AFuF++kO0cgJkXUUtWN+M+XfmXW8h6p6GE0MDfMZM2HM+OhA/IYbCAPY
	pv5xFae9LtzouUwS/+OjrAqHfd4pZfoYEFlqd90g24NJqbHA4GK3s9pkwYEYsZAQJWlO8mRr+r+
	oUJ4=
X-Gm-Gg: AR+sD135sUAyvcnjbjHRyDx7Pq8o3aqNn2pbK9vQVuNxNNrzF6j5qz5INP/8j6pEdxR
	LEzxGs2q28B/Nt3UMcD46P6+wNUQNi9QxqoTESx8F1K03WTOjbQ2Z5HdD/RN8nXaOF7jOYIMiE9
	LRx6eFOy9hB99aZbEy/MEviYLK8FPhvO11YLT0XUlFJVPIjgHanEbAQeYbxg45MK8AlXckjJ+/T
	V0QyAKTb8ndq7r/MHZow/IeS02Mfa6CGWG4XC92FgWQDebDRl+Mz/4/RSgB2cP17r3BkZgcW00A
	zRAEFO02dV89RYdDPa4kc1ts+1ZUkdj823wOReQjMZPKhUqQmw7OB0JJcmWWwYhNg99xsMiH6ik
	pJ+2vSbQjeOC1c+bODjFn8SW2gfyc/tOT1yXxDC6Q4PP66Ds+9DQsN5pJRK7+qKfoOqymw4gh0I
	+kUDWgdYE8NZCqbOeNCcV79jV75Dh+Utc0ZMr7un0bOorg8MyMJ0gpVA83LlU+2Ndhvoi/usR/X
	bGweeg=
X-Received: by 2002:a05:622a:388:b0:51b:60f1:689a with SMTP id d75a77b69052e-53036b90446mr59544841cf.7.1788359596785;
        Wed, 02 Sep 2026 07:33:16 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53032ff089bsm20699101cf.4.2026.09.02.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:33:16 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:33:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Julian Oes <julian@oes.ch>, oneukum@suse.com,
	gregkh@linuxfoundation.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in
 endpoint
Message-ID: <bcc0f43a-3285-4ede-8bf5-fb9155d44e45@rowland.harvard.edu>
References: <746c4df4-abd5-4e04-9edc-3ff8f17506bf@suse.com>
 <20260901231355.114733-1-julian@oes.ch>
 <20260902064204.1a47cd73.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902064204.1a47cd73.michal.pecio@gmail.com>

On Wed, Sep 02, 2026 at 06:42:04AM +0200, Michal Pecio wrote:
> What you are probably seeing is USB 2.0 hub(s) returning STALL
> handshake when a transaction attempt with downstream low/full-speed
> device fails three times. See USB 2.0 section 11.17.1 page 364.
> 
> If that's the case, the device endpoint isn't actually halted and you
> would see the traffic resume if you simply ignored the error and kept
> resubmitting until communication is restored.
> 
> That being said, calling usb_clear_halt() is indeed the only recovery
> supported by USB specs, both for -EPIPE and -EPROTO or similar. Linux
> has traditionally ignored this and things are quite broken sometimes,
> particularly with xhci-hcd, even if you call usb_clear_halt().
> 
> I suppose you can try this and see how it works, and if you run into
> xhci-hcd bugs we could try to fix them too. The -EPIPE case is easier
> because drivers don't rely on out of spec behavior of the USB stack.
> 
> Related discussion: (gonna need *a lot* of popcorn for that one)
> https://lore.kernel.org/linux-usb/261996a8-7ad4-4df2-a469-f6602da71255@suse.com/
> 
> Alan Stern tried to come up with some solution in USB core, but not sure
> how far that got.

For what it's worth, I did get started on that project and made some 
good progress.  But it started becoming rather complicated, particularly 
when taking into account that the core would need to stop trying to send 
Clear-Halt requests when it's about to do a Set-Interface or 
Set-Configuration, or handle a disconnection.  Then I got distracted 
with other things and never finished that part of the patch.

Maybe I can find time to go back and work on it some more.  It's likely 
to take a while...

Alan Stern
