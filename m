Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1D4434E56
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788268; cv=none; b=F8RQRcf03JcVrfp/4YMvboGeCthvjh1dQqW9CEWmZpEwEINtLxxPuajkoo1Mro7pZWyjGmiYBtQsNrF8x75att+d7UiGSo2smuyq52cxWWUUeW2OtBBVlOLGh5A3zaesjirrvRWtL7p2ttddxmcYEfSWPm/HNvnL0YLps0xSIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788268; c=relaxed/simple;
	bh=P6spEShhJuUJwspagHXdV60BnHh9HGtQLAR7l/RQSpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mR1OwlIevQJ4wAIzIYMc1Q87dGsgJziETZ3GzZ1kSSoy/Rm/Xf1s00E4DzW2qvD0Jhl29+w7kGtQzJfW6R+hLQbaaCWiD1AEbBbsFfB/NYVSWxT6rsqSY1qB3yKuyvjok2s58LH7GAcOijdyp3FvKhN1s6oR6hs6YnVPgAt1hq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3RDrDtA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3RDrDtA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so15809805e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791788266; x=1792393066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pb/kn1bilH8QkmWf3l7OGZJ5xTA+QDSeNfAS3mOibcg=;
        b=W3RDrDtAIOYkUhFlQ5UGdWxsBhOi0ff0QXxOaoHXVd+9QOoIropo7mQ+/EMKyExkIu
         uCfQ3DjcD2LItXYzZrXeZn3CiPwvxpGwEY0FytBQXhqNTCTaLl8hjcYFg+4WsZuOM9A2
         9fZ6oJBpKhs3AXRWhs1cH8Rj3TXuj8HOZuxOJjv4yoyrxYtezT5ZIuIrVAxBM6abFycC
         1onZKZs7POJfMn1UDaw+gjz4WDPR4x82mlmBe3bB1/KZ3jaxrKZxxeNancAov25pN78/
         DlydDTTjo/9r/zGZ9qxKn1TDRr4Wga61gDIyyXuODxC/leXGOnt5hIFbOheY2PSl/ALV
         uZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788266; x=1792393066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pb/kn1bilH8QkmWf3l7OGZJ5xTA+QDSeNfAS3mOibcg=;
        b=yEtW3RdnRnkDMpjUq3lDKmLYCekLCXp12ZNCENuC9yNoldSiAv4tgawiyLxGoHhO9D
         6rAbhVHI1vMj59lJd/ZO+bD3eU3P/n70N5zPGRDWpkdaCoslmhvKkcEMDlBhXQDLQY3b
         c4ZCaCjRlDeRBU4eh1MR6uxYoIhb/0RZepi0h1SecHcvJ7FRVz52ia5qdHAXyJang6gq
         ymwXMx5a2nPo9s+8Xg45inrgzFl/COLuHT0DtuVhKg7rGsrpuzWe3GmVMvCJ1PX710lw
         FqVJCtt2A7dIrYSOx3KN4OGgaie+u4akBHyUb+s+s9qOu8pb1C/4VY1wCkDB89oQ+xM2
         Qw+A==
X-Forwarded-Encrypted: i=1; AKwUvBzky1UHnwbqn0Vd1EsEHF0KBnUX1rYz4WyayidOfrE35oUh6hcDG2RV5aR2qtQhpmq30KCxRj13lMqiGms=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3DxxvOeLxP0g+hac9rHtOArAt27y03WQMQ77ElFg58JYwXtcd
	HpUEjZy/YvxlsF86A/J5VXOIrk0oDyFwY7aexdhKEYFA8fKiVswjwEXS
X-Gm-Gg: AYBFou2CMxSRdZumEkfstM53uDXKIgS1UF1PN7RIjKKujGMuYs6/NSc9hA7HuXPHWBF
	bZ9A73OlXLTwin9/j9su0fuonVU+hWNSyySe1UmD+T+wpW7Ord3+PsS7K0SpJnuOUc10GxoGWzA
	jcQps5VU1+zRNArGK9186vfAu0c/+hLVZUBJ7l/6coDyJzLhe9eqr0q3Kojc0khLlkpwBwlhTbb
	mzU2cO3tMfjXzVb6qF6oSAT5555QbgbJ2j5BxPw//5lNxmjCgQUgPLEOnqE2jV/6MHvpwLQw4xa
	4edwbGdZUyfdUWxZto236hs7RL1Z69jUQ9w+IRk1RYuUnbZc+vYZMp2t38M6DFwnjKBePAf3THx
	CeZmzok2kAtWvdPSOXkKFdwfchcyHokseCqnGsZeW06tHDmmQrOyhgDsMWjhbxHPYClvWrdvhhS
	iLNs+LrD1ZC4zyy1mdUGFTGD+eQZdUE2GoJEauGKLkH/+n779fCk2JLkxS5AfWOGbEbUuZo2+OU
	vq2qA==
X-Received: by 2002:a05:600c:190a:b0:4a1:746e:589a with SMTP id 5b1f17b1804b1-4a18e4aea54mr176998935e9.18.1791788265546;
        Sun, 11 Oct 2026 23:57:45 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm208854355e9.2.2026.10.11.23.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:57:44 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH rtw-next v5 3/3] wifi: rtw88: support channel switch in AP mode
Date: Mon, 12 Oct 2026 08:57:43 +0200
Message-ID: <20261012065743.17665-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <04b18579ec644839af3d5baa1790618f@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-10-12 Ping-Ke Shih wrote:
> > -       if (!test_bit(RTW_FLAG_RUNNING, rtwdev->flags))
> > +       if (!test_bit(RTW_FLAG_RUNNING, rtwdev->flags) ||
> > +           rtw_fw_csa_active(rtwdev))
>
> As my comment in patch 2/3, I think we should cancel the work at core_stop.

Yes. In v6 rtw_core_stop() cancels csa_beacon_work next to
update_beacon_work and clears csa_vif, which also covers the firmware
recovery, so the wiphy_lock() in rtw_fw_recovery_work() goes away.

> > +               if (conf->csa_active)
> > +                       rtw_fw_csa_start(rtwdev, vif);
>
> Is this a necessary case? Can't rtw_ops_channel_switch_beacon() handle it?

It is the restart case. After ieee80211_restart_hw(),
ieee80211_reconfig() replays BSS_CHANGED_BEACON with csa_active still
set, and drv_channel_switch_beacon() is only called from
__ieee80211_channel_switch(), so without this the countdown would not
resume after a firmware recovery. v6 says so in a comment, and the
same path stops the countdown when the beacon comes back without
csa_active, which is how mac80211 ends a switch.

Mehmet
