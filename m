Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793062586;
	b=VKbgRlmF0BkpNHJMsUxpApfs4kZAW58UgHDNdSoc8+YfHCo8UU6oYg7oIJpI8MlXosZb
	 CcE7xbqWZTTnjqavRPal+hQFcLe1ylumLYL8CkZ9914a1cc1Fn+SqX6B+pmjNQxiiUbQU
	 eeEhJh4q8FRr/xQsJWc7DG8r9TMzskSfoqIqMrQfzN/8b9shvSkLOUs0oOgS4Pa0a3wa+
	 6kFzbvpcIOeAD5tRjSQEpA2nzrgpQgoYIKJ4CsibGRMrCRvPjllFGcAj5Z39AaPA8f7DK
	 /i2z+KWTUXfA9ufmEIEbtpLin+IjlXOigYy+Apbo+J0EyIRh0bKV2KEkK6ayPYwacCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793062586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fvxA4psjvpTikdFCmDiAeEgeeyr+lNEAXNl8+Et9d28=;
	b=2puKB/p0LLgdkIu/aEYfeGQnw75/RYHukxJYnnH1eiaxXsIuWGY188ApqNZ5oKzODBPo
	 sK0cUdDhA4XOFaVqyFu4uSE6BzRp61KrghK6C+oJVesV63vtlFvcw5fo14ZrYapgiBHd8
	 o8/SAAB7j9SUBhTiCnaxyXmXLvWSVWfo7raE9cxlnsn1RQWr8t9YcUVwK2vwZjVRxMfJg
	 CzgkQOcnkpdSUoGeBMZs3h357Cv7xZ/ojx5Au4NQkT5THNL7/DjU2eKs/g3Cb67RI++pe
	 hJpwqbvx/sSiNwvwLgULLmUqH06z/CCJRK0nJTxYRnIpOPLqsj76CfRiEZPMuNvRi9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hYwrj0gp;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B1606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61B1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hYwrj0gp
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so5567249eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793062585; x=1793667385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvxA4psjvpTikdFCmDiAeEgeeyr+lNEAXNl8+Et9d28=;
        b=hYwrj0gpir3Tlmc3k3ZI/BsJn8CK4+Bd+IuUXX/AMkRr7RGzR+hSOP5Uq/CCszFr4J
         /C1ZB+43JLs7Ykk/cCDv2eLVY9WwjQ7sTTKXrd4agciy9z4oSDCb0W6H2rxdmRk6UDCE
         WEMjb2oyaChE3XTjy6higzg9J6YiUSS5xUNElGzYcFxhDXbUU+E5vuNBJ87ojBZiHu7C
         wU1B71B5z4kKCHgLQpZn0AYXFH1CR5V/aZpYhgwUF/p5gpZhJ1YU9ErKklbF8RWvFyLo
         90P178pu8LWHpEKRJcwJxk8uo/d3iLvTvAO2OTuVuWQNNvr7pze0Cunazmtaj0Jc/QVR
         uMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793062585; x=1793667385;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvxA4psjvpTikdFCmDiAeEgeeyr+lNEAXNl8+Et9d28=;
        b=O3joeY8ZX1oIl+GIkKZoOgQ4dIESoZeNKKoqXYn8cxVbjPsrH1Tgt4TaDurWhYYqTl
         7Mja/R4+TGJVkAYbOunH3sUvZx4Z1VRvGypr5bAugJMjLU/wToxyBlhjsb1IoH3x31R5
         zODOLVmzMRGAJSOvVw2IBR8AxVwqyE/4aj9yNjPuFULfL2uLM0xnZUBpEEKrKOWELeuc
         VWY7H8ZNu+9lHiNagiluTCGzUaFEdOnWwFcmXK+jFM2/U506+iv82T8U9FWpnJHpmjVF
         5cZ8tMW5frDHvn6ujY/L2feD8hhi8Dk6NejiQw+61jShLE7wuHEYhw3+sA5zSSheSYkd
         PxQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFLXfSEf3cjIsk4v3KTsagmOZF/vYvHUxU2VcxJ98RgxotdVjd2gEZJi9QxQ5tvLSdeajZRprT1FhMDf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsY5NLI9QxqXotU/xNpN0XvpmJkaxA1/QxFeQ5XIbh/JrC6O+c
	1YaZ2DetKXj2EycpQOkeFZ+kfjCfbs2TP2xT9blZzRvm8gXQQW7YbqgH
X-Gm-Gg: AYBFou2UYx+dPgaYQ/hS6UZW5agUQ3DfsJ8x3KUP3tcWQK/smI9VJre9sJ7wcgx6fk0
	GeaaGdnsiLXdQCv79rjlnP7ITEpeqyKfmexgYhp9z/znNxCo6Is5RkXkz849pHzABt7nyoeFuHL
	sMwva116+VR8yprI8Y6KxX3dykCx1l8GgSzIJ/nwnzBZPJtfxKwyFYqSkACUYKrna+Xm9JI8PIf
	P4W6XlvRyY3SjFJ9f0NEa4wFT1On4VoFtBY2GIWe0j0lcbQNe1AR71cLTkigVT9UZzFRX35b4m6
	K6Z7twc5wWzYebgZIgNqjWXA4RI5NvSpsSDXm01my8xlwoXU4kkpnRtXsDhmeDGGZG0kDlpKDIq
	Qhe2gmKWv8U5QgIGYKjkjyfX/OTB7wJ5e0U3BSFrThBnEoAS5X/2Vbn1aE5btM7kb5IssfEI2Jo
	NkjnuVdVy1KZjtfHMuz4ThztJjX7eFYcH27vfeKqc9ME2K8Qi30ACcyqiIDe+TPOm+eyb0tdrUX
	uFbEfmTZr9F29yQUj7IDy23/9JVx5nYB8E8FGFPFpgzkeAdxkL6jH3YfPqtyjEWb/WdcwiaLLD9
	70Ta5bpGsMtEOHkk/LtGKQ==
X-Received: by 2002:a05:7022:3f07:b0:144:fa57:c617 with SMTP id a92af1059eb24-19935dd7f53mr13799364c88.34.1793062584598;
        Mon, 26 Oct 2026 17:56:24 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2dc1:2e1d:6b4d:5a9a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a470sm25575440c88.2.2026.10.26.17.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:56:23 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:56:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] input: use devm_pm_set_wake_irq
Message-ID: <at_2lPLNBh_CQKOh@google.com>
References: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>

On Wed, Feb 05, 2025 at 08:45:13AM +0800, Peng Fan (OSS) wrote:
> This is a pick-up of patch 2-5 from patchset [1]
> 
> Since devm_pm_set_wake_irq is in 6.14, so resend the input parts.
> 
> [1] https://lore.kernel.org/all/CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com/#r
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (4):
>       input: keyboard: ep93xx_keypad: Use devm_pm_set_wake_irq
>       input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
>       input: misc: nxp-bbnsm-pwrkey: Use resource managed API to simplify code
>       input: touchscreen: ti_am335x_tsc: Use resource managed API to simplify code

Applied with minor changes to patch #4, thank you.

-- 
Dmitry
