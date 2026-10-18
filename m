Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E674BF92C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339938; cv=none; b=oNeQWH45NTnxRax/LCARAVyw+0a5Ch87KYbY6/6b7wieAsuAMximrpo7zaLUrhU6xTLyjf1rxx0H+eU5ms2/NDiDLKo/jTiu+dBt7glvvpC5N1iGgdqWFcj4mB+otqa8XFCrSFao66psE4srrIa9cprLbtgl59HbyAehj3d6fWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339938; c=relaxed/simple;
	bh=Bedp92J7djf4BHeGp4UVGC+IMLX2AqP80cWakX1R9jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adHWmup3Ptw0SHLGYQHwDaJGgGmgeGZpc/C6HJCT0fcgCkTd4LCEX1vK210SNyhzLTjt+noeIxU4IzJTQlstgFKoun2tN6O8fOeBv12EiEYm+MSFcCyHvBerFJsv1cnf2Akg60SB/6PwIijJjM4rG0HxmVF06YBSpWvZ/C04oXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoDVwTIB; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoDVwTIB"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso2472101eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339935; x=1792944735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J3EhF1DKw8CxPV6m9U4i/OTrDEKxouwy4aTU3Y2MD8g=;
        b=SoDVwTIBYVvVl/V69LVQWEIHSG3YQ399Oo4dQeUG5Qu9XBdz+mQ/sc99pScCCzFq51
         vonF1GT4sWxAGwvcZaCBTanzuEdzOFQSand5lTMm8PBbDi1IjLxiu1FQJkvTq0BEdJG5
         uT195QdKFl68kx0+qKsLgrpWqvJsN++C2Su+cq6kgTOhl2JfyRWJ7W7Q+iAJoWIA4QEv
         UHEbL/D/jsRtHr/rk0umElQmMCXH1ikTWbCl4ALSbaF+Wn/lURWSc5Irqf7iBvSBZ7cD
         mbCDRJnnkcQgPC6Lpnj2hBvVL2OQz2daWd5QuFYnbsaWwXk0INnjFvgElx45v8EvV4nF
         o6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339935; x=1792944735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3EhF1DKw8CxPV6m9U4i/OTrDEKxouwy4aTU3Y2MD8g=;
        b=Xv4v29tqN+MSklHXJA2dXKuVf9DSIz8Mtj5dtrnmRBYS9dbGCKZEMgFvGMt6fYaTmF
         b7CTZ+9u2R50uOz/ccV2+PjNOnjl6jWc7L0wDEXS87m3CJoK2dFH8lXWuIP+UDjc+8Sl
         B89M0dbjfzIQ/f6wYs/ZiJ9RrRaVCWHhINatvBjRb+rpfQioAv5gQgvfgD29kFFwTAIq
         p81t7QAwtVq49DivnvQEwlp9g/KXukzJkxyzDsFA6dqMiMGF90qTdL8MRfstLovL/0PI
         +qIXtep7vc64KxqKk9pfP29mOTFzyyr9bKC1sH+olf5+3IoG/Gld9zbH6xD9+UlBxW4/
         aYkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+mrH4FZbrgBe4ugIq/53+mZHybOBU5jcb3QqJQONCFYEVuRl0THOGSBiInbMz9oepyXIOy+X12M+X8Ug=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbwwUirZRWx8QSDXLnVE5koD9rAb/iGH8unmaoD+QZOeEDp9u5
	erspKa0yq+ZZYnVrXKsQOKVXuw79blTLCyGaXS0bGVaLZWfupkc8vubc
X-Gm-Gg: AYBFou1biM3oTnv72eKsTCMQwdoQmdv3JxT2lQeuT4olXb41CvaoH5a8RZ57Y7vdMvu
	7O6acbaJIXEaJHY3YRtL3FjFAztU0XBoQUVGYn/H3I+wfBn8zKLchMbhcaW/xy1pf6eZ45RkYRH
	Ex9+WdLRGsJ2V/+He2BycekfVkXjCUw+5niD0O4h9H2hTQwxsNHteLl9tsiRFcZ27wHXjcrCned
	gVOZ1LfTrStfj62AhXTyoEX7D9JWjQcJK1P5cStxE+I2hU0wj6/vJJjoQsTEWrPZw26dindBzR/
	bdgNKihr3VS36ROsQL1MS6A6he+N8hfEN6Uegdotb8Pl7crxZANcWa31Kp3TfSyCJHw568vqxzZ
	1JLBEx6eAskKvddT3DFr8uYHgHdATFpdurbRRS89dAKVZUqY3CXkSjOpZG2hGjNbAIA5jBmpLuz
	hfwx7jvtcXnW3lAC8sS1iUT8xv3j1ss1n+iNXnqXS/M2RvS9T5ETRht8L6uOEe/MC9Ldk01ifkn
	454CJgewe4i7zjjbddqABg=
X-Received: by 2002:a05:701b:4192:20b0:151:2e62:fe4b with SMTP id a92af1059eb24-1851238aec0mr8135496c88.23.1792339935008;
        Sun, 18 Oct 2026 09:12:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm22120432c88.18.2026.10.18.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:12:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:12:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (sht4x) Reject incomplete heater command transfers
Message-ID: <e5db3839-d70c-4d83-9003-60242c123475@roeck-us.net>
References: <20261017205234.1084949-1-pocj8ur4in@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017205234.1084949-1-pocj8ur4in@gmail.com>

On Sun, Oct 18, 2026 at 05:52:34AM +0900, Baek Kyu, Kim wrote:
> heater_enable_store() treats a zero return from i2c_master_send() as
> success. It updates the heater state and returns count, so another
> attempt to enable the heater fails with -EBUSY.
> 
> i2c-virtio can return zero when the first message fails. Require
> SHT4X_CMD_LEN before updating the heater state, as sht4x_probe()
> already does for the reset command.
> 
> Fixes: 0eed6fc3d2b9 ("hwmon: (sht4x): add heater support")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Applied.

Thanks,
Guenter
