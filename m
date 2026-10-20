Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484840;
	b=OWL9v7B2AG9x23m3FCyn8Jxbr0pjDtBddpEjlKP83jqZUGpZn2HZLTx1TZ2DOAUbpd8r
	 hyCy5L1Uiw+HxqDJSRl/kRlbfUTLEx13Z34/G7cQkhJlpzxNMvEO/IObpfuhNhm7gkkDN
	 Iu1W+W74IFgC4+ndt7z8EeClezQcZ9JL3J5Q8oIiW+lhKLxGj7DMC4wgbO/Vq10FuDz9D
	 zLkqZgiqNRbIjzVJ7yiB1Y5VNjfN0V14QC8K7II6WGfr9wbZOj8oDmqWXq4zRpt3bSGX/
	 b9AnLvWBTQjaETbHawxr+NMGel8w4gWvfrO2T5tL5LqlsdJ0edMyzGLdJwUggUaLJsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kX5wt9uloTBUKENvuugEarR+eHumxWJlY0qWlOLNBew=;
	b=n8Q1qNIKpdggBXm5DdRwrZtiq1vitfb9NOo3hymTSpeIqohkEtKqMBi0tBKDByPR8s7S
	 PSKqZvzUUTAZcIiS1TqLUax/c3git5owaRbjpC7mimqfDOXb7aV9EOJiIBrAG/8IPSM0y
	 wiyOgmhjgzzIWOGIrnDycfBkHxC93FzE8bRBn5ghRxhxUwFTJCza83XSHwQSd89ug1OX8
	 nrMvAe9NQIdKPlszJ5A7RYXZc8MIBWBQsot5JMb7UH8IQtY3rxqXuS9jo3sP9imCmDD+1
	 n/upaW5WFy1sKw3dJAkJihuQM9jU3CywilHXPE/upda5mC8EMmX9i93DNOL5ydUpUCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iUAtxhlc;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E3C60A3812
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E3C60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iUAtxhlc
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0cf3b1c70so2046131a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792484839; x=1793089639; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kX5wt9uloTBUKENvuugEarR+eHumxWJlY0qWlOLNBew=;
        b=iUAtxhlcoUBtjAQsA2ZKXqqDMSMvLIdtm9auFahckVtDcaW8+Ak6DrnJYAllkMPAbW
         m7WHL1NJfvdBHNa77/9ZX/1+LxT0UzpCDKG5VdiWRP5P1/wX7aGXoyNn7WUUcyPDK0eH
         6EtKfSXwGJ9cXaG9+VGSYz03X8BEAzQbVMDbD2bw+EC/jGpUsAYElhgU+2PZh1LdgJL0
         j7qfUrEFB1p+AfT7q1qdQGlHZgBeuwQe0qK1nihU/vuXYjiXy20mp8WEWGlV/EEV0+XM
         UcYwqLeRdq/pYDWdpDNvV2avQAExYjyIZJZ548BT7KRGtY32bfv51lnqR7Y0hyVfX1Ek
         c/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484839; x=1793089639;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kX5wt9uloTBUKENvuugEarR+eHumxWJlY0qWlOLNBew=;
        b=KEdynQ7yd64sJrXW8PWkH3yJmWXS15YqTITsI3VX4H22TPA7hwlmqeiZkkoRsWx4QS
         GL64ogVPmI5TXE8/TV5AqYDcPGYJsI/LCZfkvrMQJrGlN3qBVaWnD9tr+PujysXjgih8
         4GYfvxr0Y/9XLidYfeLnkDK/91kHAEZ4WCZDe6so2OpCSwV0c/DLod6ozV8L+XSBL+Gw
         2csB6cqRv2kvGLZzaMkzlT+bVXB85UzY3LqZQlhfvZquR4k7Ho0fYETZn1q9sHWrwdbQ
         jQiGmCSlxIFB0vvwYrVLE6fLFRRxnzdOpL3FQ4H8MjhnFcfAXfMCVRWFNQzLZCN7XAEZ
         s7NQ==
X-Forwarded-Encrypted: i=1; AKwUvByQZzXjTTRfa8EMmUkp1y+FV7KMIeNKGia7E2JXFpAcTt+fot+TZJn2okVnfBaqFdL9uvKi4h95ZASMmIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYI87MgoqXaEcMFCY55dN1k3uunNidLwRHagQx2v3W80Zp4fNilN
	MEqsk7dzpQ2nRGdswjEVc6oWbgVgF2iNgD8XeT1HZyE3/p1VG4sAPsXQEzmTKaE06xD9IPftzoh
	6eQnCcEvyrQyslLSPScjDEg==
X-Received: from pgp6-n1.prod.google.com ([2002:a05:6a02:62c6:10b0:ccb:62e:3f01])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a120:b0:3e2:257a:a61f with SMTP id adf61e73a8af0-3e226025463mr9267663637.59.1792484838935;
 Tue, 20 Oct 2026 01:27:18 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:27:17 +0800
In-Reply-To: <78888420b7c60d2d5177cbf76f5efba04fab5d7b.camel@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261017084403.875420-1-stanleyjhu@google.com>
 <2e042211ca0ebc974ad5ec4c0de9f3f93b3c75c0.camel@iokpp.de> <2060a8da-581b-46d1-a510-779f4df716cd@acm.org>
 <78888420b7c60d2d5177cbf76f5efba04fab5d7b.camel@mediatek.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020082717.3540301-1-stanleyjhu@google.com>
Subject: Re: [PATCH v2 0/4] scsi: ufs: core: Factor hba->outstanding_reqs
 helper and fix double completion
From: Stanley Jhu <stanleyjhu@google.com>
To: Peter Wang <peter.wang@mediatek.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@iokpp.de>, "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@micron.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2026-10-20 at 11:16 +0800, Peter Wang wrote:
> So, should we remove the call to __ufshcd_transfer_req_compl from
> ufshcd_abort, which was added by commit
> 64180742605f ("scsi: ufs: Fix the SCSI abort handler")?

__ufshcd_transfer_req_compl() is a wrapper around
ufshcd_compl_one_cqe(), so calling it from ufshcd_abort() has the two
issues Bart noted. In addition, ufshcd_abort() called it without
clearing BIT(tag) in hba->outstanding_reqs, which left the command to be
released a second time by a later ufshcd_poll() or LU reset.

In v3 6/7 [1], we replace that __ufshcd_transfer_req_compl() call with
claiming BIT(tag) via ufshcd_clear_outstanding_reqs() and calling
ufshcd_release_scsi_cmd() if it is a SCSI command, matching the end of
ufshcd_abort().

[1] https://lore.kernel.org/r/20261020082110.3511797-7-stanleyjhu@google.com
