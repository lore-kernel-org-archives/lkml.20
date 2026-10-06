Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB631BC08F
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297673; cv=pass; b=NnuTMXwSmmTIf5O/EXKlXteTP8b0mCgapLefCR5QDrXtMknuTm+DvEyJ8BdUJeNZF+gv0oM3eV+dCeEtoe2pemZmAk7oGHYuxjS3RDJqHnjO/Y3pHUN030qgXTGg041pQfVleyFbHfklY5PUB3uZSTqNwAXE0hzw/bC8lZDAcAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297673; c=relaxed/simple;
	bh=v/GsJDj9Q0Ij9HiaS1dDUSYj+explIch1r4r7AG4ZvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mm5vVaN8As8sfTmlXCG6trdwOvFBfvP9Mak0nr0AnUIZfbdC54Xm72UhHjhF86foxVV6L/n8c8O+8EM6ZfW4MIWF0AkoEliMwKLyKaBACBNiwf5r4STmB2gO48r9WgVw5BMuJkm2ub7o4Hl0qLUPO6csD0gGkSJvD1J/xxYDhTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+oxQupy; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+oxQupy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a49623b865so1811638a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791297671; cv=none;
        d=google.com; s=arc-20260327;
        b=i+uZ6Q99C28eYJGvH43YdNvW7zq5Wf5v4Vysl8tLiylxX4snciGq+FCBIllTtJPUZh
         sP8n2nNP39lz61S4UNmg/aGhVLftdn75O7EuRZtLMSxVMyWPm+jqBXSwd5U1/shO3vEe
         pOOwtO7DQE2JLUgdfvZ6dlSwVSyTW5Q50M2oD6Iud6H1SoAj7YwiRhcmKMfvl9pZa5Wa
         NpSk4B74S2Cu7pmocxzn/3lxcZ3jG3X2lIFI45ELHkxT+v2+7HvYdwmzz+OOsw4PkmDh
         BNUKlCrha2ynpllYIiHzTtbNAOThcL2b23ozl0GZ5xlDzY11D8U1/ndSSwybuioKkfkd
         yWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v/GsJDj9Q0Ij9HiaS1dDUSYj+explIch1r4r7AG4ZvE=;
        fh=gKwdesX6Mng9yJCABnG1b3j5veDhqlOm70t3+wH7LJE=;
        b=Ua+tGW+mwGvjTgxoXWP53otFciRtCxUKI+FJKF49ku4n2TpdlEOJV7aqeSBDbLsL3X
         eQAG7HUvDZ8x41n5eNFt95IvyCfbKRrHwX+W1VdIeu5nwaToYdkFvPMZbECo4TH4EQs8
         os3bHIol8MKCmiwymsuJ0Zema+msCsT9V6U1oMsAcxoF+v1wtqIpdaMRW+60u7wDV5WI
         nhD13DlGjv077qwXBpn4pPFButgMnuDI4xbB/AIJnN5qt3Bzcwqx/CBwfMKK/TgpCllC
         JBRh94W115X8qZcDz0Jy5dBr3RFdeadwxo0X+vkhbEGR6GIM9UrNk3N81vHwzHI4H9ug
         B/jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791297671; x=1791902471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/GsJDj9Q0Ij9HiaS1dDUSYj+explIch1r4r7AG4ZvE=;
        b=O+oxQupyIIBBhvKTa3w/s0bCMDMznrSh2OBwOFo8dFkoUsV/kpKGm6/K0iCPUKBLOt
         NJ4sF6/Ttjvc5dsJEN2JOkN93wvPN7hskF/EksdP+3AYNiCZAZ1eAAa6lk/ixWoWWCmO
         mr2uv/JVKJvzo/lG3KHJvGN3uyuWZ4Pocjd8R3lnocph0olqWab2U5gh1Zhub/MvY8sb
         4AdnbLF3XtiSSmNBQcQU6S8TNEoMdr0zk71BZu5yUjqK47ZaymFCT/Hks0B6evz5Z7WM
         Nf0A1A9Vxh8SXqvFCqM4AIQJmgiORqs3rG4rl5Ola1y7Buaa6w8Wr27z8VWtGg9+LNYU
         QvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791297671; x=1791902471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v/GsJDj9Q0Ij9HiaS1dDUSYj+explIch1r4r7AG4ZvE=;
        b=LfTNKJVfQzhiyPXHrdzpp5PWHhdCOcgJ9EjnmfvPFqTNZKsGQ79CXdzPHzcaQ4itSz
         o2mAUistjszVcRDMayrfGjgWPWOP8vD/ZW8Rby9FSBdMjM49O+pUi3CrlWxhMfvE8CCw
         5oXSV7Y6JJwRtAD6nRN8wJHC9ZewxRqaB3dN26aU/9VEKFYiosRmmchDxgW8OqNwqDqq
         oAWENUojSGOsLHufZfYMBKOzi2z1ZZ+sTsKF0e/TUTXpb+zP8Hd2pW2ucSFQsROU06JB
         rtyqxgZjejcUwg0aoFg+lji5U8nAdQfbgoj0qq46hSnCA3yoopTMje3qpFgjdaPF30fk
         9jUw==
X-Forwarded-Encrypted: i=1; AKwUvByyf6AVZ8LYB9mdTeXqh1T4ke+AqdeoDlhBcIGbtg7jqL2N8PWbi+dlgW+eQ2w2gvpfgOXeuQiaK6K+xpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrMFTOXOoJWW23E8qyi/giVSRuN3G7HO5zIkEbdQitM7HXCrt6
	DSEPA3RLZW5UQL0ZE0VhjzPNwU5AhJV452y5V+DUeMQawTIK5YT5Aa6vEdpCz6nE7+mhR0t60C4
	Ovtdacpa8H3Pvm2I79kLmGj58ETFqWmAHSy//
X-Gm-Gg: AYBFou3XxCfYHTYs/65V4viJrMoeKt4NoojH9oIRVnnRf/Sucjt6IEA68Ku1dyb6tx3
	zyNNhKvJvqMT+vcVnVtCpHCiTtCnoJj+Y0ZD1j+ZnDrvaAXFSgWpv0qFSPE4GkdGwJL9MWf2CaL
	ZiVtP0SZMfiIvWf1/PQFQDQ6KHfIfCWp54Qy5vtug1GG008jP0hMid1aSHmEWA5sapmg7OOZ5Hh
	OQc42n2rxM8syU4WJS6nJuiDvK9v1F7rhGYxA5W5qE9231fFa69Zo7rdnWSbaXi8lTfkQRej5oy
	7qEwpiIof0ER5BdsZzHwv/S6fMie1rXNK4Xp+AHsSIijwxIEwxcfQVRmXPaHR68NqAEGvQTDXT0
	O8a/HtY7ytnXAZyc07YQj5B6WS1TZNA==
X-Received: by 2002:a17:90b:3949:b0:3a8:545a:9e87 with SMTP id
 98e67ed59e1d1-3a8545aa073mr2506773a91.15.1791297671442; Tue, 06 Oct 2026
 07:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-asus-ec-x570e-cpu-opt-v3-0-62672edc18b3@gmail.com> <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
In-Reply-To: <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 6 Oct 2026 16:40:59 +0200
X-Gm-Features: AclHuK_VyES8DGlX4WpDsEtrXhRh82OdVQzj8EL621nkfmlGXF5ZyQLTHX8sgrw
Message-ID: <CAB95QAT4A8ONTYdQ9Y50t8zJZ3cOZr6ADSTknYdUUs1n80qciw@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
To: mdlayher@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 16:36, Matt Layher via B4 Relay
<devnull+mdlayher.gmail.com@kernel.org> wrote:
>
> From: Matt Layher <mdlayher@gmail.com>
>
> The board has a CPU_OPT fan header, which the EC reports at the same
> register (bank 0, 0xb0) as the other AMD 500 series boards. Enable it.
>
> Assisted-by: LLM sparse
> Signed-off-by: Matt Layher <mdlayher@gmail.com>

Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Thank you,
Eugene
