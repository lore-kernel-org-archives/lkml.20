Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3C3ACA64
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177805; cv=pass; b=imQuawqlt1bbnhV7xabIRKTmJCFPMgKlkZyHXYHqUsI0nh9n+WWwwqfr9mODsIgMSFg0EbJv2s8T4igbesWhmrvrz71MbCWCVpmoNtQEpaLC4PtjJkRraapXFUWQxEoEMgyMgjdFaXB20wHBDRBO+S97+kIa7du1YuY+YAS6MuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177805; c=relaxed/simple;
	bh=MckAIFt7y6KQiCveSZvFBLKgfYCSm/ZaqCz+bYvfhus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhyKT7PtX5aZ4bXNEM9En2vMwPKuandgwNLQ0fSxOK5sKkiwwlm58aTxbTehS8b1Gsdhm3B60UUnZ1RcVQaMVo/GMxAxHCugYxY+O9c3IIzG8WxusxHRUraeXXwEsXpDMKyXm7MTMQ9LRsPf4hakPp4f1vEFpPlfWFGfUatx5do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=none smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b=l2TOw4Lx; arc=pass smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks-com.20251104.gappssmtp.com header.i=@anyfinetworks-com.20251104.gappssmtp.com header.b="l2TOw4Lx"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a05d236f53so591671137.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177803; cv=none;
        d=google.com; s=arc-20260327;
        b=QyI0LB670I9wzkTd9Jb5n3pGUbwAWOH1UdPP/k0ee0yO2WI9ocCXd97yhZ938vNpW/
         jiP2BPyEWCyNT1PLNg+Oa85fky2Q3HKgd2oIRROAXNyFMD0Ub51ymkHdG5rM0Dk7XoNi
         d7wk/PqaN0qmg9ncflWh+lzPlZD6kpF1WedaL5eYwFoTEm9X1lxhqPDaOeDpWzhQ0mah
         6Vb1mDPHY3AmV9wsP88F79RaSH0O4MsK9D5sj9bwrHDJbekveUOKTpckL+jet3JBqK4N
         8TOpigoBCloArdXgqIUvgIbxjvifURGjA68lDX0lGggtxTUO4Z7wTVJ64JR/4HJrfcVP
         i14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WyKcbkEZlymHx0VcQ7j5z0yvfYLusEKHMFeFnghlEvU=;
        fh=dUC+MH0womIRrqrLcukOW/D04dKB/NJD9w7TXvFR8Ro=;
        b=CLiozR+RdC7jtZrr1GqWJJO+hv/vNqo2dPhE9MF3UJ8mVOhAWZizwZvwaKDAudMcdq
         x5jfrtcgMS9fpycRTqrHUTkEP8/3CXjXvgDhoHU3C00dpGivnIA8r2KnvUx7+QmQZ3/u
         uNXp9EI5j5MLjghMSSPLauVAxzj86vMO6c9Sh4aqPnCYRF5cbMmoEbaSkI0tigqCNXRt
         NMXgum0s+Hpa1FX9RVQHlkIsY6BQW9YqClHSHhR+pCj7YupQhZML131EPgLNl4chpeBl
         HtK0NEYUAg0yk8GW5XxHDMmSrM+EBlTGWOr5+MuiDkmArceNZYLzc9jfrq/N4mGl+evj
         UZ/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks-com.20251104.gappssmtp.com; s=20251104; t=1790177803; x=1790782603; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyKcbkEZlymHx0VcQ7j5z0yvfYLusEKHMFeFnghlEvU=;
        b=l2TOw4LxGBKykjSF6yNa2YP4rRN+HRl2i7AntiIAVw6rxJINw/YSTkq0NvZycm3N/e
         ne4Lc/zLTwN3UeZDESODBDOOcEbzZDs4neg9holUuBm7QbL8+LVLWVZDM0ALbCtbAeDo
         0eDAQn+lIzXrndwUjlVhPMdk5+U6CTCiJFzrxB7SM3W5UViZJzcFq42ZUngGYo+i/XO3
         v42WFEV8rxgGpQMVFC2kC/3N34lvxKXVzuplNyxshLjYPNJJObWJgHS08RWIZUVKCVfK
         xdY7cj8P703FrBFSBKWENWXDeru76REFVDSSdM0jFsqzwPUaaYONs6kq6NItxq1Z/7nr
         uDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177803; x=1790782603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyKcbkEZlymHx0VcQ7j5z0yvfYLusEKHMFeFnghlEvU=;
        b=SqDGwUu/tO+xW5Vixo2mF66fCDySC6xOqIh4KVTFXwyImF5rDGgoazm5RHcIF4uRQQ
         tq7+VjxSIWaELYc5iPKz7pD4Co/xErEN71cFZvD3pkJawv1dZXDzQ2zvqSF50lQ6aVZE
         sTRqE06QpBHJYBabhYxpJmX1I/0L9Kfzm7ihqTgTnUelzBeJK5QKADVP3vyxxd1afJVz
         PloRVMQSR9cF1RVvI0PRGGvAAvhfG1FmDgZAnSI3jzi1+CChMSNm8xJjHKBdja/51BNt
         pcqGvkXoU8BHJctGNbOHAOE+Rh5TTUntRvdoVfhEoOOB4eHmDlRCs/ONn5FNmvmPfJYe
         SP7A==
X-Forwarded-Encrypted: i=1; AKwUvByJ4rRDwm72jYxM8zaQZ1bw7Qs3Hh06dly0k5CF8bm2Hig0zyTPu+iCswegJTYiJBhXoSzWaQ2kQe4rS5s=@vger.kernel.org
X-Gm-Message-State: AFuF++lgBVj37eY0QLYVno92RPB8o5U5NMKMv3tENPkXVk5DsafOwTz9
	9Fr3QaPq/SlBrX0otRUcg+DI74D2cPajPl8Bs3AAz4FxtpF/UNzgrh8gkOF5MME7ozhHfMoR0Xc
	GPdaUIXpWDgKBWcfHWF6tsnXzeoWwfUJGHzcNH/AOQg==
X-Gm-Gg: AYBFou3Wu8cRWx9DrxTHlBY4ypvS/ZI3omUBdbS7JBDtDrQ2j6rGzzTtUUvmToy5r5D
	5y1LiUEa+7+OlSyufePVXqnnfeO5Yum+bXIZ6U+t2VXBE1qgI/YSnqG1AvGLtdbQOG56mGiQgvq
	VeIkZo9dR4cKV366pTF8r75LXAG5rIjGJH0MbFfkaX+26MHtI9hhO5WN5NHLi/7si0mp2uBGLFp
	uPh2p8/dSLRjzM44Ej6DkzZwEkELjBskLZ5C8LWDlaOq5JZOR8BQZwRLQLFpfUaZ4G5zyuev2XE
	bZpR7Sb/Efiz/kGOKXcS+5cTnVYNgOcDSWp+tBcaYBq6/LcVHlQ4ax4=
X-Received: by 2002:a05:6102:c94:b0:7a7:19aa:8a81 with SMTP id
 ada2fe7eead31-7ac1ceab000mr2765066137.28.1790177803157; Wed, 23 Sep 2026
 08:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911213340.3767930-1-main.kalliope@gmail.com>
In-Reply-To: <20260911213340.3767930-1-main.kalliope@gmail.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Wed, 23 Sep 2026 17:36:32 +0200
X-Gm-Features: AclHuK9A_heK5XpfCJuEwPoemEBWBt68h_7NVvsiHk4qVRuUG-8IlkgYOWm5Ax8
Message-ID: <CAM1=_QT3=gVshfds+0dZbmHy3vrturgddDfzj8MQYaj_mCchMg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/3] bpf, mips: Add signed div/mod support
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: tsbogend@alpha.franken.de, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, paulburton@kernel.org, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

> Nicholas Dudar (3):
>   bpf, mips: Factor out div/mod emission helpers
>   MIPS: uasm: Add signed div/mod and sign-extension emitters
>   bpf, mips: Add support for BPF_SDIV and BPF_SMOD

Tested together with the other MIPS BPF JIT series and fixes. See
https://lore.kernel.org/bpf/CAM1=_QTjcyMtMLawSFnCt2c5wJJ-if40GSfo+o-CoZqcgx5wYQ@mail.gmail.com/
for test setup and results.

For the series:
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

Thanks,
Johan
