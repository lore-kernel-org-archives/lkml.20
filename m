Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936674;
	b=ujXrsH56YxTRgIR0wP9GtVSKx+8PoeboUlcNnhUicZcsLBKT2qhfmiCkm7IOx6XQBJZK
	 GqjwyUOAx+cj6CQ5ll1EsOKy2Jm48Cbja1K7qIZM+C1ZcNOOgn1swpRyC2iK/SYlnqONu
	 JftEJlivkRSDvI4JNa11NpyemzoL0uMOLrRyQfKDVbGFhc9TU/N1x7Y0k92iIts7hl5Bg
	 +VfKyevX7KXV0H7wacKVgq1KLCHFZu5ywWV7aN/vHEpaWSI7t7btW1t4yPl/trybxdlt0
	 O83GQKP7Fpiihx7sOK+o8kRH6joDgT2kWhlHqn4V9nLknCsX+Ec6jurNjzEovGuKJKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sXEhBct+PhNYmN9lYZyMJ4pWfRbHwzH6Rf46QPmY3Ug=;
	b=rZwtfVakJPpBEd2NcSyAkvvrrmdrK7+0fcmHThyOzb1lQrjPHiRbHynvL5Omltmq58al
	 wV3fDejAri4E7ADoFGakTwF/C+v9pzssM42Lyul0Lrn8SYIDCIBZAfrJjB3zXVD5ztw9l
	 HufrKRHpSwnET4wewbPBoFH9Wn+7lBN/PateZqQch74S8+veyhNnhaDXvqEh3YFqvuq8t
	 5uVmD1VyDcEYpNbHfMOM4vSw6bpD1CxrNE/ILbclFO7dQ6E8GcMsqcd04Zaq7HfjXI9tQ
	 7dNRuuEWfMlVmv/RcEXVnhwhPS8e/IOuqsfUCNsLuvv+cYpnbbh/YWioojf/tJk5GDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cZaNp2lm;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17A6606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F17A6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cZaNp2lm
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4067145eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936673; x=1793541473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXEhBct+PhNYmN9lYZyMJ4pWfRbHwzH6Rf46QPmY3Ug=;
        b=cZaNp2lmqMZzZ4zqxwOg/YylfAdvi0UI9cps+A4iZdFRXxBcE+FAqGZ8ra3rhNbbkk
         ZAaAK/cTbvgDKdNObP+tewFrPIy0nj2rxrkOer9RjypGIAMQldA6DaN1EA5dRKj8NE+i
         OcihRazayK1/yJGh9PN8WLBWNGiF9jBkib2qPHMAXLDPP3M/tjkJBqcave8gLtbg+byI
         oa1ouMNLZoA9tDDUd6ZhhZ6Jb1bsnQI2VQ7pBwxEmp0r3EifR/+d0EdAc7jhEkAC4jrm
         f0QijZNQkAxG9qCAqThFhhirZx/mIEelwuPNP2c1nQ+qiZplUcXyQ52uvfMpyQWQlLSz
         FPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936673; x=1793541473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXEhBct+PhNYmN9lYZyMJ4pWfRbHwzH6Rf46QPmY3Ug=;
        b=ItM6b//pdQxxqvUWU2adzuTHF3hJl8ZUxldbG9Ac5dhSTuRj7kXDex21eWbl+1O7tX
         1d4c5GMGdAT+HlToMgtDPI8PM9zOeLNyeaUNFXBpwyhm5txSnDKmi5wyaVEW+2f16V4+
         yBD+5NKvYUVhUtpQ0KeVbM/8uCE5nszufOwSwbdoY2mxNKE2fdAq33ZSL8d7vsqPuJeh
         cyLHlH/wwzU1mxjx9EDA20Uhc6mydmtINqiHGgqg/KgAJemHixJBsEPUZKFT4SmQWCzB
         3Os3o/cLurUg6y+avEbuKcKDmXNxEp2JWpcix0QepC/WLKvB+nXszXHkNgAE/Tf+wK+V
         PpFw==
X-Forwarded-Encrypted: i=1; AKwUvBz2tyYKJR0VltRImYdjWPO+8WNdCpqSBX63Mi7x90migFn0DU8wOwlQ5WlzXHfc984OZNwPvByocDdkdy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+WN7L7c71f5WzeuubBQUHiBYOTI1Wt+EGwDewNEJE10N9l5iw
	9uBQEWDP28MCHotAg37QhgZaW3f+wAtwQRcxpznbP3iEAVCMs/6xlsKo
X-Gm-Gg: AYBFou0CbsnT0dzNqq/J8EkOKsMzd+Cxfsl7A4B213I+ji1hJkwj3oFQLPopHm+ufBx
	yhI3MXR7Sv4ESOPhYC/2l7G/FK5xJI63aFSuEcNEeWuyCepQy8ScfRrp+4zX4Rc3WA5JAyoPdVz
	92X2s28Q0qnMe42gN6s5lz370DEO/HqhvMwz97yQekEQ6yyLcGvfThJigXptZKBL1lf4ixa6dER
	WBt3rlMkENgrjCvgcGjFqJReLWX/B5aDQsjgFO1ewoHeOBCpi6dV44LTQAYyHxgFWl1VfrgIZx2
	Z2SMAtIfCyfN6aWKNF86/RuhZLOGUd3HTIedEn0Qr85otI1JLjSL5dqUHht0tQNtpWbsXxOEqVk
	ytx1ueepvapmaxAQS4yavBFj77xxyVpgRG+TvGiLPiX0KZD98AIhNxPkkf3rqnxP5aBg5/G4wZP
	9reheAhtzO0sI2lPIh3+EsBj7TX1HGteFQLieyhShiyLONIVJ4yDqMxCZqjK/m2sDswR6j+rWb0
	uYFvZ0Wc1unD0GngY/QrLb7I1ObI2HaJZ3w6KJuWzt6fpylMgwsW2ndyfSxbDeUhww0KF3yoWD9
	2QmK4XD3KJgoNQodRXEDBqmI
X-Received: by 2002:a05:7301:6195:20b0:358:eccb:af79 with SMTP id 5a478bee46e88-369e850e3a2mr6198418eec.34.1792936673011;
        Sun, 25 Oct 2026 06:57:53 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d578casm18897783eec.6.2026.10.25.06.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 06:57:52 -0700 (PDT)
Message-ID: <17b1aebe-9621-460e-8e0e-8d4da2912e74@gmail.com>
Date: Sun, 25 Oct 2026 22:57:49 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: wy@wyuan.org, jani.nikula@linux.intel.com, alexs@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 si.yanteng@linux.dev, chenyou910331@gmail.com, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dzm91@hust.edu.cn
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn>
 <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
 <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
 <CAMAsx6fk=k1aXT3gvyZ4k8hG9KN+YCmvEc42LGdmm3Y+p2J1_g@mail.gmail.com>
 <8ff98b43-248e-4568-a5fc-6f84f9cdbe33@hust.edu.cn>
 <CAMAsx6fha-ZKkiph+nG14hbNduGs=G3qRjHNUNxLSktTTQY+gA@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CAMAsx6fha-ZKkiph+nG14hbNduGs=G3qRjHNUNxLSktTTQY+gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/25/26 22:10, Daniel Pereira wrote:
[...]

> - the .txt files in ja_JP and ko_KR (stable_api_nonsense.txt and
> stable_kernel_rules.txt), which I think are for their maintainers
> to convert or drop.

Yes, I will take care of .txt files under ja_JP/.

Thanks, Akira
