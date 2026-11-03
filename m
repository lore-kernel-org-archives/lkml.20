Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724702;
	b=RtzXBQfP9SlBz8WOVNEWd4HFsZC+h/UhDD4t6Cu/3obQjUgr5O323jUGpvxhxFpddi60
	 ZMhAy1ElkLk886zfwjCx9IwCSCRBoOzXsadqREvO9T+Ov+QWVbDHtFiTEn/Hzves9CDH6
	 AwVnF1Q4WNY4iwUPhJj7TjUz83yFp3aVO6jQQeCSZk9D60LN+6/pxWAPudbD1Zu5lYL0I
	 oOJTi1aY6NZ2SpxCsxVuUrEMWtIdjUYXuVuK/iaZYSWfsq1tQ7biNhdDdA83BsErxLQuu
	 fHUTNUXXa6NzTCuWP6sqUynoWMb0kacmnZP4lwGxGCrkbD6ALNlmk/Hp4NtGxESsqzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=z/+aYEPLoBSp7AxjoxxgYR8cgspXFyNdt6Vr/KNLDmE=;
	b=lxV3uO31YUoQyRvO7E2Hj0CdwYyJXq7hlGqFWhx/SfUylTRPJmFmWvqWf01fJ/PI0dA/
	 o/x1Czxw28fW8sfPixHNtf2yHorS5xutD0FoDRQ8fRGlW3xhckGfi2O31cWIhPyIF9YoE
	 YBw8/4ZbMSwz8rtiIkjWY4pPGxtBcgW3RN8WCgLriUjVp8Ldia858Go5tkOTiTyY8R02B
	 rlVEWVxssn17L4znOVVx31K9Fqt0iY7Vmt8on0xQGuvBAZ1QPfVRnvPl37ZK+qb0/NA0D
	 MbsrxU84vXwOhhZ0ObG2l6Fu51OqfhcsIxNEki42XIpcLCxLacC9q6hU/y80tp23e5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTIFtqdT;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C5606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21C5606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTIFtqdT
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so2940232b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793724701; x=1794329501; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/+aYEPLoBSp7AxjoxxgYR8cgspXFyNdt6Vr/KNLDmE=;
        b=eTIFtqdTdXpA/AfqqKkL10HIQZLcduWeqawGhkY8XSlpOW7wAg7SwK7IyckCmAeC8z
         QZEJnVKKbFm1lme2SYMMxv1HNP1Njw8KJE3QtzbovqqCyntSjZr0OxFCZk8earTy7ZeP
         s5VZOXYH++PjPF1kTEA3lESRC8qsEpTcVQUri9WLAkuFv2cuZix2S1MDadbIk2gWxXcO
         a1CWIRWP4N0snge7OVszIUi9zzUBbb6XW85sc28z+DIK0qUMW3AE1Bt1XJHJEohjeBO9
         ub6LOMq+gg31oFsCGTjAhEdvsMpjkdKA0Yw0Eq/2gp4qZRvsM2ML5GSPlkglQB80sBeL
         ogXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724701; x=1794329501;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/+aYEPLoBSp7AxjoxxgYR8cgspXFyNdt6Vr/KNLDmE=;
        b=OHtrF+wvU4lGwg3k9kqQ9Z/txlWaqTag4GCt/9+5zbTRfnSqy5PJ1hIm1x3mThNhit
         vJHox89YwG7Yo0ijhRD6oCcuWfAUgdKObcO47TQg87uuGBZ4E8I+k6qcp4Pg/hlit+w1
         lQfq8DUdZMjSi4UbTLMjEV2Ygcth4lNMsV3HZDo67NWOsf+DgZDofRPcMSZKj7udOCXP
         GC0RH8sVHlWer7bg0J4MVoTuQ9CV7QOYO4DsKD2qikgWUwPySwk+U2CmSMJJawIrxVC/
         bhYuUAChVo/WT29Vn84c0pz8Lr9EKiWCdE/4LepoWZAUFiY/c94LQoxd78dsQz22qv1X
         ChGA==
X-Forwarded-Encrypted: i=1; AKwUvByImZ9oJEkKXgDqdbPlpqZsPzABDm3i5qNXjp6pvdUK+5P2P8JrXlM2+tuESTEbl3X2XOTJlDjqe/INUhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QReV1A3qkeif01S++xT3GTuRz+zhZ8uZBRs7jCAFe67A+NE5Q
	ua47JH5izDiFLsiZ2FMlwj4Y8IMbK7mRcPXYUhjF0oOsZTRNB+uQsLjv
X-Gm-Gg: AYBFou2cRdr3X4og4qSKuq2hauN0ATNptReot07q+qsBYjHfnDoaSvxOON0b2rOV9Yp
	NKcbmBTy/aYybO8lIZbrrFK7GU8C2y1DGt8zY9xqYTHnslwDzHntZDhTllfsWSBHFL609dAbWTD
	Bdk3Ih8WNw9eqGEB987g/rNHe8uYBmT71ovxBNwY/+q9rd0c+9E83/fZ/Lp58Xgd2UiYKiWqzcq
	sN/mBSWTmPWqEsmhinX7nR2B4TIEZ8af1yEEB4TTK6eyuDL8HUcKltKfLQDY+UzxepRAQzEBGHP
	NSlmnygQadZ0lbVGZD12PLfueyiwrwt4XoalY+3oduSd5ySS+wjQGTmN9VFooL3JMoiRNr37NFT
	6oYaIZ9DUm1YA4UbwvB5z0Exf7zpTghUUH3t6DInVPIYlEBxMH0bpNi96GkCi1ZyqvbAQAX6U6z
	mBJxXFdq0zcSa5UlXRWzB3lvPJ1H+ek9e7FBG743aorJuuTGhxYcvqapDnHB6tArNTL140CqDhg
	t85vbbLIR42OPQPqfRBTSwildKOy/mNqL+UfxZj0EwuleXNgRoN2N41xM2mMcf6nnyARFDujlof
	FRc8t76d2vPsTwWwAFjv74l8iqibh88CUyJGRt6B90ciG17VWv1C7ZtFLIS63QSopEr8ErGvuGo
	+7HCtsU9R1dnAP/sWdKfGHBKu8WWGT8MA1g==
X-Received: by 2002:a05:6a00:3a12:b0:8a0:2cfd:87cb with SMTP id d2e1a72fcca58-8a9bf90ab27mr11070101b3a.43.1793724700510;
        Tue, 03 Nov 2026 08:51:40 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fccffsm3794904b3a.7.2026.11.03.08.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:51:40 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 16:51:39 +0000
Message-Id: <DMLQC758A2C3.175VOTFQ2Z8HD@gmail.com>
Cc: <cgroups@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <daniel@iogearbox.net>,
 <linux-kselftest@vger.kernel.org>, <cuitao@kylinos.cn>,
 <ameryhung@gmail.com>
Subject: Re: [RFC PATCH v12 1/4] blk-iocost: add BPF struct_ops cost model
 support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tao Cui" <cui.tao@linux.dev>, <tj@kernel.org>, <josef@toxicopanda.com>,
 <axboe@kernel.dk>
In-Reply-To: <20261103132613.1952975-2-cui.tao@linux.dev>
References: <20261103132613.1952975-1-cui.tao@linux.dev> <20261103132613.1952975-2-cui.tao@linux.dev>
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

On Tue, Nov 03, 2026 at 05:26 AM Tao Cui <cui.tao@linux.dev> wrote:
> @@ -3223,7 +3306,6 @@ static u64 ioc_weight_prfill(struct seq_file *sf, struct blkg_policy_data *pd,
>  	return 0;
>  }
>
> -
>  static int ioc_weight_show(struct seq_file *sf, void *v)

Unrelated change. Tejun pointed at this hunk in v11.

Overall makes sense to me:
Acked-by: Alexei Starovoitov <ast@kernel.org>
