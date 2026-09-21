Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D143515C0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789964976; cv=none; b=UGwM2TMhzYTmBY24+zEUxHIUF+zuAFx6H6agZTj7z0F5jc4u+jjn2ENhSHawG8FcttxGV4hU0a3suxfWpJCiChgu5VCNSFKUKHAGOb1nTwcFWOR4QzzsP/kjOULjB6+yJr++4uqjNos1ly72sl0R30EwEBnZooa5egfwKeLfsoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789964976; c=relaxed/simple;
	bh=EZLcDrNg0p7u3xoE2NaBQYfiA5P6zOjGWIsa0ShloL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YA5MEjDu1aIKS0knoNaOeslSzDtxbcz6q3dRlrblsNBPH6aT7QoN/DwHsYhEobBx9mSRpb/rtdJcafPGB0yzOddFTn4QhLsI0bKJZt7To/sdKIMW1o0CsxWmBB/PhMQulDi/lgQ70XP+l+rD1ltYN3UbPQXw8Tb5YFakQCIHX0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com; spf=pass smtp.mailfrom=smartx.com; dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b=ag0UyYwu; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20251104.gappssmtp.com header.i=@smartx-com.20251104.gappssmtp.com header.b="ag0UyYwu"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so1188495a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 21:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20251104.gappssmtp.com; s=20251104; t=1789964972; x=1790569772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+ARZ05U0Ry/4bPhSuYtgrWnaz/OcQpWLrFkKl/prSk=;
        b=ag0UyYwuzMXRWRrydL2p3etfZ4L4o86Mg19du3tKsa8Ujp7FceO7CVxALCsEJanTM5
         p2jXA93qJmD+qmCxeX+7vEtAFlobm2qGoXkAAT+nTXVoZyHzPXArbDFWYIYWqCfciRpn
         nkJWZ1PzCW3RZ+BER5B6Ql55pUXyDAwLKSJv4c4IPIJv8Exy9KiRERDvftn9a7uwrZx+
         HzddLks6gLFo1xFm0BsJ1I3lSITrHDnKbCAhpr0KJSnhC8W1eubWcEg9Z5XlnrWFxOR6
         jakSn3ab3yD5MPRfTf17eFHVnJGSiFKSo5Xrsy6YgtWAqwymV5/xl6dkgdugIEmSPOEh
         LUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789964972; x=1790569772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+ARZ05U0Ry/4bPhSuYtgrWnaz/OcQpWLrFkKl/prSk=;
        b=jB73hphy5UdI2+udZlhVnxixX3GHIfuFix5T8XBj1+4Q6Wbxz/rczNCKswzIs4w1os
         mvOB0rOrmcvn8BV1OwOvrv/2bOlRgBqu9Zn+iQaHCsO73GXdCUfUh2NY+SHTIUKc1LNc
         kB4YMRsH0CgfXum9rfVCLvwFf7eAmt4AhZpdrfx16dG8BaplAOZh0u7wnyk5mZOXYpvF
         ySmm96Ns2nP0E4HZTr+UEzZoUQ8oHSDhiWk4uWs8+9QUzBXvW/cYECl/7RuQ7ySDnHNT
         QVMpGbIWjDQd/pO3knsXU3uI3wIoDwznd0TWFdjoWPwn0z79Ep+drIteBmv0wtRem/Ma
         02FQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRCMbdXJxXGS7HmzbfjDvci1z+curczDkz2hzSfklpNRAcfu/4TeUEVjQ1j89ysTJlF9J1J+3SThZswvw=@vger.kernel.org
X-Gm-Message-State: AFuF++nT4bSF+NpBQi7cpBvGJ+7cgVmoT0XxuO1P2gjzRrNv1xrOWjRF
	56S5/j9M2KRTsZTOxuKF+feZdM6hezHt19nZJTwiHKbWdQ4JMP18hzEuqxO/mgD28RsMD2SrQsx
	JW+oaAinA3/KGoL+OFY0TELVJq302FZaCZCoJtE+a87dW7e8Iag5YaIWa+s4=
X-Gm-Gg: AYBFou1INYDxOXq9Wdcxs6VGlA6Q9AsBtOI/IK6l/2bSIKGSnHAAeQjW7rRIqEBeP3n
	Iof4ZdvqKjQDEPpbS5sLFcNB8M4zcr74xGTnE2e/BJB0lLyl6R/ySHZ2v1m6lCOM5Brl1Q/sv1Q
	aJAJ83f0I2hFrVb3UQGlKTYcqAkTX6Tk9cKF0EjIebKpr5rggX3L4p3CVd9Sckp9GSvediE+PhB
	PfbdtfdB+y4uBtD0e9Nfsy+77y56zoIG6nl+A9/noVth4VbM/iyu/jFzMnYreK36rrcCGuw4TDQ
	Yn/SyIAZrKYTyBBd+tYfMKSsxxhm9Qb0ytte2aj1tfNGmT9N5bSRCo4RVIAlkNh7xXpIG+/SK1C
	jwvwNLREPPzwBFTYFtT3dxiGw3gTXUnTfkiRkJYXhHb2eK7RKQNFiHlKQIaQRlsCjHlznbqgkyR
	mND11nC4H2Cq3rGI4w8kE5amVNda9KquZCHBvJGaPO1FAzqld82Fwg+yxzpSW6Rb0ZM5zmUa8iu
	buLN8sIOFU=
X-Received: by 2002:a17:90b:4d0d:b0:39e:6c6a:208c with SMTP id 98e67ed59e1d1-39e6c6a31edmr8745588a91.45.1789964971912;
        Sun, 20 Sep 2026 21:29:31 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm25579483c88.5.2026.09.20.21.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 21:29:31 -0700 (PDT)
From: Wang Zhan <wang.zhan@smartx.com>
To: netdev@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>
Cc: Wang Zhan <wang.zhan@smartx.com>,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	kuniyu@google.com,
	kees@kernel.org,
	richardbgobert@gmail.com,
	alice.kernel@fastmail.im,
	gal@nvidia.com,
	jibin.zhang@mediatek.com,
	luoxuanqiang@kylinos.cn,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: Re: [PATCH net v3 1/1] net: gso: limit recursive IP-in-IP segmentation
Date: Mon, 21 Sep 2026 12:29:07 +0800
Message-ID: <20260921042907.3658794-1-wang.zhan@smartx.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <43510074c063f57e5738ecc55057e7fbbcdb1fbc.1789802623.git.zihanx@nebusec.ai>
References: <cover.1789802623.git.zihanx@nebusec.ai> <43510074c063f57e5738ecc55057e7fbbcdb1fbc.1789802623.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 19 Sep 2026 11:14:40 +0000 Zihan Xi wrote:
> @@ -19,10 +19,39 @@  struct skb_gso_cb {
>  	int	encap_level;
>  	__wsum	csum;
>  	__u16	csum_start;
> +	/* Bytes charged to the current GSO callback chain. */
> +	u16	gso_header_len;
>  };

Hi, I think skb_gso_cb->mac_offset already has enough information to tell
whether the budget is exceeded, so adding a field for it is unnecessary.
