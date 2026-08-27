Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8594432FD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828673; cv=none; b=W0aFcRn4iL1h3nw+dADpNGl8NraTQ1JZciuYoZPFg6yW3wxuxcgtj1gKzxX0zITofyTeCFmi9nRq26fYjKMQwmWWAo6v3T8BcFphn8+G8JS306wfsbtfaYbDkEQOZz5F/cVK80ACtrXPJ/x+RA49Y9qTaHbJlwN9SNFIRLrcZQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828673; c=relaxed/simple;
	bh=j5s/NgS7kFJNIqCN8n4on73ScqJcMswb62IjXx5qwic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBuN6JVDWfqReLzzLfkRfjP4leFwH9EGIl9kKyZe4TdTTOUuXzb7RHfyJKbJcUQN95zaNY9DZk4f1LU69+KLWbtBJnJIsqYTpaqxD7SdSPGyrrtQteAjSFwsDScPWQCenIW0qkQgpE8Mn3DeLMe5dDdDQdFBitruBTowmu/0Dfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FNw8KbhC; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FNw8KbhC"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-745497ac8fcso522495137.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787828664; x=1788433464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYUvIldewK6PvTP1rIkGVol761Yt1VpaE72Hq+Vq9o0=;
        b=FNw8KbhCcFSwTglC597qKWzfOLEw4RYygJYRLUX9ZQgIn8NC/s+qUR79j/iDikaizo
         T8cymdv7v/kGgxQ5nJ864vpTUP/pLfrn0iA5JmOMZCGOZh/B+/8pTtv4cX2kiIdUWDIi
         bupNEoArLvuDRZ1uT8O3MNpp9Zuyb6JQftj84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828664; x=1788433464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYUvIldewK6PvTP1rIkGVol761Yt1VpaE72Hq+Vq9o0=;
        b=EoQ2o7j4lOZEHy1MFsqtybO68atb1I5PojkSGkWWESzgiATGXPS1vJnJlw6gMw4OAI
         PpVjOM8RN+kv5jIQfmotQhcX8Il188tdYJFsRSqiAaGB9egN3f30Ua6OcUL+MnfW8pi4
         kEmywvvjTu4p3BsyiGZRUwR6hAwIV7NidXFD6HiXyc/cs0qNYFppB/wYfNNNqsAbeNJR
         OIf3JyQS+b2ykqbkQcog2lmicCbw5vW2DYe768oTle61PwFXMiZUpKR3IYFlcs7t9CpE
         wLVsaa6l7yF97b+SucaWXuLMMS6VTjzurnIvN7f6L6k+bLyhrnyEKcj4KcVBnDct/y7F
         XXwg==
X-Forwarded-Encrypted: i=1; AHgh+Rro6GMb2Dvkq2q4CawPwRXjrVtT6FZKoSIG3x5JgxpUmi/xEK2Gcr8CoZCU8gMiu3HvYtqYAapaImBkv/M=@vger.kernel.org
X-Gm-Message-State: AFuF++lRF3wQtlQzFy425Ot93ZE/eBRL+S9nkLJ1+8H3+qLofsSVdpGt
	4JM+eIwxeOk2m/QC+pQUwQW0IJHSb0AMnCFpUd5AUymNAZ+zRxLvzL4cdGjcC91rBs/YYmjnQIv
	f6qI=
X-Gm-Gg: AR+sD13/vq2Wto4SgYAPYP79S7GI4ursxGUKJ3VN7sUAv92l7WjaaTgn8/hSJP4oyl7
	BDBZ8mKUggOYbag6PGUiNlb4WcNQEsowJtYWL+a0yugOGw23Gri+/VRMNagiIHrebbyMxTVdVAv
	j0qoRNPFJwV82LjqDqwGhH6xkv4cnXwpxfXbKrsPztjsj1xMhu3uLv2+9C0qY7cKDQTIzzOeX0w
	5vej36acfw9ArbBrZbnOZ+dRWeQhuke2C7wbhzIyL7J2vbzGSq7kl/Pe5SdhLwMzlHeKmVWtXCF
	ncKNoD6BwQt4+Ht7Q/Tx7Wvj9Cy/xGYmsxSgw8X5WMRZGRkKdJKfeNIEMuXTkmwpWzpXPqPjo4D
	w+F3V/TgwxKN2oe8ckk0LXTcFcX85u0cGThXO47h9NtBG3u/gX++s+8f/ndwGdEg+VPCXYxM+Ke
	FVNjJA9N6duzlYsFx6coa33adb2N9zzIMUUbREjVZglum7ukWjKcuJY+LgSqvgiVEK0L6IANAri
	uPYjcWugdN2VSWvKu3MxFY=
X-Received: by 2002:a05:6102:3c9f:b0:779:dc0d:2b2d with SMTP id ada2fe7eead31-782c0bf8c46mr4363627137.8.1787828664213;
        Thu, 27 Aug 2026 04:04:24 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97d92e64f6fsm1393159241.7.2026.08.27.04.04.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 04:04:23 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so495902241.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoGO2x7gFYrLRXQMy5cByYmOhnX++wjj0zD5BYQkAtf9GbFk7jF9hPKrC28EdAkHV4wk2icTJ7ncl1Fwh4=@vger.kernel.org
X-Received: by 2002:a05:6102:3c9f:b0:779:dc0d:2b2d with SMTP id
 ada2fe7eead31-782c0bf8c46mr4363524137.8.1787828661149; Thu, 27 Aug 2026
 04:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827105738.8570-1-wenst@chromium.org>
In-Reply-To: <20260827105738.8570-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 27 Aug 2026 19:03:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1niht1VnNpZrqVaAb87FLVM7ZtJLOiDgCroGVRg2w09WBw@mail.gmail.com>
X-Gm-Features: AcwNN1XxLwZk6xI-YXSc5CYXIrMIXfGVUxLqoDEmpH_birCWDntEpyOtQassyDE
Message-ID: <CAC=S1niht1VnNpZrqVaAb87FLVM7ZtJLOiDgCroGVRg2w09WBw@mail.gmail.com>
Subject: Re: [PATCH] pwm: mtk-disp: Fix period readback
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pwm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 6:57=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The period value stored in the register is the number of clock cycles - 1=
.
>
> Account for the offset when calculating the period in nanoseconds. This
> fixes the discrepancy reported by the pwm core when CONFIG_PWM_DEBUG=3D1:
>
>     mediatek-disp-pwm 1100e000.pwm: .apply is not idempotent
>         (ena=3D1 pol=3D0 281500/499875) -> (ena=3D1 pol=3D0 281500/499750=
)
>
> Calculation discrepancy in the driver was found by AI run by a colleague
> while debugging another PWM related issue. Check against SoC datasheet
> and fix done by the author.
>
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>
