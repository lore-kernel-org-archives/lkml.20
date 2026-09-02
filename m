Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A847605F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352167; cv=none; b=NEyp2bAVa/z0nq49VMEUIRHfyruxnVL9IzTVO2LskOy8S664aBj4ENKCDomKkPr3qrY8FVu7KND7hnzbab0Wo4ETxEdrj5+0st9g0MXBPBqgoeRLzeqLcJHWY2RnKSkEsZfZZCOk4vto2MhXXbu/MSg6jHQHA35U7GlJ/5IawPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352167; c=relaxed/simple;
	bh=1NtzwtYKQaKOgL1cmBlVFgv6KA6EV4PoWhjFNlHF8y8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M6iE08l8Zb6B7D6On2/BsYo5rsF1TMXhtJjzcf0pwMNIjQ1/UG1rWIreBs4pCJo/IuIfnCyamzR+5iBNYRWjMbjE5xmMTCifdZeCNypDF49WE1DkrMqqRsQf0ll4zNmFhdcr4GxYhVA1jG0zROKc9TkrRNRFunXPXjXtI/46JpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SemxA6EF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SemxA6EF"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a65e66555cso1370927a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352164; x=1788956964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cy2ECIsq8T9hv0xK8mqusI6MnzK8ei8bLe3jiI13Wy8=;
        b=SemxA6EFJ3oox1RC6U/xY0F3HDnNa5CB4upNn08HYSTNF7EWiRxiQnQqYnFgEGi2Te
         KnTEG9nVgM5RvMr01Bdijj+dHyAPGAbplWjoT1bONY7/ORMxbhb3cWitLLvLWXXYTP07
         v8II2/REP5INvBAHjHs7QX75Xy2n5yQlx19TV4ll5b5UlJ947k7sqHovIAE5crrfdVjk
         h4yjVX3h82j3KDJPqBveVrWBUNSpAcKwlVzdpdNbFH8vjfw663WGahdseAWQKVRPhe0m
         o5dU4iWDMyxnUcU85xCzg4j8bdn+M6As2aqbrSXiHjhvyqSh+QS4jvwP+YA1RxKVfKy0
         0MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352164; x=1788956964;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Cy2ECIsq8T9hv0xK8mqusI6MnzK8ei8bLe3jiI13Wy8=;
        b=PNeuygUtjLHqNTT/uiAtIJ/7dMwAODYj0pq4h4s5PHof+dBi3je8zv+racICTtXHIC
         6FyyNmGPbPSw8F4qhI/EY8hafd1QvhOcnO78mS+oP0bEwj+zuiXVexXm1QNtpeIxKD8Z
         7TUYLXMLjLeo/octoimmoXa1c8OJMBEQQdgN22JxQTEp+tB9Qhm79G8tq6SOQGI7H26p
         Qqm1xHtlsP4UttX0XlRfCVqHCMf9scqThwDk3BNO9M2qj0sSyc9+XI/LGfZfjGJd1wST
         fftTLt2s+Z+Tue9f8nZ1RAiJ5tefkwcFowoWR/Hfm8rqALh1z4jKfl3SoZblfsox9sHX
         53tw==
X-Forwarded-Encrypted: i=1; AKwUvBwHbHmti6B2yj5vEL7SEP03L1pJF+XBUB2MIm6ia4wU9+7kR65JWXfaTUFROn+boK/UJaBRsPOqJNuhWsE=@vger.kernel.org
X-Gm-Message-State: AFuF++kdDUPQ9w9LsUmESSLNq08yAWTOTfYiGZ5VZvGzM94W/mytwTGm
	9a3T1qMtaOLaRAarr+DMQeHYhY3jtmchDTP5pQIPHtDHFZuRfKFBUGK5
X-Gm-Gg: AYBFou33TPzmULQQpjASa/tB2P9NkHQ+AHak7FxN4DQlVr7JXG7XK6rR5Y47w+ig8os
	Ogy3lpalvmAn7DdHIDEqnYu6Q+8PmxZd4QCrJp+bazpRRgNkKY1Yap7/eGszNcCo4dplnP2Cabe
	FjDHAkVImtv53Lfikm+bUayWkzg46Cqc+XOvnIGcxXuKj5D6YVVUK6Tf2ErbW7fmi2UeybNfVc6
	sRxwV8E28KnJEpR1BNGOKFM/P6nhYP3k1aS9rQsb4Rf/S9dXNW9veXzQiam8dWmqtegdHdodhnL
	GCSUnTcIa45ylLDV8EHvvDWYk3yRGf+H262eDOtVAZThHuNnD3lAzDhaLOM85WySPFE7Ic8k+UB
	li71ffL6Zx/tHOBcdYYoaYSQlMSWUM2gigMvTebSnnRyXr/4fGWKeyUEudkW5P5nb9tWWJdRMSK
	ljtAwig5BUhHzkBsUbWbzb885bOnxIyq1mxaVzxma9H0OXjEJbo2heqIWUf1CT+E/7wLm5vBcMZ
	1Y=
X-Received: by 2002:a17:907:3f9b:b0:c25:5344:43cd with SMTP id a640c23a62f3a-c25d52b3796mr281561566b.7.1788352164261;
        Wed, 02 Sep 2026 05:29:24 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cfd9c404sm123403066b.0.2026.09.02.05.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:29:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <eaa5cbee-6ac5-48f4-86ca-8759ebbdd7a3@xen.org>
Date: Wed, 2 Sep 2026 13:29:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] KVM: x86/xen: Enforce 4-byte alignment of
 vcpu_info registration
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-7-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Xen's map_guest_area() enforces that vcpu_info is aligned to
> sizeof(xen_ulong_t). KVM has no such check, allowing a guest to
> register vcpu_info at an arbitrary byte alignment.
> 
> Enforce unconditional 4-byte alignment regardless of the current
> shinfo mode. This is sufficient because subsequent commits ensure
> that all locked atomic operations on vcpu_info fields use at most
> 32-bit accesses. Return -ENXIO on failure, matching Xen's
> map_guest_area() behaviour for unaligned requests.
> 
> Originally observed in review of an unrelated patch:
> https://lore.kernel.org/all/20260604193554.1BA311F00893@smtp.kernel.org/
> 
> Cc: stable@vger.kernel.org
> Fixes: 73e69a86347a ("KVM: x86/xen: register vcpu info")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260604193554.1BA311F00893@smtp.kernel.org
> Assisted-by: Kiro:claude-opus-4.6-1m
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/kvm/xen.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
Reviewed-by: Paul Durrant <paul@xen.org>
