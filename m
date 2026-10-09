Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB363CB576
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581038; cv=pass; b=QASiYiNOeYNVzxcqihD1n4bovMM5bN60FgyBSKIBZrZ+ZsX/ShcRaa+IDF8aH2tlIaG7LxxNeQis2x1zhWgST7AIJ5Z2RhMcRTdvIvJ413rRGINeXQhxfibUzHP1tE6PVdJTcI2rXv1hlddutUtIZdpWRC3n43YX5WUliIMqk3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581038; c=relaxed/simple;
	bh=QJQ4NjCwE66XT02iioTKX32pf9F/+INr+LqpJhuBU4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2ORh4S2J0Mjj0yP/XIBZ2TMcfuiHXoc2yS6lqkSUKoxiKm3WmljVQ2toPvsc/EOdG25CI6xszssVLYEw/vKyOtSGeqpRfu3u/o6/gV4aGDJyFpfArAfSNrhInyfTVuUD7JJgpvGqLS0TmXtJ3ZjFasegdwgCDYtykMm3wit2PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+34F8Vv; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+34F8Vv"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a60cb94b80so2972141fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791581034; cv=none;
        d=google.com; s=arc-20260327;
        b=ZrelRTXw0SKXWpAyrmdixaSw96dbkV+0XWsA01M/2AdHhIjCpWjhh4o201oc7+JWZ/
         suPGE9zqg3o3/DxuGNJpd6X9CLETUT/uR/8RBt9juAx77PzFcnYnXKYXt9Bo2HtmClBm
         hAJRS80vrpBhAPUrpD6QShFUEiaYSgKzfi5P1acWgvjqiRcoVGlZyMOXRct+FNCHm0UO
         1EdLRgTCzPZFEPoipiC0CvCZpHwfKShfptuV/pBA5d7bdp8Dp6k0/TuopI51Xp/7Bpex
         A2wOiiONB1MPczRJiggfR//azBm1A1Y29aL2X/7JaBg4+j5+f/kNpBdZJrGmqyjI3y2x
         dJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0WSRCUE49PDYeX1lwnIRvdxVfyb7jQkBCqEh4RPFRb8=;
        fh=unA/4u2qTK8+dWs0h8SITNbpzjwaV1IYj/GxFPStV7Y=;
        b=jWmzUZzioxcC6jkrH2WPdSL4HztYaHmTgbD9DSapm6+WwD3t6ZNso7ZQifwjA7JpOe
         /8M2VI6ECrdv5KcrydEO3qnUGGXg9h1pDwRSYKikKWoDWta/QZX0IwsTOpuVHJ6Wfo6O
         /5xN6usPfBVkpKRJONAveiL/26j0NqA1EhSdfLYcDyMC5G0eePWC4AVDeQFVK7bBgSfs
         ZaAKe/FWOO+fCrcNOQYwDXB6JJplIGo7ZacHVLY/Je+ZL9BFzq949X26ES3aZ/nLdzKf
         m6167vINfnqZ4FeSnbXntEzf8zbhJlcPbKxU4hIqErHolymdOwcrDSqMqUv+Iv1Tvmiy
         i4YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581034; x=1792185834; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0WSRCUE49PDYeX1lwnIRvdxVfyb7jQkBCqEh4RPFRb8=;
        b=r+34F8VvigRXQh2KB16ngQx2oQhmF1RTz1OyuX5X6c68cWdzzrolW/H/mMCUQXlj2z
         oBUz6hURy3qTX7Jm2MUjzpNoWD7q0kba270s4MPZushLkd1kuRLgH7VFOBqvvFImPS4j
         +6Jsb6Z4lx/Sn6yChRVwhmAO3DeBBZLm+iZqctn4L7LT8KhvJKvgK4BgztAEVSCv+XFb
         4yptLdRUaQJGwbyn6KIE9iactb81TFGqhMsLmgQJV2HzpD/wmViu0CsQ5+bic9mP3pYy
         KMqvBwVa53u9wHRZIDPEaLxzU6iYoI/rTNgu4vGJ1XGAud2ebm37Tb0HZu9jFL/hiHom
         ZbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581034; x=1792185834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WSRCUE49PDYeX1lwnIRvdxVfyb7jQkBCqEh4RPFRb8=;
        b=H3RO1X8H3+OgqrLfMBG9muWVAZLCMzbH17wKDEo3RETvQDlyO7DtTXj7DkIeKZfXNS
         6DgyXh69nzsFjvvoFyZicCud9L24bxZa2JKmkdNGRSOAY3hg7QC8kemnOB0dF5Pb+uBW
         Ml3vQ8ZzUzmjlbH1jnFmfqp59I1pJzqJeE5CEWoD3RBEeRqS/P+rlfhbfX3kS5XuJFUb
         jIRBbkU/XHDO9GPc5hTQpEjIOnwneUhZr2GguaF2ZB8NDNXTpgysKRCazT+IR/9Pih4g
         WlNTmJp8V71OHDZ8KpPOdu4daAG6V6psGniO9vfSR43NCcXVv0ytUIfXKSOL4qpk0M3i
         UrYA==
X-Forwarded-Encrypted: i=1; AKwUvBy1PzVUcawytRW2hHZlpMTYMJjdz01lV0jM3OcdMlPAK7ICmfhAgvEwqEFMbmxaA7o9lp17ljwVGwPR7sY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKShSVoNV/lv3KrUcGcI8yFliHIRJZmkZUWtnyMyaKXoTOzj6Di
	MLLUaZL+FZvUkl4g3+GBjR8Fbt1Io5OPi0yxfPg5N83TJ8jS0QmgOgQKhicKTgdNkIwUxvwFnk2
	QNdncHh09m8k5T+VX4fLFOxETeNy/fQo=
X-Gm-Gg: AYBFou1T/ZrLUcU/kBNbb0cI3ExKsuAhhot+esPRDPRk1FVlGzDS29eJ7t06W47txCR
	HZN+Uzq7vhkvxM2hiv/UuFDoZtbR+PF/Qbl8wNQXS8Datzik7Wvl/l+Qw6xCFO6XkRuVse3qb3Z
	u4aT3sxp3mFfuCx8DpO9FsRgks4aWILxcZ/BfRMW0WfrSf7oOkeCYEK72G7vrc36TBcX9icWPO/
	5qG1edHXbDkMI4M+7h24zZIybJakNuVqK+MJhPx/+9z61A5+JIwYqfCJk2b6XdMBmB34aKHEgFv
	ArQvDWNdm5MB3X5mZrJasQ+V+GYwhnHhDo/sDv14FE+3KKWIDIJb65CZyKjTVfGb
X-Received: by 2002:a05:651c:b0d:b0:3a9:9856:aa8f with SMTP id
 38308e7fff4ca-3a9c55db18fmr9884551fa.7.1791581034241; Fri, 09 Oct 2026
 14:23:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926041943.1124650-1-oss.patchbox@gmail.com> <askjD1DxFvrV5ND3@p14s>
In-Reply-To: <askjD1DxFvrV5ND3@p14s>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 9 Oct 2026 17:23:42 -0400
X-Gm-Features: AclHuK9Oo9BEgQkUPo5pIErQItBppE_Ru1rb7SmpvCfvBKSwmVbbZBnq9jbCxTw
Message-ID: <CAGG=RgA04aBS1QkTWoW-yjMZ0MxB0x3bTM47_MZr-yK04DPDVg@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown
 with rproc_vq_interrupt()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 13:23, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> > -     list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
> > +     list_for_each_entry(vq, &vdev->vqs, list) {
>
> How is list_for_each_entry_safe() no longer needed?

The first loop only clears the pointers with RCU_INIT_POINTER(). It does not
modify the list, so the 'safe' variant is not needed there.
synchronize_srcu() is
then called once, after that loop, to wait for in-flight readers. The
actual removal
still happens in the second loop, which keeps list_for_each_entry_safe().
