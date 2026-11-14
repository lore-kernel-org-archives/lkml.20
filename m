Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690314;
	b=v/GIEpDNH/eTx7e35HXKTNliqjICaV0cwa1wfiEpAlUaPmmEyKu+rJOxrf0yBaFl73Hj
	 CmyWA2gNMbx+1DrA41TdCmafhqdPsg1WilITacYBPsU0UmUtxi81LtdCmaR72GMe/mXl1
	 KKVpnXJaW/LHxWkqOVFpauGBeeaeT31cLZiE6ey8lB23q6MxSg+7jwzj16sOLlXlMiyPY
	 /oXo/96/6CZ/D566Wy5Y7qwxCDj3l5cYOofXt+D73tcHMSf1YK0w1bcXY4KKInTkeAbOh
	 Bb/Hock/SbzmDscnU+pr9jkIP4cr8aaDHOaQ41PdVVaGIxylX8x45CUrOI9hGoXc2Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=;
	b=ZUyCofFz4s41vk0PUmgF4Dpdx1pxSao/ggKfvO/17DIT5oOeiBQD+0b8v0q2X68BXB13
	 vHR9ACeFWVdUfKtcMhJagZMx19HS0bE5UWS/hobc5YnyinKtywt0SE67K+APWa7UI0GTT
	 QZyFsdmXFlB8+PqSPaFPS9X/q+Pe+ts6uVAUMICBoCu9UOE7Oh9c/oaSYs/ViHYn9n95h
	 W4Ygyn73PTFatszK544dP7Lf+N/wZv120D6h58MnMkAq2i9b2ToHYMnBm/MbpOQVEc1q9
	 DBS+zE5VNtBUn9qNkKP9SVeBMgP8pjV95larEANCRDj0cLwPky9x9XR13hg/WKVy45A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=WutE3Hvf;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7E606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C7E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=WutE3Hvf
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so2782892a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794690312; x=1795295112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=;
        b=WutE3Hvf+o5KpeEuekDBq1HgfX3m2w2ietqiBPYwTUpIweNZUp2baxaqY4m+UW2m5d
         nISJ3A3qnYC51aqskKTW6KH8msJWHqWdYyMyOfaU4ZNLk0PO0J+oNIQNR0zjGlegciqe
         BHTRluu/078htYySVPXg806BRDyd2eRoR0TPaCUBuea7yr3JXLExCNB8D6KOB2oSV7Z7
         h5RC1q8Dst3dBtxmKv1AL3M6t01Si8Zunsfvve1jlltu9/3GxAPRbiC7jMCR2J/fku40
         RQbTDCsHWn1CN7MLHj5OApYc4VSWjZO4jTAZ89dHCtGaOZlFb5eNrP/CCgIrH3IWCoMl
         CL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690312; x=1795295112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=;
        b=HjScoXhbOgAK7zLAdhUhqbM3aSPHA/wzgRQ9w2FdqyOmgNMkNfszZcQE7rECEMfrcA
         +RYxOCA6MvaNAE5Y8y8XJo8zZBHeTRkcFZ8RmGGHhfF6ndZ8hQYIAU8xqozLgPZf5/Ax
         K3naiGDrXK0er8VQ49yIaX0a397nPynY2bOhW80xnKLNRVJGqFqyTOdcdE7t/7I1Mwnv
         JnGQkKzmm3Z4zqni0tX0Ltk2kFRh4UlacJCWrOUVeT05unoXFVOWQtTuBZdmHV/zibgc
         vDuTEv8LPbVnRJD0B/lgSOxI5OGD0u969CsxmjdWRPotsjS8SQk02Kn30lRtPC4Wx6vB
         AJPA==
X-Forwarded-Encrypted: i=1; AL+hErEbmyJ9JuvvmQI+lxVBaqLnyOR/rWnuQF9DLjP6DosjBjVFYypDWwR2uGljseR5Ghxu5G+xSipzPdSqF2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9Gde3RFkXl869d13o7W/Y3okOK5Td/VzfuAcmFaMGf9765e6r
	MU4ekpDykKqu7O0kDGTG6KlJpAtK9SRtFSrotzZ7obEI6tKZyngqQ4F1roK/ku9JQxWddS9b2pH
	yOcUZ9Z1g
X-Gm-Gg: AYBFou28ZcK96IPwzjqXWYSrPzrveG07FytPYC1jHvFuAzmEk6GaBUuRqXPXRbQctlK
	sjDGEiPAdGnJ3gAg036DWDKOJyiCqeB25sHSVID6IToi/vHP0/gJVQr6J/D44cSnoo4YYuPP4Ok
	m/mO8zRE0TfP4ZhqK8b2qJRCKz+YeboSPZ4Pyfx14Ddiz/fcOq/M6U+auWbyuCa9VxGV4wTfPLq
	7vGe0t4ZtYYam4zJ0s0E3o2bvB3gL85jdeeZeekaaCfhbJyBEqdrDqqAUEsFuXlfbO8qgBko7X8
	AYNLq2RKRiK9VPZSpWWdrLwbFfeR+rWt9syRyrHjzuKuB7ZKVltzFU8eOzKsUsiYUm9arjnKlKl
	bq8vsBfHVqlyGZIGUM5UVpnUgxcDRSBgQPN8DStRn1Nrxcs6s3fPBMpPUFbBH8A9vkU/v46zpuq
	nUkYuDe9UxycLbq8xKbVuqgK1CMW3qGU3qnm13TqNfgA+i5DrFGtT0O3nemxGPw+5ojWUdYChmS
	DfuAill2Jy4hYbT8WL6lxrL5rRDsV+PyFCZNzkJ/q/Khus6+wFUMtUAacE9LYfKpRt9aul8cqX1
	jkNSrsMJFu6HkmwGVlYoXfDZ4bBRdjuMsMImyCIKc79F7pq60s8vKrYe340Ifq09itxOVUFLMXV
	C8RHjWnygjSiULa4Of2Gyj04Aq2a6GNz6bWj7VOu4l3ZxH0ChWrKfgcxxGifPdNIhSPNNvQ8Jht
	Awkv9SJtMh3ALwzRY+DPIkL1RwnR3ZAIclF0DizWi8OXQEXK07SNWkIeYbxJezqsUhUP4F2zUOw
	fP6qrTGvDdmZsLYtk0U3dmjvKPif2tEQQtc2ejlc18XAqy9E+RHYnKFnVubcrg4p4a758hgDkRg
	shLSMNqHRzykaZBX51dugh6A
X-Received: by 2002:a05:6402:448:b0:6b7:1b3b:d309 with SMTP id 4fb4d7f45d1cf-6b7c0c75058mr3870449a12.33.1794690311837;
        Sat, 14 Nov 2026 13:05:11 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c7c21sm2604649a12.19.2026.11.14.13.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:05:10 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: loic.poulain@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 14 Nov 2026 22:05:06 +0100
Message-ID: <20261114210506.787342-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 1:13 PM Loic Poulain wrote:
> > -		ret = pci_enable_msi(ar_pci->pdev);
> > -		if (ret == 0)
> > +		ret = pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_MAX + 1,
> > +					    PCI_IRQ_MSI);
>
> Why not simply using pci_alloc_irq_vectors_affinity()?

irq_calc_affinity_vectors() sizes the block by the possible CPUs: 5
vectors on the 4-CPU IPQ8074 with the firmware vector as pre_vector.
msi_setup_msi_desc() rounds that up and enables 8 in the device, so the
HTT copy engine's vector 6 has no handler: 226 interrupts in 14 s (one
run) against 36891-37590 with the hints (three runs). A calc_sets
callback allocates all 8, but group_cpus_evenly() makes at most one
group per CPU and the rest get irq_default_affinity. v2 takes the whole
block or one vector, and keeps the hints.

Julius
