Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7436F411
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755983; cv=none; b=EpPXbR21s+3SSalS9vd+gNxVHjB8bWhSHT8tHnZu9jBC0ahShELFs95EUTq38MlLNxyAhK4M6IeSMC7Zruss6ZxQEGB57UCHSz39/AKgSmXkKX8eYDGt4Nd6xBTIEPdE6Qbpcv/urIqkXfi955Xw2YJ5Sp0Ihr3SBW/rdBzDr58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755983; c=relaxed/simple;
	bh=O/KEYowU8nOSKQnm/+wtSJUF/34sVuU/eR376dnqIsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHgrJglXqMMx50mVpiKKfzqEMBkncfnnYGSSgTb52ZTt0b3AQX0/R4tXsknJb1IBoliuftTV/7h8sspFSA6HHqVsMjuQkZoLq5LkaWHFzhsB0RG/wl6CaraUu2H1GWli+FyqCnt+ewp0n6Jpc0M8Xp1OiGILQL7xCl8pzLq+cVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzD8oENK; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzD8oENK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c96c92c0980so1652372a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755981; x=1789360781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0y4/I4pfeLNqTifvYLyA4YqwL2agDNSkV2NiZIcnoY=;
        b=AzD8oENKTZeI7+3AhE2enfoE6sopzleOP8NHShwle3ZUaVxXBdHL/fkCbBjjkhK241
         56FywLPxh1uV9AVtpiyP7+HxBwRYxLAl/j22p6yFm9GREeKoqDlCP5SzeJwiDLYS2INZ
         Oy/+mVrVef/QfEY8GZnnFWY/ErwmYeGyErSow06PHRUWEcaxAV3TsG4wSQT4ZFwlNe9D
         FwUDCh3Dz4UoM8boD3KzEMaQ+gUYKgN+onDZwFxZfjz8INo/Qcoh4WCNI4mURdcgXb1s
         ug2KhHxNS0y2/8kCH/12XJCbh7E3tVI+KrpwWGYF5F42nzaLfD3EmlS8KfAifxpB+vig
         VWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755981; x=1789360781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0y4/I4pfeLNqTifvYLyA4YqwL2agDNSkV2NiZIcnoY=;
        b=fRZGcEBIO5JTsOMdCzo5PHZN17SJOCpajiEzKb2mYeQj7lkXtVqjp+057M4rRoje7f
         Ng1/PY18nlIdljXZqBALnwqXMB8Z2Fdekm4zd/Ys8T4775y0l4znlW6A1Hms2ws/x143
         wurHzKjaJQ8hlZuQwG88yg94aJlAWZtFSt10hmKkYF4GdSg7Og3OcVUeQ4ruZATiobiz
         3ZAZAyY4WIrWr5qpHEs5nKQiGkYorPXWHrBGYwI0+ghg9mtZl3XvgS9yvTLStTl327Nk
         Mp9ungbJDW4Ycbtpv6BZRkjRMEHAQN6l7Mi63tJEtH6KsDOm6Wq8KEZmYAe6r+Qr2MsO
         yWpg==
X-Forwarded-Encrypted: i=1; AKwUvBywGsPpCFGIIJdVzrA+bWH/c/yoy/MAAHKdGvMb9CU1mkE85PJTVxQ5Hb7p06qmQPskqUNjlgPDTM7TbbM=@vger.kernel.org
X-Gm-Message-State: AFuF++nsV7XRtOT/QNIvTN4nLHNl4PsphAbKa9ql6v6l2wR/k7Hq/qQy
	mjwSJAQPM3vqFiwL8P51eaj2Pj1PaaIkITWe+Z70+hcfYWF39E+yiXJfVQ7hYC7g2h4=
X-Gm-Gg: AYBFou0KSkZd5F0PQSEnpwiFOLx4weNiveRXP1MA4U4+tQxNxV23FfLcKexLTngOHaG
	cGWYeFtnep0K1PwUiCLkWVulSSyyBDhE1+pqMugVZGYd5b4YO1bv+zOAIICXA2z1GANdHLu44vB
	yy81DEy/qq0aK3ZEsIFs/l9n9c0qEd0uNERcog5Rr5C/ro5gaAKUcoWl9BIT6ALI2b/GoniPhqx
	89vEPPZrYzQ9ox4imUPevMw1CK3xk+NU0cAAy1Z2hUbmjztjuZPMR4R1UT2iOpx3Ye7HmGKAn7G
	30iandI2tKF3W3PdK6tcT5HKJK59tL8k+AwN8egnm2EtYJYzCiLOEnQyAX2nXnog/hCLIsqYkAV
	mNwQWsEeEHrXJ8v6rKjhzGh12K2TSHmbsloKkMhoumXbqPVBKVilmWcoluTBRMKNkrKmm4741js
	bqoDMnWp52VhlooQ/K+QdKAlY1oNxs9YzGbxtuBmM4bIPzsePhkU3fLkb5J37ssd6M/Ez3O/Eqd
	GTeIjtN43W3+SU=
X-Received: by 2002:a05:6300:6708:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3da3a00565emr29715382637.16.1788755981528;
        Sun, 06 Sep 2026 21:39:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm22649867eec.18.2026.09.06.21.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Richard Weinberger" <richard@nod.at>
Cc: "David Woodhouse" <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: AW: [PATCH] jffs2: fix typo "informations" in comments
Date: Mon,  7 Sep 2026 10:09:31 +0530
Message-ID: <20260907043933.33452-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <mtmxcr3o.ee150fe6-3518-428c-9ca6-a554584ee6c7@nod.at>
References: <mtmxcr3o.ee150fe6-3518-428c-9ca6-a554584ee6c7@nod.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the ack, and the criticism is fair.

To answer it plainly rather than defend it: the typos were found by
checkpatch and codespell, which need no model at all.  What I used the
assistant for was the mechanical work around that - grouping several
hundred one-line changes per subsystem, working out who to send each one
to, and writing the changelogs.  That is not a good trade for the energy
it costs, and running the two scanners directly would have produced the
same patches.

The Assisted-by: tag is there because Documentation/process/coding-assistants.rst
asks for it, and I would rather over-disclose than hide it.  But your point
stands, and I am not going to keep feeding a model work that grep can do.
