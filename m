Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366A43D9670
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026777; cv=none; b=vGbrr3w5L7iavm17fDIi53LXKB7mhxewcG021eDtYb8aFKENHodnefsDerpk/PHyhu/FF7uj5W+iEn3yZqVP4IZYoO5JarPoatzYZZcfJEkZr9xHZoqV+Dd9lVbDrvCDlYf9dQ7iFWc+Dk0a/AaFiFVgWoQZYeAHE3eZD9op6YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026777; c=relaxed/simple;
	bh=CsLIGHHO8YWAldmY8Naazy7NOx7PZIBpEJmR+iBDvqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2bSUgyupZymnCDSYu5UZ312jsOUeuSAVbS+x36Jf5f+oDELr+t6tigvlNtKTY35q05aDd3Ll7GN2Fjq42hwkC538iimUdOnIm8v50QxS2xPMIBtVE2+mKzML9adW3wLeFBJMWY5YKPLoKRV5h9XUzAljq1pz8kRb21tq+8BX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bj7oyrmZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=toPLaIA3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bj7oyrmZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="toPLaIA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789026774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zdat3lb+JFaceCjEvZhP3kP5xpKa4RbvpVHW8sS2v0=;
	b=Bj7oyrmZVR9i5l09nENsd3Ehvh1j3A2xi86XHNxDhT2mXfcs28L+dK0JMaxFshMm+uMCQc
	fz6AHrQiwN9Xhrs5sCE+zujaXCYbysPtvW7J6lc57gJpca2oQK99xiD0i0ePdB2B0WUr1N
	tsTj5H6qdt7jIgjOS1H8BnCmJLCX6h8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-j02hHne6Nzag1gZIOiaqGQ-1; Thu, 10 Sep 2026 03:52:52 -0400
X-MC-Unique: j02hHne6Nzag1gZIOiaqGQ-1
X-Mimecast-MFC-AGG-ID: j02hHne6Nzag1gZIOiaqGQ_1789026772
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cced8309bso64664865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789026771; x=1789631571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zdat3lb+JFaceCjEvZhP3kP5xpKa4RbvpVHW8sS2v0=;
        b=toPLaIA3jsNbXzTuVdTBeQXvfJAK+C+naJI31B7GoKEINHLc1qcPkHJoPt06NO6ieh
         8vasG/2Cz9uC4DD5+4gHbQXU5uCl6K5UJAk/24JH2B7yS6D8CHOQtCD4qPw78DBdYmls
         BqXwhdDyPj5YgPo0/qjHVeDaMeKCT7nTwJJmnyX7o5RyC4JMIquA3b87Y+zCUGcA/W45
         eNZzgBf1+4kEgCRj/YrXpjf26hl9YzurO+4RMh2GttUe3aYKQ6NniD3dUgqip6N6S3Uk
         DNOqWcKlGNWv5LEXbjha6iUsEVdft4gjrlGI8gvkD7WI6SYTbojc/2G+CeT5JntJGi/Q
         G1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789026771; x=1789631571;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zdat3lb+JFaceCjEvZhP3kP5xpKa4RbvpVHW8sS2v0=;
        b=FWDHP0+gdplyK6+pvXxMkwBQgg7LFV62Dz7gYrfbQd93fxgQ5aqJCW6fvQqbG2v/xu
         M4H/wzcd1GpntZXM+6MXlH4fqRElhvqg1oBSqdsqfu2wIrcqCYQNgC2j1hbnPUSorsMc
         9hbIYIw1PR+NceDSTdvIMpBhb7wkal93OqwtIPlJjUBeFx1fO8XcpKbkf89rgBFncALN
         9IsxySi7Utapg/SLgCHBFPT5MKrRbjt6XJWhJcAaGhSF2wThu8LodwIKF/tpgrN3mv+0
         j7YiL/sGuhg+MtptWoii+pO7KODvf3qNza1/N/dUEEadju4Sp8cz6szpV6JHiwdwbHGS
         fyxg==
X-Forwarded-Encrypted: i=1; AKwUvByua/Ahid+b2ILMUbXXIJMRLVVF+QPuIru5geIf+reOurYs9J3gMIdYnBYQ6PBhWt7ko9rJMg455MXZpSI=@vger.kernel.org
X-Gm-Message-State: AFuF++l3RgMwDQ8sNz+PmhOzGZrl+9+hC7fxiKuKfom9ZMCc9xPvBm0F
	WUQwFBo+wbdpMDxoXQcG0yQ0VV9TgkQccaWrwhWpidxnD/sksf2LDFUIUpC3s9q+VroW6xlWTo/
	oI6Ar5wNovxt2iOG71OxsCdNs1vcuo9o4idStWlEpYXy4IxdlGMJ5EkskYOhsIDrH8A==
X-Gm-Gg: AYBFou0acTq/bNQRUSY7ywebuE9YdjJCLH6SG6dQ5Lmnw3mkN/Qh15oYMY36UzLwi5d
	2Wqz7IM6c3beGSoyJ9f73bbeQF7MEJ7zgW32ZkwpXe11SYFjfF77on/3h6qptjnuAgpN42HQpkQ
	lk9s1bruLfOYwug8VK/QYkU5qFYIBQRboCVceBHVPmdODC1WQGF6syXFBiMxPuiMyJ4paaPJnWt
	Pcu02vEGgu1yRjDXjupJED/6qoZ6sXen08J65tGqA/6bKuDmkD7sKHwm3zCL8POYKcYsqgznMl/
	Hc+ztph2NO5hU2ELEh9IlnKy/Z9B9TxZ6Nyff03zrmszfpFurHcUeyLdoBdJS9olKiW1ZiYB/HY
	rpcYiurGthlPj9u38t9UMc6eRlXEhELMWPXzGCPsMTM7VhA==
X-Received: by 2002:a05:600c:1991:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49d1842f00dmr150578235e9.14.1789026771632;
        Thu, 10 Sep 2026 00:52:51 -0700 (PDT)
X-Received: by 2002:a05:600c:1991:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49d1842f00dmr150577875e9.14.1789026771102;
        Thu, 10 Sep 2026 00:52:51 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm48847267f8f.21.2026.09.10.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:52:50 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:52:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, stable@vger.kernel.org, 
	co+6a581c4284f721d4@bugs.sh, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Jonathan McDowell <noodles@meta.com>, 
	Ross Philipson <ross.philipson@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KEYS: trusted: Fix tpm2_load_cmd() boundary check
Message-ID: <aqJhkjPdib-MQTCT@sgarzare-redhat>
References: <20260901205809.2028454-1-jarkko@kernel.org>
 <apfoKo-BdwaLXtkT@sgarzare-redhat>
 <aqHIwoKcEWeI_yjs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aqHIwoKcEWeI_yjs@kernel.org>

On Wed, Sep 09, 2026 at 11:59:46PM +0300, Jarkko Sakkinen wrote:
>On Wed, Sep 02, 2026 at 11:24:16AM +0200, Stefano Garzarella wrote:
>> On Tue, Sep 01, 2026 at 11:58:06PM +0300, Jarkko Sakkinen wrote:
>> > tpm2_load_cmd() does boundary checks against the ASN.1 size i.e.,
>> > payload->blob_len. Address this by passing the decoded blob size to
>> > tpm2_load_cmd(), and use it for the boundary checks.
>> >
>> > Cc: stable@vger.kernel.org # v5.13+
>> > Fixes: f2219745250f ("security: keys: trusted: use ASN.1 TPM2 key format for the blobs")
>> > Reported-by: co+6a581c4284f721d4@bugs.sh
>> > Closes: https://bugs.sh/b/6a581c4284f721d4/
>> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>> > ---
>> > security/keys/trusted-keys/trusted_tpm2.c | 12 +++++++-----
>> > 1 file changed, 7 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
>> > index 67225dd562a9..01f18bb37047 100644
>> > --- a/security/keys/trusted-keys/trusted_tpm2.c
>> > +++ b/security/keys/trusted-keys/trusted_tpm2.c
>> > @@ -99,7 +99,7 @@ struct tpm2_key_context {
>> >
>> > static int tpm2_key_decode(struct trusted_key_payload *payload,
>> > 			   struct trusted_key_options *options,
>> > -			   u8 **buf)
>> > +			   u8 **buf, unsigned int *blob_len)
>> > {
>> > 	int ret;
>> > 	struct tpm2_key_context ctx;
>> > @@ -120,6 +120,7 @@ static int tpm2_key_decode(struct trusted_key_payload *payload,
>>
>> 	blob = kmalloc(ctx.priv_len + ctx.pub_len + 4, GFP_KERNEL);
>>
>> Pre-existing, but is `+ 4` here useless?
>
>I checked this through in detail.
>
>It should not be like that given that callbacks tpm2_key_{pub,priv}
>provide the length of TPM2B_PUBLIC and TPM2B_PRIVATE.
>
>Thus, it is a bug introduced by f2219745250f ("security: keys: trusted:
>use ASN.1 TPM2 key format for the blobs")

Yep, agree. Do you want me to send a fix?

Thanks,
Stefano

