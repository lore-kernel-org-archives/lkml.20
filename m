Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794287482;
	b=4MuNKUz+R0Uim+6jaljxIPFTet/SHn+rf3WBttZ5cwXviEqp/ieTHT8xzPtI9Xs3QJQR
	 UV6LWQ46zylS8PAoXIw72qcJc+OR126iPp+obAj6xegAVBVKgwjguQ7v3S8XBXpb/jgkp
	 KEGrhr0Yj1IzXzd05cI97u0UyZXl/1jhkN5G5Ax4xxs3pXSjp7RyDZWo/+gGQ7xtupAkp
	 r+Y7YJvRSKQwE3EBlCYrkVNtIVMvlgjVARRMuASQ+PzJOxcjvvlQiWhEqkK+aKx46Zk4K
	 DOtTXUCpjnyPYFDrVILkGBBzhat4hRJ777pooMC14xd934G4k+L6CGEe+Sj8TGolCdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UPqJGVV4jp1LmqkmUXYB895e79jFhk7s8cA2OJitgaQ=;
	b=hqkHtz6IpcIs3v2MLQ0ZTfCKP5lTT4wM87hl8Dh03xERirxrFfCL3oFEreH3syiOWz36
	 RyfbH4gihBiId89BsKHYQsTtaXLNYfNXVe7qyfM+RhPioW13HcwSUX6BPFzLUFcV08VKl
	 sBUa/bjQuK2tGaiGTydkzUI3DGl5Ppiyn115v/CjB2ovAhg1OzuyiOwqrySPgzqGM55ba
	 GCSgZ223yW1Py+0X2pjZtRB7tu5mIFl3qcWtjz80/l+jUSErRyA7bYSetsRYlkI3T7HmA
	 r23QPdorU0xNAl75sa38e+cxQx/Su7NOSzdm5ug89ulLAwAD2fwlAiBaXP214pbnCug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bV+1yb9P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9792660A261B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9792660A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bV+1yb9P
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91eb46044c4so20753976d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:11:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794287480; cv=none;
        d=google.com; s=arc-20260327;
        b=eDnsOXQ7sHCjzo2njvl7ecPFoa45TCAyP4ZMpzNwe5u7q44xg1Pe5JqHImz4hVH8fx
         +eh+zWojXgaPDeqX0zxGTmM5NyApT0jNO9M/IWPbf98Gf2ue2RWb1mI8s5SmRnYfD2ar
         mxYw5D+2B8tUxclwA0Yi/Fog5+RIWUb3Eq8/rwA9rjzJm2yGbSycloHGebEPukt+/Tfo
         1Idz+LQnZ/U1zSxJs/3LSdO0NhXEkRDz2tjVO3R49igiYMqBEgb8JmFubsUCSDC5HBpZ
         i60KpK2WW1ERdGO4UjeZ5JPRCl0OgpaXrfcsJKpk5bM8tzfvQD/elL6obyqQw/wtrkyM
         m+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UPqJGVV4jp1LmqkmUXYB895e79jFhk7s8cA2OJitgaQ=;
        fh=p0MAmIebyoTHBQNNosAMK/ViTtTF5DMySuDnTyyfNGQ=;
        b=mcbaKI1bWUkm9DmKtmzBmYSuTnZh053t3zZj339BV3kdvD0ZnHCNqInFA6JRba5ij8
         +rDHFkrKzt3SCTc1TPyL6+/jcXEVGS6KRxIN0+ebCwnQ90GTEjkMiskPVvDlmTEt2yP/
         jTWA2ffFh4NiXurXt5kARgoQvUQQNhQj/9i0vSNn/l6QK8M6pU9X5+rW9zQNKZUInTxQ
         oNYMIq8V8vdtX9HQHZyL7d9o9fG7TWzxqhCfeeoF3HK1EkoBayinOk5Fbd8GP7s2G36e
         FKXthFAuE7mSyG4pTaZwjG5j7ganzS1X5J4kQjPzCsuffqbWGxR6Lhl/7CxVVIWm1Zb7
         yL9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794287480; x=1794892280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UPqJGVV4jp1LmqkmUXYB895e79jFhk7s8cA2OJitgaQ=;
        b=bV+1yb9PfRgp1o24sh5uZQeKCdtfcEjk8NX/TAclKxSmq0Qn8P2KBRX/LX//N/Y1Ps
         OIaXLMYzRM6L/2i9eEgVptKGlgezm5/t81zlPVHAw/xC88B+TaG2OZKM69cIcDGqOxL/
         DMdP6pu1a3tM9vhfiTMdTejq9xsp03LDWD1AvC/9VRZrdArV6g+B4lmUOmkIwcReWF1w
         rPxBAU0XA867cVyTYWPH5k99p7vruESu+VgylEhIuAS2NN0onm/qcbfrs+TOVAJGBTqT
         Oq6UsToLoLMpLSQjGzhoH+AoCyqyLMT9ndH48xGdiVxRaN7KhUR5eeKuUVhtVs8DLI3T
         ZhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287480; x=1794892280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPqJGVV4jp1LmqkmUXYB895e79jFhk7s8cA2OJitgaQ=;
        b=1Y5mtAtlfsg7eKyoyRMVOCPm2BZ/TSNrfPD6dIwG0T/J5uHvKJpeU4obmK+AMCszTf
         dda/9b4AvDYggYZnlf211aENe2IGy7vWSJAd++P0Hl9/FOwSvZDN4unOsv4p9om06DTb
         TGXX53KWlwJ2eRFTJFXwwy7FHfc9kBy2N9NuicHWrn+W/tRMaUPJabs348STxBjILQhH
         Gu7JwqOO2dB1PrFADYK49EP8ACMdiLrpW1kIP7NKzMUFVh122lvneqclaLXcAPJGRST1
         QcgAHWY6ZtIYaRXiHdUmVtrdrvHAuvTG74TZQEy3TWmdvcm1vhSVZXGpUQ5vNV7nZhol
         IIew==
X-Forwarded-Encrypted: i=1; AL+hErHtBXdBmKfr2aU/cnvg3tyC8IpcMfIaJiXXREmDX2IazILxjmH+0ihqGxPw9TnTUnzc9MPeE2wHSquhBRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ISSEO4H484qRn+b9iXD7rHo9H0miMksP/yTG1G9f+el2xRfg6
	mInN6EtJ2r305Z+PDWFvMuOSXNa/6dB2aSekipB12eR7b4bN5QrS9/e6m8Sxn/bWW7jHMkJZJrX
	wRpyzmhkAB+0sZgIZjVRxZcfkSXsbOCfcLDgI
X-Gm-Gg: AYBFou3hdpHcPwWK7IzlMjmI1ByRMKbGfuOa4xRaXJEqmOrEJdNspCB/uDkfoPL8b9W
	3K1usQHbjhD6A8ViDhaqsj6s8FjDoFjLwegNWOfh4Q7rfWIfW1GqjV3Wrmbvq1a3zhmN61hqg4x
	7MlUfGKNr56A06xjO3OHVbW+SkBFa1CG+SDC6TrPOCWlUsN1PBxA+Afk2wIdM19zcfyS1zHhFHo
	owmcuHO0iuPGysQ+G87LIms6TwZzXG8pL9mPFE3RKhovvfBhnDc0W9CalgzWD9DXldzPwxRqdkH
	mv5N4TDII1fn/FZ/8q1bfHfnZ7tKhGdHPXa/7cpQqm2m7vG6ih7KguXX971MBikNLfyWkI5DGCY
	wlRSuyl1t5ErTs7mrxTZxqXEiYxK4fdMT+D4yCe4M+RuhoQFhlyWfETri6YHc8wCn
X-Received: by 2002:a05:6214:4019:b0:91e:ee6d:753c with SMTP id
 6a1803df08f44-91eef813853mr29247916d6.41.1794287480464; Mon, 09 Nov 2026
 21:11:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105160209.1504867-1-ekffu200098@gmail.com>
In-Reply-To: <20261105160209.1504867-1-ekffu200098@gmail.com>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Tue, 10 Nov 2026 14:11:05 +0900
X-Gm-Features: AclHuK8ikjvdRd9V8RuwzVdKjIe4FAsRE1P8Lc2SAhOxv_fN0Jy7rtPk86DfVSw
Message-ID: <CAC5umyj1FkS5ZTQKhPsG3-6FfnjxwgKvgSnr6tpbtjxfriVnYQ@mail.gmail.com>
Subject: Re: [PATCH] fault-inject: fix boot failure with fault injection boot parameters
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=E5=B9=B411=E6=9C=886=E6=97=A5(=E9=87=91) 1:02 Sang-Heon Jeon <ekffu200=
098@gmail.com>:
>
> Since commit e9bc360b105c ("fault-inject: use prandom where
> cryptographically secure randomness is not needed"), setup_fault_attr()
> calls prandom_init_once(), which calls kmalloc() and schedule_work().
>
> But setup_fault_attr() can be called from __setup handlers before slab
> and workqueues are initialized, so any fault injection boot parameter
> leads to boot failure.
>
> So use DO_ONCE_LITE() instead.
>
> Fixes: e9bc360b105c ("fault-inject: use prandom where cryptographically s=
ecure randomness is not needed")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Thank you very much for fixing the problem.

Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>
