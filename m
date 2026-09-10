Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF9B45D909
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037391; cv=pass; b=i+LXGhGHGgosFrP36GGtTQZlbzJeToj+ivP6enB8+tOTEp6d5p8jf1VY/tWKXPGn7nuvmgTvxvs4FAQIxlLSLiCDg+HDfWieNjsSc5wdsYC1qshSpWbHwe4+9XB7vLM5e2dvPaIibt2+WfyVn18VtxCqkfoJu3Sb/P1jumip2uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037391; c=relaxed/simple;
	bh=2/wcR5sUboQOAYn/IJAFYobv/roHztTsCOJuOK6FzVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VELoDjyDfrMYkLmQXhkNkLefeQ4/OX7RoWnXU2QAf+89wbfnAuTgoc2YJhBGrYhxUJW/zs7qAODM5059tuORv2wMRnC6SpuKBQ27fHt22wN1tddxF96V/uFRUdqdEisi+nZKgFDWsd0nzinWlJZv83z7gPe9RXjGw4RszN63by8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ly2+eCR5; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ly2+eCR5"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9399d52b1efso253490485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789037386; cv=none;
        d=google.com; s=arc-20260327;
        b=X4+Y69Drr3taT19zll/Dnx4EbjBUkJn6CH87NkViRwJsufoLE1uJrSlcHxwYjrZXed
         nKRdiRSYyejdhdlTyW6RPyzbo1DWOZgsTmYeNkZobS8GGISM/80IQfvoFZty4LdpqjjT
         4DFpNLFrPQ2l9mfMy66DsCMpyMzPETGi2TgywwzPtMUVG9t/60CKdyIfkHCB1gqYONts
         p+o12grZI/3WZJQZWEVik55GPXdeUzip0rDw3Grt6qOxP4S+xwgak4JOKYpGhXmKikh4
         lK4tQZUA6N+ohyStCns8Hm2S9ZMaZRSApTBr1IRFIeWPEOt65kHYWpVd9wzig4/NR1aO
         PoEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtcewJRVceLZUBOSRNywwnX42p6ETt6ZFY3E5Wmn/z4=;
        fh=7HFEhY8coi55wVt8bhak8tB6ZN3xTh1B1VvIedKV3c0=;
        b=XZyRTGKp+9BbUTDiUxeqOZo4romhtDk7T0aEqRb0GRSpXH6r3r2omr7qkieIsgehTb
         mD5cmdTPiidYXeUfTR49HJjwb56MpMR5n+SnjHMs5A9X9a7SN0Oybb/s2lss/gKoG/BK
         EuecKxLntl5utIp0GNmtuGBm7qY5rTAXyictTcV1iTcpveZ7gI0WN1IflFEM2QoV+dAS
         9o9cXKJ09/yNGvQ3RCE2kY9/txRbDBpTuHUS7AnZNJZK4/XpdD5WRElIEEvjvYOCeZFr
         neNQ0hFnbiv5jTBwvSiUz55h8x54RhQ4K9DJa5HZX09q3R55BaEZCLDRLnPGMh+TtcVs
         US/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789037386; x=1789642186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtcewJRVceLZUBOSRNywwnX42p6ETt6ZFY3E5Wmn/z4=;
        b=ly2+eCR5oMhY/OaopPBUGK9+lm1dQFxoBZxEFAx+0Fd/WAkN8k/kC07uz3VLfDLE0u
         J3wsW95IZ1IrwcWJwiFIRNQy72z8QJra+E0FOMoKln9K1B7TsQxMLRIC7T0MpiZHG10r
         LHQAkUg3jot9hpatW/0HhyA/69EfrMA6h3yKbGhPvFgZFJ2yRRq4WvO9cGea8znAVOlO
         ZWjDwwSWqTY9Loo1KF9NmSOK2FjPbbTSQFKUz+SMCBdpVDSYoOQ04oZadP5PCE41MMH5
         Aoy2bU3Yr+wP5r2dba22iqqxj1SMk87btfkO6R6FxElPRoPqoxDj6VxhMmhuZcC7OwK5
         aabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037386; x=1789642186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtcewJRVceLZUBOSRNywwnX42p6ETt6ZFY3E5Wmn/z4=;
        b=DDkGs8pjCNlpWjr9NZlx1NiKT2Zr99N4Q+6MsDe558034e4HM1hCkJTQlxbboBuVhq
         zok203DXXxv52VLpvr0K/LUO58ZB/Z7ACe1G411LTvYn0J5fp++VW5xUndBMbbhc8B++
         VJH97v0bRcIe2OGix66mgaplPeouPtJYcEHMVxXQQ+qEyDpZThAjN+zIknCH7IR56KiY
         Pf+7F6gRRRIKVyoywKv8nY1ANYe64sqYWUU9JwODvlx+ruiL47WZffvIPLIXz6qNUesj
         mAEUj10HbnJeeJ7IBosCG0G62+hAA9iBtpUz0wFMsccMi/NyLikkkQxZiX4J8lLwRNRs
         aXqg==
X-Forwarded-Encrypted: i=1; AKwUvBzkXzuVlqncxfejiyWEApaDM3YSu1oQIlXj92klt0Ws6qvR6e6/G160RPT5IRzojF+uviafWA9Ku3tmrMI=@vger.kernel.org
X-Gm-Message-State: AFuF++m9I6q+CRz6zxXnhd03RDlW/s1iYiriVdU8SlUPnqiIaZDfLzMd
	KIPD1LJTnk11qSn1GfcpaZrRE5mfhRIck9DwxxASDPnaNXhSdCko1+O73yOP5jcnez1QtMFRfJw
	VKTqDLlxjFxn9hxFmzN1BGuTwdNx1zZ5++g==
X-Gm-Gg: AYBFou0qLmbDioPvUS5ICqvWtdTMSmT38esf7yNTifkQAbNAqtPAZiqYf7Z+g9qAzyD
	QwWgJP3zKrvwwAbQ0MKm+4x31IGt3yG3XixdMMJx8fVSgIL2nd7CYIkW4aEfof0uaxqIbGO2Ogl
	wOvhGLMst0Ids48bWWfdstW4Hkq9AWbJ/bVemc4XzG2x+FvzUxvWMBPRlXeb+3UdNtyHWoquxps
	5IXv/aWVBBPhtd0RcxAZI1vwuhvx5c3M3tqz8YW4GOFYjP7vkG9Bu9Yz3D0IYt0mKRKhAdhJIdO
	EGKOYHHVDcCG6vK/ddVjMjEcUjB9fOGRNOutEEweGcqiJYHfzwtsWKcOyS+zYmJooY2DF1RRBei
	4gN/4t3QAGwj1vmPjtrH6jExQi08PGr0k9OEdQsKvkZIa4OKMZyC8hRa2emvwIbigsuJDrYcsYu
	X41HSnnzLm
X-Received: by 2002:a05:620a:3193:b0:939:7e19:ac3 with SMTP id
 af79cd13be357-9398053f7c5mr4559892585a.45.1789037385859; Thu, 10 Sep 2026
 03:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_7AF43562265F45B58A25576CAFCE66967708@qq.com>
In-Reply-To: <tencent_7AF43562265F45B58A25576CAFCE66967708@qq.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 10 Sep 2026 03:49:33 -0700
X-Gm-Features: AcwNN1U5zUJfgY6nM5fiNpy1GaEjF7ZSyNgvIRbTbUZRd4GJZHtUA-hltIS2lsY
Message-ID: <CAMo8Bf+fTcVWS3V-dwBvrOsCOc_WOR+5gLXr_wxawzjdnAtZ7w@mail.gmail.com>
Subject: Re: [PATCH] xtensa: time: Fix clk reference leak in calibrate_ccount()
To: blaze <1466528493@qq.com>
Cc: chris@zankel.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:07=E2=80=AFPM blaze <1466528493@qq.com> wrote:
>
> From: =E8=B5=B5=E5=AE=87 <1466528493@qq.com>
>
> In calibrate_ccount(), of_clk_get() acquires a reference to the CPU
> clock, but clk_put() is never called to release it. The clock
> reference is used only to read the frequency via clk_get_rate(),
> then the function returns immediately, leaking the reference.
>
> Fix this by calling clk_put(clk) before returning.
>
> Signed-off-by: =E8=B5=B5=E5=AE=87 <1466528493@qq.com>
> ---
>  arch/xtensa/kernel/time.c | 1 +
>  1 file changed, 1 insertion(+)

Thank you for taking time to explain and resubmit.
Applied to my xtensa tree.

--=20
Thanks.
-- Max
