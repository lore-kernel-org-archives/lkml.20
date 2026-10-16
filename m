Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D556E449B33
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140208; cv=none; b=Yopta2SFwERI/Q57d2FvxP9aT6cALgVHL9QY/N+ooOrAgvmUVp9/r5bDJkWCUnlnDMGSwjnKlT9nRV2DzxiDHvEHU/9x8qJDYdVFfmpuW+6rKzRNuK1mavWb09kMtxzVzIPFg6SR561lb8Xh+P0akVcDdKeVd02JUj9EXxlPEmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140208; c=relaxed/simple;
	bh=9ytjh5h9nCKW6lRtRba8cDTN0tvYqToRzL6rsiKLUvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhN8seWejK8XAzEdpH6DjtJElp2xdtxLRtfh7Xt5uKVl1x3tzBbAqj+v9FefqmAvf+AKHYF/aitSFHn3XVd7J0oTYJvZL4oYY3PnhcR3+TLwAyy5E3MiBkJOxd0tOvdK0b63/q+wova/ujPs1RuzVkyCWiazGD7w1rqdliZYAl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdgMeqJb; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdgMeqJb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3584f70a5aaso819508eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140206; x=1792745006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ytjh5h9nCKW6lRtRba8cDTN0tvYqToRzL6rsiKLUvQ=;
        b=UdgMeqJbSyAnx9bLBdu2kQDFZCh6iKG+GtIzs9ycPlZ5yj0Kg/VyeCvPxSRm2URWXx
         bWUg23QM/+8KfjBxWDe/H+AMcj/0vJN5vo2MHwrMA2rhjNvqcwe2GaFW/XKdWu92iIV+
         vk0Bf/8mPSFXVbXXCKUDFP01ZclE9pDcWZDfDArdHnBAjxEixhMPyNOBVGyPr5M9IfD5
         Z4ihYbbAho/u3jgiW5tkVS91RwCvTqMk7JuntNeABXh6NCHCmepjO5atHTusRdTc/MAx
         REFvvH7Z4J1/QHZxS1GnX2/k0tJ28yrgV2R/8kvEEnkmUMUrO7h0ZzDKi5GKHretWIhd
         Kdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140206; x=1792745006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ytjh5h9nCKW6lRtRba8cDTN0tvYqToRzL6rsiKLUvQ=;
        b=wxyrI+iS00HtdwdT8akYRI3A2CnZ/p3r2nxq91XMm0y+qOMiPb4s0xdbLGPzlBGbww
         x0G3L/jLq+EgBgKB873Qv1sFh9sFqDhXSO5ncKhd1KE3w56eok64JEQSg/sYkrawCJDt
         TYMwrJDsuy843Tlnhyy4lE6rAroSGrWqH+L/qBPxQWpCTFfZhrHH6VOhqlJOPMznDzxi
         5h9DGzBLnnsDjQoFisgBfPIxtT0ZdbsfKeDlx26PvYFGTIpqCH6PUASMvRH/fJhYCEQD
         Y6fcNCEUKoxV3ZCroXuuNxabEo7vjWbMtRVVv8OmcZ5GKLkfY9yRwzBPhrHK+lfR+0y2
         5u1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7VFIi90q+lgDVFVc5daX87ga60D8KLs6v4as/PncuGf5AAkyujwfrSx2plknmTVpomiDZHWBhUIChvAs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTVqZzjoRON6yLQM8lP9jQ9nAt8grJGgBeGbb8auS4R5RjNd/9
	Xnmni/zMzulP+Li9+zNf11zx7vNRYUghZ6w1EHAP7N1blAGzlLRz/5ad
X-Gm-Gg: AYBFou1xzMFLJYdRhNIt81czMFfgRdW2gTE2Sjf6wApBvCmoHCO9ap4R369G0ElAoiG
	vt2KxYPcXay4H7iE0daZE4/yLop0oyY6GaYaeabjNlL6MOlf05j+tVxqm6GHNIsiqF/rtavGw2L
	7P23UCYF6r6oPYWr2saW0SaetWQYhmnRkVtggBjhB8kxbwvrFQ53URZv4ViueHPs3z5BG0DWgIU
	eQ3dZebgYHnZZYfWGzIR5pIAQ69UqsdZdb5WdbMqPAoX9dWd7KpQ4bKDoVwc2jVXX3KjIZOLPRu
	kNz0c1bMR9soKgjBvpDMbzNCfIlAonbH+vjCVMBYWoSNf5S2yKvaGZfNyXouL5t7RWmOv376ZG/
	uxChxPxEMmwEtmqzIMRmWopntzvoSaQ14F5UkISmdYNkBDQ9xz8hwrOeJxlS/yZWwsAtKxtFqP5
	Toah1AhWjprGzYUoWfZoDz31/ap9sNzKZOYQMIkFp2QxSEd6xkju3PKyYtF0jGpB89Z5Iei8yuI
	JTeYdDhLQuZeqNvoor4h44VNYVxatIV9D2GQnYttYEGoqY5y2XGk8sXebW301KlzbtEBzgBqxnC
	x6EdtaYTTVavhFLxkZTbjipsrLr08YvN7g==
X-Received: by 2002:a05:7023:a5b:10b0:147:d430:7322 with SMTP id a92af1059eb24-16a5bc5bd84mr42237796c88.1.1792140205626;
        Fri, 16 Oct 2026 01:43:25 -0700 (PDT)
Received: from cachyos-aura ([2409:40f2:311e:5e21:4c93:81a8:d3d8:4d1c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm5793636c88.16.2026.10.16.01.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:43:25 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI/PM: Skip the suspend_noirq config save if runtime-suspended
Date: Fri, 16 Oct 2026 14:13:16 +0530
Message-ID: <20261016084316.22761-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260923022511.24932-1-navonjohnlukose@gmail.com>
References: <20260923022511.24932-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bjorn,

Gentle ping. The patch still applies to pci/pm on top of Mario's
pci_pm_suspend_noirq_common() split, since the !pm branch it touches is
unchanged there.

Thanks,
Navon
