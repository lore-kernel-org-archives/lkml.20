Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F54A4828
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146147; cv=none; b=iJ09njlus+CHXOFJHf6AehJ0fqZseG04PeK0MREOLGgT8wahkvpDYA7Q+UPwhe/Ge7ckvjc+qW/wndsCxZu1wZJHJq4GwDmtYxd147OORwWGy0yQXokSx3/rHeRuEkgrMcLRluo40zzsUkNnFc+vKbRxz2+epYiG58PNcdJiAkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146147; c=relaxed/simple;
	bh=NRD+E16Ntqi48SkKeqUEb2XLh/7GQUHq/VvV71uQbds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAR5T5qzWZlENWmebS4Q3IexnCFXg+bZJUnDZoZJCcb93eaI5gBoEcOhV0bIiTK2Qqt4lSc9le8exNnxR3X/+CNtstFgqhc1dg1SnDZZePEwpzb4EudLEvppybHYmbyEvMV+mHKd6cP4dcE0cX4ZDhbf7weFZrPHy+SF74WpPf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akAKooVA; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akAKooVA"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85e68bdbcc1so1560047b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789146144; x=1789750944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRD+E16Ntqi48SkKeqUEb2XLh/7GQUHq/VvV71uQbds=;
        b=akAKooVAa3kqR2kW2UhQmz5kGjh7vuPgUOGtKAuR188p62NuSw4yci0yeTDSSuZtjA
         Ez8UJWG4hSe/VA8H5RyvVrtJiDPmJkJOjNolmOns2Bg43OiQ25GX+y29k/xl8WCy5C7I
         D9eMGZZU04VBTD1vjno3MAGDKqBDEKze8jM2jowpCQH4V/lIsdwT8QjoFW99Ahp+Nu9R
         0SVX6Y6MI2Fizf9GIilGRMpXBKHJNBEEV/JJ9Y4p3US9qIptrtxoChHXoryXnGP9Qmk7
         bw4Z9N7yI/ulh1vxlgV/IIbBbBR1R2Hof5H/NejgVaeGCy4uukGiurIRt6DuMZRk3Hpx
         QrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146144; x=1789750944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRD+E16Ntqi48SkKeqUEb2XLh/7GQUHq/VvV71uQbds=;
        b=Sc1zs3/+7rbV/BXfbisfBLxd6y8ygKzMsfOKTTxH3HXPH97sMsV1RFiaG6rBJ7K81C
         wOKRfP702WZQT22ZzO389vTn0zDCArnaMQ8crMr/Y/LpLCxiZUt308aEwX2TVg4pWjzE
         znjWUh8Ao5AIX9kZ9lKPFCFKcvelceXRLQ6mxpaXKupku3UQRdp0WB7M35892Po9lZix
         rG7Iv7p3qa1A4ZVo+Vnyu6avRcW1a7ISs+Fj7//N3uoV9ntGvxf132P90oREpo8d5eVl
         BTQuwJqxAeXKu6kUgQMZffQ3S9ITnAsJZUmlZcTcVtza8i/GqIg3aTpv2M+WfMVeqJXh
         N3wQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMB+JbYWolBzU2ckcsDuEQK32iBrojyT2UfvI2MkONdm3GNBbXSHmd68PDih6sKKyptwMRR5M4DZf7VNU=@vger.kernel.org
X-Gm-Message-State: AFuF++mLPZ10U7XW8hEmEgG/fusIURXwXjORAd6Hr/eeB9FKqSdFxSoY
	VaDPSWVr1Fj1ilfk52S7FFSV6W4sHK96Ad6JARyvs6D6Sz/lEQUuWdK0OEARhQ==
X-Gm-Gg: AYBFou33hzbpuej8OJDXsx8sWwH2LrevpcPQvuRpz83IEZmXm4Z6PpZwZSQyZIqro8c
	rT2WNLH9aFbv+2CQL5a5yaO27RyTug3UbRbB5OI3gPFZ2Ge3JIr5wLOhr0KdH9sDcBdJ+/c+woJ
	8IiHVLoHjxY3+CpkzaADZJXSiL5Poegu3oKhAX7wzn+hGY3fQpV6WvcEaxjZVYNY2PVufcyW6aO
	IPFnx/arWZfFJ0eE4JBVCUlZZZ4DviwKsxcVdJtMCt5XP09tfbEGkaR+O5oEhRAebaBJblRk0mn
	YWaAaHcvzZxqmAC98FZbxXV/1Etwv0F+p9W53UIyrHfETlwMTuGoet+kBytcUcv32Ihq8o8Z1h5
	WqTuPjNZ408+7kE/5mod6oa5uYCBTlLvW9kL8SOUzJGSFkw7xDALhJeVMundjddjeRQGJktTC0K
	7oJXB1tNmoNIUHkJQt3sGNQxDscoci1Bk/vgTnjYP1BFDBi9X/wcUGmA6uYt7sX8C3Z3te6RB7+
	Ztoe7OwseWIaKktYw==
X-Received: by 2002:a05:690c:97:b0:81f:e85b:f9da with SMTP id 00721157ae682-884b4b01ddamr20863627b3.33.1789146144099;
        Fri, 11 Sep 2026 10:02:24 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:b928:dcab:35a4:adf0])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884899d85fasm13403587b3.48.2026.09.11.10.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:02:23 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: tytso@mit.edu
Cc: Jan Kara <jack@suse.cz>,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ext4: avoid buffer/folio lock inversion in __ext4_get_inode_loc()
Date: Sat, 12 Sep 2026 00:02:15 +0700
Message-ID: <20260911170215.35183-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907155017.75543-1-ngocthang2710.1999@gmail.com>
References: <20260907155017.75543-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ted,

Gentle ping on this one -- v2 addressed Jan's comments and carries his
Reviewed-by. Let me know if anything else is needed.

Thanks,
Thang
