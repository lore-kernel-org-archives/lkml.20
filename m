Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333972;
	b=jt90orSCiuDoUnTMzWe0CNi7tqJ4zTvHg+Ll3pD922bBKBdsthUU+9jLzEXJmfjsVDq9
	 tyK7tSZA7F7We8lrtGFoWhI8Af1jjNcru7SFKSR0EMjie2K7+/T4NR26/EYUvSAM8IW4k
	 9w/xjLctZas8b8M6Q0adK3IW+2jsS88esK9ntLjFUxzARYvYRZ5HTrM6tA8maNxq9kv56
	 c9TvsMUGFkIY23p6Z8egD+Q+ajTkuopzb/2A+UMdlcbAB6ySb9tHu8XJekM4mwC/bm3ST
	 g3UKruEe000JsGNyuV11wMMBtXtwdbg9qcxEIcvjN5EO1g9XKW3qEWyZO32dwAxeakg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ixvNCvc3ElMgxUSC7xZq0g0AIW9Y+WnUXNOWMqR4I1Q=;
	b=KsTLT03nzHhk3NisE7azhF1sLNai7W1L2mDTFBpokp5mapb5f+vgKsqtea04QwQHlJkW
	 7nRpXGlukN611kKV1snLnvtdWeKgAqG34rPr2hyXb5HiLKruj52flkQfbCvYV837iElRF
	 IZMggKsbYmUSPVuF8b+z4eIs39PlgBT9QLuOucqz4uplW+w07wwuATOnd6O5e3S2SlGha
	 WbflZPh+wiw53dchQc3Q2qgcXGiW1MqUqjvWfvBIQXnSl/yq1PPIYHHaxX5oqnM0QSPl5
	 C0ggYX+DTGesOZJpuXk1kaIULVYlXWSAFr3iaASKLhakFQOAQ6wioz/QrDc/3Czd4GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsgslOaG;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IsgslOaG
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so109273a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793333971; x=1793938771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixvNCvc3ElMgxUSC7xZq0g0AIW9Y+WnUXNOWMqR4I1Q=;
        b=IsgslOaGls1pJvu5hBLCIrJnozn/KIWrwwwzBoV/v30/KrDa5ZNG2cwOkjyDunXVGz
         /Puay8lmldHZyh8Ch+VmCqCZF37So1H/4U5sOFLaYS6GwtcgfSo86vEvmX3ptD1Azxql
         NUXM9CHKeckLBjUi61W9V8wFevGFMAkUUQgEfH7+P03Azh/g1D2I5hXukEQbUK3mAy/4
         gPAJ+KmHE4sbWH1bVeWANThWAkJduAHrie2x1PTriLftmJhq9aGunQM44TvLtNcNE1Jt
         6P/gqLvRDs0oVAR0v9Du9fA9DV9wwfC95ZD5NKee2NZBLBGJ3Yx/3SIVe13kbDa2s7Vm
         icCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333971; x=1793938771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixvNCvc3ElMgxUSC7xZq0g0AIW9Y+WnUXNOWMqR4I1Q=;
        b=zicgZJM3FhXJnXmEosfTJKGoDopHDqgcT6wDJ13k0zI5D8pPS44nUpSDzgmiVq7PA7
         MkofxvTkzs2DcO9ou67wLoqxwBhf2rNNX5l0ZW13FHbBSP9ZyfQQYvX1d3CC8QAb1zdq
         IRo/Zi4NS0KKNQ7I6kh+C3ll5lM/OYb/xKgZ/TFMygYYLCXrExra+os/TVeLgRhR2hb5
         CcCOkAw/lXYpgEi7op3bEN4dITxXhI3d3eOi8DALKRBSsBQmuEsES21Qf3fHaMKQi/Es
         NHcaldhmKfKZdXLkwm6ZkyIMQers/vlCHnswYlq1IynQIVq9ght8oYg7XuWUpoitUIxW
         lDIg==
X-Forwarded-Encrypted: i=1; AKwUvBwGD2OUDb8MaGkh/ajZ4LhV2m8CjK6HCrVbIqFQDLFKN6ti8kjCXvWSYf6kstnm0ztwwlm5X59W+UGhIBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq6tMYue4vWGriZKlsW4NyIxoEUgkR1QK77Zf9DjW94BJN9/gu
	dCI/Im5guGCqY5Z3i/2i28l8CmprZjX862fuQEtAKjdY5b5WtiHd3fQ=
X-Gm-Gg: AYBFou0KKcOyijberVsuGyLpO+r9sIOI34Klhv9Fds58p2+eGKjOPbuoLO3jt0orjNA
	ImDGJRXo6tfbKznb8s/XZgBGHO2fcrX+bOl+/UL7/B8T4HJVEj/TWyLZXNlSWY6sZ74m5dO+xvN
	nP2wAJrrPWFK/tGb7kaLaZZCxdHM2B101/ITMJny4jk5KwcCZJyG02U4quMGRSCML4yawYq0qbA
	QfBTuTyxLdlCmGNX5kqzitcqo8Ry7YtOiO0RLASlHuk4MBA4tXoitSCZilNm87eQDAsPU4H108r
	FtMzIsq3OpCPte6RmKm4yVau++6jk10dn8eO/fGFRpazBZJX8H54vqdns9K5g+KWZokiVaFLUsk
	3R7HuY8KhkZTee7LlTjIzx6VDx4A5tGbAKBuxxzzf2aSVY+fMGlbztMgM0kAklWNvrRbbGhZTU8
	24TOpw3oLHIeIO8HD/YopmX6K01PN5SJCjiUli308Fp/fs2G5mpmRmo3mQ+wTcIJ5PH1YQsS49b
	y1IrDpoLKQLrbNrLLbEZP5Gz7OJytQxSSAjto7de4sFQeUXs2xvkP1y5HE7yKKkOASVeXNPD7nC
	mRG53qHZqjgu23sXueuEBAurKI+PWmZUej4ha0zM732AIIkqSntJFdZt5QZ6GEsCwMxL
X-Received: by 2002:a17:90b:4406:b0:3ac:b6eb:e0dd with SMTP id 98e67ed59e1d1-3ae8984de49mr744782a91.50.1793333970822;
        Thu, 29 Oct 2026 21:19:30 -0700 (PDT)
Received: from freddie-kane.lan ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb1bfdsm1030302a91.0.2026.10.29.21.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:19:30 -0700 (PDT)
From: Burke Cates <burke.cates@gmail.com>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: jjohnson@kernel.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath12k: fix MLO 4-way handshake timeout on QCC2072
Date: Thu, 29 Oct 2026 21:19:01 -0700
Message-ID: <20261030041902.2740757-1-burke.cates@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
References: <20260815014329.3748059-1-miaoqing.pan@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Aug 15, 2026 at 09:43:29AM +0800, Miaoqing Pan wrote:
> This is observed on QCC2072 where EAPOL M3 uses the MLD address,
>
>   deauthenticated (Reason: 15=4WAY_HANDSHAKE_TIMEOUT)

I hit this on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite)
with the on-board QCC2072: Wi-Fi 7 MLO SSIDs (SAE, PMF required; one
6 GHz-only, one 2.4+5+6 GHz) failed with reason 15 whatever the
association link, with M3 dropped by mac80211. Non-MLO WPA2-PSK on
5 GHz was fine.

With this patch, applied as posted, both MLO SSIDs connect. I tested
on v7.3-rc5 and again on v7.3, each plus out-of-tree Glymur
platform/board patches; on v7.3 the tri-band SSID connected as MLO
(on its 6 GHz link) and rejoined MLO after s2idle resume. That tree
also carries your separate dp_peer fix (8b6b871332b5, "Fix failure to
create ath12k_dp_peer on MLO reconnect"). I haven't tried the rebase
onto ath/main that Jeff asked for.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
