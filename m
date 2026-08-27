Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5637823C4F3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819047; cv=none; b=EBVrAJ0AXaAxSVns65tTI6lJqRT+TGvlrWxW4H+R7R6MX5mOM0Zitw5vO4cVAYo1pXPIpTB0edgI1DwdjHxuUIPX6LZcMFev9DkVk7ZR8bga+rwszyfZqVAr6fZ0XI7t4dj+jzhLnwzmI+u5jcvvC+7NUjcRUnKkXNIY8WNJ1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819047; c=relaxed/simple;
	bh=vSxvbDRs7jpFNifaA9NQBhKbV6mMP0jERupIA3P82EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoKls6s3c+SvpyTteNIBYMfG2zBHVwTHTMjY4qIu2d+g6lX1vTnQkL3nB7gZt9zsIXODT5yOM2n6S/cD4pzWB2NWAWPS7rPPodJU3f83N+6spcqJCqqvd1wK/Wm+u3Clc5uptt4zymNrC77bOv+gNR2XO+JJIk0srRN/dmzSWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BAtgl98i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkstzukU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BAtgl98i";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkstzukU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787819045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=;
	b=BAtgl98i+nFCD459MVMHKSOxjGmWrwRsy5Y4KDiarEkEEHw82UOdVOTSRMBTQSTnIgO9CC
	SoRmyTO0ajP9uc3Q1FJ0vgQCpnbjuFBWtBxqY8YDiqY9WM2r0cvFzqyad0/D8sQftIRmzm
	T74omMU9ZbzRR/9AjJU8/vwgzKSwW9w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-6L1sV-VXMYurQ0BChAVd_Q-1; Thu, 27 Aug 2026 04:24:02 -0400
X-MC-Unique: 6L1sV-VXMYurQ0BChAVd_Q-1
X-Mimecast-MFC-AGG-ID: 6L1sV-VXMYurQ0BChAVd_Q_1787819041
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f6db77430so253315f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787819041; x=1788423841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=;
        b=dkstzukUbGDLRR0MGf6Kc3UxuNb9eGUDoVgzivRhY+54FCA4nDtLF623+6sj+UB9PR
         7jIpi771R06oxYEPlootW/nvFHphE8ciTKeNPhCSjG3YcbfF6XzmwqABxddK8jJZIRsd
         62cNIqgFdhdSwlvrFju18bah5cE8Gop7dsR+oTRnxG7kOQ27M4H2s/5PWG/f92M/3TrL
         +h5kN6JThjQ1rMk19mQgUxfYmEnNwZDqeymEdXMXOb8F8Jg590Id6AUvjckOKzBy+v5C
         +YhkW7LAQm4UJsugM2RH/VVrcK3xDTiomPpaStCW6HwNbvl0mkPrLdhIgJd9O0TuCaWI
         IHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819041; x=1788423841;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=erCGkMBq6wNZzYxKYvBXkMicQIwmnQyBEnM/IZzuXQI=;
        b=tWEhddNmKKz7vi7T292yTlMWmWxTXuKJOKWPxr9F6qeQPCg/EqRBMVS+J8e9kIGUzG
         vGizJvLm2g/qK8/Grr2i/GaUXQnPR+m8Rvvlr4hkd2ZWL4l6vLu/ZS4WWPsctNsXowzN
         EkSH8SL0mKN3svPVsxbx55g/qF/ipHPNeJyzmnwQgmBs1tNqQyJ1EnQLyKEPzzqxWQlX
         nDxJapa8E7DI6DxbK10YlEFPvdwNPwBd+RqQ69k05yjoUbxkXkvNDz/0uCHDVfaEoscG
         tGiNWG1QHqFYVamKBMnZ2dV0AmCYGbpWIGRJzON8nEd/eIg3WATCo1vSHE2c+/ja5pzz
         x2fQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHUaCsF5w8LZOqjaMLeJhv9AfoHUJdA7ZKIrHYuWdUoCNCPpJehNyOU1BR3mHKn0dKYyzoOuaScRF1wP4=@vger.kernel.org
X-Gm-Message-State: AFuF++m9W+R8C4/Qc8o4/h7ukcyHwQYAJ5qTaDfkYsT1Ca3UODIs5CjD
	YYHF1BEi/WY5HOGORxIjCuHqfmvQ8zD7GqQq5CIcU/nngfW92tE4p2hyViAf6u0rJWYP8DFhXc9
	w4LswQqCHUVuuGcdr03ZmhqwX/266WqpaIV+BSHH0E2EeiJ0gFb8Cm5lAppERd+eb+Q==
X-Gm-Gg: AR+sD12E4L9qfJJvh6VGznSoGXvEkiXObwJaMo/3jaSiWqdujqwXYt4a6jFaSjv3CZ6
	b8VrTpB2U9uld64NmW2i1cTZmWhqIlkgtgKW8hH1dJfjDBpV8BbzLg83NrGsd3kdMCseJz2bAP4
	eUVTzGEdwnpSY5+H3pjSj6iu1JjT/bGvLz13rk21tUpSIUhOgFsTc+svmfiUNFtR8LO3Sh/ewXv
	mI1dESmn5UyVxUeP0wHKWsgtQRaDN0iQmHi1R2+fwO7IofqjZ0z7Pb1ZEeDqKllIYjvf+X6JbRj
	/ZL5LLpj66Gmu+DgoTil7DyKsQnXnPf3A1587PpgH228aYTsU5kqLP3fwBngA3Q8rLDtvSsAXxs
	lDFitc7g/m+WFzk1aIn+0irNCHaDomll4uHByPNLGhlhcu2NTwBmRpX7govbxS7zuqiJvq6k=
X-Received: by 2002:a05:6000:4543:b0:481:4697:a6b0 with SMTP id ffacd0b85a97d-482e26d99efmr12170110f8f.20.1787819040898;
        Thu, 27 Aug 2026 01:24:00 -0700 (PDT)
X-Received: by 2002:a05:6000:4543:b0:481:4697:a6b0 with SMTP id ffacd0b85a97d-482e26d99efmr12170052f8f.20.1787819040481;
        Thu, 27 Aug 2026 01:24:00 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279ecaesm7526943f8f.6.2026.08.27.01.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:23:59 -0700 (PDT)
Message-ID: <96bd39b4-136b-4941-9cb8-3e35c5680f0a@redhat.com>
Date: Thu, 27 Aug 2026 10:23:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 1/2] net: phy: mediatek: differentiate MT7530
 GE PHY from EcoNet FE PHY
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 daniel@makrotopia.org, naseefkm@gmail.com, joey@tinyisr.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260827065930.2618729-1-cjd@cjdns.fr>
 <20260827065930.2618729-2-cjd@cjdns.fr>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260827065930.2618729-2-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/27/26 8:59 AM, Caleb James DeLisle wrote:
> MT7530 gigabit PHY has the same ID as an EcoNet EN751221 10/100
> PHY. Differentiate by checking whether the PHY supports 1000BASE-T
> which is always supported by MT7530.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

