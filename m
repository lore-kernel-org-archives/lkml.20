Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C753C9880
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475868; cv=none; b=rt5ZCeUwhB7ukuINq9rnJDgScM0WYgCfUgdfeiPLcgKI5HsaKyUMReLggWpaT/stEJUcE2Nx38Exp0y5i6S6LQdhel6CaBcivV921dSrJ4Xdrg8tvfice67oc24OREmwtAjcgPkRhMTwxfIXIW+n90JqL4WYuZb88kZ3niALTpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475868; c=relaxed/simple;
	bh=PNlXEHjK2B9b0orFcipGeTUwZ1wdjmlH8mHEOReTbi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlKAFWhrZRCSygd1qwbwatjtCCfm+Uu9KqXK7DTIIISBDyAm7tvNsASYnZYG976iBkquaD5QK8eoNZ9ncYu3512vJ82YeNZBBsBWxcyE4hByj4hZ4PP9YfS1AslzjUwwZLNV+5/YE1xuvL42fLo7l7PzEk3Z618Hb3P43/5NhEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqN2cj4M; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqN2cj4M"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so563778e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475864; x=1790080664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBTYIyrUzxbaHc/VKLKI+lmFuAUg1QVgT0C/YM0iinQ=;
        b=CqN2cj4Mzf5zHQoX59EX2Q+JHtPqz85isJygk+iqy8DCqvz4+rd9xZ5wbE15UhrRkE
         iwqbf8+Ou09AnQTRszun+Se+Vf4SCqTiDWcPSE6AOdWYa643hnDG4a8wpfBA5DVIvi4p
         MmTeqRVz+xfqc4Y5o9iS0J2Acka4ovFAUGhXxp98jAXuGQmlNh6cl9cZYcOa1I8qUxSf
         NqRWT2IWGckQB+gKrN8tBMH2QwHtVgaCL4SHBU2YD5pKNHwvNcKHrnjzP+oFV5B3OCeF
         YFYEWNi8UxCWYjowrk8SSgMCNIwTZqdbcYpC5UNtXAP370FLIgO/6Kb98pvnksQgzfoX
         QPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475864; x=1790080664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBTYIyrUzxbaHc/VKLKI+lmFuAUg1QVgT0C/YM0iinQ=;
        b=aq/zQ9fwDf1hoQwfM20vfTqrAICD7+ROOnJAjFDtXeEP/aN/egXaAX8FEAnqlgpy7c
         ajGxhLhshQFBZYyqR6fXQ8fU26tzLXeCXfr+wJYzBy00Exrwl2kWYywLdAWj0FZho6tM
         wHtQEO86K0u8dEu5xew6289VjLPOEX+c3BsKX+xhuKTN2qK1Gt4eZaFejaHTVlTNa06y
         37Ze4ajFsNPRr6WYQbj1vwRfqe5dArw+RhLPr7wpfWogMtwAaR5E3uL/LUbTthy1FO2e
         gxKB0BlrpFkQ9J6l81JwQE1or8FxH9TAZt50L6HdwCYjYNyHJ/fiGx+PlpSi5ScN2Lqo
         9Jcw==
X-Forwarded-Encrypted: i=1; AKwUvByHdes9wcjBZchIZBaa85rtEellPC4d9C7ZpRqvRvVAYH4a7YS4fAXEAr0LdFFvlC53rARjtT0SruN67bw=@vger.kernel.org
X-Gm-Message-State: AFuF++lO+AxeHWbtFgnSPtdO5cyjJJT3S9j9yfnR7FdSs6A2U9hM/0CS
	qR+IFCCjSVGIKboSRnT5UugR6a4c/vQLyQF5HztfKzkSHbw9scrogftPA2FEy6CRJqp2sg==
X-Gm-Gg: AYBFou101bM/xcuJK7HIT0j73emNuCTWW0Uy9LsncCRzbqo3iREI3fBxPW/rLOsLa+T
	C/l/Ek/Vg1wY2p4g4GrGg5JuRr0T1wSk4IpdI3ryAiO/omfRCgXY35HRiYnPAzVsQQUAVWhebG2
	+ojBl6G+iEb6Iyc+7XYEtB8iqslQ4fMPIEEiq6Kv1dWOisZEIVejMWJql9lYWGyrec3SnMSYY4m
	L5kimsG7Y3f+AqqgAWqF8oK2um+X88+3XvkK8ENxj8mASwuGShmuHXJ6GmWWrFjQH4GS6m2deyu
	lwwUHPM1kmSLu72Tp95evSRVvNuys3qpUwme1nkvOM9CaQTRSqIdEliLkGeW27fFrXzrfttw3Pr
	D5W/HjuNvoV2EzoPd13k8F+whwTPLu5cAZYMHUfS6lPZ6ndvNDbhuNNwP3Kt1L1s1EJnhx9tHXS
	rXysjNxGin6KmFjn0MV4ym+KxA6Jok6h0pasU3knlQ88uJ2ETEQFAf4j9uG564Zkf0xUXSTuqpS
	+eKXypW8aszkqGqQw==
X-Received: by 2002:a05:6512:3c90:b0:5b8:99b0:6565 with SMTP id 2adb3069b0e04-5b8ae67d2a7mr3505713e87.6.1789475864168;
        Tue, 15 Sep 2026 05:37:44 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33a1cd1sm34986181fa.42.2026.09.15.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:37:43 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: Re: rtw89: BT connect state differs between scoreboard and bt_info on RTL8851B
Date: Tue, 15 Sep 2026 15:36:58 +0300
Message-ID: <20260915123718.7239-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915122625.6341-1-skokovmaksimevg@gmail.com>
References: <20260915122625.6341-1-skokovmaksimevg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same on WL_FW 0.29.41.5, the newest in linux-firmware, with the sink
connected and playing:

  [status]     : enable:Y, btg:N, connect:N, mailbox_avl:Y
  [profile]    : profile: , A2DP_active:Y, PAN_active:N
  [bt_info]    : raw_data[49 00 d0 00 04 00] (type:auto/cnt:82/same:3)
  [scoreboard] : BT0->WL:0x40000003(total:0, bt_update:26)

BTC_BSCB_BT_CONNECT is not set here either.

Two further notes.

BTC_BSCB_A2DP_ACT was set before I reloaded the driver (BT0->WL was
0x40000013) and is not set after, with the sink connected and streaming
throughout. bt_update does not advance, so BT firmware appears to send a
scoreboard update only on change, and the state the driver lost on
rmmod/insmod is never restored.

The cycle reports are unavailable on this firmware, which is why I have no
slot statistics to go with this: fcxcysta[0/5], fcxslots[0/1],
fcxstep[0/3], fcxnullsta[0/2].
