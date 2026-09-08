Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E606B498938
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903659; cv=pass; b=kb/1/o2dOxYyJ+CPR2TsIUq0thBmYRQw9jk/hSuqg89vtMTab3R8nai/euSJ98fvCokTe4CmW4pYFiqJ7Ub0Bd9CITV9qz/fvQbs6ZtYTn/lsUKwazwJchtqn/HcokthFqFU2fnT5JxZWl8o0DO5VaG7NmmhzeHu0k0B7c598rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903659; c=relaxed/simple;
	bh=s8/iqyVEMrqda2nfwXPpJ2kyzj5MWxyHQckmZinACOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpI+l6wilEJYqp8W+2+1f9dunf6bGoCjk5j1Zmx01y0rBE60n9+lglkE93PnxyBibUt2w/0XhwFHulu0fuJpnOnD+b7AxYmbhRWRKey4OUupjaxBpeoNWNV5RtthOpSSl8Dh6Lupljwa1t7rEpybXHph+gLsSwBJFTTdkzNUR+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnGCa6sr; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnGCa6sr"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0d31069so491214e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903655; cv=none;
        d=google.com; s=arc-20260327;
        b=PnAuEGO6LlHdDM8283JksxSfCGem0qkQGX+93CILJgZqs/UZj6ZSYbVWq7N1qdvj//
         D7ZTqaSEydp5TKmNsGmLhrhZLkDNjZaVKlOBkBicxZmu6LMAKjnz49v24KT8YiGSuwnp
         OSSv3o8+yDVcG1274fMcXIYVRyQX6okxzr3EOkea8JXtSox7Lv/z/9SPMODL8mNsxdob
         3j7m+kmsExmIX3zb+PXruyrcd4vL2o5+cp5yqXc6GLgyEKfjWN1DXZgeoBb/XANbvYs0
         3zTT39RLMpPO/cH+seVlaIOUUgHE1FS6D7aJ/dptrk1YK+LUgv8FRe67mBH6yMvqSjJP
         PijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s8/iqyVEMrqda2nfwXPpJ2kyzj5MWxyHQckmZinACOw=;
        fh=JOmQpVVGkV7dXYDYh33/87ZAgGqSx6OPTbPpWmfR1KY=;
        b=UTTaqG9CWZYuWd/+VB9iwiv3hg+LOomYj+b7zChnk7qgFtP/TRz8M3GHCpC8GIDEqt
         3ErhGa+CJUPf04EZ7dLt4u8rALdpYAMn36KKYSxeO47m9iK0qCEKadygIyulnjbiCj1n
         72DLHn/fHFgSwlegYzitxzGuwjnvy7Zd6u7MoRfumqlboOgfOoYhpPTWueBWXb6+72+Q
         DiXDjIUtsHKkVAOKuV+nmx/rZqB/EvWhOrAvcIXOY7qMhD7bNCTg7DzhXLrY8q5UGHOD
         Br1KWO5z2oolzyLH6ntBdUSDzZRZhm3G0seHaWdF3M8WCvr5KzvnGlviXxP0NXV7F1hl
         s50w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903655; x=1789508455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8/iqyVEMrqda2nfwXPpJ2kyzj5MWxyHQckmZinACOw=;
        b=nnGCa6srOuNnqz/8OWsvPLxDj79g4A4Evr4cokx8951gQr35qICBzQOIahm5/UF3Vh
         M6qbNGfXQxpF5oDBcUiugCFWErOjsqK1uQ6zm9dv5hFK22kBPBS2uX6gV8GQTwsXl0y1
         56on8O9+HWBgkNt83neA6iBHfzhE8hPcG4rd9u/UdsBOcqX2MgfwdMDUy2MdEE3WRwiI
         3aQu6I+H+jQZhN9KCupEmYQkxexjjwO67kRpBq4myZP4z8aEZDxLXsrWD+vaQiFGfRRq
         A0I0tSO6Ck7OEzVCL+QRbFZH3g24tb3fyYPipEssYAfTKmB4nkHD/m/2R6SncrvWM0mq
         wxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903655; x=1789508455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s8/iqyVEMrqda2nfwXPpJ2kyzj5MWxyHQckmZinACOw=;
        b=ej8HyFJA3wQ50Bpyo/E4o7CXdnbk44xjPCGViwvUgBzvL46PHVCfWdiZcSxGEebiVY
         QSMMnbh8Ad0gw40rZ3o4GiIWEDk5Eu29ac4niIbZWmI+IHtRyBRAScIGdBsV9EgBCQTt
         LU/VDWTWYKijB5JRPvdtGTnk3gd/nRYI6Llob7dqLLf/pAy0TPOie7sEMKrFMJqPUwR8
         arOCtufkDu9zkgi8Fg+jT/VvKNKyGqIat2NLyuIWmVJTkfv+7OHP87/mSnWrqaR9QDiH
         GTqHQdsUgq8xjNWUK9rjSUgJHC6ydOZsJK0AMHRu1s+3Cgiewf4TkUkTnevcN9RBKRlR
         /1+g==
X-Forwarded-Encrypted: i=1; AKwUvBzA/b2+gghuzFwviVFMWVOApd41rc6j1YGFcMuHPNHMBt006MmQ4pBZfeFimf3/mjv0I0gOKhxfW/SymRc=@vger.kernel.org
X-Gm-Message-State: AFuF++ln8kI+GbbjKHcxkpzwNrnOqYunTy8y+23RyGzKmFSVwd2VgOCx
	KkuRjykDFaLO8iyJ9751ml1eseglxd1OAHqshAWqxtU8MnjEOP30Xr5uvoU6hiyvlO06njkVabr
	1JtbZ3xZJ9+HAFg7OnSp5y1hGWGRNsiM=
X-Gm-Gg: AYBFou2qGo6ESI7Yn7gv2Z2/U7r6M84J/jMcAJd/4WmtGYOcypESjGQPtODyGy/iAIg
	3E1yY64Ne8YyrA6c5yL0jTdRByWFoT+sgRNDbZ4GGEMc+HO+RercEZIqOnOfTzfbNdCUD62sNy3
	w7K9QFHinAoO2NiWCQFgOTE4Y0eg3NnkFY3r4J5y2O6Q7w2bbtNVSznleh7aseknr7ykmlGYkzd
	mOWMmJ90Q77uSCAqGpTfcnSgRrmVWM/QM/KqQPSLQcKGcWIOH3osUHGjww1MnmKTPHAnHC51oAH
	RJvFPtMWY0F8fhetVeBQA/E1LEEqxu4+yEUdTpbrJBo7ygb8qmTqY41Uu8x+EZifSyiiZRUPeKH
	o2QMzICXEemX+GlvkrJ6ANLOSm40=
X-Received: by 2002:a05:6512:1348:b0:5b7:518c:4fcb with SMTP id
 2adb3069b0e04-5b7518c518emr3120909e87.6.1788903655259; Tue, 08 Sep 2026
 14:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com>
 <ap5xEtMdwXS8Pvcf@wyuan.org>
In-Reply-To: <ap5xEtMdwXS8Pvcf@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Wed, 9 Sep 2026 05:40:44 +0800
X-Gm-Features: AcwNN1WOdxDTSZnALkJ0_OE_heepkh6O2vUX_lfRBKLZK2OROuY6I7wC2p3EoNc
Message-ID: <CAKspUh+=T_v1HpwRkA7OY1m8aU-kZgMviHxDrYpBe__8YYHQhg@mail.gmail.com>
Subject: Re: Subject: [RFC] docs/zh_TW: defining a maintainable scope for the
 Traditional Chinese translation
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If the current translation quality is acceptable and it's not
> troublesome to move it, I think we can just move it. On the contrary,
> if the translation is significantly behind, there is no need to go
> through all the trouble, just delete them.

I understand the appeal, and for some files I think you are right. But
I would like to separate two things that are getting mixed together:
relocating a file is cheap and mechanical, while deciding to delete one
is neither, and the two do not have to be decided at the same time.

The four relocations in section 2 are the cheap case: the files are
reachable, they are not the worst offenders, and moving them is a
rename plus an :Original: fix. I would rather just do that and revisit
their content later.

For deletion, my hesitation is that it is the one decision here we
cannot walk back. Marking a file unmaintained can be undone the moment
someone turns up to look after it; deleting it means the next person
starts from nothing. Right now zh_TW has one native speaker, so
"re-translate instead" is only more efficient if the re-translation
actually happens.

So I would suggest: deletion by exception rather than by rule. Rather
than "significantly behind means delete", we name the specific files we
think are beyond saving and say why. If you would like to propose a
list, I am happy to look at each one -- I suspect we would agree on
more of them than this exchange makes it sound.

> Tricky?

The six worst are mostly two clusters: admin-guide/mm/damon (5 files,
55 commits between them) and arch/arm64. Those are exactly the files I
would expect a Taiwanese reader to skip in favour of the English, so
they are strong candidates for whatever we decide "unmaintained" means
-- and, if you want to make the case, for deletion.

> However, the former might be clearer and more understandable for the
> readers.

Agreed, the notice belongs in the file. I will do it that way.

> And after process/, I'd like to do that part "Working with the
> development community".

Good -- that is the section of the index that matters most after
process/ itself.

Dongliang: Weijie quoted you above on re-translation being more
efficient. That was in a different context, so I would rather not
assume it carries over -- what is your view on delete-versus-mark for
the files outside process/?

Thanks,
Chen-Yu Yeh
