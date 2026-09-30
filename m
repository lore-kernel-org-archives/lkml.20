Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3B3D6CA3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763521; cv=none; b=ZR6KRBmyQOyYYiBbDg1FP2r1N01/HcsDifXB1hETnKmIFeStcCA2WBwlPWtqpDJ+tHIem1h8ltqk8eGaOCQqLcyjrw8/ooDxoH9rY1AQP85AGSznT6B2Cwo0OVhFJbC82oARAmCeobeSI1zlxkQAC5LI3mSaZgi3A1E9qlLDbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763521; c=relaxed/simple;
	bh=vKCgEvmzuqdNYv8cvhm72vtRBBD6mf+wxSFZ0lP7EGc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HVyyYiqG1nqEDYMGXlTsX60u/YNXEdUxFkR9kRooxmk8HQC4hq2FwuQrEi7ygGzSCYV3jua8KEx8yW9Tigav8Yyqudm9jFRuP84T4/UdbGOuRHVru4OBLVUfyvjprO7jDK+rq1/TlF6cfLqRNtb9yBd4aLwjyocmZosEkMWdbvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f558thlU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f558thlU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso48095605e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790763518; x=1791368318; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKCgEvmzuqdNYv8cvhm72vtRBBD6mf+wxSFZ0lP7EGc=;
        b=f558thlUhtGlo5ZBGdjYqF/f1WSQeDunDQlTVmZLXUOwnR4SLAis0l6wBS+cn7FVUC
         kA+FR40U6bUGLrh+mvimAmzX6wOBbj77M67HuAdvDhqggRHMr2yriYkghBSyF9rV0vts
         jrYG5oYSXgCSn19pZq8u0+rHa9Tp10fOqS+sHejI5WIe8HRlgAvAiBgoiWd53SrsHcq9
         M4vkxf36ZCcwT9IxP33m5/aNnQB6eWA/vx7AUrH+07uzfxYX4dPVyCkqAzpezcsKHIiP
         PgRJo/9ruEbZc+gYBwzPPvq7bfaD8QtWEMSG1pzMw4irZ/LgsPC2bz3Xjf3ic/q3AY+c
         4pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790763518; x=1791368318;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKCgEvmzuqdNYv8cvhm72vtRBBD6mf+wxSFZ0lP7EGc=;
        b=nJjZYA3EWSwWxEhCq8DHrt72MaRfW3W8WJuezS4f8/avtfZA4BahUP3pmI3KA2pRkM
         1RLfs9pd041CveScq2qK4Zd+MOLDS7GrzU4+E6hiDCmi4fylma7dukXZ/oha5YEEavq1
         dcxA7dJwZKjN1XmPcs4WTmNUVSizBR/WCDnHFmHA3i9u22/D+I/nXHHMyv2uCCeHAAnm
         THr+urhnh4bZ+rSHmdCyNWgWcOq0WTVJQFk/U0X9glIJ/Zoz3wpdHj/xkf78IQ6K+Dih
         nLsC4ssnCmWAjHjQ3+o8Pv/CDirxp7TOU12246IjGj/IiIi8o1wXrMaodFwiK/NtFMl1
         lVLw==
X-Forwarded-Encrypted: i=1; AKwUvBy4tIDwSwp0ZCHcVgq7qnk+ILG9EOQOuzT+ZTkXnFT899HE0xkHpsG+gqvTa6+wkcipSvXSKFCzIcaziUE=@vger.kernel.org
X-Gm-Message-State: AFuF++lPxaWNo8R7oiXj6ABDujPE/X3fNyW6ax2LmFnWKUliIwaAOh4q
	4/mQlhd+dmpXcEBWm/VPwVG7hjdIMRxQLWvgsJdaYVnX2xzyWcKEk2eE
X-Gm-Gg: AYBFou3nd+XjnCnkkOkJGsN6QIa4JKIzOImQOwZkH/FUWDGZDXsL3dcxrUOFTjMvQSu
	FQ4NYrApYkSt1bkNwQqE5I8OixlbXegeFF0vT3yHuqs4SuTIFKUiAtoDZNXlwa2TGVzxgMe2lME
	s0sRGHQAFS1KEyJwHP6f/B4kTnKeeZJZhgdKKxC5hjoBx7q2k6ois1+QeAw3stuXeH2Le0fAKg7
	47iBsASbjmfOdpV6F5ZcLkkDPjkyfk3EoQO95SKOmyN4tQY18fO1CHKczw1U/jQn6PFGr/50nbx
	Dtv1xD6astQZqQ1ZIykQG7iQrqoPOJUtKIKOQTmdaLvYezNqk7JTFqz2b1C0kkF6wvRW3BRk3pZ
	c/gr34oHElY9BkUQSqL28DUIc4Bfke5zY1iXsJs9yHEBQakTZjy8Jo49eTCVDsiOEsbRy2NUcWl
	bUF6SN/qPFDdLOv+JBPNnj5zElKW/pLrJFk1/HRF3yfezIokCMi7gy1Gavp/YilXK0r3Osj3h0h
	c5xuldfVBbYB5jOgryYFT1OsRv2xZqr
X-Received: by 2002:a05:600c:4f4b:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a01afe8499mr17900545e9.7.1790763517873;
        Wed, 30 Sep 2026 03:18:37 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017468b10sm56852175e9.0.2026.09.30.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:18:37 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject:
 Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To:
 <CAD++jLkXyh9ujjFEE5UwpMnj7Ykgb5_W+Mp-YXBakn5Q=_vj1g@mail.gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <CAD++jLkXyh9ujjFEE5UwpMnj7Ykgb5_W+Mp-YXBakn5Q=_vj1g@mail.gmail.com>
Date: Wed, 30 Sep 2026 13:18:34 +0300
Message-ID: <179076351495.2893601.12682235689198768135@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Wed, Sep 30, 2026 at 12:11 PM Linus Walleij <linusw@kernel.org> wrote:
> It's a bit weird to have a mach-cortina when mach-gemini is actually
> also a Cortina SoC.
>
> Could we call it mach-goldengate?

Sure, that is also what the vendor kernel called it. I will rename it
to arch/arm/mach-goldengate in v2.

Should the Kconfig symbol follow as ARCH_GOLDENGATE, or is
ARCH_CORTINA_CS75XX fine? I would keep the "cortina," compatible
prefix and the arch/arm/boot/dts/cortina directory as they are.

> I am OK with this because it's not like we will add hundreds of these,
> I just note that ARM64 has abstracted the spin table handling into a single
> driver used by all such systems:
> arch/arm64/kernel/smp_spin_table.c
>
> But implementing it for ARM is probably overzealous and just a waste
> of everyone's time.

Agreed, I will leave it as is.

Thanks for the reviews,
Fil

