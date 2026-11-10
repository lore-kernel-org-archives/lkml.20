Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345495;
	b=3fDKrOdO65rIA6+woGcHayp8Yhw4UBSarEr2yHcrIyhwXvWHw+TfFSaANI/KePcT2sLL
	 e6r+k8LwO1iryXlHbHPOsQmFbqAeIHEmeT4gKsQAtfpUXKPIxRSp2PjG2gmvsTKaBQbY9
	 9cd87ZsazO2v3jaWsGpDB5rPSa1xJ+tN0WrvwouM3EDDFnoH5lojcRfRv52J1FsnYpmzH
	 kH3pQiXwoE9KFsoZaNnzMWu+cVXzzCwjFF/FRPX0VXLouGPXhMGyDbHHLJ85jx2pOk7EV
	 ygfaNPsroNwaDKOUhgVnJC5NBRzDQBqu2s8PM8DvLOxtmUnI0wMJunW2Ut/wz59r2nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WhS5MxHt8T8zhDgGML2bIOGXpz4OhhZ+txf4npSt+gk=;
	b=T2bnBJWNBVeXq8Pnz+V4kt2sCBThP7uaybgLLYuwVKTmG3BaKvgL2HAmZgFsuadQxQ1i
	 zPBG89T6IZpfWAkTVQx/lBzFlHlvy+KGxEtBb5oKnROmV/JCQPZcohYjZ1dpEKURkOm3D
	 NNpCEvFVs8VPTeidfhFnpXl6ORB2ipOCTUILbfwzVBJcrZuBmMSu9HrnvQW9TVKY0IY/3
	 y9UHijh8RAo++uEJ3kQtqZEIk7omLU4prD5wohVG+ga6h/Lt7KDvMWHLXEKQ2J+2V6Txl
	 EqHXloYUJ0Pe3syaQ5z+HSpGYaztPr5nvVlGYTCRhrTEA4CC4pEbgWVn3yTZzI4llpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDBs3YyS;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAC5606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDAC5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDBs3YyS
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so18854375e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794345493; x=1794950293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhS5MxHt8T8zhDgGML2bIOGXpz4OhhZ+txf4npSt+gk=;
        b=RDBs3YySmyUiRCa8rFsW1OX+nazVdAIHlsWNBr4dRsy/fueei0xcpJUxa1bPZHg8x7
         5SR5YSFm+uf6pzQyP2fwyEkwRjQ2Nmk8HQa9GGY11M1H31GpdwGBuXkCHNRBZ/e7oD0E
         Hjfx27prIwkgnNZoFOsm1j+Qy5+FRPdJXoLIh7pNqEslRQ4hZRwu5s1Op3XTbqT7uMxR
         nYvXhjwEHD8mHSXJ+sTIXB0ALOfUUIOIV+jxqvrwhL7L5mwW3HYN9Lob3H6eFllhkG7K
         NWlbgrUnEhJX4DB/I3aXdWJxTJJcGIeGdJ4/CxbHJLk6rethULCQomvYABMe08YBR1gC
         2Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345493; x=1794950293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhS5MxHt8T8zhDgGML2bIOGXpz4OhhZ+txf4npSt+gk=;
        b=bUCk70583h69w2KnIRYbSJ3XL+5JDGDHcoEl5nh9WzhHCslx/hCJuLyyYwx2LBiYYz
         uiPu9BNVw5CyP3YPplGfSC+c5xfDhC0rIqKIb91l1RHdcaRQ/DqWxO/GSQedOh4r2jD5
         dEbE4kM715OzIxmBRgPxTSvV+qC68DT4/pW4hGDA+osKn3YDFL1BcABi/ZHcS8/VA0O5
         F+Gbpm2Y+rbHikqKciDbc+RY9OmtD1kTmZa9iEICM7trwI4iGU9UgkWx9/g++5MK/dhW
         zaIGuh8hPdDbOtoDuzYdYQz+uf96Kav22sWPsTrVgJjfZ7HjaiXWll2uQ8xh8Aq1rrKn
         ANsg==
X-Forwarded-Encrypted: i=1; AL+hErHpubfw8rMJuIy4V8AiX4B/2rQBJ9iyvaw+DSUZw8cLEpmstv0deyayKQu7VFqbd3bTLfyW96qMltVSNkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v+bwL1IagWusrEuEZJOn90Wk6pD1eG7m53aU7K4rtvNr6OKFg
	6clMLjrVwNLV1wINycwj3EjVafRb6PmZ5Tvk/DslZfueuzcPr/amATZ3
X-Gm-Gg: AYBFou2VPSCn04yzTNLfujEy8cxSjbjz3akC8n72rCN+YyYHhqXqggO7SrOMkiVZQvT
	gxs/dN0VQcFUgXBytRkIUolVCwouRUQiPORKUfJ2sysI0jnmemL1sVaIN8l2YMJmKtqhF7OB7kk
	7L7Qa9kT6iynE/8vVjEnMnKFGRLaOBSt1PVGDda4rcauQ5y4Q4se+zUrWXdxdGoQclos62/mzy3
	qwBIoNBPG3/oARxbBmSMLJVQwXAiW5fyrtjR+sBIXOyi00B4G+gxCNjMn+PGg4B+8WZOk9YOIPz
	uNwpzTAb4uBuFsKEC5ZEEMCtYh4MS9R1XyfpIv68BA4vUM5KK3i4rbbnywi9jj8hvuRfFuPub+R
	nhLbXi72qlv6UegkTn6kpkSbPrTmaLOtM6GXa/zBDY3lENkEjbqkrIndrxWVe6IX95EuEdxcuos
	IErfVGhmOzyyFiVzcU8ozJk5Z/umM+XOIwqaRs1L74/Xv1rESbbwssldT2vzmc1sRycwf0xJwSp
	cdy2cFSfeOR6yrAzjhoKKv7KrY18RxK+dXtsfEmqFBPrtq67wWSXd5iL8yUkjT0rj6zhHDPuTsV
	z7C2p3PRelTXUqHO73XQEpXpgFAByjfjUUgeHc/x+uqlpZALHMg9ZzaGjFccUX+wkoo7
X-Received: by 2002:a05:600c:4455:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ba0931f006mr4996055e9.3.1794345492930;
        Tue, 10 Nov 2026 13:18:12 -0800 (PST)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm141664205e9.11.2026.11.10.13.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:18:12 -0800 (PST)
Message-ID: <f75c615e-0a92-4775-803a-8bc2aa3b4261@gmail.com>
Date: Tue, 10 Nov 2026 22:18:11 +0100
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
Subject: Re: [PATCH 0/7] spi: spi-qpic-snand: use generic code from the
 'qpic_common' module
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
 <25dfb787-27ce-4d47-a619-e9600f4f7902@sirena.org.uk>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <25dfb787-27ce-4d47-a619-e9600f4f7902@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2026. 11. 10. 19:46 keltezéssel, Mark Brown írta:
> On Mon, Nov 09, 2026 at 08:41:01PM +0100, Gabor Juhos wrote:
> 
>> base-commit: 4a8faaea975be15cb636646c0d4c6ff1c2110baa
>> change-id: 20261028-qpic-snand-use-common-functions-12b18fc7a1e5
>> prerequisite-change-id: 20260922-qpic-snand-fix-singlecw-readloc-c4c89b4369f5:v2
>> prerequisite-patch-id: 7f8a48bccb2e3c8de950bbddacfefe052cea50b8
> 
> I can't apply this to anything, please resend when it can be applied.

Sorry for the trouble, it depends on the following patch:

Link:
https://lore.kernel.org/r/20261106-qpic-snand-fix-singlecw-readloc-v2-1-18de8226fe15@gmail.com
I will resend the series once that one gets applied.

I assumed that adding the prerequisite-change-id is enough to claim the
dependency. I will state the dependencies explicitly next time.

Regards,
Gabor
