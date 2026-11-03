Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793723062;
	b=IlM5HjKAedTyU4vswT/VjVVbq7YaVWzrbouJqc6pLFOVECwZLLuvCkzRhm2RvXuGe72z
	 eBFH4uP+EzrMWVlN+RcEckVvscdHqgrFtDftqXzhH6jwFBByHHqf8+++FjndBGY+Xa3R/
	 0RM0qwYk3DrzVnqmYHWH5zJzQt/xMwoiF2AjmGSTj21lMH6RfeeZzsQ3LP6nfMg6mOnDm
	 VjjqoV+fhDL9G9ShiZRJp/TB29JUGDLdOUS1ickXHCLpTiNxev7n4TiQ9qaBP+v6JosPU
	 b/xRA4a00UFpXyFVn02J+htKaUbvsp2ONclW8IuGcekwMUYBXL26bLTFppYRs0L2a4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
	b=OXGQlQmJkmKX4InbBDsV91tsI5Z5CgAU3jBXiDbWcoCTVWgVdc2k6cGRjXzN2acwSJ9M
	 B0ZBi32tUQCMgXDLcT72KFkx0Wo8jHSsYt9uzkC0tkXGDtq1KQ5/HNDS/qfkHCq3r+Ya9
	 nAOhFjuKtJkVfrU0D/5/ykqf4ibdx5H/5yqQmtN77207eWmfXAQPzo3em8fQnAlkiePZ+
	 ODZezPaGgyhuNA+AYSmKgFaZBtLknP0kb8ogDZHkwbf2ArVIhWgsTcNwPB4KKqc8azees
	 ZbEqfyhCFLGBCvV22fC6yHNSh90FpkFEs1vUpchBs7KK7Cwtv2yogmMXYPS6ZWqoV9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gyQwWXPa;
	arc=fail smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3882606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3882606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gyQwWXPa
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018493d57so70585e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723060; cv=none;
        d=google.com; s=arc-20260327;
        b=aWQbtDzvphrC3xPMTZPMUdKNT0jAR3yPk0rewrI5BLycl8P53781RKZxfcs1dq6oLd
         3rUHnDq7iWeEs16A+KyFB8GajWfnuXBnKGzax7o6WbB4OTRwBTcfNESUy5bpXXf8kW79
         mFsd/UR5AInCbgvPBbL/g0fVkDvcQF909mWTFG5coHowsuu2tt3TIrNbLd8I+46+/na1
         95BakfARKbNa868axRRNxU/pgCpF7SPZovf9LAmzBd7cbZHXWtwQNOudApcgip9XZ+6B
         Ki6xRHtjNpgBkHqBkdRCim/JGjF1T1BJ+15OrOEdo8qjAeVuyK9oVovXOYKq1baBbEcN
         1b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        fh=PIyDHgKdUL9zJ548PU3AlAD9f8hMZ2YwbzwdwSy34R0=;
        b=X220JdIicZRrBo5KOd6YKWws8sR0ie4zNCjHZrqIyZsB6yeWgmvU8qxCrq2NbmE5rt
         tM9Vp2Or0lHc48n8RVf6KLEqvah6nzfO/ii0vpV11nufNWCe0S06y4FLdWV7Ir/4Cjry
         3/jI4FJyHO7/Ic2bkS71WrPjbOZtI9wMkcKcqybqKdu/ek5v8ZM6kXG0J+oneyoZ/eeh
         duXj72HBA8rZEmaiKHrnMJ7VGc0UFcyqjg/o+f61GOWZ92wkYGNF3e9gqNM4LhJbP+IZ
         SsUVuxhQKlPA7vaw33dcdCt63gnKhxgE4TH7Tzg87W3Cl9OFnJ/p8/XilsmKLA5Afd0S
         V4JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723060; x=1794327860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        b=gyQwWXPakqNPqfLYpECPqP6kIovu0Rno6xf9dsy6UzX8gWi245sCaxZa/cASDVGW+J
         u0Sphg57Zh/hS9iwpMru/kTgY4p2YWrbrjOSDbwjweKZa/kzCWwdk3quGrintQuo4Taw
         bm7ZbWvvsGfiz/7tjXeFRZGCOUT7z2vERL07JW7OAhvGY7E9CwOF8ORk5D3Ni6GSO4p5
         QsJkYuDyBI5XRQqzd2SuOJkRpwJvbqNF5yHEXrGOJk994AEhZtn+eXpBlmtZxeAJ5jJT
         VQgPhac+bIdKj/k/+OPjoAWglWwq+xHwqmEvt06Rve98YDSDzI77rOQtSJ7coUAYHNjw
         JaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723060; x=1794327860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWaM2FkmdisC7Xf7y0ibO+gkIMg0c2qSBatZ5U8CyUE=;
        b=p665Stl70ZE2n5SiM3a6h4LeOYKb0WEqK0xAyl/UcAZi594vWQfO1gv756RW8+Z9Xi
         F+eIypxZ07t8HZU4DmKJ6MmTWIpCWg7U27IwDQaC8YYX8iGHwXZ4LTwcKEE/aBPMSslP
         6FOLl7rxsJadX3JBo+v/D/5sjBgrOwb4lv78yEtWVZ8bKSgFB5dVYSHzvj9b9nfxMgLb
         c+phggMcnld3VTve7Q20eLXjB5aWp2ihvRuMSnauc6kHXZPPIuLAq4zqyb6XpAKY3Cor
         9DTzhXFfAoRag0SyQO5kioik9Whn7m8uxj3XSlAOmQOssQx1Zg3T0M5PMhUmjeqeMeIo
         TidA==
X-Forwarded-Encrypted: i=1; AKwUvBxRDekJ8ElwqZmHFqsTJzQm0/W13ALCI4FwuPmgRtlxf0WTrmiHwYIj215wwb4H0Da/PmnCIAiJLqHxwMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qw2ZrF+ISmMWm15g33duy9R+1K+G0VMyjiU4yfuP+tBr/8jRJ
	JRxxLS0IkX6R6JNgUYbhHlBrnDrAAf9l5AyZbflyQi6W4kDISuVUuFGAH3E1xvU16FgW74OjyKR
	gXpHRk9w+gqPuGwNw+OC+0MPAsP/PHFJj+4ZBA6w+
X-Gm-Gg: AYBFou0xM55AVzz4xmeQNxviNStO/YmCCLdfCMhhEJrV3iVM2RKgPGgOxmzUpkFFNiX
	/hgylUCd4sJDDy4uC5tMMOZwCTE5O/y5s3FtkOj+j8w+SfsXdZ15CJO7V3/97zYa9q+ApwCw8Au
	jnHjBy5ZNXb73dU1qnDzsW5ZWyP+0rWuyxQVNXp/dh6p/cNHP1t2mlCICITCFco+rcP8+CZA47S
	TggUr12Og4PHoUAQ/hoJIg9lFuODBnZFhRcsR/8rtzLci3fcbdWSFwZicCrqIuJEXGQutskpliU
	/IcmU+wjILfE5nCUp5TDCFdnpucPBbCFc2X5jlAgfPDK2nLf4SLBnv1sVlxpXoA8Y6jntQ4GbwR
	hXgd/13+2qnosUwbL4V3BcRpzpwxecudSdo3tPbmlkaeAU0W9wwv92uDOPEwjubyymkpfAYVks3
	WWhdPdPu3d5Eadb4in9+Da5xI=
X-Received: by 2002:a05:600d:848e:10b0:4a1:eb11:489d with SMTP id
 5b1f17b1804b1-4b2e3792525mr718955e9.16.1793723059760; Tue, 03 Nov 2026
 08:24:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103155459.534792-1-sashal@kernel.org>
In-Reply-To: <20261103155459.534792-1-sashal@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 3 Nov 2026 08:24:06 -0800
X-Gm-Features: AclHuK_dqXVxHCWjDX7Q7eybw3sAcf-f-Ua-B2wyA1INBKZKvcYJncwSGXQwV3g
Message-ID: <CABdmKX10Ykk8qhZt9GjEm_vWz4Fx_WGjpvQLeSbohu4O2_8h9A@mail.gmail.com>
Subject: Re: [PATCH] selftests: dmabuf-heaps: print size_t with %zu
To: Sasha Levin <sashal@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Shuah Khan <shuah@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:55=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> On 32-bit architectures size_t is an unsigned int, and printing it with
> %ld warns:
>
>   dmabuf-heap.c:215:43: warning: format '%ld' expects argument of type 'l=
ong int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=
=3D]
>
> Use %zu.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
