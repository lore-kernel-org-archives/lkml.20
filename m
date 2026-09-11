Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA05B48F006
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135122; cv=pass; b=VJ5ZfP79BTRB1HExX1JqQvwK5LM5Ad0nyLZcGusc1MqZZ0fYTE6iYBH5zX39EmgaI1D6WbO01Dl+a32KwyH/1E19X5YyYt4liBMyHC/52VHEf1T9oC57+U0WmR3tiAx2bJfFqp844Ornt1Mm2k4nYsjmWkc5bnGtwJseSCwIHrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135122; c=relaxed/simple;
	bh=xDEHxvbeRV+H+3ZnrTLb1ZOhWNi2risnbOgmdwBS5bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALMUkc5os7eM89SxYX/5I0nKp3E7bF1tK5z8EI8Gi0wF7Ahxoy6F7Q3XE7z43XNAlYB/GIQD9qKm8OY7caddo5Cch8FJeEPvXqpNM/Kpf2hchiGEmw57IZoFNX2JWGGwChaZyiokN67PC29fALQAaUVz/Ep9IXTpqBNxYDVUu6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xc0mAi9M; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xc0mAi9M"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a5921f2a66so8089721fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789135119; cv=none;
        d=google.com; s=arc-20260327;
        b=iPdMt0MgsNIhlPIZ4UGwZzDNeFc/sz4D7UchIDELO0KlGOYs/n7XrfHMkcBJnXs3ff
         8BRAqEE6ejcLY+kLssx1CfLnq95ILcHabocc5NHxFlcHzXWv3QiZsM5JfftoxTuhmXAa
         c6q93EMbdssuZO/n3Wdcj6s2EMnKr5xaUQKZDRaqXBDw/n+oRPDXfXWxdh61k1Vhbutf
         7n4YG0NwyOQC5Y4QAqIlHrTpM9Hr35klMbGL/9dXZS//oEt/e8hZFyb5HjTxsPmBfqdt
         dPFrtDEvBHui+eX/tQjgLIXsGBk3VDlWOM+yGb8cCGTDSVzBekWpYYX8Cv6Nm1DYEPuB
         buig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qy+0mFYaryQ+eScYF7uiBLvncEmqva9qKNca69Pe4l8=;
        fh=rMvVVY03m+CtLfl5/KZNaLbl+W4M0Gd/kmWTFGN+2k4=;
        b=kQTtnZxOHhJfT5mezPq+lY7TS0xodrVNdp/BN3ZtHidE+ylhOuAQqxfR6PfTRvsNfp
         ocVDql32yLoVgpUrDOEY6wMFp6gbbCb4nybleKXRpoU0ptj624CjfEZfyoTuw/J0nlqr
         /alSRq4wwtEcbtvPQ0C/RXJFgXaMbFxz6Mw8AnOpYJVsAfQOXTuFI4etQqBuKszdjBSu
         R04L7wI39WbNn+0dZnEBTdoysx+RkFDEyc5CDL1MQ49RzaY0J/EBCytYUIupT3TIYK51
         uEm5AzImuGHtgsLTNWNRIZZysUE3Nl8WQyQfJ6qVr+8j6dwve6qEUPsVruFCWCIh1q9v
         DDtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789135119; x=1789739919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qy+0mFYaryQ+eScYF7uiBLvncEmqva9qKNca69Pe4l8=;
        b=Xc0mAi9M7OOJ1D+QjwjD6pnDoHqBQK0299xq6Umf436oZe+bvTEQYAJ0IgK8W7vqgN
         IsPtSdNuvH3Xx2ehVwLola7q7y3wF8pBNnhAMu8Ua/0hgBT8SxIpC1tTHsoyMmB3F1mV
         V45kFYDsmr9Q9wC6KCaKCUhfgTGLCiEXAmZEwRx8Sidp7jVEcvFdlXohWnu03Kg6RGXP
         BcyP2Hsk2saEbASBDep9R9LUwEu+cNr0OMliKKMcjdaAZYF+6qA8NVYHdu2oywrN2jh3
         2k6JnB8G3wkD9qAB09ymXq07ZvVAe4CGL4rbk6za+bEh79rCNzJROzN6USmw+Z/j2Gsh
         7WqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135119; x=1789739919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qy+0mFYaryQ+eScYF7uiBLvncEmqva9qKNca69Pe4l8=;
        b=XxUAIVpThwsG1uU9PBVB4dlDbTBP7YBYQ6Br84trqAUDNQTtGcteRK1ySIMn7uG1XG
         yQSYYWODpALmgw1ks2wMGn0DFzTr8VxY6wMQhMQoEXqF3vnYHoLBhpbMPe2+WDF5e+hY
         HVPGSC1SajnvwG5wTMGEOVMLplrt9Qju6MwrZM+WSJ2Mdn8pr2O6EVutw6SOwur+Wtgb
         hr1fQsygKiKekzrl3FOX4LOlDQv/GxwtvK7juWHx2OGzSz12Zta9WYxxEs3JDA5nxJt1
         0TNXpyJZm9D6bpnGogHH94uKIWOi3AdtNz3eTb4I4JDsf651G0NrsWULJo+5VXIO/fce
         dX5A==
X-Forwarded-Encrypted: i=1; AKwUvBz6nv9wHA3nL0kJcEv6rE5T40Wq1666TCpawids48FAj+2M3ysP1uApvPr4F5LCTn9KvF748TKXSvPU6Ms=@vger.kernel.org
X-Gm-Message-State: AFuF++mdCLGCkCBECL3Rkwa+tzCCD1MjcOgwHMbNxt8WMdvPu2HW9UFU
	FUl0jhw9CvwORXOpC8LyZBq6hucOqO7/hSfQZqJyO2TbZoKODA3dJaKjgHQ4o2MHV+OOV8eWk+Q
	xqcirfEmNJZ/dbhqawHNM4W5szzOIUGg=
X-Gm-Gg: AYBFou3swGsZ3aFW7lds0SsAp1JMJ9gxg0azueASCahsBxtO9eNeRwH/wHgz8yewACL
	z7/2RlY6AUBgHBfitvBmauoT9rRRN/fCE4/XBrkJTNMvZdGplzcxybqbWkmR1FVQDKOkr2z+INh
	0C8Zkqf34d+800icZr3IdEhiXFNwvEZ7RksecBx8kaFE3hgpLVz+fKCdcQZ+35Vw4wcgU1nBkWw
	v6BSoV1ELByodc4sRVlbMmUGXq2zyH9F8b+PU7HG8bjkrdRmo+WomgxgDxDQibKnDazVaGi2HcT
	AOcIhUM1ZoGbkmp0HzWZ/wXvPmL/OY/yXUAqF94Ug1gjYNw9RRqLXBn3LTz5EMJsdbkV5b5emZm
	uhGQvH1fhRUG+hWs4ZYuCJCBqFSV39wC2S9EgfTPV4VfsXDY8x4K9ykU=
X-Received: by 2002:a2e:a54d:0:b0:3a3:74b9:8a77 with SMTP id
 38308e7fff4ca-3a5a51d1316mr5420091fa.16.1789135118445; Fri, 11 Sep 2026
 06:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909125842.528340-1-festevam@gmail.com> <20260909125842.528340-3-festevam@gmail.com>
 <20260909164339.7252469b.michal.pecio@gmail.com>
In-Reply-To: <20260909164339.7252469b.michal.pecio@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 11 Sep 2026 10:58:27 -0300
X-Gm-Features: AcwNN1Xun7EaOLsaQG84F5_Fc8OiEmhbwXmVCCU5E7N0Id-pN0oZLYQbqB7PQyA
Message-ID: <CAOMZO5DfPToSOqi4CW8ETAVkU0RXTr=eyyOqLwkFC8CjhKkoeA@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: xhci-pci: Put PWRON_POLARITY on a defined state
To: Michal Pecio <michal.pecio@gmail.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	parth.pancholi@toradex.com, francesco.dolcini@toradex.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Wed, Sep 9, 2026 at 11:43=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Wed,  9 Sep 2026 09:58:42 -0300, Fabio Estevam wrote:
> > Currently, TUSB73X0_PWRON_POLARITY is set when the
> > "ti,pwron-active-high" is present.
> >
> > However, when "ti,pwron-active-high" is absent, its status could have
> > been set previously by a bootloader or by a previous running kernel.
>
> or by EEPROM.
>
> Do they bother to put the chip in a wrong, non-default state at boot?

I was working on a hardware bring-up with the TUSB7320, and I never
saw it happen.

Since this is more theoretical, let's discard patches 2 and 3 for now.

I'll resend only the first patch of this series.
