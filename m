Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41143F081
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544321; cv=pass; b=mbXvJ8AwUzUKpS2L3OyYkNVArwmydcI4ql36ewXxheSbbgDulr5mvv9wt9kJvR5R/Eg046vswH2DNF2PzpHQmeSXBURtJftUTuyEUp8ydETRBeux/4/Utr8OmbxG+/NknFuDasf0V8lIzH/Uv0PvtOQK9k2TSNPPtMyfqJkASZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544321; c=relaxed/simple;
	bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=naTGL6tCbAyC/tfAuGN/KjgWPXJ0v3O/USmy1chMVvEBE3cp4gagbaJo1pqR4LagZemzv+G3wGy+D5DWkGytUUQTWe03KpoJQ4m+BBBu+fOuZgvvE+WJnBiu/meArB/yMgKzHRmTKBCZ88Lk3ve7UgZruTbiYvXKimcNc3070uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=b32oWsj1; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="b32oWsj1"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910537b51a0so4501866d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789544310; cv=none;
        d=google.com; s=arc-20260327;
        b=A7fOQH5kxWbXkBFeZjq8My7tfG356VIuju019I4MDbWSJqK1hj8I8euRZD7hNGkH5D
         ++P5ef6Fp++YUfsKNcMHdyJ3QFzzpXQjxPLCL1roE5MGdHKN0E1GfWFEQ9LP8JGvNmHy
         +6Yf7lTk1d/HfJgsAep0pJOmorfAmlmb4ULd7J870/vt9yXpn8yasGFo4Fj5kOVjF46J
         FonnKiacGteJq6a7rxyf3KM67LkNgCXgswISImgBSBwkDzKUNppVsE8VLEQL8KzHkPEi
         8QelkmY8b4LRgk9txl/13+FBE8yejcRXO80wjl78eBgbydfwTddCplPA66t6xC3nD262
         AwDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        fh=5SUiop5gFn6oJ9C3ivkokm0nr3eMN2WWX3RJwbR5Aqk=;
        b=aYkMPgSVgJ1Z6DkAt0OkP+UD0UH5p+mPT4Za9XUmWIQSUzx+bqPK0P/F5Vx1Eik5hK
         GapNX/jAA0tfDgXzyp5RDbrGdYq0k/EXVc0bUkamxvyhHAj7oyKPWirKenaLTCQLn57L
         yAm4woZsGOpO1NjRQB0825Kb2kcwNBn5NwMculB8nJ3EJGu/D5exEB44P9IY+Ks9gK+1
         PPmucC2iEU+xCACR62A4TuQWOsDefMYV2GVb7wMtvDrRdKndOIJhPMwIIeGpaHKrfU4N
         ZLg0baM/HRo8K4Sj9REHetE+y06ERLsg60GBdHQ7uLyR8iLRUBXWpeabbrQ33XbsbsJ+
         k/uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789544310; x=1790149110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        b=b32oWsj16mxTGEh19RvHUbkJHkIwah2h4TxsF7HLpV77run0DEsVR+XTo1qDJ8oa4T
         Euveeympooh5Xdh/tx8nLhieBUztvkwi59ZmqrtrstKXcuKX/8HePXbWUDJtk92OnJ0t
         RYQo1azCxSMHljt+rD4MxrYz6cmXmi/Bjp3FCAwU9TDBzeVW6U0Mp83DglrETsfFfhIj
         12oLXDWMbFw+aK5Bo76A4EtvXuW/tG46PvDMTssINITG81T4a6/Z3vmpa5g9Ymldbh5X
         uYuSzKKtasN/Rd2D6iNOLKOddvvF8PRXU9zZFFzLa36hHU6vF767LIHV+9f3RHeqFu5X
         An0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544310; x=1790149110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        b=nb7NEMfO9574nVnwL3szOZsIsAtAHNR1Tl2It23WHy3EgX5hKn+6OnhT7ttbbhIYZj
         SftrPcZFBKl+uj+GbdpUg1Be7MsyJJEEzBcVpo+kHAh8MS5RCWlH6AFNn70DvdTKvdRz
         4587G29k6PQ9bpObYgv6PLUkrHRYDztKXdElV2v7ds4bbCIHO/byTdJKxl4uYcqmof+a
         W34HYga3XXwtxbIYpjEkQWUHyKAvlXeaImZldndEyKrT3Fa3bMaSxrak7Ylsk8TBPTpj
         p5vV9Hed2SDMIUjKnJ4QRcpI13HCxh8vtUc7BEvHzfr44CP4YuiQcJO3kwZD8rkiQK/f
         ITQQ==
X-Forwarded-Encrypted: i=1; AKwUvBytIzhaiPWzxXNdmrJBqjGdz1egAZ0KJrYolPhF1egzIAFYvoQrsWk5W2VotIAs6gcD4FbedaF3r6B4xc0=@vger.kernel.org
X-Gm-Message-State: AFuF++mo8Q07BQnDBvpMpuZoiR3vbGqzbSRCdAkJ/hcn86lUhXF1aMib
	ITGPknBgveZ+C5M44ooEAokeYB2PNOLORCn8e90oMd/pqZtzy89xRBw7lEkhmhLbkIdC/21PkA2
	gFbFtRSUhlyL1AMkGTdB678DxP476lNd5WDRc9PDlZg==
X-Gm-Gg: AYBFou393eXfpD2W9zJFUbuS9iLHpOvXWNAWS3OAWQn6Wjjj9oD5MgJpt7QaEE3TMPm
	qZurKxWk3eq/iMCzuKnCIFzyAXxLFyOqPRPj1jI95Evav7w9+3ZKkTiruTHnEO2bSiinVm1hA8n
	6l3avU60tTHUzSehkP0Inn0OS3/gAIbdUu3J9DRDmRvO2I+w9osIy2061wzUFkvQSYapWEpt3+q
	AVJKe6dx33/Lmv4WgL0Wm/eFQHPC8SmlC8DursiEVVjclSNG69L9YbSokR2T/wP3JQTKoWlLCIT
	SX3gRnMsAAFebAf4YNXfEdC60nxxQlPN7axnfuGXeulVcIl1IBEwAAJrZG1N0e2mxHTPEiGNL5z
	3RREdA6iqIVow
X-Received: by 2002:a05:6214:500c:b0:910:6ffd:a941 with SMTP id
 6a1803df08f44-9123d721985mr29575576d6.5.1789544309746; Wed, 16 Sep 2026
 00:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
 <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk> <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
In-Reply-To: <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 08:38:17 +0100
X-Gm-Features: AcwNN1Vn5ljoRLzFV2GiG-9S0jHlKDZRzXLPscawH2jK-lpFtONtbul3vK317do
Message-ID: <CAA6zWZ+tBBWdsZFGySWFsRKFq-FYy36QAYVQtUOPZ4GVGDYudA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dma: qcom: use named initializers for acpi_device_id
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Please update subject, correct tag is dmaengine
>
> dmaengine: qcom: ....
>
> Frank

I checked the history of all files touched in this series and all
existing commits are tagged with the dmaengine tag=E2=80=94I'll have to
correct all of them. Usually the tag/list name matches the in-tree
directory name, which caused my confusion. Thanks.
