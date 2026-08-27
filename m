Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4343F106B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787870857; cv=none; b=iWUwXp9260C/qavEGODB62yVQvvkeZGmvAbc+0TtcfV8s/w6DlKwRWcLnsBC99KARUsKKR4wSAXdl+/kZj1J++fuWJen84KB6AO5uZfhefcZQgXLWZNTQmQvwVfN5q85fJtQY/aWz/Sr2OaTzYR47CfwWTa9BbhuJxrW5y9n8c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787870857; c=relaxed/simple;
	bh=T2BKiFvfJn+RaV+W7Rcx/o6DGVKSv+XWpdwGMyeXZv4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ks4KJuxVolYbXNvyfCzIaejM8mxCYVDIzlGdtJL9hetyMNDrQKr+6D2sbeH7Qvh0SeOdWjzdzRzGnth2QSb9D2JXDLZN060vajcWmcktgRAf4Shpab6hvA88hf7xe2HFYOTusN1z43AJlOPJ4S2kp5VOYWPldXycpiFeyxoYajg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWK/+xV6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWK/+xV6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso2682195e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787870854; x=1788475654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sDawldYj0ov87+hPrFEFIlqPjSaLjrm7NxAEAuLWWEU=;
        b=MWK/+xV6e2g94y1PYvFxVFpCFzqGsRtOSWaQzsX5kRlX9XR+ET/UYNiSybWDol3BgH
         4CpK+I+FsgZQYiSMWCQZUMYWKVCUmI3/GR4T1+sK9CopaQ+0Y3fwRFUvc4JZnzyUeCWE
         5ITjVvhqNKlfpmCa0KUvJNzgBMLtdMSfXUOtvD6i8lJhIioTw2nniHShsAz8G9d6yMFH
         q4hW08BSeKUHTnTfdCVgluYvuACVmEMhZkTnc77H1wKovA4ekq00WiKVPDcX8EnHObW+
         qxKawe5QsmvwHV6mRPztONVU3qh2oQb2Hrf6dzSGU4iLsLt5mVAtXzVrUItHGk6lq5X0
         dX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870854; x=1788475654;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sDawldYj0ov87+hPrFEFIlqPjSaLjrm7NxAEAuLWWEU=;
        b=NVCoXPxmE0t1YjoH9aC9Rre+YxvkpHQKe2ShNJfAn6h5rV7oXGS89h4O3TqC7hq9pD
         KyIl+4xd3rkpRC0PtPolMUPX0SphU2MIWr8l3lL2FdxMIfsBCrLXepzlcIKJlkQjsKr+
         I0rxD4OwnFHw/CnfuGj/nLVDNwuiKwv3d4LEgjYpG0yTc4aKp2KPJGPuMhlqlVRhiFou
         IAHLErsJKP0k8cnQwLrdydj8GvwfGAYEPKGntvxFT1+dZSPi2/BgvL1NF0fdKRQfw+q2
         PLbFf+ih0mWve9RnItn8Wg78gswQwOu5c/R+v9MH3bI2tsvsIBB9tjoMb7faDXSnlbf8
         oNBA==
X-Forwarded-Encrypted: i=1; AHgh+RoBEtcFYQKIcjCZqH9/pqP2NzPRg9lVDgwouwH490vv84cf26Bap7vYpgY0RbUOwOGvXEU1wDE0DP/SZpE=@vger.kernel.org
X-Gm-Message-State: AFuF++kVphQ7eDOaMNzeqT0Tltje+eefA5bys++iv+l3F111aIeGcyRl
	/sz0Us/BCm8Fhrveis8fwC/SAajqCHS1x7Fk/NPt6XqbZK9wPKHjQaOY
X-Gm-Gg: AR+sD11ObqSNEbSdeRgild35qSyzeUoOT/HE0y8+4o8byezaG2+eOEfJXvOk4MPQqST
	2tE3bZKs2/KR9QCMabjuIkfO7v3YxHOk5fFexJAOOFhFRDLgl1UaSLpSrYrj47CKAYAd6NbumCb
	n3GR12iLGFJx2/1/s26kscPjVuQRsMwN6KIU+0m+wvIgmTQSG7IfGOtJ4U1BTTxTApnQWNAVVRk
	biRqslhKV9Q9o+dA5a7utzk5qKvzhPlnMVGVxO+jfzjas4P96/o7LfbI+xPWTmICcnBmLHwfZh2
	2nx+EVjS5AngYueO+JRKLO+vcRYMFR8hWHiVCFVBTZDb2xQ99a+SQkRbPgyTnosjknkkIb7zgJ+
	m+oOE5X0CPtitse73FshkzUdh+3w40DaT1C2Zjir4E9DpkJva7BclfeMzopwO8mDNJ0z4F6sd8J
	MyC6YpQmWPALhHdmevecnXpa5sZuYjolpUI/dttb1bNCxPe1h9JROpyvLrXWVW1PT5hks=
X-Received: by 2002:a05:600c:4fcb:b0:499:db27:7b1 with SMTP id 5b1f17b1804b1-49b91c62d9bmr23550655e9.15.1787870853909;
        Thu, 27 Aug 2026 15:47:33 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f231dsm11339075f8f.31.2026.08.27.15.47.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 27 Aug 2026 15:47:33 -0700 (PDT)
Date: Fri, 28 Aug 2026 00:47:29 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: co <co+fd80bc5967eb22c3@bugs.sh>
Cc: linux-usb@vger.kernel.org, "Mathias Nyman" <mathias.nyman@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
Message-ID: <20260828002440.312ec0b6.michal.pecio@gmail.com>
In-Reply-To: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh>
References: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 12:43:58 +0000, co wrote:
> We found a bug reachable in:
> 
>     path    drivers/usb/host
>     crash   out-of-bounds in xhci_queue_bulk_tx()
>     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc")
> 
> Config, environment, the sanitizer report and a C reproducer follow.
> 
> == Notes ===============================================================
>     If you patch the bug based on our artifacts, a tag would be
>     appreciated:
> 
> Reported-by: co+fd80bc5967eb22c3@bugs.sh
> 
>     Everything in this mail is validated by the reproducer below.
> 
>     We also hold an LLM-generated root-cause analysis and a candidate
>     patch. The patch passes an A/B test: the same reproducer panics the
>     unpatched kernel and runs clean on the patched one. Neither has had
>     human review, so both still require validation before you send or
>     apply them. Available on:
> 
>         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
>         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md

I for one have clicked that random web link, the patch boils down to

-       max_pkt = xhci_usb_endpoint_maxp(urb->dev, urb->ep);
+       max_pkt = ring->bounce_buf_len;

and sure, xhci_usb_endpoint_maxp() returns the "raw" out of spec value
from the descriptor, while bounce_buf_len is "sanitized", which means a
constant value of 512 for high-speed devices, since the driver doesn't
actually use out of spec max packet sizes on bulk endpoints (except for
SuperSpeed?), see xhci_endpoint_init().

The sanitized value is used to size bounce buffers and also programmed
into the HW, so it would make sense to use it here too.

And if anyone wonders how such a descriptor can reach HCDs,

  fb5ee84ea72c USB: Accept bulk endpoints with 1024-byte maxpacket

So this kind of weird device (no idea what they are) plus bad luck with
its driver submitting scatter-gather URBs could result in a bad day.

Regards,
Michal
