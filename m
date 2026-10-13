Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8704E430E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889155; cv=none; b=uIC1Ck83PR0ciMxvg7er3hpZUnm3GAxEUhvU+/CSgxHzP31boB88JoUaPZjdvGYUbnJ1wGbsFjkAI5WMC3zBu75frGUaBfHqbhy3q+J8YjXCbDl1taNbve2W72mpPQqvebD1Me8ObGv6TL7s89wBRIl/++jDaIMaVurtJKJK3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889155; c=relaxed/simple;
	bh=eRm6FKELo9M4XlR0fATfvBgmA/dMHoFQ8Fsbf2LQeyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRbv+1vaHICvYlJ08BIL7QwFa+PSH5hwvKkCUTNjJz9tAHfu/IWCXf60IjjFakIpWwGmJew1p36o0fu8exJu+XowGXnNSUXSXkWCIeYqvHJM3fuFIpPztC3iBUyQjfVFlmj3y+lr7+E0o2zHEmFC3ja3w8gQU7z378F4FFl1qVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jw1ZPfCv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BR662ExJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jw1ZPfCv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BR662ExJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791889151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Te9KqrUPYFQaQoZuFS+h/tQhTt21Uk9KvdIkiSm9Hh4=;
	b=Jw1ZPfCvWk/zXl26+HmW0ayNxB1/iwhDUJ7+dJDjjajSdAe2fxdHPArceWMs1KwrGMsXTl
	zxU4Uy2zBL4m39lA0g5Zp789R9nqzlCwyXKwkg/lYPBSuS1XRXqetq61DnVD1cjUPcatRM
	O0+ktgTRdE2HWnwwJ3NWWusdMEHZ5Cg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-thGWkG5JO-uRqDauRIlrRg-1; Tue, 13 Oct 2026 10:59:10 +0000
X-MC-Unique: thGWkG5JO-uRqDauRIlrRg-1
X-Mimecast-MFC-AGG-ID: thGWkG5JO-uRqDauRIlrRg_1791889149
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1813fea7dso44427975e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791889149; x=1792493949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Te9KqrUPYFQaQoZuFS+h/tQhTt21Uk9KvdIkiSm9Hh4=;
        b=BR662ExJsrx5esodjTtrkOZo9xEzjLjZB8l/oK2sd2g2iT0C4B2YB2rh8Cxi45Gwk5
         hi/dfujNrtHdHGEe01e9VZ6eWkeyWOqM8JZSTBQb84bRIy6jCpGA+qVRbURLxzI5Wgtt
         vifpirdlCIgkVTNkCzvqXh/UXfQD5+T1oRSVfgLDtOsxa/nAgtZQFu1TcIoobgZs5wNy
         xc9JEQ4xK5bgGiNkTrUOb6PcHdYKP69UynAeIeoJWFai9U1JmSas57uNxIK8c9pin8RC
         /1ya1jwlKj4wQ7FbI3iClo3jpIt1+hcV0+R6fdhvQOkXvvk/MTZ98mFVoxP6hvxR/mts
         kagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889149; x=1792493949;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Te9KqrUPYFQaQoZuFS+h/tQhTt21Uk9KvdIkiSm9Hh4=;
        b=zLp1bvgB/8PLW+8fz0q97+WkF5f5/fl81HtADZkde/m1IJaUMIdAaPL2TWP1xoVADs
         vRPiZsTlnW/kdY2R3E2lv7kpFCNvz4qdDkdlietES3V5RZLmtG8ZuKoZOpbx1kML/kkx
         KpezILZDHhtWiCS6Fq/VMINtd8GZjHXN2X4638DolejV+m0yuwurAAr/4xWnC1FCHHG8
         wPTGp0XOD8LELnX2n01Y0x2g9UXirJxeELXINsUmX1hFrZB7m0A3quzIJqBTwXQVwwv+
         KIc/LMwwD+VfhICQjhAAW0ND/PmFlSHNxJnUe6R/cb/wfiJxHtbdzBKqYfoWju2ukrfx
         elRw==
X-Forwarded-Encrypted: i=1; AKwUvBzbpz3HUmQ4wrJXkpeSIW4sMplYs+C19bZTF1QBNeF5HVe3/j464Lv2omVAPWm40QFp+TL+AlHJgdpf+18=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGQW3Nr0RAzc0Qw63dRYoPTSW3rMUyO29dmUCmKt01iJsD8yLm
	yoJi3BvPiPa5N6jZ/Ry29qZa8Y+sJu6A04n7IwzU3jYO3NBuxQDio437k9b19xXn0h9R5d9db0M
	YKi+BGKKY8zw5G89Yvkmbh7pbYOzqXk6G/lOBQd79V16/XMzlUL9fNeu04Q711ESvZA==
X-Gm-Gg: AYBFou3LhLvy2VnHfGe7ZRL0WKaHjmJnF5Zv//6cZNDVh8jIXBp989ukhf2OBCY3Vd1
	YXoAU0r7gt/Jwi0MA4hosSdLwxo0LhBvDlO17AAddovH2A8KlwIpdHziOi6OMxIi92oRjicZBjF
	brYdoSLyMMuz29nMwV/ufbE8q25FS1zBQV4uLmpXSZdoPThn3GnDZnE3OIjE9NtUDdCg/t4Gm8E
	EfcmWRbYJNYEmBlmrdxtx/5af6WJdKN9u+Lc1axF2w83XQTQU7MkT8IY/QVoP95kVVuiUsfAnen
	lXUKR1seMpr90g3ldtanZrY7RUghHB9ffuSz1I1itAs0K0Dugvezsdk2e/D357yq6fWOKUy2jPm
	wIwaaIuJKrALSPK/UtRCGt3UKb6aJoQ5XJxjP2P9+GKerBlK9FxqqpSFo3wQhcFbLG/eOPLUV7w
	==
X-Received: by 2002:a05:600c:6097:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a18e4b8885mr226247915e9.31.1791889149204;
        Tue, 13 Oct 2026 03:59:09 -0700 (PDT)
X-Received: by 2002:a05:600c:6097:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a18e4b8885mr226247595e9.31.1791889148784;
        Tue, 13 Oct 2026 03:59:08 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm406338615e9.7.2026.10.13.03.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:59:08 -0700 (PDT)
Message-ID: <0040948f-abdc-4967-ab76-02962e813dee@redhat.com>
Date: Tue, 13 Oct 2026 12:59:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] smsc911x: propagate reset GPIO errors
To: netdev-bot+sashiko@kernel.org, phucduc.bui@gmail.com
Cc: steve.glendinning@shawell.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007104731.507647-1-phucduc.bui@gmail.com>
 <179154290727.434549.17639920596465691112@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179154290727.434549.17639920596465691112@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/9/26 12:48, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] net: smsc911x: clock reference leak when regulator_bulk_get()
>    fails

The above is IMHO worth addressing.

/P

