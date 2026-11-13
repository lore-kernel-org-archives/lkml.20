Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584910;
	b=l/UDH7yOQww3VqVyvgbWx90h7w3IsnHtyC/wl7zBEkvOMPQEZ+JNwckjPtpLLXwEjQZp
	 YTaiqRBzS+RixeZyQImGQRNff09wSIZfrlNOvjdblMlDb3d+jaZjjG74QE+PYJ4u0n7bI
	 AcpSA5exFrUWfECzcUfEx3n4xUlYZbe5EgvyvUDwG6FexSBe/VY7QODGbNdqvq3N6Pasi
	 rQ10sZsuDkIuPAr2Rio+LhKyBW8Cj3LVZsxPSAq62GpijX3W1WQMKIhJRGmgqATkmxK64
	 LtFX/L7K8gYwAVZPmoYUQf/t2ufC1YaQVzA96Uz4qxwI98odNg0PrYhWomzGEf0lK4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4JQ8+H0JmbBf+PQButIDd4R/MJa+hAkJuZe6gYLdONM=;
	b=qbTvE5lpcT81Vk4mWVAk7BDxMoZwwBiuoSoPNGY/u54uhnms3+QvWCAhnL3drUErZaWx
	 SJ6BaVdIrO4kl6aORqhMd8wwmNh3iFXGfvtbhES68vAxM6ScxV/O02LM+6eIGQH1K0B7r
	 5PFXsXsMxXO/PFnIPJJug+KhT7IiWjoVwsF/fPg/hqMS1ZuDDcL4w8W8djkKXRf90BD0m
	 5gjSJveX9DSPXUgiKFXNRFPTO1/5PI5SIY9YPNbNWV4jRlohcwX2L2VAxmXiOQESvrMdZ
	 xrlQ3n4/EMJX6TifuTLxYQwBnrstZlCc6LmEso3KT0zhQcOYiuwFAqiOsU5FjT53D6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxTPZOZ1;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A5606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194A5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxTPZOZ1
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b244fb7fffso1145502c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584909; x=1795189709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4JQ8+H0JmbBf+PQButIDd4R/MJa+hAkJuZe6gYLdONM=;
        b=HxTPZOZ1wdaQhJWrsAQGtyl1XKuZIm6V7/EM8G/h/K8YvOCiU6viMxkydeV3VpaeII
         kPaJzNl67Ki1bJd2U02hqCO3RZK8HuRkI8goikQ972Ac1umrpqeDa9PDXBtyHoFvaCDa
         EexRARJvUXFIuoGWo3LuQEf+pp/NxyZ3rXGjzn3RQueltc3D3m9hY0ZBFYXUMcKFj6di
         wpwWUcBpvOFEbNx8e09PlrYodBE6RSw5V6trVfQM92nJtAjF/1e56uCejMaUBYwQq0xx
         AtqKpIpzm3imbjqSuVxbsxB/uD0FuWGhj7j7KxumDigQ3yELfKsEtgy2n3US5HJep4ig
         wn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584909; x=1795189709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JQ8+H0JmbBf+PQButIDd4R/MJa+hAkJuZe6gYLdONM=;
        b=wSfDakEAYeYmWct11PGCxPfMKsk1FduSGDkSReStlEM/FuPXzcs5L/7/0xMvVZER+5
         jzDw86Dvuoe83+mqZJ0/dXQhXsLQPsciKSqD4NCW0My55GlN3q0oU/JOGlkFQPP6eT++
         6SqlPpcgrhuiAYjMa8DCdNSFQOA0Ym7PI/ZSxMNe8o6OU8/Lx/ZB8XM1UGda6GFQXs6C
         7P+V/RM3QUArMCw9NfyjV0SxKlSYuxjqXROhI17p+WppmelcpK+rV9o5mGZt36FO116F
         0EMEzhbEPYtE0E2AmV2U0X65nsJV80puUaCTd80C7zQyUZ437Cpm7j/4CL382Yw6oDD+
         WA1Q==
X-Forwarded-Encrypted: i=1; AL+hErFYAb7UvefhqlY9VaUPZdsJL46bO1eOamRYwhg/pTFsRCiLnSILDSJ3YicaJ9E5t3fdITgOP47MdZj6brw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/wDllHIxfb5BPNLkj9CFHwwQKLcvjGcnrNkN5YyUSNV/LUA4O
	DHf61FGq8CAARlTAKao/ryQRw9ydyp3AabD3VteBOc29lTF2MnNexn0Z
X-Gm-Gg: AYBFou0iOSjjIc/dTVHa7hYXIN0gjDbPNTVpmjsQ451SpklhLSDuasBf+h20IrCxrRY
	F7mUCDBfgqnAA6RZQNgGkY/bQNt+HcJ1Kmj1rBCyg5oGBw52EAsafGC0o2oe6XV2IyaGM7m9HOK
	42vRoMCVAqlhjscH1P+hGTDuHC6PgbLffdVOiGwyXJcFsXAvGDT7q5bReTLWG30Z4BTu1yoTkOR
	3Rbg+Eti5oo0SRokOmutswhcdE1u0Y6ryPckNH5DcfLzt7yQy/htCUq//8Sj1kvJuacFeWSOV16
	t7eJ4o8Z8r8nO72ushVa536ZWmL6QZfiMLqEKeO3axMQFWIaAWf4sz9eDVYfGv8wgJgpAPDWzVT
	s7+IXDM3n0OL1dSNQ64e5mat6lr8D9JsdoPChq+AmDD6CQAJDiAA6DQda5Cyw2zF31bA1hHlktT
	C+LGL9c+9RjKP7YVvvfvLXcbMSgnljpcG8J7/s9A/DF4gNR/Y/Znr2pOYd+rJyjkIMjfF+DDeSt
	5+d0lXlSg9D7k06WZgsdeD6tUMxqRHz3RzN5D0wv3bm6O6Dk0qEQDh7j8aMkE7abhEPlaW8HgpR
	Aqi8lM8nYELK9UoPYCZeUENzj+0iqW/9cjuPi3Oa3Oslz/gf9hwbApHeQw31EWgBDr6ACZ8=
X-Received: by 2002:a05:7022:f905:b0:1a6:53cc:7454 with SMTP id a92af1059eb24-1b50311d32amr2553855c88.27.1794584909005;
        Fri, 13 Nov 2026 07:48:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm5641828c88.10.2026.11.13.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:48:28 -0800 (PST)
Date: Fri, 13 Nov 2026 07:48:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Eliav Farber <farbere@amazon.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, Sebastian Reichel <sre@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] Input: adp5585: use
 devm_blocking_notifier_chain_register()
Message-ID: <avcxRXFG57_mWX_P@google.com>
References: <20261113104218.32566-1-farbere@amazon.com>
 <20261113104218.32566-3-farbere@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113104218.32566-3-farbere@amazon.com>

On Fri, Nov 13, 2026 at 10:42:04AM +0000, Eliav Farber wrote:
> Replace the blocking_notifier_chain_register() +
> devm_add_action_or_reset() pattern with a single call to
> devm_blocking_notifier_chain_register(), removing the
> adp5585_keys_unreg_notifier() callback.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied, thank you.

-- 
Dmitry
