Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270083;
	b=QsgC8l+x9VFicMPpAe7xHcWARox7lQMtLmWFOapJ/w3vr6CEO9R7Mg4CQfmH5JpuMgiB
	 0EIHcFRGuzg8AKLAAqGh94S0TLyFm/iL+E2GqxKjQ5aVngQCgE5pA1GpAJsctFJU1mUVc
	 XNjVqslPVXaJcITfmibYix96oWMa0CzqLM8ST16e8z48EloyEvIe3MBGr4OyuC6wcroeq
	 ZV5iB9iiKmVcm46rZOjPjYWXy4MS715a89wa3myZtUteuoEXaxT+v5TJ/sa3s6aOorqpY
	 bGt1p7PPG4kh+mZARnHNkgkrGtZzk3/oxUgg1WUXMa/a577cF+GTS3/WxzrtugJFjAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=;
	b=J5hb4gKIl0R6nrwscjMAgbbhy74kJJmHhu63Hwn27Yz45S67kK94ZuVxggS4JPpsCR3T
	 M+SIHIihIcL7cJyNCyQk3/3hIaCA9OUmaSOHlJ+qcYMjsk90ZeCOtaidDon+Qx9jNNuTO
	 siDixsg4rQDOIot1oDZOD7kJhOmB87Qlvkuo3pdqBpdGXt7xqn50wTEUO6ULfhZSKTla5
	 3TbRUxtZA8uwg2NtkfPfQrXDl0t0FNaCMdP290NfZPhQCQip+4hbszV5d6XOc6ejoyDCk
	 VAvp78R7lPGVDfMlfKCR4o5cb/dzXXpnl+vPQDZqtgr6bN0/yoVTnEaRdq86xQc/Oow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiUfxT9k;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEAC606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEAC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiUfxT9k
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so966062f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270081; x=1794874881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=;
        b=UiUfxT9kBW+iTJDzeVM8ptaT1sYqjZVGvEcPiZWBcXfMOHDQqFslE9tqGP6x2uSAx0
         R7yOCVB7tnWM0R+A9UEr/r3i4SWXe/ex7ckM3ec34wAQYy9C2csujB5N5h5O9HUE7VR2
         D7sazpMbiNp9KnTi4850QBHag6ARBKPmVoU2jT87jIEcYasinuCY5ozJfKnLg1ITxnxL
         v62oKGQTE5TwDZOONzux5te5oCnfc32pJ2Wk3N35KfEY2BalpnoWwevJu1zErIbB0qdV
         inxEFOQejYR37iBwvnLXawvDV8D1KOgL2sLgzS81ZCUlYf0UjPZMQZ/KgId1e5B7u44A
         +eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270081; x=1794874881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xA56nrFXsLTThwhE2Z1xybRqLpx3f2aoxrwJe8s5KRk=;
        b=tMSqM/5sUrhSm+MQG+poPjqJmkWcaUAjbvqN+eQZ8ufQ4jDFJQ4X/cV3DztmvbzSb1
         w+Ss7aIQASaG6GcWjk1BQw+UIZ6Svt25F+vyw+5BvqwmliNiQLnN75Rzv0zy8eJ3SszS
         7ICtVkhvHPgGAegZsuuA1WtXcFMIBELUzezx+hmgDPeakNz3wQSB6hOyWoHzhdoh7h0T
         UJNjA/usi00EO6HfocvudFYhlFom/QkqdFYhU+h1JMSeDZdFImUtomyP8RdYRGyY+SHL
         GEo+2UuS76DjbX5xAvQd6+3YMWjGxjau9aG0mqCH15yaHiN0sE8MIzDDolySRigLAL/O
         91+Q==
X-Forwarded-Encrypted: i=1; AL+hErH89q64f/a3Tvu5w+/H1SlkKtIAQOKcDlnjQwvrJNplOHatAJztnv2s2sZhDpX0E1+SJmbXINJj6q77jmU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LvLTD/K+OQ/Eee3wsdAUsrkBtu6FllwPSJxhQnX8zYFR5Y8IJ
	IMp4wxj3ln8Ir9Fr9gIvNyHSTsHnqW/q3ibUsO/rNVa5kh0E3jiGnM9O
X-Gm-Gg: AYBFou0/j9ZyKRc1C4VbXFDy1jQk9mXSvlXOs67TLpUxsHGfXDGs/qOKZuyQ1PWY7Bx
	ii9NpVfFTYZmWVBOSur+mKizyUoFkWo8vMIk9bNY447xxLN4mhjrr/EZ5/x33rdN7dC0tJ6dT15
	/ivODf8K1OD0HAw/hjg8bIE8pOEhLPq/CjdHJnfKsSrBr+FrK8v1APIba/bkevGBlRnh6uh4k1b
	R/6bS+nJzxC9CYY0dyR4zukEZ0j7bijQFZwALDUzPcQ3lcc4zjngdTpmgniGQVP64r2uVBsu6Sf
	Q6TUvpDugyyJXDxYd3/9ii82DJ73R57dzkX+0W8ak3u9ddxHwgM/EF/SAEc9r6Cl8LxLA1kjmaF
	6jBZbbhoTeJo5F7xfxqZOoBH3Xfz6b7y8uaMn9xUJV6MSbRFY8I4Eo0tfkVzrXwu7J2NfL4eigp
	xt0ARTesl11ldjlmRYK3+PG2am8aGjlQhBW8XKW8ZOtWJfaDCIHQT8Aw15UvY1H9vg6aOk75a6J
	qGnSOy5Bw0p8LZVs+gKAvVPSFultgR3vO0gyeHS+SUytZCzsifAcNc4dLFiA6Z3jcE9pQbwPb/y
	gq4GRKTCOGygYbEGjvQH4VIq9EIK+30UG8u7zSAInZMY1UKw/y+A7+Vm2sY9J8HXXjW/N6Qsxrc
	82nNPi+ax0SA9FM0TcAY2RGhooH2eXKy8UdwA7rCKEEzuyJIfsMTZ7JMC+WUVi+3gmD7MJSEYcL
	ZqUKmrOnzpyVDJbYqbEoSrSqf1zOef83pHkJIDqlb/RTI+8g==
X-Received: by 2002:adf:e001:0:10b0:48d:ee0d:8b3d with SMTP id ffacd0b85a97d-4982f594b83mr1089641f8f.28.1794270081225;
        Mon, 09 Nov 2026 16:21:21 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm1665099f8f.6.2026.11.09.16.21.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:20 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath12k: report no AFC memory region to firmware
Date: Tue, 10 Nov 2026 01:21:07 +0100
Message-ID: <20261110002108.89933-1-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <8a301454-a8b8-427a-883f-cddcf31a4879@oss.qualcomm.com>
References: <20261102200235.48973-1-gsustek@gmail.com> <20261102200235.48973-2-gsustek@gmail.com> <8a301454-a8b8-427a-883f-cddcf31a4879@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/3/2026 6:17 AM, Rameshkumar Sundaram wrote:
> What do you mean by "bus address" here? Do you mean the DMA address
> provided in chunk->paddr?

Yes, the DMA address in chunk->paddr. v3 says that.

> Also, the paragraph below makes it sound like without this change the
> firmware doesn't send the memory ready indication and the radios don't
> come up, which isn't the case. There is no visible functional issue
> being fixed here. Please update the commit message to precisely describe
> what changes with this patch.

Agreed, there is none. v3 states that the firmware comes up with or
without the change, and describes only what changes in the response:
size 0 instead of the requested size for a segment the host does not
provide.

> I'd rather move chunk->size = 0 to the default: case. That way, all
> unsupported memory region types are consistently reported with size 0.

Done in v3: one line in the default case, no AFC case and no new enum
value. I also restored the existing warning. v2 had moved it to debug
level, which hides a request the driver does not implement; that was
wrong.

Thanks for the review.

Goran
