Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370398;
	b=LjUw/LxL3A7mtt4c6ohCbxlvrX1c50AKSqvrNtOIhOGmZuCUwvW5TbsqRGTa93TbyZGg
	 1qdSYilYJhJD4Z4Ea958G+9w2ciSf3SpY696ozfAw9UuZQ6QmvFv+nBgZaOId0+YNi7Yy
	 dcTItX9rIvP9E1aql/W4s0f9dSYyBjEBlWIIUEaiVZOP2nVgukNOYGbXasqEIECqVbWMl
	 3ejBPr6sc5Xz2cBO+W4RB8s+wm2hYE3AUCFTU9DCZN/cubxfQXd28/d0GCvUX3q/Qg8TS
	 SD/IDnhiyndlsol35cMwutKR+eEGW0+RUI/PWv9+1sGGWhvT7sPpB5tnfIIAouVhpOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ngz/8e+OQ+7PO1cUE4Bn8qwAMjSe7McwIae/yVzjt0k=;
	b=Kkz+UqyhlDZrRO2tlOfhuqQZXGTvHp4Dk0ot80L0486k2X+ZXTRwaB1wyQM0kAoTLZom
	 Yk4x38DiatJCYGvS9Ml7g9GbXyZkOeBDAWa+4ftfaFiDYHH7ebu1j8WrvCzdapi/mnXVc
	 y0TH2LdgWOSkw5wkQsWlOGkBqLG66Sg3mkhNKJ4TUPx9EwqU7GoCGGEKWMVEF9QP8pPAm
	 t6SvEEjReqA+JDhAQBxXUUEmP4Z3EQRoFYUx/z8qm5BKm2C77Si94DY6todA0tCf/9I1i
	 qHZum8IEhwEoT5UB1CKtnniEo0sW8g9AxarsKBJ1HGFaCVnCduQtecOVCZE2YoQ3sSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S4f/L9YV";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D917C606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D917C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4f/L9YV
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-369fc2e984fso86609eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370397; x=1793975197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ngz/8e+OQ+7PO1cUE4Bn8qwAMjSe7McwIae/yVzjt0k=;
        b=S4f/L9YVktHwmAwIr5aqb70xLIxHish5uLqzxeQVEKNS38/CzOVWjKEnkkgxe59315
         o43RGGLK4DaWQRYJo2UUGpWGyMJccdix+xKWqp382rW+OtSCYjvPiTAeH48AQKcB9PId
         Aaupfkco8mDnKsK4UD+lCKoGBa+aWHKDp2azVmGcsVspoRDdIAbJEJlwPqSOw+nVb6hv
         RFt0OnWsSr1ZyvG3JAiynRdwVvfreAS1HgPpUAIXTx+zbLpYfLcsEIrdUNVrXy2MreB4
         KqqhMtjhJaOK/9W39sSu5XQ5KEbY42ZfvQe3UX4TTbdYnZSmSbx32P1YCzKYuQN5INBC
         1bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370397; x=1793975197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ngz/8e+OQ+7PO1cUE4Bn8qwAMjSe7McwIae/yVzjt0k=;
        b=YDr+AbBTtCbR3T/lf0oEF13RWNdjqKexelqhtyjKXslx27aR9jwpFCHI9J4T3bW1lb
         EgK2aP0VdTPHxVPEsayna/GpoMz2U2yn5170uUlll35AjSWpGs57WFXOip0FCtz4j2PS
         dAoSXTM2e3KzqRKG3nThyoGBAJyWIs+TOpnh1r3dKtvKYRMzRxyjLCd1IIj9pN7XkF62
         EqnNN8DOA4Uc3Op5+vX9C2CTrPE9sfsyPN65AT/GQZrBYGVGHwBiqeWqHapzQ6uFv24z
         cl6lEZB/H8lsLGh99hvNIfVcSVwJ6wOIsbFGadLjf9cjtDbj1DX3ZC0j5ks3yBAwYkK5
         VesA==
X-Forwarded-Encrypted: i=1; AKwUvBzYFr3eiBozbglJ4MhI3W2n1AWzIqZQtudYbDrPI99mZgTE1C2+mosyy1VMOylYAxC0aWT7Z2TnW1hvWjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgjpO4EFb3VUcGOgp0YD/dZhL37M5zkVEZkDX0yeZtVaT2+rOg
	7vz64HWasqE4bsYx52XODs+fDfN4e+mHratzRQOoJv9XiY8qPQGlrm75
X-Gm-Gg: AYBFou2o1PcvhhgpI5q/IESdDRjk2q8iIlD5gxyHzEhkHmVs6f2Db7ZyWkFcLaboQ9r
	FuIZVSvSTLRnKUjWb+9BZLMm1WN+9H5x1e5xzz3F4eD/G+pkBeQHcsixBwJHpLK8NVXgNl3x5WA
	mH2Iz1MTsv/UMnbqR+ilRBrf8o2oIF/DQAI8U366x/YFJs9twvSvrH/2mBh25wJh82+HAa7va+n
	ybbisvybUPo9QQJvBm+i0qxYxPz3D8XmQ4/A0ZXKmxJWlK+7Z+IkJDB8kVEifbglVEJO14FVZ70
	uGXegqUVU/YxRRgsFgq1uIoZXlL2Ks9GnZUhjqbgoIYxN4fZhlCYv1OdBwG/OEab5V5cQEgK2uf
	smjzIgAj87Y9mfiTi9OlUB8oZ474XtTvFER6USWqMHTw0YV99qb+Q/WrzaQ8OH3eiGqaT8zBBh0
	AU2qBJlqKeHqLGrf/x5dXHKee49jOR80Uhkn/wOlyQR6NNfl4s4ZZR/UgiMoy3E2Om1olD5tTxu
	oHRjZvC3yGybgO8sKLixS3MASEa1mctTFYvL3V+VrHThJcbnln6mj7G3BftVqq9BVeeSS3kruEj
	VRpaF31XgisEfEi32MSuNTLF3DgNCDOYd/lIPeMuZqyPJ27r8MmCq2f3W41buujwfmeVbDtAWPk
	U/IFp7ibrL+r579HQGbWpY+jf8ISgllC5j41V6JWgW+r2SF5G6zEVoPk/e/Tlw93WlnxDcunMsO
	Mdapt1vCbgfRvPBn8xrhQ=
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id 5a478bee46e88-36a4231f759mr6123244eec.1.1793370396659;
        Fri, 30 Oct 2026 07:26:36 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4293b651sm7330764eec.17.2026.10.30.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:26:35 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] media: i2c: ov7251: Move the strobe registers out of the mode tables
Date: Fri, 30 Oct 2026 23:26:33 +0900
Message-ID: <20261030142633.2235231-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAPY8ntAzJ=jA-c9LoLW5tQS=bpQZ3SfepcGVuvhq4cRzXvRK=A@mail.gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com> <20261026111032.88355-6-antoine.pichot@gmail.com> <CAPY8ntAzJ=jA-c9LoLW5tQS=bpQZ3SfepcGVuvhq4cRzXvRK=A@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Dave,

On Thu, Oct 29, 2026 at 04:17:29PM +0000, Dave Stevenson wrote:
> Is there a real need to add a new array of registers for these, or can
> they be added to ov7251_global_init_setting? As long as it's after the
> {0x0103, 0x01} reset, then order shouldn't matter.

No need. v3 drops this patch and takes your "Move the common registers
into the global init table" in its place, under your authorship, so
the strobe registers go into ov7251_global_init_setting with the rest,
and the strobe control patch only names the three it writes. Details
on the v2 1/9 thread, where you posted the branch.

Thanks,
Antoine
