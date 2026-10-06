Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A51F3B42C3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283300; cv=none; b=YfOkdoenDWjkF8ptezJAQesz3FJspS8aJyOtdNbbHCbiS0zZnnjiIGC1iSQZ7UZT1887Bh0w9lLBtEabIbAt+BORKoyzRi2/QJTIHVzI4S7T3B7M5pTmwC+kNKoSwSo/mF24ItC+Fke1Y14s8yFKfaJlFCQJb9zX2KTYL33jcoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283300; c=relaxed/simple;
	bh=zGfqUCx6jXAzT6zCCJ7NiL3kT8DKVER0oBryCp4Dxcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js893XaMW/vYBJiYR/HmhVQYOKjWUBcIoCJ/1dMakWVpvKStHWIwLw5xh4DPCQe9+m4fdtWkZj3FFc67L1MRMatqACier535FnfZbRamRmcqqVe6XNIa9HCn8ceUEzhdlqWkLlBPKB0EWwvsFuOa+t16mKbrSFXqIou5jdeNBSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiGJzJG5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiGJzJG5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso326599f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283297; x=1791888097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u9EgTKWvY83NOreoEpihq3C4uu+WwUDt2rznQTC8D2g=;
        b=RiGJzJG5n0Z9tkkWW7q5OVVdQFwdMvdu+B6c2pZTXH1iwDGUgdO3b8B7KhDcaUbklp
         SKsBPoiSn58rLdkGnYH/02aMimAfPT67yOsv99OZ52ZMpIbcfVAIAQtF77EN+vj2Tasi
         BiFj7fneJnlFUfnyNB9scjz1o/ACOrXOZTsCW/ONz47k6KL79ocllOEDynh2hFF7KYD0
         YLmhJYYDwVbtaNesv6EhF9Ofxbho94LWWIhpYt8jidhWhxZiHQyX+RAlllHPA9i2HlKC
         A6n6WkvufLuhIZsHCNFP9MrrKfDY215t2WPG/smIebLumLZuQlT4xxBAf5h2FK7/Mf+D
         Lu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283297; x=1791888097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9EgTKWvY83NOreoEpihq3C4uu+WwUDt2rznQTC8D2g=;
        b=rURBO/Rp8SvFE7g7CVwtynh1TVvp+OQgM5AEbRIG+q4Twq6rBhxRUSkRqXLpXSmg2r
         GTih5ICuFlh9/YnWL+hVYQhUFBrLZ0vtcYmIy+IfPk4ZfqyuD5QQlrWsJ5I/gGVsng0K
         gs1jm98Y13d/f4agrfiRm1unYEQUQmLy9U/KkvWOaICqTu8SEHAhZjDVTGZO7oL+1fN2
         0yZNpwwzowh3OvOdrGmm572jlVBibhQdnVH9/EvkWTrjS31pBfR1uINMYMke85n1+o3W
         lqSfJ99aGe5Iy4yzb2r8s6vYBFt1UlkR16x47NJ28laP0E2UWofwZEMeOFzofXXOC9fS
         TJgQ==
X-Forwarded-Encrypted: i=1; AKwUvByksJZB1RM5EsXK0xlmPez/r9VjyB3BEV/DpvEBYQPEuFq3BjaRqUb8cP/AwutWQDv2ZMoTg4/cm4Ms4Oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF2tmi5SarRdM8wuGMdugi02cK9MjB4Hm3kYiRR78QtFByvkKB
	V8LxT1FG6EPSdQkk9kLfhDRJsnZe9Q3pV9AVsb+yToVXrMLEcbouDrE=
X-Gm-Gg: AYBFou1VQo7v60E2WxICcB5uvHZPKg97lobFN3yMRUdDQeygp/6fiunxajjBcvcrgxR
	uHWULVZzXEnhqPukjkdkLQSVQc3WCAH8bUqH/ygyzJ1q4istGhIC9kC2zZIuZrPNdGIfBo23auM
	T+dvZj7r7S5etPtJRi4FzWlRPAofioQMLk8vPjEFu0qHYvLgOiBUZK42kG4D/4sRwNGdh5n267+
	uEiwINBYZBv2xwA6WmdPWBh24JT4MLU1FTx162ba6qCD9m0ESIDzNbFnER+7Nws006dbWp26C0m
	0YJalxJha1u6p+G2rrab2Tx87lpVbvFr5xGNeuPkOxRMDN3qFy6N9jHAKreu/sK9rE/drDwZ5i1
	+FkzBKAtbqLOEcrkwnKxnUJTPWJltRCwA3NLuuUTD0+LuB2BSS41r6+svyOwPOR9Pg95XHm9ooz
	/5MXqp8E/vQfmfFJKz7e8dYAKYsUaxCCH+UKKsOD4RKGlEM/5ydQ1kz5/cUaxBkznig7S/c30P7
	5yJz7uDqKtgfWRNlMxTdkLkw98ZBoJz6jKU3aMlOyPfyWBTdA==
X-Received: by 2002:a05:6000:2dc7:b0:48c:41c2:46d6 with SMTP id ffacd0b85a97d-48c6d1c1c1amr2258645f8f.35.1791283296969;
        Tue, 06 Oct 2026 03:41:36 -0700 (PDT)
Received: from lithos ([2a02:810d:4a94:b300:d1f6:bf6:35f2:f07c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622704a5sm22046834f8f.15.2026.10.06.03.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:41:36 -0700 (PDT)
Date: Tue, 6 Oct 2026 12:41:31 +0200
From: Florian Fuchs <fuchsfl@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Adrian McMenamin <adrianmcmenamin@gmail.com>,
	linux-kernel@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>,
	linux-input@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH 02/26] Input: maple_keyb - fix key press detection
Message-ID: <asTQW0F2nqp2Kj86@lithos>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
 <20260703-b4-maple-cleanup-v1-2-41e424964da5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-b4-maple-cleanup-v1-2-41e424964da5@gmail.com>

On 03 Jul 22:57, Dmitry Torokhov wrote:
> The key press detection logic was using ptr instead of !ptr (where ptr is
> the result of memchr searching for the new key in the old keys).
> 
> If ptr is not NULL, it means the key was already pressed in the previous
> report, so it is not a new press. If ptr is NULL, it means the key was
> not pressed before, so it is a new press.
> 
> Using ptr instead of !ptr caused new presses to be ignored in the first
> poll cycle (only reported in the second cycle if still held, because
> then it was in 'old'), and caused redundant press events to be sent
> on every subsequent poll while the key was held.
> 
> Fix this by using !ptr for press detection, matching the release
> detection logic.
> 
> Fixes: b11d2127c489 ("Input: add support for SEGA Dreamcast keyboard")
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/maple_keyb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
> index 3d5538dd4f23..623d7951405b 100644
> --- a/drivers/input/keyboard/maple_keyb.c
> +++ b/drivers/input/keyboard/maple_keyb.c
> @@ -107,7 +107,7 @@ static void dc_scan_kbd(struct dc_kbd *kbd)
>  		}
>  		ptr = memchr(kbd->old + 2, kbd->new[i], 6);
>  		code = kbd->new[i];
> -		if (code > 3 && ptr) {
> +		if (code > 3 && !ptr) {
>  			keycode = kbd->keycode[code];
>  			if (keycode) {
>  				input_event(dev, EV_MSC, MSC_SCAN, code);
> 
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 

Hi Dmitry,
do you want to pick this patch as well? It improves key press detection,
so would be nice.

Tested-By: Florian Fuchs <fuchsfl@gmail.com>


Regards
Florian
