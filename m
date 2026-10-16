Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5684CCDE9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168741; cv=none; b=ArjCvLnGPNNwZAP8HauqGYKAeqZShQ5T8LVtOHUIDelk9mw+XJRlsylXr3x2cjA3E4KG79zDFjZ6jHBXS33HePlGTEdZXREEv7rwsOC4zphQO8BntWV2SBLCy6V7N1fTI/XOET9WUrYw+FTu7PDHPx4Pc8uuLF3c1OOUWQB1VHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168741; c=relaxed/simple;
	bh=FxEVgvNwgROcpgS40eg+/0VB4E+ZMgfspJbjmomvovo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+AvfK4H0Ujf5KOcO2GPeGD6Cc9DQGME4k88xxNT5x9r54gihsEt6DbIss36uA8leHe7Jnzyym5B98CyGG/B+wCsGxdJoyrpgjRXnb3Ssgl8yfvUPD0/GMg74RLjNppnmTPu6izRocssKBR9M8coZ4QDxTI6nCxsUlSCEcQSgO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKnrx4OL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKnrx4OL"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-872024e2b4eso78277b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168739; x=1792773539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quWXEdGzPaplUtxwyjvdAHT/D3hcP8quVKx4GUWHQG0=;
        b=BKnrx4OL+DIzDGhCeVXrHTr0Iyp/KL0z7B385yAyMaFS5fVHE16AWJAxPz90Ho4JgE
         bIEbPpCLE/ygKxZc+F7ZhzYrM3KkXXxlQ5/LHqkJ0d/FzE92TABFV47NEB/asOTSJ/a4
         8zWi7lJOpb+ABntEAla5+hwi2gI/fgubdCbwSmunG2YeH1Qr6plDdhOOTtP3WoYXyN1N
         GEhxI/Qg/9EjmmKu9aCyhCQM2Tv4mo5K1HG3PZFsyEYkrsrBCjssyNncUe6hy5GHsSsb
         KW2wfA2Dfsg/08CSLuKjdJjrEgz3BoQv8chlxuKRnfmlGHbyTFikjI5im3mXFYlgBq8O
         UWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168739; x=1792773539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quWXEdGzPaplUtxwyjvdAHT/D3hcP8quVKx4GUWHQG0=;
        b=ue+0N3u6FcWRIWU19/Ulwj2dL7CCCvG8zLm0PfDF1+13w4LUOWz42CUhQFuG6Gfhj+
         LGt9TrBOa3mkoxNALbWEWmqaihP6qntxJNOe0gqzDlBUKhWjgUrU2B5N0tVECe8g+ZRC
         Eo76RMDBCmwrSkCoteKUWXfYpx9R4i6k5Nug2e2NbgmFkXo9gix+bqcQ/Xr+9PSvSoi2
         KaGnsRH6WrS/0DNv9uwkdzNvYYzzxyUm1YKKwOfPZYC+BSVGVdSX/vR3EUmNkzOQ8AtZ
         wA+8HnxIUsuFwOyCbndUCrtINKw+I0Smbnil3tBjx8TTChpf/ebnDbVQ2KJEu1ywqQMX
         0R5A==
X-Forwarded-Encrypted: i=1; AKwUvBwm+QDRuBxyp4qn2fuNMVi+XgCE76cBI8SoJbty4YOr4Ww9H4lwiWoWICEbxFeSXt9cwLqTYIEST54nikw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdr3EUoEN4LWbf/Ylt27C2QmixBpe4xQBQEwveCQxkMJ/EXrGO
	ebAC/OM3pLnIj65TuL9iULLZVUMAez0PJV1t/qTK5IDPyjRh5Pe1Jy+w
X-Gm-Gg: AYBFou33vBFf6kCrLSegbFLEanyCWQ6+zPY2FjTUxQrXtv3fONCqIlGiZciSql2SKXd
	kIjszIuhWqg/yGoHJrTflUuM91nUxjNNlFZlDdFPRagtKmPsrB73mqpg4CSOPITOAB3SjlQw02o
	Yu6JdoS2dQxE3kLB+J/G9E9gaz/OPrKFFh/OXo+9pdEQE8KQczBRkJaKmeHMC9kEVnwUlPbEU3B
	0xmzslR57W9B+8fA63is7oX2KWDcjQK6XA13tr80QVZPMoEqbn7GrgQFeyhvW7w9LBUfrev+7TU
	apbkdk+T+50IfCgGNin0BZklIiAlACpdUCnu+ZcQ7mVnBXtJzkMd2yktZSukXpSY+F/IODQtxcx
	1+bAcCAYancv05e7ikUcXkncj9OUzTYS9n9GR7My/dTQsuG2vlMc5LllLQwFxF5M42KJJjDmAQV
	D6/axwP51ccdBrWiEkTfdV9Pcj8igL93BhTuyIssh7h1vzyaJW57fETQ1VUFVh1CpFT5Q=
X-Received: by 2002:a05:6a00:9518:b0:878:6ee:672b with SMTP id d2e1a72fcca58-8a04be3688fmr101852b3a.35.1792168739190;
        Fri, 16 Oct 2026 09:38:59 -0700 (PDT)
Received: from wyb-ms7e59 ([38.55.195.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f54b2eec9sm1406945b3a.8.2026.10.16.09.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:38:58 -0700 (PDT)
From: wyibo6109@gmail.com
To: Rob Herring <robh@kernel.org>
Cc: Yibo Wang <wyibo6109@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: input: add OnePlus pogo-pin keyboard
Date: Fri, 16 Oct 2026 11:35:40 -0500
Message-ID: <20261016163553.1069372-1-wyibo6109@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016131159.GG5059-robh@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yibo Wang <wyibo6109@gmail.com>

Hi Rob,

On 16/10/2026 08:11, Rob Herring wrote:
> Please don't send new versions as replies.

Understood, thanks - new versions go out as fresh threads from now
on.

On the same note of getting the process right: the binding
documentation in this series was prepared with the assistance of an
AI agent; I reviewed, adjusted and validated the technical content
myself.  v6, going out as a new top-level thread, adds an

    Assisted-by: Z.ai:GLM-5.3

trailer to the binding patch and the cover letter to disclose that.

Best regards,
Yibo
