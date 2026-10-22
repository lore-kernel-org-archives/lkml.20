Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792703676;
	b=A0/sXr8un4pzcjvQj5iR3F//qC28mRfBRuouJrCJC7DjvXvCxzesm8hqygZiek8zZ9CT
	 SwM+ym2IXi9umkta6d2RX+lSmcE5eRUWWLgwFT/ko+sU4js2sGV0D6T7+DDTnbo8U+xmi
	 g8FGyDfe9wvKkQehxdu41YRer91aR9YbtrVqu6w17+KXdzm8Yyy3vtrDwuaonqguVGmss
	 bbJYmdmGU16+dzf2dGjJ90Y46fgL9H3EddM4WPGHhlg7sQpqxX0fRzvbClPD7Driv3m+R
	 6aJ1mXR29zwGPyOiGE8QxthV7At1AkeHq5y1+qEvfOuo4H3T/9XcNCfQ72JNCDej/2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=96ZHwzjqsG6CUxMd5Tj8dG+Gsl2GLdgDoem+sCHFR+Y=;
	b=o3RuJ3MTmElKErrfTwYCz13LUzrxmfKJbpfQ9QOmhOw5z4cM3MafYfXXsUPWQ1KhLymB
	 wfWj/JfwF6FXjnjOVdVeLGPGH9s09C29zASaRXCbJxgm/mfOJGoYfWvmItuMo4GiL3GUm
	 dSNVzwP0dFqWfFTgu6wy912jdzzwGUaxpt+zkELSi04QaZTQLf5Ih0av87sZEn6FDpclm
	 lGdx4/ifOqhnPuJIl+R/uPuIc0NPjPc4pyxyl4SGTHI0AWj7TGQT60exJuEYbXUYM78PA
	 TN9HUYIaRiuDd1GbYRRp4CcJid3ZHZufMRigqrRmp4H/bxYGsooPJHKLDIiXNR88qwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JGperKwS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C6606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D3C6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JGperKwS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so2655285e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792703675; cv=none;
        d=google.com; s=arc-20260327;
        b=aCbUCCuKJOiilaAcKHIi9pCt9XzBP+QaRGjxbo2QSA4KmKbH+SlLXGyJKzr2yfO6mE
         sTT3gkqzSWEz4Sv0lLMnOPv3jHWzYHZ8uLgU0GPr9PcA3yacmvAOCg/9L7rbdu0YVei2
         qY6tSZnZIWD0QUzPP7dyGTqOkShab4G4fom8oLvU0wfGc31fXkzUTGpBNhd2mnsBsG9p
         A0M5TPJY11JE6S4AvbayW/HMCtOO6Ly972dH7yPynqUiGVUjAC0E9JersAUABx5Iu5YI
         lKg0Ri7VvWoyw8awutmkymLudxYp4WFZP+WBKGQiD33IfKF7Dmyow2Wizt9kgO7OgqEH
         Y+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=96ZHwzjqsG6CUxMd5Tj8dG+Gsl2GLdgDoem+sCHFR+Y=;
        fh=BWqnlr6mtyZNbB4mijcQhlydA0OA1EyPhlONnEdzLj8=;
        b=W3s6AAB3ZfVUCP0+HWlZ9YREok9QhlfsB07ItCpErqoFpAhnqykDm4eBMx9zLjnXab
         ezT2JhEtv+tXPHWzJoxiRpy8G/Xqyin28nYo5DqrW2jsDM39ND6rGdaksP8yOcKF59FS
         oSeJmMzTP2DNWsF9KMnIg/E5RMYbdZOgeGpQfDVetL63WNjmvPAOu4+zpjphyI8dsd+Q
         jWMbxKLPSaDwdQ+mm2cLcR/KLH6AWaVYaIo4/biYbe+EysIgVZPlcWA/qq/qpr/Mkj49
         8ZnUzjy29Ha8zREy9Hugl3CVHzL6fkFyJ+c6YR5+Xw11FBYCERnOjrOfjaD7svRR/Wnb
         THiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792703675; x=1793308475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=96ZHwzjqsG6CUxMd5Tj8dG+Gsl2GLdgDoem+sCHFR+Y=;
        b=JGperKwSxAFOqSeYlcMY8VSYQUgTD30IBeJ9wSJNKJ3+n2Z7YV6NznJ3XrPQPJX36U
         nER8VF+WL+ECv3b7q3hFgQY1v87teuYQiGVqDMLfIB/lwM0bkkKSCf54FEPAqCw3xp6T
         7n6Ny4Ndo1595EjB3mi3JKnhX7Hdb2rJO8/mcsUuyzhYhpP6W8iZYHkbvpYBxPrgevxv
         5yvWZfd/HF1yXOIrGkXNDxn+r4X2cS/DVqOgFUAehFTHWgioHR9JLTlpm+UG6IJi49/r
         We00WdpozzQvANAHZLd/Uoox+CwiNXBkFQjOsAqYOUc/IiMn0gWu5sbiEuRIqBuRoQvv
         iW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703675; x=1793308475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96ZHwzjqsG6CUxMd5Tj8dG+Gsl2GLdgDoem+sCHFR+Y=;
        b=fzobriU11n6GINLvzsTGvwRjSl6LNpJ201JkLpT/pVKuWCNhTjBJTwliCpzQEe7VH6
         S5XPmz4hwWk2dYI5r+7QzSBx3oRbEtTux1gfokz/X2XGXfNoYtI5bIu77CzYmCctUQ0Z
         m5/4JnHfHr6Uweqnce2EAaxwbsIbbes9z1XXqHLV+PrsOWDzS73fvxYhEPM6Y6BMLU/m
         YJnNhb6x9cde9L1h62iaa9SBdjjsS3WmpJxICAYI17E53KErU83G2876Ejh+2WhNZSUX
         NNh76Ea/mnTrJOCymaOhuxpVD3PATUoeknQ0wEyqSEGymS22pu5qp5ZioHEMpq0HxT0U
         nJAA==
X-Forwarded-Encrypted: i=1; AKwUvByYuNwrkLbz2TBkzqBrpwkYCItV0FWoQGkB4xA2EwR4/r0BLO5CtqK7F9NV3KBow1Es4LKbBENgtWjoLa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZfyac5JfQtew5EULioMPQv++5J232NNO4iy6SSNPx7J+m9VAY
	yjaMFeu//JIMXG4Gwp70cYzgPixSS9X6jlTHs0n0N7VLRgSKs4W+ASbStGAGEE1sTCpxIBdYhNu
	xXHLjwJ1S6m1mSaSGmUuW6e7Ndr4GylksHcOB2W0=
X-Gm-Gg: AYBFou2zbp9MvDXxFNgJ0cyeT8IENof9bwPCNLfY+HRi1Ez8/VBKzGXRQ8rnZxJA/f1
	RbzdwBiNq7xBijP824NolXTC51iGdunG0tdJSfu3VLvVuSE+ueqn+4kluXmzyj1HX7TM8zuKhQF
	W/wWRcAEYkQvFsctOJZmZBFWspjgXOwgV6iyTRR3vqYLkJ+9uxp+QuLXtQnGXQTDsRg5wP7ISDA
	xQbLbvVfUvGjeORb88rJhHki7wTFk8CrPVSsRZ3KkhxfS+s1NiAanNHw1Q5FMPDKYZ8l38QgEAM
	ktbWeOJW+RuAGLFIfMO0m7avM06dT+ULSwkGbo/xHTKjpgILo07HvlGL2SVSEBZ5GvmdVRsDZT0
	uPo/+OHBTGRrIfIA8yB9Dg2FLZb+mf7FwQkImrWEAJxRpofo6QLLDexF8kZ8hQ6XW3i0zrhz+yf
	YDENE7RPZA3ilfRiPJZCUxnrAReVUHFxlpkRZ1AlsF+6+6mGuzTBHLlXfSobbwwssK1cQxi6GaG
	XdmkSU226zLM+oWaGFUzjG3eIjqEN+I5UyQFOm/HqgBlPp/wYvKL5717mYdWNxQz9Z1tyYieA==
X-Received: by 2002:a05:600c:3114:b0:4a1:d492:1604 with SMTP id
 5b1f17b1804b1-4a211eef48cmr3769275e9.11.1792703674569; Thu, 22 Oct 2026
 14:14:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001202134.33929-1-dwmw2@infradead.org> <20261001202134.33929-4-dwmw2@infradead.org>
In-Reply-To: <20261001202134.33929-4-dwmw2@infradead.org>
From: John Stultz <jstultz@google.com>
Date: Thu, 22 Oct 2026 14:14:22 -0700
X-Gm-Features: AclHuK9URtH2ON3X6rfc3JDMMJdWLGe0oJiD0me7jB_6EoRn-wwYn9IXCmD2lyg
Message-ID: <CANDhNCoQM0TR1pxX9rRSHv5OZQQnobFpZ3ZUw_rn3gEKMvSUVA@mail.gmail.com>
Subject: Re: [PATCH 3/5] timekeeping: Bound idle sleep while a phase slew is
 in flight
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Rodolfo Giometti <giometti@enneenne.com>, Ryan Luu <rluu@amazon.com>, 
	Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:21=E2=80=AFPM David Woodhouse <dwmw2@infradead.org=
> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Phase offset for adjtime() can be delivered at a rate of 500=C2=B5s/s, an=
d
> for STA_PPSTIME potentially even more. The skew is recalculated in
> second_overflow() each second, and if that's missed in a tickless
> kernel, the skew continues to be applied for the whole of the idle
> period. While skew is active, clamp timekeeping_max_deferment() to the
> top of the current second to avoid the overshoot.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: LLM

So, again, this looks ok at a high level to me, but I've not really
worked through the __do_adjtimex changes.

My only hesitancy is shashiko has thoughts but I haven't quite sorted
out if its a real issue or not:
https://sashiko.dev/#/patchset/20261001202134.33929-1-dwmw2%40infradead.org=
?part=3D3

But assuming you've evaluated and dismissed that concern:
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
