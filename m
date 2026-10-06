Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBE73C1088
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286405; cv=none; b=LxJ8TwN/mE7zEbW5+V5zoLNLxwvNsQW0ksLLuqDcJhQ9GNZG1rrMohbyW6qYW8/x2oDTXHow19PfZhiP3hECucuTNKXS+tm+Ftf4jSfT58ofDLc0dDU8BUvYSNZGU1xLZRzMQah1ZB90s+i6ERJATeS8m9q9LWtbyBBxFbhF/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286405; c=relaxed/simple;
	bh=K+paxjzoi7IzgH+mfHtxQm46Je8LqMNkCno24z5At/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rduf/Bu+6BFwmBYvp9Ogn6OvUli7HxAuBHKoCSlYNn4mQDZXR6K2ynOJsCRxsBIci3hE0TIJXlYRT4Nk+coDKtRJqT8B0LchhEtRWhulXZxCL19Wq+ToYyVyTYgvCPu61xnbanKI0h6ePXry2JAUf1Bs0TM9HzxQ4Yw6sAL0TVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgaHlvkD; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgaHlvkD"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14fc585291cso557556c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791286402; x=1791891202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+paxjzoi7IzgH+mfHtxQm46Je8LqMNkCno24z5At/s=;
        b=NgaHlvkDNAkww7NGIAOc+OIqWnvDBKwZRrMILo3SuDyqe/P6pWzo+t/bevBC3FOIOp
         r04ToZrjLpOiHlPKEDIqGyem785r3fr/hVD1KF4hFIrjC7pyY9vjd5N6GX6+MGgK+yyD
         TglHiLSgbkv+29sNFrS/qG+KmO3LWlmmPs2neDzAu3AuGajFM7GJiWVTIOXdlxzMQt8I
         pMtWlSbuXwdoD8jZPM/yhnMJs4uqLRcbuISbDGUfcMeIqv4hSZbixuYKu93X+PYEZ7gj
         DxACO3WuXe8C/Imo58DZrpn/d5GQ9R5ArXvu6Al+SMgOtZJLnOrKr0pMA618DmYtmcdO
         JeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286402; x=1791891202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+paxjzoi7IzgH+mfHtxQm46Je8LqMNkCno24z5At/s=;
        b=daml7SGF45n4fUWbh/7Qdpt2eXtl+NDwIklU2NP2h4oCHCJUVACITOVsZ5JrHkoxzg
         uayU9V64A/Uno5/eDDHRiHUywnVYbE+I6Ho7h0c680/lH8FvPNXuTfd3EGRrrB81h5b9
         vPbVPg/TBwdBUYejJzoRlqRGwTPDBK1gRHIaaPjFfXdNziuohL4qnu7wqbAus1TzVMR6
         yUqNBf5o8lgPx5FoXEfcGsNTregS8CLVoqmRwPgz1DIaEpopN91XD0y6AyKLmX0B0/M/
         WjTzUF9Rf4KI9A6q9vfpdtIIxlys5R96shwRD7/DLHcg4G7Le7jU7KGEemU+xF0PuHRw
         UsRg==
X-Forwarded-Encrypted: i=1; AKwUvBwp7vMGOanxk6aAwdYeYXT1WaEXOV4xzJzhY9s6obRpUp4T7lC9M4G3xm9vJSo+7xSJch4b0+68w1zKPYs=@vger.kernel.org
X-Gm-Message-State: AFuF++mev2C6gMi2JjG3IXddlrSf0W+FV0LPsV8PbQP2fX1NvSgTdyuo
	+yehPZiQaEwHVIlqxIFR/q3gCEqqtgF1r43kxLdd8oNi3U4RFEu9o7ya
X-Gm-Gg: AYBFou0SnHWAyIGUHBxwaocUrefGKs/H/cs1ZPIUytCfrYhirbuyap5iWAF9vDh0LO2
	jfFxjZRCzH3PQ2paKEZ2cj+qVMBMCGBm0oFa0UGDTLkRmchJxDajiAj2WJxWrDRe6W5Prkxb+pX
	2WTqTkmbxLq8W1hNkpLph+HTU3wXWpQo4TKscLPdubce13oMt4dN8GHrBQoZlaXSLBAPFyR4Q5G
	F8+P9Bi4J2gL3SBprdK+mibMklW+AwRav4XEuzNOolcc7HUtBK0/NQe3aEfq05Ck1vPS4czzHRM
	D2g+Jt0RPVtsHPWiw1kjTrK9Xylr4NlwH7u+WfsDYr9gwI0f1YoQ2KwR+wBWRHXoFOGZ4n1DOP/
	lfWfkgWFRvf+bDkZ2zJ/HheibXyus5rSjbQ9Er69DkMlmMXH7FPDdeO1Nucp03G4VheXTKaL81v
	yLgGvJ/t73qUOaxToO8fjrZ+cCa2E2DKI6MWu63HP5RshLGBWCTtmsCIjSuoaNTuzwoy4yjKx7F
	jmWGx7rdOu62F0Xk8qiUmZIFS4UaWo33dya9Hjjd3q3WNbnTJKJ5uMCBIw8ouC8NQgTckU+69Rj
	DX0NNQ==
X-Received: by 2002:a05:701b:458c:b0:148:bbae:ad2b with SMTP id a92af1059eb24-151c2b16e87mr13424090c88.11.1791286401479;
        Tue, 06 Oct 2026 04:33:21 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d7234c2a2sm10735006c88.0.2026.10.06.04.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:33:20 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH 3/3] serial: 8250_dw: Add Allwinner A733 UART
Date: Tue,  6 Oct 2026 08:33:06 -0300
Message-ID: <20261006113307.86417-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <db561de8-cef7-4945-93ee-b0d434eb806b@arm.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-4-vinicius.eduardo.pedrosa@gmail.com> <db561de8-cef7-4945-93ee-b0d434eb806b@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

On 10/6/26 11:46, Andre Przywara wrote:
> So I was wondering if we should refine the DLF detection instead? Only
> when the readback from 0xc0 returns some 2^n-1 value we assume DLF is
> implemented?

Thanks, that's better than a per-SoC quirk. On the A7Z, writing all ones
to 0xc0 reads back 0x19f, so the same family as your 0x9f with bit 8 on
top. A 2^n - 1 check rejects it.

With the check on the board, dlf_size is 0 and 0xc0 is still 0 after the
termios stress loop. Without it, 0xc0 reads 0xb after boot. I don't have
a UART with a real DLF to try.

v2 puts the check in its own patch and keeps the fallback, with the A733
compatible only selecting SKIP_SET_RATE. On the fallback alone the same
loop leaves 28 garbage bytes in 3000 lines.

The probe itself still writes all ones to 0xc0 before restoring it. Would
you rather skip that with a DT property, or leave it?

Thanks,
Vinicius
