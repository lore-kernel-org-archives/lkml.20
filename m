Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202958;
	b=fbiX+xNjT07l5L3xryw9YLPCHqrDfP0u9s/m1aNecdOz7celBD+hXeR1UY8aMRFuAGKG
	 UTw+FYdhzzfX1GYhlrpaUR4JigwCi9MeA2YYrbRdjbcmf5rfd3Ln+95ISbPHt4nAyQkZ6
	 hOBGn2ci/I+sy3to8j2JgqX/7qaT+KlmIX3a7ZX2OtaqCFVFCZ07L2mr6WecJUcqwbYtk
	 hc/AuCNWEa0f3s7pcjLIBlw+Kc8p9oEAP0WK4iQD5aO/HnLdWVzJsKXGiVL+P35RhCOyR
	 6HmbrPGCjLVSAVELxWrHlLl29HovR9tRpixyJlDzlNH620Nodk0KCk6w3Aej5GyEXNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=csOhYfXx1cygq0Nzm1hOlq8/R+R8/dV+gmLXMkdCo4A=;
	b=L2KGTJottaas7nIZtc5NCZ08SPO1LbfNOCAhil9lwRqjRxzPyquFUNoqC/oINBEmuvxX
	 kK53VQOZtWIYZKMyVcIp8OCZ35z7HAw3giwsEYwkdrk2BxQJqH7jKYdzZhxZIAE6+Fzk4
	 uS1rNXdbtno9rMMZGfAwv1peVmv3ZAKcAGsZ6mQOStQEEuL9bNKKDjL1SSjZOiv0bfpNM
	 zejooxNm2AMIlSgxaODT2AcweIqe/cFB31opGoO7Q91v4pJe3wIkHqniAFEP5z2ajAkIS
	 JRwZ5HheLSpHp5DhwfIfz3mFJFM5DpnOm/m597wnl7+TDc3Fg/w73gtShi3wJvHwlLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="halrdo3/";
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1233606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1233606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=halrdo3/
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so3827525ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202957; x=1793807757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=csOhYfXx1cygq0Nzm1hOlq8/R+R8/dV+gmLXMkdCo4A=;
        b=halrdo3/n/6UlHBrM3qN3fciZKUoKF3rXjRzZCpuQz0IgnC0ke3WUITCU3zLXQD0k6
         VcWV/SvMk3WSY3GARWVABDTTh8UENPJ87jPojKjvHfN2JnCdDY8AK1XDZU5tYc+bn1/1
         U4xCZMBmxL2ZnTIlnr6S8zOZ24GXcuMR9SVnLr2EdKRUce/KKzZKmsbT78R508Xgmnup
         fQYTiiTGpkYaP7dlEv/BGg5+mD/Yv3/t8b21SEvfXwx3UqaO2bucwt7qA/l2hVDXILxp
         E03WprrGmeSxfCE7bHzrf5XcS4mzY3X5qew1mW2HBmp49Bl90wJ/RH0k3owYEUODLskc
         LpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202957; x=1793807757;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=csOhYfXx1cygq0Nzm1hOlq8/R+R8/dV+gmLXMkdCo4A=;
        b=H+CQaPYF6DZSspkVxuHWePED3PwxfD65pWlzPHWKrrkX8Amdvf/07IOtvVriLifAiL
         vyHe5WZ1shnvBC5g7sjpOxvgczhcuzpNyqHaqFSKUJIb20mrBF481XnlQKpMhZiGz+9g
         baN6DYFReAalEF+pmY+GHFqNj8dGIIC5284HJTSuQ43i8viSckmeI4bplRNQml8V6Sxh
         XesL04uikUPd1buAQpif+TmrW/jAhwh/sopx4FABUv097ZxX/ghGVylwjm0JTNg3HnvP
         pu5g5qt4Wg1Nh57hvJeDXinWPPCMmEYIREp1Hg9AaGe+GpU/PRKmwhceLtdlGWnipfJv
         Z55g==
X-Forwarded-Encrypted: i=1; AKwUvBx7MYtIMSmTvtWP2nTDLdFl4xEYOxV1MEIqQH0Nmu41z85FpzvFvnbxsz0xwoz9PvLZ2aN/T9O81ZAaoTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOQS7Ar2sqbB3sQZo+oUxbtFvaBFoe14kp4bfLYOOdueX3zvTa
	S2sA3T0FaJnscPCYmPQDTu2D1VQ4u2U9E1ZnmSGydiATi356j5Ki/C7H
X-Gm-Gg: AYBFou0XyZE32FDn67AEIVo6wPASaZ/Z8nfb0MDGSFm7l71fANW+W9u+sjVJW2xxKgr
	VqyTXMP6HcdRFryDglfxLMS7oB0+G74LM5nZpx7wInwOAHcPiyxWt4u+sYtqt+iCT7D5tyS3mkX
	SJlJGjaItCGcqpKwNgGFZTuUC3LBZsoeQls2Jal7fHNI2PC+LR5thjfqyidQyxB6dolcGxZM6bV
	1q6+hUSQNGfJ4bKLq2LW1HhEutZvlISZWtCp4hKD2AO14fI437xEk/AgWzpBGNuv8Ovl0WLuF8P
	5i83yvfvgnHG0efy8dX5PjbsM3bM1JjAZtXS4UOzYgeGF6kNrr5C2eANeQ/Wpx2qRmh7+Vf/cFt
	BoQ5JpmsDZBaLWFQE9cTkVUVBxG77tn3HTUF9lM/yQufut784ND1XgzBotHgs9/nRerwde1Wiyq
	eGoo0iOAjQqNZkT6EDEZUKmmyVEqK1RJm3pkwYZp1d+gGB+0Fiy6Xy9yFblyXarfxPznG0LXc0X
	5Qg3qVJ3l0Gi1+ri76akGrQsQFsGKFLE0cHTCt4I6fguUkVQsWWb+RK1bwzPV0SVaSHZdj6Cf/V
	OrLpKiPqF8iuuDrOzgXA3CIuQSRG0JWgg8UcmT719W3LXUSEnC042TlK22upr+TzFmsICjT1FA=
	=
X-Received: by 2002:a17:903:b06:b0:2e9:4175:307a with SMTP id d9443c01a7336-2eb003b2d19mr26567435ad.22.1793202956855;
        Wed, 28 Oct 2026 08:55:56 -0700 (PDT)
Received: from 192.168.1.7 ([2409:8a1e:2330:4ef0:1490:f0fa:6df7:f234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b77e2csm23700275ad.19.2026.10.28.08.55.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 08:55:55 -0700 (PDT)
From: Rongzheng Wang <testwrzwrz@gmail.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] selftests/bpf: cover AF_XDP multi-buffer TX software checksum
Date: Wed, 28 Oct 2026 23:55:44 +0800
Message-Id: <20261028155544.12908-1-testwrzwrz@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <auH2yISa8xouAx/3@boxer>
References: <20261028025026.11401-1-testwrzwrz@gmail.com> <20261028025026.11401-3-testwrzwrz@gmail.com> <auH2yISa8xouAx/3@boxer>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maciej,

Thanks for the review and for the Reviewed-by on 1/2.

> nit: breaking RCT - I know it's test but Stan payed attention to keeping
> the order...

Fixed in v4. The declaration block now follows the width order used in this
file:

	struct xsk_tx_metadata *meta;
	struct xdp_desc *tx_desc;
	struct udphdr *udph;
	struct ethhdr *eth;
	struct iphdr *iph;
	u16 first_len;
	u16 pkt_len;
	u8 pkt[256];
	u32 offset;
	void *data;
	__u32 idx;
	u32 addr;
	int ret;
	u32 i;

> would it be worth exercising this up to MAX_SKB_FRAGS ?
> then instead of having this flat layout you would loop over the desc
> count.

Good point. I changed it to loop over the descriptor count and exercise 1,
2, and MAX_SKB_FRAGS + 1 (18) frames. The extra frame is the linear head;
the remaining MAX_SKB_FRAGS frames are skb frags, matching the copy-mode
limit documented in af_xdp.rst. The last descriptor takes the remaining
length so the fragments cannot overrun pkt_len. The updated selftest passes.

I'll send v4 as a new thread.

Thanks,
Rongzheng
