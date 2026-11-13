Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584724;
	b=dYy/Vf/k4GcjBArvLqvSAzNO8A7NQLzLTqUU4gN66+2XFSCceW/fOr0b1pcbor47Np1L
	 5jN58uA9MgYzkCULehc//JcxCFPRj6AwkifGPifJduufskow7HO5lfDy8K/Q/976cUqK7
	 sl+1Sr7OuSCSKJBLdpV29snRYSK97plkNo75a7JKCsCkLEwP9NjzpBX5EpmSZNjyqNYKI
	 K9F2Aj7jXsqzFnvR4g/uCVpRVCgy1JVA+esXtt0MOsHILHVuE1E/uwgbSq8A5Tnps4g+x
	 xulJte4BVCdmCOt4jlNngygcVgLV1qpzOSaj3ffB9g3yqRDjhwVcovrBWgvJiGwN3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584724;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sVEvgRBTpmgHrQ+2UsBFe338Df8+gENhVUbZ25SzewQ=;
	b=eseeiVTsNPdnuRXwXQlLFf3ODZUmwlksUkM7FtAlQs2o5VvK+py5YDCrnRVa+LERKMuR
	 vJjWjmOzXs4UAS/Y9sA6Wo0JMMh6zknwRKMztSdMkJkmEKaldqku4xILijQ09Fqfatzja
	 DNDF7/2nIqn1390fXYVOGGpw2R6Yyoy/aKibTPv3I8RGqgIArjHJuPT4Zf9M7kdnSss4N
	 +h+lbWeNeR35uTZxOvvV3d2ICHCXSwYbEeg01/9+xKmo3oHiqLVoYquFIMLTLrZwrpMRG
	 29rz5kG47FZAIvr5n2apJOqkRBi3uj8KKY46BiNudrEimS1zxw2qX6PhgHk/8qiXdrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M4taGpaX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZxTC7yzG;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F311606A8A9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F311606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M4taGpaX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZxTC7yzG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794584723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sVEvgRBTpmgHrQ+2UsBFe338Df8+gENhVUbZ25SzewQ=;
	b=M4taGpaX9GG+sbB74rHVp70MdU932TcvD+sCPCBPGb6QhddrzIuaondayY2WBHmMmUrl05
	laO5vsIXU2VkBtlByqHxwrfP8NlDaWCIH5ZqjRderV3aHPaswSFZ35G5aT+m1x6WY0ibYw
	qxDTmCUaiurU/AEiTZcKhsIS8TfbE7A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-j-EoT4IuOQuVyt7l8U17yA-1; Fri, 13 Nov 2026 10:45:21 -0500
X-MC-Unique: j-EoT4IuOQuVyt7l8U17yA-1
X-Mimecast-MFC-AGG-ID: j-EoT4IuOQuVyt7l8U17yA_1794584720
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a211bff50bso7425415e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794584720; x=1795189520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVEvgRBTpmgHrQ+2UsBFe338Df8+gENhVUbZ25SzewQ=;
        b=ZxTC7yzGuoFs26lz/UEKw+BJQNZpg6DmLKBin/dHiDQLoB41Rn8nIO2LBM+LJsVlNT
         WDG3xviUclN7gDZuEfTfMUBHAO81/c/QiUjLfx7g7g0AvauOnsYEg0j6WWvO7A+k9R3/
         YoptDCs+CKWLF2GpAErbp8E0SAI6IH+YOpLP9RKAANwn5EYSzHF9hgOewjFm4ELRTD3h
         5wE+EvHnnbUoA2vLSbJgPOOdgZ5KnS5uYxzGEjzRbI9qLOHMEtro070PDLz+0qFmu0FK
         vcqQ1ZvrOLemkhGpPckGxtfoGQkcKOriTrreCjvKVJFbd6LW1jiBZVIrA6Vtxgj5IFsa
         2RHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584720; x=1795189520;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVEvgRBTpmgHrQ+2UsBFe338Df8+gENhVUbZ25SzewQ=;
        b=efdsN7wMVRmOk+YdeGdtgXbVD+v0GsmnYTTFFXoA+Bm3TKojaJV9QR21Tm82XxMdc/
         lqgniCIg3HsyBlv11ny1HImvddWtqLaul4CrkobJpvRKZoBZEG1MOnWFV9vLl83Nm+bh
         3ACLEPeqLhH9R7k7pqN4sDHGA/1ZJkT0aPkRXlV+qwN+nRN1J5KWIXepwa9cwzJaC0Pi
         wSbwaBN4SvIgvN2PgSdOu+TQR/1Y1sdlZ7xqEDo3cEJ7pGSlMDiabB4hK1M3llJQ9pKy
         ipOvEbYamUFARy4St/kNHwZi7IR6/nnnBUKDqCG1xipwqq4JxUaogWHMslO7V5TNbkrT
         AqsA==
X-Gm-Message-State: APuU4Z+pZ0Ofazod2MzJ/0q7CIvjr/kBqpb/TZPFNF842mG5igz84Aqq
	664Xdui838DwM4tdIF0R7z7TvO9MXG6/ZDFGjIdxxm/5F4LT2ZSZESa3lMKAx8TYoexeXAxhwpl
	tXcz03OZsBnljVylt8JlSrPNswcZYEn5T9M2aQrVRlAN8fz6m70LQbfuD1A/KUk6zBA==
X-Gm-Gg: AYBFou2vsLqnLaIzyBT9njAEPLpKVhOuC0xMqJuTL4fCp3d7P+KbgQ83Syo0MUN1Fvw
	b5huu3nYkKPMDLzv10oR/pbrEnOkOv1NcMcN4du2r6yCQj25u8GKNQDtli6C9yFmU5bOc+eiJTx
	elVuyhSXotTdF2QoUyLVIq33dZFqOv/l3uJ/qbVloYjtsdpRjVDXLQPSxfeQWrCcKmh2KPiYDAT
	cnNYbsW65q0GwC/mDtccyBSnE9Yv+LCzoF3bL2H1sFrTydC2CkfnSoV5BL43On6CVkxRMcGMbas
	Qzksp+TqfFxr+Z6CpA6Dxrs8Y4CqElEBKN3y/jgCn3Le7pSi7Xo4ZfpKWJE5pWDGbOq6xjYSNXj
	HjHonovKzQKJZ0XUxSZ1PtBaayKiL1ouMeyA6ejMKiv9U
X-Received: by 2002:a05:600c:b50:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb5c5c8255mr19327095e9.5.1794584719875;
        Fri, 13 Nov 2026 07:45:19 -0800 (PST)
X-Received: by 2002:a05:600c:b50:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb5c5c8255mr19326705e9.5.1794584719406;
        Fri, 13 Nov 2026 07:45:19 -0800 (PST)
Received: from [192.168.0.9] ([47.64.115.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm6073133f8f.43.2026.11.13.07.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:45:18 -0800 (PST)
Message-ID: <cdd71b25-9149-476b-b31f-c29b3b2896b7@redhat.com>
Date: Fri, 13 Nov 2026 16:45:17 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the asm-generic tree
To: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <avcnFxad0xS5KrZs@sirena.org.uk>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <avcnFxad0xS5KrZs@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 13.11.26 um 16:04 schrieb Mark Brown:
> Hi all,
> 
> After merging the asm-generic tree, today's linux-next build
> (arm64 kselftest) failed like this:
> 
>    CC       vdso_test_chacha
> /usr/include/asm-generic/int-ll64.h: Assembler messages:
> /usr/include/asm-generic/int-ll64.h:20: Error: unknown mnemonic `typedef' -- `typedef __signed__ char __s8'
> /usr/include/asm-generic/int-ll64.h:21: Error: unknown mnemonic `typedef' -- `typedef unsigned char __u8'
...
> /usr/lib/linux/uapi/arm64/asm/ptrace.h:280: Error: junk at end of line, first unrecognized character is `}'
> make[1]: *** [../lib.mk:230: /tmp/next/arm64_kselftest/kselftest/vDSO/vdso_test_chacha] Error 1
> 
> Caused by commit
> 
>     625b37748a148 (treewide: Stop defining __ASSEMBLY__ for assembler files)
> 
> I have used the tree from next-20261112 instead.

  Hi,

the fix is:

  https://lore.kernel.org/lkml/20261030174323.370687-1-thuth@redhat.com/

... Arnd, could you pick it up into your tree, please?

  Thanks,
   Thomas

