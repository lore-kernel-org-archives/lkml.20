Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDD03DB31A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975735; cv=pass; b=Q1uywqQxoHm2lbMXrvFjpQ3oEZGOIKthmW8awSHOHkbzIocUFwrPkRXSnCX+s+DCVTqVjXKNOUkgXTk8XL1vtf24ObBBS1WbrGgGAP2+ySqlUjBqfDFQ9AjnU2MsFrSssakCGyQQ8cuB+DWqA2qeRUtIXSsYjSTygH4g3KYleNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975735; c=relaxed/simple;
	bh=lxo3rItzOI5E9MqNdGIwnwpWKqkISYML5yv6YHZcizc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYC85qlnhaWC+Zgt//8l7CFeECfjk2vzVtJaats0B35NVJnjOfSNGvyOl4vtQpOyP8MmcdeRMWWsyGOq8rHLin+ejj/NNiw5w3Q6FAa8PQIfGJPUh+9i8rsJM8AKqcs6xjp/cULZ0gY9mk7UPk+A/lSI9+8/ycVoew1EuJw5qVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPK8/FO4; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPK8/FO4"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1988100a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 00:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789975730; cv=none;
        d=google.com; s=arc-20260327;
        b=dVPeDEQCUztQC0yj0dcCleZXjWupbgRkuVM0DraR1zA43z/YixHrvXGxZEv1sqZjeo
         7ufCpbyfxL89cDqiuDV7piSwJ5FtM9/IdIjQhaBFoFcdBqYC+S47vY7VMN6qiuK6Cxyz
         NX9LMqVZC9fsFjd1QC89diJsx05c3KLBryX+L5uAEB8gGJGOIemSM20qtcCJzYSGgS1P
         zTYx9OKmtI8vi27PCslu3Y+k+ky0Vmq3PZPCmCThxXSl5Is/M3AMu/Xl37RVJCc+b3bk
         87rqIMp/VS24LDGynxV6sVlkFJDmTOWVTWtLahK8nE9oGDZwGSdYRpkFZQ4rKpS6WQTu
         oRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        fh=qSxaV8KJq2hlDK+8nCb5R/49q0CZi8w1tLljTD1n1qE=;
        b=ivW2U+r+z+VC0S7qE2UXXdV6fEbHhtWdJXNFLXVuQEOQC4PQKclc4fnFjts4rvUoOc
         4yct5nL5Ixff+amkwc4Qw0mky682iGTWrsC8WWdPKNev95ml1EnVGOP05XLNJxRqogag
         O59YYvGtUs4SgJtfGoybVyTTDO5QFQBl901wcUahd9Y7YBHeV69oNjefPaZHS8jAl7xS
         ulebU9eOyGg4b3lVVfvbIZBGcg3mKgznOYytCzeIUB4MH8Wma/j7OZxRr/6CW12r3FHG
         gFxJ/L3kV4urNoArpNEVhlLmojTVfADBJoal7PdcCZNb6UZGLr/PfioATq9d438d5Mzh
         YyQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789975730; x=1790580530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        b=BPK8/FO4MZk8LnmE3C0zsRMjRZqsdw9FI0zUn8r7RNGdnKb8QXCR0SKb6oDI7lAhVP
         m9qZlWhIUIonYT5m76UqY1uDUOLanucx1YBHwsRlm4XGCwief3ZJdpiTTKqo7TKhXNV4
         K2jsXoDnXpe7PSO//bYlC7kIframl4HaW69jsN+ZUy64hEPs+PRo7TIduLimrD9ZotFT
         o9UpH0mmaaJMZT2p06Yowyf9oOQkZHSbRbIPTCgJR+VT4NS89+xVr9ius11hEbIRgyp+
         zOvA3IbebjUViAfJxgkVzNd12W7Lp7a7i75bwlVfVS5BuI66X9kmYCA2civlJw6KE4st
         KR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975730; x=1790580530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        b=kQP09TzmA22A8ZylvcolD9po3omTqiLHwW3C1SrbVEGLEbwmeSTJgm2/Ei+uI7s7dU
         sF4Luni8Rbldowzp3qj/bFHoRZHs3bvTs6riVWK+N+LQ0DbiV/h7KFk0gKOssju6U8KK
         NIDBMOmRHOM/uqeGtUGul3ii1FfpdkOW1OCj/G4Ct0q5nmCiPKz1C1Dgdn69UdrhgesC
         5laN5f2ZDU/5DHHJ+0jMBMQaPqWKtQ2+T4C/buIo2+8wKC2GlJFPtIg/EnOzQN2IwuA1
         XrVWV2N8hWB8o48vwV6hOlM0OEK9KqFSagsLFPcY12mF2ewfgzRIe4EsW51Z6jHO+wQH
         zs3A==
X-Forwarded-Encrypted: i=1; AKwUvBxFp+4Yz6OUFgI+01tAt/HmZyOLyhgp86pd2XopafFlYm3iNwQzlyAOUOzbEjwSCtR/GNjBEQNywlCM3GI=@vger.kernel.org
X-Gm-Message-State: AFuF++lBEjxwhY0vorA7fDV12Hk9JkDoGD3w/Qj6K7g3svpH9hf6OsCy
	Ll+rNfl5rLa/hf4FlEwdOj8ZNaHDgMeC0hh9wPsdO6FHZMYUVPLA57Nr7QEB3QWuOgdgTYS+tYH
	WhpMokuxfHv12Xg3LWbMe85jOa1tylLU=
X-Gm-Gg: AYBFou3sxbix7UYDFtMdkQRnuccfWdWrPh92NzR6ftGT/DG0DpHgf9WUkCtNqBfsA0Q
	Rh2dU26xSh7Qq3qZ4tCW0B9LCEGzgeiH17QMN6meQgWmv8/13Qetla2HIyMAAPIs1zXHrcQrnOD
	zv+We7s1/7S1+j3h5cNfDU9PWr+kh3O1ALlBE1HrrQtj1XndvXRLncpSePHtia3f4+WN8CRjif9
	UC6DhUciy/VSVCycE+xpbR0NI6AuH+4sQReic+nzC3n4svF/f9eK2qZ+HG4ukAlDA4VQMPnmdmo
	XDSpfC9POqwl9b2cjv+bZicyuFEv7/0qgtnTOxfWYtc3eGZ2VJNxjxxQD6Nq/SspOoDHEEHX3qa
	xLqG47mVzrw/k
X-Received: by 2002:a17:90b:4c4c:b0:39e:4c7f:7307 with SMTP id
 98e67ed59e1d1-39e5506f80fmr15344793a91.30.1789975730612; Mon, 21 Sep 2026
 00:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731114106.169398-1-clamor95@gmail.com>
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Sep 2026 10:28:39 +0300
X-Gm-Features: AcwNN1WIubtOA2Pf-MJxcDjvG4Mtn46SZcjDO-qZ5S8wuOcCU4q_uN3xE35GGCo
Message-ID: <CAPVz0n0jQCLjBPbJcmJLgW7MAjS9pCZUpVv-aMFp768Dqewm_A@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] ARM: tegra: tf701t: Add new features
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 31 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 14:41 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add new features recently merged like CPU DFLL, MC and EMC timins
> along with fixing some existing issues.
>
> ---
> Changes in v2:
> - removed vdd-cpu-supply from CPU node
> - fixed typo in thermal nodes
> - adjusted MMC flags
> - improvements of commit descriptions
>
> Changes in v3:
> - expanded commit description for BCM43341 related commit
> - added Mikko's reviewed by
> ---
>
> Svyatoslav Ryhel (10):
>   ARM: tegra: tf701t: Configure CPU DFLL clock node
>   ARM: tegra: tf701t: Add core-supply to PMC node
>   ARM: tegra: tf701t: Add MC and EMC timing nodes
>   ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
>   ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
>   ARM: tegra: tf701t: Tune MMC devices
>   ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
>   ARM: tegra: tf701t: Complete power sensor node
>   ARM: tegra: tf701t: Configure UART-B line used for GPS
>   ARM: tegra: tf701t: Add chosen node
>
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 885 +++++++++++++++++-
>  1 file changed, 848 insertions(+), 37 deletions(-)
>
> --
> 2.53.0
>

Hello Thierry!

May you please pick this series if you are fine with it? Thank you.

Best regards,
Svyatoslav R.
