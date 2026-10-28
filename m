Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195016;
	b=qAO3dH58GiQZjBGKZOStcCYHvjNWgfRPT/7n9yTxg7Tx6U7LcEVCTIQrvQEG9d4+y6sB
	 JuxjEzS7DhFwyl8c4sDtWkhjGTLDKW6f2eAvw6tesVy3Ixh4xQkLDVHDMKKXm96Bm7i0w
	 aIgfPiSrKOMLa/eWPc/0IT295+f+jY7KUbzFW0djAKghBl0lsF1e7Rzsfw5Ca69evQXU1
	 D+e4PseKW3IexEbre+IH+ZvYoMaZjle4Y6pe/p73iCpSG4WNCnTJbV15HyJSTo442NnK1
	 MiXBa2URvF1K4gUZqjuqkF7wz7znh2yier7JPY5cxNaf0DUN3AkAohGCDV1Rg7g6Wgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=6Gj9UHjLoMrPL2uz849IcayELirXOaA9Tos3l7jEBBQ=;
	b=xDdKomRjV9vPFYZM1Nt5KzNEgQAMgBiMvtkkC0EFKelirm42mm3/4qHqgqd3hFbQcYaS
	 2LoskpjlROF9vNxcPDGusYX5au4aOrAAafJNFPXzDWY9knR/TrDmStHRL+HsLWm2onxnz
	 h/NlpK5LfilE5sZesXf3zTnP+Qy2QEd65JiXHJ2ygqjoUqOoBz7+PoyToiMUSj73FVW+C
	 6h0WlxLzbgcj0p+61/DKrXqRl+1QIeQGm+JRy95qMOUzu+P6dYc49zHUBpyhDqnavvLG3
	 tyd8bb+Gzfkn4ecG3jAjQC9w1/dowk2Ppd2zNTZS/IOx6T0BtSMY94TE9Dyt+X9LjQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HVVEhi73;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59ED606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B59ED606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HVVEhi73
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f30660e69so70781185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793195015; x=1793799815; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Gj9UHjLoMrPL2uz849IcayELirXOaA9Tos3l7jEBBQ=;
        b=HVVEhi73Zw+0mogbFKg3aDGWs54ZNII4WAy8ievCls5hptFQ4pnBZSHRye+LIGmiFW
         Qbzp4V+0JHM7wHVgsogIEiuQvur3QHaIXzzJEc1T2VDZA58obWj8wsqMD2qGVPdf3JLS
         7PP9Fiyxk/HtZLX67/3kgap35UeW3d9gr+SCA/a8hISUfaDZ82tmWwZwPhcqjJ0ZVpRa
         l0Fa/gUTAYpoJATCiGnWRIKvQacWYmAyG/qZ4ha4BEYHoPusft4vGugLqwdG9vKgfmxt
         yJxcmZm7U30EQknUKcWXPRpDFAyzj3nmbrIfxT4jVuTZnT8eVsOWaoVIdMFt/Boteo+1
         tx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195015; x=1793799815;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Gj9UHjLoMrPL2uz849IcayELirXOaA9Tos3l7jEBBQ=;
        b=lE3QZ6IDyTXbExPvj7CUAnnuz2eWBszuVayvTwXA/wPmhiDJv5PmTyP9y0+N2s+Kje
         st1BjcYlk8SBAhvYUaZWMKHBcYWkM6Yp/+SJcQjJCL5OItUmCuNkOuYgK+tnYrXGV/hP
         dbKNSwWeOljmRZwi3bvKNLJKCJMlyqAd9FEy3p8ps35+I35Frx9xJPk0bWkMYXBATITH
         j/XfEfWbUeq66Zy2qe8aH80+uPOSxq/ge7kzVVX1A9ZnvMd9ddzYhRMdU67HTscoc6Va
         KhQ+n8R3wPH1ziJCE+vNa7tBvYEecf7ANVuiBOdMEED7Gg56N5Kv1ElrcXq/jMmYqmbN
         3rjg==
X-Forwarded-Encrypted: i=1; AKwUvBxa+3jMsOHmVn5LZ+MBzxorBuGigfgw6XA+j6nnOwZ1bzAHEG2hv5ez0hSAKMrUnwU8kFJIjASP+hd/GQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6z8yOEBqymAC7bmzu28cRX335eGjm3dos6ZfqmgwXV2zvGdOS
	w/ZhtLHScdGG7jGaSQUJcftvqjzlYQjRemJrBp95Jn0kezaNAIxGX6ErxT0F9rDLbYM=
X-Gm-Gg: AYBFou3FSpQsf8NYF30lMWQ61NRYonMMbtJ6cRCTEGttRKVMjMeM/o1nzYTPF/2lttQ
	yD2HT5RXrx546LS/LCgS2b7Xako98QLUP6CWu4adwth2lMeYKF/Anr5T9/SxNvG2h2JYqg7Ffs6
	NLFKOjp4+Vi26pqXafSb+jjsFTSFWij2nkawxho2iRRCoOuuAc6F7Cmo9tzkl61ao5o18kl/U4o
	HzH6KlqJ6KRcxfowoJjhCwuqKjtUhkq+wPHdR+DDtT2M/apK7oIXiEBuYofMc9K8Tq6cK8pvgcs
	Y54117zNP4EEKDMgdfhek5o2HhVZ0Q+IJGqnv7eyzDqci6ELuyqdP1l+5pXoeIJJyyT1sk1zXRP
	Nm2GQWVi8jBWJYPpV9ZEU09mw/ll5ceg/HHDikShG6IU/0OVdt0WZHnpiqA/zrDKsV4Vez/QCuT
	v8dWKnU54X+dRwXnJ7vLcUpdYJuAcpmHAFTocmbpcE/kW5ACI7kpbSBuSNJMvBus0bcWZStR4l4
	FTi+EeAPY1SWuKm7HPUFNjUi67R5TBn2ng71GDHHnJUZlvvvHglJXWgbmh1xKt1gOQ2MT3KAglM
	enGAeUNmKiG+Tl5aJDOJo0CdW0Iavsi6KowR0FC6f/Exp6HkNCcUMpHPm1n6v4oK3d0vUKpgGsm
	Z
X-Received: by 2002:a05:620a:4044:b0:940:f53d:5eb with SMTP id af79cd13be357-94408ccad65mr342537085a.35.1793195014674;
        Wed, 28 Oct 2026 06:43:34 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6bff7sm131382856d6.5.2026.10.28.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:43:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/7] selftests/mm: add MADV_COLD and MADV_PAGEOUT
 contract tests
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, shuah@kernel.org
In-Reply-To: <726ac203-7ee1-41d1-a9f3-7322c7528971@arm.com>
References: <20261019171206.3331374-1-gourry@gourry.net>
 <20261019171206.3331374-2-gourry@gourry.net>
 <726ac203-7ee1-41d1-a9f3-7322c7528971@arm.com>
Date: Wed, 28 Oct 2026 09:43:33 -0400
Message-Id: <179319501336.2032926.1556159871121015337.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 16:52 +0530, Sarthak Sharma wrote:
> 
> > v3: Dropped Sarthak's Reviewed-by from v2 1/8 and 2/8, which are folded
> > here, since this patch now adds main() with the CPU pinning and the
> > one-time reclaim check, and the swapped-page tests fail rather than skip.
> Thanks for changing the name of the selftest. Adding the swap check once
> in main() also looks good.
> 
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> 

Thank you for the reviews!

-- 
~Gregory

