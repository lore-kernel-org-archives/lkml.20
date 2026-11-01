Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793523593;
	b=s1eswRbQYubjhp8KXlbHYKBY3Tj5kpcGVCHhbVgyr0ro6fLzAo6elR8tNwZcHXEK+Owd
	 49hr6iuyjA8y0o2A30C0OdxyvEMH6gPzxEdbdymiSITzRhWyvcDU328idIPxC0YEeNHPm
	 oo5Q9CLEBP6MS2Y0F4Ce3jaEV1/SwnY6Xiokm7izmMNp056K4jTWiqU+AjfZwmG39fBpu
	 SfZlMN/sgwXLh0FbT3BsFJpBZirH9ZfOhpql1pEvM85pWwn+BGzxtggQmbQyGV/48iWzK
	 bAzdn9yYiIsIsUkKTUnzrg60TuC1jYHLPsuXClEwK5yftRrUxK8hASs2hnJLwtEkHMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793523593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=Qot3DPVKnGE0VVwUhDNO4+shB6YIfE7k5yrGO2m+J5M=;
	b=asRWBo5fXADZgnawBS5FssePzfq15UDhp7ifo/S6zOYR+l24RiaFD7oYRI8iqPctY2u/
	 Gru+kNspr1icSfltt1QI4URyYSqaAhmS1cVw42QuFGuaZqc9Tkp/gVATCcEcigEXNCcxR
	 vIkRO2F2/5leXlfUhDlF0V4qQdX7NlP/0fCZFcUYJHEVfnSh7mnj2LpedqDKqmjSEsqIz
	 IK9LQhcoDVOQwGu00FloaBvyW5bNli4QB33mxhOmApTvjdVGUMLn5cBGNCI035BdMFuZS
	 grh+O8NqSjW357D3C8Pw4wiMMGAmj+r01wzQOWfPVaZswNaOEqIAzMR6pAYE2CYDHnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ts2MsoYm;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5DA606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 08:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5DA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ts2MsoYm
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-34cbc588a31so1197928eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523592; x=1794128392; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qot3DPVKnGE0VVwUhDNO4+shB6YIfE7k5yrGO2m+J5M=;
        b=ts2MsoYmvBp0BB1OLQow6c1JUSU9E8IodYM5PMyOj/ay8gBz5KvtNJXUOzHqpYbrKD
         YiH/XdWwNUlVu7cZEPVIFc+dqCIfRN4IiQmWReUvltBa2KnlbZ7+UqLvLg8NYsOewfYP
         j0kh6wCW620Symved+u6YpLiL4Shfy8wJRvBJkUOJzV3lRmH0otHQf8d2K5G+yDb3T17
         ByRbe5VPbzxRItmwad3Or3I1DLhZj+L1AO72ySkDQf/mXijj5r2cIaByWipqO53iVRnz
         U2AHSBqtx5gSM6FraEksq0JhjYRclkZTi0YQ2UzcEipyyO6z2rP/LKSlbMOdvVNa7htF
         HCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523592; x=1794128392;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qot3DPVKnGE0VVwUhDNO4+shB6YIfE7k5yrGO2m+J5M=;
        b=YD243YpTz5TZIXjBg+rXYc73+gjmOBU6qviVNwtp/8y9dBRAOK7GVQ0PSqRLyYPVhv
         0j7y307YGR3Ludxt8Amf9EVzVOX2+YMToVYmNkcyKHMfybG73ylIt8y0tRPAz9ytS9l/
         28ykTLa80z13+pL28qDEL+RfNDTCgkNc7Re1HnGdVnMAm7JriT8Jcxhv37fJ9rtwOUpI
         wSuxDlyAEMWDbfQqBi9uTA3aejcKcNIvkXFDV5e+gW0raDwhq4DgP1SULLE0xsGxX33S
         2PYJoAkb6ROXjcFMsd5pS7nYl+OwQ642kPjQ2H9FGJlWkta7r3/GQ9AZpoOH036mca7v
         IGjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHEVHAxa4niOwf4atYSTJV0GWWCh8qimsWbyb3A44KTalD2+WWf3bQutnNU/20waeknnkf+1kNJsrKxqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WFbXAg+b4Va97Vpwkra8RKyhoengGyVCsh/4l9aAqWmI79PTi
	Czv/EomF0bEIin2yFCW7DPpN3f1gZo8Z2R3W27oBs3GlI0c67EclIW5k
X-Gm-Gg: AYBFou1hNifkEJ0qrMTRKuZFdhh21QSA0ZYKLAEE5+K6Ko5uc3r+R/ZxgPy4akLxanP
	FQ6WKCrKsRpc+xbvpwid0E/bhkGv1e6LfCm6HTXyyZThlIXyfBqRyp7Yjvqb7nZS2aJqE/sK7oy
	enrx8j2e7AWXA8uqpGz8eMbx3TpFdPCxg9a1rQRuzLWYWJCBlNYEov/YV9wsKGLKCm3m4yXDVAD
	XxBt514FiXl9v4P8slM1xPt6fv2HQR0E+5mG+gtUVv6kxy7PW2PUn0oDi015/OSTLpEKGy+dTQD
	zVli4at5fPmdOQmQ+JFDg5VQ23hrGUr/wljDWbEa+YoGeQphFFy+HevRMtREhiQrg5QuujiLz5I
	geL5Q5StJZLPfIltjeCdypmk9izLpj1ZGhNRzMZaSC/qBKbtSvhyOSV6dMjkGMGIg1eZNCVR/nI
	/Ngr77UEkTTxjQnLqJnQGCbPRc+yomw5O8sZAW9tlcHrK91EESiz5Cp04y/VgjQJq/coc6VT/Y9
	bpefaA1psNiD60ge6Nws/hgy41UNglBCYJGyiYCuZ5Y5O2xuBwLf62tfFwXszJC0EMKYFflawF2
	lhWXpkS9LPseNTcKUjFo5gjhJqj0RF6kgML77FA38mWXGodL1lXchZ0SAv8o8jBFWKTIBX1eluz
	ORl6CDboFyP99pcZ3/7j43qDZXaQ=
X-Received: by 2002:a05:7300:ce08:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a42401de6mr10143619eec.9.1793523591850;
        Sun, 01 Nov 2026 01:59:51 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm6176212eec.17.2026.11.01.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:59:51 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: honor write requests for owned device-private
 pages
From: Aveline Noir <jm5905938@gmail.com>
Date: Sun, 01 Nov 2026 19:58:21 +1100
Message-Id: <179352350180.2.12918668886938034091.b4-reply@b4>
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Francois Dugast <francois.dugast@intel.com>, Christoph Hellwig <hch@lst.de>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sashiko-bot@kernel.org
In-Reply-To: <sashiko-outbox-192310@kernel.org>
References: <179343062238.2.2773026701442863377@gmail.com>
 <sashiko-outbox-192310@kernel.org>
X-Mailer: b4 0.16.0

Hi Sashiko,

On Sun, 01 Nov 2026 07:29:15 +0000 sashiko-bot@kernel.org wrote:

> Since no MMU notifier fired, mmu_interval_check_retry() returns false and
> walk_page_range() restarts at the same hmm_vma_walk.last address. Won't this
> spin forever on the unchanged SOFTLEAF_DEVICE_PRIVATE_READ entry while
> holding mmap_read_lock(mm) (or mmap_write_lock(mm)), svms.lock, and
> prange->migrate_mutex?

Oh, I missed that. I'll try to fix it.

Thanks,
Aveline Noir
