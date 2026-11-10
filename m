Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279752;
	b=cQH48+5a/Ubdxi4yIIm+sATioKRJJK4vTIsQsRsclQZYoNk4qGvisKMF2sQEhmb0SmIM
	 DbtqsmTu+Tm3dtK/Q4C/8xPTRYPE/PT7WCRS6D5jhEY9I1EfQD4mFwJBFqkj7H7eDsUP+
	 /4rcQG3R5MI7e4Jn0ViwFS4dREa0ElFPj75EWT85BAyboYp6CxULcLu0Ig6uKStUGY5JG
	 AE8WeBB/bU0/dQQM0BietFg3qYY0CCdZ0i92XosaWTsiFf2ccSBRfAq7Two55gDDwtort
	 e9K8y0j1JULU26CQ1QOjq/Enc1zPrbZyYhgWzL+OwvPz4347Say6lVrjSkKnn9P5Zlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MMWgpEtU/gtg2eO84Q3N861jXy5hniFgHLN4W28H+nM=;
	b=wuvbORcCxV/41irxPc1iMLhu4aErwwwSDYWljpuDA6N0O3IzoO2jzmOf5ENMjQadADAv
	 lfaW55U0x5+Z+2Y1a4V3JMc2l2JQVKCasZ+TVlGKLanUSKJ0fraQ4ca2HykG18VV9JzoL
	 vTAq6VM2G1HRyYCYsK65BJFXnJHaMraqPtO+WPxwvBt+y7eGRG/sVbmKn30NJ91HmbZQC
	 U3bscUV6cU0beyZnkgSYsrMYxOd+Ja77gCJ+ujREp5q7nyeVI/e7Db2/CGY41jR0OJawq
	 mi0WZMMqHo2CGmgW/RVqGmPW6wH9tAdLjFdIf7XpJ5Ld0/uOIbbYs9bzSIYW7Hx6+jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6AHZfyw;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E602606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E602606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6AHZfyw
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so643208b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279752; x=1794884552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMWgpEtU/gtg2eO84Q3N861jXy5hniFgHLN4W28H+nM=;
        b=m6AHZfywnNj4tR4b0GSl9VsmXD/S9+IKtsaMttHTfmvLEyuNPBVaeyrC6lZybk4qL8
         AqMx4gh9QY3A2GXi3T3Sl1KNT/PYRt4E28B4bMgBHPvpE7qHNa9zjSUQsa8agsfCwv70
         rg3VXJLclS4/RPoqCvxawkhdJhW4+YtVb8a3tCocYcSgyb58EDQwb/CRyXhtZ7YHu50U
         ILsbhkOeFxUCYUnyY50nyNPkbmiub34akV5jNBJl99EPlJFmrpITtmnkiFhkoYI4kYmZ
         2yxpPHcz4RDp1ojO4rhUmZwwxUiuDbnGIAjqY3xeCnND7EsZ6c0yZI8Lm8NN6TZEN35O
         Ihyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279752; x=1794884552;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMWgpEtU/gtg2eO84Q3N861jXy5hniFgHLN4W28H+nM=;
        b=eERlNZjo02vltphL86alWx4nRQoLgeZf4GdyAY/ULNYKiZWGKcEDC/Wn4hrSqFzaFq
         o2dM1wrETVHc8AK6Bd4KWVBaEB7XuMLiF3uuqGj/8hn8oSAmVOm0SNmuQS2Yr1MzwHRv
         8x4hIuUbf5QTZniei6ZtMzDr1wmTKl5b9TmxBKNo9gjrXQtv+vlX5mlM20rm8pL3sHCX
         1/7pXfhdXeebH7AQwJOC9Oo/g0DRKA8CdNor7sFlEcdY9obIcySUp46wdIrHPTePyExX
         +hzKO7pGR+YNQfliqflqXhSKgQw3mVBLW92mRgI0GJE3JmtyjraGhEns/8NBhIumGUQA
         jtDQ==
X-Forwarded-Encrypted: i=1; AL+hErGnRPuRR/IjRJVgTtBZnZU+p16GNpJo5CNDg+hvZfzhNcdt+1q1eRo6yoZ9PV9rG7/DP9UUnyZS4jKUd78=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ebug4l/Urxbab7PjnNQnsrlE4ZORsAijpWi83ejhpQfQWn0WU
	bhQu6/9+9iQ91u7SGmXw17vSdHygvSBpYYv5ibTZw3+s+9O7j6KTZkhR
X-Gm-Gg: AYBFou0dYT82OHb1yAzKm5b4f5vXViu4Fgf2wq5Z2+H6TI8EEJUPtLQcimwTOPzHiz2
	1oWAppXALDZQXjc2dcBmsnVCEE9Lpv5kuks2AD9y1HWWvTPODsMceZTwgUAYNWfr90Vm/dsxRyS
	9lf1kEb+AcbXzN31tBJANcxVlJHDdoqUOkJf18jnf8lTf1AEVRUd3QuFAXzIPL0A04TTdtB2D+T
	51CjJlFloYccezRCSLOUklx/vWwojnWfZygi1yt4zZpi75qGPWe3SQoOvdzBo2w8NJqoe7Oo635
	MKDj91WBozdWiv1P8jRm8HVnG2ieW7U17gyugC7XXs8uAcH2B/VGfyC3w3c0xFUUteMLvWzZWBs
	S9Z8c7ippkV4EsTB5dKkOMtpk4Kd7R6vN+ofHtA31JFgZ9/K/WV9ugt4VwjejFjf3c2gQ9XxS4t
	CKG/+OPs/Ll8X0/FMCZImC22hLBWsr80z+UWXhq94XkmkYfDU3RPp3d3SaaMG7ScdsNkZc1Dkph
	S8bTh6wSVivhVCHgJexX4hu+GAfDPUgDaGbmAFRjartoLtF9XORweYkyCFAdAS6rLnpObqDUVX+
	EQiDi/i5TIQeweDsJxbKH6+dV78/zcUgY28q
X-Received: by 2002:a05:6a00:1887:b0:883:54dc:7892 with SMTP id d2e1a72fcca58-8ba876454bfmr1402875b3a.52.1794279751668;
        Mon, 09 Nov 2026 19:02:31 -0800 (PST)
Received: from ubuntu24.localdomain ([124.77.124.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab9d572fsm317021b3a.56.2026.11.09.19.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:02:31 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6] KEYS: Protect pkey method checks against type removal
Date: Tue, 10 Nov 2026 11:02:26 +0800
Message-ID: <20261110030226.9898-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avJ4KM-Erci0FkgZ@kernel.org>
References: <avCZIMCsZ4um18e-@kernel.org> <20261109055204.31673-1-0xbeac@gmail.com> <avJ4KM-Erci0FkgZ@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Tue, Nov 10, 2026 at 03:49:28AM +0200, Jarkko Sakkinen wrote:
> > -	if (!params->key->type->asym_query)
> > -		return -EOPNOTSUPP;
> > -
>
> I think I asked to remove this. I need to revoke my reviewed-by from
> this version.
>
> It's not relevant for the bug fix.

You did, in the v4 review, and v6 dropped the check again by mistake.
v7 restores it: keyctl_pkey_params_get() is identical to 7.4-rc1 again,
and the diff does not touch it at all.

The two early checks in keyctl_pkey_e_d_s() and keyctl_pkey_verify()
stay where v6 moved them, in the key->sem section of
keyctl_pkey_params_get_2() and after the buffer size validation, so the
error precedence is unchanged.  Only the check you named is restored.

Sashiko's remaining point on v5 was that this check reads key->type
without key->sem.  That is how 7.4-rc1 has it and you asked to keep the
hunk out of the patch, so v7 leaves it alone; the call sites recheck
the method under key->sem before they use it.

> Also if possible try to make a bit more compact description of the
> fix. I did not ask this for reviewed patch because did not see it
> relevant enough but now that this needs a new round, you could
> address this part too.

Done: the race diagram and the paragraph describing the early-check
move are gone; the problem, the action, why it is safe and the coverage
list stay.

v7 follows right after this mail.

Thanks,
Yuansheng Yang
