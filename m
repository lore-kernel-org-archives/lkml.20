Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181EF2FC00D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569106; cv=pass; b=E0176YcQ02ZSxbswSiutiyT3GgvbYaIo51FfrZWvyzUBTI4+cu36LbQYY0W+GofQYiozHP7L1RvKijRGjBtkl3OZMGProJ/6jq6/oTZy8wIhEUNu7ISMwj5J3ozypuhJCRo+/G+k6sUC6wpNw2w5mfzB+Lr31cwnsVKKgzG/My0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569106; c=relaxed/simple;
	bh=DW6wbmUxstvUjLcrpQZmIK9RqXPWAOU7XHIXv6Rvtno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+avSRRf5FesLSastw7A7Crfw4zKT35KqWH1lZJudOurEFcXJnIgN83ibsECl964+gHJX26t0tSBXbcmi67lKfsNHgzjZaxlV0j8VXcW5nSqOP4yG7gMpKU9qkksta+i0rATeV0ZsaLiB0u/8Ght4qQmtA8oqjSxj2kj4u2wsus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyI9fs46; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyI9fs46"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d8dso1789a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788569102; cv=none;
        d=google.com; s=arc-20260327;
        b=GIpjBzDqMVKJTZO2I5AjKopjtxhv6vzO8I/5frB27c8siXYwnhlgoG4MugFUasMCVV
         zZa6sOZZaYYbo5cLelfquJXfYp4nq4Lh6LVYymtiepPLl8/AoO9NW6NcWhbSjSnU4gGl
         GbwHVYB9owQ1eUDpfVurTOJeHuGpRjVYKJIYW0HUvgm4JhG69AEWiZLZR08jHrocqZqx
         JvlOMUqH1Q9uvLPGlbp+BH5dvnNSgflGIksfjL+zUj6zrrdQrPPNBGSM2dgNxatxfbZ6
         5zmu/ZhdsGo9gZWmY58tjYfloYUbYeMgqJMe1z8DDmKx4REaxLYslY3SjvD+k9acUBlz
         BCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P0qdXiSaaoLWSkRGl4kXPpi2MGKhx4sNOFo2eMkbT7Q=;
        fh=vK9Iv+Pc3jGh1i955OBbTI+QrvWFFqR6ep0fQKCrVu0=;
        b=baxoeUdL+jmx00Npo8nwj3VV5LEOBol9vw+QtHVGsb04InpIrU+sC/+xnuM8e79ErM
         W+owbjlUUnGT8S84XL28XmbquUa3zYU+zuXUPdFc6MYGIVq6pc7bn6LwTSWSTtXY0K0e
         svdXiKI8W7S8FSGnMOhYLaJIIAv6Idr5+t7pYfNi3wSN+QcQYFMpqE7qYCS5MBUj/e2C
         /92o05btVR7/b5Ef1XG7oU+QH536Y+rfR9l5gBGRcqAEzjhMCuZh3NyRYRpH9Ur91IlE
         DcGDo0sndLj6pFtSnpPjY8FtMgDHVcCAYUqAa5zC4JV/FWdMutE2X6tu4ziO+3q1JNVZ
         R6ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788569102; x=1789173902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0qdXiSaaoLWSkRGl4kXPpi2MGKhx4sNOFo2eMkbT7Q=;
        b=OyI9fs46s9KMNJD7zN0urJ2M2pLl4IzvJarbo0V33R8l8ylqpl+3wEZEfwkXElkoz4
         21yBThMXt8LoGu3v2xbogXWB9+B+xIUmd8M/qipodHejCfYlyS8hdfd62LlEOOk+xqSg
         ly5l3fjwbyDs8MRaKow1+6UyH/NQ72+RU31PfGmrCT41jPfib50DlRzDqjW5Gn2067sa
         w8paSdpGcdO9f1XEM18/kNr+aGlRQOm04nKJar490EwIxSOa2dFCDem/CHTj7Vs6hISm
         EMtPPDpVU2jexo2y48QtYW0/C9aJ81cO9p3gTrvVpLoFx7ILMVH35lVkRYv9HbJlrs6k
         BkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569102; x=1789173902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0qdXiSaaoLWSkRGl4kXPpi2MGKhx4sNOFo2eMkbT7Q=;
        b=L2+qmXRDhVTn7YWYwu7b+HJaxv5vF3h6dqYft/IRPpmFBCRrqJ4g/5iWvdwhS3YE60
         pAqZepPBZTDqmI6NriCWA1dGJbrNfcVf5Fo0T8vYkTyWTjG9/AnlQ8XgjQK2vMnKPnL+
         bNnn3fAwKxF1RsFsn5wJiRx6wzvGUiMC5AxfPvCGSIvXEAuao6W/Uv6uQVaIj0xfki68
         HRORkpaxbRtKkJ29jkg7kq3eVaiJA0QbpvkJViRAZCAFa55JDkYlJOdR7n1EH7G7XEQa
         47SM9TOOcKpCFbqO4TzEcdoR6vFS5kpjJMQ1dsoCfYODf/zAqBT1zxBQFJPQ43fsK+ro
         D5NQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/72+r3JW2uUxY2BXNaDWGcVeaG7G5NDXgiKqN2OaI6Y7WJlGvAu7ER84lAmWBhpuZvF15wpAo66eSTh0=@vger.kernel.org
X-Gm-Message-State: AFuF++lZSLxrbT0FgMsOsNqc5L6CRbiYSr56Q6XW5ZVQbruagb5M3T1K
	bIrvNV30XSoZCM6ielT7GN9m9SmfdB+F8atDCeuIM1SKiaV+4fFIA2tcis1VB/MspSOrdB7t3nu
	zpZzlsbiB91Fm4s9QBC01s4Fe27HqRoMIqV0jPxrJ
X-Gm-Gg: AYBFou0Oui8NY64+StzqGvf4A/hVuxAJkWH9BCM8YSkDDrRHK07T/KkNF76+bKq4NXv
	aMVEJL6aYRmZDcyVGtZ/MWXmrqJm7h9dK888Lte3doUD8NTHOZK4DoPZQosLTcBTSlkssGhHKYC
	ND54hZdV1dewd1Pd8UK3qSWoJBwSg4lbfhfnRYrTLXArYOnNNzgn5V7Hy3mermTAIsP5Eq1gAYD
	PfsWqtJzS27eh1UHplHevn9unZS6uxh41ufGqKPhC/uKc29VVChdHG2gy7V/0oTvS4sMS5GpbMb
	mrVx8bQZyU/HCRwVKpAp1cABR6SeMG6HVUDkn5slzl/3gMoT/D3mVeY=
X-Received: by 2002:a05:6402:1a4c:b0:6a6:9d10:f52b with SMTP id
 4fb4d7f45d1cf-6a7f682636amr13303a12.12.1788569101906; Fri, 04 Sep 2026
 17:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-8-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-8-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 17:44:47 -0700
X-Gm-Features: AcwNN1UZwSKJ9MC3qwJwI8ljAn8Hu3imGZF6CsHrJI6l7M3IeDffrx60t7WpNbE
Message-ID: <CALMp9eSTK_m4XMyBk2U10dhQo-ve+M8CmToVyFcS40o7RoSX7A@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] KVM: nSVM: Advertise DecodeAssists to L1
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> Advertise DecodeAssists to L1 now that KVM virtualizes the
> guest-visible DecodeAssist state in VMCB12: EXITINFO1 decode data for
> MOV CR/DR, INTn, and INVLPG exits, plus instruction bytes for nested
> page faults and intercepted #PF exits.  INVLPGA's linear address remains
> available directly from the saved guest rAX, as required by the APM.
>
> Expose the feature only when supported by hardware, as KVM still relies
> on hardware DecodeAssists for VM-Exits that are reflected directly from
> L2.
>
> With DecodeAssists exposed, QEMU configurations that require the feature
> (e.g. "-cpu ...,+decodeassists,...,enforce") are no longer rejected.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>

Once the implementation issues are addressed...

Reviewed-by: Jim Mattson <jmattson@google.com>
