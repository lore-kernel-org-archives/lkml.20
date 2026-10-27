Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084924;
	b=W0lkC7yoxMA64gQXdxUVglVWDH5q7Z7coo3S9UvH7OReM6Js80U+bC3Eb/WIc3L7HP32
	 gzPC6nIOr8PTOiwA7gfTW/Hv4Dfavuzlx5mtaPiYhAEtzq1u7YchbaEBusoSrMeOYD3f0
	 RxQ6+iLMFpt0r07+TVi6rt6Doospet70NwIdXZNqek1td3wzl3pWfQEouNqhGiV45JRly
	 nQxbMMEe7nZH1N7SA1lsutHaft6hMPnKWESWKyRXokYVrutd8mXl7fFNeiBI5ZoU+clgT
	 tRNFETfLFrmb9zSMQTlKlzot5XfLd8UK7kmv8BoUXQfYmOv/Cq03eby4XhkykbuMAbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=6zazjVTQz3Lc+/QZ9WoAd0ReZCneFGPIxm+AtvJf/J4=;
	b=Ri8mTyKOGbAnBfMLpeH6jcteoc9BhQ40wjYCHyviCrxk2sMP/GdOv4mNz+e7AzYlsDS2
	 zTBb/d/eiUbyj2wjXL8JrMnDfUG1ml7d24PPxl0bMXBQxlA8AN44xMrDCgD/sDmfLnnS3
	 EXCER9RLgga4/8Q41CwFtq+LGjAa+IFd7vuLNnSp8BWwzWqxgu5uGPnvyLH3Pj1Vd6d5p
	 cwIexK4RGhmkUjRWTZtLFP/nmR0Q4jXpzsSfNHhCGK/Dvw1WgxT1t6ijbL7jEm7ALLkZg
	 a6r5ixBp/RMB7x+jTJYr3MoUb7sur78hv6r7LaFaqjq4CcNbTjDlTMVZz5kTh5rWg0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdLINEE9;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F6606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdLINEE9
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so2587777a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084923; x=1793689723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zazjVTQz3Lc+/QZ9WoAd0ReZCneFGPIxm+AtvJf/J4=;
        b=AdLINEE9Xgb7dNR1swD4xNFfCwJlS7Byu/htEqNWINHagScw1+K+Em34GSDuOmP9yz
         ZihG0AtYGAemaE5lGfAhfTaFgzlIBvNwwN8HsiHQ/hQXH8i0tFls5Z5pZAgSAMgOYgXD
         gLo7ssEfGW051qHJYkQEzSIVSiLTiLop8v4pvOrw5mprIYAgtWWqZ0o8HQyrk0thsej3
         nDIIiRMCc8tyCsmRCM0qqWIOaxKh5Ejv2jxi4jsQCIE5quU0n3nb9UihefYhjwNKSN9L
         FiF3ngKZUrLk+dZhhM+4zOKkXkH1S14OLPJTWeiE36tZ5cpjGmXwfx3gWpzHamR6sLHT
         C1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084923; x=1793689723;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zazjVTQz3Lc+/QZ9WoAd0ReZCneFGPIxm+AtvJf/J4=;
        b=Duoj9vU5hqmDCa6RwUEbZR0DMngYRuaYtCTxG5qnTigwTB97W6uX1wJ14AJ6GYvi1/
         SlrgKird1mcQJwo2YKT4H2i2YdCa5QtgO7Clj++1C8saTQfG/NvKdtCHYyxyPGq9dncj
         eENqNad9xngHorNYGsCQdzY4iGMX4FdJdTAblLymZihO4QnxtltyGWwMk4WRxh3a/R2s
         yvnjb+U6VTv+vuAD4E7Rb3fWOygdgQdhuJfsYStZMElAYk2BmF4bYBsUEpLMEzGeigQM
         Rz9T2KCspjwLPXmipML/D1figKGMLRxYkv22yHjdJWhgaKIrwjeVj3tjzo3jI36FhCRY
         iiUw==
X-Forwarded-Encrypted: i=1; AKwUvBz6ypXnbjAKZHwx3k0JH+enh/dfzqfpGkMCNxPI36avOYfEOVwvDHdZCxZoDNXIbOiS8Md5njX2yBP2Wxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm6ocQJPuioKUYgd+GEtld7+VaInOmXjvS7zKLVT5kmz8ykiF2
	k4fYv/negxJbFeatsUyaArDgwjpsv4bVxkxSSiNMqLgAdrx3WMgsOOzOYubVA1o=
X-Gm-Gg: AYBFou0U7J5oYcU4eOUW1bUa7MYMnXI+Lfk0dPv655Lo0dj2GetnQ2vXwsg7loQTp9U
	2ptoLJ7pH/Cr+iPtRm/sv+AYhUoNCFoBMYoifAmuhoV0MlyxbC+/TNl+B3fGHh58ebS9bQUDmVt
	qIrT22fgiOwcz7AeeV+ppbe0iHIXagYnYQu3SYZx1fAnC4Nfw+TNxY7MrChU3b8QFwY9cdt/P4B
	yoaSEvG9dgse00CqbNlHjgGDrPuNIWQcaYe3ZXTm5OWoo8B5UISxIfQ9OHyaY49Tsg09M3w6Xpe
	0rdQpC2uvvkB+p7wO1KYhlmdtgQqtUJNcM/WaYA1432xznDZQTMBhNpa2wzaJNETPSpESX4mcF+
	e5WMPfB5MiqyAlTy+UDv/+sKWMeMAyH4oo335shnJIYVU/oQ26Cvq5bLz2SR1GeeqA/5Ywo5d/h
	2Iu5zcKQnsDF+cBfqSY4PB5cVpntZiXBzLVCwVVJbf7i7Ob1gBbXh18/l8XQWbLnIEHV5tJKg6C
	wx+nLfRCt097TBaJ3jljGqUFBKKuB7FDm3cGdUSfhnuajq4BwbTrd3yTRvtFbdJOz94jXKJowkQ
	GzOO14LMudW6P8tKGkm6f+1m0LqwQOHCEDc=
X-Received: by 2002:a17:90b:3941:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3adead5e324mr7265729a91.36.1793084922903;
        Tue, 27 Oct 2026 00:08:42 -0700 (PDT)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae401bf352sm2540119a91.0.2026.10.27.00.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 00:08:42 -0700 (PDT)
Message-ID: <4934834b-41ab-4663-b031-d04d736e9fe8@gmail.com>
Date: Tue, 27 Oct 2026 00:08:41 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
From: Burke Cates <burke.cates@gmail.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
 Nabige Aala <nabige.aala@oss.qualcomm.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
Content-Language: en-US
In-Reply-To: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2026 23:40, Burke Cates wrote:
> These tests used v7.3-rc5 with out-of-tree Glymur platform/board
> patches, including DP PHY support. They were not on an unmodified
> mainline kernel.

The end of my message was cut off when I pasted it. It should have
continued:

AI coding assistants helped with the bring-up and this report. The
logs and test results above are from the recorded hardware tests.

Thanks,
Burke
