Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776E25478D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788834765; cv=pass; b=LRNu6COXYL+sR/0NCKmoPRKq6tiY8l0tOAhZ6OZULDBfCtR1uJnUpezOctQR2OO2YrwquQ1HMhoMsCWKja54lhCDPT6RjKtkliWhlBqgQW3SXt5O2RIzJhIUDs0koPZ+4t4XAc/yJWA5udIEDGD4sRWnZJavwqLweUNAyGnEbcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788834765; c=relaxed/simple;
	bh=TtKy5xkal0yQAs+sExFPNxFJ+y8jjNO3NoOREs1T6VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIGGJfA/84uUyqnlKGq6YOaN1PGoW8Sb/f2UPSt2xdQMQGekAq9TcVb4vZfhrjEBOovAVjNYFFxEAI71S3miwKVMsn79tvr27OWlDkv7CocT9C2HElYhJMIJrFUfHR5739nxObjEehPAlU4A3BuRuPJEN2Ej3zuOiFVgQCMq/ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRo5xlXW; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRo5xlXW"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-862815e2683so2509591b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788834764; cv=none;
        d=google.com; s=arc-20260327;
        b=qEUYTgWN5nRxetSAF1krui7/FVHfIKC0ySr/yzYiNwpTxOwSoASkMitG+MiIUgZEuM
         mmmWg2b1xDk/uNVPMrU2fbYlKWgHiaWNGUEHtm5gIqXo0zrckrYJyWaNDMBVl0326xfa
         Zbl7Jn7QWMgJNhTQOrVBeDLMuf0M1i6Z/W9PCOyu5gt4lhYr8vBYY0DKhETGAMARhwIR
         yTahAJdOGkdiJb5QwGvVIkX0bwUU1uu6vtoBOTD+nRZrtJvFAns52T4VxSTfBM8RLl85
         z9VDpnDYVt1+lprdiZiyRhCJbQP7QBK4gzNnSy2stvpl7IgQeHrWwJ+iVX+USrgoYcsR
         085Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGD5b6Vz9R90sdvVguq5WIje3KUQbM5Qm1jcj6Nw7+U=;
        fh=4masKdPPHS2MQOXZv9g0Z25Lkfxu8+50VfMirQj+WQU=;
        b=kA5Nx9Lg3g6m1l5gsbMUB/wo6ZEXG04qsAqLdrivoPzHoMie/GtRE6zynCYLFXzb9v
         33459xl7O6skRyT4UegkOLCtwqzwH7rWSppUjfDZI4ckv3ScMMLn3PbatKmTRxk6eJcG
         av0zNKGOwlMtAc6HWB2xcCNfXvODPYWhrTaIuO6/cMs9eh9336JRSc370e1zXCN+2pQj
         6WtvIIZqZ9+6FyJQrAwiMBmHPisDt2iYUaKBZhJEr/uzjovBdiiFOEYs9Fv9qRZUwElS
         PbRa8rSc2VH5Hk4IjRn9U0Np5PSxQR1iMu1j5WKDFpbcKVtTPa98cDrb4fGsOW0buG73
         rmrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788834764; x=1789439564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGD5b6Vz9R90sdvVguq5WIje3KUQbM5Qm1jcj6Nw7+U=;
        b=kRo5xlXWrRTgAvxfK/qlZvMWKzZeyWGqTS0nUE9QvpgIOqetvY2DpPp932kW4RSNsb
         VmNaGNMQA/ujX8fYVBpWtkxnHpcFLfgSW1hspT8Pjg9iCuu+MyB2h4pOLrX7KwZGR99R
         1F4I6zbV6xnQ6xV2bmtpx+LYTZ3WwTwR9xjE3F5sgCZpXK6Am9xwymWndP65jLIExzpt
         AJXxspMthBUZZWKDG/67rXacTDzLS3qkRzwCpUb72My8GUO9xl64Jd8BLG1k8RmVzswT
         EgpMI/NPHXWPZO2FDrrd+glR5vpzmD9ZpnHQD87k4dAjxYccbute2LZW3KUYpAf4ugUp
         Dk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788834764; x=1789439564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGD5b6Vz9R90sdvVguq5WIje3KUQbM5Qm1jcj6Nw7+U=;
        b=ng2nr9WGeJUpSR/e1FILh2v4qJlTse6UHb4mlyPYZRsVaEMDhBidpMoprHHPgKyQh6
         lekIxsaamtX14hXWmBEdFx1PuXbiTc6kriLXgNthNw2/s/OhZNdyokJuXd+sFloeMGzL
         b+zYJTCeuHwROx3UsGT7sEgrZebAsaR+yFw7Dl6OwCXy5Hp/G6QGj6n0LDJyTSoBE8Bz
         mBEQGokuZ1BHQ1QC+XP0sQ/1i8Fj8C4mtvXkVAtqQfHFFXz5fd/Kn2i9Rp4s9lJJhkQf
         OBlhz8McrXr16y9FbwYAk/zBbZsO2m2efTYZwjrvTMoUmxUeBGo8dRJZMTPF1Wzbzb8W
         nwcQ==
X-Forwarded-Encrypted: i=1; AKwUvByIKSPY802snIcV2ChBysO/MMbLIUHhjikadJMH8bw+ZLVMfMfoBgMwhbpYg+T9aVNb1ltzw6EcuZ3uz1c=@vger.kernel.org
X-Gm-Message-State: AFuF++mkrgBsV6eXIwruVsvpsFdB2T0CAxj6dMerPbnMzrjWmeWEWSsJ
	26bUKHXjWMSSZSyABpnu3PkDVR4HneNhkDCXtaQNuDpaLN3y+196uMGXjsITvHElEtrepzxyPwp
	uuLKFQ3ATfnj+MWBrs851GU31Hehmmpw=
X-Gm-Gg: AYBFou1xOtSvHt9H2NXnAmldiS++vwbHChxwI0u33y0JbMKODixB78kuLw5FXd9Usxd
	EVqZ+wI+AIwhU7pz84ch1qN6MHnCqfG0WG2ukiJdyeuaC0+kAwsnphc9rTEae5RqWmgxL/tEd8L
	y3gaIhiXPBiFjXrtbHHGSLt38kjb45ktkakOA6vl+qHeBfCPq3rc2Cc2C6RY4qGrq5dOFKQPXVl
	2W4+AFV1PdWw195RKWRJ6e75HVn6nZAbhEdMx3KX2UNlDrOYO0fgp5LBw+OvsKqWxerhNo4zg/C
	yYkgSzLbcscCnr/3aqIMzs7B+dALpxZ7FqaWVpBJ8qlDFOuuFv9tEsqcJFWHHj1AhOvRcVjAKJK
	/OtN1I3nEGAkmbUgL6brAm5WLvMtfri6ffbUiSxPLcfLuPSfgz9lEXZME
X-Received: by 2002:a05:6a00:10c9:b0:845:363e:12d9 with SMTP id
 d2e1a72fcca58-861660e3dacmr35566950b3a.3.1788834763748; Mon, 07 Sep 2026
 19:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903073252.339250-3-phucduc.bui@gmail.com> <178880965410.219967.16945994924537630103@kernel.org>
In-Reply-To: <178880965410.219967.16945994924537630103@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 09:32:32 +0700
X-Gm-Features: AcwNN1Uc7OOBBtUyoJPMDv9iTOKu63-H3SRX_PRIcuXsc9hMlCIYJizmbeV2DYI
Message-ID: <CAABR9nHd-S-3MgTAZk=JMCDEkHjuHqwsE_9h+14tXdhvWdn_SQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] net: xilinx: axienet: Handle optional IRQ
 return value correctly
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	horms@kernel.org, andre.przywara@arm.com, hancock@sedsystems.ca, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 (1) =C2=B7 Low: 0
>
> - [Medium] net: xilinx: axienet: Handle optional IRQ return value
>   correctly =E2=80=94 the patch carries a `Fixes: 522856cefaf0` tag and a=
=E2=80=A6
>

OK, agreed, I'll drop the Fixes tag in this case, since this is a
no-op cleanup rather than an actual behavior fix.


> Pre-existing issues:
> - [Medium] DT binding vs driver interrupt indexing mismatch (pre-
>   existing, not touched by this patch).
>

This is a pre-existing issue, unrelated to this patch. I'll keep this
patch's scope as is.
