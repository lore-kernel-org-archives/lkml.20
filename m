Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B934DB41
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570396; cv=none; b=sm8qzFDbUowTHYFG78qa2Dt3+JXg8UqVr7jBXdhk2uFQ0OCz+63kqavwv6klSyBih4Fo1Yq4gAcfLQp6UQAPlERySx9EI06A/YpjSOprlAf/3c8sIGGZfzTCTTp8YFoubpOj92ZDxC5/CaSM32EheQKfNjL2AGrZjOrAcLAOjh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570396; c=relaxed/simple;
	bh=kz9c7562LzZnfgeH6LbintREMCJHlKCKlc4kEhyiQ58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omL9WkNBJ+D9Qnb/dtFF4gJxrPfw28f18TyGEzFfzDlrPIzHS4aoCwb9zjWPCGZ3fNtNBO4YTI0Ekt/7wpxcJ6/6jH2gdpJRpekCXotrH+SV9Cd0VUiGb/dAsFRxkPtaGJZlMmyfE4HRWmcdyR1oNB0xrpT/5Jg2rvwmJ97q5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvtOl32w; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvtOl32w"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso766296a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570394; x=1790175194; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fihMhWTIB+kY15B3X2oY9LnEH/m2Tdo1vVD8z5jRtG4=;
        b=lvtOl32wdpUneEwagp+SRBQYZTa2C1EeYNxL1k2SjvgEpOL/MVrNbsUnM1MZS39Y1V
         Brtx8TSCUKQ4HGgDag52TOYLWEMfKpFqUi7WKiQZXlN0NvkfVSRRgFse21lmIC6otrs9
         w151xgu6gNFtaFPTXHfNDrW5TfCqbeATpONmOd2sdTxbYU13Z5GrUh+N3/MJ3FLrMvnU
         hIPm15oO0ZHO2TBAR0hoC2a/BSw3bXchPHTQUHnixSrBqlf3zgwV6IMx5BIyIC/zPPZJ
         esCzDKAfOuU3Gl9GUlaDqzDPKs60lkuhB6xy/4mdr2FrFpAFxEbPw6puuwtv6l4HgNE8
         ULiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570394; x=1790175194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fihMhWTIB+kY15B3X2oY9LnEH/m2Tdo1vVD8z5jRtG4=;
        b=Fi2ZyIgjRxblRIuR6xWVv4qjym7sBwZftzTEs6tQYU3lrI3WhNBUYlEyPPJNKBIl6i
         EtjssNSTsZyVPUEZpe2XbYd90YzC7veq5OENn+dixIQlsmmsdAMIFhBBjXydhhVLYPjV
         vqmUeWwIQ6f5kdfb20LvVX7ToKLCDQ/BxSBSWe66YcC/2v8DQlBBtTH/rhHx1jrmLX+t
         dunVTqdezymyislx2k9/PNJ7qYRPM0nxJ5ikCjd49Nv2c6tmN4bi2a2C64XY/GeNpsjy
         KXMkCdDEUrgrYfSGDTiAcrx+t2x52cyDNRd3icJO8J3jia2LmxPddKO/rV2rM+lrtzUm
         prew==
X-Forwarded-Encrypted: i=1; AKwUvBwzxvBH1L70qwsTJAwcj7gSXSnu63Rd1YdUs+/eWDguNhB7m8D92W1yXOmFkjiEVjqO8EJFTW/Bpd9nmGo=@vger.kernel.org
X-Gm-Message-State: AFuF++krsyFUAeAJza4jbl4gp1wkfWwZE2NYhepEJMaRI2RtA93HAppN
	h6msF565+invCMgjUZh0hiEYxDFjcpIAANBxKCu3yKX6K0Fg5BYY0mUs
X-Gm-Gg: AYBFou2YQd2HFtMdYGiGLTwtMwSlud4t44LopXLCgc0VJ5eMc4JC9gJHGmmkY+VLTYK
	XlgpzbSl/kJudTmvpsQjUmUU3tZjA1ozv/qdUD5JkpjYwNn3upvxXwJTYgX1Z6aPWJr20N6BqQ+
	UorDduU8xMV878XQWknDhkOCXjjGi+jn1ihhL8XNPQhos9ZUFLCns/e+yERTlz8/955FyyfvS5w
	qmVRdNGcZxAaIFzVUuGHi4GqZqtHNlEgwkuZA+gaqSTX361R5GpM82idHUyQI+tpkX5m7/EZdRY
	ObZN4l4yu4oSoqsoZUUU7fX2nCarVLlZJ79jYqmdwJ51jmaydKu00zxeFqswXTXSHpAd//RYqsC
	PsYbwMgXmCLbSaQSTzCveUqMTdZz+yraogxNMqaQspjdoxf3IvMvWYhOrUxFN6X0Y0WDHZjbU6/
	BHaG/Hy/i0OVf0dJbcY7Wk4zpDVb3PAdVtOa8gtYKKWMnQJXuNNV3iJj6we6wOWBJF4UrGbLxNl
	gvElgowaD1b
X-Received: by 2002:a17:90b:548f:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39e1e4c9d71mr6984128a91.20.1789570394061;
        Wed, 16 Sep 2026 07:53:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1d0be48csm1586133a91.3.2026.09.16.07.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:53:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:53:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Pepin <patpep@me.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Precision 3650 Tower to
 fan control whitelist
Message-ID: <4e5f8714-4257-484f-8f8c-0fc8033ecab6@roeck-us.net>
References: <20260913112925.11393-1-patpep@me.com>
 <20260914080955.87925-1-patpep@me.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914080955.87925-1-patpep@me.com>

On Mon, Sep 14, 2026 at 08:09:55AM +0000, Patrick Pepin wrote:
> On the Dell Precision 3650 Tower, the EC ignores fan speed writes unless
> automatic BIOS fan control is disabled first. The I8K_FAN_30A3_31A3 SMM
> code pair works on this machine through the WMI-SMM backend: after
> writing 1 to pwm1_enable, all three fans (CPU, front, top) accept the
> three fan states and report matching RPM, and writing 2 hands control
> back to the BIOS. I8K_FAN_34A3_35A3 was tested as well and also works;
> I8K_FAN_30A3_31A3 is used since it matches recent OEM software.
> 
> Tested on BIOS 1.48.0 with kernels 7.0.0-30 and 7.0.0-31 (Ubuntu 26.04).
> 
> Signed-off-by: Patrick Pepin <patpep@me.com>
> Acked-by: Pali Rohár <pali@kernel.org>

Applied.

Thanks,
Guenter
