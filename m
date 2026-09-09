Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC39517BC2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949743; cv=pass; b=CowLZ0OXGqioxDgBl4DbXYrxU1ur2KsqCwP2mMT2xppsDKKGmtK7P054njBFMqCaVJLZ+5D6KyABHpE3oCB4+BhopMnpnpnVbPBmKgTOj9p0OMgId/Si+jhxMQBIt9tL68QTKOly8jkXqteSeajvt8YUpDJk0nfhmd3mGQ611bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949743; c=relaxed/simple;
	bh=dm74D+wMkQNMy0+W2SboKeYAs865/zwpAubEwT5yoPw=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpbf96pO6SgToD2DvjJ4vOXHI1BJ00f+//RyxecBzMbuwmCT3Arhp2uglNbXUaScSeYGg/ZWYTD7idhE805Yj/fWbcoRb5ivfhwTZ4W7GiF9NNaXRb4FOZWZKFaTakn2Jza0LWJXw4ApjKJAX9gqtxVMk759IeZPO/h1c917tEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbfn5/vD; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbfn5/vD"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b31bf4so606071e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788949740; cv=none;
        d=google.com; s=arc-20260327;
        b=GU7vjYG8XqtkClFAqy6ga21naEGIr69qadybN/+19/5PzLBcjvQ0Xvmmx7WW8mX+/K
         Wb38uGpLWNgg+/WSDP1ZjWrXqOeqbc+e9zDvobfwKwCh8UZsZNPEoTZ33eSkKSX3djLx
         wDoDI7WSpB2miLcVHrCQSnHgWPl42T0czO2YYgSAtCorU2ZP1ll7qvPp3sCuCyy6/FxB
         gYcY+yHwP4wNK4aGsyTZ7CQYRDvipS5VL7hKSrLaVOMLZJ9XKRn3C4+Zqmuo14/u2WfK
         PH2O8+xUq3ykVRQ29Au+TSM6zeUq0A7GO/s00sEBS7bSc0SXoqvkpq18m3msQ1LdsVOB
         55NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=dm74D+wMkQNMy0+W2SboKeYAs865/zwpAubEwT5yoPw=;
        fh=f0VZRhfpU8h+ADERx+kzEHxFLY3gSjZTHvywXUUHb0M=;
        b=O6iajgF+BkSgBF/fa7qm4btOBJ1ENtgLWFkdlcsgI9mpGRPeFPrk1khMM2IENptmry
         jBNO3TgUkteJgEZ2v6EUNu+wpPGHaY5rRsXTKCXppnFapZij4uKBancoHiofTnZY4v+5
         g+mrd84zdhZKrff5vmQbwg20vRXKPQ+PrmjmX98zOIBfyB8cnMegHOx4KQZ6/fXc8aRh
         ZRCeQzobLp5kppdELgiOdnGsX0kmw8pG3VNoAtJz7PVhhsvT/6HeajvA73TExh3DRr4Q
         cgRSAbNNbuKK9nmltH9vvVZyiuK+KsQlHTTrGnQ8u24JYgzk8sRpmP98ZVt1APYq8gWa
         J14Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788949740; x=1789554540; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dm74D+wMkQNMy0+W2SboKeYAs865/zwpAubEwT5yoPw=;
        b=kbfn5/vD52Xx0hHWdVYALiX6tNDHW5L6a3+TNfOu3g7/1LdbJZa6d11WY5eWQUSSij
         ygZQElfol1WVcqMFY7DMBi6kyxAAo+BBFf9w3iXxzLWZPPXAEFVKqmff2PWZEI5dT3W/
         ZD0ic1MRhB4lT+MYsd4yJXmWz/EZeSzUIvtHd9SOKJyT88MEze0K9YlZuM/TMfB4GnWw
         NZ36N2Gn8tFGai4azk2a8KqF6wm53szTwIC48wifFfse1hZ0Hwu+T8o9eIRw0UEDRgnA
         2I1oEbY53yLMTNftcyJlBosUv97h5+zjX72w6nlp7VtnbLtCXDYyMZMURTqlP3xmU5Bf
         ld2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949740; x=1789554540;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dm74D+wMkQNMy0+W2SboKeYAs865/zwpAubEwT5yoPw=;
        b=o4bB847AN0yzB4MLNHPgEyAJKdXGfL1gXD1jXNIc7Y0aSrVYLc22i7tjYoyp+VWJE2
         552qCq/v46vGAmE595A71/RhnLoa77UkgdOTl56w7Yi7RdST5hNiK3JtwluOzo2TKIL5
         KDbQIvdZjtn5VZtSKOFwpdfM2C3W6u9smrk1thA7clh/8d2yYRlFk83PwAr2L3WfUvxh
         ohs+koLXxrzImqBLaZwW/xyWPfoCb5R4D0voSKgGqlhc3XH3pQXwd3TOFZSW11v+65eO
         JNNnTCb9rz3rbp+A55sDpgAMB704LEvgn8awKT1mb6d/12vWe4ICqXku2mUR5EfgdGjX
         4/LQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgRqzB+lMKWtbmjL932lxL/+1Vbh3SackTcQkxfr7cQ5aMNGulZ+bFCfybB3r271QEAKVWTXTRQqn6jLE=@vger.kernel.org
X-Gm-Message-State: AFuF++m/bxIL5w9sOtl4bK+HLfONeHqQDHG2engJP4TebdruDb3hm6be
	TSVfWchmgnYo+cYhq+qqVgsBOfqIshkX4P9asYiK6uTGjFQUtz2S3C8G+7WghyS5HSoeg054J7K
	mRHWKKiMWg2MjL2fEnpcHqa2IkcOPq94=
X-Gm-Gg: AYBFou3p0LePTq9ObjHF8C2oUJ8xVqQqwURGMeIb6C+5c23JGXPWj4Xx8eEArOd8z/g
	O66p0jWEBfpLBTQlhuWEXS9urdBG1gkA+RRNt85HmwV4SC1Q6tCPBwNeuHLvSZTNrxyqG6TMEsC
	Rvf0t5sE9Ju1aMDR8yXvCJ7mh3BRInHnCkXBPIN/iIXBy0tzw79vhwsp99w47gv+pRiBQaXEHsP
	55fEh0u2ytaUGCbaXs8ptTvud6p2CkbChioTjDhEKb8oNB/VViVff2qcEjQ3Rk1CCm3UTU/xIAw
	QgE3kIF8n7lL48T+VyV1g0bl8o9Bd+0y+1dNNbfoG8JJSbfFtM8YKRimRAMZWNFEFpGVEkK5fQJ
	gQ1ySZeOVayJ7xqnnmCS4mh8j2nmckztLG2oU5perA3HVs7Ve6BA=
X-Received: by 2002:a05:6512:1329:b0:5b6:1913:8d38 with SMTP id
 2adb3069b0e04-5b74d53007amr4421132e87.6.1788949739610; Wed, 09 Sep 2026
 03:28:59 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 05:28:55 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 05:28:55 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2026090833-mutt-whiny-242e@gregkh>
References: <20260907185001.1567957-1-miguelgarciaroman8@gmail.com> <2026090833-mutt-whiny-242e@gregkh>
From: =?UTF-8?B?TWlndWVsIEdhcmPDrWEgUm9tw6Fu?= <miguelgarciaroman8@gmail.com>
Date: Wed, 9 Sep 2026 05:28:55 -0500
X-Gm-Features: AcwNN1VIuW5R1C4C30YvVizM9RLgpK4zIRN-8f2fSAOShJPErBt4yMIadb0ME_E
Message-ID: <CABKbRoKwKz+01bBMU_tq55aUQd5ao613v5n=M4zRjcc+j6=HkA@mail.gmail.com>
Subject: Re: [PATCH 6.6.y] Input: aiptek - validate raw macro indices before
 updating state
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, dmitry.torokhov@gmail.com, pengpeng@iscas.ac.cn, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

You are right, 6.12.y and 6.18.y need the fix too. I missed those branches
in the initial submission. I am sending the two backports as follow-ups.

Both apply without code changes from upstream commit
95dffe32a66cbed07fbfa7afed39d56d5014e04f. I built
drivers/input/tablet/aiptek.o with W=1 on 6.12.109 and 6.18.50;
both builds passed without warnings.

Both patched kernels also booted under QEMU/KVM with UBSAN enabled
and passed 20 module load/unload cycles. This was a module lifecycle
smoke test, not a test of tablet reports or reproduction of the bug.

Thanks,
Miguel
