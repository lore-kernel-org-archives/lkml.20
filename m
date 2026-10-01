Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC79E48EC75
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844095; cv=none; b=Oc8aVGeBWWNlGbJIxHczYPAYyZO0hdkNFFy2M/efcR9kDXujc2oGoSin/NPRMsi62YTJMAa0X0GMTG0HPwfOlouHpb8GBArSpAuquPx8o+91C45LcSQYdusOzsv+esVBGaru2KQVl9j++0QMW0XTxPCpg6h/TGBiAdiLhmIGnXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844095; c=relaxed/simple;
	bh=jIEy5cT5mmkkVcGKdpbeH8K331ZFV/0IWVEdNWVBdcc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PGc9hW6YIV9aMcZ8cLJRZayQFr84AKl4HBJBO8dxwIE7GNpUoqPASojbm/iWnOin8VjWeZPf4AYDqecu6aDSpjdMbmZBOe8V/glUVZ8sfFu1C7tCMV8DSjEkqObKGzj3zk53R3wA1j4msoPXPTclwesB7QVd0j/mx5/0HRWCy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXWMbK1K; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXWMbK1K"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3491724a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790844091; x=1791448891; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIEy5cT5mmkkVcGKdpbeH8K331ZFV/0IWVEdNWVBdcc=;
        b=GXWMbK1Kv62x+ZZoITp0Ot7q1ybxLRMceh2wjq9i/v6fAQMQ2EWZBNcMgfHuEiMYfD
         qMYHydBHlQRcFBVxKGQYKk8KEoCgISNCk8KS609wWbkXOIKysa7WmOjPEM/IUsvh9BGK
         XN2FPykKFP7j8Qc3OhnXuUTyZuCkLI59fjN8nQTFjNA4vE8yFNupWZaHNCsCjSU3pXLF
         MojyivZbU8lXry8xF5nPMNniqbIlxHzUHinPBLsnFmGDD0Hjt1jVP5cfj7pGiOuuy8HO
         AoqsvulUkHEzFu59us/NG7H87CqZDGL4etwnXSUBqrVPYpRCgOb6Cit97wHE8np4Yqkz
         TsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844091; x=1791448891;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIEy5cT5mmkkVcGKdpbeH8K331ZFV/0IWVEdNWVBdcc=;
        b=Ff9SDkzFJHM1UigDfUKTHGwe/fjX5Xr5pebX1/Q5BXQfJEq5ULztmqOJRGZIJpf0y6
         hN3wU38IQANrTR3O576iHBAT/Jhlx2njzdExsuT4o/e+fXhAeutpYyrnhcqVSZLnNkyD
         z8ZrfM6+cItozGZNbViU4QYJGGnazJtfo9GueKpj40nZqb7ixjVoexEijheJn/KJCUot
         l8xdA3IfHaPIFuVGOUK0R3PXIDwgkZkMo8AejH18X/SDHR9EHB18LXuqZOAGfixo1Tlo
         Z4GSdzfpEEQN1GmzFVCDDGSyCkvUeNY83ZyUM1MbBzwO2NX/1ol6EyWq174oJnwGU9p3
         u4rw==
X-Forwarded-Encrypted: i=1; AKwUvBw4zp820O/Cjib7n54A/Jzpo44+XP2qL6g1CnZ9URGO4tidYah6Zg3TpWjlfK4AHSfoYhmiOPHrxE54/9k=@vger.kernel.org
X-Gm-Message-State: AFuF++lBz0NmFvD58YVG4muC7k/7Djpp/QZTieGzuC/BkI+QreW7Fpew
	4pMBVpH1r4DOop31d6zXAG0IEmRmd3KdYmNMpINuDkG1oCf0fRZd0Y2kOi3/4N+m+dc/BZDuDsR
	qofzHj2PX7M3nTHF3OHZ5Nw==
X-Received: from pfnn21.prod.google.com ([2002:a05:6a00:2b95:b0:886:fe91:dd9e])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7d8b:b0:3de:55ce:75d1 with SMTP id adf61e73a8af0-3de9e86af8dmr4024094637.92.1790844091336;
 Thu, 01 Oct 2026 01:41:31 -0700 (PDT)
Date: Thu,  1 Oct 2026 16:41:29 +0800
In-Reply-To: <20260909091045.1134956-1-naomi.chu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260909091045.1134956-1-naomi.chu@mediatek.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001084129.499805-1-stanleyjhu@google.com>
Subject: Re: [PATCH v1] scsi: ufs: core: Hold a clock reference across the probe
From: Stanley Jhu <stanleyjhu@google.com>
To: Naomi Chu <naomi.chu@mediatek.com>
Cc: linux-scsi@vger.kernel.org, mkp@kernel.org, avri.altman@sandisk.com, 
	alim.akhtar@samsung.com, James.Bottomley@HansenPartnership.com, 
	bvanassche@acm.org, wsd_upstream@mediatek.com, peter.wang@mediatek.com, 
	alice.chao@mediatek.com, chun-hung.wu@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ed.tsai@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
