Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610E1DDF0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 03:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790393348; cv=none; b=n7bALlrOKCn4WCOufRfOt+lQmHNcp9saq7Wp4cunrUO0p4JUwYSybCGsMCS8Kt6IWGCq36WuYq03H8S7sSFp5NG00jYH0U1x7MYN69a7fd+H/7PaVmpDr22O2vDT5AIl133QaNnnYM7RA1kdoaKYhAbmOUS8HICgHn72QayHLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790393348; c=relaxed/simple;
	bh=Znr7ARt1iJlguBK9vtmL9UXuuyNNrW9/zWqJGcZ2yuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyw/6dpf/hNzD+X1EGZTUnXLO5R5Kb0l+lnObIPH60XU5RGSSdKWlH9k5xBcKg5AhWmup/wloyr7pbeRUcD2ol1AComf/dxpi3U1A+oPz9JEtZcqfyfv8z/eXSnwlhpu2e+MjDbPsQhqKgYRgG9CYMIsUbNz+uNb99NE1eOf/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUxVad27; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUxVad27"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so813505a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790393346; x=1790998146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kiq99/bUySCbDDzsz5gCxAmvyRdZYaOERsW+1tODmAQ=;
        b=SUxVad271vm8DQ0rhf57A/6pZdycksqKKoQVO2Mh6BD8GMeqQZyDA3pH8HAc+9lB6J
         gZ6yTX8uBlXu5N41YGmhp6bYe/7Gt2u0ZsgNA99dnGdVSUrOc/HH8fH7fzQLgwDYNRU5
         NZ/3P5b4nLek2+DfIGWoz0IKhJEjy6GXXRmd+5VV10ikVlE/wUxZrrIN84DBUZvdag54
         NCWtrLZGrEWIGACiPxBK2QAFZNSgF/aw+VwbYQYiHdahkWZY6B9vpwfbwMgI/jzcjaja
         qTKRz4Apl0ktEE3h+F4hM8Z5TPr1MhW1OhzMj1fK6lEzcABkYVy2JaBIZHaPVFSuXRYL
         Gf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790393346; x=1790998146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kiq99/bUySCbDDzsz5gCxAmvyRdZYaOERsW+1tODmAQ=;
        b=Mw0Gay+7Iv9JY+ze0M95/5emWqIqMOzgemhlcG1JatD55wIptDwhcOE3VqZv/jfWP6
         j8b/e9aNT9PIeINmuKUr/TCaIuZyKiJ2IbJ0e+HXW4dGjv4i4jFPoT521f9hFXcNOzwe
         Al7spNiU5My+qq3I8/uRXgE5HDrKvhasowqgw5F+wNbcMQU30Nze+7RKFyVfdm/WArvE
         MSRmvn/Q0+azvjgGcsj+IvxhoVVddeXA/4GWqljyW0oalLuDhD2GtJyGS55YHIrwyD9A
         zz4wtwFJYeN34AziGx0X/KCjfzWKUSl4qvoelWoGctwCiC3LgvSPtUmEZE3YmxgGF7uV
         8n1Q==
X-Forwarded-Encrypted: i=1; AKwUvBybUnRIR2EEHJ961MBkV/6ewqhZMKeOMw17N/CSE63GdtN4++M4h3MAATpDLkAGa5wCf1N0R/8qxfc5OTk=@vger.kernel.org
X-Gm-Message-State: AFuF++nF1a3p3YskkymChX9youxb7zonOZDea2nPKcKUvN+2/b9G3a/h
	45CfDqkfVJDnZToCVFwe6ET70Bm63BXKy0rYlPwFLrvEOZ0DLVA9TOHz
X-Gm-Gg: AYBFou11Ux7bA3xymoejdMpYg0XTTv8JO3m5O6Hjx5M99X7+bhcu1JIQouPkSioXsWe
	SMGrIajMKkrVmXuB76htaOrb3uc5iWIQ3PdLAXmE/x70xcdbgXs/81wJJ7JoJOoUrGaTkLxujLI
	krZUw2HjjRkvR9yXT8e7aGh0gw+DQ1o7vgGliFEwsfCTIjhxGrHMagkWNF4oBxaQ4KD2MM4jr3O
	YSHOy2BS1iggaVUTU18yV3MWWa3ohGH8VNLNg67ItYk4oEa6Rmd66TBDlWIR7Rrn615bhI+PlWc
	ONyPWBMDEJcbr0osi6gsjjeMvfc0LTZmJc3P/qVXnUuq3xEqZ4foZJBpJ+wkLR7wcYVfIM6LY65
	MwhgxzVkdYddymWla+4CO6THtRadvlx5QmmSmWrppPQVJI2BfWDBKrLgiEqHQNjYtniyeAI0UCK
	31nwTtusb3PsDRhlAWTyYCvxVqK4iDPnIFI9c+v0CRUyOC/X1LboMYREHOfoe9T4ih1rHRxYkZH
	zOEVd3IGgDyF62SN/BfbJ0=
X-Received: by 2002:a17:90b:498c:b0:3a0:903b:f253 with SMTP id 98e67ed59e1d1-3a09875d77cmr6186954a91.18.1790393345982;
        Fri, 25 Sep 2026 20:29:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0bda430b3sm6734490a91.0.2026.09.25.20.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:29:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 20:29:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add support for
 XDPE1A2G7C
Message-ID: <3ff0d983-37a8-4862-9019-478fb1488329@roeck-us.net>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <20260921065702.93196-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921065702.93196-2-Ashish.Yadav@infineon.com>

On Mon, Sep 21, 2026 at 12:27:01PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add Infineon Digital Multi-phase XDPE1A2G7C Controller to trivial devices.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
