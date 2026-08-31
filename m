Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE3C418371
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182833; cv=none; b=rdTx4Sk1j/i3vmbtUlhXAvvrK+eS4jfHJ++E34raviaK2cONhDN9VXgUYKkkk9p9rkboIu4YYJagOCGM2t60brrTWk6Sibp4VQfY5hZ7IhQ8Ell3d0DaRuv4WkWB90b8Awm/qNHBUBr4J3+mpd9GAjSyRwVTKK2HQKMBOzZwPQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182833; c=relaxed/simple;
	bh=IL49NG86hmpfz8FoyuNmWr2L4LF6fI/1jpdmfWoBgdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nfx4zXbn7tB6UrmyHz+gX7vD9hZdyo7rOhxqKnOBpqKWHpg/1KVa2hTPeS8IROhjm4nzamcPUnjaD8P6X7JIxX8ZP1OxMzXy/TfwQLBBH7cDdVQUQ//FLXbO+zbroaHl0J+Brk1MUxhhgMC1LRRvKrWz9vx6xEJIpNv/H85bnLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LQ8/cE6O; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LQ8/cE6O"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4957eefd361so28128005e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788182830; x=1788787630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dJl19p/pVq6YV4fVMLMZrL500AfikOykyPbafsX3fM=;
        b=LQ8/cE6ODIOl50xgcmqVQbiXieHe63vFArtlgOw0ODWqbotYupC+39rjCZvnS0PkPK
         TUf3/rgD+qpgOqkD5a6s2kKs8OHPpaaEady3TO6cPu636201k9ox0wwpiVTxS9Iah6Df
         JaW9KpeiAUF94Qk9EjS1jxYoKKcG7pktWsh81RgJsoTiPnXqIHX4XAxraydaOR5O+zdO
         2Pkoc61yEPPFc905PLq43x5ay+8VNBpG6uRLMr6eobMGRRxWw1c5jLDpTxCFM4xHm1yx
         QNTpeu0p92QsynUxvZDlZ+3CZhfemZkoxbd6Zx3uyHlz9wuBXmkeQT6ljqR9heYGQUaD
         jatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788182830; x=1788787630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dJl19p/pVq6YV4fVMLMZrL500AfikOykyPbafsX3fM=;
        b=GLMbgXjG7dwG1ix0+n0b14ua3ULoaypRBXGP0evIpnrgc0GfterrH8dP581Br1ysnp
         mVaTvgpBgDFUtmNtN7Tw+MXfh7npDXsJBng8k9Euf3opWEUdtOwQj6SkAdffWFMXVutv
         /8tUXAO7MnoRNIMNW+kO7ZaLKfKgjkXxBQsAnTvL5KJZ55eL34DhrAgPyS4gMtgJ9dDa
         sLKZ7eeWnib0eQ52mAhOOsfMLch8+oZTBuoKKW1FdDyqgvv9kKBeVIzPeugLQkLewADU
         03n1nqeSysLaXKelBta9GNPbvrXuFsuOr8uQXilY7ZkvfwTBg7juklqRUnlu9wv24LBs
         3q9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoPNTNK0qVOeq97fE7jOdeycLSTMF2Qx+/EsHbgGvDVl+x4NKfw4HeCbo78J6sockrHix5xNJ447SEu7fY=@vger.kernel.org
X-Gm-Message-State: AFuF++lYoB0uB9HUidrIJ3Ty1DwIat4cyMtvsdLwR6zlqxkF0Pv4wpb4
	0+7FxYUMC6ztwV3suG4ePGelAIoGMIuTu2TqR0//IUqOM+ED7/DG0DpF3EUgk/OApaA=
X-Gm-Gg: AR+sD134VdOaiG0oHFGTZ1z0iXNZlzufS2B/CMM5JX/exaH3jHVVu9GoXPtq97uipPA
	aUZ+Ll79IpBm0h1c5AxhN1I/YR2Pr9zc2MIjln5Pw7KV4LVGmC2V1JuMkV/mc65xeXJWMh0VE0i
	n0kJvPAKgq/vAYL5WKmyklyl7pPmk10/Rm86Yiy5piDuKrsWmGZHdYBAIB66mQAM+h64pv05v0b
	0LfGZFI1SKYDimGCvxv+3cGnuNKDZVa3RXvoWfje0bSuQVCkIneUnz5oqqVaoPPfp8M5nCbxal7
	Io8HbKPzs+ewah8tx/sL+KD2zcB6q69UpR3H1m8G2ZQFAMsdO4dhrujueX1bBAkYiQoVl5LQfTb
	NeVapDJ9wtxt4zKm8a8MqRNX7VCPQ261q6DUtV7YJKnyEPk9f9h0wKFGS77eVnrE1Rx1PqMf+Xr
	91GemTtDkr28YXOg+zA1nCCU3cf6vgTH/wuKJ2NZ51zbn1L/gv8j+6aKbK5VhuH7FY1meM4DePI
	vZcjB4iX8iy5xigc52thg75Ti40WbY=
X-Received: by 2002:a05:600c:3511:b0:499:adb4:a922 with SMTP id 5b1f17b1804b1-49b91c4bab5mr295369375e9.12.1788182829769;
        Mon, 31 Aug 2026 06:27:09 -0700 (PDT)
Received: from ?IPV6:2a02:3033:283:b9b7:bec2:3dce:f757:ce06? ([2a02:3033:283:b9b7:bec2:3dce:f757:ce06])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm176057695e9.0.2026.08.31.06.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:27:09 -0700 (PDT)
Message-ID: <ea165ff8-cda2-4fed-9354-1d14ac2d87ca@suse.com>
Date: Mon, 31 Aug 2026 15:27:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] USB: usbfs: replace __get_free_page() with kmalloc()
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Chas Williams <3chas3@gmail.com>, Duncan Sands <duncan.sands@free.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 accessrunner-general@lists.sourceforge.net,
 linux-atm-general@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org
References: <20260830-usb-v1-0-aa349c302246@kernel.org>
 <20260830-usb-v1-1-aa349c302246@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260830-usb-v1-1-aa349c302246@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.08.26 10:10, Mike Rapoport (Microsoft) wrote:
> do_proc_control() allocates a temporary buffer for the data stage of a
> control transfer issued from userspace.
> 
> This buffer can be allocated with kmalloc() as there's nothing special
> about it to go directly to the page allocator.

You are breaking the calculation. A page has a size of exactly
PAGE_SIZE. A kmalloced object of PAGE_SIZE is larger. That is
a bad idea.

	Regards
		Oliver

