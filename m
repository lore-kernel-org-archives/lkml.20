Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793596451;
	b=euLYqHWjANN8Lz5zl4T9Lnbb/vlI5Ez6rzaRFZLxw+qYraPO6FITdvo8uyHaPIrshxiz
	 7kg5SkKAqNsErKtFcwQTrQacIUI55jJu6THBuYRulVcsbSaTo3T+5x/8kdab9UFOHE3Tw
	 ++LrgYBdmonh9JLUmcW22dRa7ARXz8J4/wCiAwKqO3iW2I4gJjfnDytg8xG+TukFqj8Wp
	 sFQXv2k+z+GyooA4srad6ezTMFL4AHpizKSgq3EFiaptl2aAqKXkZ/7/0GAuN/b5lf79e
	 pa3vf9DI/GrtRcn6xIn9UlZAmR5pVOjjxo1H+sB9EDVF03J0Cs21lt1f22PvTQBcUzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793596451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v8urwWaa4j6MLfo3l3z4XF2xgg1WktAvkm23PO6lNZY=;
	b=LsGY3l35ZFCXqgG8vWgJR0XgDsLmnqv3LHr7MPFWt2lmDGuQjW+hzbmvPjuZ1rdYA+Wn
	 BQhanXQEM9MuJ1zuIHwEA6aGAWM92QcP6h6lGFFMwGDHXierCFBgZROQFgSMweas6nd/c
	 5xT7jN0oX5rCoyIPZRaX9FoEN3MWYppaMxPjfWHPkEPXmPzPRsgEaiEMO8/j8oEsVksfR
	 JzerPxVSUgXa+gc33K3uUHv0WT/NBHBJE500Xiif9pw7dvnM/r5JXpgLIuaq477JM44tG
	 yUKOArRAZPvbLoZ9CCVqI4HAh4zf4KzYksAfy9JhjTlzUItQrDSGp3v0eNDDmyaM3kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzxiRlEY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA669606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA669606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzxiRlEY
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-679a2b540f3so2106628d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 21:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793596449; cv=none;
        d=google.com; s=arc-20260327;
        b=V//HzOYplz3LdIioNZAR1bGvw+6U0Bofk6g15PVvZV+YmyR0jsVLUNZCLkqF+ImttJ
         TrUaBu8c4OdPvhHg4cH4/Ok9EYv+9eFujjDwMTx3/F+EiMx1BcHTdS/14m9VKeAFNgkL
         2mpccuHL3tEGbMSgx0zSoKa3u9HrUwdfAMh5T6pPrhOLyFiokcj6BJuiD6cPjvd6SxXt
         sNxz5hywcQ2JD9B8ImsgxjzYDhvRW41aGBbVLyUdXcAvEDVt0TwEgNNzGlWNrjRNW0az
         mGIDsUWnI666WnNLCM1lUOBjjwVY26TFVti3EiNhr8M14UzfhSyYJAYLD7/DQNGaEurK
         qcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v8urwWaa4j6MLfo3l3z4XF2xgg1WktAvkm23PO6lNZY=;
        fh=o+m+AfpenPw72bl4vA9/xpFZWk/GpJOtjHZR0KkJ2jU=;
        b=MN2ANQW+pAm4Q1Yaxzs0SZ8W+2UmV8X6lvKvDgk3cAkL9c3+X9A2z1UQ4BavLc54zX
         KoAuxzHbaMRi/nO1NzolaSRRIaRj4eRwJLcnCjsJsu0I0bvCcOApnjkvFjOxxTKahLm/
         KIVgfnPYx+IfeMBBXrzqAoQJMTxCKb0X+xKIAw/DrOugUoR+R44QNcZAZu3EFHVFEJVN
         0naG+g8lAWgy7KdFDVw6j6F2qh7UTO/Uy/j9nw/a4in4tS4nuJGiE+Psxc1Orsv1uE3u
         cnnRqeoRdcSF3KcoVDT1vx/xtNCdjREWESUbc0WxajtnLowgksFKoo1YI1/AAlZg4m5p
         4kug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793596449; x=1794201249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8urwWaa4j6MLfo3l3z4XF2xgg1WktAvkm23PO6lNZY=;
        b=pzxiRlEYo/Ud2clGm92Z2Nc+nPMSTo5A2jvtHpEqc3cpTfPP/45gQBmYZvBjfwZrES
         7xSCQRe+Fet+9w3qh6Ex8XRsZSJgLfxOKRppVXDobRX4J+o1qhJydRf67EkYzExP2Uok
         ENjdP4oWITjCEGdcahatfIou+Zfw2DByx0xQmPLKJGvekvC9I0xg9/T6MV4kZARwL37h
         ZTvR9O+fi1A//KgIKF59HOWBU+YIcXBRJHp6qacYZ50zcUR6diwPqH88gJVPSmko46VM
         KXClWOTa74D4cnflESOCBfsRI2IXwDgPJruGK49ryiSvcf3rkcdhy/nXJwl6zx5h/jSJ
         C3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793596449; x=1794201249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8urwWaa4j6MLfo3l3z4XF2xgg1WktAvkm23PO6lNZY=;
        b=Pu5VTPOOCoIe/yDxp6dXg/thecJTB0tZ1cHN9wPG3pjTvKnJpvMKdXUChh/dC/G9Ct
         aTEi4Urj5SI9Vpn/tELbxatIlCE7VxuLHSgAG8Agxh0uI2yQSse81peGYRmo6L02CYHS
         Bq8JlVwXgC/TDQq9b9wb+SitdfJaDFbzySkFmSE+CsWM/YA/fw5OtrAGfMDogADaiEwX
         WyPZ13G9RUbXvf0AL8QiQkLXvjdC1wkEO8TyyMxeosnbECTJmNuWPgSofgz+vvYf8Odd
         A8sEYQV8Lu2uVLZ7s4Hhf5PMW3zNPH0Q1K1q1G7MVGCYXmYBUa31fs9Q/6uZIXCQ/xym
         BbUg==
X-Forwarded-Encrypted: i=1; AKwUvBx6eId20SboYDYpijJNFTf5u+Mbi6aDGVAXTN4tYtejTPNL1UkGYip1Tto/y9q2nJexSV1xyHwdKuAaJKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ak1GbygUnR12PRLoptXFBj/iTxjIlyAqkCvQX9j6bz8btCa4O
	8PZ6CvkLSOsOk8a+bmp4gBhqe3cjH5nsudOW1fRpeq1O2oYuuwMyJrF6ZuciIthY0BODY46UiNG
	Lm6Lmfove753DUji8eon7Uh34Aw4YaT8=
X-Gm-Gg: AYBFou2QwT4BD+dfBTyHxepgwFd7uIHYk3Up2JBBXrpzpnDUYa6SMHh1GezrXP9PiRa
	YuRjOW2IdJdzir0rlG85is5vJyr0jyx0YWAv6B8DhtZ1Uq/GGmtTZV8/bCCCPzVgPGt2m3jlaaC
	HMI+qkhdQBD53vrsYQ58ZLsNu7dd31dv1hKuM2acLzNEx1ZHIS6vMxAp3HlEG194BosvY1gajOV
	Fl9DY5Sx6+wD0uFvKcasEBcV1VZdsQmg3ZbNTHeiVI3lwsYzoaBZHX5JGsubYGPnfvpAd87qf/w
	OQfTNbMyMvgzXJ9CP4KKbHJusl6wSkCmbr+kqj0160G6eX4VfPmREHsfIDWtSIU39Gw2J1abv4l
	rS0Ny1ay350p9UOMo/CRCg+LEki3OtEcAF5PP
X-Received: by 2002:a05:690e:dcb:b0:672:bb7e:c919 with SMTP id
 956f58d0204a3-67ba4c909d1mr4822552d50.2.1793596448567; Sun, 01 Nov 2026
 21:14:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai>
In-Reply-To: <20261005-i2c-xiic-rx-fifo-v1-1-0177ac5f72d7@nexthop.ai>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 2 Nov 2026 10:43:56 +0530
X-Gm-Features: AclHuK9Mvr8Imus9GpDjhEHLlkYTTfWG_3Dm8Qn9Rw_Yjm6XgiZ4JHgA2iLl30A
Message-ID: <CAKfKVtG4oCxJEvsQEDMxZSLbjSgzTxwMQ8Ky2Q9FtN3=6F+_rg@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: don't fail a read whose data is already in the
 RX FIFO
To: siddarth@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 12:21=E2=80=AFAM Siddarth Chilukuri via B4 Relay
<devnull+siddarth.nexthop.ai@kernel.org> wrote:
>
> From: Siddarth Chilukuri <siddarth@nexthop.ai>
>
> When the controller is the master receiver, TX_ERROR is set once the
> core has NACKed the last byte ("transmit complete" in PG090). We have
> seen xiic_process() run with TX_ERROR set but RX_FULL not yet set,
> while the RX FIFO already holds all of the remaining bytes of the
> message.
>
> xiic_process() treats TX_ERROR without RX_FULL as an error, so in this
> case it reinitializes the core, the data in the FIFO is lost, and the
> read returns -EIO even though it finished on the bus. The next read on
> the same adapter can also return stale data without reporting an error.
>
> Fix this by checking the RX FIFO in the error path. If the message is
> a read, there was no arbitration loss, and the FIFO has all of the
> remaining bytes, handle it the same way as RX_FULL and complete the
> message. Since IISR is toggle-on-write, only clear RX_FULL if it was
> actually set.
>
> We found this on a system with several AXI IIC controllers in one PCIe
> FPGA that share an interrupt. It only happens when at least two
> controllers are busy at the same time. With 12 QSFP-DD modules being
> read in parallel for 480 seconds, the failures went from 2083 -EIO and
> 1158 reads with wrong data (out of 11.2M reads) to none.
>
> Fixes: e1d5b6598cdc ("i2c: Add support for Xilinx XPS IIC Bus Interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Siddarth Chilukuri <siddarth@nexthop.ai>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
