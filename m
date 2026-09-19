Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5FE179A3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786839; cv=none; b=b78BD6uNJdzuj0U3MwbCUxtUhWVHPIwVIckAwjRIIoQuEP+VbqSr1IWRdWlpn2no+zEefxZ3dzworHNgN/AnDv2l8sy2izn8+bbYwdogwLg+MF7Ese1rf+13MZN5gaV5r5ESeV3HX0qXBjSUbTKJTZ93nyYNi6CjTXlyPmqCTeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786839; c=relaxed/simple;
	bh=BnvAR8q2sSnB4DFCyBNXaJ4MkqZefWdj3cCdrL6j5rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OlvNPxykXFefpYIy87Fyt5kbysTfDA2TeTYxp+y7ExGar0mr62b73t+0QAoYg7u0B5x8l0K48WFdgDbP/0a2EFIDNyNPvBm/fcNEsa3745kMkD6POEZmGwm5xY7wEe8aVfjruRReE9ngnhbr3ZPdPXzEmylelDx6k68OROZ/Kl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com; spf=pass smtp.mailfrom=idkmanager.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=idkmanager.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5059fbso457264e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786837; x=1790391637;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BnvAR8q2sSnB4DFCyBNXaJ4MkqZefWdj3cCdrL6j5rQ=;
        b=bwYSn5hP/1HTP5eOu/4+zOEhvCuUHmY4vy848Eq/yDFRYaMZy1GffE1A/YRpnlympW
         sv8BorTZkGq1Vgr67R1xU4eSK7MHDcOXlDWYzwAJxOXq5MRf8cnxDgJO6kQEzivkmppT
         rab1aZlmjxLJe5xzz7KsjDF3ix/F+NtWkLXL9u/eEhLQSm/IuNW61zuUFHoiGhT6NfZt
         uyulGrgwlWzbAUTz5empehKNZx4pnx0JoFSk4Y0YjVjc1ymg4jrz1y+Aio3nv522kD1R
         L4tep/jxT8nzTxfvzGdVRNLSN5yDkz0AqlDp7hfnLNB4LS104MrVeD2u+TLgiOi+RbL5
         KG8A==
X-Forwarded-Encrypted: i=1; AKwUvBx7Mykhlv66AS65ZFy1x27dKsjZNbWq/5A7eb7+tRxiKFgIrAFgdAFdud61/9uSQYhj5yeNgZCm0pl6ufw=@vger.kernel.org
X-Gm-Message-State: AFuF++mptzWI9dVZUBTbjBxhZGiF+3J1Sm9AVizGi5+vVL2nyHHtGYdw
	EyDHKjvWkT8C73GxueazOAmMfF51l7047c1x79a5xSM2lMEzkpU09U42+4mNQpLC+rI=
X-Gm-Gg: AYBFou1FK/fsDO46AllV7Z4A/t6LDa7NGY7huAzo2HL9pGvIQazzywNAXaZuxiALYsJ
	zZiRy0X35ObtUpZsWjnhbUBG/Hp278eCNZk63pCen6w9RdJROPTfuVt+ljTnXNFW230HYQz5l3y
	DdSrxrjOn1dONmO4K7C580jyBcSh0KHkXIj/UL/mPfDXZ0A1MACpivDfAdWYFRBJ+HQb8Lyp+V1
	8ONzDYsvCPpiPKGoZ/HU7raMpnjQYf5DOxmzIBHrVt80yhrR8baIUmr0vJO0ej2rif7N1P43LvQ
	vJBGR79vDf8uJPE8miZKVF+uszgTulDjtyd8hL0SQ77utdECbvhRM9Tp8HF05nk155ezVSrIuYo
	3963ZScZpKYzZOTaXwn4bf6emR4Vbh3wzxRtbwTN+28Yjyti72xvaUTyI9v7OSHcx1m8M3W8Cet
	mEJjg2Lk7xPLYAv0r1NZietk7ZonMpcMSNYrQ07lpDr+n++260PORe1Rzpout+XkRmdlklzoYc9
	dE5o3uIlX32nqrRgntrKmVQKjl46cn5xSl739OOwcDLABL//ROHB50=
X-Received: by 2002:a05:6102:3592:b0:7a1:f980:e938 with SMTP id ada2fe7eead31-7a55d284613mr2150925137.20.1789786837322;
        Fri, 18 Sep 2026 20:00:37 -0700 (PDT)
Received: from [100.96.0.25] (corp-190-12-36-222.uio.puntonet.ec. [190.12.36.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-984d5342f9csm1418996241.7.2026.09.18.20.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:00:36 -0700 (PDT)
From: Ing. Alfonso Kuen Arroyo <gerencia@idkmanager.com>
To: Maurizio Lombardi <mlombard@arkamax.eu>
Cc: hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] nvmet-tcp: report a bounded MDTS instead of "no limit"
Date: Fri, 18 Sep 2026 22:00:36 -0500
Message-ID: <178978683646.43804.6940923486189370705@idkmanager.com>
In-Reply-To: <DL41D2NGEUHW.2UUHTZ6LLM9X7@arkamax.eu>
References: 20260829013900.10392-1-gerencia@idkmanager.com,
 20260831005117.142713-1-gerencia@idkmanager.com
 <DL41D2NGEUHW.2UUHTZ6LLM9X7@arkamax.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue Sep 01, 2026, Maurizio Lombardi wrote:
> #define NVMET_TCP_MAXH2CDATA 0x400000 /* 16M arbitrary limit */
>
> So the comment should be fixed, it says NVMET_TCP_MAXH2CDATA is 16M.

Agreed - the value is 4 MiB and the comment is stale; it predates this
patch. I'll send a separate one-line patch for the comment rather than
fold an unrelated change into this one.

> Also, it's not entirely clear to me how the target enforces this. Suppose
> an host sends a 2 MiB command, violating the MDTS setting, what happens?

It doesn't enforce it, and this patch doesn't add enforcement. MDTS is a
limit the host is required to honour (the base spec says the host shall
not submit a command exceeding it), and nvmet has no per-command check
against it, neither in the core nor in the transports.

What the target does have is the hard limit in nvmet_tcp_map_data():
since 4a3f00262a04 a data length above NVMET_TCP_MAXH2CDATA fails with
NVME_SC_SGL_INVALID_DATA | DNR before any buffer is allocated. So today
there are two numbers: the one the target will actually accept (4 MiB)
and the one it advertises (none). The patch makes them the same number,
so a compliant host never builds the command that the second check would
reject. With MDTS = 4 MiB, a 2 MiB command is within the limit and is
served normally; a command above the limit from a host that ignores MDTS
is rejected by the existing map_data check exactly as it is now - only
with a reason the host could have known in advance.

If you'd rather see the advertised limit derived from
NVMET_TCP_MAXH2CDATA directly (so the two cannot drift) instead of the
constant I used, I'm happy to respin as v4 that way.

Alfonso
