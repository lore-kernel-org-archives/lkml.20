Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BF3C417E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274597; cv=none; b=V7JA2jjKESuiLT7GTMmNFAisvMDXV0MOSacuTtSc1tqTCpo7JY61AVX/S7+QUf7YlGHGsl8Uwe1Al6bGV9cpoH57RdyW6qk7B5C4aoPRr+uo3w0XryQ00qPaZ6lDbswvnQ7DaPDyU1moeh3LqXmpCWCNqyRC/+dzRv9Q/+Gy460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274597; c=relaxed/simple;
	bh=KJBdGEpLDa0C4+0sFGwlBRRDrjOlZR3aoT9AePMS6TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7Lv5h3uyvhcqwoPxi/+TB793N+VyATtNUhsymG+3Ny7LHAX183aCqm2ykLpwvmxAiXJDflWFMeNdJZeyosLCo/itL9CG6VuV4jdU76lwvzbxs0ocSvZxQv1XFf16/2U5PicPhtAzvTS4Yg41MI5XxproRhJfJH5hHNZ4s+PXCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDcwHJqr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDcwHJqr"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c02782159so226153f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791274595; x=1791879395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KJBdGEpLDa0C4+0sFGwlBRRDrjOlZR3aoT9AePMS6TU=;
        b=JDcwHJqrMIq3l8aL4Y6ejT2tCRjQ7XLLjrPp6R0hPs3LpFeSmH7PimWrBX8HbDTvNf
         fzV6IG6xkhgR82LWIj+7ajuEubH1HhmroIcXrJRCq7kEn3zYCfUYKUpn0ob609Qvy6mL
         iV4evr1x3HQvwuP272U4PxX4tWy8fvjPcXVm1Nx4ewdktGsQn0cs7FP8yfyjcTrmT+3c
         vhG9r2br+Vq/WEaJnrAcy3EL5IMiVs4BaC33DbiRXi/eVK8WUPTHvOYI3AoTXTcosz0v
         S6xLQ5IVowuz036PWCU/276SnQHaCHGL+VKdowp3ihTrNXoiP/Ufc2R6ZhGzmS2ViDRW
         9thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791274595; x=1791879395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KJBdGEpLDa0C4+0sFGwlBRRDrjOlZR3aoT9AePMS6TU=;
        b=PFx0F9Fo2ePwEuL7q4dvmqNj49HCtA8nYt0ZRoeMAdqQJ/xg4/Oz3Jz0vdyYFEqhEu
         foI+KT1Juod7Y/B5VUVmDPzAIlb++BWDc7/BkBOqGnwpqOdTxwgOBQ/lgTJrm1FH1BdB
         f/Yvs1Nj/mDZB1Ju3FO9MqZrbKzAnPJxtkJBL9tM2IxSO48deC4px9xaVtU6/9YqS1qd
         QwgxJViX6Uh5NQLVz2bZvdTgFq4Z715WVcrp4JksVcZnMUcOrX+FZfbgJUN6sn15vzLE
         2e8HQRb1Ionm7x31l506K/tfsQyfSd34Auc+3cINVF/c7OWwWM8h0KFmPUAw4E66IUn0
         t3gw==
X-Forwarded-Encrypted: i=1; AKwUvBxx5qGcx9NdQRyRef4lOYL92HD0ZYi7sjWmMVOsBALBWIKLt9kL/68XjbdlODsuyQ6Jk4NAm4s1BG6be2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8M66G/MCKfw+r5YzC4DKlS8Jo8zfG/wcmTrjflAOLQRblt1Lh
	fHJLOu/jlbgAY/94oy17xANW42JCEdi54gO+rqTYBZPDE7m0zTSQfO6X
X-Gm-Gg: AYBFou1sWTDu0YGGjyj9tpFOOifPfcsAWiMzwTaFxFQ783xxX/mHJjJ7oGJJYSwhsym
	CbO6DKhfidUpaesILjaKI6nWsi/I1VC3O1DHG0NGDUl6TvURymcKNlW0TMXz2jL5YJs1PZIHE3n
	MAA+NqFAV7emnA/M8yMGQaZY60jNO/2v11SoWcqmZwvyiybRL5fxF23YgBrWibGkyy3bWwUlD/l
	3Agxw0cTGtA+3wyteeUokSk1lTk4zMF1ZoujGwMK43h/rKIX3N/ggIu47VKIAIITebd5A1h4AMH
	kJvLXFsb1Sfo+gbR7A/Uyth6rkVYukOj9dgEZFkiZ5ao2NN9s5sauaylvC6sIn0QJbGGb9MfUjt
	DixZbGUo5J8QsZDR6TRxJkIOAa9I0cG6G4XeuJUwFgU/lvuFqAuC1TQcCIYmlM/3chocGcIGuLy
	51YPXnedgFwN0761KH/RT8HlMBD3uGMgb5S/YTsLCHZ4Ocu8fa9qNX/yoLIkICIg==
X-Received: by 2002:a05:6000:4b0e:b0:487:106f:ee31 with SMTP id ffacd0b85a97d-48c6d1b260bmr830584f8f.27.1791274594512;
        Tue, 06 Oct 2026 01:16:34 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622ab7b5sm9481343f8f.37.2026.10.06.01.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:16:34 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 2/2] wifi: rtw88: support channel switch in AP mode
Date: Tue,  6 Oct 2026 10:16:32 +0200
Message-ID: <20261006081632.382185-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3002971ac7824b0b9cafa852e0e81e8b@realtek.com>
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
> Can we stop the work properly before hardware restart?
> I just don't want many flags (conditions).

Yes. v4 cancels the countdown in rtw_fw_recovery_work(), under the
wiphy lock, before ieee80211_restart_hw(); the other stops are the AP
stop, the interface removal and the WoWLAN suspend. The work then
tests nothing but csa_active and the countdown itself; the running
flag check is gone. After the restart mac80211 reports the beacon
again and, if the switch is still announced, the countdown is armed
again from there.

Best regards,
Mehmet
