Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EAB542EF9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080885; cv=none; b=CDMMB6K/SA5CHR4dPyhfOLNPCQ9U8+ptIAh04u400MuzDKsA9HXFZ2/0zBY6XSgH297dRSIybaqTHIuvq1tS8hDKcOd03dCGGh+WLY4bq8dwEOJH5jJgRdjaCEZnZq67zEFCZLxiEOIQDz+QJtUdektEhpHJufUDe5mDRXapCI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080885; c=relaxed/simple;
	bh=QZXui/sNrmgEF8EYt9qJR72fsL3JvuFjYWH/NetcEM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ho40TJvHr/JoiHS2mbC2HnTUggUHzXfNCO6WsNxZf+XaBPDigKPijjrNvWqOSn69l4Sc7kNul8oeVY++A4IizCTO+MsJATLs2s3b6xMZLKXpvfZnh91R+lHYMFcDCD4kJ09Rl6OctfeWukW1L3GZ1z+TiTyRq8h8GnxGzdgzf4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yckl43p/; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yckl43p/"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so2808502a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080881; x=1790685681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw/dw+ccTq952L+vCfsl+Z5DyyMuf5zXMzQFZZc0Va0=;
        b=Yckl43p/X1qGl9jsdqKYhbPDSUBjFoDIEqjPfz5Q2LQZVt492bLshmkDxge67eJYOh
         qGOOFo9T5yMZOht4YlRNL7ndvYFk5akmskD1UjXM5MxZ6cJmqW6Nfu1NPRV5rxviKB11
         xA22aUOz0QCkoSEXoThhLaiPc4416Gs4kCLHXON7lRNXpP09n016wUN+Hsol+jWutkLh
         x3HLNeEdHu0sgh9ifwaMgatCzJUxdFal0wUpqV9AatNpf+cyXBJx4nDKT8NJoQBbsdcK
         16f/Nz9lNM5tnqdbSSeYZw3FTjTwNRRw2Vdv+Z+/fdu1CHlYbnA6Kwd3it0HycY57MDf
         i4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080881; x=1790685681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iw/dw+ccTq952L+vCfsl+Z5DyyMuf5zXMzQFZZc0Va0=;
        b=UHvIYF8/lYYLliy66k6TSMm9hxPsLUiNj2s/bRgAATEZ9g1ua2o/0Dt4DMhkp8CHcw
         XSUxJZTPlb3Vp3yvy5KfBE4hFWl6Wz7SyfyLUWbSkAA5AWZwMN71HI4igqciE4f5fGGn
         Z4Dv6gIISTYtEn6HY5xEsYc5sB8vZYvOBLzubPZPIp4nra+hVTODSVNiZ76l8Rrw6VfM
         y8HPOFajzjx0D3dZ3BN2uo78igZBRxZ002YK7ODHZUZ9IIZgut+UD8703sQbI/HmFiZc
         d9tjF+MQC2JsxM7C3hpedNiTh1Bm85DdjHY2jUrRu/q+iacdr9V/Z7aBm4BITakH8F1H
         tP0g==
X-Forwarded-Encrypted: i=1; AKwUvByLlSii3BBlxmpDdjjPD+4rZ3+J/ExlSvtKHhQ7yLheaqdR9el5A2CLifw0h6eWPWA2JgVFXMbqeWvearQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nIwc3V9GFegOOuC/JDqwRxOE6ZBMZL182JuZb2pmVPS+cjbtnJ
	8XwwDN76Oa8r3R0vMkaUGLmzq0pTGT+eoZwMlX2Enc7d/ZwCtPvWTfM=
X-Gm-Gg: AYBFou0/FAt7VFIvNZFtI1tBOPh6CLQeS0KIk4kQ5u6co2TYIs6Sc17KA65qWuSXLu4
	2I+fLz5An0npwnBolh0g/H1GOjZyhQA/fP/HLNvR7CmeMDCSTNJHCIYGj055gp6NAtM8JqaLMSp
	pvdbUrglgQcUceVRlzlChadjp05+wkE6FqdTzLd+4LC4qiycuudlN1OHdhVrRnnheQaEb1s3Lgm
	QyKP1FtJzsgzJOSN7sVbo2G2gCd487TRqZ2OYbXWdPDZ4LtP7P1S25JgqJuP09ErQtNY4fMRz39
	yCxqpI1PeWvNjqrejuLCq/WpAuiVV4ik/iKzfNIbCRLPxTDLPVo0qISJqw4tywN9s9iRV5RO9o2
	c2QXVohAUARsOIzHyVZ60LPhypL056VOemBBddG53KEtP4FuTcAX0ylnJX/PBoegNgw4mFfbGYP
	wJK3BdCi50S89NlCA8kV9Qm7MPR1myJOvBJyDZfjfk1FX4y7Xf5IhEPiUilFvNgfJ9kMHbyQs4K
	s91ow1Nbzfmxt2/IVXJvHQalLY=
X-Received: by 2002:a17:90a:ec90:b0:39e:4c81:6c65 with SMTP id 98e67ed59e1d1-3a0731f717fmr1052233a91.32.1790080881311;
        Tue, 22 Sep 2026 05:41:21 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5cd2e4sm3134535a91.16.2026.09.22.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:41:20 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	rppt@kernel.org,
	peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH v1 1/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Tue, 22 Sep 2026 21:41:13 +0900
Message-ID: <20260922124113.1675993-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <49208ed6-6c20-49a9-9c0d-0e1cffe1898f@kernel.org>
References: <20260919004630.1159895-2-donggeunyoo.kernel@gmail.com> <49208ed6-6c20-49a9-9c0d-0e1cffe1898f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review.

My guess is that wp protection always leaves the destination PTE
non-none, and the move path has

1566	if (!pte_none(orig_dst_pte)) {
1567		ret = -EEXIST;
1568		goto out;
1569	}

The move fails when the destination PTE is not none. So there's nothing
to preserve for wp in the first place.
