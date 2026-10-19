Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434850;
	b=tpSJENk2PqiAnGckqGFk/i224LyyW6iZcQsCh5oD/QSwSTv3v/932RSH1Mcn5WnpuuDn
	 a9mA5C3LP8lTYHYycVATN3+aVXhm8qSDgurQ9/EKsJ4BEPPnsNf81lDfUriKUgyaRF4BK
	 jT8kZuoeDAJ8+HP6qshe00V/y22UDidMmeunipDqy1sFmsdmUccvdTgRFQommwMSQmJ53
	 xV/rGrGEU5cSdFpTOUHx85eYL4fWIq/KuccHDWJVTjxKhtTNfsj46RaJDMGTA0Ij8P6IA
	 k0w2HjqX7DZTWn4EUJpn9aW+WmUB2iKswToGMDF4/VIV5ftIHdYVrfkNCXe2uyE3Egw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=VOD5WV6JaRXrgzqNWUFEhdhLw9KZTPaqTGo8V7P+ZtU=;
	b=mGBYTS/rO8VwNc5TCaJS2PSSoavgwazyUYPzEndLk/nKMrqI4m44UGqg6falKY8PbKrE
	 FcMg/IDMMCG0IEKyoM1oO9CsP5Tt+A2LG6L7O8UwRzD6pKo9z6BA+jl0lox/Eootx8U7D
	 AQa7FpL4x3jTZdMmlMNm4FhHwdReEn/P3wQQ68ygfnP5kHzBLhZljoXnJFd9AmLs2r5Tl
	 xBBkR3LShSSrYCzMaaqbTO6yjYGSy6kAm64V3FCumxxuwiTTGJ8/+Hyqi/wSfO/64b2kU
	 wA2+2Hc17PJB1M1QZ6FYv2oMVl2PgLTmEpRmJyBQzFP2snvToprISNJwETzOS9vMo8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=adrianschlegel.com;
	spf=none smtp.mailfrom=adrianschlegel.com;
	dkim=pass header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="hG/nB1t/";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5370606A321
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5370606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=hG/nB1t/
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so136845e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianschlegel-com.20251104.gappssmtp.com; s=20251104; t=1792434848; x=1793039648; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VOD5WV6JaRXrgzqNWUFEhdhLw9KZTPaqTGo8V7P+ZtU=;
        b=hG/nB1t/LCdP73RiVqbj/yEJ+CCZpJrJ8H0jRdeEe8J2nf4dozVEjGkosf8BFMHa2n
         Crlx33chm3oolEpgiI5j5iwKl4WRpZcvDDIw3p2Uug4VOx2AZ1x68v9TSl94c3eB6wtn
         stzSmYntl7/E9FTYqzX7pUrnnnYiHONoiqz93nty8CjUFTr6Rvo74wyI1rKJXCNRo1kv
         u1Idx07K5l9Prge0+jKZMYsnjhklEFmMEPGKtr8MCincbz3J/rpsKbDesUik5QlxTcv9
         p3hmOUIcfmYEKNXhQUmLyJpP/Ry5ibioq/D5RVT2yqNm9R0E7aVDZhoKJSXOiGX3zvDM
         o0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434848; x=1793039648;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOD5WV6JaRXrgzqNWUFEhdhLw9KZTPaqTGo8V7P+ZtU=;
        b=KybX225J7UqHbFuM2+kQd95FyrlZW9IJOYN2X0IkxCk4CXX7DJXZTAF4JzBHggCNrx
         7ZvzZU5ZKBSoIRiU0/Uka82zG73ArPWG8vsHYKS6utx9lBHNT4OtKv0KFBs6jVKzQqjP
         6OCP05kIsGrJtFxZX0CHc7mrI8M1o06SEDHuf5N94uFM0Bb62vm2jSkuH5+x48OZbNpm
         W+upp/CEwK2Qcxo9hmr4NalDr/Rz1wovXxZGy3K3Ff4MLeixAz9camkoaAwjGf7bNaXC
         zIIwk8DTsEjrC5aNe9ewjj10ZfEumacefMNDlwJkgezRefzdOiO4Z9c8aM1DLahdTR19
         aOSw==
X-Forwarded-Encrypted: i=1; AKwUvBx+8s+3NMFfRhSPWYTltmVjJKpwZfe4nePJA+gatMo1rKgpVSbL5HlOQyyooAyD5DhB8wFK5Y6R4VLdtIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQAtHYU59e7ksZf1ytYhmIkqUmrE2Ps4YHhz8OFbgsL0PThlGq
	g/3lBeninhonqMybwOLLpU6CLpJq4F6P3utqag0dwJC76i2cM3asYYD8ex02Z6EQ6km0fSErrT2
	89GXd7MjZ
X-Gm-Gg: AYBFou0ViqlEdvDhy//6d6cuMOKLh4FxqJRSkSJnVyyfgGraSn5beHEscfPvkO5LBUn
	X0FPjBodvL4zXxOzfRds3SXE18QupDqVM/d3s5UZZlnYDW8sjgg0YF/us0F0bVFKDq7XWdH/H3l
	SK1qhfVoQl32Tt5O9CuzEGsgUlFLG+1WBLi0yVcbNaK/04bAvDTGuzhhaY9aEKJky+dVjIUcCHy
	kn5H/wzYAN/x1IlJ7jD6iLRAm4X5fygZxOqUuHWt8zRuWGdq9IpP9LDlgRflIwT7sKgjImPyNG5
	nwbGtI+g8oSlOOZCc9el8lQGKs5BsnFVRNAhyrHHMaVpRLCgqtldgFuBCbYsMLgRTP7SFW7b4WQ
	8D+CBoLSZ1Y9cBzIC7qN2x3SY9KLSBHvkt4Lo59LRXlYSYfMtjlamz/tu6lgiuhD8JzawfUtjmr
	WVchkpJEQoQ2dic27G30E+TRNRVUTcpYZPsHYrNy5Etp6V/bFT979ol/D2c1b/J0fQESmFJiR97
	uqXw36FoNTWrpkzsNx8sq3Md17bpNkko50CeLtqeUlJfETPEjgBrCzsajMPJ3hxXb84tTdeqX7m
	/tNF524DVbpE
X-Received: by 2002:a05:600c:e549:20b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a1d7624601mr112174505e9.26.1792434847726;
        Mon, 19 Oct 2026 11:34:07 -0700 (PDT)
Received: from localhost (2001-67c-10ec-2886-8000--14b7.net6.ethz.ch. [2001:67c:10ec:2886:8000::14b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3597sm10959075e9.2.2026.10.19.11.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:34:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 20:34:06 +0200
Message-Id: <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <x86@kernel.org>,
 <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <sohil.mehta@intel.com>
Subject: Re: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as
 memory errors
From: "Adrian Schlegel" <me@adrianschlegel.com>
To: "Yazen Ghannam" <yazen.ghannam@amd.com>, "Adrian Schlegel"
 <me@adrianschlegel.com>
X-Mailer: aerc 0.22.0
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
 <20261019153207.GA144824@yaz-khff2.amd.com>
In-Reply-To: <20261019153207.GA144824@yaz-khff2.amd.com>

On Mon Oct 19, 2026 at 5:32 PM CEST, Yazen Ghannam wrote:
> The SDM also mentions "Extended Memory Errors". I guess these were left
> out before, but should they be included?

I don't think so, since from what I can tell from the Intel SDM (Memory
Controller and Extended Memory Errors), extended memory errors use the
same encoding as normal memory errors, but report errors in memory that
is used as a cache, similar to what cache hierarchy errors do.

I also found this thread, where Tony made the same point:
https://lore.kernel.org/all/SJ1PR11MB60831E048B544C83E845D907FC8DA@SJ1PR11M=
B6083.namprd11.prod.outlook.com/

Best,
Adrian

