Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793574118;
	b=Cq11FnE3nlEcdUr1v7N5fnVUTiT1ycvWB3lwgDCYaKI4d8R/N+lrvQ59gLwDirQ0cEgS
	 zjK3D1iaOKRx0qceVITTzYcYJO8ysUMGlucXHc0Ry3GTc/7eYrlHDpCW+27JWBGe2IX3x
	 hCpsZ7R67EHo35J7xIA8/DBpVHqCWxsWWATYR5u9XKbo522zRbNHurTUTvxROywTr96rc
	 7W2t+yFLLuKKSaNMx5M8W9tTN4UYB2yziukxrYzv3juMzLJh5NdC/A6mj0Vb6wQCoOOjL
	 iHXi1nnzQYcEB715Bv0nFgmnOyZ6YRjTXuhMurQ94YCAwbQ+I8+tDaY04dW5s9YtFwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
	b=1cJf8ch3y+mBJEG9jRTEbuSDcukqvdwLwd/71lQUh+LpDzjx0Mo53c0MhoagOnrlo+/5
	 8jfmdgI4IOzOeEx0e0LGTHkH56mHnOd0JiqhjhHNPqgSsc3+lovS4Ek4ipczTqsue0ycE
	 Lxcno+El886iqxEOG5Xc5IMMnN79LoiY8yoOsuPa/B/cmrPfmj4Qj+F4NZ1+yMxdivVf7
	 uDAnNgoIiz6z1GjcttqCMkX1OoxNkhh/gmBJW+lvjFzzxxODmZ2PebRjthf9sqW54X/8I
	 nGkwyw7jRzJvPUDgsQKiRzYicJadbdw5yD3CVrIVAT3P8awJqgSVoMgRHjgAUCcwXhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nVzGWl6I;
	arc=fail smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B99606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24B99606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nVzGWl6I
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-679e86015e2so3606288d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574117; cv=none;
        d=google.com; s=arc-20260327;
        b=LqeDtrhxhJKIAL4XEzqfjyVcmnORowXSIIMsIKLoKs0l6tSpvg+myD42knzm/2x19l
         JUqrN6SqwOk/2KRZVaw5bgZsheKXz866LAV6FboY3Yl5lODdTAAE6U70hPGacdm+qe3E
         EW8MEPvG0rIsZi9pDpjsMaSM8kzAz/YFu3V+G7G3VD/gmuCAYquI5LF2uQyllHSXn7d/
         SYXczEJV1THMDhwrwp28r9B1gDBGSt0qoxSUvulbseL8rq5p/DZhaLryh940cOjarNzA
         D/P8pabLBePrhfV0hJWrKmgOELkdmB0tbGRGNVsF+PitABnFPS/3wcI1/gIKZLknsp6F
         0mxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        fh=EfP9vX/PK0g8yw6QvrCEK0lE8MyHK1jLUpA2I/rRHEc=;
        b=hQZ/FN4dmGODzx7Kt3dBPxM3xmdd2E9qQKcDoQ/CuVQg0X6Pe9G+PqoxcQzFY4GWwh
         Ne3ZZ7lSM9NMk0Y/h/MvjZJBkV+Xv4RZTmwqgjZ0i8F7G+d8tOBHQznZfyaGmcoH2h2s
         dR6w1TVLRtdFRBeztOyKdBDSFKC3P6wmi+exw13G5Nhh/6b1rY4vsmW19ctvuVvOi510
         kPE4JEWdlkBNzCh1avHcjFItokrOD98Muv9v7JOPbrgDDWGbmWuv3W3hr4Sy52YFs8Bm
         Q/0lb4xj6bBPMKIyUO8wTlB2xNEsrmAG+c2L1/hzu2b7uyiLXInAF/KjP31dVOmGytoK
         BAgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793574117; x=1794178917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=nVzGWl6Ix/T3fqktC29agdSx+nhw9+1KkCo2E+r3nGEnlkYi0YDWQWcZKbN8IJSDu4
         MBaydsTTNFoMQdoqPXGsz5UQ2Wfw9GF21QdGDrbEeljKQuKKEjrBjiB06y5wHhM+nEm8
         mbw1jHlQf53yWyOYwcEcfi5NeFN6pvbR0q/l02QKIHDF5urwa0edOa9ApbA6HnMYhOll
         hYFaO8AgH/2IDzyj/ZN+G/EXtaqbcBGKAU3McsnRCQiBihI3r9uHmL5euFuWWyJROzxY
         BFVBwOhj8y40tAKAF/7koZvCgR0hrPSG/hVB5MytE3KgmxotZbHld46pa7CQa61/nU6D
         Ougg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574117; x=1794178917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=T2uPEUyS1FkvwgHlPYUrami7SNPcL64J9vI4l365lJIK2RD+ozh4KkNP5IpEZSpmt+
         Vvpg9HmZxKYiSMcuGWv+WtvhKB8U01EIlqPhEU+ggW2qgW610hg+3T+gZD9g+cFZJ4r3
         V2Nse8SVoXYSZw7ck7ru2rpMYU86cyVeW8fHfa5oz2lHdZGzOHoykPDe2aQqqMMRe+C2
         IhW8Tc9zJcnaGrTC/JQ4dR+W60pu4CcfBmY77ShdUftK9pMIRMNBz2s2qoL83q3Jhczo
         yV9JlGC9kq2ivtDUFPUVT4+iZovfmfybyZGbRhZ3cZiLfY4ehhPZMYWHEQ4xGvgORL2K
         LnBA==
X-Forwarded-Encrypted: i=1; AKwUvBwntKB/kFHA7SoiXy8ezYIX4g69RUrFjGMZsNdGvhFI1HWnEDAFH/AXFoYn/ZwarfrJnUwvf6PHJT/liLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z81aUieEmvuwHXGxi9OBFRhNtyp6ykJQegxkrlMPZp6AHs+LUcL
	MIRzPADuKECNcVT98Fg1KvsVqAopkUUn9XkDA8ls93UchcHj8dvSRdRrZmkiSknafvWVtUs1Sne
	BJdyyCmX4shF7oIDsJJSivtUH8ZZqg2c=
X-Gm-Gg: AYBFou1u6OLKFq6naRFWUst8Qpiw7LlAck0myFl3h1jlluz/XmPAKbxxngFPqzyKfa8
	p3CuzbgB2vziE6yJ29g5qn4coLJ1ng5D8lCNpkRSVnucZewpgdNVGE63CKWIj2oU2YHE5Q0TnVX
	00LT9+r20lRFn9+BSZF6d+S/hbbBrY4C/mmky245P0lvvJu5ObbtzL+sn5czBNLISnysUe6tRAL
	KN64fGdZH8nxrm17yAKnOe4VHZ1dv/osYWrQThHojfLScsiSS7SWOf9pPMHqu/gy1jSiN/cJedf
	pISjJdMwjyCTY7Li6bano/bFJDLzdg6k46bKSO0KoGPRg0cC2gmrkuvcSW1AAdEVBggH8MxDOX+
	S/fAxinFWo8SxtEG/w7U2jamGhwTpgGg2Dl7gAQYbMD6Gg1FQ6+tq2aWcK0D9ZnLRflO/EQ==
X-Received: by 2002:a05:690e:4084:b0:67a:86d7:b9ae with SMTP id
 956f58d0204a3-67a8d60ce47mr8913440d50.42.1793574117117; Sun, 01 Nov 2026
 15:01:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 00:01:46 +0100
X-Gm-Features: AclHuK_6zPYcTTvvo1ADEqHJgjW6vbl_w9ibYmytUlZi0WtkMQH9WoT0aPoNmLU
Message-ID: <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Sun, Oct 25, 2026 at 8:23=E2=80=AFPM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The suspend callback switches the decoder off, so nothing is left to
> notice the remote and the receiver can never wake the system.
>
> When the device is a wakeup source, keep the decoder running and arm
> its interrupt as a wake interrupt instead. Boards without the
> wakeup-source property keep the existing behaviour.
>
> Tested on an S905W2 board: suspend to RAM, the power key on the remote
> resumes it.
Can you help me out with better understanding: is the firmware
involved in suspend or is this CPU core idle state suspend (meaning:
firmware is not involved)?
