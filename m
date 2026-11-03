Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714372;
	b=cAzZS/S68RyXE/AWgEATqKBrdW48/P2Ef2Kr7ITFiW7RR2x5L/biO6TqHnl+c0KiZDYj
	 CV4nfpRSAAh/6l8fp4dh1CXJNL8GXseWMJSy4WCQ4tTQH+Eb4rwpbndtwQMMw+Q9jVK3E
	 Ql6quU+PrcdPoGZBuCqzNHZydvTaaqeVI6NT3myGr7ywxV/Fqk5q0uE0jl/Ip8cUDzxnI
	 hXtrG229KDvSFLFUUbqFP6PKAof4HWmgvVdsYKIZO3XQo5EjRruo96adVxmacJtM49xZ0
	 u720/x5IRziKYY4j3eUN3BaObdIulCbuN0CnNjvXwJwtmAvSLT3+QgjANyfXUyqVExA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714372;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
	b=l7ydQPwSowmSGWmlWm9tK1P9NuUhUxx3aIQrEtxXA+q6C7qsx3PRpuXcqkJLSEV7zLbA
	 JIClKMH9MTuiBuODV7MhC1E5T1f4sL8dgeTZy7C8RnZA/a0Kp3uKSBDD1k01QkNVZ9z9r
	 PwZ603nGQJK0eVCHaJ0SwCvKx0kz6238gBTwejk21q0ayq+aiqnzLP0zq34cPfrpuQQbr
	 k1cAinfE5iLZTLWblC0Zc3/sePEWIk3QjzuL73j3r7h2ECITjSBDX91EoSVd31PXOkgOv
	 9WYsfKueGlnBF3B/cV25d+leBSVYQDjlZqIc4gOvazYVPFo3Ps1e+4O7WmhKn3CrQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RAZNGhku;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D1606D822
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE4D1606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RAZNGhku
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso782464a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714371; x=1794319171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
        b=hc3gQzj5HVGEnWYpuGWJiUYdVNPC4VNsHW4lo+OFF5j+JwBB/Sx3aVKBQLUDCSlRc6
         4/zLhQXympYktYOPqsqNB+y55cpRUM+49ZtvRNRsGA1d5nWRIJQQ6H6XmhlqEyjRJhdr
         BFcYc3ZwmzrnQEtK/JE32sjNr96ZjK9E0WoIjPeRJalxxTdL+8EDALqPBgALK6T4PhpK
         8X8U33qWpn/Gt48Mtd3fOzHXE9RMTd3fJXOHPJ8oFw0cjgDOCzz9nwxzSxsQjb1cjZTj
         1WzoNpIL1MWWKNZWd5/FK6C8WaLH7IC2byOz3nkCOs/ylsy9g77P07EAz+QHylTUwQ84
         r/aw==
X-Forwarded-Encrypted: i=1; AKwUvBzNHPXE9ryWLqTN5xzwGeR3CJXJ34tF0JmYYaeZ1RmqdaKyy+0ywB/sWaevQESF8PUqUbf+pDBlwV57+pU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pmWHwhHUdykLYZtk/+ZYb/wPtIcrN4N7MhNAtnJ69j6jXA4QR
	HmWANM17dSv6hUVc99Q/VVW4wyQD/D+ZNMVCnILB6CLiL3DJaG02Vdjz3Xcbl9fGNKRactla/w5
	JXugsY+BJg8TZ4dIoZdUVg8nWSf4DsHPEc1/9QV1/S4sYYIESdxTyHGy01jKLtNwyaHl5+EWF8v
	TE0DLRr9otupajoCZhxRbHnkUCl8mFrsgW8hbAXziQG5oPPkWDOxm8/yfZogEMpT4lAV+Dq9Dpu
	s7dzAo5xrg487862PhOuxo=
X-Gm-Gg: AYBFou3aCZAs3IdoJ++NUylLqek1UNkAm52Q1Xkugt0O7UKfGEA8WK13P+hsjbI47wz
	S+iX32nvk46UBcB+j60+6QAx9TeqvlsYV+WFf3c2IazKN3P+gotNW+l3jVKwDZ7GeNhsTrfasIX
	xFvWRPg7+0GyBJXFSKabRUjDyvSQrh+YiBHbPkiP7YS5DUmAUCAEMgGVHlzKmG9owYWzFGQBIfy
	n8SyGozJVQtRoDhfjY17H3/tS9fnLBFeYCt4PoobRxqqdsYNXhsaj1jdrnW5vMqfhkQjH/nPQYG
	NIU+7WWDJN52JiznZJKihYexWRjAEiLwG63E4mLbqVezkGYCv2XTE4YKanVkx1oTVnw78oglyy3
	44s697XVoJ3iEfMBlU86nUXDo/JIUtZQbWst+jrrdUqAA/hgeEpcbvvpZyP5EYq4h/nXHyB/Szo
	m+qsEJxOVy1DengeQmWGmgFbJCWURLA3al75P+FPs=
X-Received: by 2002:a17:90b:3909:b0:3ac:a203:e095 with SMTP id 98e67ed59e1d1-3ae89536c23mr10218488a91.7.1793714370959;
        Tue, 03 Nov 2026 05:59:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c4d7c5fsm1933118a91.0.2026.11.03.05.59.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so3930701c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714369; x=1794319169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qngkg57Ni1YhWMlAtKTzwfofY3KWH3EsG38ilqqk6Gk=;
        b=RAZNGhkubzobtBl4XQ6QFZ+ZtDKkdhhSh6Cx9T8qqPrlLIpp2UDEVY6JmFOwtgrnMM
         TCmFIzXB8qTb8c2uqPPWKqn7c3x0f0JV2S81PvfAt+vtQYo1AMDSgKqQOh8fw2b44F3T
         uctOB0YWbGBqphDVaGgiwxPG/yYuj9s+Er5kU=
X-Forwarded-Encrypted: i=1; AKwUvBzWyYlerib/xpwHFbPn9IvhK31bZDNWZQ+tluBvKF8Nv7pP3X3z9BZIGmJ4XslBO4MqMFcPJmbYk762Bp0=@vger.kernel.org
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr26545032c88.13.1793714368837;
        Tue, 03 Nov 2026 05:59:28 -0800 (PST)
X-Received: by 2002:a05:7022:ec85:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-1ac59dd081cmr26544986c88.13.1793714368146;
        Tue, 03 Nov 2026 05:59:28 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:27 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 09/13] wifi: brcmfmac: Accept newer BSS information versions
Date: Tue,  3 Nov 2026 14:58:49 +0100
Message-ID: <20261103135856.3676311-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-9-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-9-b5cbc2cde2fb@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:44 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> The driver accepts only BSS information version 109, rejecting scan
> results with newer versions even though the common fields used for
> reporting remain compatible.
>
> Accept versions 109 through 112 when reporting scan results.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c   | 5 +++--
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h | 3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
