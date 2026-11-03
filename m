Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723558;
	b=T4ldTFOmjxGIW9WcaYKzMQUqyydScnSfE8YFPk4Pwumg8F3OcBcjW/MzDMoWvLW8eKot
	 4rGK7180Got54uG0WRbF+2lvFqeiCkp8cxHvWrVO2FA+daSdAeV75NEOesWBOki+uovkf
	 /S5Dp1u0QvbRSX+Miy1Vwi6PXEfRT/2yXVDKQ0loE+s6x60xtGbyJUwtLbyYiHXNxaioy
	 xXEGS6rwYGwSmEu6ZZB6GeqWLzl1tq5L8qW34z6QZaPOzRhmndkqhtAjQ2hk5dorssZ2E
	 3bKougDOB6JsLY0XVDvrvkdVdm4m9vkf9Z3+zs6aom71cDj4zhiMUMmaaj18+cLXSuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NR97qxa1tJCk8/3NXh8u8lLXKz57p0plaZ3QiqfzgAM=;
	b=TcR4cuMDYHOrrmpV8pJUPUEbpaWV4ZznfjrIyQ8da+kUa12VvX0MYHFdGK3HWnodggnq
	 W1HfieYF9s7J4+RZJXrBu3+MSTFfR1TD33pzJXEPklK6MqhpnqEL5DoTDmX2Cwkw6y1i+
	 QOV3jG9Xqux6sekxjgXzZBDE+KDcHm5EDPRyvBs4BT5uHJ15KCwlB7y79bzBbP8YyJM4f
	 aAfZ5wnzOI5jZweda1FWUs7LsRTgYlUB9ojrDXwS8deJx1TYA20Zi1EYnGe1fwoNS36fC
	 ArG0P3OfDmsMQA8fQqBEv4mIGSkpuuLs53h0eotu8GjreDUDOluabk45q0gMWOhGAgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FsIy3Gwg;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5A606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C5A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FsIy3Gwg
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so5912281a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793723555; x=1794328355; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NR97qxa1tJCk8/3NXh8u8lLXKz57p0plaZ3QiqfzgAM=;
        b=FsIy3Gwg8J/EIs+l/FDaJly10p3F1Qb1/cAtyV0nMyoGD5bOo//z5XioxoTAba4FsE
         NVlL3emQ1yKRtusg2SUbl2S5i/Mj7M8AQRo4OiJfdsyaTatiY47G9JvydZvwUaWJ8YFG
         sJQ/916J7EiD5rC91Dy339SnAkgBvTc4PGI6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723555; x=1794328355;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NR97qxa1tJCk8/3NXh8u8lLXKz57p0plaZ3QiqfzgAM=;
        b=AxtF4xqt4zTG02BvdwbGNVE1FqYdA4jtAGcDF0tyVKMcAq0gseiEe+SMs69EDWy1ZO
         aqK+1eONeiGoSbL09auHaDVfe2D1PNiV+evR8Y/CLAYzacUcQahGh4s2pLPhCbpEDR8R
         +cipwORCUgiIk846aV2ZrqeKgd/eOtTAv6P9o9kg5YXeSv0Z0t1IWjlEyRxXms0SVHPt
         q2yNPRRvqOp8wTsBFtBYChPrz9WOR0l8WjSB/nbyo9S14XegvJtSsLguC1sY6/CgZjT5
         jQyH8D8UNK+XvyvgI7Xgdog6+xgFHQ2PwUEUlSXutyt9W5cWqSsKWmmNC/nDO1wmxC9Y
         OV1A==
X-Forwarded-Encrypted: i=1; AKwUvBxQ30RxTRF3GZfitVcfNqQQmbKdAG4mlMHEdMKWdCfC6Abw8s7164WnD/0nGOKv3MgwXidvnPhSSpySMys=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+sK4XDyN23fEYrXHJouaXKdIvLR3knkVDAc8VrGmEws+R31R2
	LcoVsRbPphDc8HmFrylmyjIlLHJipptt3Ypa5ZaQIqVHmBjDzKkxqgSyQQsbZKa3U971o4sVkB1
	WjDP5IBH8kw==
X-Gm-Gg: AYBFou0VhOGq67+bfJaIYBNR9cnIkrpdZmV6lMrXuU4nZOsrDlKw3WGOZSNZVIYCh1Q
	ItyDJOP+FNIeb60D5pYcsvTgAF7JaM9AOe4pV02xz5mEo+61MIeV+YarQizxLGjXsH33VHu/HMD
	fd2A5W8Kob0DZSnEifT1jYVwmULo74GOhEK/GD9an4NV7VNpTPzDsheDgOtJNb8tFVo9nbLqPw2
	qmGlOD1BexIfYsbPOAugYo2Lz/Aacnq4E7uCMNs6tNRvLbbPNwMip1XVd26AqItxWYkZZqzM4jn
	IimaLHkQ6g/IYPiIKSHp9eNbpNNoJNkhqIxKYfVZM85HCLmEm3vdzjPWymQHrs2PxaoAwofotUN
	utwk1ReunB8g7ky7a7brbTX9Piy6rVsbJyoFo3i3z7LXdJwyVxghU8ajGVu3sybmIM7magHmQt7
	J+SsXr8B8Xz6GPJ3EEu+C0jKmhK753tOYgsn3L+7wAb/XNuRYU6BUb9kTpa0LmiF6mv0/dzn2tw
	nH9ZdR/ZUtB1BXKCUct/NX9mQ0zQTffEfZ4wvH2AJXIEkJMZMDJNL87T37nqCkU9AbuCoRfClJT
	xkYgxsVGEVVvKRtKKgNz1XXZGPgnzTgaYcdL1lcyLwtxmSiRR1EHRTnU2iS3rOAIIaFnyGYqh97
	hPw==
X-Received: by 2002:a05:6402:1f89:b0:6b5:47ea:ca2e with SMTP id 4fb4d7f45d1cf-6b547eacb93mr1592683a12.11.1793723555426;
        Tue, 03 Nov 2026 08:32:35 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a767esm4415019a12.5.2026.11.03.08.32.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:32:34 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso4871695a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:32:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwWu37VQQg+GajSyB8Y/m+/nWJm36TC0DI5pQOS9xVqrwgctW7mlNUa7460clZwcuzWQZjqvi80kNMPw8I=@vger.kernel.org
X-Received: by 2002:a17:907:6e93:b0:c41:1e13:4ba9 with SMTP id
 a640c23a62f3a-c4ca795e46amr1177918466b.6.1793723553776; Tue, 03 Nov 2026
 08:32:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031095716.3030288-1-amir73il@gmail.com> <CAHk-=wiPhTLn1p0ZHx-7SMdk4_zazqDK1k7MMEn9scRfqeDgtw@mail.gmail.com>
 <CAOQ4uxjNrdxZdZZipsqnUNq+TswCKqp+30iKRKCqh2WOQ-zKGA@mail.gmail.com> <CAHk-=wiimdwWu0EVQdxGVjbVWdzNKGg0f6vZ1aR-GXxDvQa-Eg@mail.gmail.com>
In-Reply-To: <CAHk-=wiimdwWu0EVQdxGVjbVWdzNKGg0f6vZ1aR-GXxDvQa-Eg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 Nov 2026 08:32:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjz+Tg3iq_6uBqxm+egP_aRhodcz2Qu3pQaR8SQcvPt0A@mail.gmail.com>
X-Gm-Features: AclHuK9w4S2wxf4udVRHX01W-WMPzHWb6oB-n8uxW69QasJSfANeHRc58bQ4vhU
Message-ID: <CAHk-=wjz+Tg3iq_6uBqxm+egP_aRhodcz2Qu3pQaR8SQcvPt0A@mail.gmail.com>
Subject: Re: Return failure from take_dentry_name_snapshot() (Was: [GIT PULL]
 overlayfs fixes for 7.3)
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, overlayfs <linux-unionfs@vger.kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Nov 2026 at 09:16, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'd like to see an ack from Al / Christian, but
> I think I'll also rewrite that function to use guards.

I didn't get any acks, but I obviously did do the guard rewrite (and
then some: I got a bit OCD about it).

I've committed the end result.

          Linus
