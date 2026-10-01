Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EE83F5BEC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847781; cv=pass; b=cB7lQFWU+ta0rw8h/QclUXfD/2HL42nfL0SuNo69Ig9qTIh/+6fa/9GyzqvypSy4kYukiwzcjMdgWkRzT3IRynUCFxzcLbIOGUEQMn/smnBL2DvR5G1Z9d1OBZG2ut9h+mI3639SOaAET6tPAETIR9IbHxdvgltF/jL2luvAMsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847781; c=relaxed/simple;
	bh=ddo5FpPKSa3ZD86JRNpiQ5RAfQ1PENUBjsbjZZ4aBUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcrqJqoFDLzLoHGnshIFXZpvZleVCgyUQ3w0rBdT5hccPa2/VkKwfd64XZRdpSPM3Jg4emKWyZgxwIZZF7fB2XbGS4pqUw2/ncHidtW+8s+EXFGI9ExejBLDVv2y5gyaKpdF9Eq4IvBvTxsc7tPhHy3OeFhrRGIl6GP6Cg/pniM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiVBifKw; arc=pass smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiVBifKw"
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4ab2d72ff13so2375385b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790847779; cv=none;
        d=google.com; s=arc-20260327;
        b=ncG+v2WEJQtL5kRLmhRRLvR644gteXs5C7XIL1sHWcMpSyn8TMnDL5c+VQu3OIczhy
         AskvAqSrrBbc8UvbyDEzEh7p0TneAYm8jWXN3eaPA7Qgvhs7TU1/dx41krGOcHz8xRZD
         BaYE6BVk7mBMnuOVVY9tlA3/QQUKLMQEBmEd+bkIgOGfQw6DQOwV1uOwQofHW0spYnXb
         HWhDJvvV4GK9OhV5Ng+RjEdw+E7Ntj6scUdoxMh5v756C3hAs3lxWoxziLd158Cq4G6L
         nSk18nIIM+2Hj/gj5QADY0LiGHTe7GbWTDImQbwzN2/VQBkiWK6omOFQYe1KvMGTn7bv
         IjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXVuhUD9j6xV/vHmdo0NZBylAv8WSnTWtpJsuQCbSwk=;
        fh=Z6+m1iCtlT3MvaEXa9MA7UAqNLZ3WP3R4SPI6PNYILw=;
        b=BLZUnfjJhqyLkEYpssNTpP2F7OHSKDW5/JK5QAHELzJlXgeFvIBHrKZtpuD2fRlINL
         7Imu6iDv7s0RjPNY03uUKViKmCxZAQGwb/5NeTonDoemPuWOz9H0pjL11AZP3+PmtysX
         KiaWJBOrhvlqeFvVfA3iFkGkQaPXnFAuQ72m+FIxrNzGWUwfu1c6eMXEwZ7QDBIMaTMz
         z0+UnM5xfdFsZ2m9ddhZrpnUBkaSVkCdAvXLyD/ytZdDp23J6fg4KoJBarYdJMYUh0oS
         bHDxaFr/q9oLSTwYQO7ljy/E4SJCKJdOUMAhZY0xGbDAldU7GhE1kd/5asCfEi16LB/E
         K4Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847778; x=1791452578; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXVuhUD9j6xV/vHmdo0NZBylAv8WSnTWtpJsuQCbSwk=;
        b=CiVBifKwu+4CfIR+NGCQR1ZyzvrmE53peQ6gthfIcQfOlvpfgtxaRWV6aAZhhaowzF
         Kyd5G8lFmeZkSnts/GueISc66h7+FNEWj4PbbKXcmq2wIS+tiMR+hB5ktxOTujIjNXOG
         s+lAWM+RiP/ijWY+2DpMw3KFGFtl2O45BfgUZB6CXmCE8FGTY6ve4B0XLz/6/xu/RQ9Y
         W5irBHnDKGtjk0aGsx+z8urAjP4feBKbadyx1yrfeSNPId9pOuKbJmRsIMJZCq4l7TlM
         SbiBuKgqz1niJ6p2NzT5X+13F07kw3NMyE45hTRtrjHsOBffoxZG09Czjjyg6TD3wVHr
         X6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847779; x=1791452579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXVuhUD9j6xV/vHmdo0NZBylAv8WSnTWtpJsuQCbSwk=;
        b=XnkPvz95rPFjg7ycf4JxTf9d07ok3w8Zow8E8hAUHb5XF4JMfuOnYqkyHvr4VUXi+d
         GMPWKiJ8jPRtJ99lkv22/Xy05KmnUv/aac+ZgJRfvUMGdwOg5cE43v77E7Xfmevscl18
         QNp4SMSbSDji0yDkqGGzCzEpEzCkpY+mVt7RGeKZ7xd5pzUsVhSa5yQ7d8t0gOKwHvnM
         IIemSofq/FHRc53LXGji32vzacSP6S59EFQRUDQYUpkqivttmGxWRY/3QgzLCCPKjYQV
         PSABZw8ZKcjPWXOQ/KJVKdwTjLUuA7j2pa1/KVtdbnmu6X1IBOka8Smeq7P7G0UCZe7m
         /1WQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj7FfeKgAykSj4LbuXTuIPtKfJCjliTzaXwaWYfWM8rk2JDS3XRy96ZGmm3fruh9oTkLVmmw/iZ9OUJjY=@vger.kernel.org
X-Gm-Message-State: AFuF++nYFhEnbfidVCWcKQ9wp7doaczN9I79Sm7+VOwTiHLrAe0dNH3k
	0MrY1TF04avB4X5TFO7nPP+t/XTgvtXS+dy/nl2LXHDoQ2BXTBNg6AuOITeoWghK4j+JJ8Rm0Tn
	au61Q4y0hAdYEJgqyuJmK0v9O2Ey8aKILdcSVbaqMdw==
X-Gm-Gg: AYBFou050Wssa6syYDcjjO/cAoTJaLvYpmTY17cZaskXCacY+oyo2KF5yRzTuQj8Xqs
	qdERQeXVDm3pqsYcglqh/X+SrJnKMEgO+vxS043FW+55UX5VFxBQzgx2iDOaUpRDaxjvEEgKIvr
	IWj01Gr2CUMtZK3OVIDR2PQsMlQu8u2TGLro2/I4ggI81t8m/FHuHEnGMKgFEEmjJ8NWxhj9HJe
	cuDoUohxYyzV80rhF/IPZlvyKGnS9UO95cnM4LwvZyR+JSbUr2NZyRaFkykiCf0Jq6hE1UvG0Ad
	6jrpvO6Yqn7Yza4oomvH+LKobZ74xixq+8YmZWoAc1xNNqGGVWOJBCLJYRwNnxi2Xu+iGtiLrfJ
	O5Ew8/fKpDLkw6w==
X-Received: by 2002:a05:6808:1582:b0:4d6:9153:2968 with SMTP id
 5614622812f47-4f1bafc0673mr4267319b6e.57.1790847778626; Thu, 01 Oct 2026
 02:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926105827.3760-1-dennylin0707@gmail.com> <2026100145-unbitten-playmaker-8ac5@gregkh>
In-Reply-To: <2026100145-unbitten-playmaker-8ac5@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 1 Oct 2026 02:42:47 -0700
X-Gm-Features: AclHuK-M9zWtkr3sM6tGYy3SnQUDCk4tJdBSX-r7cGl5515IiBuM0oKAYfVlPSM
Message-ID: <CAGEkeHd__+Vc9cUuYwUWcnjtBEGU-Lt58TpEnHf_dQGQpUErdw@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: make rtl8723_dequeue_writeport()
 return bool
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> Please change the variable that is assigned to the output of this
> function as well.

I changed queue_empty, which receives the return value of
rtl8723_dequeue_writeport(), from u8 to bool later in the patch:

> -       u8 queue_empty, queue_pending;
> +       bool queue_empty;
> +       u8 queue_pending;

Were you referring to a different variable?

Thanks,
Hungyu Lin
