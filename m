Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928684DE738
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972180; cv=pass; b=XNRrBUpc4IsJ2sl1dDF17k2hYgaz9wppp2AGhA12nUzVZl9UlQaFlKHy6EPJxO09cFyaSA8GGvltuarciAoUNvdwScN2KkNDkz65k1WY3RMJOYxhVyJ+tPVswxB3j5Z23ozHEyUEXAjkTuthLLHXBRN7/xseEAq8lfzi7cGfQfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972180; c=relaxed/simple;
	bh=Paj/fEMKM3cmws1K99Dv7KitqqWmnLrgK9UzwEVlN2M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CxUisJouveSwOR9+kwwe45MOpX+i/M7dJcx5aAbXVKb2/3EE+Lo2JqrKZ+C/kRYZEP9RFkgYh0VI1kVqT4m5cmQgmjj1pkf2J6ywFRtEhNpzkqepZdjuGkZum+FcllDc7DrQWQBcuRi9wKAOhX2477QlevSXb1S9XAEziIP9d+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glqGfazB; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glqGfazB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1f4d8e09aso2218623a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791972177; cv=none;
        d=google.com; s=arc-20260327;
        b=elfGkajwMXOfSKLzGpTMBy8XgXjJNI/anULhFBFUTiE14Oa+rbG4noCra/7Jhe7cUI
         UXOXvq8B6RT7HKtW6qTMzo+kEQP6sGek4w/YZhE/Nq1MOt2HITvqtr3WAfhD96bUNAu3
         vDYO85fcbLzQE0LqW1kHIRqZbzWj+hOKGKQq6xn675bflYrbDWU+IIfg6mLnO8ObmDbu
         ExHSKRHLK4A7d6NN//3adnBpzo9s1FZYye3jFvrXma7tMeERB2VLQpjQo6EHHgyYNtQw
         ugA5e2171UKNWBAOm5182u1VqLfsCaQrNoSPmrnRTikVHhZyAKQUl/oCGUdeVWV8awdE
         Rz8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Paj/fEMKM3cmws1K99Dv7KitqqWmnLrgK9UzwEVlN2M=;
        fh=iznXNytomq4aM7UWb4QZXmxOHX0+wsNj91BPULZ4q3Q=;
        b=ZZFs/MlIJoTjjR7yH9b2p4Pjp6TRU+ihog5hXIiiHtht1Ei+A0B/rF7i9wnNDGJJyM
         hBJN5t49JvFCb4Tmp/8k5yRRPuQbL6O0kn6x1IeyKOniJCqahogm4fnmNvuzJ1ADlWcO
         HASP82y81qlZDSm/k1Urps/7geLJL1wVPuwAiqCa6fuhsPv/0b1pr7/mLpjzc2UOMpph
         ++bsNfMezEgsmG65CluO7lOcWi4il7LHPgBrLnGPT9SFin1Rj/5GpytYtkXzJDilv6WP
         qDL/6OWZk0517QMpDPZ5ORKxy/18gxgRQVwHx5uqCMc09Uzm9It6lau4G49K5H6VMk04
         RytQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791972177; x=1792576977; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Paj/fEMKM3cmws1K99Dv7KitqqWmnLrgK9UzwEVlN2M=;
        b=glqGfazBc5xusIciCDxW4ih2y26V5DdqUeAIJlcc0MYvTkmbmGybWp0wHpNCyvH49o
         QZ5WLl7kOxSVUnOEtyY+WcpoimBLF4j7xvb2Xk69wAYU8Szodwyrpe8yA8outnrM8+3r
         rqxYbJbv2ybVNLrxFBnKUi3htUhbrtYsyePjTK7GAt04T/dJ91XTjv0XfOEEUfcDE/6Z
         CAc3BoYX/7caZU3B4t/w5mN8/l9lEBI6YdUyw7wh9zcFCZDQS80l7WCovU5UXu6DCg1b
         VFYkKePClvH4eQjieFdswXwLmOuTdXTbWXcQ7QLFYymZVD9Br730e0d0mEEK9m32N3Dc
         /uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972177; x=1792576977;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Paj/fEMKM3cmws1K99Dv7KitqqWmnLrgK9UzwEVlN2M=;
        b=ipTQjpk7YQTouYTqrvBhE4k+VAqyPLYaWtxTF8N+AWDL9mb4kf2C54ogp+YgRMQIp7
         Hu8QGRTHdXhx5D/Nn9pJaN47mMPDHM1BJQh9cSf8Q673UwbYgVAWN12lwmvM5aO0nhtV
         bttqfPH0A5H8glytAgcKHKjW5JPGHXEetJ/WV8mHXIhD84nMn7XDUmWA30DJCbkEw8MK
         SjcjhcPdG+DQZkpDTDgdRoBmlp+HmXkDbLRoA5oN2jUWWeIhm+ECNI4JTBF5aryaI/La
         2ddw4hLZBTR7THwaz96f6CvOBcfy57KOG8XYsuZFGIssqtGYo62Z7AzzJSenqg3z612m
         LI9w==
X-Forwarded-Encrypted: i=1; AKwUvBxDDD57Cqing2nwQxzuyloozcGGRjL0CVKMMMwjhdc6+tB2N5ezskFJokckFV2vVMYnP/g8L5SQsZx5d+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyWu3OAjTLgswAZ08LTmfyZG/N+vjZX6JNWUtrkRYw+1UMVa/s
	w+zB2uJlRpa+NdzRrb42/nWK5jji7eb3wjNmZN0kwbcZTwmCcPp5YimDzUWvAHbEIOqp0oWKGwU
	8BL593E8llry11UkdlqaMFvTUt+zF2Gw=
X-Gm-Gg: AYBFou1FcuYMrVCdyedj6Ioz8VDPv/dGeB76RKHdyU8NOPl/SbIVOyUt3vqllSsLMKZ
	7J0BtXrinvEsbECsJSEq53HopBwQxflIRbouP4NC4NTKmz0JRfOz4Kq8p2H4W63hCyUMcIr4rIW
	/A8SZ7DW6O8uMDSG6KRcXmC+8d8ZCIMgl4XWgMz9H+ptrfTmsSZXbAlaUckwmWSsOa9sellppDe
	GhGKVpLYwERyOW/MIVDH54ar1qDVSgki78p/TqS5kZQhTe9STF8pZvNym/ZLo1imDIU1PcYWDt0
	cX/GpHbnxA1CU6p0O3uFFhN9v0dZnEnTotNPNnht4gWyYKeyNvdyYi86
X-Received: by 2002:a05:6402:51d4:b0:6aa:f260:b851 with SMTP id
 4fb4d7f45d1cf-6b17c2ac332mr13030975a12.33.1791972176597; Wed, 14 Oct 2026
 03:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ayush Yaduvanshi <ayush37735@gmail.com>
Date: Wed, 14 Oct 2026 15:32:18 +0530
X-Gm-Features: AclHuK_5KUbXFqyhRWHejkVpygkLU5hHyftSH2zUVPZDbQX6AQkitHFeWqRkUg4
Message-ID: <CAPgWTUQ5tYtV_YR7SDV7SRsDmvmxsgV5xOdns7Aq93Uy1kg9iA@mail.gmail.com>
Subject: Re: [PATCH v2] USB: sisusbvga: avoid prolonged initialization on failure
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, michal.pecio@gmail.com
Cc: Thomas Winischhofer <thomas@winischhofer.net>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Friendly ping on this v2 patch. It fixes a task hang reported by
syzbot in sisusbvga.

The patch was tested and verified by syzbot using the reported
reproducer, confirming that the hang is resolved. Could you please
review and consider it for usb-next when you have a moment?

Patch link: https://lore.kernel.org/linux-usb/20260907074308.109603-1-ayush37735@gmail.com/
Syzbot bug: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b

Thanks,
Ayush Yaduvanshi
