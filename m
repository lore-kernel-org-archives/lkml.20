Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309524;
	b=KzPGku3qk7EQB2qbBWqDvilnE2QociRSe9iJI0Pk4oxvPpvanzHVRGBl89M+9TcSMV5m
	 yAkvCSW5ZDE/kOYJzHVONfp/m25dfGNN7Cqm9TFJgO20rwYOUp7nWvjHm3zXX1z8TKHKy
	 Q1bKOb3TZvpQYZGgBVAHkq2Y/ZkcJ0mr7sK5oTXIel9lVy8W9wdIeZ0DBVW9JjMrSV5s8
	 eZQ+lKC2YJQt3hisgmBK1WkWaA3dY1V0hLmLEOuHNKrrrv5hM+dvG+UXTNOr9gP/Hf44D
	 I62wsjKtSXnYr3PswhBYPqmlP6y+Yi4oX7OZaN7WzDmPqqRH43oiBLVatd6eje4mhXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309524;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lihVjw0iJrxJh6yjkrGWB0Po4chCl0P+JcexEjDc7sk=;
	b=F0DkuuX6D85iMXKlg9Xmv5y7K8ncSbZyFa9SBMvs4ofWCCEkDAxDRoHi1eOFPUG97uXd
	 59lpQIdOibkh9lKbGybLN/RN2ridJ8xwWytS+Ew8cNurD8pKOsdgZNzu82LY8q9cU4Q9e
	 85n7g5spJ2aP8O0qoK0n94bGGHSawezI21G757g1qLKZAutKJ79yiFeJpxj8hgxMKa490
	 gkSoCWNLiK90vVpoCpzXXaOPFEsKrLqmhRBcg/ZemWqMcfWUSqTzx9zbQiWZWXVpMOdQi
	 Ll+ZYx9L2fn51iNQ0Spg2QVsAeaiqaGtNu8qy5lShD6jk4ia1ah3ElX8kgknLiwUujg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=L0AxKEyb;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6B2606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E6B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=L0AxKEyb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lihV
	jw0iJrxJh6yjkrGWB0Po4chCl0P+JcexEjDc7sk=; b=L0AxKEybWkmefJenw1/5
	GOwYwRPx7FDgD5MoJWlqaukVneLVPMhHPtn3AdfrzaD5ofYYEj5cy0hYs0/48xyt
	tegSOwrpyhSPVqlmwmH2jdvuYfY4gVWKOGbkb2skD1RQTm7fkIWuos62F7DDWRBa
	73wO3RlVpJ2Wt/Stb+EZ9MYbcX9Zejm6L3vyFr/iOvVQMVaqk0og/PUQCMsDiS2P
	osIExAKNuD8WgrxS/QCdnrtpDI6JRlWWZHdvaAkIbnYoaYta3++Js5YpWg6Zg9EU
	EJcy7MFQ92/mLjDHXl8Ht8bpj47Wjq/zBGjAiXqtmURL5ni8R8qn6mrGFmO4uoif
	ng==
Received: (qmail 207679 invoked from network); 10 Nov 2026 12:18:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 12:18:40 +0100
X-UD-Smtp-Session: l3s3148p1@cOeOPepfdIsujnsO
Date: Tue, 10 Nov 2026 12:18:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Aniket Randive <aniket.randive@oss.qualcomm.com>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: qcom-geni: Clear stale TX/RX buffer pointers
 after GPI cleanup
Message-ID: <avL9j9GS565kip8A@shikoro>
References: <20260902-i2c_double_free-v1-1-0f582ef32e55@oss.qualcomm.com>
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
In-Reply-To: <20260902-i2c_double_free-v1-1-0f582ef32e55@oss.qualcomm.com>

On Wed, Sep 02, 2026 at 08:15:13PM +0530, Aniket Randive wrote:
> The TX and RX buffer pointers are reused across messages in a GPI
> transfer. After a buffer is unmapped and freed, the pointer is left
> unchanged. A later message can reuse the stale pointer in the cleanup
> path, causing a double unmap and double free.
> 
> This can happen when a READ message is followed by a WRITE message,
> leaving a stale RX buffer pointer behind. A similar issue can occur for
> the TX buffer when a mapping or allocation failure prevents the pointer
> from being updated before the error path runs.
> 
> Clear tx_buf and rx_buf after unmapping and freeing them. This ensures
> later iterations and error paths only see a valid buffer pointer or
> NULL, preventing double unmap and double free issues.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-andi, but maybe this should go to i2c-fixes first?

