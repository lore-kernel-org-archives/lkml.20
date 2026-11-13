Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574147;
	b=SYBfPVroDs6EJhq92d5YNqpCNQ87k8sqyHmBIZkhbqTrJE+hbqFLMXQA1d4q12SaqtAb
	 49wXrYZVNpyluSI6zvMdW/kN5a459xQOEld4lMhDHz7Eu2yRLNegWId6s/HF9DhMsNvfS
	 7q4NqRZorYUOM5AccPWJF1uGLpd2EtzTxFjq5H7J+4MUuuhdBTTuqbrgifn4bQB65jmd0
	 wFBuTu2FcmaUG4+grfiQZOyvYpyb6qe02qEnEyykNxc9wvSc7vYYbDjYGZgnEfvCUZa5P
	 bXKifI4Kd1soA/LwIjTJBSrHiKH5fCjQ6skHx693yxs9VHz4pQk/zjHgJkMbSXDOnyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=NwQ8D1EwnOoAfIOU4uGhmCxYyPdinhr/Vhvd57u6TsE=;
	b=0cHbcylme0ShJZR+iCBJvQpwCETAu/1AB4rQczugg04Z+V75b6NVpDGtImOw0m0gxtPy
	 v2B1hV5tvo8cEZ3XAYlkmvcj2yFm207gJ1mAzIxpxRfHIFSYJaxeotnxxNXs2+vNqnJvm
	 +DgKvtIx9/cYXGNBz+YUHalBOElTY7Nkj+pdqE5fibYbjd0a0+5gJ4tKR1IPHfsjoFqka
	 YPZQKrQPPIJZ1mOcS/afVtgyRkVcSo3dovLmLkkWkRsKlPBLFxwSHY/msaKN566wJnG3P
	 d3v7j/qKpHYmSwH1hzvEq74Ve/XfxD12KKpcL1odxgbHxONubX8owSJjNmJttJcIqIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zl9miNAg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1300E606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1300E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zl9miNAg
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e635220b4so200026485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574146; cv=none;
        d=google.com; s=arc-20260327;
        b=ljjb1LaRAvfgndENmLooC2dC8ZTr9ZAWNrrPB/K6hLq3bGXnAr7CDrvXQyzeyGL93S
         p8tfOrsu7ck2Frgse2ODM+d36SRKSN9LS4kTAslzr/J0JToD7LxegPWzFmot8pid4Y3o
         We2iZi1lLUloxzS1egvrpM2cpDeLFPrd63VK1HrkTxNCgoqPXE7L+n8vapi1VDWL9M9M
         Y9HzGSuQsTF9/dKi2k3IGfr3fa7FIw3KQ5eiALDJW/cdwGoa/NklN/XT0GMd3ZhHG7az
         /5JgaWMnDXwW2vRY9/CJxs4XOLGAuuvv/jf6aFp41cd1oKJxi4IPkd7Po0Uo8X5P7mS8
         ARDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=NwQ8D1EwnOoAfIOU4uGhmCxYyPdinhr/Vhvd57u6TsE=;
        fh=j5q+Z2g0AQA+OC3iBhz5pFTYmrMJ41q1R1NP9o42OZ0=;
        b=VRYpvk9qnSo+8oVypw4O1ShhBbMtf185r45Km95aTEwI7f89vcdEK1EZrrJssNDBcq
         rkAl8aY9KBmuQ6Y+7heF9u8a3h0CbJEH2LknnL8JbSbAMdiEi4IpGW719TVEEv7K4uRo
         zwGOtHhN9XV8scX60xL7u8Sg2dJzot9cncZjYBprKyN5s3QNmQpl3StwiykjaUPbnEvZ
         SpH5fvu6KJhJ5MAAubaY8y91UM/Sfs6fbfF3jPzFFw+QwsOcrlJP+ZtThkWVOAbFv/V5
         kIS6WXUb7My8xPJ1m3eQ1g0SfbeAYF4Fro5XxtIs79jVSk1n2GMYDTmA7exkKlb+O3aj
         ue4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794574146; x=1795178946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NwQ8D1EwnOoAfIOU4uGhmCxYyPdinhr/Vhvd57u6TsE=;
        b=zl9miNAguVxeSGslXYnOwG9yKtPUn6UkC08k9dDoReOHppSFLVUuQ2R7BoOrZEe6LX
         1sfFTFsmV7USlMh3A4D6o4SXifjUhqILOQox/EqdxckMlRbaHQusTShidTUMc1vNpXBR
         +VKrRxyki30nYQGpY/a/eO8YOmOd3+cZyOiLsUSH/7zho2tr3VhVCLkr5AqdU7mDcMeh
         xN+nrZUMNF8s3ByGYjknW5MYxDnozo53lXj3jfD5I6HiTO0sX5PYaCqFWEAIFfEEM/41
         1fErdm7qmL5YsB6L+G5jyrpaJKOyqtPDIXDr6b7HADJBSTMOfHFgDzGw8i0iVVWJxlSt
         YoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574146; x=1795178946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NwQ8D1EwnOoAfIOU4uGhmCxYyPdinhr/Vhvd57u6TsE=;
        b=NFq60gpZF8h1dSZypLcFhUaFYDoTIIVkQTztpAnTHF2G/PyaW6foI+07YDcDBn+sJr
         MiYYjT9AxwnTiKiQF0URRU+AV1q2yHciIHmbySINODEFCkhYoiKnSSYODRvTZ9r4PJEo
         T75SQl7e1xnQhLdVw1iAYyH2JAVeThdTQnS9QGiTu6UxBOLpWxhCNIZR7E4qkEX/ZItA
         MciQzqtJ/Vyxjs/0PuAJRtb37p1q4m25CTTwgKlKNWfPzkDJkAsQY0dbmyoMnKlPGcRA
         AJdWYUVQ/Km+rS5zbjQk/VDOlGR2ftcriHszIBT1YkTLC1DlitYlya/sHIaBQ/vCx9WZ
         FuYw==
X-Forwarded-Encrypted: i=1; AL+hErEA3xt0yK71Hq/qfKqZjNzvrm4X1mSO1woYkUAn1nn7o+kHJrGPX0FhcbDtpX9PO+I770Kx4jyNCKai8Bc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nkGGVokSat+XuniMP3AVxTloDoA7TrfkJ2vwnQs20FBUexg3a
	VSufJ0MGItqcFjNVHO1YNXABNFjHYM8pDu5wmXyyPOCKpTYtq3PTTizii04ocxYti9Rn+ue2wql
	cBHjNxOVBxOJ+LLpyqpagBWvc5T9fXYc=
X-Gm-Gg: AYBFou3O/WTBzkUxhODNbsen6YdfTtJIXWj0HJfMpLKjS1nQkh03NQF4k9PknFW/Kco
	VpoFTun8ktEno2gFC6eXQfPmTAUVeS6YfARvlTPvKYcBbe5EBpIjTteWJWEUyqTcGdy/sX20kXk
	xwsjG7kzonQ92uEl0FVUSzJyC1gvUVSqbk4XLoKdtmFiANyfV4TpqCaqOtpQcMOzikVrzNeoWKZ
	47iyVoTuhXT/F41TuubXyTRxvDs8MWh9+vJmh/2ntL+UiH/Ei5vYX2Vvsuyvawoa1zDTNfzOIdd
	wFsXgL0wddmNEaA53XyS9hUmgD4hLbAqUejf4M+nvdE53/xA/QhJWeMouOpkU3cGAIdSR+hZH/W
	kJ87RZUAO1axCiHZFIpLInLZQQm1fZr0Sq7SzjX5VM9cECCbH6b/qTMAWUGvFMxY3F9jcm+eTvb
	k3Dyt6mlZWlMSIgG91uUg=
X-Received: by 2002:a05:620a:439b:b0:93f:35a7:cd4 with SMTP id
 af79cd13be357-9494bc708femr325677985a.67.1794574145807; Fri, 13 Nov 2026
 04:49:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Safocl <safocl88@gmail.com>
Date: Fri, 13 Nov 2026 16:48:54 +0400
X-Gm-Features: AclHuK9I0pUXMCZetGIbK0irNjyBy0wsv0ljGeBHbPzBy02IfH-vabpLrKs2rdo
Message-ID: <CAJtzy8+jMbr8nPbehMGRVHa4fQWJ3ma3MeZBHDM6Cm86g2B8tA@mail.gmail.com>
Subject: Re: [PATCH 09/10] sched/preempt: fix duplicate extern declarations
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Safocl <safocl88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Perhaps it=E2=80=99s worth making a change now to ensure some consistency? =
At
your discretion, you could remove such `extern` specifiers for
functions entirely (along with `asmlinkage`), as they are redundant =E2=80=
=94
or, alternatively, remove just one of them.
