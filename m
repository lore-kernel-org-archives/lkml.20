Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5D33D512
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704683; cv=none; b=OQhUbcEYPtjJF+IYfmlzSC4WTvqSSJbTy+VJJ9uNJaMCiTSKx6U7Zga991zkRnOXXldvnE+uqHq/ZAwQhPV+Ur8TXE0VhNcK1quxUUB8pLDvHvaSSXxYosfRqgcvcA6WZwOTGDbOdLGt/ZQMdCHvSWz8Ago6bSg+eYtOyTRgMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704683; c=relaxed/simple;
	bh=WBl59WxSEqMk+fmWemZEz/cPY8wLXeppd7xpzGrDQgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHobQYvJbUTLTUYls3DND1HKBY8djqUkXTYiTYxDqxkstiwZFRc3DHxJP5E1Do7033vmOH5QaTYxf8U+LA/EqbKleh6H+q1Xoam3Qd12bXYYezpjDJSFXBxdFjDJUpY7PLnuSaxe/yOd4csx1HIL/tkOdyFBXpdiTc8D0Ck+S6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDNEjrPL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDNEjrPL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso3537175e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788704681; x=1789309481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XO4ugfOlahiEDAFul+PTsZMKmlT+DcFCIGUmXDcXHfE=;
        b=XDNEjrPLJ8unmNb3iJwZMu+BS1SgsUhO+GjAFX90WOIrSw2sFkg/LIPiK/yVfn4YSM
         iTpoOXfpQnYlkTxZ14+EYOHfwrpEsJXtq9qrdQKYoDnIPODQLCJB6nh0xPlULD8he1/n
         +nsVdkmPTpxv7rCRZeYWuYpW7x1sE8V5D4S7IeHA/XiCQLYquMO1fzy7u8suxsWwLfKn
         icQVBVFmTu1wANa/7nL6XRpMsoU6SmIAL7zOFRl5vZ+Ide07DdJsgiIhicMVu4RTf3P0
         6GlXHW/cqfGlZHimuk3Yw6U7p+QYbBEkM8re8DAFpjFRZ58iJR8FrccY/o4BG/UGUwwk
         3MMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704681; x=1789309481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO4ugfOlahiEDAFul+PTsZMKmlT+DcFCIGUmXDcXHfE=;
        b=Sgku9nE8+HjD7M+mbcs87egMNuk/FyAbtzpCC3ZpXfuHFEzFw9t7YOkZR6+RbLQM9Y
         n7W3j6Cz3Zy3ZJaOJIkYmnRQhcVpUpn7T4111lcPtCmY3gJILplbka9Q/PuARso1w8OS
         4uwCIvt2voipyHUwAGvXN37lW2RIDnmnmgXdXbuYpK10ZxVntUl0Niq03cgLoXAxZMb8
         RDGfJH0zcO1Ha/QztzhmrTnl7Ds/PqdJR/scUA0ROkuRyEioMDvOdzw4jzd8VVluzcA8
         nWXfBtQla2mW9DRx96BIV8hOhKSC3D+cIyDTGDikuOtZMYDlcq3bFvIP1XfXv3KTnr1t
         n2Iw==
X-Forwarded-Encrypted: i=1; AKwUvBw0E3v+5M7grR9JCQVtef0gCxG2xRkX+nmBO8rsL60UbKk6Rk9Crtrp9t0vJ8BpFigRhRbU/wV7m2xBkn4=@vger.kernel.org
X-Gm-Message-State: AFuF++kFHBVjmKnyFpOOKxxrHBLv47g+Mxqhn1Wx7O1Izy7aqITxfxo9
	iJT80aYlKs6Rzzf+h+83Xg/GfumDUCv4c6PqumCuwLlVnuH1mzhN8FjG
X-Gm-Gg: AYBFou3xE9fVijP0HSm0MEkLsgl3KYoCanSUIdlhGgWDw3rbN9pYYmII95Us2CfFD4M
	PG4R9PvIdxFMarEwmKb3OuKigZZXEpSMivcwMT3t/TS3RGUJbY42d/hnQBF61sY8EPedcX3EMsT
	j0rM/OjvvMW1DyEQY3zCPJOBkB6Y7tDNc0A2YR59fs8R0ER6fGxOwMMB8nzlEmMlF0/S8IxiFb0
	3RgYptwiLnzJQZO86O6EKn54Nf7P3P7Vz2CAFvOR2pHXnhEjdQ+36D2WmHvxoYyKO3nOfGuT0qn
	m77TFkkPGFaBTNaeVsY5FsCc8LoqikESQR7zOWAjmyvEv6pX3YxCqPTAJQAxszbD+wcn3mnB01p
	sWHf7++q4uaWpV6j8lQotCYGu7IRek8wwdxQMNvIK4py3fXVyTbYcCRO790egUxedA+ZoOwD7KK
	CbLBFmcyYXrrwXhkK7V44Ug5fgkblrbGLx4uIuMqGLqqfvaUcFEgunS61K2Ck18MoLJvbaamMWQ
	nTG0mPFRy97N7SXYkBn6ZnqulHzjUKsux+5SbnYwCiUp7KA1DPymzR/HvaKhnXmNbs=
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr207782615e9.12.1788704680451;
        Sun, 06 Sep 2026 07:24:40 -0700 (PDT)
Received: from shift.daheim (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm116193005e9.5.2026.09.06.07.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:24:39 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.100)
	(envelope-from <chunkeey@gmail.com>)
	id 1x3DnT-00000000Em0-0A2I;
	Sun, 06 Sep 2026 16:24:39 +0200
Message-ID: <5a29065b-87ae-4c63-873d-fa22b0899199@gmail.com>
Date: Sun, 6 Sep 2026 16:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: p54: fix incorrect frame length check in
 p54_find_ie()
To: Johannes Berg <johannes@sipsolutions.net>, Wang Yan <wangyan01@kylinos.cn>
Cc: zilin@seu.edu.cn, linville@tuxdriver.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260903081200.267514-1-wangyan01@kylinos.cn>
 <bdca394f-0371-45ad-bfee-b044444ad724@gmail.com>
 <087d18429b448d5b63f922fd6779925f827134c7.camel@sipsolutions.net>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <087d18429b448d5b63f922fd6779925f827134c7.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/26 1:49 PM, Johannes Berg wrote:
> On Sun, 2026-09-06 at 13:06 +0200, Christian Lamparter wrote:
>>
>>>         pos = (u8 *)mgmt->u.beacon.variable;
>>>         end = skb->data + skb->len;
>>>         while (pos < end) {
>>>                 if (pos + 2 + pos[1] > end)
>>>                         return NULL;
>>>
>>>                 if (pos[0] == ie)
>>>                         return pos;
>>>
>>>                 pos += 2 + pos[1];
>>>         }
>>>         return NULL;
>>
>> The check in the while loop and the checks within the while loop make sure that
>> no "pos" is returned unless the IE is still within skb->len.
>>
>> But true, it should have been *mgmt and not mgmt.
> 
> FWIW, I dropped it because it really shouldn't have been there this way
> since 'mgmt' can be far bigger than needed since it contains the union
> for all kinds of action frames etc.
> 
> I'm not even sure it's needed regardless of the next check since the
> beacon is built by mac80211.
> 
> Just blindly patching one mistake for another doesn't help anyone.

Ok, alright? I just looked in both:
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/

Was there a patch already? Or did I missread the first sentence that hinted this was "dropped"?

Or do you want that Mr/Ms Yan (Sorry, but from what I was told, the name can be used for
both male and female) just post a new patch that removes the superfluous check.

About *mgmt vs mgmt: Yes, you are right. That said, that check came from sometime between
~2006-2008 ;). I don't think the struct back then already contained action frames with
sounding/beamforming/timing feedback. Still, I'm totally fine with it being "dropped" too.
If there was such a patch posted, please feel free to add a
"Acked-by: Christian Lamparter <chunkeey@gmail.com>" if you merge it.

Cheers,
Christian


