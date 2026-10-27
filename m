Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079306;
	b=0DuR8GcP4OnWoiPgfjdFQvU0ig6kf1S9bsw31zliPExlZOnCKWVxPRqabFXCdBJZ11Iv
	 TTr8OWphIPNFhqkBsSSKItsXItIH38svdiPLm65I5AneX/39Fc229AuLQdJUiXoYzUVz/
	 0DBqXFRS2ezRTeqQ2OW3coW05SdYne36ESo0ZeUfSuD/zlboRnQryt4/S6Kmf8keAiUsT
	 zenUR0bNdNj+w0CBPVGOR8b4632obVAmmj8CbIlaL2FGVWbdlHR1lq8os5kQ9tH9H6hRz
	 3f9XEKs6FXh5j9AkJgOYOuIqEvMpk742sDtNpTbMCYUWKkQv2JGZ7fZdU8uOrKbp46g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hjwP3UPuVBpxDXWbtbEONQc9EqAwoM8fNiMF8hyJZOA=;
	b=QhfLbXrGq8hHH1EZWWpwlQuZiFpLxO+SZ/Qmjd5ovYKYXnmOz7TQ5K2fqq1xRB9bsNr4
	 UPABuA5uBzP2gMQWDvOPsWUEFXO00MSuhqJYzAgZILai0q1EBG5+XGDpwFgZfCUNXsDgz
	 nBVvnqRnkdkvNx5P4Da4npvF3NKClHXdEuM0nyKtFOt0ezSPsKdee80F4AOWYuz21Dy4y
	 C9qq8mDLGpGX3MT0S5eaouYjdPoCR6kLcjwdFSN/85Alxs/HzOcUf+5y0bPAvza8Bdxk7
	 /FcWsDbjuDeMXgh2Y3t0v7pyd2c8441qGd7pr0U7F1nNRIA5AhoVLOspHDuxfxD1C0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYNEXCwM;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04460606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04460606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYNEXCwM
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df54150dfso1983663f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079304; x=1793684104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hjwP3UPuVBpxDXWbtbEONQc9EqAwoM8fNiMF8hyJZOA=;
        b=qYNEXCwMU1+RFZE8VKdYAVN4Vh+d3pNOe0IIjDHxfz7hD+JDb7tYiHRnDrrS5n2R7e
         o51g+cji+ovUy8miKhm4v3wefoIEn9Vod2EHk7IhrDkK9hCbN05NblIBCVfrvnn6D3Xn
         NJwMIiYOTxd945mfzSdyaNbToroTDRQD4ROJANhDfn3hsIevggUUjJlryGnxf9pl4X9e
         JwBc2c+H+S/CNEiOS5ZulQQLFBqi2wBk/R0JtJDvjqv+pykMHz9v4SHwPlsLkbVkgh1X
         joMSjw7CbCRbSK22QHQZwGDMUwf6i7l2d9Fkmy/jdD0GNr9zKW1RfpzjVXLUxPzAp2R7
         JACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079304; x=1793684104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjwP3UPuVBpxDXWbtbEONQc9EqAwoM8fNiMF8hyJZOA=;
        b=uOnGJYOZ0BYhRIOp5Y/VqRx/AVXjCscnkOt1gfvhEZ471cI+fPY1qnxms1MCJVVDjN
         taeScqwjwAhynRms8a8XvaHCfjaxt9Ko9kyCXSqehgSTJMiAMPkyWQt/rOaS6NID9FNp
         DarRoNsk0+00PF2JAEFcS/L+XtCnh4APvajArGf2kz9eHrDQiUvcP+T/lYGi4yQmO7JH
         sAs3Vcw6h2YlHKzTFE/20m+2I34NVcNwMUIHWURlV5pnoXIz/5i3DnFJZ0BHNNygbl/e
         5iFWkdtpXojpb0wb2+0ugFVW8oLQcn5vW37czhxD/XRk2iwlsnC6svTAgSm+VNyMQIW/
         r9Nw==
X-Forwarded-Encrypted: i=1; AKwUvBz5CP3MYlqA3YyTMe+iN+MS2jqWk6GFJS9Tsripig492krmTRKdY/+fg6THhyR9d2kFFJYM7vu8CUQEwyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8vl4aKaN8MN5YgrFmFv2wb7M1Jyb9/FncVtMJWFklIRcJPnqT
	1XVL960ukw72RyB9JhmneHTgsnOaYjI/iwjviq5L5FGeIy0B9BysgydP
X-Gm-Gg: AYBFou12P5XseM5dM8Yh8zfMwo7mPekn+GcBGlUX+RVaUP8raCk6BDMUdz1iJocQPnl
	4t/yiuNZgr34TqUAvaAUWIBUxDbSht6912uopokjaaotznn+4dP1qUHkL6PErtv/8/49jwj/7Rs
	y09hjiIA+WrfdQklcuF5H1Zk6cFFmCswdc/4LT3EvN+MZHqb099OWK27Yf8NnG5KK4aZnsbmU17
	DbtUkHpKf3uDTbfbtwo4L9+FQEEdI3ENn+bgHV8GqcEH8A9mwmCnmDSDhng5SizSdHb0dJQKWLA
	TwadkjwEipIyi6AfaZVI/JlvqpfuNIF2muCOBefhVk80lUpOlCvKKT7V/sK2EZQCzn5qnPa/k81
	h2OnbIhM0SDEfTvRCJM74P25UYCCarmKUYDaWhENAzF4JeuD+XyNqnmFV6e9P41JzajkCr9wFEk
	Mzl21If1tjCYU3rv0rIk79cSga6E45R8+pOiYGOLcI8DXu/Kupxpdo2nb88eUJQItvqCV8G/lfz
	3vdbmBXuYyqKHpwA1iLPMVH8fhC5H24WsCq9iYE3AMucTOe+LSK2g==
X-Received: by 2002:a5d:504a:0:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e3eba307fmr11592520f8f.54.1793079304172;
        Mon, 26 Oct 2026 22:35:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm21205393f8f.9.2026.10.26.22.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:35:03 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:34:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Albu Victor-Marian <albu.victor.m@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Subject: Re: [PATCH 0/3] staging: rtl8723bs: checkpatch cleanup in ieee80211
 files
Message-ID: <auA4A9N5vYCH7Zwq@stanley.mountain>
References: <20261026205659.181065-1-albu.victor.m@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026205659.181065-1-albu.victor.m@gmail.com>

This driver has been deleted in linux-next.

regards,
dan carpenter

