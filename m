Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1301D3FCB3A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790652477; cv=none; b=bSntAKWr8zv3WKCYavjwBPGDnF4yYaNvxP0JoTBWLvon0ELxZ8pzS76fKBhjjPbsVpmo3GWCmkD1WA/p/RqhQ8fUUVXYcEjWhuClHSIZht0Gf1shCSaf2O4JkYCLrRxnS/mViqL0+ShbNeB4RyOoM1g6x3J39FfFRIHy/X6+QsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790652477; c=relaxed/simple;
	bh=6QSUtlX44JIgP+u3oKbQIiZVdGF4goIexVu+fwaljK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J2nyef6cdsfXf3f+erZH8D2SkhEjgLR2+asR9TqdEN9PstODFPwhQxgOIpmClNtJKMVWX59Lo0NRgd9WsxKU6kBX9m0ZaZvtDikdt0VwhivuNp60EZIdBKRWFHnmBItUZxUv0fEjdlvEj2YS4BGADcafZecw969XqnVcH/uuXE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJQMQGRg; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJQMQGRg"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc796f8c309so251107a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790652475; x=1791257275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZw5mMt24fjggJ7CV/G4ShOOKQS8QFK14O73CG5mjTo=;
        b=dJQMQGRgPwya9C7Hk23Gp7GWdweQlKLCgub/Ph1A9Xv5PT2sOhfOjkW0XBhbSpb27N
         L3oyFnaq2Z4lXIb926BCMAPoJF/UIV4Xmuc4fmqm6MlmWrm87BVg8rfoV6uo+IFmxaHr
         vlLLld9wF+PNSEqmBlIle4NmzS8noA72OIpY9LjPjiufLYVbicrPlMjiFmdNhNedfU1X
         JaCFgQ5oEhibAf/OIIq1lX3xrd0rVfN5ZRf8ksHRZkTsCVUiB2UrGOefV9ABZFjQ5V01
         /6VUwz15tUEMOrXBxP2CP/K7Uzd3O7P/KObOfWLdplxfKg3q5NkoTRy+n6FZqFVCsoUb
         gsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790652475; x=1791257275;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZw5mMt24fjggJ7CV/G4ShOOKQS8QFK14O73CG5mjTo=;
        b=nN78MaOQVADd7itmxX8gk0pyNUHVKRvBPMYaNiTPGyz4HZi78FuEPWvYOa+q/KuOF8
         9FyXberGyBN6LQDgtroTKcGizPSzfyObfzBlakbEo6eDAL3Tg4yHP3IWsgPVQwZp+n4v
         GF1KvAkCMGaNW+/wz0hji5wmNiHam5LQrvhBvxSf+gT39+tBss15Der+2Y56/8IRuDY1
         fiUSafW4prGQdULeRakY2BIb9RuYSsanmX4zK6wkwRQWI/zmgDR3dq4QZO9bKYBFztye
         QDXpmeKUgxclosVF2FVydXbEq8yFJqRwRoYVmqJt20cjmRXxGaYcAXNt3vuMLamx2isi
         IgPA==
X-Forwarded-Encrypted: i=1; AKwUvBwaaraMtpv7T3UlYuodFM+2McTpH/oh4IjAxDo8DHD5yQp2TPNGJo6iLYMhsD3AwDzYdh2lqTV0mDiSt8w=@vger.kernel.org
X-Gm-Message-State: AFuF++n0n7oED5J6rbxXp913zKlSK1u/6mtrdcV2lFf8xWV4/Lwk+Pje
	Zels/p5bKJHpWEU5XUK+m4ukblU10tYHBnllJnufbvdXn0yFCDl+eIE2
X-Gm-Gg: AYBFou0MDISV8bVmZGt+nbSCesoWWnJdpYgTuxgCXdYM2xx7ARBQ3rb3Rr0Tke+Jgdw
	GNXfPOSF6l0AMcw0nJBwAtIYsf0wlDrI4qCCLvxXET8TgXMb6NnH/LkiGhMNFUwo8VA0jc1kAvK
	CtSRJM+yH7QFnW4SylZ6ze8BnOF/yuSanVFTUbs5x3NAUdGMUsPXihJuS05SNzPbtwWZexZ8Apc
	lXbpq0K3tvkVVMo66feSa1UQI/91cU5L7k9MrWVFbhzogbZOyPL2hVLWaa/sNVpwVMp8WRLJAtO
	8LbPMH5topxCTH/+7bITmoqK3KypOVZgKvaRkcaJLs+ClrGBX8m5+Jx5Tfwz7n2Zrj6ic15kIgZ
	7wTKzICcNbDx5ExHJwpJJJw752kamgGFoCV0E23WL6S7/M91Ni6pUGsfxa8XY6tQxHXNop3FYHb
	Tcaq7rUIiSV4+xSceitFoWtqX0xWnozr26MXBwWdB79QztpS2o8ujUsRNwrDWpUtJ75tCecH6DS
	P2H1+fbdI/+lg==
X-Received: by 2002:a05:6a00:7106:b0:881:4a2d:5c3c with SMTP id d2e1a72fcca58-8814a2d614emr7689172b3a.2.1790652475306;
        Mon, 28 Sep 2026 20:27:55 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e1066926sm48883b3a.19.2026.09.28.20.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:27:54 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Bryan O'Donoghue <bod.linux@nxsw.ie>,
	Robin Murphy <robin.murphy@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/msm: map page-less imported sg_tables from their DMA addresses
Date: Tue, 29 Sep 2026 11:27:35 +0800
Message-ID: <20260929032744.37269-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <bd4e5ece-1358-4e0b-bb04-ba9de62d26f6@amd.com>
References: <20260928053901.7270-1-liujianfeng1994@gmail.com> <20260928053901.7270-3-liujianfeng1994@gmail.com> <bd4e5ece-1358-4e0b-bb04-ba9de62d26f6@amd.com>
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

On Mon, Sep 28, 2026 at 12:09 PM Christian König wrote:
> That is not in any way better than illegally using struct page. The
> point is we need to get away from using phys_addr at all here.

Agreed, I won't push this further.  With your "import a shmemfd, not
a DMA-buf" remark in mind, the direction that makes sense to me is
the allocation model one: userspace allocates the decoder capture
buffers from msm GEM and the V4L2 device imports them, so msm stays
the exporter and never has to interpret memory it did not allocate.
Rob's series (drop the page array, mmap via the exporter) is the
prep work for that and is already in good shape.  It is also how
panfrost/panthor already work - they program their own pagetables
from the sg_table's DMA addresses and never look at pages for
mapping.

I'll withdraw this series and come back once Rob has had time to
look at the msm side.  Patch 1 is withdrawn too - Robin NAKed the
iommu_get_dma_domain() export, which is moot now anyway.

Thanks for the review, and for the earlier pointer to what msm is
doing wrong here.

Regards,
Jianfeng
