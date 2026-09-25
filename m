Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2B14CC631
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376507; cv=none; b=pIUyYvOUzRAYut7+3iQ7yeNGZAQArkHIQOKRcmiQ56VJZGjltTEV3HlTKotP8h9pM5RMsWCcHjaDF6xpY/IP+UhOYg1g2CbjBMbIYKaeHLD0BJBn3kQVkLEKbQSswkDGUogsKknM87ZAwOop9T8Wu68+67dVYHp/UkQGDF7+shA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376507; c=relaxed/simple;
	bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2e7cKEQVoWlOneovSQgcmN10nNN/gjifLH5Am70zYrboibF6yTWdgfSsQWnwHyS7PPPnI3VtvqSwBkIJm5YZCYLk+Vsev5iw6txV4gNyGBliKC0W1BdCjP0s/dw24a1tZz4kLhKZUc3qkCvO111Ncr6oECo51bh9q10K2H3Rmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NW/EDx7n; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NW/EDx7n"
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-8177a7fc354so759863a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790376505; x=1790981305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=;
        b=NW/EDx7npGA4lAIBnrRyNNM5RcBcnI0sr2fOlSEh/L1K6KMCIfMlIyAksSCndzqsSw
         /dydlfVIAVHVJ/kYvkpHiiWfkvIA6ukyoNqgir5c4S91w/9L8uRKGk4RYnuTQGqynAW1
         CCclBLPSC83Y2jV7XJUjff1KKmgrBk5QqPvhB5wJnntLcFQMd53hhiCJOTjCN9AcKKDQ
         sF6tfiY2q7VdfY4zROi65S5+/UUCiqaI6JHPft4EdeFE4c479JT7E63duqoEaW0jMUce
         sMFXtcbC2M/WwQgZf2FidTJxmZ5dTegDwWjJniLpHEKW+1SY2L+utVk78L0+E27xcI2S
         Cblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790376505; x=1790981305;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNk5t+un5bnjvH3s5WgAuUT8uY+MtqkDR0o9w3npnBk=;
        b=FMGaJQX2FdkKI5Cl4Kv/Q0jqMlcxdgqoEcoB+oeiaCXEp3MTdbD4p8Z0rD3LJsjp3Y
         ftIeFpv8g1Bd66GjOirr8DKqaUkKdpWhUNvL/xF3+tMRF5FylZ5HdtSfd8OT9Y9Ty1pU
         RhNoiKAt5LcxQDIV9ZqhHtMoBUfbjv70yVPePaHzppTNRai34grTvXnY96VjwWFIHU79
         MZJmVraQlcpIJTGhjUZmn4D2GLfQk8aJBvYFU6T7kBDhTRJW3wAsggns54O+idSndBPP
         cQQnTy+kaeDpB/W9wjJWTBY+89jlvOyRQDQ5gxXJZuAWjTkDgigTv+Ni3GQqmwNz/rLJ
         3xvQ==
X-Forwarded-Encrypted: i=1; AKwUvByR4mSOt57ImUxzrmLleYtGgx2Njjg75R7CA8yOUIQ30ZnHsa3WVa0+9vTvfpB94PxuGxtXLVEBJN/w3PM=@vger.kernel.org
X-Gm-Message-State: AFuF++mdggvyPXBInfBFVKWBGjXn7fVwFuJ4nGzOtvLcY0QHb7mE+XdI
	Nak8KXKdwhs1LG2FoNFPEvHRsIkKN0Sw50QiikyZh7fzaGESi24fYlLiN6oFhiAfzw==
X-Gm-Gg: AYBFou1D/fBAoiVaF13bnYho6dDalgtcSgHmfCWYZ7M/lGLFN699i8PWQW1ZX1xeYkj
	xiymYPkGrGVljST1NhUUQt1d55kMwQ55n6MMaWm4E8ZNWi0yJTjC4EtiRo2gr8gdVnEQTI1x3uP
	xgN8lHk7HJDaN6rUf19eLvI8zctTpjfFwO7VY38mDTi7cJClm79UfEH9D+CWGn3pBTraP8ZwA4K
	4c4n4iPaSpzblKmKbFfEvnq7Z6sJuZjA/Qdbmfv/mK+ZWCWNKjoU9c8P0fhHXBWgrv2PAuP9ZAz
	OgJ0BXvaCqW757qjCc7ynENkCZKNXw6wusWx4tSSd67+vFxtJ4Ir5syhd/be5Ws/t5IJ7gPGHHx
	X5ql5euHCPDYEWBVMR/ydxFHkgiFbRAQVAbZjc1aUlR3cWFPSj4SMONZGo5ZPrE4gKQN1BxfkaF
	w6Umu/Hiqv1/q3T9Mi25s588eq0CKPx0QK2CbyiGV4x1OlGLTPivZ2OU8yF4PKw4Qk09XI0JpI/
	QfKYknJSDm+a585K//dlOZ+YrZvgANnaIZYspp8lbnRuGQ=
X-Received: by 2002:a05:6830:4425:b0:7f4:eb76:8820 with SMTP id 46e09a7af769-8178168df1dmr7919471a34.13.1790376504752;
        Fri, 25 Sep 2026 15:48:24 -0700 (PDT)
Received: from google.com (222.97.173.34.bc.googleusercontent.com. [34.173.97.222])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-819471d2bdbsm2561506a34.13.2026.09.25.15.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:48:24 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:48:22 +0000
From: Neill Kapron <nkapron@google.com>
To: RD Babiera <rdbabiera@google.com>
Cc: vkoul@kernel.org, peter.griffin@linaro.org, andre.draszik@linaro.org,
	tudor.ambarus@linaro.org, p.zabel@pengutronix.de,
	neil.armstrong@linaro.org, badhri@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] phy: Add USB3 PHY support to Google Tensor SoC USB
 PHY driver
Message-ID: <arb6Nn1Yy5_1u00w@google.com>
References: <20260925222959.3607769-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925222959.3607769-2-rdbabiera@google.com>

Thanks for the clarification on v7!

Reviewed-by: Neill Kapron <nkapron@google.com>
