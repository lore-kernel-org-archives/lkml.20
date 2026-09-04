Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D737438DC68
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490726; cv=pass; b=orrh6kXWT6uJoVDOYq8wOpKPc1dgrdxL53jdz2lSCattRBhzzv5ZD1/A+H9Bsd76iIm9yEJZh9E01HMgOWMwDTtKxZRiAbfs2aws7wqL503uzOS3ckH7DgVacPc8aCDrY7gb71031FaxS9nSfN0Jt5w/UyJEXmoa2ohhgu3AKoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490726; c=relaxed/simple;
	bh=ohcAoa2FqlAFpZfcLm/C+18VPqWSAZUo72wqSUYvF/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHIWK06PPS66oYXtfdfSrnJdRLockTHPjfNcBgJbJgHix8w8GNFJ06lxawPSIPCkzce9oxMDUKQzgtq1b56p4Q4CJakqsmftR2KUB6K/WraAS1+prE5xx5UQL9tyWjltYTwf1V/MpPWO4svCnEc0tdob/p/8AgYKEdPJNHy2Exk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGbR5e1s; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGbR5e1s"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6aaf3f54dbeso458210eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788490724; cv=none;
        d=google.com; s=arc-20260327;
        b=bktJunfyvI6CW1LrekUh8xCrV0ArDJY6FzpfuD9SbEjcXGV+6KPAIhStriGzHQCAZY
         VPsHRNOX0QGGfDNPw8OQdC/csD7FMuGKNombV0X0v6SA3HDnkVfKnDMK9OydzVzI4wU4
         b7DZ3Lalat710N0rZWAIbY2LVVH2MnFB9pL41A1GQzn3uW1B/3POuuTRFZ9cSrqqkEuX
         KyFg7qnbbUTj5hyJwTG4wUV2oHShU5ICobqGI6NR6niWKvnzQ8Xg8QawbNvkDv3+3zqG
         SrLCT8MJIP0OMnJWzfCS9NshCBbydZNZ4YcgWJTCKV/EFmwP9TDRqeOIco5MG2Oc1Rhe
         g5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/Pg1OYVasvFa7HwTUQsQp/KKEQyF3FXJpBXL7jnOXg=;
        fh=IVB8foN/2KF8HElAm/q6y385xGnHQ0lfQWBVGKVN0zk=;
        b=iUnXNptAtaQVzH5qarn8bpETCb+tcB1zuuZp9fM7qddw4Nsd70PjGsPeijR2ePdcRA
         viUSG8K07wnuq5sUiQTe5m9SAz/4zOKrFbMrlKinBd4kNzXHir3VoFA8MCOdBLIaXzRI
         yoJ2TDYcS/F0MRgy62Hv6TQaH2W6P71LZcVDrlKgYZe2aAgtQVvsyiSqvK/2130mIrkz
         1MLI3x2wVR1nZXdt4byIvyhl4nLGa0Sk7ezURbSzizi/4dA0KVdiBtcEt7dHOAQzmRX1
         Wz15BaY3JURRhUbwhV5IPqv9x0YmSONE4GI3JceD0sKXykzO+wZwfpStvJubDI1A8rUY
         zxmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788490724; x=1789095524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/Pg1OYVasvFa7HwTUQsQp/KKEQyF3FXJpBXL7jnOXg=;
        b=gGbR5e1sYpUAkBwjJzIGRAmjvl7nyjq8fKrhAsYeoGI+GLxx/sXleY5QkArJToArhn
         WsGVpfIDg8R+kmj2jrPwNbq14WWULLP+TyOTlvUGNjQgIUH3JC9qwP4+RCWKjYnRebcJ
         bqonujEjs77o/lHSqzOvN8zZQBgINTZkJo53mk8tyLvEyjxNrVME34MaqtvjYVRNAf91
         soiBlEvt9YZVqBTaNavekSNsms8kGgUsasC233HO0v+76X5Wve44xNU6u0/ds/BdEEES
         /vi2bd/cYB7DQCkHJY+YlBhZ/i2qGXip+UHBaoGJf/Ho7e2zQMSVx/koKGt9aT5l0FTa
         MNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788490724; x=1789095524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/Pg1OYVasvFa7HwTUQsQp/KKEQyF3FXJpBXL7jnOXg=;
        b=HKXcvL0pkTIQh3QWzlqhHQRtK3PEvvkoyu+9fHANbIu6lvtIaUGdM22UVCZfdEKRXC
         OA+scqoBdtNQBmyFyqEjZFLyJ1hhSpw0deC8KkUnxOYI5g6wQhfOcWoCTKdscxAsBrva
         kdNuioobmjHG6yD2xSN0v1OT5GOpQy10sovcwlrS6nr4BvzNgyZZNeiggD+5GvRBNbSk
         L6hNtiI9vWxrPWeKSUsm31Xl2gaAIsVTyE8JRmyRCMhycIvoQ8tkt8XJ5hGmGYTJ6ZG7
         26ingRu88gq3xl1BC1QYhpoNE55lbf2B71Y71XF3fmt860uvOciRQQkKqokoAoyId23z
         OFUA==
X-Forwarded-Encrypted: i=1; AKwUvBzi7UEkFolSGIVyk1QrZPNNFdydqFtG+nicUe5FVwOx8gvcfQGB/xwMDLNsyWLB1rfRRkqHex7pSBfkRMU=@vger.kernel.org
X-Gm-Message-State: AFuF++l5AXqchMrXz0b3OzxkoMbtmn9cjF7Fl07FDLGLdn2gfJDMBIbT
	1l/dD6A6SgYA2AUKcPjdb7TyaqtPx/6w4XhJSS4QxsO/FJDBb1fzj+WmxjpG8Y4xBp2Q9lpNvFL
	fBcodJM9hUS3ies9KmlDPjeOxX9wTWufW2AubNNc=
X-Gm-Gg: AYBFou3uYLfk8u7QXkKmeAyEUPP9w+cZknZK/CWqLJkI73BUSxmeShw4kbFsppGdMcV
	BjHLgf3c5+7dByXwTzfxB3Xb8jgaqX184DPupctMruuAdSP0XG0cvlXCVubVdc4z1iE/UDahS6B
	G/1gXfkGYrTbEBM2LUVhDgB4HdFxtGoqQfG9Ow44sVR3Fvr0uj9f1K9W3fLs1bnwKe1F+X09596
	DCE08vbRIqhewOXzyAgLyYy1VF/MunHjQJN2exjjiNZPR7hFgkokGfdyQNoqomaFhhKaTT62DZ8
	7GNEyBtLVvaXhlqyUNwilTdIP8mg7mTR1k+TFGXd6D5nZHSB6gZpTok+afdcQwoN6PM8sOLGDxf
	fGQ==
X-Received: by 2002:a05:6820:4d09:b0:6b1:a667:f0f5 with SMTP id
 006d021491bc7-6b6fcedc374mr2662257eaf.20.1788490723613; Thu, 03 Sep 2026
 19:58:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903143514.532023-1-mmyangfl@gmail.com> <20260903143514.532023-4-mmyangfl@gmail.com>
 <ff900ceb-82eb-4356-97f2-4af75480a8c4@lunn.ch>
In-Reply-To: <ff900ceb-82eb-4356-97f2-4af75480a8c4@lunn.ch>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 4 Sep 2026 10:58:06 +0800
X-Gm-Features: AcwNN1Vpfq1P5xyA5NbGbzAdYSjcZdkfGeFIvs9EXqucGAsB1VfYDEYnrSQoIgA
Message-ID: <CAAXyoMNd1mR_EvCLhjvmKjCzDDXCqWdka-Gn1e8_atnnvGvw1w@mail.gmail.com>
Subject: Re: [PATCH net-next 3/4] net: dsa: motorcomm: Use u64_stats_t for MIB stats
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Sep 03, 2026 at 10:35:08PM +0800, David Yang wrote:
> > 64-bit variables might not be atomic on 32-bit architectures, and could
> > lead to load/store tearing. Use u64_stats_t to ensure consistency.
>
> Can this patch also be broken up. It should be possible to use
> u64_stats_read() without changing the locking? So one patch which only
> does u64_stats_read(). You should then be able to add the syncp
> code. And lastly the mutex changes. That then allows you to explain
> why the mutex changes are safe in the commit message.
>
>     Andrew

u64_stats_read are meant to be used with syncp. This sounds like an
incorrect partial patch, works only because of the internal
implementation of u64_stats_t.
