Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809993;
	b=ctCVa+g/+kakAqid9O7/4ZyvW8FpZvJTK8OuV4JnNq7NIXTlXDlN/bfCOfe3f60m7i4e
	 bJLJNgmc/QWuQb9JtcSFXrv1jnfJTWbVs/kBziywNs6IyA2SPicQ5eFG7vu3KI91cc9T0
	 e5RFc1GwiponWZQom30dIeQZrZCfoX4etoHW1pC6N6wIhmffMtpzNBnWlA39lL+Ty4PxH
	 q4+XSXeit522O47h5MhYSUnrLeZqloORhSGNYgO3DJROTfLgUVYt4wxr/67zkEzh/O/Gv
	 C51UklMd/ehtpOWn7DkTW4X6RNZ+uccd8IXjmLhkQzgdhEsZpaEQ+iBrs7TpIRFBatw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WUuEMcW2y0Pk1LSyzuy5CzYSgNsbEsC5pDpoND1JIlI=;
	b=qdmje1n5nXrwDuPhprnAdnQZbf5PjUgGgb76Ak1ebR1H5EKTGe2kgiEIq0Q7NOsNYVhL
	 +uHnKB30+aaBPX6z0X3e21FTggazTiKx8YDICBcTCVfMrejBrGrWlSB7Eg7SfGD/Y4svc
	 xmlnJKCfEX3DG5KCKIwt3ZA8mC8PtR+IguAi5xf4+w5ZMiRTeMuw4zQzCfqR4ZCBGy1Nm
	 y+7HR3PMVQuYW8XQ/cZO9AjPCiTZ3ZLyq8OGcL3+RH0waaT5GouvrimcRI0josnpUOOUw
	 E5pH+vfK5K9r6kfIulGy9IK83JUeZaoyQrqQrTL/s5MK3/9OxZnaVkKJefpmw95wQPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fsRCd8bw;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA84606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA84606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fsRCd8bw
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd697a57d7eso315305a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793809992; x=1794414792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUuEMcW2y0Pk1LSyzuy5CzYSgNsbEsC5pDpoND1JIlI=;
        b=fsRCd8bw1VaW/FUdm/x5df/xZRxMEuPhoQfa4aceQ5hTpY2tLfKPRvrkw6NnJ3E7T2
         pg1y6766lH0bbeB2956Pil7wCQzy8WJFRTd+sW3e0yFQUxRp/4pSyMu1ZTMeud1eJkg4
         sURn4xaS0qewmdL3Gjw30AQYO45iU49ttRPe0ARjCZuirjTDeL6vzWALtqYX1agqbnVP
         A0ctlZ5JBWCS4/jLNl+cttzqyA0Ijx6x9q+aePujoKXpCwDbbR3aRvEYPfgnSsOdoCLb
         rxvW3Vs2qPcnxbd8hOFTNMHBgOpgdRvpjrZBxvv7KwpVL0KV0RFtnUWmz073kklfnRWw
         7flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809992; x=1794414792;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WUuEMcW2y0Pk1LSyzuy5CzYSgNsbEsC5pDpoND1JIlI=;
        b=LGXqwteQmPAgeRm4CjW0HcPZFK3S7m5mrXbAnIAhoKhHiHNSbwHs1sfzaEYQX4hYPE
         T8T/Jc6sHUNC5Ci88Mv/B5tWph6q7HskxomhN2Y03tu571F8cL8uIc+xJvEcwR9HmF1J
         PYNwZNutwwGMozOanxpIy1dr/nBkMyP9oOyhNBUKTAz/ad+Zd0rvlfEShX9rbDEvNcod
         1QswruRYxQXiEXGhYqgjfhygMQE9juH7UdEbIgYKO1dHWWcF4lA8jDmALnGQ1a8VaSOf
         gaAqS9o05UrBKH6Eqd/n9PBpvy65b2BtCm/WRCx2XXO9NZsvq/6TZOzdvY3s79U9q8wk
         SQCQ==
X-Forwarded-Encrypted: i=1; AKwUvBywZ+5alchmIj5yMoPanfOEOGZjALOPVzc+DOMlvZoQOcppMqJZHDFTSGVE/QREf6IQTbiJodsHp6LDszU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jKNz2trZHYVycaNH3HLkC0rBvIJQb1qu0g3ZvnLhu9xnKpPsU
	xc75OJUCQTiQ/eLx+1Rvn8vj7Yi8ky8n7Mq1N/RpDNabM3m8vXjPTart
X-Gm-Gg: AYBFou2fGpn4Izk7DoaSAsYN6RUkMJKTPn9l7y7iV5XJpEGNFAAViGrqjA1zP+lzeOe
	04hS+CDrHeSoVb3p8G8eFqI4slYLlpCaYsfic52jWHLaqaiP0sapknRL8iqsm1zn2+LfvR5y8QE
	pM6RBdkPHK/2LAnmINLDDXJJZecFgg1UkayfckWHn9OWbBovq7hCgE5o2tkFLS2z2VAGLBa++l5
	MPxx4Ni1wS/ztwQ0oZ5U6Ur8UcP24YV2OLSNU9mOOmWPyXogVYlAFNDtQnk8SlsDk5GimlU0WVg
	it7MtNeNH8z2LkAMYXtTse/pK+r4S6a6eqPF65qyOqtUbxWtbHzMlh+ZY8jHD+q3n0C5a1QQlN8
	mE6gDpiUSeYHy2++OEuBJPElodeW5IFMTA4AW8inIynYyW3s4GHHOHtVCEbPp61wd1ETiKx2ZOd
	FxbdK5OzsQkL+MK1s4EaFUS4P9nc1vmQtODl/px9MYJ5ZxM0TQcIWbMEl/BSKT3eVKT/a58kMkd
	88X6tDQXHueSmdyD2SMCvl6NaFAI2BAOFz8sbikeaeCCU2b8WKObdnMIJyVjfvfKtwQM13VxKIV
	HzjVotcQhdH0MbY6oreJ2aTBWSQTNhHeH8l5uHOc11gPdI1D8dgzaIE=
X-Received: by 2002:a05:6a00:3d43:b0:8a0:3685:239d with SMTP id d2e1a72fcca58-8a9b9a4ecfamr13116937b3a.1.1793809991595;
        Wed, 04 Nov 2026 08:33:11 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b1209b473dsm912606b3a.36.2026.11.04.08.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:33:11 -0800 (PST)
Date: Thu, 5 Nov 2026 00:33:05 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, kees@kernel.org, 
	justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] Input: mouse: vsxxxaa: Replace strlcat() with strscpy()
Message-ID: <ttauzj6h5b46f7o72f2irfwsr5vv6zcqtfme5qyery6wtg3eb4@u7iszy34j32k>
Mail-Followup-To: Mariia Nikitash <nikitash.mariiaw@gmail.com>, 
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, morbo@google.com
References: <20261104062319.288360-1-nikitash.mariiaw@gmail.com>
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
In-Reply-To: <20261104062319.288360-1-nikitash.mariiaw@gmail.com>

On Tue, Nov 03, 2026 at 10:23:18PM -0800, Mariia Nikitash wrote:
> In preparation for removing the deprecated strlcat() API[1], use
> strscpy() to initialize the mouse device name.
> 
> The destination is zero-initialized, and the constant string fits
> within the buffer. Since the return value is unused, this preserves
> the existing behavior.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>

Reviewed-by: Shihuang Liu <shlomojune6@gmail.com>
