Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440893;
	b=wr6D2D5kFK4UauEZnu/iRS5+BkwfboEdrJ/4YK3cYVnNgXvc2QcW8nta+HlQ7HeU95VX
	 fWYgsuu/LFl3XUY5CBd81kp3WJtth5i4CS17WDwciDXmsdwXRnc0pnp+ew2DeK9+HT/W4
	 L9hwUkL9l6okqRaKngsrHXhF7FLZdKg+EzC6BAt6KavGe08zBY/CRFevBZSYmP15s7My1
	 2gvB5u2txKeUOCtr92Gxlc57nhdB1T336WCFD6/VMX15oX9RwIHtZozmbI7JRT/jV1qYr
	 jjXahLvwsIc4Scra0XZsv1wOSUeMHbWyI93h5FKTew4H3CvCcJcxw32ldvC/ikwVAjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oQVCaAkV0nUoaKSyLg9GT6qsRWzMjYulUhdrI76TIPE=;
	b=YrPyHA9Oc02OZ0t2n2gqvgl3xx1A9/08L5HRennebDyJ6MjwvbXYELbOSQ+GKuyEjt5O
	 pWBH7w1SlZxJYTe3QZ8c+xMfqgCE/Tel7KWXII1O357AJUNQBvEBtJv6/Jj27yOdY4HPL
	 xe4ca1NjOOXOKwavdFLZxqPNEX6Sv9ZkvxjVwRQDwQ2zZHHnBXH46PH8Qfk+nAWxGgK1/
	 asgwWaaLElMGxCu1HOxWgc6hiQwzMRh5bf7kvjMSMuwrKD26M4iZNsnB+jgh+y0HAUduS
	 ttzFyllELaXznhRCO2mES70YgwVmB3Aqehih4S2Soo1u7AJPmRF1unbnzR8GpjfNsuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Anweqe5Z;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EACF606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EACF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Anweqe5Z
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6166692eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440892; x=1793045692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oQVCaAkV0nUoaKSyLg9GT6qsRWzMjYulUhdrI76TIPE=;
        b=Anweqe5ZTFkrYcclK/KD56rcmqDnRT1+BXJo18LRYRypG9cNMzYyc/Y0yUKU3JCHj2
         raYJlpr6JDij4x/T/Ada/UrEbGoc2AU3qZXdc3h9Qt0tk2D6XKkIDZv6ETmv6wi6Q7D/
         w+Z5MvE8PSOo/j9egOQYkKb8qLc9c8vfglXXCPuUtFUiaGQCSSK9EV/lNy4yKJZZ3ZlH
         1GZLlTB/txEhTJ0R19xypm9vPa2oowaFCN++qPGZtt+Sr8Qvn0giI5LzNB7jPhD9ElNI
         EpuBsJYVDppcNPvZ4uDA+EWpDG8UQwdg3pl/FdalCDz96kgvotBpaTFWNsWqVstRuYCY
         IeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440892; x=1793045692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQVCaAkV0nUoaKSyLg9GT6qsRWzMjYulUhdrI76TIPE=;
        b=U1zYocMBCuzlHqa2m83byk9XQLTYzSUjYyEaf7T+Q8oQwZlULpMwv+iCI3ghtpAO54
         eam+OqZ7M6tviamzh9DBFe/Xq0R0Ab9RdjNUEto9wAHer0jGCPJ1x7aqnUmkLFlHzoyM
         y6wi9uU+ixCIRDpMZayQTwQEFQLv8/HThNzoIEI5p5t0MX86zc8xxbvoMchu79M7PM8I
         YHkbD7o+d9hIcv6umH75nL0bgdPv7LysX6/nQjjgm155wM8JZU9F5rWDhzV+b4876Hai
         5RiWd45UGE5grRWn7fmw8W2970jFUKTknkFqQchFFm7AcHHBHQS5jayFlj4AseNpISA4
         ugtg==
X-Forwarded-Encrypted: i=1; AKwUvBzUOEBpuwpk/6RGG7JrqMuXwSpv4Zv6yOvSnLduN2kAiq6YgKYjAkw8Bi4NqlqnfYBlsAuBCHvk8oOoSVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfxY70e8X0moQBVsCshf2VR6VE1+QRKfAfoDyTdclcMGMM1Zl5
	RifljlrGBw3XlksKd1T29ozSyjMhj1EYpoIouby8g8NDKwr/U8vJcf2Q
X-Gm-Gg: AYBFou2gWA+yBtVq6McdnuhhikmF91d9tUrN0Df6GTOw5Cfj1JdRJR3fCgfIR7IcO4g
	KEL8sBisuwOH7+WGP7Zu1/7cyU6/j8Y0UpitHXnXikbywjevWVln5A7t70smVPbh0ggA9va6H2S
	RBEhQ/qyE84ZujvBM0CxvBey7IjK03p00lNZVVDKBM+o9dfQ6+UHLRjasM96Xfuz2AppXqgfwZD
	KzFCJVna0GVS1wZajjpB6lcXUW31lvKfpbgJRqhsHr0d3vaxf7UyKXbCC+KUx6Oy0NmffAgMl9V
	FJrq/iEye+ZwEI4Pv4Ezor5sAxninErY2e/mBSbuGevQeNW0f2H/vxw4Oht6za1AXUFQBcKvRvs
	h7brTaoBEP2PhMUZzEb+mFpm2bizaYGCVO9E6iIyja2XByhb3jGfAhkJtaHGwiMqL14ksz5cSdA
	fnis5jxTrnVeDOIFU19rO5YRPQqeuxFo/oQvyrJaUo0FoulvZXtiyKdciZY8qgQJXtSNqd8jWdy
	bawjjPud+EO
X-Received: by 2002:a05:7301:1888:b0:351:595f:a941 with SMTP id 5a478bee46e88-361a166778fmr10951992eec.8.1792440892146;
        Mon, 19 Oct 2026 13:14:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm36150114eec.8.2026.10.19.13.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:14:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 13:14:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (sht3x) Return the consumed count for heater
 writes
Message-ID: <2092a948-c425-4ed6-bc21-efe572498358@roeck-us.net>
References: <20261019154718.2328055-1-pocj8ur4in@gmail.com>
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
In-Reply-To: <20261019154718.2328055-1-pocj8ur4in@gmail.com>

On Tue, Oct 20, 2026 at 12:47:18AM +0900, Baek Kyu, Kim wrote:
> heater_enable_store() returns the result of i2c_master_send(), which is
> the two-byte command length on success rather than the sysfs input
> count. This can report more bytes than were supplied, or a partial write
> for a fully processed input. For example, writing "on\n" returns two
> instead of three, so a caller retrying the remaining newline gets
> -EINVAL even though the heater command succeeded. Retrying the remainder
> of "off\n" can also send the heater-off command twice.
> 
> Return count after a complete command transfer. Preserve negative I2C
> errors and return -EIO for nonnegative incomplete transfers, so a
> zero-message transfer is not reported as a successful zero-byte write.
> Keep the existing boolean parsing, command selection and locking.
> 
> Fixes: 50c22cd154e5 ("hwmon: (sht3x) add humidity heater element control")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Applied.

Thanks,
Guenter
