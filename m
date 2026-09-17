Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B845D19F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630091; cv=pass; b=CHCrjcULQs3xEdLcy6k7f/b+AMvBfA+0GeAeIi2Waj4jQuHyIg03y2L1TpOetLPYDHLiF6f8ATTpTYG/GEylwHL4rnL7OPYdF7Ar9KqwNoH6WUWQ+rjV7SCT8jOFmscvX03ISWWToMzwgNdJZrMH47sDR1FmcxaWYS1S6iZduYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630091; c=relaxed/simple;
	bh=05elrYjvDIKm9CUVYbNesPAN1KsoJq8Oh1BztpkYF+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEYTyiBeS1vBUgQvEXeyCJPriLj2/ZoyVC9O9Zc+OWk7CPsHudL5of8R7rd2gdkZX03VT8CGJfdhvtpxydIge2Gq8y2UcskOAm+dOf+wK2gzVUXrSMajps6qS1Vkd4QMdQqZSad+35crlBKFsW9AOiEbx9lk7qLWdNaG8tGOyzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=hU45zv8+; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="hU45zv8+"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso423149e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789630086; cv=none;
        d=google.com; s=arc-20260327;
        b=r1RXoDGb1uh2Tj9rpsqrKUNGsNmDEVpcQvM6DJkUKmoPbxm3zlW3X00j0/0i1GGpXM
         JhByXPV2A38MnivWW9ivy0oLMKeYZJcPC934pidYkM3MPIzu5gL+YnlUDu4GahgN0XDl
         78MuhB4aps47umiO3purivmdDVLqpExKTrF5zTpAZjFxj3Uu5jxiFoSAAX45JPWWHel1
         OgAUV8J2tpO6Thw6rbHvfc2TCa3jJEeduuQvJuYnuLdi0l6RpJrZuS9tXN23bCszP4Jf
         DrzjsAT58x4W772vodExOX2E2B7WinJwhcD+Znjdj7CagUdPUMcKvMGwEqdpMu5Ha/ap
         Tdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=05elrYjvDIKm9CUVYbNesPAN1KsoJq8Oh1BztpkYF+4=;
        fh=i4HPXC3MpW6xH6KT+Q52HmVVj7Pv6j8WqAlebl7obMU=;
        b=h6qhklr5yui1Nn3nmd1defgwv0yuFYC9qU+2Lw8lBlUVd/CkX2+UlqIsjRzZuJesj1
         MsOd3Sdlv9HRmTkdoguQI4f7UGk3M8LYTDaGrvvjH2f2wHUEp/wc6NRqlcQJ/QUcsdkj
         rNvYpvHElUcGBLMmSFEDdIJhTHf0VTm3yaf3w3PQHxD4MHTCnDPouDbz+zdW78V2t/MJ
         flukShzTNew6FzMF1R711kkjtARMdqt5JSG0aCDhEd8zlANlhZDBsxzi6U9vBMrsBfGi
         jLUOwEuWDzhPreCQs2RrUKqqWf7j9wo22Qg22fIWmlrjJ5KjOwPE/3F0BXh/Tdxdg1X6
         OuTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789630086; x=1790234886; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05elrYjvDIKm9CUVYbNesPAN1KsoJq8Oh1BztpkYF+4=;
        b=hU45zv8+HX9YIvOrWXix++fNDtlyT7D9kKeMFKGiRd4vYZjbbWplbQGjITGs6SjlnV
         s/nMD8ODpqMG+TrrN1Ob/D/2sMibF83ZrYJUf03JB+d2DR3NI7bs4guQxatdzxq5M8fe
         3rl6DJx7dNVNqHsw8dqm4EUwN/GY6kVYg/vHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789630086; x=1790234886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=05elrYjvDIKm9CUVYbNesPAN1KsoJq8Oh1BztpkYF+4=;
        b=sxGzSH2A0O1JxkSzZbqngYy+rLFvSGerq3b8E6qIaMket/M7RLhbAYrUarayO2SmTI
         hu+pj837/Oi6LTLKnR8+2va71LcgNhyhWkLSmO2vREu6NnBnYQ8cpnexEhsQa3bzDQdc
         7shH+uJNenWJVqxkuOLtTfR0l6+7W8jOttEiXW/Xmb+vjIRoKNsbgn4ttwRVmGULuZUP
         ecWAlA0R7biZV8oMHAgrXt/o35DifL3XFM3tI/S2y1T6TpZNS9SNOrcWpk8HpsYns7lR
         ZpMDLr948GkPHqwfvk/VZQM3MhxE0ObAbwtszU+IuvmThKz1UM7TYb+yvBsiJlP7TT7v
         7fcg==
X-Forwarded-Encrypted: i=1; AKwUvBzWkLpZbiMpG3Wu63CJePEL6EHReLp2/9yYy0vkL4hRSGwSMEVoTFXLZ7KE4pN2D/IQJfHXndMOmcuWoV8=@vger.kernel.org
X-Gm-Message-State: AFuF++nKoyvZ8JzMcDMXrxwfQjur2GgEsa1/op1Vp5ffVixVu44Wu0/+
	BpBNgwtZnWHCFBjBkMCew4jWUNDAJNDdrrSGPDq2glptkk5ugBHOja89idZXw6YSlG1GSBoEBfo
	SUnVzeJ23tbeq4s41qAR4joW30VIfCAimXi9iLbKadw==
X-Gm-Gg: AYBFou1N8tYo8gomZGiX2sL63fG/d/lLOPb4Te/P7/xP0CDtyeYEySj1n08vOhg9lJ4
	RJpBKpkTx7AXi+zhpVEdlbvms6e51M9CCgrcsWIKCZwLdhHY7wqkcfeJ+p/0zhaOwLq0oZBKk/8
	/829jeKCrKAe3yyJavivHS7guJFcATzE6irdVuJ4BOsWR22QaUXYt7Q9drKJ/IhF0ZKjYViOhrb
	DsGQtuqjjD27s93CfKQSx8cPgUm6/h38YtltleSbp7IMX1MJXMlZwwlA6Ig3cHdiFRqEwHHE2Yj
	aU7X4xg8kssfz4WsiXhmjSbdfqGfYHudA6w+g+GoZDOdKLEOfIP3e2w=
X-Received: by 2002:a05:6512:1189:b0:5b5:fae5:b221 with SMTP id
 2adb3069b0e04-5b8b6605e9cmr1614229e87.14.1789630085986; Thu, 17 Sep 2026
 00:28:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-codex-rtw-rx-v2-v2-0-f09c964e0b96@khu.ac.kr>
 <20260913-codex-rtw-rx-v2-v2-2-f09c964e0b96@khu.ac.kr> <b235d4ac6b8048c4916f484082654c48@realtek.com>
In-Reply-To: <b235d4ac6b8048c4916f484082654c48@realtek.com>
From: =?UTF-8?B?4oCN6rmA7Jqw7ISdW+2VmeyDnV0o7KCE7J6Q7KCV67O064yA7ZWZIOyghOyekOqzte2VmeqzvA==?=
	=?UTF-8?B?KQ==?= <5mghybrid@khu.ac.kr>
Date: Thu, 17 Sep 2026 16:27:51 +0900
X-Gm-Features: AcwNN1Wv6zk9_UT-AZSH9kMTavg-5odm45cqC5oVbIByww0dhWV62MKE_I7qvb0
Message-ID: <CAH1Bc_xVJXP-p5sDVSbD_9=vO=pZJ3bj3nCFbrMmMkM_H_GedQ@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 2/4] wifi: rtl8xxxu: unwind incomplete receive startup
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

Thanks for the review.

I'll share the RX submission path between startup and the RX worker,
while preserving the different handling of fatal errors during startup.

I'll also remove the shutdown initialization added in probe. For v3,
I'll test the actual start() -> error_out -> stop() paths with targeted
fault injection, including failures at the different startup stages, to
make sure partially initialized resources are handled safely.

Regarding the Fixes tag, this patch addresses functional startup error
handling rather than only refactoring: an allocation failure can leave
already active RX requests behind, and a later allocation failure can
also return success with ret still zero. I'll make these failure cases
clearer in the commit message and include the validation results in v3.

Thanks,
Wooseok
