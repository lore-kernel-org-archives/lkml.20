Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A7F4D9F78
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361722; cv=pass; b=IOZLkyqGKjcP7r4aBw9m5cCWWE+OTxBCZcdALZtlx2GmAAADCLOGoAkPgisPM/laBznUKYwovPhteeTdpzZyWAn9himiemo/u0UqK2vNKjOvxcB9v7uVojtrDIxC3cqp9fZMWTeh408GhXkv1oZns/yFgQumDanxGCmdlX37SYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361722; c=relaxed/simple;
	bh=jS49fELDwpiqild1Uoy3Hgh8ZGEHWDa35yUd9f04Zzg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ISAbxz1T9ooIIDitvUAHRgnt0zcZ8vjOAghW4vfAuR0zq4eUMoQrsvoNYMJ6xj5IlF8X06HCzmjbISYzZKgcXYOlz/gcdmZ6/voLjmW1V1Aq/mXp08BSg1wpt4OfbNj1qEpCbtkTNxntVsDVR/vmZdegkA3EcTVXvy3QtGnsepY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3MAypkI; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3MAypkI"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so193776566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361719; cv=none;
        d=google.com; s=arc-20260327;
        b=j9+lLzChRPZ1P9D0XR03fwAP84YBXp4no7DLFIQGXLeeMHRC8GugEH9C0WaLuzuZPk
         xWNisvIO/JTwnQOofKKZyyI6SmR0bu+MwyGrKLHj8YL06j25eSr1rNBfDDFMoJ8pVrFp
         gt1TBCFn1V3No1Dn6qZaOw6mOqZBG2080Cd9vsusSt7GcErju5HVoPB0Nbi3xHaiWcCx
         1MpZJwnyoqE3MwYvzSZgrvexIqOeNUQSaACewQboMKOeowK/mEIhYYPox0LVgkqZm3lZ
         g0BV1zkNupWh62eMD+uDpm0xU8dmJmmeG+kFF6qfEBa3ssyWa36y6elIh1FE/UwL/ozw
         iaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        fh=oqhCQ79h4maQsn7cXZ6WUmuD0VAP6E7BeM3Z6R8TGfc=;
        b=Cn8g1llktqI6letnc1qGoOuam6nUFgY/MWZ2nDzBXkL4FoRlyhL4Rkas+NYLkImy+p
         fXRohYutbeyfknIVWhssgwe86e84l7TJq6dc0DxQExhT1uHlOOxDNrgINvwaU+9fUE1p
         pLAq1Dt3gHxz9F3akeLyRJi6n8C+Ufd43uBxTO0xfND4pjtPH5FS0ODMrChrFe6D5Vky
         oxpDDK1jjLNrLroa5l/vTwAfHna+H6eIdI2vm2m6Dst9nduUXFlgXWDF1t0uv7Dte1lE
         Z40o1teAtyYuc67LrB4Ng5j0s1Pzk91TS8E3o+eiISNWOwafQYTh3X4q/ih7/UYvrNc+
         jDTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361719; x=1790966519; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        b=f3MAypkIeORLrA/NGmAnODOdbdy4xBiWY/idwSv8/FIPJLj2jjGHOmG4CfQaDizbdi
         qM3LJ/dWB2FalFhpFSguZVI+4zVaqPDSprhBmNA8XNLE9xxCxXEhmlFDlve1rdF4oRqU
         Ltl6DJqXBXi7KvmNQJYsG3YjtFEl1SIqTY6iXv3sPRh4tUtETHmnTJJ1ES/VANvUgQ0v
         WXvapdGJwxv5NpZaqMevMSCWcq865p5q5qIW0xH8pSLrRcT/obarz43s4rph//74rqIV
         /0BsEOvlaqpJNMBxzV6EWNu2LfTpauRw8ValL8mZJdRqaQLtFPx3IUFHj3YFcdsuX2tF
         W19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361719; x=1790966519;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qx7cDPY6jPK/c9DkQQCGcdifcKvknVKBtab/nVKa8aQ=;
        b=WwkMMSbDxV5NPPoeGrH7mq6eIxnXa3WuRpg7wXphox/sRZSBTCWBp40LQT8raQQwuW
         tshA3xygBB0rd6YgkiugJyenlRd0BrDqn11I6H1geLxG8q0/u9kkM8FCAPijsqkWVEqe
         ly2766NyV4NrTN8ZjWxgW01dYe2MPdTJjQyR+HDC9KkgnaET6dJI77VdoR/eFwdVdWem
         RsH5RgpkC/sFKdEuP9QEK8u2p3YuJU9Pn7Wu6CnHFkw1cFiKVWpyF4VJISGXG6TGemcr
         BxfNJiOfYailruhpTzNzbwc9WBLGbnCJxHgeNxNCKKoV2i5p5TYQKuOkfZjM6QgwEToX
         k3fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuoVHeNpASRs2RGp25bCvUOcyCNRL7s81syqXmlOzd4ljHL2eMH5IVo5BkWRW91D4GOlGoj8P0msi7ZNE=@vger.kernel.org
X-Gm-Message-State: AFuF++lh5rLQVa0fwHZuk3kR7FWlSxHuyCGYM3DofUU8K3+yBOMGB7oD
	PMv1YBW/Fze42Ctb+gPJdurA1ZwpBhzeZ+Kmej3uZ/c3mvqPPv9cpWmbShYqnEjR3IpwpdGOyFm
	/3g7yHug126tyUDdggwHKCDaRK2SDLV+n
X-Gm-Gg: AYBFou1HN/t5Zbsl1wZdG83FGqg4Bqhx27fzGHiaTqzI8wa0i1Y5RDKJPA+DkYNzgDh
	22CtVed6H4gSTXsDZfWjsuTamdET6F8bCsK1+DchbWp0mlO/V4/II1DhxXQ8S1ahpFrHX3+8W2d
	TcmZr1G0S/4WSsHbq3rFGc1wBeXqfqGd+ULoVEIUxGAxkLqSBCEvreBL6xRarak8YkWMknIBCN+
	4oELSrgVF0KGP8P33M9SKDXF7+FVW9k8EZZnupJbbrr/LzWNuK59wVPzfVfDU+MrNJqrSkoUWd+
	CW+RA/5x4U6dzkemg/UK9SFKAQdYRbhRKJNyXXVEF3OrHfaSdXfmxIzev+sA0jnUZkdmPrSpP2G
	DkUqiR/YVLxVUgZ45cceGpAvtXaskTQDStlamBuG5NERqzZKB8NjkhzV0yGrLu2v4
X-Received: by 2002:a17:907:6091:b0:c16:4df6:176b with SMTP id
 a640c23a62f3a-c2ac23d6040mr610229666b.20.1790361718505; Fri, 25 Sep 2026
 11:41:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:56 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:41:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Fri, 25 Sep 2026 18:41:56 +0000
X-Gm-Features: AclHuK-WuMP610jmp01dFKCpj0Udiol-MQxcrP9tYdnANDZk5EBVQKfElIsBHyg
Message-ID: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Subject: [PATCH v2 0/2] media: venus: fix HFI teardown races
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Changes in v2:
- Resend the same changes using git format-patch and git send-email so each
  diff --git header stays on one line. The v1 mail transport wrapped those
  headers and prevented git am from parsing the patches.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0
