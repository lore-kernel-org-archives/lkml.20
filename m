Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C63B6354
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288049; cv=pass; b=c5FKqy+2Cw+REITyoGPOiMVlhFmM9rQ+obvJotx6Fl6ZMcoz5lyFYHeAHk9YvaO1cL4DuQA5iwFQCu4CAE9m6aPX3fuUXquzsbirrqfGu99okLW497P3IzrZ/zjOENZtbSVQ/OWpyAlPMlPq20toW21HnfosKtRZkf4PEjJiGvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288049; c=relaxed/simple;
	bh=Y6k/VDdVR7T5GQtdNCr0LEwRZJBjUJRB8yrHYl+hVCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIskrW9DaQYAUeVvWvVmrHPRZQGLO3z5JIAEkWtIQZtf75gzfi7BZm6RtguWzkpD3WDPQbIFkCvNbgOLRQuevKQ5TU5jbPSqZ8T3nRacrB/Tslt6bSnmppC0Mvyw1m16Ds6L1KkeMN33qIQW4blvmV7JNjRTFJDn8gndi1pmdik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=jcMdewhO; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="jcMdewhO"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059f9so134270e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790288046; cv=none;
        d=google.com; s=arc-20260327;
        b=DQUBHgh4b3P0wx0p70mhg7zw/jHD3PSziX1U1XRNVl2rmjHU8iYM08jHF2SO3LWs4m
         8WUi+FIodndRxZpDlfouDK2j9iyAUpEnurPHEjvjoYE0wEsI9YfxsGwyQtsGNVS3c5cl
         lnefjISDAU09QCMFi3a+WFeYN+NkmfknvX6ozEyko4zcF28ql4wydDJLMGHOle8nU1Wp
         iVLYCEwXx8FecFRwJtmW2fFvJSYt+yLXxjcXuYv7GJETAqNeB0O/4ggjriipVUKiR/n9
         ZHX/5pHkiRiq4dz1DA/mZFgR6LY2Zf7sTQCTqRS8edFsFXoIrj0MdzhK0guaIVSVWQzp
         UhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        fh=ukaJalNBvTv28ePF16lKXRCBrigzgGehZnnHroje9cU=;
        b=gMzN1eldodnbCN256me5XH5Q2Rczx28PK3iBysBJMjf8hlnZYFYBJEiY2JD/ZnaqiE
         CRV1NCpT7e+9mJJIuUUOLlns2cD+AdAHvXNjEoT32smSa3buPZvJ9/s2gqxTmSZr3Ppn
         plul2iWAF+wFvOeL/jfTtjOf/pgeP0PJEon6sbj+ds4pgapWAkxfJob7eDF4yItcNSNy
         4u6/9TbKglBIWFnQF0AKUKU8a6z2927B+D6uwtrxDXoMRNXOWkeMxC3L1YhFS+YJdkDJ
         pO5ntmdihvTzlPOSDo4zKl54/Df8QJwEP1/F2MnOenoN0mmIM9CHB8Ca30vRs7HDLv1t
         uoEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790288046; x=1790892846; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        b=jcMdewhO0LuCU11N9vOKUuiG2uuR1U8epwSilRscOvpeLdoo87Cl/tl4jMZvs/uoKl
         DAxxNKoAx6Wr2oBBk6qaT4HbeKDj5dma9b8QK/q9lozofh9a4ZhtfS8GeAXD4MXoe5p4
         aMKlCkQ/kAlbyNOtHnbfe4MJgnMhmFSlEz/RhwFA7+xWAPPTDm1sqSOFD/XsqjUrwNRz
         PPwh1fAccMUnGfZF934EOSi8YUBuiXwPlI83HPP6RvANcXTCL7dOqPh8JiePVNjuY1bA
         BzbEQ2CgKmaC/fKWgjWtfi1kvkSfJP83pPdwmzR5t/4T/ZS6aMv/OJy5b6Gyi+E2NqDV
         uUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288046; x=1790892846;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L8UHEMtwpEHlfp88gUqgyJuvWGmkeEaCp6kkxrF6mZ4=;
        b=XoMHRub2RU9uLLv6kQpUXB+dpPag48NnapXzFHwM5b5eFg1/ruCFusuzPoF2fgcC6W
         8qQKGhixtpzvi1LKHzni2BBzXlS2AuXxQspw9+ebCPZKPJfN3ZgExuW5RUTDizT6ecyH
         vuZFR/6pJjnqMdHn6LUP6VQhhC9ibEKXbLWjLREfA5g7SZz2ehTxwmk82EhqyegVOZCE
         JbAsTYgRQ4A/tN73BO9eQEgKaXTFjsf3NcgVzePOmcQsj+L9yJp27xBs06O4UpfrmR8d
         vGs9NxCJM8Q5iVHuTbxv+KyfxF4jv7d3iTL8c0Skub3FhsrEHdYXHUar9KygnghmkZlx
         J90g==
X-Forwarded-Encrypted: i=1; AKwUvBxFXxvghcM0lMQ7inOBLLpdzxSTM/5YhqW3bBN6araRcAgt9+35YJeGbnW0IaN88XcWcb5OYUnLhqV5lJk=@vger.kernel.org
X-Gm-Message-State: AFuF++kAPFZN38QcQ+ef056+k1uzhlwRsicBG/ro/Fm9iQrka0OqiMkB
	2q2QjwGQkWwE10xJJu2q8nGDM1Pg+7XGQ/+U2jGW3qBkRUoxZitbK2k4lF1YlFsY/4pkv46XAIM
	SrycB8jf4EqS03rXTegse4ULSYYhgW+Pe2+vRSfRYZQ==
X-Gm-Gg: AYBFou3JjWfxZ2QxC18gSleSSt6Add1LrGNqqafw8it0N1ptW8BLLTDvlmFJDKhtn1i
	J02G5338VYIl5864n/yOTipylJ95pNdz+m2YYHuSxpsmvR8WQWXn5MQ9LvA79vlhO9d9PiGHr0K
	2eehipvNm5X6n7LuQawQAaPrH7XG1JBZG/8H0lbAc7LVEJ4d32cjCSekjwBgWH0q0/BswfBQwla
	2n+9HXakSaN6kzspT3GjddwcX20Xjl30FJLEQ2z5k5RRx0+PUr4opfqO0tvI1q0/OEP7GMErU8Y
	mig32gGKmpLsGp2zOJNLg84dhdn4aNxzJ6QXfIzcr0Owz+5nKTOz6fIc7uCtvrpjnVM=
X-Received: by 2002:a05:6122:3295:b0:5c9:c60e:3a43 with SMTP id
 71dfb90a1353d-5cb0c04d686mr2341350e0c.21.1790288046416; Thu, 24 Sep 2026
 15:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924125940.22665-1-lnicoara@thinkoid.org> <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
 <CAAhq3a6OV6+Z0p=qVqpUiL-QoP92fYTsf5MBQL-f2oedddW=Dg@mail.gmail.com> <d617c7b0-e6e3-bcc0-7ea9-5b955bc367bf@marek.ca>
In-Reply-To: <d617c7b0-e6e3-bcc0-7ea9-5b955bc367bf@marek.ca>
From: Liviu Nicoara <lnicoara@thinkoid.org>
Date: Thu, 24 Sep 2026 18:13:54 -0400
X-Gm-Features: AclHuK9Ny-J_xRX3edCHYS4smybOTebjsGXoFfMTc6mVJ9Lh1EVgnmD8m1H0i3E
Message-ID: <CAAhq3a51vkfsmjsLSyVBydzLrCAEW0mUjXMAPqzGLViwVCS+Dw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Jonathan Marek <jonathan@marek.ca>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> in this case, while its playing with the wrong volume, use /dev/mem to
> directly read the value of the volume register and then write the same
> value, if that fixes the volume from 69 to 81, then this patch might be
> necessary, otherwise its papering over the issue like I wrote

Done, on the unpatched driver (v7.2.6, stock lpass-wsa-macro, booted
with iomem=relaxed so /dev/mem can reach the macro at 0x6b00000):

I played back a tone that I changed from 81 to 69 mid-play and the
volume went down audibly. It read back 0xf1 through /dev/mem. Then:

1. With the macro runtime-suspended, I changed WSA_RX0 Digital Volume
   from 69 to 81.
2. I started playback: it played at the 69 level, quieter.
3. While it was playing, a /dev/mem read of 0x6b00414 returned 0xfd
   (81).
4. I wrote 0xfd back to 0x6b00414 through /dev/mem: the volume went up
   to 81 at once.

So the hardware register already held the new value, and rewriting it
with the path running, without regmap involved, is what made it take
effect.
