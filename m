Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540873;
	b=ZQ9LfduOdN8N2hkkyTUPr7CwfGwl0JfkgQcGWCGQcShUS/tUExu/hqt7bmVr2ek3QWrI
	 inB8IKa9Ds1vX/95iV3+kEdAcuifHMOePBHMXu77BIJSQP3KJ0mhGU4KQuVzWDjkAeeIm
	 Qp6TUMlJX2zTBeFdwu0DxAbbr0CusMksvaF8dmBlT08J0TDiXivTcM0zi/YxRZXMdWst2
	 jroqdtPOAVl1uklrYuE9ddbol2+tVUMm4/MjCar2DLHz9cEGuwnsZr1edqWF3Tx/9K1mk
	 cfH08qEP97aCifb3JiujOLjwlZBwtpDRanqKvF3Q1XvQHfrX1za8DxJH6DcoO4BSG1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=AEeiPsA/EawKKYb8+qMzkwfuJK4nmSs/11TC2lwYs/8=;
	b=GOXS0CDodG4RQUDKplz+cMloVnQDMXHTdMeIH4gN5T8tMhHNiFRjehoeTY2xfVBI/95+
	 cpPpng+zgdq8W3MShNDQOvAIfYYGhCP7mTyfViM8mcbDYFiHMSfX14TJe9R7xEFQGLJch
	 qTbGApq7GPL8WZHB/yaD8wItSn9vDck1ZoL36duMhsnFlDkG02C3decB8gGEJ8rlwDoj4
	 TIH+1JdVP+Rgps6Lk3e+zds4SjKlhXO6CAwimn+iM8S7O53XYKrTU7L7Kh3y6ICJSc+XW
	 bogVsqhPdxS3vII1QSv87ecG1ur8cmf339T7fUaIVcniydyAlzy6vfIZJNvK1qjHK/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4qmef56;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920AA606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920AA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X4qmef56
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8b20a899fso690045ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540873; x=1793145673; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AEeiPsA/EawKKYb8+qMzkwfuJK4nmSs/11TC2lwYs/8=;
        b=X4qmef56mV1cGDB+s8rxjvMjWgK79wD0teCYvWaCvGWcBsW9tn7OKw/eFYtriNtvdR
         HKc0+D0iRvbEum79CeELLv2i66rh4M1mHINIpveCbd4D6xZVVoeMFr+EI3CqjQi20KYe
         +Vwll+GwtZL5zEuusqxNLqLR5a8ZbFreBlwDmo25kL8DotyYDjR0nye+wTHO9oyR96lR
         +SLVbCk8XUPB4wTaWgjsVBkhk1kBtyQzhwBCJWi2oB6XDlYJGOHH3S3PtgdcWYgcWq2k
         v3NOx76kt1gqlC6ElSLHjsAn2tK5fx72EjQ1DMUtwCDbHZ5t3Qzjvnn2UQ1MtT6NOj53
         LdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540873; x=1793145673;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEeiPsA/EawKKYb8+qMzkwfuJK4nmSs/11TC2lwYs/8=;
        b=IMmqdSX3yJJr5LHSI8m0X/PDzCB2eiUyTFC6ygoZOtfhbgExHLZ13f9jGoe+5UHNwA
         EYROY6BzEibIFzg/r+by54JGWpruINTviREl2CPWKZvtQV2YHSSK24zhUrOhbRza/QM7
         Txzd2Uwul25YPMOQxWRBxd7rcs4/sHtimbG0It3Ss2NLubOCZenrFj/x1x0ITCt+e+JO
         WeEaJ8IA8e45xBQfUlrypmHeyFvSumnISfCoDA+gw+ZcfEFYya2dEC675AEiRX9Ph0DF
         GRCXseHuH5REYJoXkjUMu4a5rLy+Y6+jkIftUTD9TNEkhoyDR4nyKFitvm2N3D2BQzMB
         27yA==
X-Forwarded-Encrypted: i=1; AKwUvBzjOSRN6r39FxikPbgMsefL1uhynhFYPHJo96GXbhjcnovwxhpWaE5yQ9H52YSfF8JI11y7M8y7Gq7xX14=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4mUjRI2eBfPTmUIqO3BJ2vPF8fic303UxL/IJSENBciPfpsnV
	C6fsqkRcK5qmF+25TlaoDSVk7Cdf+pmFeneXmJ0nGQyUF5eu3VC+5mzd
X-Gm-Gg: AYBFou3f5z0x+9B42MxIq3KPyXWoMRTrrkRzb34XeYnZ3Po9NtRYjnOkNDrLad68u8b
	F7qT73PbpfxhdQq/2OzCAwt+rfz9P49UNhlgoRDfWEebJKy3yyWuMV5v6iiM7saVQLuNfTbvsZx
	ehe0mJvRBcF2CNiydEovbsbNB0RzXDuDGg1NiHU+Lv+XU97bygczvYE5AEfgosnKHKuChxFMWiC
	8/bVNF9x0NQi3e0L8nJI2Zli+b6qjHT+UWkSNXCMW6IF+GH3dBX3C2Isso1izF8b53PIjKa4ETg
	yuxsnm3ymrhiwxXpE5dN7ViLyD2eSGFTztRrVcELjxmVBR3f1OTwyF+BjIf8sQGczMjq1JXTAYN
	LMjnpO25cGpu73IFT+gYUoE+pYf90pqDPi0feIQlHfK3IteU4YYTdKgbcJsXPXqQBZfLuVrz391
	wFTMyS3A/d5PpNI2YbG2iSq8NmZBFCh9f/xVcYyyKEDXaizkxaExMsT8UZu0p4ylp2Fl+ZpE2/r
	PhJpANQb06sWgPSWNkVHYhBpThnE51GG5Pts9vb/csjnog5bgcdflQu8UyJEHJbhXaB+GeFdBy6
	qJbDKbLOgUL2GQ==
X-Received: by 2002:a17:90b:5310:b0:3a0:c3d4:f3b2 with SMTP id 98e67ed59e1d1-3ad86cc126cmr434607a91.56.1792540872776;
        Tue, 20 Oct 2026 17:01:12 -0700 (PDT)
Received: from localhost ([153.61.198.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802957d3sm1536060a91.8.2026.10.20.17.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:01:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:01:07 +0000
Message-Id: <DMA2PE5NZ5HP.3DYHQ3DIKG0OG@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v5 0/4] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Amery Hung" <ameryhung@gmail.com>
In-Reply-To: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com>
References: <20261019-selftests-bpf-struct-ops-assoc-timer-v5-0-77b2e181e5cc@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, Oct 18, 2026 at 07:27 PM Qiliang Yuan <odys.yuan@gmail.com> wrote:

doesn't apply anymore
