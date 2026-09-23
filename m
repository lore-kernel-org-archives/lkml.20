Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6A5353A8A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152151; cv=none; b=k8iuNJElmIgabR0SXrf0lirHpY2UBVIPyaLriD4sXGWwDvJn9TzOMb3i+g6lUeBJ2BW2GNn2gjAp3AOaUfTUnOtOyB5rFL7U99Q1VkDXOKS9RXj/ouhbuRz5QXsKYrdmR0jke1JpmKu03kOnykOFZPc+oVcsQvBN5N6MGpNU8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152151; c=relaxed/simple;
	bh=tUacAQlkKVSQfQjUzaLm2lm7YcF6fCoS64CLbnNXJP0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SzK6sgPPdyQyevYHuSWPLXKoN+Ewb6tS1Jizcat8L9NtOuv1ZL/hvzdx+CqhJfJhGGBS+6NxgG6jy+a/1ObUaRgITRxm5qD3H7mPe9zWEbGidpKS2Z8qiiRuatNBMURtyiehTT0u/ymx27CqxgUmtNNtmiiyHJhuVpNtg7pVfsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C/w3JtkO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C/w3JtkO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48442ea8f59so812164f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790152148; x=1790756948; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tUacAQlkKVSQfQjUzaLm2lm7YcF6fCoS64CLbnNXJP0=;
        b=C/w3JtkObuzwpZouop36oa9BGFBg9n/apU+pq2LsrtiMUhjLNCKAHGU2fT6IyL2qrm
         JUHWhJa4202fdwY/OXkRH5xacZtlAqtefIL+vN3uK5EYj9gqSXl7am2KKBJyKD53DZmW
         0QKtostJVFw8JAFAzDBWslXU8Uo26D28pnr0DeRweBcmxIvHnJHVnA73DW4DSL9ZocZz
         8M/EXNY2afwbvlMRPVnp0XjZxPS1Zok1nNGldkj30h23+ANPlaJQ4Vz6PaCAV9uZZi5l
         MaiUJXni3JW3Aaihtftm6/Oojr7s6pKGPF2RlmiXCinH2zrisO0DowZZHhRGqSi1ddQK
         U5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152148; x=1790756948;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUacAQlkKVSQfQjUzaLm2lm7YcF6fCoS64CLbnNXJP0=;
        b=RooQ01L1DhxeIA58xUT+gRQf8RiSjCUfOcLjo44HAjEZB40FygTPIFi6c555WAVwXX
         W0WXh5ZIVSag6iPxu5sVHql+WT+Xa1kKRygKFJpovZ/cBiTf+OKKlaUjktZ2dscXt1w4
         DAHUZ6PVU5yHmcmGluvFIkcM2GOXwGAdbFLQDbp1ekyBfILXO1swCKKyygl2A36yTEoo
         i/SjdyvhDYIrsTksmV5WGxgKqJoe//Lnp1dVfe2yfPOiTnchri4QnEurPjPN6zuNSW4F
         AaL5Ul3h/H/FXhj0PDGcN9zH+7u3UNi17gvFVrEbNSzheKW9Ukv6UR5AHjHLZ3uvb7/J
         pCpg==
X-Forwarded-Encrypted: i=1; AKwUvBwed7PBSGmFej6MGLCVav92vMLW2EetJ0P1PIjBVGX7GF39rZJwyCxyMmtNSXHsWgvSXHNpUIrroHiF/SU=@vger.kernel.org
X-Gm-Message-State: AFuF++mlDTt2Zi4mUq9SqxznM0tj77j2nAoExvVtDf0DswDZYNf6UCBw
	ENc/0WgRx6WbjEV8t4ga2WjMZdW/db3Nh9i+SBnJIRAOmtIUztiwfDz5RWmdcKtdLuOI7+FD2en
	LOIDMANo=
X-Gm-Gg: AYBFou2umE0mALly200e45r7sSuduU788ugpdVhpS4ke93+S9IfiFiuLEnEtd8mCeIp
	Nne2gCOvSkUs1xBtMlJfE/5YK5KxIXDWd2uXpODdTOYLgioCHgFPuF9DUW2ZPpiroDZb9AhhE7h
	mXERIO1XzECuJdLU/2vKQQh9tTdCxLTs4nKlvHEdnKCvAqQw9lNYztT0qASwoq8RtK21s9QJ+BE
	SnC4InkDLYBfdm3T66S0MLoDSo+EtqSPm/qPB9Bx6YhpfL5sUc6bLzx1EMB6XzkQW6s2uOCfm/A
	gWgB0S56IlJj4Nt0x9zVPiP1c6S67/yFed43tJupy0YNCwa4SUcMMYebD7bA75dNGvJrb2psDon
	A3Z/8m3GS8fj1pmNLWI7x4Xh9S0PY1oRrK7H/B9d81m/1SIakHim0HqrZHlJz444EAfLvaEZFq6
	WMhzUSEbnuHS2KBYbMObcavTGVyIFUzDlfcphvAD5PMKRUkC0TZ93WRPdd8V4VUC23tXvTy9q4c
	Jzpo1jZcF1+NLMoY8RXTZqbLq4xpqTYW+6EbE6iu+LQYedR0VTAl0COUNBh9ELlQSgYpQcH+Yvy
	f8WFHeNNAbJIIJ2KTBmBundff8Bh/W7wI/gJjnSMSkJw/A==
X-Received: by 2002:a05:6000:27ce:b0:488:654a:981f with SMTP id ffacd0b85a97d-488654a984dmr3676033f8f.10.1790152147758;
        Wed, 23 Sep 2026 01:29:07 -0700 (PDT)
Received: from p200300de37172700e7f885d729fa4be7.dip0.t-ipconnect.de (p200300de37172700e7f885d729fa4be7.dip0.t-ipconnect.de. [2003:de:3717:2700:e7f8:85d7:29fa:4be7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486461sm5136850f8f.8.2026.09.23.01.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:29:07 -0700 (PDT)
Message-ID: <adf11fcf1435728f98b4f94c1821d86b83866c14.camel@suse.com>
Subject: Re: [PATCH v6 1/2] md: Don't set MD_BROKEN for RAID1 and RAID10
 when using FailFast
From: Martin Wilck <martin.wilck@suse.com>
To: Kenta Akagi <k@mgml.me>, Xiao Ni <xiao@kernel.org>, Li Nan
	 <magiclinan@didiglobal.com>
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 song@kernel.org, 	yukuai@fnnas.com, shli@fb.com, mtkaczyk@kernel.org
Date: Wed, 23 Sep 2026 10:29:06 +0200
In-Reply-To: <010601a0cc7347e3-ff9a517e-b03b-4de5-bd38-93b664f3425c-000000@ap-northeast-1.amazonses.com>
References: 
	<010601a0cc7347e3-ff9a517e-b03b-4de5-bd38-93b664f3425c-000000@ap-northeast-1.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Kenta,

On Wed, 2026-09-23 at 04:08 +0000, Kenta Akagi wrote:
>=20
>=20
> Hi Martin,
>=20
> I have not given up on it, but I have not managed to post v7 yet.
> I still think failfast should be usable even in setups like that.
>=20
> It has been a while, but I intend to resume work on it.

My thinking is that, in the fastfail case, code to prevent total
failure could be placed in the end-IO code code path, e.g. by
attempting a retry directly from the md layer when the last rdev fails,
instead of setting failing the device. But I haven't thought it
through.

Thanks
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>
SUSE Software Solutions Germany GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg,
Germany
Gesch=C3=A4ftsf=C3=BChrer: Stefan Gaiser, Jochen Jaser, Abhinav Puri (HRB
36809,AG N=C3=BCrnberg)
