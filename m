Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB2836EABE
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272793; cv=none; b=LKSDZUbDWyCxUZCx0FTRNwHCuL4/TcM1xa7PsPLBv/WfEMKVfm6goee3dL9P2pYqZMzjy/q0XaGX3y14EaypG/3zOfufJayxfTs6qmy7sz0Aawbsam1BWFVA3baZG1qSIOn/llmV4u7ebcHi7of10XKouWk+A342nHcAbcJeG3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272793; c=relaxed/simple;
	bh=jojZgS/siqNz1VrOC7A5IgdOx6uFms2WqJVnwwZP/jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fS05ggXTo5Lfbs1kpuyhEed9m0o3gTCwvMRE5cLlUpKyyUlvQkKsM89rJsQL+BfAL6nRu77q/2wxzkjq6Jj+P5JS0kOGKxC1pGsYrKeMURxcOLTJ6VLRk4IyIi7B90XvKV15gOoCQTZnZgiWLusiG02h3PAvBu/ye1uMXg5S1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghH0/HPa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghH0/HPa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso4626605e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791272791; x=1791877591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jojZgS/siqNz1VrOC7A5IgdOx6uFms2WqJVnwwZP/jc=;
        b=ghH0/HPaGpSykhL0sAs5emx7jiItsNqFBUZv1WIHa9RfkG6VTN6gEgQBviA+v8qCHO
         5+1J8tBT83Lu0OoYNTxSwEfmg9ahS6x4Q/cYaFULKGeGMBwPXRf8bCLPqSQpJlMvhZnu
         CRhkvbtH0vcb4DgR4VtNWD7WXyL1s6q+RXj4Ck7LRngP+/EAUVou8Vf0wQq4O49P8VPA
         SNcIBeM8+fCve+UoYdvAb0ilGWro7XgcK7dReG4ehb0HgSzyzgLSZXamyh3zGeqDwpRY
         wTph4PFYmzaBO64eOyZcTCqcVOz2ZhzZ4gcN/0Gzym4Y559Eb3ZU4DiyvAZrcxKRMB0u
         0DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272791; x=1791877591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jojZgS/siqNz1VrOC7A5IgdOx6uFms2WqJVnwwZP/jc=;
        b=TnMw7vFv2XvXDFZtDCksD971xyHrWGuR2mz2An355Kr7CnEe/NLerYXE9by1LbYjcP
         R9Yr+AHzEjpl1d0/Doc+qXjdzUNINGT15YDy31OdxGC65313z+Zy5k6b2pD/dWwd5ero
         oRjWuolu1z2d8T9+t1CEdE0L66DbnNPV3/N0jifzeyZmyj1I+VSEyIqwwne2Meqk1ZNK
         lCP0CLHcFpszudHt697XukHaEba23veNXttclGLkBfsKpAlX9o+0KwvOP0TktfTZOy8D
         g/VVNS+3R+8mQ5yAShyodPjVJ/fyg3ZfjsrJPn7ZCCM53TBdWzfcRKu1wBS+kpTfUCZ+
         7UBg==
X-Forwarded-Encrypted: i=1; AKwUvByev5Ksa0pOmV2Ju6ywsCmbqXBxVhvvSER9/k+CVhNWUz5cF57sKO39/ZCudetqaPQb5O6MpXFLazOVCeY=@vger.kernel.org
X-Gm-Message-State: AFuF++mIHJCHu3Ppq7KekPAaptMmuUQUoalU+9uNsni5JQnuhIrpgPxV
	ynxno3dJ2TWhRs3bg8J98KuaHDfFRqZ16tAPYwtqkdZ+IX3p/EprZTwQ
X-Gm-Gg: AYBFou0srWv8xGrgsnhB5RmfEkaIhnpnxSMIvhmKK4ZP0XDJjBdlLxOWt5muurwW9Vf
	PWKAupXtGodQkTlOF23eqhy6VALGVFTz3Y20WtpefpRoAirtmk8FmdbjPSZMgVqwfRdX8O2qDZr
	5PVhNkXANNsrQrPHe5y/Dp2bZNMnK97YkegApcgzd8xQgV36KiZJeFTLUOGw/siMARbc9uyqhrH
	QP/o8B4wuiPnT8Z4mnLLpj3N7NksXr/8THH5KrZ7WqErfjIJToUU4g9tMilrqIUmrvlMThQXbZ2
	DGlCN4xpD1sLH41PmNzucl0rZY1C9w4Jn/VsVxKmYe+lJvCfRyvGHjJNgcLkIdBXSKag8NQarZp
	auaLUyc60KkkpmyfG/9o+LQtz25rmRXZ0SrfJYrIyaACa9dCkNRDaDk51SutjCots7IPTWystZE
	uj/nNHlxT4D5TeQWjW8wto3QKiTLYW0ahksvK1cGl3AS+NatdTgN2F1Flhgc/b29488AO3HC9PL
	dC7
X-Received: by 2002:a05:600c:1388:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a17b53a52fmr11049415e9.8.1791272790704;
        Tue, 06 Oct 2026 00:46:30 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178db0929sm52237855e9.12.2026.10.06.00.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:46:30 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 0/2] wifi: rtw88: channel switch in AP mode
Date: Tue,  6 Oct 2026 09:46:29 +0200
Message-ID: <20261006074629.372782-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <b6c8d3f63f7e40fa8b515352cba19541@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-10-06 Ping-Ke Shih wrote:
> If you have something changed, you should not carry my acked-by.
> Or, point out the reason you can.

You are right, sorry. v4 drops it; the only change since the version
you acked is the initialisation of the beacon pointer in the caller.

Best regards,
Mehmet
