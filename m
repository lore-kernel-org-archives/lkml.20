Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794412551;
	b=hVSGdJdyDhL1T4BMdCzW6LuM8BSLWTJE6eF8XUw6YqNLrrHRJAt1xCNHtixBODvUyzHi
	 aDjsT5Su6kOd7yKBYSm2YEI5uO8B/4sKQ9BXa20XNoW9oWxNRO6DqcUncytLn8ocznuTn
	 T1SDssAgMu4FHr61afGEHomdYm3LudXQvuTSx2l/xDIEI+EeXx5zdSxeYPBH7CoilaVK7
	 BiMH6+uL+1H76cL1fUqvU5bjEMmDqtAjyLn5TwAvWFNTFl/njZP/XaeE0HNFAhTDV/jZH
	 /hyVhdMcfpOwSEs5TpVPcNIe3nAIsjMq1/jpnQy7KY/46CXTL4n+NzdQJ1c+Yb0me6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CZ2sF011bYx56k309E4sDnRFziIX937z5+0Drmm4Jfk=;
	b=Ccrr3/BNc5eU+3LIHFKsA3Y9awPSvcrC+x48gDpO2kHsTpoxqLKRzNmUMN8i8RRs6atX
	 z0kVv0tididsZtjIsLUHM833W4KfZGPbgBfLSmZJHsHPfyJfUfckD6TsQOuIRVE6T+4AA
	 2Z5r4X0a6KYnVX7EafkW/WJQMCEG8JmOvCV0kOImcocL+nUkgjXmrV+tlbZWwqosOvDva
	 0V9GcOy+uN/GzOLY4XXNR24tGgbjLBmZkMZPEPefyuIxCt6ctofef/2CuBDAEPCuXbky1
	 N4luIfBBHXnZ2zwhpcLzqvZQhEkMW9KdOx5nCm1ClXS9ln1qJyGwVBU0V6csLeDc2BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnpzOxUy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86166606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86166606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GnpzOxUy
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1266133b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794412551; cv=none;
        d=google.com; s=arc-20260327;
        b=Xvd+wLagUQwveIjKu78siG97+TKrlIWqCPs0/MNoDgVX4GgBqFEK/rOoiWiLpcHVtT
         oRuRgeVfiGmhZdn3JDWmZ89WxzrArEJ0LGopDDnSXdddmlko48TqrSr7XogL6jPKRzth
         mwbHo2RHLxvf4VCTlrXAJY/agiJl6xiEoJqklGKwaBjFWyQhuBxtIKrOGB9gm3kX0Zoi
         ph4CU5YmsbUtrYJSMcz4I/k3ohre1ZIX+P9kTf9KGLnqw2XWuCrKFK2+ifLPg9zeGqI0
         65hkxKvRn8nPj7mZYgbaRsIhc86C/P7HPH1Ti2Tcj7ZrQwAgx+v3Cf0gqqx1zUj6XJIn
         RZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CZ2sF011bYx56k309E4sDnRFziIX937z5+0Drmm4Jfk=;
        fh=HSJnnBMm17s4zEOgkNXcbqkixxgWHi5eE63ee0i2POQ=;
        b=ap5kOHsbcSwfpyswyHG4Olr0iJ09712v/WAkuc0Jy1DrxtXZ/msSFipncQQ+7akszN
         jL8z65v3poe+n6AeHb7rOK8OL87JSyzjx1/hNTydgZzE7iZvchdLDTFdXvKLnb40FuJx
         rQJUHTbaupn9QugI9+bJhyrk8aMLZfFocEqtsgvhFqaXTu4TqmiKCgoJdGPvnblb4dPJ
         u0P2yI9GhdU8qm0wa+IwwvXw2dKyE5Xto5FQz3KaFJNQ8c+h3fqzIzyuAbjgR0wZ8w4X
         0XwhwneJGzwTajvyoDQQYZJVl69OaelFS9tQGY1p9716QLjQrVIDU7gC1Gc+8tlEmgpx
         fUvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794412551; x=1795017351; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZ2sF011bYx56k309E4sDnRFziIX937z5+0Drmm4Jfk=;
        b=GnpzOxUy4rtgzNNLgX+1nomUXNuIHp53Bb4QeqNZPr9C0BESqjTBblv5P88ZrEwhNJ
         HqdI/+q1RiCVzqd7KN9qo8dEi7r2EJQNlVpb2Ujv/6H11S+0ut49gOPNZOhTF082qNzB
         mbxxOPQwperNCfSTnWDebONPUWXcTrpmtOs92r/iFhpRiILu41A83Ukw516mYwpJRSBs
         n3TzOO5dPHdeBs5g5sDSAgPrz3ecXvlJEeQVoY9eFJICeZ0BW57qyYWxQcRPNI1ma48x
         bJIhSBVuXPJEeZ3PQki4fT8C9KNINmT2wucIwT/4ByDuqd53YDhOhX9SNq3PN5nDQ1fE
         +jCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412551; x=1795017351;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZ2sF011bYx56k309E4sDnRFziIX937z5+0Drmm4Jfk=;
        b=hjxB6N2dYDfAuVsvDXx+qq8obVKFDnE/IS5gwNAgJBn6jQE8JGYwhkvUkgReZwCxZN
         rLZZTAbMvOrf1eWNYyPzHnCJCT9NA3ga6fnfwI1W//5N+VDHxxO8wGKwhb6MJXT/DYQu
         dS4KQInRu94TccQ3t79jCqAUu7RDsAWx6MeDq7MV8amylmTzj0ha2OJhL8AHjPWVBJQp
         j2vvnQQiNUePtzf5F0CI+Bdy/ZkckjjEAbB7gaZlTG9mieg8Ty8JsqItbQXf4icXpKio
         nCPsxxjfBVstu/5Xxx86NyYqYvVD5FMB1e4eCX3RruNuHogQweMnEuFsjYwsmNFzeneO
         3GQQ==
X-Forwarded-Encrypted: i=1; AL+hErEQZ63L7rVX6R7MTglLtSYad0v6GQfC+yH8Ull4G7HeT1RU/fR64xdxSEMwFbGK4ir9u68QaG0gFrWNVpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VwR17Ih/mmoTyFc+u3WN/Rc4kJDULsBf3Bf4CCWKNSslPRjPQ
	zKTLo7OdGWISsnyBntIpVaXitRaJ+K0XI1I4mhZ8Jm4SI0fsJqgZ0LlNJWwovceYv4V0hWx5Ztp
	dQ1nJS+gmzrsT0/OaIv4/jfxKwOv/Ky0=
X-Gm-Gg: AYBFou1fnHiH+dsaw1VXYrAq/QXs3M8SVo3cpZG9TQb5h4+qUzy18as8Zn1eN/Pvc0p
	Lf3zNQtxcjpa2P/U6nHNuyPVHo5TAYaWqKZ8AukG22vLLw6h82haB+fBpOez0cLHyXyT/dSJwNE
	P6xmOwaP2hfva0UoZuh63bwhtZXe1mvHvRDrIwxGZuOfHByKaeEYvNqGA4ciOxhMOPvFhLZjLBa
	roDTS8PqSvVoEyq2gI0KW8OFEhKWO17BcSgFhaJS+IrzsXgqwQDSTenLb2dnZM/HBk6aQtId8nW
	SetNOEdDnazyjfud62cfL4H0ogi35KdiLWTusIb72zcA2YArPlJF4ZSteh7EZOrWtyT1vLd+Cfi
	XHDPf/KS4AwqqiGVlFmp5fyM7GRna4pC9pzaB
X-Received: by 2002:a05:6a00:148f:b0:8b5:94e0:91a2 with SMTP id
 d2e1a72fcca58-8bc1b6ff204mr3147477b3a.10.1794412550801; Wed, 11 Nov 2026
 07:55:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com> <07e6065f-d31a-47ce-87a8-dee76d545c18@oss.qualcomm.com>
In-Reply-To: <07e6065f-d31a-47ce-87a8-dee76d545c18@oss.qualcomm.com>
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Wed, 11 Nov 2026 15:55:38 +0000
X-Gm-Features: AclHuK_QWl5tUYuHPvePYN4KL-2u0N35nbHD37mi1vC9QZALV0h2AcZUI5iIE98
Message-ID: <CAEo19OgY+iN46pPrGYyCCKoRdAkhLmStOay0Ggd=SVbqRjOYOg@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Add Halliday to cpufreq-dt-platdev blocklist
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 14:48:57 +0800, Zhongqiu Han wrote:
> Nit: It is better to use the "cpufreq: dt-platdev:" prefix in the
> subject.

Thanks for the review. I'll update the subject prefix in v2.

Best regards,
Stanislav
