Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB46443A83
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926793; cv=none; b=SkxcLCOmlECU8TdxvfHeGZIczNd2d//PXRxm/pN7TME8QLnEqJhWrs7TLoOcYLqQWrdHqUbKso6/oJsSRQl1o0SMFTp/0cICw5FxhrytLEgfFMmUHvOAMoOAXZxpdYjakLEbYXgeh75CPB5RPd5j66C8zgoFmbDuwPcI4x6Mtq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926793; c=relaxed/simple;
	bh=mTF/wwTe7raAFFshxqGZxYfSxrkUHIRFyehiPesUjNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6ERaCiY296U43madXvUCLFz6LL7LDebF621zf+jza7FuF/Yu1ka4Alx1PbJt4VtZDNuayLAKQQw+2GtElyBbsHXfnhnwFudz6tNV/fvAyztBh31wx3CioCPUHgXTauF713/yRXawC8dbnr48otPubeMTz7dc/8Ih117h2Y1YO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7ore+Hz; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7ore+Hz"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98e1942dfso6337888e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790926791; x=1791531591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTF/wwTe7raAFFshxqGZxYfSxrkUHIRFyehiPesUjNs=;
        b=U7ore+HzSO7qVTq/NIJiHVyfj2Ic9X2LFi4e582QOtKyy5txdafshwozqjmpt9QSmp
         xJ6Baowu+No+/AngP55XRvPiHe5ui9WoSTptUXDQMZ8sI4Dh4ueVzVwfKi43tPnuRbgw
         q/27vggAb1t/I03mpa71XgTyGNuoUU8ZSMrppw+cPZrQFRahfpU1yUTyvjKDnGIuqOzt
         lzlwz3IcV02w0Y4SOeeQopbkPAlLS1/AQfhE3VXvasNthb+5V/R+Unm9sYg4x6DlOeCO
         2t8dpnlGGp6gimjRDKpsc/0nxZ/R3XVWlmVdWb1taaDOmi0EJeNY3wxJBXZpmLAZyb4r
         rTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926791; x=1791531591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTF/wwTe7raAFFshxqGZxYfSxrkUHIRFyehiPesUjNs=;
        b=raJrDw1MqByR6cJ6WbENzQ2ANZk7rY+N4MsLMOHjgL9dDA7M7xdTsvcQEiLW7uVmuZ
         LAGbIWSMvLnjGBSgTZUBFirKeIQII4iXox56XY0zvkkdXQtKDw/u/RHdeQf3wMg7Se9i
         eRqoE9lIY6EhyyCVmFeLPupC2gY2FuL/kKweIfaTOPYJsQJx70XCkltmUlDbbkjFEwq5
         geo3ufSwQlaZ9BxYpb4yaMlcZwvPQo/zI9C9bWQFViyd/UYWrzHOKdZmMRbmhxMACj8D
         UJxC1I9llTF3PcW4+PZM5cTnNYWuUjejdlqjwUgWo3d9ngrTXd4g+eBog4kbJpxWguWD
         PFNQ==
X-Forwarded-Encrypted: i=1; AKwUvByr7MUWQ0OaB1kHz/ZTfL6w1U+IvtKDauQ1b/P5cxzmMgWDq3KQB0H+xQMnul+wSomm0abHFHVbfQwFxIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9IZL1OhN9DK2/qnMlipjpX6yTNW/+JNW2Ms65NV+C0Zw71m2z
	OKa+8l62CRWmCGb5/CZp/r8GMPd8oWzsMDSVTwLOOuvt/TsZuUdNPDRE6TTcWg==
X-Gm-Gg: AYBFou1VTL7HKtLLhDopS4snoTOjXu5yXX16r1qpDnwGt+fzRC3UfMo7zvwaKwvpUTs
	GtY7e/CIgjhTQRYZXNPXGb/3VeEC3lq2G+RwYI8DkkCqJ/TQWco6dob2T4TwSEeiiZGsOtnQcLq
	NY3Fh3v44UlYI3b4t7SfRFBJXdlDlD5DapkwulhXgdbOJK/RJO8eZiVImGzOkNRHnShHMDM/Lm+
	fxY2JknIJGPwz4sWg08WJM2s3NZp1kbH2iTRxL761TeVpI+DSb/D4WmZe86DbBhbsHrKaKws0bp
	YaqNYyTqVdyvH3b6IX/lZGfWp8cpSoeQAn6+ianH+b2t3tIzd0LboV2QIbFADuKNu1KpDod+/GE
	2YSiGVNes6mhtQXTcxtb0L8/JShl/g250zQsEpPGEhxT0hLcjn/+dT/9hDF5umUtQMb9vsof41C
	+pJ1HqrGJXod/57B91fm2X7AFdu4eWi5dxq2UxbyTN0dwZZnDlrLX7ldUA6vRJaW4=
X-Received: by 2002:a05:6122:f84:b0:5c9:82a1:a6a3 with SMTP id 71dfb90a1353d-5daaf77f0c9mr645246e0c.6.1790926791020;
        Fri, 02 Oct 2026 00:39:51 -0700 (PDT)
Received: from debian ([2804:14d:9ea1:8718:c77c:8:a40d:84f2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da568a76f6sm2631074e0c.0.2026.10.02.00.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:39:50 -0700 (PDT)
Date: Fri, 2 Oct 2026 04:39:46 -0300
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: rtl8723bs: refactor
 PHY_ConvertTxPowerLimitToPowerIndex()
Message-ID: <ar9fwqJ04CzzSy4L@debian>
References: <20261002-rtl8723bs-tx-pwr-limit-v2-0-48b180fb6f7f@gmail.com>
 <2026100211-scenic-eligibly-58f5@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026100211-scenic-eligibly-58f5@gregkh>

> When doing logic refactoring, testing on the real hardware is best.

Makes sense, so should I be dropping patch 2 where the logic is
refactored, but still do patch 3 where the inner loop is extracted into
__phy_tx_power_limit_to_index() to reduce all the indentations?

Best Regards,
Leonardo Martins
