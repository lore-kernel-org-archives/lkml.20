Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7A3314A98
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831294; cv=pass; b=aM0x2uCxNd4t2Pa2q3qqJajsz8ZWisLQNOZl8SIqOxOGLdKwGVUiECyx3gb1pJ8JNhgWjZiojyxbwwBhvIo0uhM3fTNlKqSzeLYDINAqaN/iHb31IksQ/ckS8SR96GadBRU88DJJvFNJ5xVuKCOQQYd/uhtPoFjQYibwEuKeeso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831294; c=relaxed/simple;
	bh=C8sk1qEEBHqvgTdmahyfxl6izzwTI6I+XEK6unrL7yQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhOWyW104TlKJcDdrR71l5ZO2+jBvCtWVBNz161J4QwNdXDI+f/BW8HdwzUPHIWkGpcnOl1rqyMhIonyUDuJd6hQSMPfIiZvwqExyn+DECJ7zV54lXgs8zT5L9tugtt92FoBD7xNWudl6B42zbOEMlP56rHhja95X2MWdaTXfWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DymFgwAO; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DymFgwAO"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5307425f44bso368541cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788831290; cv=none;
        d=google.com; s=arc-20260327;
        b=hPmzDQ79IedeM11hjztuy2to382xo6EeXpmk+ki6wfevjesR7diKOYajerRIT+4Qh3
         lCqaF4g39bUCSzg5XzTO2Bg7fLoIX6b/+S4acD8Mi7/8VW/IHxGGn/VSKV9L7GEp9z/m
         A77y4FchHr1kaqI7hYFNIMGNgt1TYsQioV2r5FZraDE9gPp42hcumk358NQdCDlQGvuq
         UmIdDQO/Kf6/MlyAFGCPL2oHwWHG2B/u9Kv81Z1mVBjWx464JXwNt0XRoF2y3h3ISRvP
         cciZCcQGAihef3TzXAtNA/68uZpsO0+2pv/lMnpebozNncrE6iJV/37fxDuEongEfCwJ
         0hMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YQzs+TvnkG8jX4qlU9/TEe5EeymKa8IftTGzTEUV4Yk=;
        fh=Acy9msuvXipYbS/KYqm/kcUEdRxBOdLWgBdnUMpbRRE=;
        b=gcuAbBjOMpQMt46EpZL2F7rv4uXksToTBfjwT0rtvpoG2VM49stFzmI3ACUZRn05YL
         HdEZfchAJAvNdzljtbQ/MJJKODAkMvrv3EF2P2CDV3jAG32bCDdavdsWxw/Zd/Kbla/D
         OZb9gtjARyGjkHh48REPetXc6quVxnvF0fnaMhtl6llXMH2uHh4iEg/O4q2K1dzpe9a2
         M/4X2P/5Y5vdwKRrW6uc1VRlLp+Fig68JOGZPWqruxKKw2F/5C4h6y6/qkBbABdaVoYO
         DGDJ5aK15aTIciFUuwdheu0qmUCG4NOyKuNoniqGfnWy1heZ88sQne4r/1OSTZhN/5vg
         96KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788831290; x=1789436090; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQzs+TvnkG8jX4qlU9/TEe5EeymKa8IftTGzTEUV4Yk=;
        b=DymFgwAOtJUFGZt5lu1Tshdi/d8zDIHmuinpeTQTNgWV0ex6voSVJR9OID1gJb8Y7m
         pcMFQ2d6JRyJJ/jIKuxmiT6A5x4sJpz0/1DDroDqCROFVYLApkyutPOJzm0AbECRKQ3e
         TgSdtFxORfU3kSpIn7tMFqtP4puzKQUM3Mk8cCYHa9dhvQ8FTKbyo9q1euOqd3UFlfL6
         83F3tGuaE/trAXkb5dSe7fQySehyEFGoTgFJD6V9sSTQZf9+yDuR3pGjbIOxf9Js87K/
         lP3NpB1LimQgUQBFafZSEOky2bs67jzN9b/dSlChv/3QLQJo4rf4/CW/b4tkg2V9uscP
         rVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788831290; x=1789436090;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YQzs+TvnkG8jX4qlU9/TEe5EeymKa8IftTGzTEUV4Yk=;
        b=BG0x3wxXIJXZMtpF8fzQjw6fQ+KI1NYYYU5ncNiNS+pJwvqUOozkM7ZfqlBymtSdfr
         OniAGyZRvIQ+8P3hs/uHOjXbUDe+yDs5L6OYq2nx0sBrsBtKFCI3RJc6+MGLwK0dIQ/S
         Xqe8CZYnlTbtFkcBOpePJqxvObQQFCzp5lUgX/lHyuaEfIXyj6HqYzSaV4HJIKnCoPNa
         0okwzbhtdDMuEs4mdxQp6My7gpNVEuPhPesKrszcmf1DD07pNl8bLiOVsQWHfw5cw+uG
         mnV5XzSiK4UIwlPSyb+/Xqy6SpvtRYf1tAWpBGF1tdRlRvZn/LdwsHbhnfUD9kt4nSxk
         QHJw==
X-Gm-Message-State: AFuF++mNOxKHKgRoZB8VLewlAz45atLzk6ajw79IvO8jlAjggOFTsuSC
	rWE6HEMZfijtliiYR74a9kYv75ELzl0WMvOV0+6C9DkBqn9c56RFw3zEzRL8nJBFKQ3zhLkxUne
	lkQzN38+hfBYDi/JocsR80SA7rXowO33C/RuVXj3ffqW1wHhMAizcD13/
X-Gm-Gg: AYBFou3Kb9MzpK0oZo/StAel3YXGGqKXDH/2Zbv32bB3cPTSPpMrzWYS3SHXSh3aDcR
	gV9aGht9f4tmq/DaBabcydb1pvEtcGonr6QtV+uFQ4MmYiXEuWb6T+bU6wJTotFOeOLyTaAJS8x
	tJsiJMUbTsMmBK3Gt8Ozv5FcniE15SEbwVPue0UoTx5MnxwzdDLc3dV0J4vFoqGif+mr/a3XOvZ
	flVSJDWFQ8hSujHLt07qaVa+oQAZhLd1JrKygwpArv2CISS6RuxVIqaWnzHrddoMqO6y5TiYHMG
	mDw0L05R9neNOa5MTElffPS1cNv7JmBGjfhzgsnexbiRkpreoAhQTATg4LosPbU4EsD8pptuYlM
	=
X-Received: by 2002:ac8:5752:0:b0:530:5120:19da with SMTP id
 d75a77b69052e-53065d62b52mr36529551cf.2.1788831289919; Mon, 07 Sep 2026
 18:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907192140.2701755-1-beanhuo@iokpp.de>
In-Reply-To: <20260907192140.2701755-1-beanhuo@iokpp.de>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Tue, 8 Sep 2026 09:34:12 +0800
X-Gm-Features: AcwNN1Xobqe2_angS2HD3JLnQDpNBy1jGEuPGetaKk41wua1zBXLIX34Pe_T310
Message-ID: <CAE14pddo4ecRZLZs7XmuHtUhhcPnPphbn_AgJ-yZyzMGq=QjRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] devfreq: check the get_cur_freq() return value and
 use it in ufshcd
To: Bean Huo <beanhuo@iokpp.de>, linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sep 2026 21:21:36 +0200, Bean Huo wrote:
> Changes since v1:
> - New patch 3, so that target_freq and devfreq's previous_freq are not 0
>   at boot (suggested by Stanley Jhu).
> - Patch 4: drop the !cur_freq check, it cannot happen any more.

Thanks for addressing the initial frequency desync in v2.

For the series:
Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
