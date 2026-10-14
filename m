Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8598A353A60
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958352; cv=none; b=oZsEe0NlwOHSuiP8jtGefciYWioyMEuKcahF5OhxtFIzFUp+9K5B0QmdmwJUn4/EoBCYn620WscEWGWo5ZIhuv0xGfzb6betvMRfEcfh+M1Mm6V7tn0TTZZJIY0TMOVWhSq1iNYmTplVorDFe/HmTitW/689gGcc/VMdRBQDvxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958352; c=relaxed/simple;
	bh=ZZ8YhT4vttbyAReWLwDYCcZjAsPCyQJ43qms/rc9dOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jx96kazU7W3kOYTWXYsN/6QmIqBBWGyaPu3hYDIw22VTrhtth3TrFjGdlukOLRjBTPRiqRZ3muzXF7MSsutSMrlBHm/xJcfasSlDtG4HkvOjeheapa2emKGBR+IrJRKV4X+tQKpAddnmrkULQYpfzNicocmCfx+Z9tXooQxCPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIoTe7H6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIoTe7H6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so3113874a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791958351; x=1792563151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZ8YhT4vttbyAReWLwDYCcZjAsPCyQJ43qms/rc9dOc=;
        b=iIoTe7H6VgKDcV2LZdG9OjmajV6SAJRxiL7dJG5U5TxMocbvVjrhJR5fn9JMHUTB0H
         8namQtdnWK/sIHrfpaSJHw9nCHeAucd6RHYBXcVuxh2Mg87OXAEMcFPIdjPcjF+CA2+2
         xbMO9K33WqQz+2skTzrlpNIL4MYIvZnzM8Q4I3qM7bzU5OTiU+c8+OEzJUr9BcknOxS0
         lodKTX+mBpDan2FoS3LWR9xMqxKxwtd3i+zkhYFrqDf1NkIeTYkILD3pxxZJzUtGRgiV
         G2JF3zFnjl46mhxJeVJtxVoY4n2Ud6z/1GgiR/l5ecL2t+1siAlwEGJ/imvRfvU49lwT
         EVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791958351; x=1792563151;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ8YhT4vttbyAReWLwDYCcZjAsPCyQJ43qms/rc9dOc=;
        b=X9W/DPCoS+IShGKAEbKiPsHQBjrcOKQOvmCk9oNxwq6TXW3yL6z5e/M0Kod0P1XFSH
         tsIc95AiLIvEUzlkre9JmuY4l+/w6sEuIlYQABXtovPfWlxx0c/EFKkUZVcvVu2eMho7
         4s7PZMJBX3ywnITO+B0+SAhoIFz0OoQJEZugylMah7DnLWhuh+HcRR/YSTfUcteseWv2
         ddMKToodrTgvDE+qWwuy9pT1QkYcVDJPWD6LNNBIc+c0oPYH131hznpyKgHpJ5pgdbcy
         ovFDFgEDd9xRYtuzq25Ma1B1a2l01GbXYin4L0cIDNBzeaSkV1ri/32p3qhRt3ZjlNbT
         8mfA==
X-Forwarded-Encrypted: i=1; AKwUvBx/CabLyEG5MadWYiidTubFOrGHWVW2pLdiTlVIRaie6HlsXRlHryt2eT+HfrcAEs7roO6bCo1cdwsFcOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6usyNSFwEoapD3Eqn1tsSwYpzk48yJhhfnvex+W3Sw4A4aR5j
	9YRmwSVg+GGdO09CkwaFX+ndzdhtAyOFTe35HeITy8opU1xYPOomCn8x
X-Gm-Gg: AYBFou3zOuNWg6lVDSfw/Q4SR8x5XDDjp7XTpsMksW/LT3PrDeJXH+GZRUdXiFWSSud
	FxWcY7I5+9coNJ9adOctC1QDWrzdzEvRyfXrsYpaav8r2gnDMLEVuj834GD9kdoqCrV46zyW2Mc
	Rv7wtAPR/yJDE6kcn4JnNoxTzUO2NlNQxbeg/TkCXsW5he6PrqwRkX382ah/4X2I3+3f04Wfzaw
	omB6Qj4O/mUVzEYmEt7YKGj0r6qfPKxa7HUkwnyDhrObUnHP4VaH0k6SDGAQLA6BdQT+sckXvwg
	0F/W5adFfUar3Pm5roycTJ3YFm2wjSG0S6nIylUj/4aGpmBzXu8RHzVKnrwrV7HZlxnhwAxaWv2
	+scaB9p/apOsZtwmBWe3e1vJiLNtUb7Sokm48dEem0Vx/NWrNYC8DMFO3iQhPr9f0EEDDqfX6wy
	07+cmd29AcPLNRBtlZi0t47Ol0bGZO4za81XIY/+566tZVEO1jIcqPqt7JRJ0tdqDtO1X5hG4h+
	WeWEsppGK50PYXeplj6CllkHkhVODpMmffuLFIkCzs=
X-Received: by 2002:a17:90b:1e41:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ab3a96ffd7mr13125588a91.59.1791958350750;
        Tue, 13 Oct 2026 23:12:30 -0700 (PDT)
Received: from DESKTOP-0UATUKF.mioffice.cn ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3094613a91.2.2026.10.13.23.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:12:30 -0700 (PDT)
From: Dongliang Qin <cccccccccccc777777@gmail.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: Dongliang Qin <cccccccccccc777777@gmail.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bob Pearson <rpearsonhpe@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/4] RDMA/rxe: Fix MW/MR lifetime races
Date: Wed, 14 Oct 2026 14:12:23 +0800
Message-ID: <20261014061223.1547823-1-cccccccccccc777777@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928171756.3254016-1-cccccccccccc777777@gmail.com>
References: <20260928171756.3254016-1-cccccccccccc777777@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Any comments on this patch ?
