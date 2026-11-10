Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343190;
	b=dZhPky58OjKlT2Fky/qozzTVw8wXHr6a4/2tKbhqaRhmLvGSnnl7hoQlHk6xqAiyk389
	 7fHSJhPLq80g9spt0eBmaHGAtmKnxnva7Kx/1MvyJGqsUj2OurhiKvlh0B3aZeJFan0cz
	 9uVS207Dee1utm+9SNOYWPAca7I1cenGpzJ5q5T0Y+dehhGLbMZZuOLBqOR9Yt9aLci4d
	 sQKLfKJyQo03SaoTXWBaHP6NQLcjC+apfZMYLi+Jph2nx1QKmWdoSM6N1qClAaOm2fCMK
	 iYefKbmwWGe/TEx59XQ3fvBBjR1vEC1N882/jAkzpBIhuDMf3ddu6y17U+KiuymfJbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J38IOBfpsPbN5SosP8YUKlgzemikThjgLknjw6gg0qc=;
	b=p9uuk4F78oB4mJNX3fN58zJIhslgkOg2VQB0vwATJuL3uduauuq1DY4Gkq4EuqnZhq4c
	 uF7CV8PdzpVHiubRbeygdYSCapfQESHzPHH6DKOdxsSu68QhwMXg6eHLPGusWHMTMN/BN
	 C+eS16P9HLTLYLt8Paam4ziAkq7g0UgAN6UEXd1kPCnzKnYCvYNVf3kSa/ASt3G9oSDA+
	 eu2mh8J9Yhpq/mS/E4KW2MvPA/AM1blqTUm+AY5c4c6Zo9W1q5G8bjgJJsw6aOTExmGam
	 F1Ne89sM083NTZC7YFZ0PS721oO3xg3mpoYIYylZE6GqSdAqt+eNoh0ChNkVGZuOpUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lH7jYkYk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F896606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F896606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lH7jYkYk
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so3833737c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343190; cv=none;
        d=google.com; s=arc-20260327;
        b=FMKWGx5fp8JmLvb6fSVzKxD3bvg3V+RB1e5y3kA75XSIldxvnoS5ocKzjeBOmwInLn
         EbVk/QBp0Oy0zFxlKnMSWJkcU7O5rKPu2fx0/D+4Dme/cy8MEZ02Sbdy96T6Ug//9lTh
         M1eWf+9XDiugJAUUEstepsqmRwO1QNhWPWSdMQrJY7LTHrIKzsnN/KEjMTBnsfEaDzUV
         HwtRp24xCAxwX3zRnz3o20XKDhjqgxOtkciB1jaQ5PetSfDIkKd6/npl9WbZxqpgzJuX
         KMSpvxaIk1TFZZDbNm3RguzTd/rBN3T3gIGEp0CmrtOnEsGY9qgcQmzErGUe8lFZ3JQ/
         oEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J38IOBfpsPbN5SosP8YUKlgzemikThjgLknjw6gg0qc=;
        fh=q9WHVNFfnh4R85Ff6Qy4U7Hcp51ud+6JatKre6mrFVE=;
        b=C+dFRpmbIXCTiltuVUH0KRw7M9sNWOGutaDgdK8KCCZ99gAp9fu2QPQr4EqFhDelfM
         qbnUoeWeLhh4XrEcmOoxS30se0eD9MKMxogAb8h+N7J9Ls6pZIPVQIa2QfGzqwhnFuGh
         N8/gwvOs3SFjLk4kwHzJsYC0rXI3aQq2/i0BE3+jSHMkPVEPX2SaiPAhpFEKGB4ZYBIo
         sf7GTqXfW+1StqxGQcrgdsWzeHr+Uw9e9RKBKYSmLdNOhb16wfZJ5+v+k7Kr33QHmPcY
         Qg/CU7svMfAsmJPdWgpDoBxrleXt9k4+BzCFrq3wnVvVkmD/AB7gMBlRwJP8ep/w56Dv
         WlQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794343190; x=1794947990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J38IOBfpsPbN5SosP8YUKlgzemikThjgLknjw6gg0qc=;
        b=lH7jYkYkBit029x0XRy3Vqjq+pQpxwph/zmx39p4QB5e2gxZsAaIBOWYNIulvCLWHu
         1gy77MPNTdsVkefpb13cZ0OjlxXJEF9djKNdAO4XHcE1bSAjSQG7UZdHP/WTcadu6BS2
         0WoEbeoVxlmmwu+eloGm1uN1NAgCEuT4BkvCrCzshIUpPSlXTsTT2DxbabT8Wc4O1Q8n
         pTtgL8PRLolm+oA1UCnMyGACegbuFDI0JzY7mPKzebj651L3VAQTPJBIX2UvYIynC9il
         9hmHgqZQ4TQd6xWxtBl/SwrRyrJ//J1nBerAwlnt55xQo1LSmRHOBE4txl7pK9WwdSxu
         7Jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343190; x=1794947990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J38IOBfpsPbN5SosP8YUKlgzemikThjgLknjw6gg0qc=;
        b=0T5hxrj8wl4q5SR5Ao/qWO+g/9S+7QNu5nBPwRFWDx8aauD8jc1nYYh4habPcbDQlf
         Ywn6CPag4XKaHh0McGb5YBf+z+WcvPaLZSfPF+8KXzF1Xa7WyLnEc7rQ4sfeFjHT6gN9
         qNmXgx/x3ombvrdpOM00eV41tVxgDUz5Bzji8Dyniv7RMs66FK/EvgktgtjahbmmlLA+
         3YAAmnwR6eTcqlktrXaDLozKvpQUOqVGELooEy6BZX2A8pFo53Fc0RIuqFRivuybt4NU
         YmC7Hr04qAo97tiXnWMhziphgWa2vvpaWRcVaPOvrCrOw1D4io9lIRVX1g4h302yLvZs
         h/rQ==
X-Forwarded-Encrypted: i=1; AL+hErGskDGYUO1nL940JW69/BBXa7Lp+bIMMtMgAO48ZMsVwSzGf7eEXRYDlrcZ1IpenTwunF0QhfvOcyoOYX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z90hBuWj88Sl7kjStVoO+aId9ZZL+xZFUpjoEuGKcpahRaQAMzR
	o4llmiBliueOLAsjHcbN2e8kCu/FWw2D2umSc2zBgvXZwL0EvNCRnxaZch+f+cBGylLNi+etFly
	yTsjiCcEj+CAAwQ1a0VWRQWzWxEARvpM=
X-Gm-Gg: AYBFou21DZkebDJwjCZmhcHtv6qOLR4XOr5TTNyfInMVAW+pi/djI5nxFp1mgRRWPPA
	Nt70fLKGsGaTUVQE8nuhJ01j6tI5TOakGwmysAVtOy9FNk6MyAkm/6u/7JrdH9bgOUAOPZKv9J1
	vXaFv94P18U70Bnhw/aMsZfgQH0Vj6UCO0jCxCGlEV3mRfMjt2d1lPofZyfrZJPErnsI/f9TZu6
	+AjCmy5X3buT0pYj2NfssU3sUj0KrZ9wlqnMfowtJjMN3SUPl5hJXPRYXgj++gn+VfeXyUQ60G/
	/42JZjYgyAtMlXszL6tERxk1qGBj1rMFwmoUOnZwP3vVgnraAHfuD7wRwuUeMg7WKlrWwdFxVxk
	zskB4QMwC0Kg0LroPWMrdAFuUwrk7Bhxyjj+j
X-Received: by 2002:a05:7022:1404:b0:1b2:366a:e7d1 with SMTP id
 a92af1059eb24-1b3c033beaamr5801c88.32.1794343189620; Tue, 10 Nov 2026
 12:39:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com> <20261110-legion-lighting-rfc-v2-1-845726afb71c@gmail.com>
In-Reply-To: <20261110-legion-lighting-rfc-v2-1-845726afb71c@gmail.com>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Tue, 10 Nov 2026 17:39:37 -0300
X-Gm-Features: AclHuK8ISHGBV8pjvWEvjIm6puJtyLzBsHrXTVOLHguQpEvun7kCzwgFU4q8l9I
Message-ID: <CAPKD0Hfao7drmVg1UFVn6BymFync8dP4LK6DpVgtw5SuSA6-3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: ideapad-laptop: Ignore keyboard
 backlight hotkeys
To: ciro.pedrini@gmail.com
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Rong acked this patch in v1, I missed carrying it over:
https://lore.kernel.org/r/4d0153a209a7c54ff513eabd3fd87445269279f0.camel@rong.moe

Acked-by: Rong Zhang <i@rong.moe>

Thanks,
Ciro
