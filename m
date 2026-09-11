Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1975646EC8E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118745; cv=none; b=pgyTy9do1XHZtYUMiEgV1t2rR2xQsrc83e+umNTfx0r0a59F/V6j+tyFVPaUh8fpnzGcy5Rj4CMVyFj1O7GZWlD5k+BBfOZXAAnZu4/OidrIzEbz7mpb30AC18WCJ/SkOicqi1m9NzipoposKOk2TEnhdCWCmEtdxG+f/c9XyeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118745; c=relaxed/simple;
	bh=+hbhW7C6eM97mFb2FKZiCDMBNxK/ZTdLSStbnr8knoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUyBnF9huj/1CY/ZJyMqLy5qabofXsT1Lp4l4N7ZcwAoWu0oONI28ZP93qwR7ASM6yJqXkqIDI7/JW2LiTZssu9371yzi23PJC17D1fJyPJNtQ9KN1hd6JTxuoT9HAc3fjBYxTBv5eN5uRnPN5uXq6ClqEJTT48764hUNKSlH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=tAgaI38R; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="tAgaI38R"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c250f28f1cdso135341066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789118742; x=1789723542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8gX9N/TAzcuCOzID4yZlMsh7bJgTeR63hKKDKisDgEs=;
        b=tAgaI38R+RNObCtY3F06INVWouDYm1sz3SgMpyRjNDxglBiL/xXdwzg8ZmVhQPCd4Y
         ThR/KXRFiXt+6Xgsw0l2N8Lbxmnb3zeYKH3PWblLQXJfJqC/oqDfGnf/rMShR8PlZKNH
         zOEVzopQIbmSI2/Ih2hfBrvpjiCrAQWFuBW30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118742; x=1789723542;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8gX9N/TAzcuCOzID4yZlMsh7bJgTeR63hKKDKisDgEs=;
        b=NkoUD0fvg/wrrxZLevAxpGs8S8iKjvI4luUtpKj/KmRHb0ScY3noftYiJbllEPm8Ah
         Hr7NOIevWqloHs9kb+6oao9MbHIjv+19gFeecdgdl3A8n0X4m117ErMXQyIw4ZxOq91g
         O0suhWHqwTmkByZg2EZLnl234+YWPUzINxwkVt6J5ApUgJV8Cal8EOcryrtGJCkr9n1X
         14jd+rQa4PB7DRBjpndOzM3QiC5IGuBqKRfoe0ai6U0+oc8ARTeBhUGCEv5gLLCyNbfZ
         EaWSucXwCdemgXfM04LDwT/i0Kkk6Xmvx+w0WAFKJbhdLMpMnKJ+qvAdUg9qBor/sjPX
         XOTg==
X-Gm-Message-State: AFuF++k2T1BX60E2xs7oFk7cXEOq1iooPF8GzB2QPjBxLqko2M+Tibyr
	Tu4RXPVTzjFnIHwp0+WGBKIkqqD3XjDejqpI+1I72rVWOM6PNxm3OwoCgSvXrZKNDS/LrHvx5Jw
	dxQsZ1HQ=
X-Gm-Gg: AYBFou1vOOnLuYVHiNAP9B3zwUALOXbvXdqkhTcK2l44u3QD9RrjMNPyw25+65IB70S
	JsG29TRwrIPdsbQUAPU8TVNPJyRBtt+xQZ8O06oylVdb71dQY2mbbIQEu7Q6u18dfKaCiPxS0E6
	7O6xrWt01L56y/AFuU+wfjeHH6n/accuj2XFn8nNl/jRgcZh3XURBdrabCgbFV9WTzMGqjP8r+C
	ykFVc9m2MsT9AZQ+8tpV1hAJhlZFEk0kYGyalnuscjKrk8VABhUMe592HB9g1rB+KDtE5uIi5gP
	v1OAP7PFuje2MhTTQn1Ud4ZHW/CEt2LnjpABkMgoW80QjAnwXJ0ent09z5qbJqd+grlM+Zjfzq4
	yJrurNYvtbEozAaeG6aqM2zI7gGH39cRTqKtL0HJ1+5z4z3MJMGXNJrq2qsAPMh50KiZUxWOteH
	RbdR1rFdVtv8LMBE1WdIcJt0BikPsyR2OYNn5cJlcUhIZ8DWwJ+xCMdoP00DymOtCQTl9vCUCg7
	tq+kCtmhbj9X/VR
X-Received: by 2002:a17:907:c48d:b0:c29:3a1b:ec7a with SMTP id a640c23a62f3a-c29665377aemr142889266b.10.1789118742279;
        Fri, 11 Sep 2026 02:25:42 -0700 (PDT)
Received: from carbon.k.g ([85.187.61.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b75sm60416566b.29.2026.09.11.02.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:25:41 -0700 (PDT)
Date: Fri, 11 Sep 2026 12:25:41 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Message-ID: <20260911092541.GE722@carbon.k.g>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-4-petko.manolov@konsulko.com>
 <0b682ab0-731d-49dc-a7f8-64c4d71bed71@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b682ab0-731d-49dc-a7f8-64c4d71bed71@kernel.org>

On 26-09-09 08:36:14, Dinh Nguyen wrote:
> 
> On 9/9/26 06:15, Petko Manolov wrote:
> >
> > +				bank-name = "SYNC_I";
> 
> bank-name? I don't see it documented anywhere.

These DTs come from u-boot where it is documented.  What would be the correct
approach: to drop the property or document it?


		Petko
