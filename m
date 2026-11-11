Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394671;
	b=K1ZVV8K6nTHOwpRS4Kynofio45wUtQ+DWruLsNx6Oin0BFvf49UZsFrwFjiuKOF9hUZC
	 RcfzpsImnmKOYBloFI7P9GnYPNhquGQTgpB4VXEoS1ccp49x5iAWq5fkwRr+YeQJqUKEh
	 g2QsfdxkrDIKknAiLxJdNvTT0KlAP0TX76Zjxdp2FqO1VXu/hIZEzWW/L9EMczD9IYoDj
	 dDI+6fPYvT3YNnS3cJn/B66jRthIVML7AeYAjQ3H41He7QtzmrHDVOW9vPegpiQdcWHej
	 xcOFSAktpBE/7xApqT/5DjhKBHoJ+K8pRvKQG0j9sUWiXt5JdJIibO7eSMSXqAWByxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B/JodyxslCE0s5rZbktiNiCgYyceChxk1HoTgFEpDMM=;
	b=RRXg2u/FPRScJjCRzwyf2irX3kDOPW+OxcUmfzQvEFDDZLQlpHlp5hfDffspYk/XZ0xa
	 6kJr/O8VEp2rK0U/bbf0P8GBYitVzSEt+qYAgQBzvHsXtximvnAgw1e+5iTJqnU5rxOAQ
	 xIpVhHST+U1hpDDu/oKZaSV5m7teOoeHgUovfRCBn/mdnE3K/2GtbtuiMzt0nFJm7yiTm
	 aDbk3Imr/X2FR86uBHB3EPsv6T8247EEn3MwOUAePAqp7CvXnwSagdvwAf8OnWrsVP4Vh
	 62Ybm2i/6CvFYTd4CXh87UjBH7/StmW/rmMXrQSW3ZBDorffqS+1EKuf1NCAskMEQag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVNXTubb;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A78B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A78B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVNXTubb
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so26515775e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394669; x=1794999469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/JodyxslCE0s5rZbktiNiCgYyceChxk1HoTgFEpDMM=;
        b=hVNXTubbRWSUizyaWoIgKFgbFDKSBccwRfDJSNm8qsUoysuBP8H/F2nkF4RI92wber
         di7s/6CYiBlwknrPU+mDweQFkjcTxdimhkRIl5uSVBZRuMcVbl4SN8eBhwOReHSES/Pl
         jiaRAVgF9xk0KP91UmVe68XmNvA4wy6HWzLTDcgNQWaPWDs0s2Lme/uZYy1lkqK5K4Il
         VxMkub+CfETknI9c/M1xJ99LZOIyCsVQkFIbZnArUEK9cod+T38TwP714EB22efWpFFa
         GOEY05W1C3Wkzolepw6Lc+hXLBjvJkVDNHdGpXToDmXLaWARYFWhsHYsy6F3xngHfKFQ
         9kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394669; x=1794999469;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/JodyxslCE0s5rZbktiNiCgYyceChxk1HoTgFEpDMM=;
        b=z1eKDcSAAsPdO2GeVy3MuMxN/G6zoQxC2VyCD+nssuDbSBUwgaiKjSlVRbluPH9jUg
         yr+gv4KQPIPuxKy6RIdi02eWc+3Qnve6ulSnAiFebBJZhhX4g6lal6bxMt68whA9baQ8
         Rggwj5TX/ukJ7Vy/NewhkNhucT/UJWlHp2UZURT+D5af2M5/OGNXvTZxacmcMumxwJTY
         jHxifCnTzs7UQAWWiFM0xlt3uHB/cUGqtGgyAj0ObeAM64C5KgCJt8L5dnOxk6lvNCLY
         7Zo7SiaGUBBiP9aG1D1DPfCgMRGvWTMDcOHQeGHr51P8MstHAtyhcGt2S6XTWAfgxUvy
         koog==
X-Forwarded-Encrypted: i=1; AL+hErEG5cZ/SxqP8RJVVIhAX2pr9+ufnHuKwjmi4Nuj4cXlqwztmC2XfdmMgjfFdunkOxsntmfMAfiV41XQhfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s3qeiGkW5oQJ9Q0zAHUGHx9CJbJCX3x5kck9tLEzbUKbv4L2D
	kbVao0fGHP/5r+KrHedyRBDDbxkw1+Al4wyov05OZIjGSYrLSqRCmrjTt59Emb48
X-Gm-Gg: AYBFou0XX2VC2TllXCGcMg0egFijsJXQ8lxHktaD+akN1GrFPG0KX/Pli3pqq9c1itJ
	kaHBkqQvoa2j3EfEWaUelEs1jJ1BCqon7UDkJvqlEsSCyDKjviV2A0a7Da2maoUDgHwbj9CuM4b
	1m43vU0f9O9bgz9kcW+Grf72GPGcnrw1OJ085/sI+wmJpR7H2L9tTTdPt2sJEJn1QzVhcS5xfj+
	5Dt8VIzuAbF1rXS8Su2fans6IGVJn+OKyFh1P7Q3QSpq0l8JlB/byOytsCWCCbDt9gK2L0BHPaZ
	Rwb9iHdDlblk1aYBocYAQImuqlSb3ToAzCPMPDFIwGa8Jm2G+V7z8J1CCmBcKHpKRizhnPpRCv/
	iHfTeV0exBsikDkEs4PzvxhBvBu/BC2J/waXD3/BbRZdl7F5zGliLDiciAHrLBIINB+f8195ua5
	oQw0+QLMfuucEH8fx752MKEXdL/i5EA9iAQVC3WrvLhB8FYmHHTTyYGkp/k+2RBDtUumw7LLFPJ
	7r4Sojzzv6WSzZn/yJH+weXCdjBW1XZjxNjZ80v+PNTfVOCLAeqWyZdWFjdlFweApGomW+D/eVJ
	xBOD/N9Om9LT09Sjmap0VpIeihZT8VG2pz480mDucXwghh7Xm5ROPIcU57PtnSZFB+pvlMpV3kV
	Rz0PHLV0bTXQ=
X-Received: by 2002:a05:600c:1d28:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4ba0939db75mr37798895e9.29.1794394669238;
        Wed, 11 Nov 2026 02:57:49 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950f3casm31107125e9.3.2026.11.11.02.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:57:46 -0800 (PST)
Date: Wed, 11 Nov 2026 10:57:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp fan control times before
 rounding
Message-ID: <20261111105745.5b3b6a40@pumpkin>
In-Reply-To: <20261111033954.12468-1-zhujun2@cmss.chinamobile.com>
References: <20261111033954.12468-1-zhujun2@cmss.chinamobile.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 11:39:54 +0800
Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:

> store_fan_time() accepts an unsigned long, but step_time_to_reg()
> narrows it to unsigned int and adds the rounding adjustment before
> clamping. For example, 4294967295 ms wraps and selects register 1
> instead of 255 in either mode.
> 
> Preserve the input width and clamp to the maximum duration for the
> selected mode before rounding.
> 
> Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan control")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/hwmon/nct6775-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 6e97e4f08b90..76b2c9551a1c 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -949,8 +949,9 @@ static unsigned int step_time_from_reg(u8 reg, u8 mode)
>  	return mode ? 400 * reg : 100 * reg;
>  }
>  
> -static u8 step_time_to_reg(unsigned int msec, u8 mode)
> +static u8 step_time_to_reg(unsigned long msec, u8 mode)
>  {
> +	msec = min(msec, 255UL * (mode ? 400 : 100));
>  	return clamp_val((mode ? (msec + 200) / 400 :
>  					(msec + 50) / 100), 1, 255);

Just do most of the division before doing the add:
	return clamp((msec / (mode ? 200 : 50) + 1) / 2, 1, 255);

(It should never have been clamp_val(), the correct change was 1u, 255u.
Not needed any more.)

David

>  }

