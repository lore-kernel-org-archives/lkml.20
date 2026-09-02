Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8449483F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352887; cv=none; b=c34QlY9U+ZeJWEuhU4LkklCUhzR4A80ET/1g3CEwY+6OA9x+tlIbR3AHuyxGeH+mT6omHwV/eGv7tW83oD78q/QtumcJuXR+w0Vvv1LIApWXc1/VgZJ5IVadGyI1ky5aiN6QoGwtUtax2Yl2uZm0sXwIOsIU3afLxnGqNQmIVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352887; c=relaxed/simple;
	bh=G+lYeOOKmDDA7vGsZcnldrVLSAUqszDTx32jDkEhPlw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ElKVit3v39KgUMhhVfJfr4g/HAV2Oew2p70F1q75lD9IsNsyx8mq/cwsS4dDPZmt2clMNLaZ71iZBLIMUCLKFfZhe3NemLUn6n7t3h4yNmOWsAReJWK8JDnRr0OdnQ9IU5BalP2YFmTpRliaQezbLciE5W59lmRmPdeKQql8Rlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbpWcDm6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbpWcDm6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c250f28f1cdso163658166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788352884; x=1788957684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxFp9sQLUO1dX2aGvnd0BTgUuZ5fJWW6y/rR0ghk3rQ=;
        b=qbpWcDm6qQmmEfqES8ga9anX9VIeGZ9ZWVyzagDBEnsdhwbRNp8hfnmJt3QPGDif/m
         3O+MJPSRyQjnznB8u3dBfrhBi606rYcH6goZKpobVZXx6Vey1ZHQLPGRb7mBkMG6XAG5
         9GIHbzqyXcOXEl9GPp52l9446BTnpiZeSg9Cii2U2xt0uCsX9l80rueQmDWtJXsUzpSh
         lWZ9i/W+0i0LftGZtTIns6UkoXSTEwVMM1BqJKye/w3vWMScaUrgIEKEupe3HX2mq1vB
         7Qq92Ol9AZXG2VK2ylJ+LsOZGuhyDs95ivk6I8Hsw7yl90xycvFO+lhWVYQwdikufTx4
         JLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788352884; x=1788957684;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mxFp9sQLUO1dX2aGvnd0BTgUuZ5fJWW6y/rR0ghk3rQ=;
        b=NCh8uTYKKgFKuCo1QDpr+HGXg9gtX/6ln0oZamtY8QRzQD2GAa+jY0dgzcPGCHKFkN
         9DOqDvUQNaJBok2/SSVMQvEZXwqSpKwYxMD/krNCflmcUvps0dlmo1ItKY5qrYabnMzJ
         K79wsuVK052EdedNeNwzIW8a81q0mRp836Uzm8/N6w0L62HEPSudZ47F26Lzh64h/kJt
         D8bwzqM4/Q3DKhEkGNybU/zivmPIZujOBysz3jYdte4JNCFxGso06596kjDW2w92qhcU
         qgGXwOYLFAgAHmFNd2GJBsuU5Yp354OZDClxaAOng/d5h5o7A4pwusRyxjx3uP2tW0lW
         o7eQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQm/fICIVRvm62JdxFxIjv+4BIQ6KnyEoUMi2lMwEvoS0el7q6vNAhaA+yOCcTrl188pkYQ8FEkkyM1o4=@vger.kernel.org
X-Gm-Message-State: AFuF++lTvnGp1v0mreQnO04Pl8Ch9Noqr2ArrjnyFPVIVOhkcVAg1gEB
	cBIQRaOQfDeVqpPgXMeH61PIvT30rX+FhXK+grUVzSSW9wahqMy8B6lN
X-Gm-Gg: AYBFou0moaCk+tlR/p30w03bj+ELSDkuHMD9ejJ7E4dS/rWDWP1WlFtaelgg+TSd9rZ
	NgaAGGpEEzfjaqD9Lr6vCsliakpSGQF05hM9UKMVLtZlOkvAslwkUrzpYNWIq0eVTTWEVPGBMTZ
	71W34ORnxnqMZCNa/4WYgnZX4JUTdMjSUyGPsrOxAT7rU9kOBhqzXTNhdoDesedY9ckxH0YlM48
	ptQTVsOopgtPXob+61EaRi0f9T6LU6eq5/f07BC3mID6QED9vrlXO4nfyMh7oFEXznIftFDkg3U
	AJ1OWvJou4KXjrjzy/dLzCqjs9tPYfIA6Wxq2ys2OS8qx32bK9GJPa0eqkzNe50jUMBhIGJAzLX
	YVa8o8rafOuKYqlhrMnJujTV8D7FlaeUY6QIzOfNocdWDZJ9e7pwyj1F2l4KRIynFPAywPjKoUx
	2SAaiyo8zgmOZ87w6oZp1LG2rr4d6W+sbDT2wQBdvTpPtMY+H741WR1ksWVvg4wZzFqXk=
X-Received: by 2002:a17:907:9445:b0:c24:e1e9:69c with SMTP id a640c23a62f3a-c25d4de3f33mr302715266b.0.1788352883908;
        Wed, 02 Sep 2026 05:41:23 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.2.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002f1dcsm127213466b.19.2026.09.02.05.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:41:23 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <37f8d783-3305-44de-8ba0-ab0d2134a83e@xen.org>
Date: Wed, 2 Sep 2026 13:41:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] KVM: x86/xen: Use atomic*() APIs instead of open
 coded equivalents
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
 <20260831213632.81023-10-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Replace the open coded atomic asm blobs in the Xen event injection code
> with equivalent atomic{,64}_xxx() operations.  Casting the event channel
> to atomic types is ugly, but not as ugly as asm blobs.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/kvm/xen.c | 35 ++++++++++++-----------------------
>   1 file changed, 12 insertions(+), 23 deletions(-)
> 
Not entirely clear why going to the trouble of replacing the asm blobs 
in patch 8 was necessary only to remove them here but, if that's 
preferable to squashing this into patch 8...

Reviewed-by: Paul Durrant <paul@xen.org>
