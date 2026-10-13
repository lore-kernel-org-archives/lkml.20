Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBE94E0B9D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896898; cv=pass; b=nxzw+3Yfgi/zkpFfBJGAYBn7az5Ay7nbbikaWGp33sRSLojmw+WRgAVYukH5pt++pfdpVhkknldBhV/eYzOodUQ2lZ+IKxuM9WFiL4isWMSkFHSoktGqwZP0Vx75VFGupCcnWj3Iv+iqr0mrAccUWRLT1I46ab9MxNiRhX5KhTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896898; c=relaxed/simple;
	bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEBo8KjQlDxJGC5Z4aJ8VzN9XfwaQcMep7ntbYIqHydGs/9bak7vXMl2jKXregiBJju8iRZ8d9MIOuh3SIE8uNjnHY6MKtidrhjh3LsZWG+9nEZfkC9BTydXui1bM1mRCTW72YTTEG+s8TOCZYupjDEhraB2i4gt/Kjz2O6XenY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+eUxIWB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NbGGYoVj; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+eUxIWB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NbGGYoVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791896896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
	b=Q+eUxIWBfhz9w21RJrLlQ+CO3E8b9WZe4lq5ZdmgGOYFytk4rsH/YdXgXCliQW28ZbToVl
	Fr17nCuWhFiYFQh5YxsyFl9KIod090drLDHHSUc+tadLTYqamd1W68wcZ3P6/ppeviu6VD
	cBm+YuP/aAiCW70jOJ7QzwumdTDG8iU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375--wuD9nc-O-WR04xgZdL28Q-1; Tue, 13 Oct 2026 13:08:14 +0000
X-MC-Unique: -wuD9nc-O-WR04xgZdL28Q-1
X-Mimecast-MFC-AGG-ID: -wuD9nc-O-WR04xgZdL28Q_1791896894
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so26213405e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791896893; cv=none;
        d=google.com; s=arc-20260327;
        b=OvztSkGDRK4ydfj0tyugXciNrasqGcwi6xonYXw/KIWcTPQ5tFZhxv42oXoZ/LGN8o
         /s1T9ag2slnfbTzAid4MiU7qdjpcu2S777PFvgmRX4St1hWVYd8LnCrBTdJtH/MsKZr8
         9iKUjG14igI8Pqs3KjevpK604riy1bjB7k8rbE2++hrB4vxfT/l5bFQZkOqP1Ko7/IKU
         9IVDSBrGqKbEUmQyAMgZbEjUzGeqSs0ucp21iq7fhNWFTBDDy+Pgu00ot6oB6DVenfSs
         QM6Sv2t8yG6B4b9ModF/XTq69TQSHMddo7RldYJ/fo4BSVIN4uCbDMYRe8JaxLekrTO3
         iiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
        fh=yoSXEZHX00/mFqelW88Wfy5uTLkVsFuYZx2qsiETPI4=;
        b=SdgYE2bhMHiUv1avZJoa8AA9rSthOurH0s+eR982Q9071yY2QznKT35oX03bLIYncO
         QeTuXAfmS3JLgK42Io0hF6r5sWxalim7G+anvYwq1npq7YYZMlA64m9VHa53oA457Q3W
         vRiLBp/cCLPEUDhfYzRuTbHv/nzP/HQLg5t/Q0hvSaS4/G6uFneKBKqdF1XvSd5gBIkH
         6cqlqIwCw4JuCsQlh5Skk7vO2En8kjqII3gjrSNX/rR62hV3gm9WfnktjEI6gE1+mwJz
         Wx6F0UMZeMMyjiCfwZLz3RWE5u+vYZ0MHejkSJ1ZT04lTPWi/kIasOA5Tv28wDXFSWRV
         L7Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791896893; x=1792501693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
        b=NbGGYoVj251pAwO3OQG4jy7G675w4oX3RiqszITT70c1b51iveMx22O3vfPlXbjWGf
         xem93lRq0PPdNBhiZWTAbuzAOvYzfKw3Ds+BQnhViWDLnTqQyLhZXeza3v0DFnP11yup
         5ENfuFe4ZHg8FI8SEB5tGyQEf5G4FwAuAu3EpLkPoujQCu8h95VT5YLnbJXwddHg+JiP
         RLgha4DcmaIp8gLllRgW1EFqa8JG66+fIg9jTskAsm94cFAT9kRAFfocU7CaZTmqU63a
         X+LclKUa4giZVWjF03VvvypFPZp76K84i5BJbBSHrv4m44NElWg51SwGarF2r00dZKvX
         TKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896893; x=1792501693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoU3TOgr/tEZhslHcS2tq2f22QCn7cWixxnhkmlEY30=;
        b=Bakk8Nl39Yt4L3CqlnCFhwtKh5Ppz63MAeVzxsrDYrJFfU31c1kZC5QkQmK2WHJA62
         bQUQjMFl1Mq3Q+alVSAup5zlBFOhHd4jG5KVXYm+s7MXFXoFcGxmD7ZsMcadzqp31o3w
         RmT06T6AWMg95/P6ODhhGExPnVO87oug8FShvcZYWzvKTwDxgkQ9jPSskaS91nbefxl8
         uqaSbH4oBFU46qDwRG2PiS/H1JOGB1j5/b9gpqlbrGx4oRGwXBjgIlNMkjOKgSlHGSIg
         1G9hIMb2gpfl1eNf/vFKatvOckK1Vm8XEj1wrxx1ysr84OHRX7OP226tUVYr4UFvXQpp
         Ro/A==
X-Forwarded-Encrypted: i=1; AKwUvBxy8xRQZSHRwbG87tAfpkyYCdohg2CDbjxVzf7sxVufothIhzwB6+2NdkMiCCpwi1K1JXLqTZByXj7mRiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6vfffiDQ/XuaCzbaNWt3ylKFwOBL5fs0F5ZUz5/lR+ah8gr8T
	H3Vsq4dINhJBIWDllbDVDW2QJrYdgnZHwFzv2kQCOp4GkopyxapXNDeOGKdpf9WAo4gEzdBncMJ
	TPPaCHwjOeHFYk6yDkPIUvEth7n1/hp0krbTDehy+1/twyledY0IVpFhWaYHb9+cNvx26WoAUXK
	QECscZpOTlS9SvzkgbWClh0VE1z9TJx1q0buY42h94
X-Gm-Gg: AYBFou2nU6q6ulTjI2vdQWc8csJ6dJnQFOuPAbhe+QQesWG75Jif+zX79PulRFo26NE
	5qnL6u833+8ZpQg4utXh2BgdYOR2bYxlRvD7SeODEDcFcqbpVNEpQEae0xtjLgmC8C6iJ4/KTED
	qnHot2C9kKG0qDK9i7lmWA1iF1q5GGllPdPdjuvnNY/n7eHFqdmn7IbB2U
X-Received: by 2002:a05:600c:3f0c:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a18e44691emr266637225e9.2.1791896893539;
        Tue, 13 Oct 2026 06:08:13 -0700 (PDT)
X-Received: by 2002:a05:600c:3f0c:b0:4a0:1723:2d8e with SMTP id
 5b1f17b1804b1-4a18e44691emr266635145e9.2.1791896891815; Tue, 13 Oct 2026
 06:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ar4BZ26gjQEjZgIa@stanley.mountain> <ffeb3e5b-d9de-4337-b250-e27667024461@web.de>
In-Reply-To: <ffeb3e5b-d9de-4337-b250-e27667024461@web.de>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 13 Oct 2026 09:07:59 -0400
X-Gm-Features: AclHuK8Sj2_Nz53xtduLPLt43HBfIW0FUJKisfBY_Ut16Ue4zEZk3fhpsmezn3s
Message-ID: <CAK-6q+heOWNY8CY8dgotxzEeFC_-huHnnO2pgH8kJsJSGryOtw@mail.gmail.com>
Subject: Re: [PATCH] dlm: clean up a type in waiters_read()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dan Carpenter <error27@gmail.com>, gfs2@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	David Teigland <teigland@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 11, 2026 at 8:17=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > This doesn't affect runtime but "rv" stores error codes and so
> > declare it as ssize_t instead of size_t.
>
> Can a similar adjustment matter also for the local variable =E2=80=9Cret=
=E2=80=9D?
>

What do you mean by 'matter'? It's declared as cleanup.

- Alex

