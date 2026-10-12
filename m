Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52DF43CEC7
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831778; cv=none; b=sVyXUZGuWc1V08iChGCIwfepuSb9C5/1Q4MJV2DapPoO7+shW6p7Iw299yd3rFsuc2S1O5+1NztEzm71FgLdwuUuz3rCKk5YVTfDe6VY5CWtiBORLyNlZ3uIgDR0bijt30RWC41tZVJSh9nXOWen+a5BMPSRRcy+5dz9sHE2c9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831778; c=relaxed/simple;
	bh=BlAW2s3WJD+TEcvpjdpLLq/egK9JpkVxEaygxyYoXWc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Sey4t5KXq66eJ9eTkLQwrLJ+c64UF8pbRRy/cuSPVRKzQMdJxq9djQHyeJ0mr4qfbcNzeqQTNM3VtgNx/9m0bubpNhy+G4j8PFy9572JM2N1vew+f/6FFTMp5gIFyQ/nWtoqwQFZ0C49WG3HfwWTDCtNZGZh4YthvmdGe4r8J8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JyqxcYkM; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JyqxcYkM"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-533930955a4so21356971cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791831776; x=1792436576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=laFs7jlIkL/wK8Exmb0UUuiq4aC/G+SY8DOFmho4Nis=;
        b=JyqxcYkMEhPPd1CSNODJ/jyyrnpymJCtRpdQCMEZ3yphQItkCsPm12bs43Icvu4Z2g
         Iqyk4/KiB68Drk91Zu396UTq+Py+IsMtKbGPeoRcivVBpXlEYDyEonw+32HPzig8b4Yi
         qGWLfd3sCRABPzv9807cyBRvj7cRFc1Qe0EwgcpHdFiEB4bgMEHz6/m7p9DfcEjSwlwo
         PpZkfI/0EIbriGH9jWsXFaMqOvRxNGWvBKosGJ+VRvlUMTuyMeciExpxT4tWE9wY9XFh
         6ORveyNMq195sFlGbCHd1Bt4p5OtIEPGbG/O6CvNrSUC26SdiEDWmN1p8zHkk5j4i33T
         tbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831776; x=1792436576;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laFs7jlIkL/wK8Exmb0UUuiq4aC/G+SY8DOFmho4Nis=;
        b=bKQ9cmmueb2LjdOs0hPBv6RG2Cb8PzGzDFerKvEv3VYhzC8S3/1gtZ59Aw4cwyj2+v
         CUHw6OYxWfKvkmxBqRGfOjA3liI+H3K+TvZkcGMm5QwzBw6+F3DnAoSATqLY97vqdXLl
         gHwbkn7e8A8O9wXpLej0w1e9lViIMf5g2nDbcoFKl2YFZXbPTedwfhCwnxH7B1cDnwWg
         lBSON5RKn35+AiXC3ubpunfv5eux7tPOwunf42miRJZsZ/0kPno+ZsUv5ObzpFmwoWpS
         R9KEG5vmSxoPffyYuOyT19hxMx9+9s77tretNAuANkJ9H9Ekx3Oi97JeUyce8S9AB6h4
         u/yA==
X-Forwarded-Encrypted: i=1; AKwUvBzb1uqMo+ywjuB4GzNVROdgvlxxZHjO+s83uuUuVvJNK2jS6sZlJGH2N1ldYEqTkEyrTF3Z/vpP+K61va0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKESgEt8Mgk7IVAes3itai8tEXSixKTMlRR2Ccxz1PI8OHjb2j5
	1Rv9NNypEaES94OwjUdKFgJtfXKHXr4svjMf733wHnrhrNLEz5A0q5Juqxw5c+NLdTc=
X-Gm-Gg: AYBFou2ZQgDBANt7BYTRmad0GvVrR94DUvwF5M57+9zej6DffXtq9vpI4A/6ztBXpY3
	wMzcIsntGdkz9GPS/3vLXmgOq1tuOfH2Hotq7X1lOz2IVrdUJa4dwKZaEQcLloZCwtREVlo9qu4
	fOGZeyZjIfAsgWSIsnnbIlFtIFaT6erenPrvbuGJmsjl7aePT7Uh5TW51lkBE5C7nzTeO11yF6c
	prOarxW0IKrQRhepGcjuxGuhPO7VaBOEOqovqTcVir+xjrQS2ybmYAhzKGSUhJYgtadU0zC4aa5
	ltixaScvsHWFjAk+7QwofY3b+uO88P6MR/3i0cmYDLHxencmnpmwU/JPJS3KbG1YUfaZV2dLqW1
	aRkH+n2j1Th5Li9Rp3vtkQUpFFCvuXiTn7EqT28XzHS/ErK0RJFylvzgvuDS4P6gldPnYvEgBla
	iThebMXd+wT2zvBtJZr0BcsHvukUxY/XojCmZ27j+qs3STX0OEubvyeGZSsak56dd6Q9kyNKw=
X-Received: by 2002:a05:622a:8cf:b0:533:370c:7600 with SMTP id d75a77b69052e-5359fac22demr153697041cf.27.1791831775276;
        Mon, 12 Oct 2026 12:02:55 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b9783c8e5sm5196456d6.1.2026.10.12.12.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 12:02:54 -0700 (PDT)
Message-ID: <71854ab7-107a-4218-ad37-14c6c6fe6bac@riscstar.com>
Date: Mon, 12 Oct 2026 14:02:52 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: toshiba: introduce a TC9564 SoC clock driver
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>,
 Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-3-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261012152408.3729237-3-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 10:24 AM, Alex Elder wrote:
> +static int tc9564_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tc9564_clocks *clocks;
> +	struct clk *clk;
> +
> +	if (!dev_of_node(dev))
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	clk = devm_clk_get(dev, NULL);

This should be devm_clk_get_enabled().

(It still works this way, given it's an always-on fixed clock.)

					-Alex

> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get input clock\n");
> +
> +	clocks = tc9564_clk_init(dev);
> +	if (IS_ERR(clocks))
> +		return dev_err_probe(dev, PTR_ERR(clocks),
> +				     "failed to initialize clocks\n");
> +
> +	/* Force all clocks to be initially disabled */
> +	tc9564_clock_disable_all(clocks);
> +
> +	platform_set_drvdata(pdev, clocks);
> +
> +	return 0;
> +}

