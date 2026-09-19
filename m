Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DFA2222C5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789824281; cv=none; b=S6Ztjkvm2e1DFvuGUe3Wi6H+ovwwgzqmuI5zxITD/uAPeH1gpsm5vJxAx6EmIn4lPoqLi7dW+fcELG52zJ2QeWakN7+8XzoBzNpGd0yuySCmGqeqlk/cz1LNqLOPxgT0pLQY4kFuV6TmJLWLuC00stCVsNRnK9Vw+Trrlsjz/0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789824281; c=relaxed/simple;
	bh=We4kQ3+PMqzSMpklzI6gmAx2TCZtf539gHKv2s/cemw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KuBmj+Dq89DE9/9LE6HUfGucGP7HBEZ7thNMV2LRojdaZV64ExS8dUd4lDUrP9MI3cxY+dqOorf3ZfBXahwFWvF6PhEQ6KOkRrARPUkV3biePOBg3tKeY3dvIRhmMLGIce4OmTSmOJkYEr4hTqvm0oCRdsunMR0e4fsp9rQHp2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=a4Fq4ZSF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="a4Fq4ZSF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so5043905e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824278; x=1790429078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1fZ6KqR7Gubow5Qyu4FfRMFbkSYpjfYEjbAmpCRKQA=;
        b=a4Fq4ZSF6lWD7ysroqrS9FCd7HJwRGaolwn+ULT2RcwllXYo7DfEwZEOPn5uYs3HqW
         A8UemQ0mm594wz9kW/Zf6My71ZXBd/HUXIjU7s3uFazt4vIhoCKCIz3bBri7GVAQOh6q
         kBTbv56v/rFCOTolH97Z4dSYIulIcw5xBEDCCP9LixHNEkiB/VSx6SrJwzMAhlfQb7QY
         zzbnnFiA+oOoD4n9yG4z63o0wKiS+M2vHj/sxE8YWwH7oHNJQgt/tEmt6gFVqcQh1dQl
         9MJvY7oRXaytOvaL79djt3YGKkm0HakSf27j7KiXNwaNwZbm/IROoozITJAL1CfXUuRT
         1Isw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824278; x=1790429078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1fZ6KqR7Gubow5Qyu4FfRMFbkSYpjfYEjbAmpCRKQA=;
        b=NfO0IRFb7Akpv6BoJmyG7bZk7wndsXYqQkbivS6+qM1kCMq/fT7z1U2r7jN7r7gHfv
         hLgdDa7jMjkmcC5Qlqz6k8qg1VMHrEzjmG3BN/BhspNfK6jnOXAziB19tz6pIwZxxJ1i
         VwsD9sdaLNhaHsZ5R02GHmV5kHBZ6H4S/YiRuEWkQE5T5CjFaIjvHTb4awyF0MqNGFyH
         HLBuNAKiRWrnZi4KXCL2436Bd2qA8xzte7g1qYPNFrw1ybqJQvb1/bRVzcs24WjXM8pD
         gmc1kKKW/CNZ7gOXM2WFdnVwOwOLk7UiS62L23dBgN9E4mqY462Pg1OcYezW0Mh0OKnw
         gWag==
X-Forwarded-Encrypted: i=1; AKwUvBwvwpRpAl/3m+v44W7FBdNKQgzjxWAwbAdwiXrMYa/6ijRX3QwGm9fXDp2abFGPItwaDrtXfYVNGd6XJd0=@vger.kernel.org
X-Gm-Message-State: AFuF++nApEDw5YZIaQm349Y7oAJGshae3y/gx+keMGXh6gM8XflSvgA9
	WzazKpcbCWz7oYCwCBY2lxUiuz8Yln7GaDZFAB2VbNlu0+EjzvOZdnGk6jtWvnywiBI=
X-Gm-Gg: AYBFou0KCspIep1cOlP3I1ZALDRDV/yWv2ly7Dp9dCYUEWAi5JkmJWOfp50bi4EKMVU
	05Bdz9ZYPxzj4ouj44KRoFiA+8vjqO5kXyQIC5xCshdwAg2Ou7E0UwGLE7k1l6fUJ26rZRPLsmy
	qoG2/3IO7YEFTNNZZnLDD+EB6+3Ph4imbuC5XmL8ovQyXsHeOoJyDkdBDMxOmx61qRx3H7vh3zv
	vIviG5sm71awh5AsXwOvnGSANW6oPIIAwG5x8HwxL6kiYTqNm1C4R5Mtd10EGTu+UUsMlsfESav
	vhEPqpqZpuLcmmvnV0uLzkxdPKVVcJSfGPj/4hqFnxy3wtEj7MSgmvbZmkOcbiD9BJ/WPV7D1rS
	j4MGUjMPVmCEjZ22zxK1EnFLC6WZ1Oo6K89xssUrLY4dLBLZBpmXNMsjMSpGqQ/n/U6rrB+HBgL
	mA3Y6QhlLODofVx2Wgt1ENIXKikc2urEm3duedSCr4zjBYAhC6HXIACi2Wgssp9Pj/rLmwos+MU
	uUu2sDFCijcuqilhLk36tjCgKBEsS1MCPrx7kYvvLf2jELxIBlBiLqY
X-Received: by 2002:a05:600c:4e89:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fc4ff40a9mr87364545e9.9.1789824278440;
        Sat, 19 Sep 2026 06:24:38 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm303117955e9.4.2026.09.19.06.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:24:37 -0700 (PDT)
Message-ID: <e23712ef-1515-43a1-8cb0-e88e26505b05@tuxon.dev>
Date: Sat, 19 Sep 2026 16:24:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/17] ARM: dts: microchip: sama7d65: add cpu opps
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-12-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-12-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add CPU OPPs table for SAMA7D65.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
