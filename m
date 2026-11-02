Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793659940;
	b=Kw+TbXPw0+gDH/KnSmGbaJWnn3jXMskG0/1VYdDAt8IQLDt2wsK5QMucxPqZgo5hPkuv
	 Jp/qZhylJOySyLQGyp5Joj2Rx/1fjDH+gZuG6z79DpyTJkCtZZM58eAZPmV1xRz1XoAkz
	 4AYQDQeptEs/k8Rxmy7jv4WY5OmDkrlYXrWlWbJ2z4aeo/EFaOrZJtMv8CqgoRkTJnqPZ
	 M1qCfq6E+RZrxr3bB3fzhvtvdw01JQJb3j9SFH1AYYQt2qP5X9aZ4GbXL5NMM9jguPGyl
	 FP23IpNX6CVmJzORGiQuHANcl31zGLNk1yBYGBZ5aeNkTRwBoLI4JoD9OQEaMH+sXwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yGaVQZD0KZYDPqiDkr26iRqLwAumk7gYrARBO9XOcpA=;
	b=CURkF1TU3fYqvsSEiMj4L89J1KuHqB5Kh5uiO1POLqnNzcLsQ+gKd2KDVejfy0vt/z7Y
	 6tIYROrew3F7u7fQZ7KbDoJVH45HQ7HS093mOtkQvYrFp4CCAEmjgilqiqwKBFq0GlmYM
	 H+poG2DUBvhTot00jCPi5+6TDwEy4jEJezFi4yjTFkbsCPR2n9+FI45qHttOTLTQKpMN9
	 nZZ1hf1fRb0MWO4DWnDDTJS6zrknvHsx2CRCakNcTXxLrO6B24Z9Jpo005i8SBvp79fBD
	 XBE8OSZEJ2t50n0U2fizkxfaqzq7GOwnf45JIp59fwidTjogZYaq33ewsrC5s8r+RzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nagashi.ma;
	spf=pass smtp.mailfrom=nagashi.ma;
	dkim=pass header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=YTuAzXZp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE7606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BE7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nagashi.ma
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=YTuAzXZp
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c450ab1483cso593841466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793659938; cv=none;
        d=google.com; s=arc-20260327;
        b=CVtElCyb/+hAVc8DX+1mkfjvVOtejpRJP4econFgq6Y3u1Wu7PH0bgRC+KQrdtvTnz
         5UA+OP1VGzY7oHz5nUocxYJ3IiBv99Ie5tkCiqhwrgID5jDot3qL65C7JLzor65iEczY
         ohGaP67jqWFRwsUKiD7tzcmsKgnH+c9tFaTN9BB8n72VST9ML77jZA9kKw1dumOb7LHV
         PfCkd4AdwYpBWklqShOPjbUlXuNgYQJ4avV3ScKwtEr9ckfrBB8hrccWGS7Aoc/VF2VS
         RqXo3o4CG5t0s5siDyRHZBx0BdyHrYknKgkRZ+sAKG2Z5gekuBq3XRUU9BxxfNHwBAmH
         ukjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yGaVQZD0KZYDPqiDkr26iRqLwAumk7gYrARBO9XOcpA=;
        fh=b1JQI2sR66x/1+DQMM6gAzcN1sOk3EmSkBuM7XAvYyc=;
        b=j7RMv5hXNySPFiwGG2j1InhxJmqUT1VW2tKYCdFrc6uKFEWwiYt9JFqNeebf9HIxd9
         MTJQNhwybBrDMMI3Ci70fBTIUlPIyuN6bJgalUtM4V0wU+o9EMrFgG/me3PHRGMMZPZz
         i+X9yH1SdatgVvVBEVml774YWGuxU5UaL79Q95GgI18yEjZ1GUHFDMK/2+ZcLKmt81H3
         AfUKT53XQWjxBzm4OBpBW1e+tBWmNS3biQfsFyqEDhLMyPCdHAwkiAf5Ql865hoAACF+
         oT0MabFPWzFbUyuFV7eW7ePTB3aYE+wqtU8p6ND7jZWjx1JSiwV+QCslhQZ5xjMKm14H
         Gfdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1793659938; x=1794264738; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGaVQZD0KZYDPqiDkr26iRqLwAumk7gYrARBO9XOcpA=;
        b=YTuAzXZpkWWcS1KHI/jAs78YtXsCquut5lPpUS+otiXL7qWoETNt9KqWXjrON+h2pF
         ntsF0O0ut6+LSxuEGzNlJyGmW306hyxUr/Xi6cMvIir3TnIHQZg9S+nBVqOQls7EDLkk
         ZU4we3zk0/xd2ipIvCArfl7wHYAuITLuKoh9plqDX1eW2ZFMQHNqO2Ksp1AhhhQUvArF
         Jm+cJPts7gBJezehc2FaaQgv+ibqQBJ60+Yf4Mz+HvSDNtRCDWpy4dt7KajSVR+/qyXc
         /UfD9BmRP3KYZuiqdZtGR6qMo8PxBNjeqBFND23ujL8gsoQRwL7T8Oqnpis4P/QlyavA
         qeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659938; x=1794264738;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yGaVQZD0KZYDPqiDkr26iRqLwAumk7gYrARBO9XOcpA=;
        b=vzLnLbSRm2wtyI0J3TqVR6RPDB8MS6LjsWRj5DyNTFdlHEmwT/4710pGyvf8f0VaJC
         pSQ05A75WjIlo7IQZoiOkHDnNQ93kyeepIt8Y31gGHJf5X43PJjhqcwophG+AfNn350n
         jKCaKLGh38crgDvtxU0m7kvJBNdyDLaDsm8ORcYibFko+woIkmdG3cp9HX09m24c2Z9H
         +b+RD23lYMwyG/H7uL3V1EWR/I1V1SexwR+K7w2QbcrS4zR3lyahoB9dTt3toucinP9d
         xdFopvAlhAWQ+gG2FZHabnmvZn6Itl9AUjC7f9/Un3kbhBZby1h03xVrLrlhdeWFR+qT
         fswA==
X-Forwarded-Encrypted: i=1; AKwUvBzytWdD8ophsBHa09QZn6zUGa81OrmMEm3+4KHfMWhyvPdQTOyVGcR2TWW9wZZe7Uu511ozN8o+hTQAAjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9pcy28QdrZ+RYq6/W26k9OgzxE9tCD44w86h6el16aXHzpa8c
	7TV97RDnebo1f9Kxzpy6Ts3dfRa/VyM5i/NLxs2yyo5FNAHM99CfuatuaI6IxxNzBZLktyXcObj
	FfzovbrCrX9YoM1BfjZoppxbaFwz1zJUZrp3kB8uW
X-Gm-Gg: AYBFou0dEAikgTDA/vzWAhbjnthbWV7SDEuQcmZc/l5VR8ZBq6zQbrjJFOWT6Z+3Mf5
	QJjr5BjZbMf481ES+164xMCKbOdWrKjeT2mLm81mItnusADbpoc3QV4Iq7I5LS1A2TOwSht1tl+
	M3KJuWDWi9lcSiCGDRIDIdOANG88VDqxH6F0hx23T37a02CLR38Rh/oKmxrl2RS5kh9NdU4/fhd
	PV57YdRVrlH7kb3e57ufZuSol7ASmJ0mVq+mF6stm8eIeboSSDO5Imiwxq21QdOtltdGrVNEqE3
	5XaLvxnxySoOn6taRsZNfyXJEZeGF+q/hHHo57/3J6tJFrbpo0Zg0r8ilXDjbrcLWsamICZB76a
	0gJoMVnr//LH01AKBHhNS4CR6j6D9ohUTyVzKMKlEWo0WGdG4RDVEICkOiVjjixoHkh0leBG5tM
	cuiF9lxgocB/S2vMdL8omg9xRCx1n1O2YaRkkJ8j1OOWdiupiloCRUPQ==
X-Received: by 2002:a17:907:960e:b0:c31:9a1c:de76 with SMTP id
 a640c23a62f3a-c4ca7a4d998mr941316566b.14.1793659938062; Mon, 02 Nov 2026
 14:52:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma> <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
In-Reply-To: <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Tue, 3 Nov 2026 07:51:51 +0900
X-Gm-Features: AclHuK-sLaEQW8IrNvFSowd7lBj_NX50xJF9W8-RPIjopaVz_mLHu4yEVmc3eEg
Message-ID: <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Fabricio Akio <fabricioakio@gmail.com>, 
	Aleksei Kharlamov <aleksei.kharlamov@gmx.de>, "Conn O'Griofa" <connogriofa@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Loic,

On Mon, Nov 2, 2026 at 12:56 PM Loic Poulain wrote:
> So why not updating firmware-5.bin file instead?
>
> There is a tool available here:
> https://github.com/qca/qca-swiss-army-knife.git

Thank you for the suggestion and for the pointer to ath10k-fwencoder.

I had tried that first. On my comma four, a local firmware-5.bin with
the mfp-support bit set gave the same result as this patch: the
protected Deauth carried a live PN, and the next association was not
rejected. It is also the file I used for the overnight PMF runs in the
notes of patch 3.

I went for a driver change instead for two reasons:

 - I was not sure whether it was fine to change a firmware file that
   Qualcomm provides.
 - Other devices seemed to have the same problem. No WCN3990
   firmware-5.bin in linux-firmware sets the bit, including the newest
   one (shikra), and Aleksei (WCN3988) and Conn (QCA9377) reported the
   same issue in this thread.

So I'll drop this patch and send a firmware-5.bin update to
linux-firmware instead. Patches 2 and 3 do not depend on this one.
Should the update change the shared WCN3990/hw1.0/firmware-5.bin, or
add a file for one board?

Aleksei, Conn: a firmware file update only helps devices that load that
file. If you have time, could you make the same change to the
firmware-N.bin your device loads, test it, and send it to
linux-firmware?

I worked through this with Claude (AI). English is hard for me, so AI
helped write the English. I ran all the device tests myself on my comma
four.

Thanks,
Shunsuke Nagashima <shunsuke@nagashi.ma>
