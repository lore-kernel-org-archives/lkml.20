Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F62F39B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034387; cv=none; b=Aze2aGhgTJMOVVvYPYRp/sGlogWE8+yASJNB7qONbV/h8THYO7rxYzEb9AScSYFj4RGgZEnkQ9J7n0U+o6x3/vvfe34bH/9GsooTcaU4NN5FGu8NDDzy+KUsPBqS910KmOC7+MyfF/+y1Wx2KQstKR0FguIkw9DTJ0gioulK6XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034387; c=relaxed/simple;
	bh=dDuUS9lEAlDmYNRCGgtkqtpjRNa5kOmWvu33Let1WwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gxoNkzpFFmIJXRd55jtZhkkXKCgrrkx03k0AElW5aD/AL4pEU3YYJi6gFKcseNz47PebFGs+oflSPz9Klgvx0H3enGL4hbJeCKPXFGtbKBoQtfyTGNoXlR2VGXfmirTFfQbE+08y3qOBimjsg96cwPkPOk6ZbRTbIM+y/pCwDac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FT9Eiu3v; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FT9Eiu3v"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2792254eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792034386; x=1792639186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDuUS9lEAlDmYNRCGgtkqtpjRNa5kOmWvu33Let1WwQ=;
        b=FT9Eiu3vet6uPGpkuVsjs0r/ZDgw+fY850ubPD4q4piWpXnJvGavQeXkBUXZSYy3ac
         81kBt6rowytSrxgAafUxVUw0atKi+do4YvL6E/5dVYD3qAa8kUpaY9fyO1IPGQ+8YycK
         7K+j4Yz0KVB5FniozV5BR1keaEnPtJN5hITCcNawCyOtHseNwv6BvqwRaTB7sMc63p1/
         ItL51Ze2Zf5C5CCAj3d+mJ99zG2UIFZlPN3eYo7lYeYkcilLi10xiQMPUUH/xoSTjY3+
         mZMssMMXGI3WQ+RaaVQbMyGluz+YvuOT9Tsnm4Zra4Lhf4gNt5GgQKpEZ6Ijr1bvD2PS
         kDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792034386; x=1792639186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dDuUS9lEAlDmYNRCGgtkqtpjRNa5kOmWvu33Let1WwQ=;
        b=agsewnZ/8Ek7fY5ivLe4Nx7XAaS2DizJ/IGmd2nC435Xq0scK4r4L4qRqagPAl8VPw
         VvZqPAM/Fq2FOBuSbFIzoAM5hg4KqDrGExhEPDO81tuDMyC4HD5oPcUJsCYHXec4pW/z
         +bNz5cY+TvH/DuLKrogJotswHciqpUSCtxQqzSZyjNgrVVJ4YX9Cb5j2qlLIUyX4knPL
         ekegmPyGT6ew7pm8NYTCPKfq4EA0ZUjTq84ky8WJ/zeCjFgow0iym+T4UN32fa80bLnK
         z9D/IoHPqTZWRnF6nmHEBMRG7v+C0v862pmJsyKRqxWwjOMOLcepvgBBIAGUU1SA8bVx
         XBmA==
X-Forwarded-Encrypted: i=1; AKwUvBw1dqhWJDOx623MIJvoBXw9S7nRofNRMbHH2YEYKlYXEbuvtTFykRDye35JNXmkmYAapXal2+LvDE3jVl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdn5P9WXrXdumX4LaCarNfXMEiyootdtaKb/Jc2bfjbfsPWDy2
	WFfP3eqxZ5Z67GrTuh/+h/fssD2VKEPSCYyzaCiVJPowVml+yAJGsYRk
X-Gm-Gg: AYBFou3ElXcLBh7gnyVvyU/KgCE67XDrrb3pqXJZiSfmS8nijNdzousShg37c2qLXlH
	7mh0oLFKCcgKtZucRN4K6BBEfc52Qxg31LBPFccLhqIMyaHSOeomikf8ob+MqGebbZd51VtOvRN
	+o2m2tp4ghoFfOEp7Z9BXpcBvNza6wab5IFrUOF0LI1V0PdJwtxuPFkVSKU2/kNicqreN8QjSY4
	PwZtqWzXXob/SbThn5qnBtyEJrF90b/i3An0f4CConQshdnot5V1YETbS+jjKn06hzq7QBC4GAK
	u8d4vNpqaIMWealhangMezOxu6hOWJvMQCMriuXFIUbXyL3yPB9exvO97SK/pYe3abF5ybD5Mji
	JtCoAOx1Te6U4yKXRRQV5nh8gvqiwriKpOw8AOI6/l3cBD6c+d06MdRV/7rywZB153FCAQS1xte
	jUVsyUU8XP85iUiQvQU8c+iWUceTTYzmvNv4GY5U0+D4efODCY/zVbNzcYayGN9Pxj3PWYOgKzt
	YuFXs6BnWveJ/3N
X-Received: by 2002:a05:7301:3a84:b0:351:985:e729 with SMTP id 5a478bee46e88-3537e01e8b6mr26189806eec.12.1792034385583;
        Wed, 14 Oct 2026 20:19:45 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm64832837eec.18.2026.10.14.20.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:19:45 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: baohua@kernel.org
Cc: senozhatsky@chromium.org,
	akpm@linux-foundation.org,
	bgeffon@google.com,
	minchan@kernel.org,
	richardycc@google.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 10/11] zram: use rw_semaphore for decompression streams
Date: Thu, 15 Oct 2026 11:19:40 +0800
Message-Id: <20261015031940.1410875-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGsJ_4wuPCPR0DnbrLp7ebdO=Oih6K_yP4XxwETKQ+3U+THVjg@mail.gmail.com>
References: <CAGsJ_4wuPCPR0DnbrLp7ebdO=Oih6K_yP4XxwETKQ+3U+THVjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 15 Oct 2026 04:46:27 +0800 Barry Song <baohua@kernel.org> wrote:
> is it due to the case that sg_is_last() is false, local_copy is needed?

Yes, exactly. Our tree isn't on the sg read model yet, so I detect the
single-page case via zs_obj_get_pages() (page1 == page2) rather than
sg_is_last(), but the condition is the same: the residual exclusive
reads are the cross-page objects that need the ->local_copy bounce.

> Also, with either deflate or zstd, create_dctx() will
> always be present. So, what algorithm are we actually testing?
> What happens if we switch to zstd?

We're testing lzo-rle, which is stateless (no create_dctx), so the
~77% shared figure is specific to it. You're right that with zstd or
deflate every read takes create_dctx != NULL and would fall onto the
exclusive path, so the shared benefit wouldn't apply there - as Sergey
noted, zstd mutates the decompression ctx and its dctx workspace is too
large to allocate per-request. So the shared-read win is really a
stateless-backend property; I should have called that out.

I'll also apply Sergey's vm_map_ram() patch (with the memalloc_noio
fixup) and re-run on-device. Note this only helps the cross-page part
of our exclusive reads on a stateless backend like lzo-rle; it won't
change zstd/deflate, which stay exclusive regardless because of
create_dctx. Will report the numbers separately.

Thanks,
Bo
