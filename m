Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433FE4DA9CA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790282593; cv=none; b=BTr7gDIu/HuF57kvCn8pFjoCGtMu7gb8ug7oZVyPRe45G6DMS4a5dnQGQz0g0lyCFz5RLSRID6lOrExlUa33XrIQ4EKls7GdeVIY/gWSOMXKyX0D+rRNym7s5b9lj7JTR9UARhynGo7MeAZWSd0M9rSv71NnzwdB8cj7/wSHAg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790282593; c=relaxed/simple;
	bh=n9qJKZgIWNT/TpycfMHGX84Iy61PGMLpE6exJirYMEY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YGnCCTGQDzIfikW6ZY3F1XKgIzppqgWraxDXPreKUwxP9DLzNOHUriQVhVm/TB7SCjk7CMH6lJXdkj9mnkduNBhSIKKkJ/eBHB+5fejkVPL0R+c6wvEMQGPJ30mCS+8puxK1c8NeoXAP/tcKSkYo/O9Vz/7D/zZAl5Ny2gXh3/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gXtnynsw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sFZf7xZS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gXtnynsw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sFZf7xZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790282582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=;
	b=gXtnynswXdHQWmj1etavDMjzlRmV6fBN4GrxU2lqimP5PPmhYWzNcQRlM1lm3CXKjFaZLa
	29jPfjfDIegNIlq16T88YQH1O/B+iEOpimFmFdmB/ofHibD5gCybzaU9xuw5NL7QniT+tF
	NwW1wtvAWgZxo4heLzyc+X8IKVVL52Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-EBpA1BgVNkig9iNXkkJ8fw-1; Thu, 24 Sep 2026 16:43:00 -0400
X-MC-Unique: EBpA1BgVNkig9iNXkkJ8fw-1
X-Mimecast-MFC-AGG-ID: EBpA1BgVNkig9iNXkkJ8fw_1790282579
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so57752785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790282579; x=1790887379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=;
        b=sFZf7xZS7PhuGAZ6Ei1Ts0bLnqsZ6UcxPGaM4s063LM3ghc5GgkD1Y3tDZ2kbt49Jx
         C0/CnjUj5z0Dj6AUv4Y3yxpbNaaKNBFYyoQ6zwWC9cfm4g0pI0TVGdgb1Fx5VxTvKUz9
         Gi+igF9C4u+7S9B6/AH9x7u3jDTKwqwgdFcjoMKwv96ImyHBkAkEMX4C8A3l5DV+v/DI
         nGvsxqr9x5j+TRT9egc3oNT3cCer0apsD1DCWVCqBKaHuTD71v7B0myy9Ox7yur8Cr7U
         HHj9szlrKX/Dk8a9ouUuC1j4X3iUBXsnYAwcmpSBoDeKEbXPqKx9jggftUPTRPiSvOMf
         g7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790282579; x=1790887379;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CkCEyDQzgVPhkiN5y/9tLvwKtrY/6iZcsRbiIgpyDQ=;
        b=15XK5U6qvuuhSs44T6HpbksurcnqX/Y/PUTcB1/TAOQ/e0iTWv583NN3dP78PEvJKx
         wH5Af9A9iO2I0PvH2aHPw+Y3dOYv26KVAkJYG6EMhzHDQIf9/7P8jAtUQdi5AsVQLy8C
         qh4UdrbFTEL1LnYeZZUE2O8meLdINIrEXqNmOFIeeaVyt7cd/usRnEEmboNcZj8bONwz
         xsv+aufr9e62EQV3DyKxrFXkN2FfFAsS0LzWOPycDNTtDbWt/yAxn33eGVWwXPLMUb+9
         knUHCcLLoFXIS6Feg3nV5nKM0F3Svabgjk2KCMopKOAnU7CMiQ3WFzPWkac8N/pf/lI2
         ekiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlILSpDloM6Z3UaXz4R9EMZuovDH2FL7mUvWZ4PjL3p+57uWNM2gKxED9rTnyXYwE1YYDBw0+mzSTZYoI=@vger.kernel.org
X-Gm-Message-State: AFuF++mbhpx+8hMP8AKuRMnixFh997Q8m/rJNARWgGHU5H7JwRLH0OH1
	HoHmYDUcGFc9b+jSixn/tgv0xjRsQU42r/A4qJS2XO/Sgw3g6Bhq9JBeBPgulSOZ2tc1jqbx8hd
	inyQTEIV4+3QndkEnMJikCMy/YPTbbGLfKR6/PX/1G1NuXwHj6An1RBBHzBYlF1gYvSELktiLWj
	yzYnRLc9Pumh580SdYp3DamurNXEOFep+EZ0pKEIsT3EaFqbLt
X-Gm-Gg: AYBFou3c9Jm8dudIjWungaTLwIb8xKcNPb6my8QalvCDVzZGfKift8wbm/xIK1NFq37
	bDmdGr+VuXG8pyW9s1BWSVnaFAj+afJ7kVKj9T/1qV0YBfmSt/nQzVX///mIT7YJbQYhy+P6qbM
	x8qfpN6JsXWt7vcGrPdI7aTJ3OM4UNrwNJ5e9dXdAkxs0C298NIzsv01GAVmNzmHh/Mc1MIWypT
	D50V313JtPQQ1IlWvKcx7NyPQreJ1406LV/4wEo1eHcks06au6Xc+VJilECt6PCPWAT0PDQE0P1
	ZMaadNgKSWID5mqYAOt0Iyw9Alu3OzOmy4ty9aowjQHcki/8eWcCNCohzH5nAF4wSntyaKbIQ8C
	0StmYKBEVw6ZpGsqhkDyYn811yPxomkaXuneOFwLl
X-Received: by 2002:a05:620a:4105:b0:939:707b:ec10 with SMTP id af79cd13be357-93c43dca32amr84394285a.52.1790282579404;
        Thu, 24 Sep 2026 13:42:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4105:b0:939:707b:ec10 with SMTP id af79cd13be357-93c43dca32amr84389585a.52.1790282578743;
        Thu, 24 Sep 2026 13:42:58 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448f544asm20179885a.18.2026.09.24.13.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:42:58 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 michal.simek@amd.com, shaopeijie@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909131412.3051635-1-shaopeijie@gmail.com>
References: <20260909131412.3051635-1-shaopeijie@gmail.com>
Subject: Re: [PATCH] clk: clocking-wizard: Fix overflow in clockout0
 divisor calculation
Message-Id: <179028254070.218801.10108489974991747895.b4-ty@b4>
Date: Thu, 24 Sep 2026 16:42:20 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=346; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ux0dnfgDZkR6Z8fYUi+Fxf86Gv4PesUYUmg9HR0c0+I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2druWdNeVsjhcTFkw++OthhLWw76nt+mZX7pac/xz/
 BIljQq9jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACaiasPI8PbybOUNfYFKXWYf
 jnKcbRRLcS5raNxo9tZ4vaPRg09pXxj+B4r9sLGosJnw+O3LQx6ZQdxfai6cMWVtOrh9k986y0Y
 9bgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 09 Sep 2026 21:14:12 +0800, shaopeijie@gmail.com wrote:
> clk: clocking-wizard: Fix overflow in clockout0 divisor calculation

Applied, thanks!

[1/1] clk: clocking-wizard: Fix overflow in clockout0 divisor calculation
      commit: a1d0465f027d341c6855324a5c63e54780ce20f3

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

