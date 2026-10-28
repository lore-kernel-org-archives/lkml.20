Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215415;
	b=xiZd5XEWJrjG9RXijzxIirsxEgOcoWmeTkRKPzcPXd3qdE6e3gNSGpRLLqu7REosQb3c
	 gslSF2eaTh77WvEAxPG6V8GnaQs9SLk9fFpLZ5F1Uo/S1xN67krNdM2u/czNpNn5m8B05
	 8o836cBNUTc7RyBnfF/RmjLQJZD9dgeOs9TjteUWM4Fql/LjVDtwUmfe+61P0tybcM+Gw
	 JLcrJrgF/t1lfHE8MIWNv+bpYg6cZ93ttb9DzZg2d3Ts2V+sCmnjYJpxajErQgaCSFHBd
	 k3lcml99UiUAT+h8dmQBPbwmSOnx+Vzz+N8qKkoZ9c3UEujWCzJdi+22RhakTgGjIww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BXrl2Gy2EHaylNKL4MTPyKATt4jFZLfoVq5Oc32xJ+0=;
	b=azAkw14D9u7c9RnjdkyDJ0RXJ7UBianrkz3BSnaZr5wT/XrGoiW5mrXGz4xixsUqDB20
	 3bx4NRiBnqeSCIQu3e8DTGxq8z51lohpM32aWlKpdO2TIvs7rUKiqODm7Vet5VrVik7Ns
	 4pvKGlz6Ca7zse7d2OXr8OZVONr5gPZRqpzmVbalEGvPoLaAJueK3cHi/Q8p8/YaSTsHG
	 6pBtwN6IJLp1MXsZYN78SgGpUKKkPIlfl+JrNpDRZ37EDxJYPz7GcrTKI9wzmv1H+2XAN
	 ZSsmVblqB4LGPZ/6MLe/Em/Hel8Tq7oHyQciycFFkgQgA/DoRDEuPTKUXUSrxpjvgSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jgt6xSuZ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72359606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72359606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jgt6xSuZ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df4f540ebso713365f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215414; x=1793820214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXrl2Gy2EHaylNKL4MTPyKATt4jFZLfoVq5Oc32xJ+0=;
        b=Jgt6xSuZrNU1xu7yuq7GzRE5SO0KShBkCtOAREqPjIqnXhax7gZ9YLCxDeN28CBHI8
         a6e8prcVd6zz+Qh0YCVoTZTe/JkyW2umDzI0cGa+FO3kY57EwskwHrzVCp2tDvLD0PEp
         W+Tg4zsvPdGL3b+gImuFkxMvm4t8OGHy8g1QkFhK3dMr38z+vvRGKFe4iO1WIRh+STA9
         Q3pDnyl0zEx55QH2w2B7fs45IP2o4wLSSBbJaqRZgmWLsh1rwlE8JPVYKov52D1O2mnM
         x0BgHeiaS6tdR9rdHOn1ljVvQ00Dmq+gPDxIZZ0p5C3VlWNHbeyrKRXP0TJKmLtaw4OR
         P/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215414; x=1793820214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXrl2Gy2EHaylNKL4MTPyKATt4jFZLfoVq5Oc32xJ+0=;
        b=GU6uqudQa5cOy7fNU7jGHbvVEqPQiShdW8E2XwSlmDav+Vgqx1R2OAVynYT1QnpVy+
         FZmIy6P7vBi5h2hkNgDdz0tcwaeGnSrZ45vjTP6t+6txAj/gXXSNoY6r+mRdTwsilRsp
         NAOuU3RAIuuhPSUn0dbXFhPxgHpPSZZDobHSYL4ceuBjJxl+45Bv+X7HFqoZL5zjDjyH
         1W8FpnVAGhV8sbuMHG20B9yrr57Wbl9FL2l4pDrbYQksMKirzw42pQFG68YBRxNpwKWN
         MNkJif3qIAs3a7eXQaLQpCvcGF6Wony1YoKhPsEHHisYPC5IXttZurkfBxn5S8onc5kE
         KMaA==
X-Forwarded-Encrypted: i=1; AKwUvBw+VTHsEk7ZHzaI6onmQIpfBLbe0+iHigQ2m34zpFIOa3SXaBHERDV30RaM5yAryudkz4CS2mca8WflhY0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOHa6yV+O2uv88bgEfGKrtfivG15XlxrXt5mxwAePVwVTZacwZ
	SQ/Zt5f4yJinVw95ehg+mu/Wb2RfOUdj67gRIKDeIWMrrNtK88d4mytW
X-Gm-Gg: AYBFou2mVQZ6D5RMSSjjmgCfKj9yRQOWUjUgORAfOofHeECZUM9Wxx88wA3Sf2DHS37
	FkPMjdiDH7z3z/Gr1Z6i5TFckgjz9H7aUozlIhYABZWWP8Qx2b9zO9oTyeAGeYTHWBRVy0RSk61
	A3Vq6L37zGRg1RNzH2TUK2F7RF11ALNSqPDFJvKtWHRIyJauMK7UN9h8t0Oot0EtmuF4Y/JFf9P
	tnYr9DJSQIhXWOdCatorR86WWT/PfaodlYFsb5LfXhMvIqm9lWl7+lSBQNlc5ExcMW815kU7Uxa
	DU406qxNgZzv3g/K38yeljEmIY8T3XgLvAcLFzHaHkFz1LfS/qsKWShzRcyWZZK9/jnKyYUn67b
	QFDrxIX6eD4AABY83LHBbFr2A2bXx4VBYQJr8u2UCtp54u64seHmUt3wB+fRINDWGzoO22xYj3i
	eY+9IMOFxjfvDl72m2eoXNFg9+wfiogx4QGP+kaaiC7x/ObeCEv2V5DhyfiXIXh/+UilBcojc5k
	TMA65YyR0Y1hUGVMfdndn0fNV5EeZlHKwDaIP38J9HFcPyoibkEFfyENk9HPiUbGaV4dH+4yW3l
	1z6GW2kueznSC4doIXNld6Qe3A6qzA==
X-Received: by 2002:a05:6000:46c3:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-48e62a91a6dmr2250254f8f.49.1793215413691;
        Wed, 28 Oct 2026 12:23:33 -0700 (PDT)
Received: from thinkpad ([2a00:1370:81ac:50e7:d3c8:c903:5898:874a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm29978125f8f.53.2026.10.28.12.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:23:33 -0700 (PDT)
From: s1nkhole <dedemorow@gmail.com>
To: dave.hansen@intel.com
Cc: x86@kernel.org,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	hpa@zytor.com,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <kees@kernel.org>,
	Brian Gerst <brgerst@gmail.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Zakharov <dedemorow@gmail.com>
Subject: Re: [PATCH] x86/entry/32: Harden return-to-user
Date: Wed, 28 Oct 2026 22:21:39 +0300
Message-ID: <20261028192139.32606-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <ac147f25-a2d3-46b9-89c5-44a1c0e4f038@intel.com>
References: <ac147f25-a2d3-46b9-89c5-44a1c0e4f038@intel.com>
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

From: Andrey Zakharov <dedemorow@gmail.com>

On 10/27/26 15:01, Dave Hansen wrote:
> I'm curious who cares.
>
> Is anyone who is actually still running a 32-bit kernel concerned about
> this kind of hardening?
>
> If no one cares, then I'd rather pass on the complexity, even four
> instructions of it.

I don't know of anyone. The only motivation was KSPP issue #41, which
asks for parity with the x86-64 check added by 1e4d3001f59f, and that
issue is marked as low priority because 32-bit is legacy. I have no
report from a 32-bit user asking for it.

Please drop the patch. Thanks for looking at it.

If you have a moment: this is my first work on arch/x86, and I would like
to contribute something that is actually useful. Is there a small task
in x86/entry or in kernel hardening that you would suggest as a better
starting point, or a place where help with testing or review would be
welcome? I can build and run kernels under QEMU.

Thanks,
Andrey Zakharov
