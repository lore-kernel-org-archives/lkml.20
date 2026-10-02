Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA89E476CD8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932696; cv=none; b=IHP8MARzVQLZHQtV9I2NAnOM36np+32L1Jz6RIwnCLQRrQdKehz312T5nXXxmbSSWHG7295rTae7iLIfKRxbdjF/3Lx80ALNhNaJ7majpqY/ApoTIA+YyQOYJAOlMOwXhDkDSyx42PKEdp9Wn2ZWneCKGaBAur5WI0YREGZRDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932696; c=relaxed/simple;
	bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oD5LWeh46lgLbKMmw25M58mMiFyU3FKaOGgJow52m5iQ2mm9umkpmFPqZeo86SzDtbTphI9P+VEBAJSLHoFMJNIZertXxePJ9C/W5iruPnelpj1GciQ5d0k0auOF31nIrdPQU4zeZGdnXJ98Q32GcVM5te2P2j2+1IOdL8skmeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMN9BdM7; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMN9BdM7"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1652891f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932693; x=1791537493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
        b=rMN9BdM7KdbmMwHqGrmxlu5iz2YeuIgQfxYQa7psz5jGLlEbI3iXPIU+8oHJpBrI+a
         MgS4dYsPtt8epbg683Tt8l4WDWz5uhXoXKdVwxnsLAauLWG35Yb68UiAGU3n2KVG4vI5
         lGMqxaejpaJ9281VBJYcsyYNPQ7acMyskFgnQ/w/5FCpH9HwnVaIEMKZmQWnm+gk6zxC
         YPR4qLcsQcwiyDMIv1yKrAqj6XXIcBkfkVFxsCc5YWTpgg5GbW9Pr5WChn+pUiVTSSQb
         ZRFrFn0fPvoJOnPExAzrRn8mb6QxIjh3cCvh5oka06aQXv4T13R0fqbnw4eRz+xyin2w
         hctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932693; x=1791537493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTaeuMBL/kHKwhk5uksXNF1j/IbmPOC4gCAtqsaIJ4A=;
        b=M5hDb61UiuNzXaN39WnxWHHHd+8pSiwWsf4HqPwK/5V4uIfnQcY139sKNCXRTZhogG
         8JR9ZqruMGzuxw9fZ8BTnZKWztD0xQRh0IV2XVgmH9wPcJJUeDxSTknmvUhAEBuN74+h
         ed6PA5PuOkzN5jgvqB4cR5atq8jCguwMpRx+tnvGIvAXAB8ITlE9OlQx7ivc4smJq2vu
         6Meq1rUxilJ/JhkkVoJG1Ea59zGerd2eUBxH2Rkn0QMDpzwwKjdtHG30/cuCYvXhazcj
         qzxYGdZPiT20RlWQ8HP3XWX/RrNiQ0W7BTAEx10pb2fuNqk7IMLiO56eCT22J/fCRiUR
         1WIw==
X-Forwarded-Encrypted: i=1; AKwUvByWLmX00hkG2AomBtBGRpTOuFUEygspDjmB34LOfgeWEPsAzj2G6dlCHwnrKiO9YWHN6F/2rCGkuDFDTDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqWO18+cgsiFBkYJb8ACF6b1srO89XPnkEblp+570z6MiSg2bm
	vCLDbILT018Ef1LKT2pSYDzlKe3P3QDj7sfeMzKCb2qOYIxQSTyEyi7r
X-Gm-Gg: AYBFou0SIrhf3dnlHUZQfMSg63Q7WC2TXF/3sui9RvgXUiME1YQUSuFyxwrvSMVNh6X
	TlnA8gdLpTGLhfajvISVSvh27ffrOa//Q73CFfrYzCzMOEg704jGqDm3EiUEO+2SKtP1vY0fp7M
	Za1Y+ygulSH9cBRazTUXu9BQ5sObswx4LNFJuErGrNaHVGviKfU+phwivXfAec8Z2YilIbwXBO/
	Aab3G8EJiwsotnJnnrNYe4TBhP4Et84d/iv8VuUwlXDyC6uLh6lpcCTAmoGPjJA2BMVGSmREQIz
	TdOnID1StaNZVwCzXhqTP1z1XUiClzbuZEv7iT4CZ17wYqZoyFVWyYGtZWKzxQ7P5NLy9/EFquS
	d5AxQh7nbMjYZCJijlsrWlU0cE8OMHBFnP0cbB18N/m+S8647cpFf7eS4i8fH4zBGe2okaayeuE
	1/uE61F6r8qxsuczBPKgpfxqFI/SkCyPq22kVM9iC0OznhJa6ZTRuVV0CRKlX1tNYOEraC2rPxI
	CXfDVgz+a7AUbC1DGiDdxV3KiHakhP7/X8PW1zCjXx5pCeBPmVhFPjj8BQ=
X-Received: by 2002:a05:6000:4112:b0:48a:f02e:1d23 with SMTP id ffacd0b85a97d-48b12741316mr3374960f8f.23.1790932692892;
        Fri, 02 Oct 2026 02:18:12 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f98ffsm4465019f8f.38.2026.10.02.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:12 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Fri,  2 Oct 2026 11:18:10 +0200
Message-ID: <20261002-media-v7-p09-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar68mkS8_qRdGJQr@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com> <ar68mkS8_qRdGJQr@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yes. I changed this in v10 patch 9 to use the existing IPU PCI-device
matching mechanism.

The patch adds an IPU_SENSOR_CONFIG_MATCH_FL() OVTI2740 entry for AtomISP
PCI ID 0x22b8 with a 288 MHz link frequency, before the generic OVTI2740
360 MHz fallback. The separate per-sensor override and its hand-off patch
were removed.

With Best Regards,
Maurizio Casciano
