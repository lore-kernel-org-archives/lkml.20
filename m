Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323FF484257
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586272; cv=pass; b=Ox2Be4f1jDdhlX+UN7XvEvRHxmTDFeCcAtRcs3FjmnZvhcr1X7M9P6YcWPyiwmXdsNr/oEOTBcvdvSJuyhACeAEgBhA/GxhDUSt6MoCDvtHYoxAOviHAKXUwDau0eR0E28u/pxjhwTbtX+nqOcKmZsMkqpmLy5rtWb/RU+d9DHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586272; c=relaxed/simple;
	bh=sJIQb0qppefV+n+o5hwbpJZrM8HXT9DOFxFpufv7NOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7/0VyrL1/RZKndsv1qAOZ/DOwPNnuX7qU1byGBogy8ME7WWSb1KeSz02Z2ZCWpadBLmKpucJX+HsDSmFxuL+2kiTEDjMjd+wbS8VFbwWeIKnhxafrg8eyRsn4gnrdanjHe1srlvG+4p8r8P2Z2HVCqm3jDXFOn2OgzoVMGrb2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=VKet908d; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="VKet908d"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so26420651cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:04:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586269; cv=none;
        d=google.com; s=arc-20260327;
        b=mAcZzK3vOyTG3IS+bx9dRrwv4mrgNlh0kM9RhkCnu+9aP+OJJawkT/V6wsoDbTZDeV
         Z96FkoM+F0T7lg1IdtOHceZn0mEX6/oE7cKkS9QUNHWBz6MR1hBP05P8J/8xmeTitNbr
         qpW4UOjhnAGGIYGnDUlow3pagQuik9+OGjfeXF7dAI032pLW5GaersMNlPOko98yQDes
         mc3Du/6N47Erbokd+WoJ1lWvdqZydLaDGd4xyZhbLv6SVxEWCwiuISuP7/TOBUTYKRWD
         mc0Ytnde8JWQzbtk0YUlGolB+1v9UlQ74FCif+ltd+R2nGEPM2DfIRat+HxWMLSfIPQm
         d0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sJIQb0qppefV+n+o5hwbpJZrM8HXT9DOFxFpufv7NOE=;
        fh=tpTrdTdAazUOPF+xcEiUHjyv1T3JdjdYVXDngzjKtx0=;
        b=jUGYDQHjub8sjBe5LXqp6jxRr2/LEwrCdgO4cUkuIWRDKlUZy7DutXRsvFuL1uJY6j
         Eh/8Hv1pZW86jfPUNs9LE/SnC5rWIYAtHzt71f1qdnD0OKSB0TH9QiEkUxNsc+RirJw2
         V2qzyYeT9N3u5/KYiPSvc/yaFBTqHEhNcH9SDD+SnXe3JH410z3vpTldZ/DgLkIkf4JA
         Z2EhkJD4we7kyJJ2j4EeF2cM1ZdRfTFcZyNw/nIBd7RJT5nam4jcs+W95KGgFUKVdPNV
         +yj8a+EOEL6CX/mASMRo3wJPQGX/nRzn1eoS1RX7xfWncWhRr/O1EV6IMelVEmHMsgN3
         qJvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790586269; x=1791191069; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJIQb0qppefV+n+o5hwbpJZrM8HXT9DOFxFpufv7NOE=;
        b=VKet908dNqyrHYyJOHFVB3id5x57sPwwpl5J6xKMpbPUAtBc9ASov4XKrdhN9vmFSc
         ++rbd5t2N0cAoZsYodDx11zV898E13DDNXKeU7nRwp0Zy95xDnD4KvySEyJ9vaENmb25
         1t0ncgj4n9FZKdGIcAw7EowweAslo0zMbztfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586269; x=1791191069;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sJIQb0qppefV+n+o5hwbpJZrM8HXT9DOFxFpufv7NOE=;
        b=s/p/fqApA3zmkNkTU2WALM7TFlKrHvMQYKDA8K2WIkBGFm8VORLfNcEakOUkyeIYMW
         Tn2BYHXgdmPRoJBuAAkj5x6/3bLRvLpFRl3TBYwtetMpbVu8SQfsX/dB4rnTraY2C+i4
         spEAAKbofDycAXo063T/Zkwi/BIpx6tzrDyxoKZPwCus90w8jYNsSx9on2PMX6PhsEKv
         WiddfbnSwz2OYFuxEHPzvK9mi1SjqFOiMEjuFSVr1UMJzLMGOsseoZmFJkX7CL4vVmdX
         4F5x4BLEEKRRtg5ia33zjuy/0DRPmW8r76mMVftBei++PSSVzZqbwuQPxi7WPHBY85zX
         hsww==
X-Forwarded-Encrypted: i=1; AKwUvBwNz+5w8SfHwFiVnE9v6Vi3v24EuTizvqy78i4seFMqhBc4c7QqqoB8Ucn2Rw5MhoxVMwLpKlna0I0WV7w=@vger.kernel.org
X-Gm-Message-State: AFuF++lvIUpstxEJuoIJWrpplS6SOYpjwPuGvb5q+gu6CWazesYZ0zye
	zUM3vQDjkVXvmSQC9RzzavYq58HF30QhBOHcjVo+2RWuq8b0Gv7UounQDgQ5Y4RrQAQ2CIG3zkC
	TaMvpJpeQacnhPBXepxJumpJJbfD6qZUftnB/gGEGmg==
X-Gm-Gg: AYBFou0d/Jcv+oKTh1/X4wjr43QpN1MlXN/i11zIWuaexRokB2vDkkF6tGkKXdipsKa
	yN+PKWSRY/2sA7obq1Nrf2KbLDZITxm2IZy/KAYlNIml4Kh1fjX4m05BRK+uDrNYhVhGfI0ou9W
	LVJBZxZGk+knY9xmD41TfqgDkpe0D4S0xhNaX5POQHl6kow0EO4Ah8YBUY7V8f/GAmLCEupUX/v
	VPNZTyPC+nsati3xy6PFdBi116jofFH+2L+N0v3i53WOTlyBFveD63haA1Iyo0SfFnGJ0lSOotH
	QLUYhbM1cbRWg9JOJVVzzB/VpMhHV65iI8KZBh7d8cHmgq0urlO/MfLp3NDmdhRUipOlTgVOnP3
	2DaR89IzvSDIzKA==
X-Received: by 2002:a05:622a:120d:b0:532:c7bf:7f88 with SMTP id
 d75a77b69052e-5330b556b7dmr206684381cf.9.1790586269041; Mon, 28 Sep 2026
 02:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811195733.38489-1-kmehltretter@gmail.com>
In-Reply-To: <20260811195733.38489-1-kmehltretter@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 28 Sep 2026 11:04:17 +0200
X-Gm-Features: AclHuK-Jsl5DiALC-j7sE0rdr09A1c57R2WXrp1gltFow3WO34CRFJtZ2bJ4p_U
Message-ID: <CAJfpegs_4ae36hERZVC3yDr2w8S0zpoo9ER=NU=jth+pXfHd9Q@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix GCC 8 build with CONFIG_PROFILE_ALL_BRANCHES
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: fuse-devel@lists.linux.dev, Joanne Koong <joannelkoong@gmail.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 21:57, Karl Mehltretter <kmehltretter@gmail.com> wrote:

> Use umin(), which is intended for comparing an unsigned value with a
> signed value that is known to be nonnegative. The preceding bounds check
> guarantees that MAX_LFS_FILESIZE - pos is nonnegative, and outarg.size
> bounds the result to unsigned int.

Applied, thanks.

Miklos
