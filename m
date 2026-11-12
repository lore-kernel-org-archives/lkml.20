Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520176;
	b=LMoHfnlmDu/FxLWvDyLyNqfPdjdRTcdLe3AFanXUBN34zPxmeWrPVCuCK1pMk/z7+rWY
	 b8ITH8o157W6Cw/Ep14vxTggXyE1Ue4c2kmZYfKz2LQoRcFJPN/Fc0RFBJNq+zZtFht9q
	 lNv7NDlqiUNAv0Btc6D9Jixqk70tB16diBWqdEb96DmUMAq61pqSO2nTbt07WSLpXBkqw
	 lPjWWHoaFqqyl0G7rIeaTnDwjdAnJfJ0LM4xAzy/JfSdi0YYSegDD2RKKnPilksGhdhYA
	 Yacmn7ro8zgLWrN6kILxu4xREFO5qog52TMNMdszkF0ieNG8VNZKtuQldgp/ZA59cKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DTrX37NnxHAmnian/0yG7KNel7p8MfKNdEYuceQs5Ao=;
	b=NvT/67URlBr/XHToC3n9j/tjSCN8cT7lcBW/4bpgfM4acrKYBma7zRiL5iDBxu96XsCQ
	 lOrg8dmrwYCU51+xEWdoQezah/ptF/okig9rFEAVqJ/I85KDl5gWZObf42VQq1rQFt3H7
	 kFNPIVxMu3dS8WaqXs6Rw9nOalDF2Fu0Hm47vPSTVfuJohF/v9B5BF/75LH8bh+ITNi/v
	 Bz+nFZZo/4IXvxZjuJljqSfo7a0MeiS9giLSLXncr7O1r4ElSe8u0YWeDXFQE8+fmWYS/
	 033gFBsV09VaxAloaJVv/pDR49c49ZO4neBNASr+EgEz7LoqhFMbN3PgeYB+M/bmqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eg1T9e71;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5890C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eg1T9e71
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso197022a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794520175; x=1795124975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTrX37NnxHAmnian/0yG7KNel7p8MfKNdEYuceQs5Ao=;
        b=eg1T9e71WacG4utbBCm8Qf+llQAYb1SH1JPe4hnvflOKIO0wu7bdFlujYFGwHu0PBs
         ossSLsq0JCdgUzaxxcPcgFCdAOjtp69sKSDsZBicRWzBez059Vjl3KC+76V2FWQf0SEE
         ucI8YCpXBLnJbGRcOKq8Vq501RjJqRoEXZCpE+d/xzsCHG31uJMarjvwaQXsWJwrKePY
         ciyubsXc8vjcstHPeBxEEwCX/gKWE5xO4+faTcOLx8Uw3SiH14yiuT3jf43zC/uLlo/v
         URgsT/kxjHE+pzaOhQsIHMHNkw5uCLcGPTxQmkC/Hr7OlVQF/KDZOdRarzPftmiE/4Xq
         kjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520175; x=1795124975;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTrX37NnxHAmnian/0yG7KNel7p8MfKNdEYuceQs5Ao=;
        b=DQyAEnM7otgawB2HHgXfXc/7OAFhvLueWZda4TfKm5lNKhxgQ/id8pCi5f5TTPjPqH
         af4/IjGQXXx0zNd/rv6lYYJ7VWxRhTRQ7M2rZjmb4cJlKKmBcamt3SaWg/nABNVCYQFo
         KyYgaXs7ubsAo+ob3JiXQVsM+EYTGbQPNNoIESjSRReXDresE/BJrD3NUe+LtNmJbCpp
         MrLbUz8Vj3q+SzPJb8bdNDtnNNXwBCvUZ0bjUsS0m4cehDpU2mh9/8KE3wO7kf1GQ+sK
         U33H8AuC1JhTcA5wErv/cvQb9RkAR8/ZoFmKsj0W6vLgvobRwvBUDwQ5w9eDbXusndS9
         +s/w==
X-Forwarded-Encrypted: i=1; AL+hErFuW2wj2Gg+z/tNNxlM5gngoX4NDv6HZDWPO2TSSEyqsHd6Aa2uEpFuPTj26wfnCoyv87V0d8b6LkGgcmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+7anJbBtlo+QEECxkG9TwtWD5tbk8rE3ahliPp+RdyNIWh61h
	lXZtnwSfniCp6W7z1twBlVaaTdKvQKJb8KSl4e2/9CfendWHUY1QnCOHnHunkMKU
X-Gm-Gg: AYBFou0u647jPJRLF0WtA+qEGWeWnGpMx4jOLNj2qGelBLBbnWJwVB04/OplDPhQ6F+
	ePzw599Ucefc84vHJ7HwjOlvNA+2CLUOMOPj5Gnqr1MqZcE2qOW1FJD7EVqgj9JxVRleCqjvn3e
	wUXuEbnAfzwKeGfG5R1pY8RXWv4G1mkuByn9AEL1NoKUnq/avJ3su9AR5zVMz9LsZZqxgzwBK07
	yMwbYbrsFDLVL4v0RgxVcuAaacjl8ByKo5Q7zF4X/Ttne01XEuL4JxFxDTkx2emhonLrPb83nTF
	GmaoYmXXdUP31csf0i0+2tsbNK5BTZg0FKzl18CzK1jAhKOQjhsIwEtvL2vlPB/HfVrBeEBkl6I
	57LhSLc+2kBO7mgqxYk1TzXoJwbtc8FRNraqUahq1oD51rLqoznEvwU85gtRC0hIBBsR+N4QbHp
	CmGPtY2Ckn5B7Ms2LnybENfwJPTQ4ihCi4Jenr7Ojt7/XWDSYkYGXv+59H6ZdKijLcsWQCrsyNe
	uuzJACayVxJQw2p4Sd1u2FbgGSsGrxxhp/gJr8Pq4Sc8lsGTm+5ogRvj92mnlWJZzLbp6rsArMb
	skjYRCvs04O82pNLyH9HCa++8OAoif3IC8AqjBhLycjIHZTqk6oQRr3LLgs1Kyt09vStJjwsYWY
	Y6MhHIk3LHukiDdEbivuLUyZdiTplGOAF73RjWDXQb12kg99m9HYmbj9nfYaziTyvXY9HGPzitk
	OXjV2L7JMI29Ct4KM2FOmBUL9ebydR4IX2YXTU9OgDWdaUJLqIzSL5R1v2CwCTCvI=
X-Received: by 2002:a05:7300:72cc:b0:376:98e7:eeae with SMTP id 5a478bee46e88-37965da98bamr689461eec.6.1794520175359;
        Thu, 12 Nov 2026 13:49:35 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm997209eec.22.2026.11.12.13.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:49:34 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: pressure: dps310: don't wait for new temperature in trigger handler
Date: Fri, 13 Nov 2026 03:19:29 +0530
Message-ID: <20261112214929.497589-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111195118.36853-1-zoone.rupert@gmail.com>
References: <20261111195118.36853-1-zoone.rupert@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 11, 2026 at 09:51:18PM +0200, Rupesh Majhi wrote:
> +	if (test_bit(DPS310_SCAN_PRESSURE, scan_mask)) {
> +		rc = dps310_read_pres_raw_locked(data);
> +		if (rc)
> +			return rc;
> +
> +		/* Waiting here would hold scans to the temperature rate */
> +		dps310_refresh_temp_locked(data);

Maybe I'm getting this wrong, but isn't there a case the new path
doesn't cover? Nothing reads a temperature at probe, so if a pressure
only buffer is enabled shortly after probe and the first pressure
result is ready before any temperature result,
dps310_refresh_temp_locked() finds TMP_RDY clear and the pressure is
compensated with temp_raw still 0.

I think the FIFO path handles this case by dps310_fifo_hold() keeping
pressure entries until fifo_temp_valid is set by the first
temperature. Would it make sense to do the same here with a flag set
when a temperature has been read, and wait for one temperature in
dps310_refresh_temp_locked() only while it's unset? That would cover
direct pressure reads and after the first sample the scans stay at the
pressure rate as your patch intends.

Thanks,
Arnav
