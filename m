Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794566004;
	b=A4kQIHrs+deHu7FvNK05pqrG5zRpjftyBUF/K8rSEehQee5/5oXcw3YygFhRryr3VJZE
	 FILeBXB5RrJTFfSiNsD+vrrKZzLbEZFbcJjVwvk7T0UwKjBF82sSgGveGb6SaqIK1UUX5
	 VYlYpsDiKfR5AiINvVgvggiqILq4rOUgbhYu5AUf5hEGp7HxSEoH2lRX9eexkc3iXkVvZ
	 zfUwIfGyb6ocFGNvhjhwaU/+2CXF/r6dkqVvUFlFSv2337IOOPC20l/p3z+NFw7bWebDe
	 xVSMC0QP41wTtiqljERpFbauGxQAV/jesbk9QB4Rn5YSJRhHFPCinFtNCniPFv4FbuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=foZcSwJ0fjwSH4rQkSaNmR4YpsPCYlns+MYnDU2PM1Q=;
	b=jOHTVY1z9H/ZxYZC049eYGvDes4xWNBI1PSzaCLCIwTlyFEuTqV37lyikpOovMhjmP3N
	 XTriNB5HWyc1HAX9iiNnciGe0yxithT2hDUGuBpZg8RDs1ZG1uuYjp3zMT5okT2+v6NE4
	 EWwzl72smwfP1KhhkGjK3ClaSzJ9KyyqPWyIQff0pDaJtAIYUYTZmS8tvCnXEICy1H/aa
	 RwHNxpOtD4IjsZqC5j2IRlj52OX1Qk+HnlM43t0WfofmnquFuGLPev9f4hT+KpRwyK5sR
	 edDz9AYxsJiRTyUPjht5I96GPgyNByW0G3rPyPZ1QE0krP+qXF+nvpMLdc6mHJaytrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G5qujlJi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8CF606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F8CF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G5qujlJi
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0d126f631so8062067b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:33:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794566003; cv=none;
        d=google.com; s=arc-20260327;
        b=WTIZyWkBbiqdw2vrxE3EjLRH0VdRjSzZtTrt5afrBBJSapj3j/bNvTRt23hTj4xKx5
         4Gi9Z2vwX8ARnKr4FjOohHZt6SWfVlGfdF0w1f8agNO+L9KrFtLgkoCueBRwD9fpyu9b
         G2B/xPpleAYgwsxcH16YDQHgEgfKtiBGm8QbifT5SlWrNdq0YqaCCI/qiYe7X0sCA5Io
         hr6Q6yLC8dJHLSDmJMDKfrsEZ3ir1/N/kloHpZEMjGh8ahm+vmAbjDXjwnoz/PEgjbKw
         aMs+jTJl0EIgj4gN55QpS5a331MKawHbuvb+5MhwxpWLDZv8qZxWlzBdqltVcKLYnnpO
         +IsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=foZcSwJ0fjwSH4rQkSaNmR4YpsPCYlns+MYnDU2PM1Q=;
        fh=f6rb1wPWdzL/3jeae7J2AxB4GCZAr3M5hAFsr+4upj8=;
        b=lOuLmyd/dl9sd75PqZ0nw2iXOb3pzVXdAoIhL2IwMPcYVsCxApA8ty9OE4iPrFoPDq
         bxnGnvtDNChTupCAz9IpRqo+JPiIOg0XXVyX84vxCM23ql8RBh5dTGSOn7UZ1UzEOfcO
         36ux3Pisu9UuTN+uhUHFo3TtFxEkFgplFUlFGLLSPXmvgVbYXCL17gPY4ZgX0/HZX+RD
         p4QZ9ArXK/4EWsatIhwFrXT5Zft4vTVHqLP0bDvKOIX44mjaV07XvUK2Bu1bLHTQzh34
         jeUF1QAbfW/d1GLxe4XQ1M+0SmiRB7zdQm8ssjf2/roWKO8trnqFhMS3E+X0TEPADBxH
         oqIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566003; x=1795170803; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foZcSwJ0fjwSH4rQkSaNmR4YpsPCYlns+MYnDU2PM1Q=;
        b=G5qujlJicTKf5kw5hEy+b8kGCniCUE4rMnXBfhe0N5AgAbTdZUeF9nBKrU4c2I/3UF
         wfN6ppVmaYcWN84nyEhUkJD+17RmV3GX9kO2UbSnjUfEWCwuM/Q/T41EtU2TVzqqrjZm
         iYXmdi2j4JnnI1ptQlx6AhmQuafCqOvJ2NvkuyojJE8VTWJzCVSdWDX+eIGJwE5drCGs
         cwWMrxu79btv77gqNCtsuq2VpNnuuHDFsr8mYftMotKiUhjnUJ89Iuq2/tkHjpN93YvL
         jCh8Nr+SEHdBmOWe/b6D8ohSV6Ny3Up9nPn0j9B/O5A3knrei4v03roD68OK+ioeOk6o
         5dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566003; x=1795170803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=foZcSwJ0fjwSH4rQkSaNmR4YpsPCYlns+MYnDU2PM1Q=;
        b=by7dcSZVitifHdWHrPLC+LUJG3Vyfz3d+Qzz8C+J+Tfndzcq8rD3ebfg66UroKktwv
         5ay/jLmC1lGp4M650cZwp6iYjzsS9OOeAiDPeI6Vo0V8CPJq9NUHtv6Otzj5yMH5DLOx
         V2bw/6Ku71c6+X8R4nO2aXjnrUNqcMtvo3OVodWsNSTNbgV/9sDi7cUOJT+VCw+knKzx
         AFGd36eYYvUpG6PdMnrN/mGdoeV3ud2oQHI9uROm7nMwY+uly0TZwlyRrqdiE2HNe8s6
         aCNZSxacIEB6VkNAliBr4Lbj31iwEOL02BaZcSTUClTGT/yqg4vlR1NHsvwz5zwKLShc
         dmkw==
X-Forwarded-Encrypted: i=1; AL+hErGKBA831zGRrFXY8AXkc5ZW7/JgyccWELFWeUbtEEvLgTuMkVYYNZ/zGpSuV5l2L8FVXXj41ZLErR89ASU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GwuOjrp0Bl85zt8BuCjPUSlLMK6O96H5UAOrGm8HTYIMh/+KR
	lgdwK19QNsD9WZCI8jl8F4KzqqslYFR+wWZlS1vqsbc/lH2Sj5cSmisIwpwZG3sh0TznjfXsHw4
	1A8MtlBEYW4VlrZ58r5+CtFcCtJj/9e4=
X-Gm-Gg: AYBFou1+KWLwqvjGq9QhAzjR+2dxsdOi7y3V4t1Er8ejZoYCOesDfUqgf0hpRVtbhNU
	hE9TruISuV/L1KJOlLCPLegz3spl5m+S6SzdTAMpaDHhw4ys7BgUyMsA8cWlSOLcKcVavKRPLps
	fnhP9mmXsMR+TnqzkzU3SRL5sXoTJ17cYN2aV7jvjj9noFaI7hvbuxrrNgfy8cKt0ol+Rr/J9yA
	ETd12f28LyQBQjhL44xP4Yw7U/7uX+r/p4B3U15Aj30/V9PXi+Rm4BnrZ1zE829eRt7rRruOwgv
	sfiBnI5OYFHXDIV4UpcU7j0fOjtUtd94Ddn3fEFv+BXOoS16qnGe6ZzURuYOKHeLgDo+x4s1qwW
	H6oO9w4XrwlIuimJg/T2U/xzhPzBGhsVyvNxAvmI=
X-Received: by 2002:a05:690e:1502:b0:67c:1e14:4fbc with SMTP id
 956f58d0204a3-67d893e4247mr1437064d50.11.1794566002787; Fri, 13 Nov 2026
 02:33:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004061007.7433-1-jsjlee1020@gmail.com> <f3f5fe2c-f0f5-4c23-a2f7-6cb5e09ced5a@kernel.org>
 <CAPHXVrzaWHYccYe+PWLeAf_N3md8ens0UsW7aH-047KGhM4BUg@mail.gmail.com>
 <102da404-ab62-4ba6-b46a-1846ca64c72b@kernel.org> <CAPHXVry2O-AYxTvGdzu+m6b3Q=ho=xL0kpWWqCn0vjj-gOe0ZQ@mail.gmail.com>
 <0e156b8a-2876-4bbe-b16c-55c70b3201b3@kernel.org> <CAPHXVrxHvXChxiBxCcHWLaFwvatnDVhSu7wdvPWiBDYaUSOQJg@mail.gmail.com>
 <86627f3f-cdda-4165-8ca2-0c8dd4e321a9@kernel.org>
In-Reply-To: <86627f3f-cdda-4165-8ca2-0c8dd4e321a9@kernel.org>
From: Seongjae Jeong <jsjlee1020@gmail.com>
Date: Fri, 13 Nov 2026 19:33:10 +0900
X-Gm-Features: AclHuK-dU3XYmKguHiDmDg32EXFrUNZI_2N5QmJS8pOdbdk2kDR0zG0qrZyD1GY
Message-ID: <CAPHXVrx8AESeQdo+nsnHZsBaJ4=_t00cqaT6G1TGh-JLN_pHog@mail.gmail.com>
Subject: Re: [PATCH] f2fs: skip further SIT updates for already invalidated blocks
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, yi.sun@unisoc.com, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chao,

> Previously, we will trigger f2fs_bug_on() and there is no further error handling
> at that point, so that we will update SIT_I(sbi)->written_valid_blocks as well
> incorrectly, so I don't think this is a bug of a66cdd985532.

Understood, thanks for the clarification.
Please keep only the original Fixes tag for 81ffbd224e5f.

Thanks,
Seongjae
