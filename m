Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447527;
	b=qX/W6urWVfvGLW3FMyX9YjefQ5Mnq5zmigwlTUanhm790XCgGUhMMpIjOXy20zzThhji
	 6odoURzB9NugDgCT1oNcD1MIwFC23xUB4hAn1iPBP1VcfLsNap9UD6DRqvUPmJXT72UGh
	 mMOck9q7fDdcJwAzQZ4UcLzvsVPQMzYXdP5pehPOe+2uGGEHroXPwxCCUXX/Uz0cFX+QH
	 8h76+NFMCa2ZBCXX6qHUam3eiWMYCbVzijZAqYIMDK4Lmmc1TVCw/q338oD9a+z3N/gO7
	 auRxISKw8wZF66Eyq6TYFLTqmlnfAAeJWP5zMymg5gL47dJNyUcnItYIy3fQpu2Gl4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447527;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qVlNRgWlT2XIZDtZtIIyBWnxEyXMHWjyglbIu51k728=;
	b=Giuugk6gslYmSByPcmiXbmPjV1TaQj3llwCieD7qMUrGf2Kudq5geiHGw/2iAxw1v1+e
	 2QoDFLdp1eRhL5OBU5xHPF5JF5gQqdzs33CtibZ39AJOEZx4H9xB4188pn3+B2t+ANVqn
	 tTDtgu2Yj8hQsPdnH6slRAsABik39rBsaxZKAvINjthXvQZdcH9VWAVq2rXTjgfp+97Vd
	 sbs73iCuwg0ee/sEiGBIFN4DaetN7HX/ewCCh01IrOSxBTlDWgpCy732pUfnAXfDKQOPE
	 PDkk1cRxxTW4oOYLFCOqXG2ALFvo3K9ZVT5jDGldDH7bhIciDsjlXzPTBu/RyJFucow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=M3lkLus9;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8C4606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8C4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=M3lkLus9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=M3lkLus9smjsiQhWFEKg1vck4wPDNihJYeQrmawtfqGRqTRk8zHIFe8DQEETCv6iZbmmXdEtsYCzX
	 IW+Nz1SwbLi4+ymD+qROHX4ThMxMKgW0aDMkkJ+78BbLG63Lqs65aKmxzKKYmZOumt9msJBmwe05vM
	 LU3u5/ZbUyoAowl0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af518a4999-a86ae;
	Thu, 12 Nov 2026 09:38:44 +0800 (CST)
X-RM-TRANSID:2ee66af518a4999-a86ae
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af518a3369-ed9c2;
	Thu, 12 Nov 2026 09:38:44 +0800 (CST)
X-RM-TRANSID:2ee56af518a3369-ed9c2
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	syzbot+369ee6a6e9d0bbf14b37@syzkaller.appspotmail.com, Jiahao Xu <xujiahao@cmss.chinamobile.com>
Subject: Re: [PATCH v2] drm/fbdev-shmem: don't warn on a transient dirty callback failure
Date: Thu, 12 Nov 2026 09:38:31 +0800
Message-ID: <20261112093831.384543-1-xujiahao@cmss.chinamobile.com>
In-Reply-To: <e16d5fb8-58bb-48dd-8f98-6777bd2fd2e3@suse.de>
References: <20261111124156.317053-1-xujiahao@cmss.chinamobile.com> <e16d5fb8-58bb-48dd-8f98-6777bd2fd2e3@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thomas,

thanks for the quick look.

> Cosmetic? Failing to allocate memory seems like a significant problem to me.

You are right, and "cosmetic" was a poor choice of words on my side.  The
allocation failure is significant -- what I meant is that the patch does not
downgrade it: the error is still returned to the caller unchanged.

What I am after is the drm_WARN_ONCE() call.  It fires for a failure that
userspace can trigger by writing to the fbdev fd under memory pressure, and
it produces a splat that panics with panic_on_warn and that syzbot turns into
a kernel bug report (extid=369ee6a6e9d0bbf14b37).  The same failure is
already reported to userspace through the return value, so the WARN does not
add any information that would identify a driver problem.

For the record, v1 got this wrong in a way that is worth keeping in mind:
with

	if (drm_WARN_ONCE(dev, ret, "Dirty helper failed: ret=%d\n", ret))
		return ret;

the propagation is gated on the value of the WARN macro, which yields 0 when
the warning is disabled, i.e. -ENOMEM was silently dropped.  v2 keeps the
propagation unconditional and only skips the splat for -ENOMEM:

	drm_WARN_ONCE(dev, ret && ret != -ENOMEM,
		      "Dirty helper failed: ret=%d\n", ret);
	if (ret)
		return ret;

If you would rather keep some diagnostics here, I am glad to resend with
either of these instead:

  a) as-is: keep the warning for failures other than -ENOMEM, propagate all;
  b) replace the WARN with drm_dbg_ratelimited()/drm_err_ratelimited();
  c) or drop the patch, if you consider the WARN appropriate in this path.

Which one would you prefer?

Thanks,
Jiahao


