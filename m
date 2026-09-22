Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B683037DAA3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042271; cv=pass; b=SLI+wnrB3plN9+N53Bav1AgweuhsUfpPp0tVQfKb2cn/I8pLJTGo4LBJfYtM+QoBEOF5m2ZgIaSSdyOr7LTwS1sjhu1p6KW24k3aAXRpIiV1/USHzqeY0HrIIUJYneOyWxdpXArrRdiy/JcCr1c1Qtqt+shmOMRYdL/VR5NwLNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042271; c=relaxed/simple;
	bh=uXGvn3KBFm5aQw0K51fWIaJ8eD3Gwqir/PJYnJkOATQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1CD/tMjSbsLtrzViJ+MFYQOyW8GKNTQ9jUDr1wIPx6m+0to66m1y/FRqUvoGTlfdTJcBpiQjE9EVnQsZAaThZYK9A/YIz+bpk2rvUnwVMGsE1EfZp5WRimxjTDr7+lBv+1mpAJeDyKNzymuDbMMiWOerMyKh39Nhgtof8HisT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGI0BITP; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGI0BITP"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso6413838a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:57:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790042268; cv=none;
        d=google.com; s=arc-20260327;
        b=hNqkoa7yX1XmS+J+CVR5UMNx3KGr659vt13KnomWAj4C0Rhn4uLquFIYiGXmI3jrje
         R8JBOte186RoNRhPEAETLEsnXItK808RkHSwvc9JMFAQ2QvJWSU/yFJu3sb8c/c7H35Y
         eSRBhql29m84+Fw5WFXuji1hbTKtUBqrY9aQMoLSjHQUTbWVue7DZmUYlfn4h4gzwNnl
         uZpO7XLZh612+8VJ+Z35ns8CmZAbVd2DDDX4sgZaDlPOvEJ6JJPfMgB74zl4dRCTftFF
         cpdfrPaJRQsLLBvqnek/1olgZ4o59erfY/51vr49QwcCQZYiXYnh/1jqcU0CboN1G7B9
         bNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uXGvn3KBFm5aQw0K51fWIaJ8eD3Gwqir/PJYnJkOATQ=;
        fh=8QzwqUBxSGgtBwfsyG13VBuKUeg6fgC6EEqqQ/fw+68=;
        b=GT8yz9JmyXTBMOYcwcJbLwQV7xoDnz0UtHjdPk4HWGggOkuRqjg3mGlbQ06SRgbpJZ
         yf9tq8dctR6gUHKk3imM4dqNyD3qIoosU4Dvq9MjdCvFNJDpEmJaRbpJw7fWq+J4hkH5
         DaFBz8Iq5iyJS5ElrzqvL1TbkP4K2TXwVwWl3han+Hmmd7pV4pO5j6/o4N4ovQetpwjx
         5IQcT4GixxzT6va6y7nHjqmtALNPPDHOHCtfCzwnpCb1k9pCrKFwyeketUq5uAoz8f12
         9cneVaDuDyINFRnsEjZ7nrzKXAnCpkDd/SyUbcoK6jPYudZT3fy5GioViHOfUEK4/fdq
         /syA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042268; x=1790647068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uXGvn3KBFm5aQw0K51fWIaJ8eD3Gwqir/PJYnJkOATQ=;
        b=NGI0BITP8L/a/qC0xbm7HZrUB1FhX5qvt3/58DbVkDoNSmQslwggSrJ4B6WAIuRrHq
         +fb/Oj+HxVeJ57uqvBgbbtCcTcE9YqLjHg8GWfhsAxh6rc1lxPvF+gJQZtPSNPPT1rU+
         eXlYrkqEScXOMJmDneUFwHwXyI1J8OY/8TFwyBCGeRaPiB22GPtqnCxLr6jbwiiBANCo
         atOrATWzy6hJfHRvLfzoxwCa1AX/WXodQiKsJVfXljILq3zvMqVPqmHHfS8fX5hyLmBv
         vfFGv7QiRc3FpXVjQJ63L0EEKHh0dzPYPhTsvpgbIg+dkKkZTogq5Z+ybRovjQWj/6gg
         XWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042268; x=1790647068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXGvn3KBFm5aQw0K51fWIaJ8eD3Gwqir/PJYnJkOATQ=;
        b=e7bx/FmnrWE4An28SHxN1wHA2aIULAASiF92XPXFzJXjgoRmkWdubpe+QK0Yft0q8G
         TfEna6DLfG2U1J8IMNRZeQAobMfNvzIs40yVzvxQYNt2PG8Zwzm9wDD/q2mHdnPuWL+r
         wQUc5IVWAia7ZTwuagXYOaZLrJMlRVfG63QHqiFIhKmgWzSa7IqsoIK0AUAsmiHpPVLw
         n5xxZxT8xHMybln403JzyE8MQNGfctZZT+DhhSaAudzrCsVSZih+F7RdetrTkkSEGdal
         dMdOsabvWHkMgBIzrNbpY1FXOh1hO0AQdFcSUqtTpGPPLRxVNFsR9Ra8VZtHXWfM9Keo
         1ACQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjgOoyeaJEuPnYI0L5zhnST0Bm17hsATDcgsE+r0fwlf5T1+SdDAkA3add1dMTstAJKEOLssb2gz5l8jo=@vger.kernel.org
X-Gm-Message-State: AFuF++npp+WLzLi+k0rJEAJ2e4k9PslnaHl6hshmBwaP/U2kuMB9dR4A
	FhB4AoOLQasCBL1fL4D9UCrkSMeSc+Ot0LpINIro/BstMR6lE9IeG7UBpspiAPkZS4ims45/4V2
	43+0Zt35hO1AUmQNmFESGpSVJiiFEiOI=
X-Gm-Gg: AYBFou1Flxyrz7rHwI7BHT3p1grIHC/o/85XqkI0COPkpX22j8znkTd8Rqb4SH9+sqh
	lPji2RUfEEGNBGaKIOsEBPi5mRA8E+w5WERT/MFm29gbsTd7fwtyE34pBgYEjnURTj/0fiM3CwU
	lI17Zp3dtajwJf+uzYp/mYdiovl6Pmybd19d7zkwJmQ3N3tGhzUAR5+N/lp40feAURdMyobdlpr
	elOeCjamzbeyRzaXpb6K2wazz2FWCa2YacYLajScgJUggB+zM25NnbH7tQzm0q3XIG67y5t4Y/7
	eUJrJ2nh1TV756GFZgEem6UtXxpFcVb7UjwagJ1/CmSfUEvqtT/WvTjVHtg15gJXkQQPA9jz/vf
	V/2w6MoxscTFz
X-Received: by 2002:a05:6402:1942:b0:6aa:a133:cfd1 with SMTP id
 4fb4d7f45d1cf-6aaa133d1e9mr802399a12.20.1790042267824; Mon, 21 Sep 2026
 18:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917153923.904124-3-bestswngs@gmail.com> <20260921154147.4e1e092d@kernel.org>
 <20260921155826.5970f028@kicinski-fedora-PF5CM1Y0>
In-Reply-To: <20260921155826.5970f028@kicinski-fedora-PF5CM1Y0>
From: Weiming Shi <bestswngs@gmail.com>
Date: Tue, 22 Sep 2026 09:57:10 +0800
X-Gm-Features: AcwNN1XB1q8PoR7CFScqBTcECMNzsAWeNJ-yjmOWlW5xdCHggLWmz-bfJMhZfLc
Message-ID: <CANgPUi2JeO9psd1gL8Ym0k4DMmkzww0fjocvGN_yDi_9wttKPA@mail.gmail.com>
Subject: Re: [PATCH net] veth: manage XDP program pointers during channel resize
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, co+65e5c76b187f08b2@bugs.sh, Xiang Mei <xmei5@asu.edu>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8822=E6=97=
=A5=E5=91=A8=E4=BA=8C 06:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 21 Sep 2026 15:41:47 -0700 Jakub Kicinski wrote:
> > This is pure slop, cramming loops into functions which have none.
> > Shameful, really.
> >
> > Please test this and submit it if it passes the tests:
>
> You know what, I'll just post it myself.

Hi Jakub,

Sorry about the poor implementation.
Thank you for pointing out the issue and taking over the fix.
Best,
Weiming Shi
