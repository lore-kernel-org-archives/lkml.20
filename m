Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CEE383C86
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629512; cv=none; b=MbsHU5mOd1dsH1NKi1QXbOLyapZEqlO49MF0jqQ1CqvRfhKp0JcNaBy29brd6G/mvvsKbnLO074zqiVc63vvTbkxfdT3gZM+LACuSeNUIVU/aaUt28RfzJ5Wz/E11nU4e9PtR/Gl3KOgN6Z8MKALFqvgfCOvg1BYN3dkSE7gpqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629512; c=relaxed/simple;
	bh=bEKlKi/+IZFKOLDzrR1dsce/+n64lxtOKI6KSgMbKVU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=JJWXwjfJF5fZOHxgspIMmU+t8RwGkI+mz9oiccMdK4PysZRey78oAbz18Iq/i6cPg/nWzA4ePVNiIdVqoR9UuvU/h4//l93SpWRzcoD7973XJKEeSUvIINqWZzNl20visC+EoNiin6rQ+4CguCadshsHdvMhRplK2/GIXkiqcoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QdhLavMT; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QdhLavMT"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso4095162eec.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790629510; x=1791234310; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SuOpjRo0nMbIZrrhGtIjOTHizEzVqe8lHpeMn+L+x88=;
        b=QdhLavMTqGXU3Z5a8PzskU/taf9cO5W3uXmP6Tk85uhnxI2IO7/A/+G/xtzFSNY5b7
         G+p09D9ClPRzih0/WhdPeYdJoh2EHJfwoiNI2Ubk+DI5dWMSzZiX1tvzpgu/75fhHQlM
         CL3vOYXzE3gveM5qUj2pKSThWL/wThqtI4tebZjSbkGQHL/7l49DMvD/4qx55bWXFpHs
         gQESL/pPuToUSTAxd4hGR5yvVc2DtQn/QtRJ8Rqiy28TwvB6vp/Xcm5twL6ViorZzJxB
         wl1Xot2cGCmuEFDsAKXFbialIf4ExWNTQK9d4D/2WU3+jx+p3Ajrq/zJ2pBHYsenzfaa
         FV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629510; x=1791234310;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuOpjRo0nMbIZrrhGtIjOTHizEzVqe8lHpeMn+L+x88=;
        b=ExeDrmubFY1LRv+b9kFrJPTW4CFJOC1XfuXeLBT+g4gUX5x5qES0gXXx4EldwbYf3G
         K6a0jLuHMzMDM3+WoMXRC0uAIdc3US8odpakMO1vDhgczTXo0IAXUej50HX63LDrXRJJ
         +fdVJrckhENrHV72pMucyV3wEpCc7KBzoEpBOxKKfhz+YgYVYH3F+92aEuhOGJIzf9fl
         1Z/uMU5FYqH4C1+UAz2I2qhj+WL8n/1TEu5GphZFtA5q+ltN/Z40RveihCoTszIcWDkj
         ssyy8pd6LBXQtU+z6SZNGXNRL2U4mStPoyLWeJe0aFgl4yFL3dy3zdbRdWNuE7DbDPLY
         0AXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxW9qkLXmUYFqsXP9cpmOM4JX+b+b6RjouO5g7UYfmDqXo8HcUowA3E+tWyEnotAVLYD32k4hCS76gCQ8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQDiPgtZZJ/VkdMfXLPfEu6eySNHoTD/8HY0MoSBVSHrExcjIv
	+SuFSkF6IIMTBikd7tbEzhCxtsw6wg8RYJcx22woiJr/vJGMZVmtxdI+5/aZ9wI14bU=
X-Gm-Gg: AYBFou0Sx/fbIiBp0w6yLAbtsMiLt+/EFBcS4r8cL5tm02NzTGvRcXVpCFTR8TOo7/D
	458sdHBqM9ViH0wwvzo6AkQ2fFIaxDP8wP3eqKaScbWa3tbFU03A+Zj8DWXuT6FKX3M0TLxRvjI
	m0ggilpWlqzlWiNPFJYJWo5y2klERh+NrOF+y8JEED3o8xWZeurVi8QysEQOJoZY07mPiI/q3GC
	3aZcTuZRZUtne6Pe6wOB2pb/UNRdrWH5tFC1a83qAcj2eYX8BXSGm1VxoAnSPyGhi56lmia7KcN
	zpKQ4XPyzC2vii0o0yrPmqE4TLcbvQC/TP6sFHsJLYiKNeT6DTbr0duESU6Rc6rygR0ZXN+cYuR
	ctYTAFio92crA+GtQsFvYVksRfv8eNLuZF/eSKEdwcVAcJo4zvF+nMHTNre4zd0zFFsoYnFlbhL
	O5+HCXZh/mQ4s805OI8yablu4xB/mLL5Onr9qd0osXyHmRbCTjaT867+mHx+pit3FxthtiCCU=
X-Received: by 2002:a05:693c:65d1:b0:34a:e7ba:863c with SMTP id 5a478bee46e88-34ae7ba888bmr853763eec.18.1790629509296;
        Mon, 28 Sep 2026 14:05:09 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm22264934eec.18.2026.09.28.14.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 14:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 14:05:07 -0700
Message-Id: <DLR96NR3FB79.2NSK3I6JR8RJO@nexthop.ai>
Subject: Re: [PATCH] of/overlay: don't pass the changeset's own id to
 of_overlay_remove()
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sashiko AI" <sashiko-bot@kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260917-b4-of-overlay-remove-all-fix-v1-1-920441cecae2@nexthop.ai> <20260928182658.GA185307-robh@kernel.org>
In-Reply-To: <20260928182658.GA185307-robh@kernel.org>

On Mon Sep 28, 2026 at 11:26 AM PDT, Rob Herring wrote:
> On Thu, Sep 17, 2026 at 07:28:16PM -0700, Abdurrahman Hussain wrote:
>> of_overlay_remove_all() passes &ovcs->id to of_overlay_remove(), which
>> zeroes *ovcs_id once the changeset is reverted, before calling
>> free_overlay_changeset(). Through the aliased pointer that zeroes
>> ovcs->id itself, so free_overlay_changeset()'s "ovcs->id > 0" guard
>> is false and both idr_remove() and list_del() are skipped: the
>> overlay_changeset is kfree()d while still linked in ovcs_list and
>> registered in ovcs_idr.
>>
>> Every overlay removed through of_overlay_remove_all() thus leaves a
>> dangling list node and idr entry behind. The next ovcs_list iteration
>> or idr lookup walks freed memory, and the ids are never returned to
>> the idr. Nothing in-tree calls of_overlay_remove_all() today, but it
>> is the documented API for removing every overlay in one go
>> (Documentation/devicetree/overlay-notes.rst), so any module user hits
>> this deterministically.
>>
>> Pass a local copy of the id, like every other of_overlay_remove()
>> caller does.
>
> If every caller passes a local and updating the value is not needed,
> then we should just update the API to pass the value rather than a
> reference.
>

The value is used, just not by much. of_overlay_remove() zeroes
*ovcs_id only once the changeset is really reverted, and unittest.c
leans on that: overlay_18 injects a pre-remove notifier error and
checks ovcs_id survives the -EXDEV, overlay_19 injects a post-remove
error and checks ovcs_id got zeroed. The return code says the same
thing, so by value I'd drop those two checks and keep the ret ones.

The zeroing is also the double-remove guard, via "if (*ovcs_id =3D=3D 0)
return 0;". lan966x_pci keeps the id in data->ovcs_id and
of_overlay_fdt_apply_kunit() removes from a kunit exit action, so both
would have to clear their own copy or start getting -ENODEV and a
pr_err() on a second call. Easy enough, but it's a behaviour change,
not just a signature change.

> Additionally, if there are no callers we should perhaps just remove the
> API.

No in-tree callers, yes. It's the EXPORT_SYMBOL_GPL(), a paragraph in
overlay-notes.rst and the same paragraph in the zh_CN translation.

If it goes, the bug here is unreachable and the patch is pointless, so:

  1. just remove of_overlay_remove_all() and drop this patch, or
  2. this one-liner first (only piece that can go to stable), then the
     removal, then the by-value conversion.

Which do you want? I'll send 1 unless you think the backport is worth
having.

Abdurrahman
