Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622204D17A0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024031; cv=none; b=Z/dKhS9vaDwC2fEve2H6BqtqeeQMOap+sJDxc1FCv3Q6puXbQBN0krcRpDXEmVS2d+MxyFLUrhwsFIdSyOD5bfjsQdGtnOppsry6hTOQzGyfDf54WWlf7r9xXndzbiNzyu4ZB1Mv03r/Wx+P1coan1QDDbOXxCh9pJKpg1DanEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024031; c=relaxed/simple;
	bh=flLZILgRxV6MOvXyOHSJVnQ0K4KrHdK/sSdeDPvGUCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pBCVnHHVbedgiVrTOstK06isyWRuLLVdgNDBVafQBK5ik52+KSzw5dNEy774YS3dQYQrA6//QLMR+DOjZ0K9x2o9pg9s83ye6e6ymoq2ThzpR46aE1vJB7nGvHsitPuNL5VmB+bqDuIwzZTXHu7fNz5mW9k6XOQtaE2OtpgTQQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2MVGNst; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2MVGNst"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso1752177b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790024030; x=1790628830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ji7VlLhSAfjl/1tXHHTuDHH3apn48szfrKbyZ5VnSZQ=;
        b=r2MVGNstgVKsRVTHbu8WdjjFp3uQhG+gKGgr/zu2FGAHBcprwlTMeasXVW1LhsMS2L
         3X1/lwdeLXvvd7kXRfXRMtgzsHOIKO3HYTtL+EfWGuKzEFt4VxkaJ7itxxOYAAuS4wFT
         Et860yUwcJ6IPKnawKALYfo94QJBH7d44hf1DAsSruX7LCBQlBJ9Ml+81ErDNUtj5SRm
         Lc820JJ1pcFbhFyxs5VwoumAmIp+qqZi3sx9lymf1kxKXGb1RcIA6Y+Y2ps9EYSyenmo
         jb6pzIhgaKnqb8F5SpTyNYEx2uAd0uXdAe7atGnmfXoTj8pTv8anmzyLIUNkUpEyWipL
         +dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024030; x=1790628830;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ji7VlLhSAfjl/1tXHHTuDHH3apn48szfrKbyZ5VnSZQ=;
        b=J+gv0wBFCX87ObQNLvYKBQyfspC2Zm2d45QxcTne5lWzLGKFBLcXhoHZi3jt3SqdBf
         qyuJcZn4QB24tGNbCc42w2iog4lNdAiN+AFLl+uKw5afiYD/Q6usV2IEcZhe+mBwwnJQ
         SSTbk5EdUhS5utHKdy3iDml3M39Uk80Nh1oyO5nX3A7N4kLfre3ya2+5kIqw1XuxBv0E
         cT8p6bJ0+3vcYXd0kcSvTiHE0SyTe9iNew1vMfvrkFkCHiduguiDO7lyZ8ANkHqSitKU
         EyEB/Dzx+nXjiefpQdvYPo2dALL12KMpddJEhBmGfXpJAg1WLkHPerz3GXUY0dCzfNM4
         SOdA==
X-Forwarded-Encrypted: i=1; AKwUvBzj2w9pEea9LCCRHSennVfvhQcqBjvC/lelBVdp2WeFUKSgNRm9F/tX5bCRIQOgAnIhaBwVaon6GpOPHg0=@vger.kernel.org
X-Gm-Message-State: AFuF++nRTVlNEx+5QcDuDXpEz24C6Esp9LH7sTT4KXFOFWGDzrDFsMy+
	/cDb+FHmBGPQ8op4ve8g8sbGkP4Hqhz9Z6JoHpM0k4RwVXiTC73k9IMY
X-Gm-Gg: AYBFou3hWdbKay8r9BgNW15jLZ3NsXpoa/t8+/glKVBJ2hZcychSAvYbOyaBQEvcx+f
	+qrXuW617fOci0czND2kEV1vT/U0+TI/YqC9FK3E6YJvOUU1ns6h08AMZ3BHFfz2prkkmKqOq6A
	6xA1vLFLn7iGQ11OaUlfW5UMLlLB5Ws0yCQgrcH8cFrSlaGDy2khTd5dsBmNX5kN849vanaUyvx
	ArttmcqMb+MLPgZFR2YC8F/rQeP1zyKLIqch1GCwI2xJoAhoxgSKn260pyZvPFSH1uQjULYh/uj
	nA90GH0ViQeM7fXuan2VWe3IWLFEaJor45Xpf4nc0USHoo5Da9nbqXmE34ciLNFPpfbRpUWi2FJ
	E5AjavaPD4T2Ux+uwe7hapLTTIz9TyZ9dEbwFPvcDfsRgFfmKCMl2aXS6skZoFl5FzNiiSFRv3f
	HhL+g4LigkSWmDIIGJrHev4cdps276jnVMeXZmlUvMojqUOfMGTAMYC8rj+syYjQNy
X-Received: by 2002:a05:6a20:a123:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3dd8c52ec1fmr17760091637.36.1790024029652;
        Mon, 21 Sep 2026 13:53:49 -0700 (PDT)
Received: from dev ([163.43.103.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aeea64asm3948747a12.27.2026.09.21.13.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:53:48 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
	Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] seg6: keep room for the mac header when growing the headroom
Date: Tue, 22 Sep 2026 05:53:38 +0900
Message-ID: <20260922055338.510267-1-yuya.kusakabe@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <178994173434.2160803.11042494148021854491@kernel.org>
References: <20260917-seg6-maclen-headroom-v1-1-02ccec50f096@gmail.com> <178994173434.2160803.11042494148021854491@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Sun, 20 Sep 2026 22:02:14 +0000 netdev-bot+sashiko@kernel.org wrote:
> Should the same change also cover net/ipv6/rpl_iptunnel.c and
> net/ipv6/ioam6_iptunnel.c?  Those two files were converted to
> dst_dev_overhead() by the same series, and they still have the pattern this
> commit message describes.

Yes.  v2 covered both, and v3 moves the clamp into dst_dev_overhead()
itself so that every caller gets it:

  https://lore.kernel.org/r/20260922-seg6-maclen-headroom-v3-1-7b2f982ef79d@gmail.com
