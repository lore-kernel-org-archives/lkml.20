Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EAA3E4113
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372112; cv=none; b=Elrxitpgism5+H5E5wJVIONEi8WzLeVLwzpminJ4zB/Nf1IkLP9/Kl0/T51MFJNDlnCIYdxTOVU7h5wrOImddJQBL91esCpbgns1076278ILw6RPb/cyBUcDNCoRFU6y0BP+W2u3wtiSiMi1zpzRjmQw99AVucO0uVorwo/5+lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372112; c=relaxed/simple;
	bh=wKoOL5nGwvWozMw0aY7lItnriOnICvJoe9c+seOUmB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwcYddqVzvEWSgXPjLsW+gutscXPgtL2smuATeop76DprrH7CBTd31mpidmndqVLVAE1qPVR3ci0hnbwEp6y1mE//7C24inpPNqygKCRl53sTKsFrSXl9j1B8hutqfZ3NSGVrN1oWRFVRmJUi7heL/XYa8E8oBuH/xYs3WMtg0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bunCMjrt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FexH5Npz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bunCMjrt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FexH5Npz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789372109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BijyvVrhoJUaETUvFP/LOF7qCF9MBMWOVmuhNk2So8s=;
	b=bunCMjrtEOh2zIWIANd6mg/uKvAlmAYNX3eZOmJaZzvVvuCuf9CwSOOp9zvmhLKfQ6MYIg
	GTimvLHk+yL/IbEOv2j3hqmZS173c8zGCfeLznWiA8sdlcME+43gdjGihcIDpiD/4JIoBJ
	gUDE3eGARUuy88cg/KqUYn/bkLs8w3k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-X0y_8xM3PlGebL4OcNmixQ-1; Mon, 14 Sep 2026 03:48:28 -0400
X-MC-Unique: X0y_8xM3PlGebL4OcNmixQ-1
X-Mimecast-MFC-AGG-ID: X0y_8xM3PlGebL4OcNmixQ_1789372107
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6422198fso18654845e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789372107; x=1789976907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BijyvVrhoJUaETUvFP/LOF7qCF9MBMWOVmuhNk2So8s=;
        b=FexH5NpzOqBr9hET8E9yAaFqDlX5zawCLozuvJIELIlmrKu06anWlBiVoWmyxuGDas
         cZtoPAhduWsJmyzagzMbs7MX6EVzKMh5PHWTLOzx8hNeX5ZuzIBMFefPvhaTDNvORk9G
         0bz+aTqZr65ry0+xBprFiPlkABHunliiRG36X9uRfmvBO5/ZTtwxKzfwdU/PSM3X8fid
         A7IxuhxWs8aohFcBN4t/xKpNBEuJS+9UbfJUUG3/qlaJzmyQ1jLg8m0V12KpmOZJmqVq
         r20rDruYATOFjZm3azLHwL6YgC8g1PFgCaXdAC4qG7DDbZrbiXRS+l1P9WhiOV0kOCM7
         aWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372107; x=1789976907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BijyvVrhoJUaETUvFP/LOF7qCF9MBMWOVmuhNk2So8s=;
        b=cOiEmCPdUAsoLh1oZdJleOPAzrxXgTvaVudCmzAkiIQ+SEQQu8acsTSSEi4zHvsL3u
         JI2zqAmNsmsXyrR/jDlw1CAiE4LYaPVMB72GFokWQ/lTZdan0AnAbA6j6T/spUS/6kZp
         l/fPUxChqorq9/vCMlmI66WZxW/mdnuveqbSM+yS+aVjAqKH74o/WHhF741preX5bOP8
         PL8TbTOXlMHO09jNN2WhW/ubNQM//OVnF3QiahhNIY0Juopwmm4UT2xiN7XFYUQskd3+
         PLjM8ske+Yq3j7AgUslCLMVErEX9kzLtvOY7d6/CHufbrL7w6jXzQ0z+Z78FY1lj0dw0
         Xw4w==
X-Forwarded-Encrypted: i=1; AKwUvBxZWYXxozkC9zGG8fYjdn95jaSBu/elBrx/7Pch86Iq1PGBZZApw+tS9TeLIYBWAxp8T6VAr0J4g5vvJac=@vger.kernel.org
X-Gm-Message-State: AFuF++mybVxnWQCgfEXIU8fEbaBuMCNUlBYcuDEstieUCihQEE6tpDuN
	nittAdJaIcjmJfs4eIWv53RehHOnO7CNPo8fMmwsBr3m4wV0sei4+TP9AvF3emysDkVVDCgVNGK
	GDAUxMqnQIMt8DUBgGwTgwvKyhzgqdEPnhr01exNHF4d2fzunr8b9f6xenQASpeFxSA==
X-Gm-Gg: AYBFou2BzR4R++wv59ymOzR1EiIgO6shNlY1mF9nauKDkjp3k/96N67C0zByu2KpT1S
	TL5LR1frFiYT+DnyIQivZagedgc1BWY2/thAeXH6E4foqB8g4uRPk1W3OG7yII9XUCZNgUdjWuL
	brPq2/PezD/ZCPXIksteYJI37Ef+ZAiEpEa7YzeDz8JMJqZrUb1ycpYEo3X5hxX6kDY3c0TpyVM
	+/gXh7Xgvkricwt7xgkS5cf7nKF9Aws0s8PolHy13Z7BmiLXjJ8xWTHp7iLHKOmM2WIrFDcR2XM
	0mAWz4ke7zbc5NdfT8tAs44WgEYZDH4+VSDfiIJSS9fJWRp/qdLG2jsWC0TjYfCR3/gx9Ujtebu
	aDEU5twWbJ3YsSFfIdZpW0XeEriEsXk3ptN7Fs0k+NViS0w==
X-Received: by 2002:a05:600c:6309:b0:49e:65ac:eb5f with SMTP id 5b1f17b1804b1-49e7a67eb3emr27530825e9.10.1789372107210;
        Mon, 14 Sep 2026 00:48:27 -0700 (PDT)
X-Received: by 2002:a05:600c:6309:b0:49e:65ac:eb5f with SMTP id 5b1f17b1804b1-49e7a67eb3emr27530205e9.10.1789372106622;
        Mon, 14 Sep 2026 00:48:26 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb3602eesm23908521f8f.34.2026.09.14.00.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:48:25 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:48:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Gokul K <gokul02k@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org
Subject: Re: [PATCH] x86/sev: Do not fail SNP platform init if the vTPM
 cannot be registered
Message-ID: <aqekSpzm14h6fEJr@sgarzare-redhat>
References: <20260821053411.1215497-1-gokul02k@gmail.com>
 <aqJoJBNEpyKpKKix@sgarzare-redhat>
 <20260912182454.2292590@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260912182454.2292590@gmail.com>

On Sat, Sep 12, 2026 at 11:54:54PM +0530, Gokul K wrote:
>> I'm opposed convert to an error message, but honestly I don't understand
>> which problem we are fixing.

Sorry, of course I meant "I'm NOT opposed to"!

>
>Only an inconsistency: no vTPM returns 0, a failed registration returns
>-ENODEV, both leave sev-guest registered, and nothing reads the return
>value.  The failure itself should not happen in practice and I am not
>arguing otherwise.
>
>Happy to drop this if you would rather keep the -ENODEV.

Up to the maintainers. I'm fine with both, but TBH if SVSM tells us it 
has a TPM device and we can't register the device in the system, 
something is seriously wrong, so returning an error seems fine to me, 
since we were not able to properly configure the SNP platform.

Thanks,
Stefano

