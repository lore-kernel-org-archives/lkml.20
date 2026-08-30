Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E0175A8B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048344; cv=none; b=ZDXfYeLCiQZ+sWM1YhtBwYrTfl7LsuiVO9FzEOXvM4i8Gp3lQle2iZCys/RwKfRdHm5f9UpAWBQjt9KD2rfebUmHOh2dNAWCmDmQHvKOl+2xrLQ4YDUMG2ioGiY+7zlTnC7/Krbw6i1E2UCBdiDfq7FO9R/LUYjn8Y1VuOgAcqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048344; c=relaxed/simple;
	bh=5OlOabdY8uKB/4x6qhVMXN7GdhUuhBiHg4FZT616wGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMeMYeW5CXQ4N8FpLqQKzifOcgwrrk1OjbZZplx8XqEHvTsfYBOLdTaEUy7RuUmd6WAHoml7RPoGzMJ9am5JQ+WJSd5kdDg9KGrvcDT/TjMJJr19UIX9b8eoIOyCYUUq9BOPjAwHM7ORH36ePr8SJ1qtPL5IpAJifFG9gWe5QGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSrIYaNW; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSrIYaNW"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1728977a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048343; x=1788653143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=74+MFDCnnMnX6+RyDjQR2/C37pOAkmvUU1iToovvHzM=;
        b=TSrIYaNW/VNnYUULq7Sd/sWs6huJzd9/OMBiiCFcMgexGH1F+3UjEsLxCRGvcTA+xh
         f1X2Fx8yVJ1Fla6FHw0fijkOCh6rds1TNWGFbhhyPfe+QftPsD/l1HFukgmSk5Ix1paH
         fLQHRBa3+l3w7K7HSDgcGYwDRPkrvKXx/pJMO5DzAOA0ZDi6olGFcp+q2RChPdJXnoOl
         aVRg/G/rowhsakrNMOmmZtaTIlfLzx6L5fynaDSKHPV6V1OdDLIYSeFZotFFBB5gBf5+
         646kQCNNef+vvL1OAEUPWMjZcqsglAdP23CAyuAp/rmLrUAu4xCRKA668qi9eMCIzqzj
         Ou3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048343; x=1788653143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74+MFDCnnMnX6+RyDjQR2/C37pOAkmvUU1iToovvHzM=;
        b=rXUsioGnd6yIExS95WCcMAB3k1DJtQE+iDSKnCcpHDVxVST6xzff0f2r3bCU/lMUgi
         erUYQQtbAdipoD46lBUrzmJC3D8xaZRgFAgMw4VkSFHRupXrplq4VgS0VP4WTv0AAnoI
         m4pWtwsuFwCyz2clDdEU1CR7Ur9YR6S5jtg7BwL2xz3qjKSVioVJDkUtrq6JRfrzVPZr
         WjpuyvA0q3J9L2pJ7vi3SDnKEGCY55+1cRksNw54O7n3y6aIOOXJewe6pa8RihMmIHkw
         DP4XgjTEoR5lrPR+AATygdZPhwbBn+O52r04jFoH83WMq+vOhp0rIqBw6K/TWCYnko0K
         ipQA==
X-Forwarded-Encrypted: i=1; AKwUvBzzgVBw7obihAZ7oDFpT8E07lrAwNjn9CAAT6ENQUBDRTS7j+BiPnNJd1kjoEm9+xrZRxeJdrkbPrGpX8s=@vger.kernel.org
X-Gm-Message-State: AFuF++kFf1wTeGnKlrBEPPGhdvJHuyUsI3aCpNCi5uzaB/CL37ruhrcd
	AX0LmBb5DO4gSU/3r5nicwB3nBLy9fLqdopoAmtPzOIsrtbpC0teRk4d
X-Gm-Gg: AYBFou08Iw5MqKsMAWg7EZ0A5PnZk0LqYNytkDieWkuI9/YKGabJoDEgFDcD/9WhkFI
	SwmtIo8yuj6xM5++uuzA+PboNK2XMzHpLE//DCw0MAOs+HN9GA8/5QbiqIfub8i0WylUypQDGqB
	9mluq7LW3Hby57TS+t4zWt3WsfJIlGthPl8lnqkXc/Iu47/RVblIj0N57zi7OyzUqvzDC51m1x2
	v8kfU3vH+c02JUsbKEXCsy8mISC+YVp6IFgP+Ba3a8sopye+0ZWsBL6I4PPiGY8EQX+Lfmu48Nd
	wO70AP3OneV0AHsxsJ5SoVIYkyU6CdoN19Oy2T9Z8ammrBs+W8+B6WSAKT6T75hrxDea02RdxTk
	0hK5hfWaD3pWpjMdTZ12yyHJYaVJyxXd/uSKy59FI/D4CjIjCW6JdtwowAWvsLt0MzJ7/PnAoHh
	UBM7Tx3/Lv8MbwbHthSidFtbVEvNsL5nEBz4+wRtmAqfmQOg4kkCnjZnkxPabEIxSukJqky5LXx
	A==
X-Received: by 2002:a17:90b:574b:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-396d10178d6mr30568280a91.14.1788048342632;
        Sat, 29 Aug 2026 17:05:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda368e6sm8678734a91.4.2026.08.29.17.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:05:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 29 Aug 2026 17:05:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (lm90) Reject channel 2 on chips with only
 one remote sensor
Message-ID: <ea37ba3f-004f-4544-ada7-06e712160cf8@roeck-us.net>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
 <20260826184750.4798-3-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826184750.4798-3-flaviu.nistor@gmail.com>

On Wed, Aug 26, 2026 at 09:47:49PM +0300, Flaviu Nistor wrote:
> Validate firmware channel definitions against chip capabilities and return
> -EINVAL when channel 2 is configured on devices with 1 remote channel.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
