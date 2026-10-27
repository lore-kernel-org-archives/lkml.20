Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080207;
	b=3qev1uaqlyHHlPpIx2BxVzH7tmXHN9s7mRI8uwzWtWYTW8m+5gtmwlz3AWQgDQ+N2PAf
	 4sYRvjTwXZ/5IYEsukIxGcYX8s5/fdyJI9O2c7SoDLmqrLDi2r4WN9rL6DGYhcO1rvSMT
	 JrQPS1O5YXfqGbak2Gm17C3NeELol1Gx+FKOiUaKd09h/kXFJjlbEJ5FxV6Qx8s/FaV9f
	 c9YqRYoSNslqeVLnI4PuBRMHVxhAsGTMXvo089enJ2zy1iDyFtzFjtRZ6FSujOiGAgzUk
	 k7IvluWVdmm1el7SEABO4Jhdi/BtYzsvzejEtcZgCeWXGv8mI+aUfgZ5ynR0MmQRV7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X+HEVGecC2vlXZIUhRdFDMRPIoGMulv5Gor7+ZJ0UO8=;
	b=X2+roAA6guWdOFrTajady0edNSjdMD2iQODAh12S62fuM0r848Hm+ltyhRajoef2DmMg
	 G7F9PmDZ1h5aP8yqBPSF1g39GfGFAVkkITyt/mG6SO2A8TPi13fYO111dGhmOQmSZZDkw
	 7qUAXTom7JXpA5QhretkEfDPqGWXBrM+XI9koTM3kD4+Vbup8T4ywT5Yi6sCNsy8k4nRy
	 Zul/TeN32+dunDDUpQLJVnaUy1Uz6UF/5hcvkr+RACgDIHOEnXnZ3h/+3wpvmO47d7JFa
	 on6XF7noHP5mCM6nPDtbJcEFSHjzKNPW4ceApQzz6x6zh0XQUz9iaNM3clprtMiGaSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ToKTNQZX;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C53606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C53606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ToKTNQZX
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso2389954a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080206; x=1793685006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+HEVGecC2vlXZIUhRdFDMRPIoGMulv5Gor7+ZJ0UO8=;
        b=ToKTNQZXU5vtYdFpwJz06UoiHgvDUuuQECwXprnOXZ/Vv1ArKBaEkMhy3/b63PB1EU
         kyrFbyJt3DKfvgjNG/qaLiW7NqUt3LuQ9qZ52chCfP6Z6IdncHUuYZ0Bs+yRSH2jO44D
         6ssJVtrjKeGzPGfOZp+/ESPYQxx1DUTRSSGfPSOjyVnLGPYKb8gV8ADUqL47McsIoySs
         ItRVq+Yy8QWvRBB9P0CYSAx8B6wy5AQKeaoFg2l0H6JSkia+oetiT8Zj67dpXGCCbUxa
         CKbRar2gVV+n4EuCO/oruYIaIaPfWRj/HP7moFIEIYsMBjuo90C2I2fDpI+GQgS3sfd+
         q0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080206; x=1793685006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+HEVGecC2vlXZIUhRdFDMRPIoGMulv5Gor7+ZJ0UO8=;
        b=RpOI7Nv57rP1JLjF+FIIpxpwWPyReb2IwoGVqa+6sBToaZm+alsRRDV2Et6V+b/i8m
         igD9i3LlH6eqzb16w6XJ9mXawowEevwdr1a6Dp2jAijYe7p15dcxUBlJuPsv0ABjQNGO
         FwcDXRGOCYoChvfq/k//C5bntyRN72yT8rIppMjmdq0NFXn5TAUhDgpwxKN1jijdxzZB
         XRs2jHohqmYYEmphtGoyE2OVSRt7hC+a5jhCOS0HttFBiH3AA7z1g0mv/01NB4IImS+e
         5FbjiN8mbY/puKEG1pBDT15x74ExcFoGbx0H+ssiXFdw8VaPA+7S/F+u85J1siSV0awG
         IRFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0OOcTU1fcxsCoFt3X/PDaLVZTWZzjXHofJ+xOLlSCmwZO/vaEwXrrvNYGwEHXRhiY6m8XvDIuF3LYFRQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzub2fkUYDOM0HjmXVIbvES1s+GzVVTXzKz0q5QRC78kmOS1oH
	pwqri699/V1/eV/8TUhY/6YESqgSY4RSwR/Iq6LKaNHywRC6IlaRfyYy
X-Gm-Gg: AYBFou0bo3oN+VJLWx8k312pY7RKVYMcrR51qab2LgtbXTo4WsEL2MOpLWJiccXZ9jg
	P9EAPXPvN5d6tzOX8+O4I/W8GbYVXHs3gAm2QsJE0PN0bM1PhWtBAT2BOaO2QaTSfWxKg9+PZKO
	9VN/EShFUbkv9tMbMKy5rGZlq5lQp8wYwOvKY0DP5d3oZoTXYSjNiAljMjkBWTiGgDo40ZFtT+K
	se8ERVgGJ16Ux9IhrzOg0473uaRYiO2YELaym8vMP8rVerJjZ5QHVgqAcHSmGq8Tz1PMznEeBcu
	MzbiKwxGfJ1o2kcoIsYLd2xaMJR5Gte3fJ7mM/TWHgJ2ch11fPSSsoyw3WXh6/zRyDFcynmi5BE
	C85Z6cy/98A3UxhZtpxDfNfPYrbF3619oSJXddWAmPCeU7Si+XfhprS83Q4TIFxDk6ml6qRGGzu
	cx8Bqh3OsmDgMIaID9wF8obuFYyVKJvvEdsLVuDr7CkNcN3UaaNV4sM6EwRoJVQJ7COWraGIL6i
	1Zcc0dnao0TbLKdERgpntrlnYLDllXh7QkgWMMgifiTw1dNuPJrDJw705cpjlSWVAHgbSeDSduX
	1MyWdtjrImELV2GK3wM=
X-Received: by 2002:a05:6a20:5482:b0:3e2:b31f:b3c4 with SMTP id adf61e73a8af0-3e7bfbcbadfmr6078616637.43.1793080205882;
        Mon, 26 Oct 2026 22:50:05 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666e9sm2190321a12.15.2026.10.26.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:50:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:50:02 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: Re: [PATCH v4 06/31] ntfs: report required system file and volume
 metadata errors
Message-ID: <auA7imuJoZKDGzpa@hyunchul-PC02>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-7-liubaolin12138@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020084421.2196486-7-liubaolin12138@163.com>

> @@ -1685,23 +1718,29 @@ static int load_and_check_badclus(struct ntfs_volume *vol)
>  	size_t i;
>  	int err;
>  
> -	base_ino = ntfs_iget(sb, FILE_BadClus);
> +	base_ino = ntfs_system_iget(vol, FILE_BadClus);
>  	if (IS_ERR(base_ino))
>  		return PTR_ERR(base_ino);
>  	if (!S_ISREG(base_ino->i_mode)) {
> -		err = -EIO;
> +		err = -EFSCORRUPTED;
> +		ntfs_report_metadata_error(vol, -EFSCORRUPTED);

ntfs_report_*_metadata_error() calls seem to be repeated across serveral
functions. Would it be possible to move and call them right before
returing from the fucntion? Also, could you apply the same change to the
other patches as well?

>  		goto iput_base;
>  	}
-- 
Thanks,
Hyunchul
