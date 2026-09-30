Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60D4718C2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808331; cv=none; b=ZRb7KcPHjm9XjAjWDpaDJOwrZFWp9gA9CDYuvmGqXGSPxlZqr0fqElh2RSwKlcaiCqZehwhtf6iOWgQb+cMjb9l+wn554HdirNEcSbclSiv9yEdMR1BEThFraTMJsoptR4bTJ1U5dzOyvRzOZVHeZ5jVRzQwUW+XB24HhvfWxH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808331; c=relaxed/simple;
	bh=XHYH9goJLfB4hT72FSpUpw7jM4IyFmcp0Zh+k55Cx84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iu40rXdDcDqqbCZl87yAndLZu8Txdd+CHgyqos2ckLb2eG97JtgFefs5mf2mFpErwaqbFxVSSOB48Qrb9UeJ9qWOlpPGOdLvFPSUPTRFP7z4y+LRYVmrpHZorYQXkf52y4DNHPVkaT+nrTQwAw86ZE/nm0t5uTbIszTfz4UMMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISdK2hnX; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISdK2hnX"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso44963495e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790808328; x=1791413128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw5hqKS3ct7o0O9F9EDtZ/MEdTAhkcvo8rO194jpxu0=;
        b=ISdK2hnX393chJc0it6P6tNY7sCdY0ruGLT0WyJ6JWiY+SSzK0JAEqYSp+VxytlaQC
         nEpamEdYcZflJlovloL4CKfYzI61xONiGvSjPKm8GELZcLQ0QiDrFazO9vWXrKB2YtBN
         2GDrwy54AS4UfPcShIypu9VaiE/hS7q+/fF8zhUKqX9tP8tRDpG3yYI2+pDyiGl6g4Yw
         wWNuIWiX+CE8drvWOUKhzqgE9dCgTvsOcBZD6K+aRvMltKhCLuX2rBcl3KYjI8X5OIoV
         mMnnin7CJN88dO/8EcVlbgXN6L2/ZRsBn4IPMeEBOes5Obnm2COXmYiA2U2FCgQhEYSS
         7k4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790808328; x=1791413128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mw5hqKS3ct7o0O9F9EDtZ/MEdTAhkcvo8rO194jpxu0=;
        b=u8aM4DxFSmbUUrwkcfKCbqx8oO9BC9MgLZ8BvaoCDM/F1idvlBAcLp86yOCxm+YkXP
         MGlC6lyLAR7MioSf5wUa+pL6xVySbzC9M+KQOCFCCSX/BlclmQMFl4hYqGOJ1tb5GNUX
         BLnCWV1RmPfIFAKg3/EEIFv/R8TmIsZ3gqmnWvazaJ0qbiHVa3QSbakn6tPrGoeE0Fsx
         Rb3Hhjh4ndVQcMzfxMluJT6iAxgRivtjo5g7D9qA9tRbQlUIA58Jn75s+cQaUSvZSbOo
         ZRqk9pJxqmh2DOj8/X7iYycuz2Fx09exnUVWJ1tauufC7VRQ5FLzE1YiRN7uZgBDjj4Q
         y6Tg==
X-Forwarded-Encrypted: i=1; AKwUvByhcofeFyRzNxuarrAcI771DDPoDKXuOc9quB6xZBtanSWrpZbX+ZnDTztD6TDN73Wgc9MEaO/B+UxjLwM=@vger.kernel.org
X-Gm-Message-State: AFuF++krzJAjoIpz/FGpTu4A9jO9nvcE59P9CJe5iHMk4R0Bq2RdA3Q4
	NaaX5awyF1mjh8G4at46QKSSIpE6orsm/tI+pvvY7sy6IyLWlV2YE9Tr
X-Gm-Gg: AYBFou0QChH1/XIJmFb5a6tBCyH7PJ8Gc+u+/K8NK8e9qGqoqCHPZgynWE+GlJsWUqL
	kXLO57CIwN9lMHAjQnb5y0rPWw+0C7zjJ3h9SWFPd8/IEfC8vSXlChzvHXT9fiIaJ/LB5NP9r4s
	q9x7YTDXQ1nE/fN79jQoHfr8oqeTiQIiA3YRcQxt2Lv7AkfHx1X4OoF1W4Px6kbyRA9WDBggA6T
	VLP2NcWWEdqYVDQRfekfuuvULkThoL9hpaGq5HvaWVVYzfuXt2zwoGmNE4pHCcO+7ljYbeYIwiB
	ydh+Xs7xO38Jk/+kMtIt1AxagKoC2PwHUb3wmO31KV1dOC2ViR5n96vIk9kncUGIvhnFHgLgpU+
	dYbI1gDA8iHRSJZujp6jmonGGD8aRE9wh8IHeYbW3UZepVmTNwYtq3BtG4T2WxxFHAl9QUQ6j+R
	HfgfiCC82s4cBPXFQrGw6c3gdQnD1jFU35pI3gEPZQbjnrgmL1NXtK17tT43lA4cp9yD9E3VIqP
	pRlCXFf
X-Received: by 2002:a05:600c:a43:b0:4a0:561:d0fa with SMTP id 5b1f17b1804b1-4a01b00c51amr47011655e9.18.1790808327880;
        Wed, 30 Sep 2026 15:45:27 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0692ae3fsm1982106f8f.26.2026.09.30.15.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 15:45:26 -0700 (PDT)
Message-ID: <970dac30-6739-44f2-81c6-e79813295f23@gmail.com>
Date: Thu, 1 Oct 2026 01:45:25 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] nfc: digital: fix read of resp->data[0] before length
 check in sens_req
To: netdev-bot+sinfo@kernel.org
Cc: oe-linux-nfc@lists.linux.dev, david@ixit.cz, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930220857.721985-1-omermetekaya0@gmail.com>
 <179080647916.31693.5412797645123910488@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <179080647916.31693.5412797645123910488@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/26 01:14, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Manual code inspection.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
> 
It was obvious, I didnt triggered.
