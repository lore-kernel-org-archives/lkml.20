Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9B574E1D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088559; cv=none; b=SkPnGSyYXRLKdbLtzJo0qtFr3OUJoOlsIGmxWoriunjh/XmQtyaAfbk+ENK4J9UHsFzQHzd/dspWIFIjmWgdaRPpLD1bxF4FpRrv7xHOofceG4uQh7VxZp0aScvAmjrLEvci2YVdQLnnDigkyIiMLmDuROhCTQDyaMetWhYbDXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088559; c=relaxed/simple;
	bh=TiFzUS2aHYLoApSqvwEeB9zLb2sSir/BfO8lZ3oW3tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k42hSZ3qc4ejVECydu4zDGJLe6VQt/tdDBGKj6XmpirmwSGtDMX2WlKBUAeopBRQq5K+YTq9ynixiWdsmVmP7N0eJPNXc9kODfIuG913KKuKXR7DcxRYV3kzbn3wEu98gvVwXpFFt4luLU3gU9wPYGvO1AbXazTTqSc7KhldoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKW7dDZT; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKW7dDZT"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c7e3a2332so246256d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088557; x=1789693357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gU2WF9XqL472gayp+lMBaEHlfREfA6uslBJW7Hl4Whs=;
        b=QKW7dDZTUEnoo+36DM4WzjJ5RLrqB2Fia6IP9KMuwEerQ2zrjzy0l3gpL6/gfeh5II
         2L0+Q1zu0FKuwKOqp7Awbd7JsvICfR4oLW3v3zQao25YddawqV4rRAqTSVx1zFBxd4ui
         RgLrsfuenJn91A11Cw3WRCJVB6uaUlknqkgNAihbnsFaHdqW9V7eBJuu9MDJC65Ork6O
         9MWv+/RQj4MWy8L4MSB3pbTro4X+4Cmsopu2RxKbnP4S9GAV+bonAbanO5sVcxAU1YZn
         x9Gyyc+K3jRNvTAWdDL7d+nzycYX5sxIQY3nme0W2OuMgjPhgM2jnAgjPTv7mYt38XCh
         priw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088557; x=1789693357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gU2WF9XqL472gayp+lMBaEHlfREfA6uslBJW7Hl4Whs=;
        b=FihkF5sPSlfTUFYjJVEZK3kW841mlXc8SKOSQVEILVSkFjrwWDkAWANs7+5UXO40zS
         dLZoVdTnTzcEFsOF7R21FtwW4Gsql6DJl4xdaqox8gGMiN6lBvttXjvUyfTckhd4za+P
         W08fIlT1dP/M1JPf5xgrTOf233LPwtQ2nZPRAew+CkrBkPPh3TszEJFv6DMNq+u+SHNU
         O4kb8Sc6FdTIzqDrFtzsDnQRY3Y06j6hnsToHWuqOfPaqi7wxbnkXESB2qGZY3c5s4dE
         61JQnbSEPaKpjEbOLUqjO4OrF6RRzFnTvVxmD7bvd1xu99sqq2R5jrAyJfhanQ4cQjOl
         MiKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8gIdcKgt38I1vOtSxG7qZJcWFbPF6w3g/6ybI4pGy6fcZ5w0fjKA/RLuxn9spKSurHHTyFMIKNEoxWoo=@vger.kernel.org
X-Gm-Message-State: AFuF++kM54QEUoRivgiQSwUpshe1n3oKVnLkI2cW62iQtRSBGjD0ctEX
	y7HhkM+zpkPZAA8UknFUxSVTdpUc/bLXN2q0GXxtEZfT9Dcq2XyjTot8
X-Gm-Gg: AYBFou0jyPj6sRTjyiWtWjtJI7+S27TeDC6vaVqJoDeSp2EFYjXM4FrwPI3nPAYAOgl
	pvXx5HUeEnaeaxId4lQS/q+OV04GB6LFZ4/87wOllteun2CzGkhR6G5YUW8GRYeyt8Ff5MHEGFX
	GfIyRc+s13gU1pwN7X6PovR9Ck0jO3XhxJ3ZpYeYWEK31apRyYsCZU2nkBG/AxK5u+/KU8bpRJA
	l46HQZbfLvQmj5Awrh+go6LwgMO1wUZGCzLHTDga6cOGJXTRrNsJycsFG4OkUVB9NitKYHzKeSu
	z83191Y0UaLbWaGwpSmNR5gHVh/wAVA4qXHReFNtMVBsr+ted9eQn1K5yD7miFhIOoXiiMiuAZK
	2YDRkTosA4MqCUJnzD4+48DUfnAgwiE/2lVeKT0ZgmEW6vKscQPJjkUi8C7lvt2oNAPkw8YyV+D
	SVuwjYP5xUzuUxB3Vk+MYi7u2UP3Rtz1onehRcrWze6X+fJIGxJoFmSeb8HPHP2cygUOl6QUv2W
	hc48mgHQ4aj
X-Received: by 2002:a05:690e:b46:b0:66f:a1e3:9c77 with SMTP id 956f58d0204a3-671245584afmr961357d50.2.1789088556949;
        Thu, 10 Sep 2026 18:02:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm1826445eec.16.2026.09.10.18.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:02:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 18:02:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (nct6775) Add support for NCT6122D
Message-ID: <0c683a7a-a824-4b68-83d4-3c640d90f876@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:56PM +0200, Paul Louvel wrote:
> The NCT6122D hardware monitor is the same as the NCT6126D, the only
> difference if the number of UARTs: two instead of six.
> Add it to the driver using the nct6126 chip kind to avoid code
> duplication.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
