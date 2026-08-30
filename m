Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561B618DB2A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788074831; cv=none; b=Tjx4fudAJX+qSa3GGMsdlqksDNYZLPjFTRQCRGJN04U0zbLlzxpQtIqYR+FMqsdkk3fyoHGA5O1DokUvWfFJEWxw8LcfnKlyul6Ws75aw1EGqkYaQWRjH2rYJJdI+WCDScvhRic/XZSL/FYKYEi51yzyHjH06PW/pL5gl7TtMEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788074831; c=relaxed/simple;
	bh=H0NSc8dCdzQEaixfxG0SBDT4pCc/TJMvf+PTu1jP0Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NX6SCbQRfilGKwUAAqm2MyCm+/9IXUlXveCEESQthyqkSEE0mxpZOGUOmeptEDASi2VekDBPSJHwi4rvh8MDKNTGYfrvFGvAYcZN1LyoXTMCq6PQDXWm5PmCAcE+rNZhjn/hT7OxbCXxLZycqck7QgbLfWdkc+sie02+6y4n/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMeyZA49; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMeyZA49"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1cbb64a1fso2305862a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788074829; x=1788679629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0NSc8dCdzQEaixfxG0SBDT4pCc/TJMvf+PTu1jP0Oc=;
        b=hMeyZA49RhNNFB6d9ieIOiX5ZX/BRT51AuPhclqOpiYgUKADo1P6+2SNTUU6qPpGtU
         UmggUjAJ4N+EEjWVylH8NAX1fEt5JHLGFc6C7+6dJWoO6m/kEJBH/GjjmdbIrpg4Kilb
         6ylgJSTpWV4DnXWPaZivjrvAjPaMYkHIKeYu9gG0oEPBEyMupsxp74t172UZw9rXu6Dh
         h3O8XJEZI4Otly7WEZsVBheGOGT45XHB3yDJnO0p4h96WBB1wZ8VAm5AdST3VR+UJLAo
         C3As9+mdgLRWvTbJp+S+mV3auGNR3dqRRMMqSmHdpXhIMSrTyV4gcjlaN6reHTqZCTCl
         8VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788074829; x=1788679629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0NSc8dCdzQEaixfxG0SBDT4pCc/TJMvf+PTu1jP0Oc=;
        b=DDV8TEHw0/CpsBfsJ538Kg9Iq8oCKzWS/vIPQYPL+4u+OVyWn7lvOBVkNaI2Xql4tR
         RENV29y8kPUdfcPysdt32D+h02eeWq16Ia+33129JiDzz2BBrb061qEz9rUHzwdLMuyR
         oejxoZvsmcMp2JmI80ToUmSdn9y1VSzi7QvC0KZMIKqH75Q4gCj/sx34RiV1rSduOb8p
         iKUxvxKddWJIhhqLRF873J7aAXcaCy2+2XzK84Bf5q7dsfPO0sadlMnBVKNojhN0w9i8
         kyrXdxYUCfaShB1HcIlZ0Yqcnqkx0MbdrZZUvjIt3cWR3obHjUd/xlNTYC0FmE1RBuIe
         QUaA==
X-Forwarded-Encrypted: i=1; AKwUvBwy4E4KAuFSLBQGXbAM4wh1RqdPm9DY2ai8K32nKDMibv0Qx2PZoxoEynkSfBuDu7qjb/i3vzmz8UT2u80=@vger.kernel.org
X-Gm-Message-State: AFuF++mAX/c6sUZsdgt7ODRGn0zDZK2Q1igoFxX206IhssFps6RsHObU
	0ayur6qpMmCpqburv0LENHPpLFg57inXizHW0VAnm3wHMtp7ZFecqcW2
X-Gm-Gg: AYBFou1tKEZ1EW0UPDCWRMqviL4tLtosQ/zXCI3WAFU3o8+eLCjWIKJnG+T1p1zccxr
	zPt+pwTCmMJSLDNpbzPcxlKw6kl7J/8fcZy+F++JLpLk1GMuUnLj90MuB03iVezQH6EpDe3cfGc
	CqDxWiGaxMEcX4N4dz0384WEnpvQEtgi5OqUIIiO9szGxY8JeDL17i/rBgd7OHq36sHGaryZzB9
	moH6LlrdL+s7jNf4rcNyGxbNNsDq9Rc1ePddXOWcXPlmiEhQQ2+tUrAnv9HwLQomwpLXcla90Tk
	NYyxfTFX6yj8eSOCeL3tvulvDZ4QUjNsYs5/zUL10bcYdXxR3hCaiuVDXci7FDfBb0nHDUOYs0v
	on42FXVrpLFOXRdKY/Lt+gPETIhgIwvxUPBYUshKrdALI50DSF9uPrRGl8MCSbLK0+l+rLSsA+Q
	WCBXXzASgyF8Elt3pT/TjDHeqc3ZGTAPcjQfqcQoV3ANhES7C1HPlSv50rNf6yeHy4XKtHmm1HB
	fBjXRO8O+Zb9ZxJWbW69Q6BkwX+
X-Received: by 2002:a17:90b:3f50:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-396d0df72e2mr29568789a91.7.1788074829523;
        Sun, 30 Aug 2026 00:27:09 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398bda33e17sm4492394a91.14.2026.08.30.00.26.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 00:27:08 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [PATCH v2 1/7] mm/mglru: separate folio generation update from LRU accounting
Date: Sun, 30 Aug 2026 15:26:41 +0800
Message-ID: <20260830072651.78997-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827234704.63163-2-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-2-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Extract the generation update into __folio_inc_gen(), which only updates
> the folio's generation and reports whether the generation was actually
> increased. Keep folio_inc_gen() as the wrapper that performs the LRU size
> accounting when needed.

This is a nice split. Separating the per-folio generation update from the
LRU accounting makes the batching path straightforward. Looks good to me.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
