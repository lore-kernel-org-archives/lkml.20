Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810951;
	b=kX2orKOjKGf2UhaAjjqxlUd5gMCtT4x+Msc9UNCvuiBebZPfBxkZRVLFnIDtZxtujIPU
	 esKVDu4jLJdShzxsUqmQ5RZYWbmHtjOall0yd2z3UkUYun3k6iLLYtLL0IZnUxdIzv828
	 wTuj5/29vU1VL0Jt7V59C01oDog0unfNlfiKEeQ/RFyq4htBt1qC9IzyUGlYxfxM5NvyY
	 PTcHA8YCxbi1RKfTqq27gb9UZ9ljap7SG122vUsGTdQ+9XvHtzLi8vIVy0VzQTj91FdA5
	 2kSqCAl3z4zeF7m2WiQj385u6n8f4tsUdjY4H+Xi3tlMEnk5fSAirFfOEuPKo3N7D8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=26kedF9SHIRpCFFDMM1QZNr4jXNG7AuPwLWQ40UbmjY=;
	b=gUxh2xC0sAdzBlyye/4ChnlvljEH+mUQcZc52OCil5asnK0yQPItde35v0OPdpaq17i7
	 gAMi0IUR15KfJ1OhWowRvPFBL/yHuvPzTDtiWEwmyzk7wQ0UW36xlQUHQ/ThukR56Oe10
	 hEYJlnn7gSr5Rl+rZnMsxbD095fWda51ouYAMyoO6BtjEY3O++FQ4I41/M7TS2DXCow/A
	 a1GkNN9C++Q+keDbFI+lN5GiSd7TOmfPGWxMESgLN0s6U9G5Q4OT1Kdh+v0Av5CT6hBBg
	 GKWH4CBwJQtquINFJukFEsFkFy2/jOl9yIRW014+IV9P0CHkSJy30pZOWP3Vyimq5Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lbF5pG6c;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DC60A380E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432DC60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lbF5pG6c
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6fe4372c5f3so1031716eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810950; x=1793415750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26kedF9SHIRpCFFDMM1QZNr4jXNG7AuPwLWQ40UbmjY=;
        b=lbF5pG6cIhPxgsEpIVWJat4zS0IDBvVd44OaGWPD5wqzC3WR2wKjclouQ8zHrzOgye
         u4YZA3x9sxIev8riJ49vX3qjZwwphs9u+HI/RgdYdgSaOBTRoyo0QN5LynzXKBl8OTGw
         SVh7gw8zfsdZsmm4HHp46yji7ISep4tTyxZ656WtiUEw2zEpBmzKWVyVbcHLCuB5Xprb
         jOZxi8cktFDm6mIgySf7lcYDp9dVhZHh0KY8Xl1XB5+/Y8cOwoX5IUtQ/ROwVG0/FNv1
         +T+k86R1qIFbr97v4RfXQQIVgGJfpj9GPHdrAMKLN7jWvIUWGqfyTHp3b8Mcckb+yc5t
         nRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810950; x=1793415750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26kedF9SHIRpCFFDMM1QZNr4jXNG7AuPwLWQ40UbmjY=;
        b=Jc4GRe5a12m/GMrVyNlyAJQtVeDV2SMkQwLv5obh6cSzaa/awdGKOKeMQXAvXCv7ca
         Yu4TAvM8ijkFb4x8RcZmjAm6g+91ZRLh0EC3jXP6hlLGlaBlZLaNTycd/Geq8nHsGU+y
         dxUGd58B2QWwFvlv9ReAOroO8wTU+voVhy8iaN9XDVdngDkAeKdcJUb+9IR8T3x5xN+q
         3VJiGQ+hko7ahn7h9gGc8z5gUwvGOFup5lvcegxTqunw07J//fuNGVmrB6A6pxriRk31
         fZtst8kNEEf2tU0CZ6kWcZZsFkhz1WnbJ6hszODCGcmYNmwxy3DNnL8LdJXnhjDVLTgl
         9UdA==
X-Forwarded-Encrypted: i=1; AKwUvByx9pLZA9NsyWl1IxvCUxKGxOZDW6wMRD7EZ4WsodihdrEwhgoTftKXyjx02Km7/fHtRfCe/qLlomejreA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOuUkQjO8FsWj5zh60cAEPgAB8JNnXhoAOCZWGkQLIddytatmo
	BRJmAAZCX+2yF757uuSxStVNC/9ZGVEw35BtlwM8UT8rmtMHRSfIv6ma
X-Gm-Gg: AYBFou03qNaZ6ZSaiKyntqYPnCDV2cjO7hXbf6TqADM+8IBMB1LZMsDV1NFJ/Kfv1Ba
	8ytS0QXIkeMBXMZ0cDZCtSnlOYB4yd6cXI1O0UuP4ssLQtcM5hjY3DCcK7/Qb7HK1VnVxpWk19F
	i3YNGDokVpz9+KtAuk7h557cs+AMAk5kltx8V0vHFsvsuOY8f2BcaswCAS3lTTGvcLcbbzlKnv7
	GlDU43BQNXpGMpiloUkaSgEayiSFsbijZQUfpNAzMOkgp3OKkL3elBIqF266gEvUBQFlf2bwfww
	pgY5XzUSTH7+/n7sDArnGkbPItFOLWjIHswThl+GEk0IUXHjNH7RAetggHuy/LPy0s6lh2WzlSl
	Jt5ayaCwGClEWVnAR5R2QLYnzBT1eArFmka/Re9pY5y5NLQ3ZqbyoNsPZMah0zJERpAnNf5O2AE
	REadK3N0zRHusLFxehXfs8jH0j4bzHZysN0J70MdQ8RhM+Ed900lq2izi2aT5dm63W7K3YaQF+p
	ZbZPRkhYwhRrdEf8u3jyW56x84CLASMZykDwDkErhcMvC2BVmmAYSDAjzfXS5iwewkGKVS3QbcJ
	c6Fuf4N0HMxtW4QmzwxbLrvMfg==
X-Received: by 2002:a05:6820:1ca9:b0:6f7:c0ec:1a67 with SMTP id 006d021491bc7-70ba0e11aa0mr387906eaf.21.1792810950282;
        Fri, 23 Oct 2026 20:02:30 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:29 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/11] phy: qualcomm: qmp-combo: Extract common DP PHY init sequence
Date: Fri, 23 Oct 2026 22:01:32 -0500
Message-ID: <20261024030142.13643-9-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 15:04:24 +0530, Nabige Aala wrote:
> Extract the common DP PHY initialization sequence shared between
> qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy() into a new
> qmp_combo_configure_dp_phy_common() function.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
