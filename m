Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986326;
	b=xDFrrX7f749e+7MDnngQx88B2rAYWeKLKiK6hZ2BXFIrsuL/X9aQTto1UzfQKDXH5t2i
	 z+CDDzBQ5N39sUvl+75o+D30qSnm8H3UrPSpi6jBibRJO0rXw7qJKpJLVnKn2tONMMf9f
	 r61FOM5LOE88woI7JarBFU0FznO8TCUxOUngCjK5ULsbONLTRZr4J/Ly8JMOb1tffgpA8
	 bXdNwlVkTrZBPl8yANKxUS53zQKNLz22gwuAZHZsweEasKswUjoPqAntev99zynFxS1iu
	 wfKtjm3EE+4r+fInrX3KApUjP/WDoRDJwj3rm2lkLWoE0ALVWnD+nZdkce9h8RpneoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PJcGPMT8Fx6QE2kW6pkiC9zThi76fzFYTSbuNCdri5s=;
	b=OCiNorOHhQMrl6DbD12ncDvRx+p6oRM31CZQTXH1JC/nMImLNR7zP+u0WFXNXvDPZMjh
	 XS2MvF1ZCdi4+0akz1/Mq6ljBXGj8KZg6nDubTw++FXln/cNMzXkNyO2HZPOSeiQkhv3c
	 5fSN1DYMkksNOCnxN0UOd8YbltqPWvJmZkOZgax+mf/DtL2wavcXDJIo4WAl2xwfnVKP7
	 MVIuYyZyZx4JdBAGeXAYiUbBYSeCRtbJDxywEou0An3uUCsKUP+dKhTswnsPO2W1XYvJq
	 aLMWV0tQHLiq8CD8WJ+6gWQj9XXt6i2vs4O6dpxZwSx0/f3o1K8h+FafX+7GvH+fYAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MYiEJzM3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA87606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA87606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MYiEJzM3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so8145255e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793986324; x=1794591124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJcGPMT8Fx6QE2kW6pkiC9zThi76fzFYTSbuNCdri5s=;
        b=MYiEJzM3PTCcC3gQl5ZOiMrqNnlNgduH7XTVch1Kea1k+HVtZwtBp96yAfa0Sqs0Hz
         LZajjTPHBYyqpsknU17/cFjdW05+ptECcgQ37vfM8HfVMYNn7L6TAGl9WVw8CsAgMRcB
         xhf/E+nVQORxz6g0ZV6ameDxHU8gCCDJVY1yDHmqPjJxmJMCOMezQzZb1RALcMlZi3IT
         mBViwVe1HJR2hCJWf/ijQ+p3JBa0KQNKk6lYUrkUuegkS3KBABIaCjOnCnJUZMqG3NPD
         O3czCPGvrs0FDdH2B7ngWp/o4gf4sNL6hprDlemsG0K4N5CH4AGrdqP3KipSsiofuLUk
         C8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986324; x=1794591124;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJcGPMT8Fx6QE2kW6pkiC9zThi76fzFYTSbuNCdri5s=;
        b=kyvG3DijuiLhLjVAPHLonC3gCkI7gimK4CqUD7c+6PaSPZM5lbJRhIjsU7G7GYCZBF
         3nR2xRR5djoNPpSt4BymcU4T+2zrAi8jfqfun0jVUKg99zpkLV1AyTS8NtrbM4TczKLP
         zlzikhn2TjQjFMblKvUX3NHLDsaXsOkIIJtG8FWapi76D7Nl2djH2TwufWuPiGMTI7JW
         yTIRipyDZ4+mcawOSU/wmyUgphSHjTU2mpL1VJg11yqFfOCTz/tk/ie/GMgC+nAqz8o4
         uMZHsiPKdQHcm/g+waXnHnkLsd7o1XHOA7gxdPi7aFH1d4oHez/0+mN4uSfoBsFc2U6M
         rTkg==
X-Forwarded-Encrypted: i=1; AKwUvBxJe32y5MV0SQMOabJ5bNa9yOUghYm7ziq99nKWwDB62s0fnOYyZdayLGNer8OFGywCFcbtlWVv72utHgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xU9NYTwrRY0zKDmwCZ7DnGI8+l6Sh7P8i1Gp/hnlc5AllPDSr
	ni2DjYiyxiGNVL6BhsSq01Sx6jU82xH3fEvYRz1r/ss1bfzZneBHXqwmTUYSnRpgGhU=
X-Gm-Gg: AYBFou15YiFFNkbybBS6s69ZDI9OjAyj2ljhjXe9jCj4p8Ix/cHu97NbZGtMqKifpmB
	/+BQ+NBKptz8FljL41AmUdXkZM0LpiBLrTPdYMlFeRR4TmAblHAPC+3sK/k02W31ruAiC2EcQLH
	OIvI+NHvh5CeOTqjE1cz6n6B6RtwDz8oyXwOn4mbkBOxX8I/UicRYDND+GEr0gz39YjykUEzMna
	Pgjv9QbDygEgxmOavuBdJ1UlnQmVnYHpL3l0iJ7nzftUotMnuyEGQLspDJej9gBnshOhQL87NnP
	El3PlkJvZ2NehawBwgaRBtSU5oSY+2HawHKNk2oTsaSL7ZHwWHGeInTbd0Y/E/CAz5HQ/Z1WbZ4
	1m/f3hKMtK0Pi23Ko1nQY76VZ4YZVpq4/XsV5NJI/3k8ILJMbGWf4/eIP5wQimWjAf+QkMLqxii
	LwF+yH5SztSCCLjLNZiJy+/PUiL5mmt1G4Kgpl6OMRGflDqfPbEMWOMcFbQnBTZ2bnrSPWo2nmg
	B7uWoTuaBEOK3KwwXnr7V3+HAMYax/dSMBsEgH3AeHlg66oH6ISIyKZKdBkVfLNG/BDRmcSWIFF
	gh++Tvy53PmaB2By27XVD/03pEONXtSA
X-Received: by 2002:a05:600c:4f4c:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4b6df9bf612mr65486685e9.29.1793986324272;
        Fri, 06 Nov 2026 09:32:04 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502d5b1sm1501575e9.5.2026.11.06.09.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:32:04 -0800 (PST)
Message-ID: <2b2bae63-6917-4538-b99c-dc2b8656d123@suse.com>
Date: Fri, 6 Nov 2026 19:32:02 +0200
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
Subject: Re: [PATCH v3 4/9] x86/apic: Implement self-NMI support
To: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, peterz@infradead.org, david.kaplan@amd.com
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
 <20261015211426.49114-5-chang.seok.bae@intel.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261015211426.49114-5-chang.seok.bae@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16.10.26 г. 0:14 ч., Chang S. Bae wrote:
> From: David Kaplan <david.kaplan@amd.com>
> 
> Add a function to send an NMI-to-self which is needed for stop-machine
> NMI facility. Note that send_IPI_self() cannot be used to send an NMI so
> send_IPI() is used.
> 
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>

This patch should come before patch 2, as it's a building block for it 
or since it's small enough it can be part of patch 2.

<snip>
