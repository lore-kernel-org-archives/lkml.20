Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324660;
	b=B4D6GZBCq1tXy5ZcUoN41FujNfOerevYzbZkBCtjNSZVakTj4KG2YmxlxqtX2qvyD/Mv
	 SzbUNw9yBQFcofPtnfzx9+jccJbI7HjaKhaZkJeVSb8v+L5KQaYQjum+xYGwCyQ2l2XKF
	 wLboufNnPrqovpE7jzdtVy67u9Ho65vfX7lRcvnBWgM2UW+qrl8KWQ5b3KIBioU/ISCEI
	 YZC0v8XaFDtH+HCPWW9giGw6S5ZMPjr23ZGLX2O51crxICCE3ZPeh1KPzaJCPrWI3xAfA
	 Gf5b6DnITxTdkbPRf/WaIqoMZLTDdEHVYHBx6c5uykuxNeqirRyBJ4VZllLa2k9eS9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZvazJCzZP2XVKss3OVQ/bZyxevLo2+jDWRDKDN/d2kc=;
	b=x2u1waT8rzN6FWVbVXNuFPcziuwJmoBYqPA3xjip/5t9UFe+4LqnoZGBBHucOpnZViv9
	 6nhMZS1TolGMnZ/hIQqlZwlNl2AAgkbQEh2bB0Xn0vhcE5Xt533xU2xQtIMRDP6xghGM1
	 tsDwQPKYea50oNnlZtFBblg4GjgdNd3ec8sGOJJKuwxUka1WOr7Wsm07ODnWYfNnHu0DF
	 f8UJaaCX+qfp6MVYDUPrqjNvDre02jjB44bppX86DD6zVCLhC0m333pWwSY0IsiWJiBqH
	 0IKMUgJ3qc9LLZzRl2THYaJGPfu37KIrC6HBrhbiIQM5Hy/YyM+nBZMi8IZcFR319/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvQALK4k;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0AC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zvQALK4k
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso441945eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324659; x=1793929459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvazJCzZP2XVKss3OVQ/bZyxevLo2+jDWRDKDN/d2kc=;
        b=zvQALK4kGqckp9LDqAUjf94qezbC0llhqT6Y31QehbsjW3F/wY2M8hjOuO4vaowq9G
         dgROSzGA6R0dyO7Ie/JoZSYstGAU6PFlQlJOpmiy038pK3dEj2r3P0EK3fYiS1e72rBM
         sE6cXDeUa3+m4w/kLauqmiom6FEIl4wciyxBHQsrKVCLGO+RcEiLrnTrEyA+hbOs8xdH
         C+rc303e7nIMJtIf3QTNY9Qk26iWM6xMDBMDS8z2Rx82Q65a7+qc3TUXvPjqsBOhqgR4
         lRV0qCOWdXlKYAe7B1dfhOOz0xNbGofGV13Lckk2DofP8M3MszYkyj1+RZ5TLj6K80E9
         JACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324659; x=1793929459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZvazJCzZP2XVKss3OVQ/bZyxevLo2+jDWRDKDN/d2kc=;
        b=Wu9PUMgQFlckbMd9s3YThhCQY0kgqGHS7wGTE6ZuFj9krNEm2QStVi4Ug1n+AhxV6b
         PvQzotYWgZQ+okTFCvStNQ8yhiTqgbouhdGfa+ZUeYy1IuyTRV4KTVMwwOfMXoITzqj+
         LZroRpyNcsvnwuZMtd4AB5Hwi51vCyK2RibtMkxB0VkqOzNOXGTxJLikqtgDuIeVy+G5
         VzUfqvF8jFlJh35FyTpi40T2t6wyCEylrUH68zvtlm3EByw9IEMvPRBsiY29ME0jkCk1
         w5Ix6DiyZ7CNYe94B5hjFwo/FmHDKGXEEcdGLscpajvTy56TjZ0k2o+RAAJYyx9np1wr
         t7Hw==
X-Forwarded-Encrypted: i=1; AKwUvBxCTtwJK/wrqKcduXOJfasR4RGt1h1ZavqVfrQinwlt061iSc7qzPz1SQo44YyCeCQHsV9ZH0p8/lAiHQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP3CV19xzNZLhJNEKUheM/zZMQn47lS4ziQoyRu2i57qjw0Mey
	uAe+5bSt1433rrqqi8Um2AoSG4+TGTMYLjL6POzcjoa6rNTVVHiWs2E=
X-Gm-Gg: AYBFou07mR6P0w2V6xb/L4G0YzjvyQIiBt/+he1zQj8HAS5lYBTYba+mwU4veU+l4pV
	0In+WDeCQ+va9kW/zuzQ7FThZdmn0pHqGMqUHvlDdNHAevvCSCNaghCjd0hPJ3tqXuC31NhuSij
	MjwbZjcRpLPrnqDna6RoKZgnlQrhJWyeUaLfcGT+7RfAqNtLgwljsrsP1uWKH+R0rYzu5mjogIL
	0yEl+Uy9ZFwwVmx4MCL0MuXLHn1PiTcSVoRYql5ktKZCS1EVgOYO6dPaFss08l4nyaDAh4tyONj
	qaLfN7niA8+edrEHHvFtK2QZZGvQvmzEOsDcTt7H9f5QmO81pbIBhn8SoyRc2zWl+2eJYb6nwC7
	+tQfdZFxF7KEZNX0CEwcdm6/p/J3A9Bby34BqR05DWpZH3CwYXSKqCheT7z0bbkgS7Pu9yqeL1o
	SJQ3dKALmcLToxz+tYf9VN63Tzy+WI+dLgkOpzqyfSOD+Mdogg7ApG3kyeUyWGpcpIwXBNejASB
	zpepXAlocdzSuUtvfcyfQBGIgce8Ko5RyBPvLms7aDK8yVrb7GbARob1ua/2XejXzyLuBa9IlLG
	XPMftWl8vo796tGm0x82l2LWqSWobRhsRpZ50JBAlPa/WNdpHVSTl5YEPsF+zAs1oOY=
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr1445004eec.6.1793324659103;
        Thu, 29 Oct 2026 18:44:19 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.112.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a96172sm2381425eec.27.2026.10.29.18.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:44:18 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: rafael@kernel.org
Cc: atharvatiwarilinuxdev@gmail.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ACPI: processor: Use Apple-specific methods for P/C-states
Date: Thu, 29 Oct 2026 21:44:12 -0400
Message-ID: <20261030014412.1652-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAJZ5v0jv9VQhZKbQcWYHEU0sQUPn5sLsRmqHzEtZ4T6GY0t3ZA@mail.gmail.com>
References: <CAJZ5v0jv9VQhZKbQcWYHEU0sQUPn5sLsRmqHzEtZ4T6GY0t3ZA@mail.gmail.com>
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

> You haven't provided a motivation for the change and I know nothing
> about Apple platforms, sorry.

APSS provides more P-states than _PSS on apple macs, for example on MacBookPro11,3

_PSS provides 17 P-states ranging from 800Mhz to 2301 Mhz, while
APSS provides 28 P-states ranging from 800Mhz to 3500 Mhz

Same with ACST, on Xserve3,1 _CST provides 2 C-states (C1, C6)
while ACST provides 3 C-states (C1, C2, C6).

This is also used in older macs only (before 2015).

And also macOS uses these.
