Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE31655C303
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880562; cv=pass; b=NkPfKZ7rdy3olFLkjhJTsGTbCY+txIGGERXm3cD0W0LWQMcSaU/LNMTxlkkY8j3eZuntoilkZ1mBjzu1F3X2knNlFfERAqbho/WT1xVrcLQi8HvkZs4HWcFQNRy3IUMyxwPUsU8ljz00weNYY42Gls2dWR86ReVn3L/lnJp8wJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880562; c=relaxed/simple;
	bh=CwgTXRyt6y4ZSmfmvQpYiUTiFQ8bOpJfy6S0oEkKA2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPi1KWhIgMIWV9QHJdOHdNOsxZrWiCSEtSkY0XRY6wIQZDERKEWXi5IccuwJBZvsd+JyKze/L4RqnJewQ8ECoIdDFDnAGskj9x3wM7p5rozZfRsPhmwy7/0+qhYLpz18l+sKWFQj9xU+admHqXOvhBNmR9RhiurDhUWlP7eawkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCB6PChy; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCB6PChy"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so669100a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:15:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788880549; cv=none;
        d=google.com; s=arc-20260327;
        b=E8rxziz2hn0GltlQ+oKZJC+NnENla/8Dcke6I8Z1pU8rlUSmiv+cvIqMPumI1e988f
         D+sEQPiEmd7LHbChpsmZhByZ8ger6j7LpvnK9trF5o9zxgXMZ6ZFqw+tPWBQu7PBWff+
         diT6alwjRSON46pxcitJmH3/Hdfl33PWCflpSH/LPDkXaPU2lEvt+vMRnvqEgQtj2b4e
         x5ZaWruaPq705lK3Qo0L6W4hJsZCFxxGg+M/TBo7NzNILTvwTg1tK+k6GTYde6G8DDrZ
         UMDJSbgirIvyj2HTwcEtH5iuwnFFqUahNRMfh1glIeNnzGVKS9BUMRhz9bzq12TJkKwo
         CNzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
        fh=AngwALEoIC4scDtU/z5TTmJbRe5W+eiUZcBlZlm6N/0=;
        b=SY+IenN6vc+/fHR27PmrJcYhAoy02gNuovGi1YTwJkubYIP3p1bWw8eApk1k+ccn2B
         hay7Q9VZGxY4indSgRgFvtGyIbUmVlxjdEKIGOzH9KUddsRBgLcb0GiHsce1ELHoWYp+
         bjGL3ryVqQY/+bZerB6eBTvmMGObyYzwItrG8yOaQGKrS1WY3q6y5f0DXcxQqs2Ce0vA
         cxWvZrgEAIGOUf+f7VNa8ord/QMbMh7eSmK4sDKF2tekYSiOV/B4sASm8d6Uk92YPACT
         0U6YNLyQI0rcIsG3HdWM5p+xxZsTuJtfjs6quTSHsfPGjNwRM/UKZss66oF1CTjYw6M7
         0lvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880549; x=1789485349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
        b=TCB6PChyZ7w2s5+u+dxkHVUnCPzlnA8mA3sUxkUH625PqZQd+zNfGkRddUbbLhFBcb
         oV8rX86MfPh5V2inN+9cW+i4CT8KcvalPWlZCTE3wdQcp76m9OmCthDJWQYt5SQdo8Fj
         F6Zj2a8zGeQrGeRjMnUv1lahFwr9suRt4qULQ+zrZIktx/+uh54aIP9slBgkp9QxAo3b
         9+OQgNPTPHHipBykwV+3LcSS8yTvwuP5UaAk+cZ6Rho8XOo2A/JrUdM3dCR6208M/n+y
         QbRUOvtPwyrBwQL3JXag7e9ftbnqiITsJs7JaSL+1AaLaaWbF5kC3awqLLxFLA8M4/Rf
         V9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880549; x=1789485349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48I/5ZV3M8PQW+Nd+AVAKmbCj8LyPvNeg4eQe0wKYGc=;
        b=Mk2K6IK0J+v74v2SBsAaX2ZiBRmiRFTTsFttS0NZmkWvWeYyu4FrGkk3zpiYhaMZud
         jvuXOOrW5Tz36W3hXHye0VoAR+QcHf2s/UDxU2gKEkl40EDXQkRVEpOvle1TtbarUzlw
         B5FeeDP19hTRf3qRwiSzwG06E0efIVwF/w9unbK+v6hl6pdqy8YWSUFXkGgXYcOBBmnQ
         Md/KgjQB4nBJEm9oLyOiKD2Ed1+OQM9a6nxIL7dlFVkIesKH3HMEwRekh7SYGqEWFuiY
         jVA58smrGm+VxVn/N4B1EMDgXsjLrJ2zrxH7DA6PJ9sJ5XMbbGcZsj7jfNIkbbdnpmD0
         WvvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1wOMoRZ6CRLrajHJtliYgenBcEAFeMjoo8doo+cEt5+PXj6zLK+ixuiipE1pXA/MsqH2luRA+FFjuKHE=@vger.kernel.org
X-Gm-Message-State: AFuF++mM1sXJslP2r1/sAf2dl2bBITypSrH9acBSJs3qGr64meS7RDNh
	tZF4DQAlWH4tu8A3z/G1n6TY3c3mtnUhIrFCVkEFGhKuW+ZjL+Ccrx0sgJj1te/psX0VHxzrS1G
	q39TgFpkSz1L8fSJ3nje5SfoYd/cb4p4=
X-Gm-Gg: AYBFou2Nm+DdzezllI3eyaT7JuMCVsBS/7zg1K8o0jp+wfcjA9NsS9C3GUYgiPwbEa7
	vjVzCGJKsR5+h4/cuCfTXJby8t5+k+RTyUXuWKUtJk5fe7uPKQwn36EIfbIohDXQJwHX+Rl0RQ1
	G6IB1RlnGXAmQoFeu8olYPq5mtk77LV3dwKzokgIqFZkk/EXIgkDypMwkhY5JXSJccqDs6DwNmZ
	b98tCKIhzS3TT5gpkiSgKvYgCf+AHhuCywhFarlJWEp5QtW1cK9LSeXaBOg9JwH0L+4jSj2I/+s
	cwml8FaN95GWvEC3QSgUi9iza3RouVRNq7f3QBtBqckJg569bkq5cb/GAENmbdXNJsyiqpkxBTv
	hE+L1j/pAY3jzbzLCh7NgLmHDfSSNPws=
X-Received: by 2002:a17:90b:2dc5:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-39b9a99459fmr4622408a91.3.1788880548969; Tue, 08 Sep 2026
 08:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aqAVSgsypMch2c0v@sirena.org.uk> <5d3de44a-c382-4ce6-8f52-62696e67fcd0@sirena.org.uk>
In-Reply-To: <5d3de44a-c382-4ce6-8f52-62696e67fcd0@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Sep 2026 11:15:36 -0400
X-Gm-Features: AcwNN1VnTXeV8V659QiKMCwYI-2o7Ug_RreQwrzcUErxFzh7ylh_yBH27lIHOHY
Message-ID: <CADnq5_MiNmzkDqZRk70_RmJaJWTEXFtu0c+eV3TJ_At=uvJ54Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, 
	Alex Huang <Alex.Huang2@amd.com>, Mario Limonciello <superm1@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:07=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Sep 08, 2026 at 03:01:50PM +0100, Mark Brown wrote:
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: modpost: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/a=
mdgpu_dm_connector_test.ko: symbol 'parse_hdmi_amd_vsdb' undefined!
> >
> > Caused by commit
> >
> >    65198b3d0738 (drm/amd/display: Use HDMI FreeSync range from common E=
DID parser)
>
> Sorry, that should be f65198b3d07389afdcb48e4ad00fea2aded95dfd.
>
> > I have continued to use the version from next-20260831 instead.
>

Fixed here:
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/730c6d8072d8d9a6dbf=
d06c7c5ab4479167a792a

Alex
