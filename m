Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923783;
	b=rHnepYy786YEGnIfmqasWbMhyO76+/K5rAWbUHAciKcYIAyQz+mRF1lh+hJEfRC7pw5a
	 k38usunIkkhcuQe21w5SjPZqK5btcDU3GwtG1WyRcqh9Dyy5gPNMtqJFel9fKGOQpoZbL
	 zGf2xBK6QcKJOfggXQyxPSzunHzovf399r8mefZqQqR4t3kpr2OzqwKlvdLPisr3F0IBg
	 KwKsXxyS3EbEm6VfBOWkTZwjz9wgtD475z1XFWrXDSb5C1EWHkvy2GrhoJlJ/YpBuWQNY
	 3KrCBh5JaA4djZbWnpLSriuKOM6rXKsc6dPt5DpPP4bOHZ9RyNxbMyo2cIgDJFUAVOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=TrARtNuZPl0Lpgj7SQ8LbGOsanuNPRyo5Y7yT6NLi14=;
	b=SVluAdWhFI5WVd7jkecnQD733AcJV5AOesDzz84Ure9xwwOoReWq+n6B7WNt/SQHJEGa
	 tzC+NARQpM1ZsQiegyApFBPIPJLWwkgumzy/tLCJ8JaycxjcGAcBEJfc0dt4baq3cXH2r
	 Jai2vw3B62K7eOkNowoZXnjleINDX5+GJyM4rtOU5vTHGjaFMrWCcKYVEFY76joxiSWWS
	 l2pX6+fUmjauYQpY7DenVj2VU5yy4VB8yi4DkVsabvHUTtvh40iXBffPHbZsbNr+Vtpoe
	 796WwRCANWse0U6dC5rZd5t1MBLoVBFBnxwwz48pLdo3KpvQgcCzCmO0GO/ot86IW1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ddY/vVw+";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CEF606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CEF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ddY/vVw+
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so21588675e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794923782; x=1795528582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TrARtNuZPl0Lpgj7SQ8LbGOsanuNPRyo5Y7yT6NLi14=;
        b=ddY/vVw+u2/9S5/xnpFRxV/+xvnnLOjruVQZmwQu373x4/QGFUw4csP8nNGlscLNAo
         8GQIgdfo8o707bcpmdTFYepQJW86RV0bxoFr12ks7XSmgwyHHzmKkEi2bVaEraFmeXPA
         hY6/BwPBFiKGOP1BE/KxZak/5QGWphSx6JRVxiyf3P8DkJwg5fVhGMwfDkI2mru9Wdyn
         i+U+ED3S1AiojX4I3172nvRvlN1phI7qEFLyFqVI8VepaPpKbGcxLRVfLbdllHEYw1D/
         XjZEXmvtw/Xjwf4HVHYlIHw5MefSC+NfotSLxsaCtbl1kCYRcZJK/XFc10lwCe1MY+0v
         6iDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923782; x=1795528582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TrARtNuZPl0Lpgj7SQ8LbGOsanuNPRyo5Y7yT6NLi14=;
        b=EaAqrvAWxHSM/nv7Ra9PYNmllQoHwRFcZqPmXR82ddPjEsI5G7Zh0xXzeqtKqhFCBy
         XCdlpHwEAV4bxfHPWIu5Xwn5bYpaUUu5Y47D2V3SoB0iBzGLuvYYFsn/waNanmJS4sRn
         vdiKbjpdV5YJU/IHJemZozuK6+SbsourfrivucAQbxsUeNqb9uY+u2Ea+AMZ2BO+TY17
         qI46Rz7zWowd57gmzpaUWr1r9idFkuVqRl5x7IJ1LneTJ7z/2uEe4LEkwzCAPB1jfSIZ
         fy1rNNBp2goS+ixFn3G75gGEXdMo4WoZ4B5sTuGhdDefqC8T548+Z0oYg0A0kGxVAs3Z
         sOHg==
X-Forwarded-Encrypted: i=1; AL+hErEU3lZ7tsRWS/pMUcGeREz8+rZBSmZSyTmTOkZvaKb6f4eqePMorfxYsZTTKiWcn5y5jXuHWLgmtVNpMAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GskRvYstSt/26TfIEQNXVOo3xWsiWxF/vPBX0QPvTQHW4WPjK
	O/fODlh0Qjym+mL303OkvTsZwPk713Yw4N6y+l1dnc5MZRC4PZylGipFpfF4uL3EwA==
X-Gm-Gg: AYBFou3kag8sxR727p1qZc3e0BDohbMOnZ3qkPVrpELSTSxN2jW+1Enu33um3mQcA3c
	+eNqLLVQmXw3PuCyFbRTxt0DlUID9kLQkWeRSe75IAAum8q2O1QkUnoxpsCG1G3BLfhhfmRIqKd
	2UrC3COAmEc9whGYfDmyViUyWKkxLYO8JRrYjjMnUrwOuBLIeY6dfDaWeC4GdwJvB9whssCK4DR
	KWz+w0CpXR/ncVUw9O/Vbtq6Tm/iCQCz5WjHGJBpmG77PAKMOzEDe8YpaAP3aZuflWrxTxfOTU0
	TWVfLbe+GyjudyA1x0hER8OT1GLRuuGDkcaKe/639QZpREk23Hjq+0vBe75k0Ya7thuzt967fEN
	360Mf+T8sEE+fI1kPrUGNBcEJeRRSGW/7x99cX3NHMkj9jpogD+/6xdO8qCzRlZ3HhZvxwdo6IX
	kAef8Z7kx0aC7Zxxuz7+ElB7Wh4Xg0aW7gE4YvEGt00BmHv10APAhyi43yYpXNSpy+NzagA9miD
	hB9boeA1ZTAZ4aHYLgKdeJuAQ/BYEuPg3RtE1+XenCqYVwa7sayMJWhJj9R0Zby6vNL6+vTcSJ2
	Z7VpK7veDru4Y5VVGxzX3lOgndcS4b9G1NmnyZDcZ69qhkzdumfDKI93nJAiCldVoAFKEEKtQM3
	OW/H38w==
X-Received: by 2002:a05:600c:2c7:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb55a71180mr192448425e9.28.1794923780717;
        Tue, 17 Nov 2026 05:56:20 -0800 (PST)
Received: from google.com ([2a00:79e0:288a:8:12e4:4602:d8d8:3043])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm29716380f8f.52.2026.11.17.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:56:20 -0800 (PST)
Date: Tue, 17 Nov 2026 14:56:15 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Ada Smith <adasmithgt@gmail.com>, Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>, kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 1/6] landlock: Factor out capability denial checks
Message-ID: <avxc_yI1fYx2qQ03@google.com>
References: <20261117101157.2520463-1-mic@digikod.net>
 <20261117101157.2520463-2-mic@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261117101157.2520463-2-mic@digikod.net>

On Tue, Nov 17, 2026 at 11:11:51AM +0100, Mickaël Salaün wrote:
> hook_capable() is the only place that checks a capability against a
> Landlock domain.  commoncap also makes capability decisions from other
> LSM hooks, and the following commits add Landlock counterparts for them.
> Move the check and its denial logging into check_cap() so that these
> hooks share it.
> 
> No functional change.
> 
> Cc: Günther Noack <gnoack@google.com>
> Acked-by: Serge Hallyn (AMD) <sergeh@kernel.org>
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
> 
> Changes since v1:
> https://patch.msgid.link/20261110202436.2408244-2-mic@digikod.net
> - Add Serge Hallyn's Acked-by.
> ---
>  security/landlock/cap.c | 36 +++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/security/landlock/cap.c b/security/landlock/cap.c
> index b4f491b09baa..fa59118e3486 100644
> --- a/security/landlock/cap.c
> +++ b/security/landlock/cap.c
> @@ -24,25 +24,21 @@ static const struct access_masks cap_permission = {
>  };
>  
>  /**
> - * hook_capable - Deny capability use for Landlock-sandboxed processes
> + * check_cap - Check a capability use against the domain of @cred
>   *
>   * @cred: Credentials being checked.
> - * @ns: Target user namespace (intentionally ignored; policy depends on the
> - *      acting credentials and @cap, not namespace ownership).
>   * @cap: Capability number (CAP_*).
>   * @opts: Capability check options.  CAP_OPT_NOAUDIT skips the denial record:
>   *        no audit record, no trace event, and no denial count.
>   *
>   * Pure bitmask check: denies the capability if it is not in the layer's allowed
> - * set.  This hook is purely restrictive: commoncap is registered with
> - * LSM_ORDER_FIRST so cap_capable() always runs first, which means Landlock can
> - * deny capabilities that commoncap would allow, but never grant capabilities
> - * that commoncap denied.
> + * set.  It does not check that @cred holds @cap: only call it for a capability
> + * that commoncap already granted.
>   *
>   * Return: 0 if allowed, -EPERM if capability use is denied.
>   */
> -static int hook_capable(const struct cred *cred, struct user_namespace *ns,
> -			int cap, unsigned int opts)
> +static int check_cap(const struct cred *const cred, const int cap,
> +		     const unsigned int opts)
>  {
>  	const struct landlock_cred_security *subject;
>  	size_t denied_layer;
> @@ -72,6 +68,28 @@ static int hook_capable(const struct cred *cred, struct user_namespace *ns,
>  	return -EPERM;
>  }
>  
> +/**
> + * hook_capable - Deny capability use for Landlock-sandboxed processes
> + *
> + * @cred: Credentials being checked.
> + * @ns: Target user namespace (intentionally ignored; policy depends on the
> + *      acting credentials and @cap, not namespace ownership).
> + * @cap: Capability number (CAP_*).
> + * @opts: Capability check options, see check_cap().
> + *
> + * This hook is purely restrictive: commoncap is registered with LSM_ORDER_FIRST
> + * so cap_capable() always runs first, which means Landlock can deny
> + * capabilities that commoncap would allow, but never grant capabilities that
> + * commoncap denied.
> + *
> + * Return: 0 if allowed, -EPERM if capability use is denied.
> + */
> +static int hook_capable(const struct cred *cred, struct user_namespace *ns,
> +			int cap, unsigned int opts)
> +{
> +	return check_cap(cred, cap, opts);
> +}
> +
>  static struct security_hook_list landlock_hooks[] __ro_after_init = {
>  	LSM_HOOK_INIT(capable, hook_capable),
>  };
> -- 
> 2.56.0
> 

Reviewed-by: Günther Noack <gnoack@google.com>
