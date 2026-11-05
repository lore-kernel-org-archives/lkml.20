Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882977;
	b=VKDGma66N9tPOuCyDiD+f2m6oRihSuZa0bR1kiNzeyH0/Fcs1AeuUUJ+BSOZUc367hp2
	 jGz7Gv+I6oMNpb5UOgvzHwf4sWNMfQPqmolj8P0qCSBMGFhxkL8G3FmIzsdWjMbylM2TX
	 SZv4eL3qR1X3j5cuT1W5vLAsN5f/qpXAfAOmMPi34zgzbXqfQXnNPOI2Q/8Ed272zU3nb
	 UfilAZHO1UDCaafgp0XWi4NjTCNpqdjUe5gLmMkAgSHQB/jegI6/06M8AFJxl8elLNgfC
	 0jXv/d/vY/5ii/T0a6CEryGY5S0zXZopQhhCCnGYk3YT/MbRU7udaCMEUKsTPaNofGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n8S5ScCzZMKTwtLSsBjbF893S2FXC4EMIPZpDHsFCCs=;
	b=2DXHJP3j09rg0DvCz2jJIpxW83kYtucav/doodfz8zaAWz5Od3JlrCQGxz5wMLBB+LmH
	 4YVhRPuaF91HnGYevNUqtVIMV3Z3F8u0IKIOn/dHvKSoqKmQEAlIPa5vL8l5ltFmduQUB
	 Ofj/FFFvPAGURmNo6sNj85IPzFLy4iamkqHRcAZWGigZucIEDvpbFvrP7AeT2Uw0fnMky
	 NtOFuHE6CnKVwRNkZtM/NtKRx1p0U1viSG3fIeMe3BxHeg62eryJxQveE7W9RxMczQirP
	 389E21BQx4miynoDvHPBBEe9TTuhrHJFwNhQjQiuxsbCwTYGx+kMJi5iszVv+uxLdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdP5O4ti;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2671606D804
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2671606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdP5O4ti
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2672282eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793882976; x=1794487776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8S5ScCzZMKTwtLSsBjbF893S2FXC4EMIPZpDHsFCCs=;
        b=wdP5O4tihaK2Jy6TtTKVgO20LnlYjG4+DN+QYUKpqF4o5ThaWx8S5x9dW2QuzqFAWc
         UrfiSF0epJZ4FEspPg44KxM3lyMbLafCKwJw9Ey4a9oohV80dncqX+8EZdwf1nqQHoUe
         uWcEqHo9bcXhPmC+lqEawurzWvIjnJZTcGZgDjU3sVs6I1PIaWV0A+zjmmLLYFay+XTo
         zEqRaFDxtzwKO28fnFSA1bM1RO8UewfYH8gITryphoUGLaGsPXVRaUh5xqBBWrYhmG1N
         uPiBnzZnjr7MbEE9NatDqYLxEe5JedRsrKNr16FOouw1Uty2calT24LzmtR49wRhJIds
         plsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882976; x=1794487776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8S5ScCzZMKTwtLSsBjbF893S2FXC4EMIPZpDHsFCCs=;
        b=LOFEQf99Sttsk9QWupmI4DyBu19SMfxNMyyYORNumhyrsibb4Qbo6bbthZysGCkxp2
         Z/eY4izAF4vmNTFFXkTGRrSThHXc2hTxpkjbfiQviACP1WC8mCGLT4U5AsJbMjmkyJ/7
         kp1GGQi8tk1PjlvHW0rXKmAbBK+aIhG1ZsBz0RS3cZhpBOELVWgiQTjz/Uq1VJWUNMtF
         9zFStxLvoCGxZhWsTv5i49k+hi3vIzKSBIz0kNocwu8HLwVpV1puksMLCF90vyqKqvNd
         SlzrTJGnU73/ZszPfXEEiX4U0By2V3WWpNC3IjKIlZKRn0HMRTu5/nhHbah3z8LjjoYo
         eviQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIlgf9+RH3hz7CnyK/Krb+5BDXA295zf3wbh8S68iMtlCRh757DCPUWDh4ez0/mujMxuXxv+k+R4PR2NQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Myw9TtEhzmoes2UK95thVcHNd8EkFp0rurvOFkucm3dQ0kM+
	xZJ+IrUc90JWX/rSYlWNJ2E0HjMAp5VsblDk+ADtu/ByoXlXn7T5CH3a
X-Gm-Gg: AYBFou1oA5if45Q+8Wjrq2h4higyUIwY7b1/x08/SPdaHCVr07F37rh4JEUxfTT3E7+
	LsT5LWsRjPnYysz2/lJccT/aHhaYXe5hBfGBx6gcfDkiRCcRHw2oY3ISjCFrWHYIzRKijBKm7ca
	WDKml7HBYPc9P73BT2gkfUSSQp+4+q8D2nVUedwuEs8PkAnxIu+uVJuH4cCk8nn+PvHeb/dPZnw
	pNmg5kpbBTmouruzETm5mcVoSD211n4Xb+3rY/u5eD+VJ9g3l3jo79c4PAGL+RcsbranRA4EI/K
	lGF+AGHO38fcT1PMmlzuUPjBgW761wkY82qJCoGPe1IlhiFB9yVm870UKYQs53yIfeR1HE9UUD6
	ApVFUR3Mg76LbYlNQarKm/fsAwOng0nx4sHeu6APhFr2BqtoDoPmm0lc48dwqIn0uHEgw0eg0dL
	GpD/AGD6rw201nUy9z+0NoLBIS0tFueduNCAN6BhiAyeEDvJdXVOni+m3aFZEiDL67IO93v+Gc0
	oLGVJid90MzbaZKR6itwmU0lu1Oh4oq/gHWnVTUjBWj4DUnG0X+xoFiJdxYiuD27n28ZWqzE0pf
	m3VNyPSwCvQ8sQAZkOtmnaZ1C/B5IZXCrD6SHRf/07PzSKG2iQ1ooSI0e1iWfgHR7s5dxEVy5A4
	CkCldCTJyQ9c4EG38wSzHuXyNqGQYlcYw+/wtmtiC9BZbFszF90oeuxKhwdySkSyRxCChBwKifw
	==
X-Received: by 2002:a05:7301:6194:10b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a42437876mr29038541eec.34.1793882975233;
        Thu, 05 Nov 2026 04:49:35 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm17708130eec.13.2026.11.05.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:49:34 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: netdev-bot+sashiko@kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: Re: [PATCH net v5 1/2] genetlink: Reject joining multicast groups no family owns
Date: Thu,  5 Nov 2026 12:49:27 +0000
Message-Id: <20261105124927.336300-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179387152067.488856.5027284112549941042@kernel.org>
References: <179387152067.488856.5027284112549941042@kernel.org>
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

> The commit message says:
>
>     Nothing is ever sent to such a group, so joining it has no use.
>
> Does this hold for the group IDs that genetlink assigns as fixed values?

No, that sentence is too broad. An early join does get the messages once
a family registers. That is the problem this patch fixes.

> Is this regression intended for privileged callers? I couldn't find
> existing userspace that does this; dropwatch appears to resolve the
> family first.

Yes. Before the family registers there are no group flags to check, so
the patch rejects every caller. I don't know of a program that joins
early either. A program that resolves the family first still joins.

> The commit message mentions the getsockname() change and the setsockopt()
> -ENOENT. Could it also say that early subscription to fixed IDs stops
> working for privileged callers, and that NETLINK_LIST_MEMBERSHIPS output
> changes as well?

I can add both, and a comment on the -ENOENT meaning on the bind member,
if a new version is needed. I won't send one only for this unless
someone asks.

Anil
