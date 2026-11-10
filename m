Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296137;
	b=oJSOyx5wKZPoGCtD39oS9bQdJzzoGwGWCJ+UAd3F2yod6JX+gXhmFCfCGzZjTh2V2jMW
	 2a7ydUa2H4adZ4LuGmS8ZDBMyUgDfVDofgHlgekqzjpK0IM2r07LfscJxL8RvRiVIr/tO
	 ZqteABcPryjxkdCeCRJmRx5ocnSSGDhzi2uAbmoxhq02Pj+V/knZAamXrlMyTU60Xaaeg
	 ARqqH2IDDJG4wvZg0syaLHuxAn0dxE46EmYH4IBil0YfjGEM0dEy71DvuG+BgY3LmgN1m
	 wb9abfrL9iqUlP8JTCDs0zWp9wzJ6otjmJ8qSldpxnxDqkqspYoJfW5v8kqIUPdssUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References;
	bh=PHDIoEm9ZHwm2QbXfcuNgzAchc1Bm5nQ/5nALaIInYs=;
	b=mi89KVztXnv4tWwiHDakii+dF/5MswVKnyfQjLUIEnxkUz/g8i6ZgR2JZB48EoEIFGpD
	 Z0UAb8+YE2jhT3PKfQD1gS/mQvJhbu7yqdxM85rOWCpJeqQy0nvbczmkFYMxAFMhtiVAR
	 J07/A/C6eKoXdqcYk0k2DCRP1jsfpDGItmC/gIU1wsRsOKaih016jyeWw+wGVRbBkOdiU
	 rOnIfczk6r4ZWpUYkH8JzpSznkNQilDHfF14cwYEn0h1Ti26QcZAYUAQW0zVGji27drpG
	 HIGwTdQUKYMx8au3qJs6C1sOvp1/jvGR3+VHmpZdw6NMbcNzvC9ub/PoVHN6lVqWFWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcRZgM1P;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852760A6F5A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9852760A6F5A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rcRZgM1P
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so17319715e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296136; x=1794900936; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PHDIoEm9ZHwm2QbXfcuNgzAchc1Bm5nQ/5nALaIInYs=;
        b=rcRZgM1PKg2J1JQ5LF41jxrEtSDmU9PsA/mVX2U7WzkWWMzbzB14U5Beqh+b2xStlr
         5CHavIIrkckY9vZ1MQ76qxQvfb9c1rQgsnv6m7QCUcAVnGA2Qin4LJZM93AxAZf4VE6A
         NoZOCkd8+6ODzzKFgDYqBXPK6yuHeGKvl46YHjnxyGLAUd4nm9S06hzYpE5N6bi8BzZ5
         64yOh3MsgX8L538ywidwH/dyRQeWb5/phrRQdZydqNvj8RYFSDLEe7KwURziaZfyMiAh
         45eLie5PRjJ2aQDl27OUtS34ECvvfzhajXuhqhD6iYLkX+PLhmrk44/paCLtDSkEwsY/
         hSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296136; x=1794900936;
        h=references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHDIoEm9ZHwm2QbXfcuNgzAchc1Bm5nQ/5nALaIInYs=;
        b=rSkP0sz32xWs5kpp6WCChKuvkpqnsTUTVGyIUU/GwW8epOFX16dfUBzJYXoyqJhFC8
         Yc3An3/o+iyre01hstg5iydUUn4l5q47WtK4ghTHc93rOWCNPYFs/ev0jMvyyb+RrVK9
         S3SnOrphSUuQkGSzi2fexXrAeN86zKMs4x/vvNWOpVneruu9TGcRkoCsykGnu6gReg7V
         XWqgk/AW76dwBTLBBsWEG13hHNOENxtS/3Hri0D9UPGdbsmbjWSv+QLlFQviHi/vXhmE
         vypTRcMEV0rArovPkugZpBsGyvFWqaVVtThN/5t2K3BFgwcRoZ+D8LygizempEGVeEEm
         +wcA==
X-Forwarded-Encrypted: i=1; AL+hErEX3HvlYTO3dQySkfsbYLrtr3kVDxQv8W46TKkkmSjldgbMP3jioKEdP93qBTb04Bph97iHIih6ZNYBE/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NfZMsfWAPmPhANDc4y1K4Iobl+GA4WiJNh7ems4PQeSwo10wI
	Fa9DoHpJEhkbcT/WVYLuIDE5SQhzfezqy/wAt3GISabaQPUYfgGRzGyq
X-Gm-Gg: AYBFou0LBsC3ayJ5ALnYXhy0PWudWLvwHD3Yn/bsNoX/3ZTHGL0G5MxCLvK3RJ3I9c8
	JQyR+5sHdfSugv0chvazB9PAv7rqbBQZqoVJo3PTGF9tNwAISXJbWegoxYrqTyVbqu3PFVgAXhp
	1Yt/MRjrDR2oQu/sWF4152d6ghZGkfUIuw9/d/MBEpa19Rab2SOcGd2D6LHasi9LuosyYdT2v9v
	Yx8rY2PW3SCjY5CE9u/Z+i9Ti7osBaDZb7hizJNGKcBXbST8Vt/KZfoxZZgyF0zkNNxh4XBn4r4
	qeSxwL/lxn+xVukFkxihE3iP4p34acJSIx8ytXRQpq+XP0wI8G1vMZYqdXCno6NGLRabv9PUM1u
	p9D5l6NCwmTYg/0cnp+uVeDqI1mt92hhxbfcid9WwqpWazaYdg1oYwsj7JyagXdT2h8PDHYTwbW
	tyFqf9LMVVUIhHzDR6enmqio70sMTytgIb3jySmEqiIrvJbIDYE6z84JfnMWNhlKLx3zsrzeCHd
	34lU+fOL+QiFhSWp/Vp7cZWzeaLs/5uX79uhNs0CL3ZzHXroiXmo0xkb/SC4OvrDZLLVWdl+WSB
	IzmpJAaSNsg5GhADfUjggeabQFrXQ0as6AQkd1fxYXVOqQmTXYlTASgu35AsVrITa05oz/kId9X
	mFszFZXBmeCpKctHsQeL0mCcJxcE8gwKWfmQ=
X-Received: by 2002:a05:600c:6094:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4ba0234759bmr24627895e9.18.1794296135745;
        Mon, 09 Nov 2026 23:35:35 -0800 (PST)
Received: from localhost ([46.36.23.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb158sm3448199f8f.36.2026.11.09.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:35:35 -0800 (PST)
Date: Tue, 10 Nov 2026 12:35:33 +0500
From: Mark Korenberg <socketpair@gmail.com>
To: Qu Wenruo <wqu@suse.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] btrfs: raid56: pass REQ_META to per-device bios
Message-ID: <f05b71b2a735d2b9d018c072f30a0b78@gmail.com>
In-Reply-To: <e29db0cb-2054-4894-958b-800d03ad4d79@suse.com>
References: <20261106-btrfs-sb-read-req-meta-v2-0-71c1afaf5c67@gmail.com>
 <20261106-btrfs-sb-read-req-meta-v2-2-71c1afaf5c67@gmail.com>
 <e29db0cb-2054-4894-958b-800d03ad4d79@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

On 2026/11/7 06:56, Qu Wenruo wrote:
> NACK.
>
> One should not even use RAID56 for metadata chunks in the first place.
> Nor we're any different from other RAID56 implementation.

Fair enough, I'm dropping this patch.  Thanks for the reviews.

David, patch 1/2 stands on its own and has Qu's Reviewed-by.  Could
you take it from this series, or would you prefer a v3 with only that
patch?
