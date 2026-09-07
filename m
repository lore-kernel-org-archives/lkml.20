Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4455E126C02
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755065; cv=none; b=gfx5vz1XHmiHGytll/cI7QoTH4XVuM3goUc/ZHDLwwUqDibSTuivvx5St/53bvDLhkbt7L6D4M2+BLO4V16nvCTKAhFGk8QyQRJEh5zEutCDrp+a36cHTnCnuOgU24mUbVNszkuAkgdN5OSg9mTUcnuS7K+s8yxEtSrB/D1urzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755065; c=relaxed/simple;
	bh=b8397s6rxrFw8Jh0i+WpcqO3/9x3XxXO+xcruOWEfqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poEhwbH66F1tiAzX7A/dgfi2AhQToym0dFWBnwkYFb7hQVDKDzfKtG44rNkqQ2MDLHl5LLyUdZXe8NQ8tmSItWbODZDXWlPyOgwR3Drs0VpaQsh4O6yZ1GTFav57ir6PNSgN/HKWzRTDm+gh2T15Ao6TqSXbnvapgZLBfL6EoXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKWMMp1Q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKWMMp1Q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d94c868ea5so31453165ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755064; x=1789359864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gOfzXZ7OX3db6K93hBUSUQSq3Ddcb5aXbz13zQbpzY=;
        b=TKWMMp1Q9eWMUT3S15TdGyFylUmmq6TtWeL0F8OyVzTAt+EpsGBINcyy0FDN4TIZef
         Whe1O2RhPwMzw9kFu+m8hKvJkAh22Y9BuoH21kcxBozVO45ftw2pTInwWWCOtntpumU8
         CRKB3y5VuO6Y/i7yOwmxkPe5yAjv94+t8pfqPrNq4JJRjMBDP+gZJXmp4FuAToa4xX32
         526uvbbhs+baYS2Biu1HyzwDHutJxAsIYE6dcBjI4z9cp3ZTtOw56x+A160c52k5kBiZ
         3yFX6KObrN+8GUZ15wxktTUnzYeXNAtyRThEpW968/2CdNC+lD4mkMDnuF9aPhYxKBXC
         eYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755064; x=1789359864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9gOfzXZ7OX3db6K93hBUSUQSq3Ddcb5aXbz13zQbpzY=;
        b=P8luokPwpuWkS/n+RP0XhLQxh2QEeHRAN14QM+SoOM0e5XtZPRQKFEBMc9MokNBF0f
         WkZvyQhMyAVnNE3tzSQvznHq7SUdByOUn6IbjKfe/ZTMK7XeoH5YLjCmGAOnBjnDGsU4
         ZfFcOtO+jkJbssiV1zvyo9eCqNF6A8c5AYbynVRQX4SLv7rmOjapZHgCaNnPuGqxOMbG
         ERzGe8lV62xzXfqaFjlURVufGf9dEfFVAtdFLmX/YYnxKDrzodzmm6d7Ybk3wZjhIH11
         1HS7p6sfXEr3j/IbOKnlcppQBMQfyiP10HgqVQlXlpWRj8v6fLP182O1ZGRB/D7fPF0j
         i+fA==
X-Gm-Message-State: AFuF++l0iJ1P3Vq3X2EKT1UqILqZrYskUunYveihghPCsCvdbuxMSfVo
	8Drk+JDxF1ixjjz1ckTSYgMRyq/rVMUcNpstC17wJ239vTYWnXGD9F5n
X-Gm-Gg: AYBFou0zqI8gpxyY0/BZrORW3WXOXJmBYdnPpc/xPT1VXr7/ggATI/LcIEWJCu3ErDg
	Pb9ihdOjq2ay20oKFuApRy2D6UheyHwBkNHL3U6J1rrReyB/2WS0E6UJLoZscS748HVTEkuQw8a
	mhQrn2SOI/IUxeB73nkWaIIZEASd9pYbtkYiLghgxTpQWjlmZMbpitSjowULR/B3EWhUFQI6nsK
	pXH2/N1EIxfPhiBPnhF+m8P3pJcqGEheuo6a8OJRbbiLDbC91IOIwpr4fmGFuWLO0rRmVpF6oQO
	C47KRorKCZXNGfwYC3j1AljFc4K3dS5D3Err1HZpOtNNuOpg00qHLun0czklJ4AZ96OhL3KoSbW
	StHbP8NrxDfQJgE03h8+jomyJhobbEmcvrqqxn2JG+794nweTvC7Y+EXr6oc9XTfYsMRb9uf4+R
	mnPoIhXMmsWFdbUJYIrqiEj3k4VSbPGeahXVc0YQZ3rOQUO4r+u93hor9G4nNLqVEnmQURYhd1l
	UxtZ5vg/QJy7g==
X-Received: by 2002:a17:90b:3b46:b0:398:dcfe:967a with SMTP id 98e67ed59e1d1-39b2620a2ecmr30060909a91.17.1788755063559;
        Sun, 06 Sep 2026 21:24:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm22629643eec.17.2026.09.06.21.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:24:23 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
	Oliver Neukum <oliver@neukum.org>,
	Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	Hannes Reinecke <hare@suse.de>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Don Brace <don.brace@microchip.com>,
	Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Sumit Saxena <sumit.saxena@broadcom.com>,
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
	Chandrakanth patil <chandrakanth.patil@broadcom.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	Doug Gilbert <dgilbert@interlog.com>,
	Narsimhulu Musini <nmusini@cisco.com>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	storagedev@microchip.com,
	megaraidlinux.pdl@broadcom.com,
	MPT-FusionLinux.pdl@broadcom.com
Subject: Re: [PATCH 2/2] scsi: fix repeated words in comments
Date: Mon,  7 Sep 2026 09:54:01 +0530
Message-ID: <20260907042402.12893-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904121449.24178-3-hemanth.selam@gmail.com>
References: <20260904121449.24178-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please drop this patch.  Three of the changes in it are wrong, and I only
found that out after posting.

  drivers/scsi/dc395x.c
    "but we'll fill them in in case something else needs them"
    "fill them in" and "in case" are separate; the sentence is correct as
    it stands.

  drivers/scsi/aic94xx/aic94xx_scb.c
    "if no device is connected to the LED, is is dimmed (off)"
    This is not a doubled "is", it is a misspelt "it is".  Deleting one
    word leaves "is dimmed" with no subject.

  drivers/scsi/sg.c
    "but is is possible that the app intended SG_DXFER_TO_DEV"
    Same thing: it should read "but it is possible".

I was matching doubled words mechanically without reading the sentence
around them.  Sorry for the noise.

If a corrected patch for the aic94xx and sg wording would be welcome I am
happy to send one, but I will not resend unless you ask for it.
