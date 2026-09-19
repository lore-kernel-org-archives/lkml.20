Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FE23242B2
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789828754; cv=none; b=R+PlV+MVYerb0wEoq3bYQKmB5NfFt4lWl+BdKnzqT1C5X1ma3HPTDKlK+cMabur9R5aNK6OpqrHkZbgXEwGvA4+hr0EoX32xCgnKIvEoPs5dQ6JQGJu/pwoK+HHJzTEE7FkAKw7GE7qZLjWq9q4jub3qD/7yQxFsYrL2cL8AnMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789828754; c=relaxed/simple;
	bh=J7n75dlxtos3+ITb9g8BdRmQ8irhbat1c12Yu0oiLPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OFb6r38tbqppeVA8MUSgFCK2zxI6arZnGeLUXTFR2nIdIPwXQLBdTe69JFz2mm/q8PDodlbIIewZVZT2geB3UILNZb2LonorlZGWLGYZ1l8l0ZgVryeyGZyo6fS7Y8tLNViwWklexTmYgEOHcyVPxq+l70QCItOQ49qTR0D0NXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com; spf=pass smtp.mailfrom=idkmanager.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=idkmanager.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=idkmanager.com
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a4fb331cc0so555670137.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789828752; x=1790433552;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7n75dlxtos3+ITb9g8BdRmQ8irhbat1c12Yu0oiLPQ=;
        b=x6jqRCTAfSxFodohYiX69GEpSeSyEMlqCSwWvmxzGKJu0ltYytztl76SEGw25F1oo9
         aGcUCRU3hfHLFOlTPnUwLnFWYrWrbFKRs9rfsvWqEzvuzpRTAyMCKmH7aafaDJ1lhq6+
         eLgQrWTRjc/MmTdJvZ3hPh1giMH9Q7T5GRhveLxmTSbvxabQ+ZQ4DVM3RAovY+A99CYO
         8GVezcUVX0GwflI1aUn5a8Co90SFJWmwPYSIoHJOOWaRPf51TgIE6TJwmNcIXE8fB02S
         UsQOSyEldHQ11LhM0FfZ8XsIRnLm8qxgkAFQLpkqz2I0fPQ0FUcnCpCnq5qzftMOwzVV
         EbcA==
X-Forwarded-Encrypted: i=1; AKwUvBzCNmDxUlKCRWQM0usjAJ2l4n9B7l5QwEnnNvOUYvjSA+pyKeB+oCCp1YRHXCQ5EDTzu3X6L1v5eU9xxlQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m37mq4C0Fl6A1PX3dics4WvpW2fghKcfKCNc8qnUV2GDorM5T8
	y2i+4jTms0iawud6gYMBp4Z5Io6gyNzC+ndlezMDiDpbSaVIYtp3ugQEsBLMlREBGzGcqOrgNMK
	HyMq3oUVtTw==
X-Gm-Gg: AYBFou3ozo8ymlryK5fhsqeMORyorBGO4jsgRShasDuQ98hmdIx59Mn098zyVdbXgTC
	Lcx0EGS47VB+LBnyRRvxZknSnqhXH73w4yhEjtMdGS70+dAQE93Bk3JbNO/nTDXrvCH6Nt/5wfq
	spofxbySzA9GdZqHcvrFCm1dNV/KWJqsXowCyddopJygY6ONe2A1mI/SmgXK8ARXvn0lGOfbsFQ
	NHIC+WNw2zyEx9L1gLL20wMGkPg8zhYUDsL1j3m8FD1hCPlG/ZG0hFHWdShIWgJjtXij48AEXjX
	afg+CxBnPKjtSCTvlVmGN0PPhQp8zZCBkW1sJmrrKqbLw5YAX2KO1IF9Qm5yGpmUBx7hfRqww4x
	1QspOFyLTVpNDmupehozVU2oQbfOFfrnYUDC4jXJOl2s48uLC+Y2AvJ6LcT+RB/pOltYQrjDkKv
	p9rDsqVOCL4lx8DKgBApe3huuLmsyfuHN2JWzdDTucrp+5kOZe50RMw58Eu3Ixqj5CIQmMtFvaM
	VKgthkOkL0btt64DUZEqizMkAv4Qs6qj+UZlWpu7fy3zFjGHvufGmU=
X-Received: by 2002:a05:6102:5e86:b0:7a7:195a:1b29 with SMTP id ada2fe7eead31-7a7195a1f70mr420888137.35.1789828752044;
        Sat, 19 Sep 2026 07:39:12 -0700 (PDT)
Received: from [100.96.0.25] (corp-190-12-36-222.uio.puntonet.ec. [190.12.36.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-984b4ed2880sm2969614241.0.2026.09.19.07.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 07:39:11 -0700 (PDT)
From: Ing. Alfonso Kuen Arroyo <gerencia@idkmanager.com>
To: Maurizio Lombardi <mlombard@arkamax.eu>
Cc: Maurizio Lombardi <mlombard@arkamax.eu>, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] nvmet-tcp: report a bounded MDTS instead of "no limit"
Date: Sat, 19 Sep 2026 09:39:10 -0500
Message-ID: <178982875024.43804.2680537645505838340@idkmanager.com>
In-Reply-To: <DLJ4T2GRQSA7.1NN9YA9M8XUDK@arkamax.eu>
References: DL41D2NGEUHW.2UUHTZ6LLM9X7@arkamax.eu,
 178978683646.43804.6940923486189370705@idkmanager.com,
 DLJ4POIDTYXQ.2AOJP9BJAWEOX@arkamax.eu <DLJ4T2GRQSA7.1NN9YA9M8XUDK@arkamax.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat Sep 19, 2026, Maurizio Lombardi wrote:
> Yes, but your patch sets NVMET_TCP_MAX_MDTS to 8, which means 1MiB, not
> 4MiB, so a 2MiB command should be rejected, even if it's under the
> MAXH2CDATA limit of 4MiB; or am I missing something?

You are not missing anything - I mixed the two numbers up in my previous
mail. The patch advertises MDTS = 8, i.e. 2^8 * 4 KiB = 1 MiB, the same
value nvmet-rdma reports, not the 4 MiB of NVMET_TCP_MAXH2CDATA. So with
the patch a 2 MiB command does exceed the advertised MDTS, and today the
target would still serve it: nothing in nvmet compares a command's
transfer length against MDTS, the only rejection is the 4 MiB bound in
nvmet_tcp_map_data(). Sorry for the confusion.

> And indeed this is what's missing, because the specification
> explicitely says that "if a command is submitted that exceeds [MDTS],
> then the command is aborted with a status code of Invalid Field in
> Command."
>
> Maybe it can be added separatedly with a dedicated patch.

Agreed on both counts. The enforcement belongs in the core rather than in
a transport - a transfer-length check against nvmet_ctrl_mdts() when the
request is initialised, returning NVME_SC_INVALID_FIELD | NVME_STATUS_DNR -
so that every transport with a get_mdts gets it for free. It is a separate
change with its own blast radius (it turns a currently-served oversized
command into a failed one for non-compliant hosts), so I would rather keep
this patch as the "advertise what we can serve" step and send the
enforcement as a follow-up on top of it. I can prepare that follow-up if
you and the maintainers think it is the right direction; otherwise I am
happy to leave it to whoever prefers to shape it.

Alfonso
