Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414D3B71D1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199873; cv=none; b=THEa9O2XsRzSEHxu+uhp/YXz7OPetqETtZzNyH+fhF4uis/elRaebBdNwP9yjYbtc4DdsaYywXl4io64ptc5bTqQNRztFr/UJrfP7wA2x6uJPGhVZGWWx8Yy8h9yFMLSIw59T7LPYIdiMs3thBDlcLYPdn5R43ULkPA+5abeRcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199873; c=relaxed/simple;
	bh=YRdUvAeYdGRBs9Hw9METEgdNfX2XDDpkD3Fb6bsmtfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nSzDAoZvDgyyLBuGskJQqxup6Cp6JMPQpn5DSbz4q7QlS71P3447D7Vuh7KD3RV0grsTIAt3t2TUaQEAgjUeBH84aWA3Tqzs/Fh/2uUiR9cXdr7DQNUf5c7vcQOyVO7qdriHG7tEeCjjCsX5S20kdPIFgimyIdKaeZPhdjR848U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=F9uJQNaU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="F9uJQNaU"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8557c3f270eso3218016b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199871; x=1788804671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bP3yBnej/1dS8o9eVuCwTXKp4H0+6SfILlIQPCeMips=;
        b=F9uJQNaUyDeyDf+bOOlBDqM6kEumRUD5874g29W8jtvO1hoXwGbalGuw62lGjfBt4H
         E+yANMorCkZ1rWZivRtufxuXka+HJZU+jUIOm5xexc1UGqxbTFMUXxOY8UIdnJ0t5BbV
         dpHPBCE60MbM0aNX+io5REMkT6jD3EIZ1nbiRDJyDkHtaO8Nm4g5uud4fI2IlAIPkatZ
         o4e7WW3EWIAFeaKE6eYem+BSwctYvp4i/41dzkwreaEvgWyPAU2MKyd6TA+hUv0o6PRL
         4DKbRqepd+ZbFOT5Tcyd4BHmI1BhlQQMhpHfUWjblMEUEUjXirHfOFYq56mPv3VxyOOJ
         /feQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199871; x=1788804671;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bP3yBnej/1dS8o9eVuCwTXKp4H0+6SfILlIQPCeMips=;
        b=qZJlPWEdxLDhDZ06UdvUCcZXGQ7+yALV72t2jxTSK3WP9t3x4cYDPu2iiNAYwk6tmB
         h2AzGgCgVkNkRCaG5aU5C8tWBYiYsKo7thm+YvSxK/swX7gKxDVM5gRmwmp8DJzNGB0h
         eG3UdPW/yQRlDE+Q5qTDf27dP+qMsydjMRc2VPPacH23j3GhuLLT14VMKjDE5eawuZPw
         gJiBDHknxGYN+65s5MYKRM+3Gr4lsNDrJ7ZlxliQ8XyvsOLPmm8b+pD15dT//VQ3Y03K
         uwWEMRuI3GneJPfSU/845TSu1LRmt+3LJeYMzs3fy9Mf94i4JBNdcZzQYS8V7gyHVlct
         GbTw==
X-Forwarded-Encrypted: i=1; AHgh+RpSRs5O4TG3/O78QaFulQTyLG5BBm+j+u9cNDu0u1ABEtwGkhJok1PJMsOSp0wZZvmiSQ8fr3XV5T824iQ=@vger.kernel.org
X-Gm-Message-State: AFuF++niRXqTTFNFGvfKh2ILeuWyyKGnc9rwxHh/rLdBSSorytnwahQC
	1qAFMpaSXIlu+U0kFckLYWb1Yup13n39pQyrkEcV6sMNMOuXBySfS7r6ptl63fzA2prmoAyyQaq
	QMszx
X-Gm-Gg: AR+sD11zuTZ7/XsvqL1IuDZ6QEjojxbK6tHkvNoA0ZCXuiHt2ntrGt4hi6XasocXP89
	gor4iPKu1QkdK1VMrINv7P0WS0KkPWafoVPGE9p3WfeiMpua1qPupUw7S3H09IXifTmmjEzRGLI
	nWbiK70sa/24wO5hVOBMwjohj7jOFo6ro4DedXiO8n77vOFJ2A8BOKQpiYbyANlF0u5qNtngVZ7
	8s5kxiqCFAZyLRTHJo/R+fiCz5qSD6v62Zbo2LxJRuKGL6Odtvzzt8LC71qgYbVE3hAdWhE4hBR
	laSAODLl4/2qhhFiF3dEYPsBbiD48jTsZQfhuk+TDlIvYSU7lWFFv89KgrassVeF6COWKd4cwwt
	W+0iVqk1n0mxT8hRfR5D8fz6EaPcpZTwHPB3UhVM67KmsdgBsSi/UuRHFnrZEt7k/N4IKWskSsW
	dQpUpPbl4Je6kmGre3hv+m01UO6M9JnczUjzmTQArz88I0uhoBY5xTx1OoyVYWsNGMg7TG
X-Received: by 2002:a05:6a21:a8a:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3d3ad3c6457mr32696645637.19.1788199871097;
        Mon, 31 Aug 2026 11:11:11 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cc1f36fb8e4sm4571178a12.32.2026.08.31.11.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:10 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, rogerq@kernel.org, 
 tony@atomide.com, Can Peng <pengcan@kylinos.cn>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260728091859.150905-1-pengcan@kylinos.cn>
References: <20260728091859.150905-1-pengcan@kylinos.cn>
Subject: Re: [PATCH] bus: ti-sysc: unregister notifier on driver register
 failure
Message-Id: <178819987015.2869653.16458264341724910899.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Tue, 28 Jul 2026 17:18:58 +0800, Can Peng wrote:
> sysc_init() registers the platform bus notifier before registering the
> platform driver. If platform_driver_register() fails, the function returns
> the error directly and leaves the notifier registered.
> 
> Mirror the exit path on this failure by unregistering the notifier before
> returning the error. Also check and return the notifier registration error
> instead of continuing without the notifier installed.
> 
> [...]

Applied, thanks!

[1/1] bus: ti-sysc: unregister notifier on driver register failure
      (no commit info)

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

