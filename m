Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C56457E78
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752978; cv=none; b=bRcuvX8rfW7imhevFecCgjLQ07768mOIMkB4eZ1Yo/lAEPL6Qr+aeVBUWkipqLpnHaufepCpck3Mbbl0UULeown5TPcJRCbOSwKS+/ekck32IHeb1zgdf5+pTpQoUikuKeQ0Bnd+sLN2Wlz20rYY3Hc1sFTs/LeJPP7LcxCkoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752978; c=relaxed/simple;
	bh=W1/LVnypA/Fa1aCBl0ZqrQ5A0oO0YsvOH2E8+KStOoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vnf5r8OcOOg7i/WkhedZcNDBfq+yQaPBt7EUTf5B+S7hq1hWtXdLZV6sIwqSEHRV6+QPNX5pVSeNCjwp/xyaEBe3gUQg8+pKaP9eZTOjdJEDZFZ4Lzszn9n/xCVNF39VnWSYKLCTizThjeXvGM7eDlMcMKOfmq01L/u0nehHMCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKooYsxu; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKooYsxu"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso1925700a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752976; x=1791357776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1/LVnypA/Fa1aCBl0ZqrQ5A0oO0YsvOH2E8+KStOoc=;
        b=OKooYsxuxS7mVDS1ykhNyBazFIJl7y547ngTCQA2R52NjYlEFoQajPS6A1oM1C0u/C
         YK2WM+qjAZt75vUYmXc+g0TRpInUL3B8n4EQ/1DEMx0FHhVKSWn4LOviAounEE6g29Z3
         fV0/xAPpHQP6flJp6fCOcRGqfwZ3pjdu2z3Y0+oxFH8/m7lfxK20O15dHYzZRsqCkjdS
         mcInj2+aQTdcP2xRSr8H9frycNRepsDr258+juLkxJYODGnJ5DCJoQPCI+yEB1ojYU8f
         PK5i0KjdxGesex4fCdHxsgTFe2s8/wDYjkyTVQ7+xrfHcgpVdQVda35RKv0lV2GvyK2O
         i6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752976; x=1791357776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1/LVnypA/Fa1aCBl0ZqrQ5A0oO0YsvOH2E8+KStOoc=;
        b=xd+OsQ3twa6yT5qhMFxS25arFlfCwBJo8klx1gktfaCozRYC7xOcijcn1agbYk/Pos
         /NC6Bwqy8JgX1Ttf1By6k5cvqitGtyWIJlZgOrbaC2ZzQb1NcTTQO+M9/f9BsnVrrOW0
         TVcNsz/GsnRtzlQ3j5BMrQdYPPYM/iccpatpffAUdHnQfn39zviglBb+Twkv1DzFX2bs
         wSDC0CcUpoI6XZG9pjUlm0G6h6TGVrzno9lmGZSo5+WLAJdgyrKWipTnQ7SyIHEQZQP2
         iPVO64rF/VP5OWY9JQ6WkjnbApelhmKtT6bMj60YhplhSARkdKpAB4c6qOu5HKyHn5ap
         OdjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyMvTH1ueHS8T4C1zrrq+worVdsSUGcncqop2iGyPtP946+piwRkpRJBjY9dSUEkSQUt6ufK3GVNTU3NA=@vger.kernel.org
X-Gm-Message-State: AFuF++ly9nozhKizY69VFQrw2VR1bo7UxYvi+lZgWijPauewe9kRR2Ly
	XK5hA1XHcU7uTvIOXLIDZWv+vxAxT8GzrpLYnx8Votae7y4ad9lo1s95
X-Gm-Gg: AYBFou0AU2C5Y6oZ+fyZVRgLLSVtYw40ZNLGzaIUVussgVdqxV6txXJ0WzYr/gLchF9
	tBAvbOiZUjBTmFin08t0qe0SasPTR7nsFwTLog+VRSuBLWaYGZ/sx2W86FhBOLYQkFNbjAx0yoj
	Uv2bx+pCoyeY35LnLryJP1ERjB/qBtS8puhAnVQEuJCeHHX+3Cy41v32TyM65S+F9nQUMOVU+yj
	bk4qy2lrTM3usWF9pJ7GT7mu4KyMKuRgav8X1zNEmfJfVhQQGfMiIovIcunQUe4wHzu81M1XWjq
	SOiej3oazHDWphV0IleRYecrN3lFmtFihTY5XNq2mGGjnaY3I5zTojPbY1XGZQP2ghpXwHlMbqk
	NtztxBh7vXiqMxY/1H2+DW3zp/Sd7s8u20Jfc+67o1UIbWjImneTjxn60Esf7OYbNrWauG2pEHy
	hCgd+P/paLDDQmbG9DD2X0a9LOATLVrC9YnPl7gbrWsSqRvInpLBtuQPZseBuRVfSylNnxYBCOU
	RSt5cTlJCA/hSOPzqqKbNZGAKvZj1fnyJIYh44OUOuc/bpPvzp54BpyXhrQh2zDU/q2DmBiZV8J
	dMkPTwjMNXZ/CoI/hfXjeqfLd+CFeptJneiZCCCW5pAksv+Z2Q5g34V0nrU=
X-Received: by 2002:a05:6a20:5681:b0:3de:79fe:142 with SMTP id adf61e73a8af0-3de9e6ef0f2mr581578637.49.1790752975531;
        Wed, 30 Sep 2026 00:22:55 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88725881fa6sm342045b3a.27.2026.09.30.00.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:22:55 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Anders Larsen <al@alarsen.net>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 2/6] qnx6: release bh on error path in qnx6_block_map()
Date: Wed, 30 Sep 2026 15:22:52 +0800
Message-ID: <20260930072252.1167730-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930031604.70544-3-benquike@gmail.com>
References: <20260930031604.70544-1-benquike@gmail.com> <20260930031604.70544-3-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested as described in my reply to the cover letter.

Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
