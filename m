Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6561E356754
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791186562; cv=pass; b=a2tky2Ihu4l7TsBGe7j4J5F9UXdtNMxHtVuBsgZ62D2JgEfyvZBCNfxizR+oBH4w/g28y6kxUmIJyKD3pgYr0FlAqkWm8RemZFDoMF+Q0rBDRLJTRA4zNuprPHtzTMHGc3tPyfPM3H0ocZKDClRiiKFgBvYERq5cBZRp3YOYb/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791186562; c=relaxed/simple;
	bh=VxvVXdBb0Q9qM0U9L+sOJleMerm+22DQyt5XrTMDHw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPpJuxWoRaU6Wochxmf9Yeh30MRO8n7va4Z2gXMmZktx3IfSuhRuHEKOxy+xwFpXei/V2JfdYuEgXMT9IAXNg+qHwz42AVedtCRHi5eGqzJvHYJ8fpzpb6lK5neSIs6jp0q+NDWOQxGeKHkwxYvDybFX01RPo69Uv0K+l6gvKOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvDVNAMm; arc=pass smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvDVNAMm"
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5e29744c11eso371016e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791186560; cv=none;
        d=google.com; s=arc-20260327;
        b=SIQ45N5ULv4rlnaD61R44AfkTjw+K2PtYZ5QXdyE5y4pbJgEVr3zisU69nzre8Gm3E
         F8KhR55I43dDJjkI6b3Krc2Ww11kCKbij8OizybW4f2bdbdDYPB5WL6GrNQaTNEYOa/8
         UemVVNw7Omk78uStK5trsRTHr+0Ub0cmrQgV94u4flZF25VnYletyoxKtKrUF6hP5Bvy
         PHygb6WXhRiAJbLS68OOxxrfeffMlpbQHnbGIm8VQekrgJTTbLxmmyWxW0m6F4mgAZ7U
         Gisa95+5lK+0P4nd5vsoAAczvLX865ElDl0DBlGUs5dAvophhUi3u2vbh6py/cR499IB
         v8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qEOr2I2L1ST7P1+/bhRodaAGlocW7FV1+3SmlS+kLII=;
        fh=xDAHGXRYE4JUSAY9gSCZgjwiz4U/VeJM/7Zw21Q0YvQ=;
        b=etH9SBJ0/km2Bv/uwbH4CXwHRWytkE5CIODyYKreDl+TuN6yOpHKu52ozxgalY7JaM
         FFByFV5ojBCHo/T8egEhWSdL309g07HVQnVWgsUzb0uFEDo9TdXsBIHp9ieAfdFExjfz
         4d9PbHI4erdM9DrzlN3YbOhSg7STCWQCNJVPeEsAVbDgDn3nR/1NS4Ihghwj7pR4N9aQ
         QPB1aUIY17V+f3pdRwqNtvZlLTjScbZmqtDXZuyHd5S/bh2cE7ojCoQZtOtsAOzqqDWj
         /Xsa8gC/24KeORAayYDrq1weC6shQEx+wn9uMPXUyM9CcQoa1yC4YTm/Mwzi86FIbbny
         DVqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791186560; x=1791791360; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEOr2I2L1ST7P1+/bhRodaAGlocW7FV1+3SmlS+kLII=;
        b=MvDVNAMm5Apco/LvPRu7/v3PrX28fbFvPGHrYeh3nb4EEAWZSoC86rkKMlBN7cpi8j
         OMKIngMLReYrtGl6ni5G0c37L4QxvIYyILyg1wQc6h5qoEBbiHKuPx8ncQmOqjEoOH9D
         AwwgUko+Sn0lxZGsa73Yj1v1sWc1IMBB7G0n5vXlUsr6IdKxHjVvePgFC93+gdrIz4x/
         QB3i907RgwE8o2VYZHPGs7V71RK9yyprbbEwFPhbL1wch7RH2arqEnOUY1pJbrib7/5/
         mFeRYoNDefamPRdh4Mw8FxBmjM5DMjPAsp1x1JgsfFWPve06ZmK4AywF1vm4RXm5pGkn
         XzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791186560; x=1791791360;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qEOr2I2L1ST7P1+/bhRodaAGlocW7FV1+3SmlS+kLII=;
        b=OOTjDtX1lTgWA3+P4CjXevioz6n1aeNUNGZkdiOu+Nid7iTO1Fo7Bk741gf0Ny5m90
         UotytrkNu7tpX0j1vdhRQraNmnQr4NSTiviGlNYaQ1kgAgl/a9e3BwL1TtvSNx1Toik5
         aKJhClly9clRiARChXMcS6VnqupDCnWvyBNnqbR+spvarLTSKrDFc82NgvF48OuX4y2B
         4/zMjk4yac0UTJwS1ntg4Wsj08eL6cbASHcUdBk1MX8mtHASXhb+X6B9pCaw8Y+xiJ1U
         knKOMjec4YjYGz4QBT+I4EVgsvOPQ3Vj5OO4OaqoaaDSABBcQCDcYR7mlj/+zy0xcdxM
         lH1w==
X-Forwarded-Encrypted: i=1; AKwUvByKZPDNDSufONZj323rPs0taUo21ULImbU7GDanqF0L5semj4DVv3Oc9mM6Q3OvuEkNO+OGDnhBnW0PfL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYII1WNwhrCvQOAYEcV6fcNdvZt3zZyrFkVqtDIXRbm+z8qANjOt
	cIfWlHUT95kDqH/iyM/b20okTs+v3mySsRQycOvstum3spk5NXV439MP++NRc3CW5bVFNECDXfK
	wquxPMYaHK1IWgKPY6g++DuDQVqRcSG4=
X-Gm-Gg: AYBFou0hzePZXlsdE8Ek4wDSMgMFeDc0M/SQQL6ROpe+5ZECjnKiRJagr2C0Cjp6r2s
	Bq2w7a1GAe2UgHPC/P9CIQU+r3h7baP0uROy4R6a8PeQ14fjJp/OnyeEzd7SkSim9I0/EweESC3
	OIsMO23z7Azq43VeFUJLPGcZKGGRz5oCwikQkGud6HW2mfsu4Yxhfvnq3I3sugaquQYfvgTyapL
	pHDQxwg0P30BTeUpbTO2WaQXZ1zfhxBlygOXH68fCA7qGvxX6RCoCf/602G4320VdeAb9LLStxV
	1mN80k8nutBtvcWB8/SA+FO2SYkSdYH8U3RqRYMtN2psc51YlqlTzQV5oPbNKxiCd9r6VjNgLOJ
	JypvBeR+r5KobV9lxgs/EHy3y0drD716utQ1mCJbz0hXAk7GhMhnhqNyF9RH3LzJJUaaram8Bfy
	VJNh9Sm6qy++E8DXtk4VDusq182xVqg6ldA1uT9jiqHeYnJ8NKK+O/gt8=
X-Received: by 2002:a05:6122:8715:b0:5d2:f636:7577 with SMTP id
 71dfb90a1353d-5dab041c44fmr2930910e0c.9.1791186560164; Mon, 05 Oct 2026
 00:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-elan2514-irq-route-v1-1-a7ab598efbc5@gmail.com>
In-Reply-To: <20260930-b4-elan2514-irq-route-v1-1-a7ab598efbc5@gmail.com>
From: Waqar Gulzar <iamwaqargulzar@gmail.com>
Date: Mon, 5 Oct 2026 12:49:08 +0500
X-Gm-Features: AclHuK8DOWIEo0q05q6gq0-QkBnvI9dA5B05mEZp1IjaXwekuF5jwY5vqNmLm1k
Message-ID: <CADeB2Yob9aevFYWM6QaFLybHs+5Wqq4UqmJNNQ3Zbtnz48VEGw@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid-acpi: restore touchscreen IRQ routing on HP
 OmniBook X Flip 16
To: iamwaqargulzar@gmail.com
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Additional data since posting: the same firmware bug and fix were
confirmed by other owners using an equivalent ACPI table override:

- OmniBook X Flip 16, board 8DA1, BIOS F.10, ELAN 04F3:43EF
- OmniBook 7 Flip 16-au0773cl, board 8DA0, BIOS F.08, ELAN 04F3:43EF
- a third 8DA1 unit (BIOS F.10, 04F3:43F5) shows the same ~620 IRQ/s
  storm

Correction to the commit message: 8DA0 is the HP OmniBook 7 Flip 16,
a sibling model, not a second board ID of the OmniBook X Flip 16. The
DMI match is correct as is; I will fix the wording in v2 if one is
needed.

Details: https://bugzilla.kernel.org/show_bug.cgi?id=220854

Thanks,
Waqar
