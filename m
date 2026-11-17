Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919337;
	b=ycm0IHU1zJnghjQL54F7dlTNvhH/2HfvhOlFaqyTL+E0jVnFgX/CfwspzZJV/LdpmGJ2
	 MsvbTyT6lGeFClzLT0IK+8lfL/tnNTHrv4r1+dXcxfhNiEu+ySVyHVdTY5fi4PODCF3Lh
	 8ZdemSdDpNbfrSbgqlqY7HEO0fvMPguirFm+OO+tzswcOuvRoikhouL8CF47jo8YxMbe1
	 JB2NZw33CSGPK86jjbm4hfjO8Y2IQIWqb5kVncK3Z/yhFcKMNqZtiCidQ5ENid7QhUKtG
	 1TnCKxKwfJe6LwgkX2382q79uYibU9qHbHvrUPyXrrB/4DoOAz18kBqm204LFq8gE3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
	b=Z9bChmy6wukyS5dI7hIUVtGOjEN3Xqic92c0n+Q7c7D9M43wCUVs0v7QqJJfu4Bu0t5x
	 +VDGTrTAZqBiXqjofQYnHVTJwmLBaF2+pOYMVW2iuG78VcwgR6BwB9JTwY4nxlE3bCt7V
	 6s73X0mBEI6tiNp5RFx7VeT33aQdgTzm20OUnTg7++X1QYrlP/+pDaWpiDqhrq0DS3aVZ
	 NTG7M9LYQMO53MCr33DcU4BdSRoyzRs7xjKctCq0VIgwL4FRI+DnbAngy2q07OqygM2F6
	 tt94LxPT515j6SIxNcTO3ERxMLZUgjiWUEJrNrQENibI08hNahatqgJkLPPMhYKKVOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GjfsafhR;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434E9606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434E9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GjfsafhR
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdde3597d8bso353307a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794919337; x=1795524137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
        b=GjfsafhReVYoQG+yWCB8umQ8x42WVGvtYvNtS3rFyyguS5QHq6woiRSS11fH+xaGtV
         aqt66cXXDkZiD/2UTdu8rg7nlItoU4vlQT1tjT34gTYnU/AvooHZCaCjbFtcgxBn4cCu
         Zxm9eD69qk+zA60q8Rp3tDCjPPcjjhdJEKe+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919337; x=1795524137;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
        b=U5IYRI6Fcq9LJQ8m7mux/Oimzbis+xIqUelTQkP7WPuVez8S33LX2FnLwCJHMXph8p
         +TxPglTUnsi4B7HLAt+X7PN8lzubHLPEo5D5RQb6Nzxa0Q2Yba/gRJEA75x1/5cYHOOP
         ZqKDqfTz0tHtNk0LrZZPVKEwJuq9fzWK729sgqETrn0bN7Cx+x4uJiAXJrD1Z3Kjz+q+
         8t1UI38s7Qbe/m6bFUqeT849s1HGzPPkDZCumG4Q2+pi6CBYdf3C8LOnj+42+7eajy6P
         vhjoc45+Ss/Ms1mmXsZbGYPv0flMdrHuelA2kZXF5+8cpgojMkkdlI79+1XMbKGgy7xM
         y75A==
X-Forwarded-Encrypted: i=1; AL+hErFEu/T0eatyp0yd32IxCbEpbAjzb8wSMyf+yz0YqYFrRak9S5ZtAwZDu5/RIxZgdbCgKIqP98iWSzFZXH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sPDAAmJ5EfZaUZK3201Y05E2xtX2kNSMZsVHKWbu+8VzBSpgH
	lXg1U5a9llXpJtjuv8EIvGGfJFK8Uhp4V43TpAgng9xALrYUGxYJn3hmOrVl1uo7IC4aUhQGZYE
	bFpI=
X-Gm-Gg: AZFdTZcYp3PvwpzeMFkq1NqRiJ4z0Vs/sfB9GBwwL9gzqs86mGMqXavvBYtGpUmi0k5
	qzQZTdItNxKY1RQIyjcVKPpdeWAk8qD2s9a4ewzIeYZp4SXmNiSBO0ErwjSuytkSB1RyrSJLXDq
	vSacDBI2uVX6hy+vi6Q0a+4BWNqKLiH16fPTciPRRtptA/JNxC7VXb+k3Ybn976h7D4sJD3KNaJ
	Tg8MveKYQYC01ynSRFHlb0Q0u4XDDoLUZvW0QQbV8PzV7b8NCIIhroLd+PoCOm2Zh23wgzenBbf
	sq7/V5TwA9sTsY60/YDIz1zB8hbnWIWQ8fjqcmI3hetOgflIUXBSyqfS7ni0KeOIlNS+nBS9ZHj
	rnEBFXNG0w0CpTZMhLzlANlFNRe9Fm74tFn8iofIuJBALHUi3T9t8IHZzIwAodRV865RsvB2MV4
	2+4gau5jBJUMOi31y/skhYR+V7m2AOAt0rs9xRwB7qX4i7nWoVHBKW0LX7EgovlKG9tqCN0oYmP
	5aIPM6Ob1jQM0JrinE/givbid97vnX+dHWvVFR0CoXX9TloCS4A1Gygn8BkA3vmUFQBBWxASomG
	jC8hTCM5Vy+XJtp/7zBbiTr8KYUmZm9IjelXGtxFELTa6Wrv6WYzBx2kzLXuz0JBuA3smg==
X-Received: by 2002:a17:90b:28c4:b0:3b3:c00e:bbba with SMTP id 98e67ed59e1d1-3b3c00ebcbamr629804a91.25.1794919336615;
        Tue, 17 Nov 2026 04:42:16 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efe0b7d512sm9695195ad.57.2026.11.17.04.42.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:42:16 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380c28f9e35so932040eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:42:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEa8Q3EZYkJza/l1tpGoHuN0wEBnbLVQdfi02oB0qrg10sEN8NL4aPwklucf4dwBQJkifDv8lEWqGV44l0=@vger.kernel.org
X-Received: by 2002:a05:701b:4208:10b0:1b3:b3d5:566f with SMTP id
 a92af1059eb24-1b53a3d6f36mr2169749c88.11.1794919334620; Tue, 17 Nov 2026
 04:42:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avxKOmxCBLF+7qdT@jpc00229873>
In-Reply-To: <avxKOmxCBLF+7qdT@jpc00229873>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Nov 2026 13:42:00 +0100
X-Gmail-Original-Message-ID: <CANiDSCuX1+ehTGN=HNuLL9YBTt8tUw6fJ2D1JqfePQGaz+QOzA@mail.gmail.com>
X-Gm-Features: AclHuK-EAX41DbKYbj2e_sh3aVA0w84vlTt-MWboq9nmaiJAZIgb1T5nlgGrxS0
Message-ID: <CANiDSCuX1+ehTGN=HNuLL9YBTt8tUw6fJ2D1JqfePQGaz+QOzA@mail.gmail.com>
Subject: Re: [REGRESSION] 5.15.y, 5.10.y: media: uvcvideo: please backport 5b9c75c794ce
To: Naoki Matsumoto <naoki.matt.matsumoto@sony.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, chenchangcheng <chenchangcheng@kylinos.cn>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Naoki

On Tue, 17 Nov 2026 at 13:36, Naoki Matsumoto
<naoki.matt.matsumoto@sony.com> wrote:
>
> Hi
>
> I use a UVC device of USB3 at v5.15.y. I found the frame rate down with
> the below message after updating stable version.
>
>     uvcvideo 2-3:1.3: UVC non compliance: the max payload
>     transmission size (1729) exceeds the size of the ep max packet (1024).
>     Using the max size.
>
> This message is from by eb6059474e70 ("media: uvcvideo: Fix bandwidth issue for Alcor camera").
>
>     5.15.190: eb6059474e70
>     5.10.241: 3eaf16ff8165
>
> kernel-5.15 supports usb3 of course. This problem is stream->maxpsize is
> not support usb3. Since this function parses it directly, USB 3 support seems
> to have been overlooked. I found the patch at v5.19
>
> Please apply 5b9c75c794ce ("media: uvcvideo: Undup use
> uvc_endpoint_max_bpi() code") to 5.15.y and 5.10.y.
>
> I confirmed that it cherry-picks cleanly and fixes the problem on 5.15.

Thanks a lot for your email. I believe I already asked stable to
cherry-pick this
https://lore.kernel.org/stable/20260323-uvc-backport-bpi-v1-1-5b62c6798ccf@chromium.org/


Sasha, Greg, could you check what happened?

Thanks!
>
> #regzbot introduced: eb6059474e70
>
> Thank you,
> Naoki Matsumoto
>


-- 
Ricardo Ribalda
