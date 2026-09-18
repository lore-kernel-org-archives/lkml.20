Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DDF370D69
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742910; cv=none; b=ZcBcC8kR92AtkqQtDXiHA3xGi8YkR4JCpTwZ8P5uzyWEIXXfJxDpGo6iiSvPRmm0JaSnrtQMOCn84lI1ULhYNUb33oojjCeXLLBjarvia3z3cl0mXaK53CXlnCoBx2FqHPYqt2j4ReUVJhA2dmVz3AfWbiFPEpOtbWqAD+A4+Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742910; c=relaxed/simple;
	bh=L4bI3PGgU9bSJgOhljQBgG0v7C7CIE/2yIrGX7MDOqE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LXOQTeVtaE5YmeiTo2CGdfr1U0oBfetDSQTsm9bkS4O/aFCknkRTl0EZfIGzB+7O/x0XMDHhhTd38s39Y00wejM8+BsKSWmkvgsvqpUFMmpjYcDW+9HSk9Z73TzgKRR0pHct6AsmLggoAhGnWl0Y3KHBZds6RI5audqZbh5wGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cyWzPhFE; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cyWzPhFE"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985e8fcddso983209a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742906; x=1790347706; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hg9vfa4lsW5ktc6Y5Et7BMiTJemiUATqSiHMCuNMX5E=;
        b=cyWzPhFE7qdE1aFe+S4eLXfEmqXcs3wc5OKxabPrVzvOUlA1/CVsSGOSDK2oUBeAHf
         VTHuh6+d/FtT/VedI1JDFJYaYnSSS1KO1r0NoyKWq7kc1hm+HuV0BquTHazshHcwNrR/
         CYsEjhCTSRtjUZ5yCOcn9ToOHPGgfU2tL80eldLtBtIA/bPQi2Bo8Z8uP0tHFEgjHa4C
         jMF7axCTOcoTmYSUnwAs3UwuO1NDILwFkWymXVDr2RC863dwQAdz2BqvaEl5Eks26FVN
         6NSTxy/zyd5+Q40bdbDn/T+W5Q+6hgvmTH/ayxJjgn9q9cdlobpAuvIJFaWayy2Tx+UC
         Ozrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742906; x=1790347706;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hg9vfa4lsW5ktc6Y5Et7BMiTJemiUATqSiHMCuNMX5E=;
        b=F+/6yOQmsDjvYQF2FoW/TwrT/1ZUXStnSBQ+gRLXN8hk76QxbG+rx5/lbGV/sfKscO
         OquK8O54hg4OW6ojwx4Tfs8AOV7VZwlPaZfFLUxIh0e1HZhzcWtRgTR5vz0SJ4ndJMVw
         lK6Izcylt9YAOFr4h4ZRH5jMGdMqeMYbed1X/ceRG8UyAjyRxZzMhdwiFMwXTKfyi4/r
         9T6TXVmPYdXVdF/tp9zfSqc7ZPLUsnCSweN9XEg4xYuY5lgJpLH5FYicOwu7o4RFLi3L
         8StGbgKyargvbx078oDchxnskLDJXnay8y6KvQEwdqyAyFFDETkwZOB4YZB1fox1J63D
         d3DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz6YDpNaZRpZNjk0yWPIlG35giBy0PZNgzUTozSdMSTufrujwX1/l6GW71nBzGpaEKpsvphbTCb8RGwro=@vger.kernel.org
X-Gm-Message-State: AFuF++ntSZnf/kK5nTGuI5DDAOAUw2LXdaTUjnUqNSuxec51Dp7wUOe8
	4k6953d0R8gH6cW5XlLJm2Pt9+t52LPx0e+5u11Xw0C8ioT0twNZHp7YFb/c51SfwTo=
X-Gm-Gg: AYBFou3DgJrpqJxm0Uk7muFnUC/KQHbvK31KmCqQOQQChYeCfFMniFdm45qPpJw6IGd
	1g+RZkxodGPTNkSTTervr6PLpN9Poc04AJmj3KRh1d2u3AWWJfKiFWZOp7oM3m6ZsIBlljwxltX
	rLHi1dMHhRrPBs+cqOcPPvRFRGkUOFMoGVkOqUdS93aVy0KuFGzGoddD8qUT5ND9RyW5A04XfS8
	ZG1srwwnAqB1hppQDbSlYukkQSJ3HovP5KtkobQaxr7PXTQ4wXJ1JYJbIfTxFzt3looJb+GY980
	9UWiNmdXFW0qd3/bTH4Hg0iocNxaZ05oIFVBjiqgqIOtfE7Zlv+Ie/g16al2xb8709eWMyaqjme
	UQCqViyI0gB5r3K/LncruVRgYnUp6PBgOg+GHfTwvkdeP3VzbBSYcFgcgpqccSgWYLWZVwoWhF5
	+H2VEANEaOwbVFfNmMsJHg2D9TbT8WZCA04sy0aMnuugD1zaW2K/gX4sPn+7OtArFybS90Z8N6a
	MLVT2FuxSejLAfRaBdYJb+J+D+LMEk5W9sI7lpC1XQ=
X-Received: by 2002:a05:6402:a0c4:b0:6aa:4865:55df with SMTP id 4fb4d7f45d1cf-6aa5637bc93mr1670013a12.26.1789742906136;
        Fri, 18 Sep 2026 07:48:26 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3236esm980880a12.9.2026.09.18.07.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:48:25 +0200
Message-Id: <DLIIWS3MACOE.1MZFUJORZ6P5V@fairphone.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct
 config for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
 <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
 <DJTUMRRV8K1A.3AL1AMOF242DP@fairphone.com>
In-Reply-To: <DJTUMRRV8K1A.3AL1AMOF242DP@fairphone.com>

Hi all,

On Thu Jul 9, 2026 at 9:06 AM CEST, Luca Weiss wrote:
> Hi Dmitry,
>
> On Sat Jul 4, 2026 at 1:55 AM CEST, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 05:29:54PM +0200, Luca Weiss wrote:
>>> With the v9 data, the controls will have completely wrong names and
>>> using wrong code paths that do not apply to v9.4.
>>>=20
>>> Note, that this will change control names so it's a breaking change.
>>
>> Is it something that we want to keep as compatible for the old DTs? Or
>> is it completely broken and unusable?
>
> It's definitely not completely broken since a good number of devices
> work (seemingly) correctly with it.
>
> I also tried and I could make the microphone on Fairphone 5 (QCM6490,
> Elite audio) work even with the "wrong" v9.0 config, by updating the
> control names to the v9 names instead of the correct v9.4 names.
>
> In the cover letter I've expanded more on this and the possible options
> I see.

Any suggestions on how to proceed with this patch set? I want to sort
this out before upstreaming microphone support for Fairphone 5, which
has been working for a while. Just needs to sort out this situation
first.

The cover letter has some possible options (new compatible, new property
to mark the dts as 'v9.4-compatible' and more, etc.), but it's difficult
to send patches if there's barely any feedback :(

Regards
Luca

>
> Regards
> Luca
>
>>
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>=20


